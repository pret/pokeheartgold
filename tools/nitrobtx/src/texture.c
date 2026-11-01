/*
 * Copyright (c) 2026 Gudf
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, version 3.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */

#include "texture.h"

#include <limits.h>
#include <png.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "color.h"
#include "common.h"
#include "errors.h"
#include "ns/chunks/tex.h"
#include "palette.h"
#include "vec.h"

#define MIN_PAL_ALIGNMENT 8

static uint32_t CalcBitDepth(uint32_t numColors);
static enum TextureFormat DetermineTexFmt(int minBitDepth, int colorType, bool translucent);
static bool PNGBitDepthMatchesFmt(int pngBitDepth, enum TextureFormat format);
static int AppendToPNG(const struct Texture *texture, const struct Palette *palette, png_structp png_ptr, png_infop info_ptr);
static int UnpackTo8BPPWithOffset(const struct Texture *in, struct Texture *out, unsigned int offset);
static uint8_t GetRowFillValue(png_bytep pngRow, int width, int bitDepth);
static int GetPNGBitdepthForTexFmt(enum TextureFormat format);
static int GetDestPNGColorTypeForTexFmt(enum TextureFormat format);
static bool IsPNGColorTypeValidForFmt(enum TextureFormat format, int colorType);
static const unsigned int NumDigits(unsigned int val);
static int PNGRectToTexture(png_bytepp pngRows, int startRow, int bitDepth, int width, int height, enum TextureFormat format, bool transparent, struct Texture *tex);
static int ReadResNameLine(FILE *fp, struct ResourceName *resName);
static void PackTo2BPP(png_structp png_ptr, png_row_infop row_info, png_bytep data);
static void PackTo4BPP(png_structp png_ptr, png_row_infop row_info, png_bytep data);
static void ReduceColors8BPP(png_structp png_ptr, png_row_infop row_info, png_bytep data);

int TexturesVec_ToSpritesheetPNG(const struct TexturesVec *textures, const struct Palette *palette, const char *filepath, bool combinedPalette)
{
    if (textures->n == 0) {
        return 0;
    }

    enum TextureFormat format = VecGet(*textures, 0).format;
    int width = VecGet(*textures, 0).width;
    int frameHeight = VecGet(*textures, 0).height;
    int transparent = VecGet(*textures, 0).transparent;

    for (int i = 1; i < textures->n; i++) {
        if (VecGet(*textures, i).format != format
            || VecGet(*textures, i).width != width
            || VecGet(*textures, i).height != frameHeight
            || VecGet(*textures, i).transparent != transparent) {
            fprintf(stderr, "Input NSBTX '%s' has textures with differing properties and can't be turned into a spritesheet!\n", filepath);
            return ERR_CODE_INPUT_INVALID;
        }
    }

    FILE *fp;
    png_structp png_ptr;
    png_infop info_ptr;

    enum ErrorCode res;
    if ((res = InitializeWritePNG(filepath, &fp, &png_ptr, &info_ptr)) != ERR_CODE_OK) {
        return res;
    }

    if (setjmp(png_jmpbuf(png_ptr))) {
        png_destroy_write_struct(&png_ptr, &info_ptr);
        fclose(fp);
        return ERR_CODE_LIBPNG_ERROR;
    }

    int pngColorType = GetDestPNGColorTypeForTexFmt(format);
    if (pngColorType == PNG_COLOR_TYPE_PALETTE && palette == NULL) {
        pngColorType = PNG_COLOR_TYPE_GRAY;
    }

    struct TexturesVec *newTextures = NULL;
    if (combinedPalette && pngColorType == PNG_COLOR_TYPE_PALETTE) {
        newTextures = malloc(sizeof(struct TexturesVec));
        VecInit(*newTextures, textures->n);
        for (int i = 0; i < textures->n; i++) {
            VecAppend(*newTextures, (struct Texture) { 0 });
            UnpackTo8BPPWithOffset(&VecGet(*textures, i), &VecGet(*newTextures, i), i * palette->numColors / textures->n);
        }
        format = TEX_FORMAT_8BPP_PALETTED;
        textures = newTextures;
    }

    png_set_IHDR(png_ptr, info_ptr, width, frameHeight * textures->n, GetPNGBitdepthForTexFmt(format), pngColorType, PNG_INTERLACE_NONE, PNG_COMPRESSION_TYPE_DEFAULT, PNG_FILTER_TYPE_DEFAULT);

    if (GetPNGBitdepthForTexFmt(format) < 8) {
        png_set_packswap(png_ptr);
    }

    void *paletteDataPtr = NULL;
    if (pngColorType == PNG_COLOR_TYPE_PALETTE) {
        int maxPalSize = 1 << GetPNGBitdepthForTexFmt(format);
        paletteDataPtr = Palette_WritePLTE(palette, maxPalSize, png_ptr, info_ptr);
        if (transparent) {
            png_byte trans = 0;
            png_set_tRNS(png_ptr, info_ptr, &trans, 1, NULL);
        }
    }

    png_write_info(png_ptr, info_ptr);
    free(paletteDataPtr);

    VecForEach (tex, *textures) {
        if (AppendToPNG(tex, palette, png_ptr, info_ptr) != ERR_CODE_OK) {
            res = ERR_CODE_INPUT_INVALID;
        }
    }

    png_write_end(png_ptr, info_ptr);

    png_destroy_write_struct(&png_ptr, &info_ptr);
    fclose(fp);

    if (newTextures) {
        VecForEach (tex, *newTextures) {
            Texture_Free(tex);
        }
        VecFree(*newTextures);
        free(newTextures);
    }

    return res;
}

int Texture_WritePNG(const struct Texture *texture, const struct Palette *palette, const char *filepath)
{
    if (texture->format == TEX_FORMAT_4X4_COMPRESSED) {
        return ERR_CODE_UNSUPPORTED_FORMAT;
    }

    FILE *fp;
    png_structp png_ptr;
    png_infop info_ptr;

    enum ErrorCode res;
    if ((res = InitializeWritePNG(filepath, &fp, &png_ptr, &info_ptr)) != ERR_CODE_OK) {
        return res;
    }

    if (setjmp(png_jmpbuf(png_ptr))) {
        png_destroy_write_struct(&png_ptr, &info_ptr);
        fclose(fp);
        return ERR_CODE_LIBPNG_ERROR;
    }

    int pngColorType = GetDestPNGColorTypeForTexFmt(texture->format);
    if (pngColorType == PNG_COLOR_TYPE_PALETTE && palette == NULL) {
        pngColorType = PNG_COLOR_TYPE_GRAY;
    }

    png_set_IHDR(png_ptr, info_ptr, texture->width, texture->height, GetPNGBitdepthForTexFmt(texture->format), pngColorType, PNG_INTERLACE_NONE, PNG_COMPRESSION_TYPE_DEFAULT, PNG_FILTER_TYPE_DEFAULT);

    if (GetPNGBitdepthForTexFmt(texture->format) < 8) {
        png_set_packswap(png_ptr);
    }

    void *paletteDataPtr = NULL;
    if (pngColorType == PNG_COLOR_TYPE_PALETTE) {
        int maxPalSize = 1 << GetPNGBitdepthForTexFmt(texture->format);
        paletteDataPtr = Palette_WritePLTE(palette, maxPalSize, png_ptr, info_ptr);
        if (texture->transparent) {
            png_byte trans = 0;
            png_set_tRNS(png_ptr, info_ptr, &trans, 1, NULL);
        }
    }

    png_write_info(png_ptr, info_ptr);
    free(paletteDataPtr);

    res = AppendToPNG(texture, palette, png_ptr, info_ptr);

    png_write_end(png_ptr, info_ptr);

    png_destroy_write_struct(&png_ptr, &info_ptr);
    fclose(fp);

    return res;
}

static int AppendToPNG(const struct Texture *texture, const struct Palette *palette, png_structp png_ptr, png_infop info_ptr)
{
    switch (texture->format) {
    case TEX_FORMAT_2BPP_PALETTED:
    case TEX_FORMAT_4BPP_PALETTED:
    case TEX_FORMAT_8BPP_PALETTED: {
        int texRowSpan = 8 << LengthToTexSize(texture->width);
        for (int row = 0; row < texture->height; row++) {
            png_write_row(png_ptr, &((png_const_bytep)texture->texelData.rawData)[row * texRowSpan * GetPNGBitdepthForTexFmt(texture->format) / 8]);
        }
    } break;
    case TEX_FORMAT_DIRECT_COLOR: {
        struct RGBA8Color *pngRow = calloc(texture->width, sizeof(struct RGBA8Color));
        for (int row = 0; row < texture->height; row++) {
            for (int texel = 0; texel < texture->width; texel++) {
                pngRow[texel] = NDSColorToRGBA8(texture->texelData.texels[texel + row * texture->width]);
            }
            png_write_row(png_ptr, (void *)pngRow);
        }
        free(pngRow);
        break;
    }
    case TEX_FORMAT_A3I5_TRANS: {
        struct RGBA8Color *pngRow = calloc(texture->width, sizeof(struct RGBA8Color));
        for (int row = 0; row < texture->height; row++) {
            for (int texel = 0; texel < texture->width; texel++) {
                int idx = texel + row * texture->width;
                if (palette != NULL) {
                    pngRow[texel] = NDSColorToRGBA8(palette->data[((uint8_t *)texture->texelData.rawData)[idx] % 32]);
                    pngRow[texel].a = ConvertBitDepth(((uint8_t *)texture->texelData.rawData)[idx] >> 5, 3, 8);
                } else {
                    pngRow[texel] = (struct RGBA8Color) {
                        .r = ConvertBitDepth(((uint8_t *)texture->texelData.rawData)[idx] % 32, 5, 8),
                        .g = ConvertBitDepth(((uint8_t *)texture->texelData.rawData)[idx] % 32, 5, 8),
                        .b = ConvertBitDepth(((uint8_t *)texture->texelData.rawData)[idx] % 32, 5, 8),
                        .a = ConvertBitDepth(((uint8_t *)texture->texelData.rawData)[idx] >> 5, 3, 8),
                    };
                }
            }
            png_write_row(png_ptr, (void *)pngRow);
        }
        free(pngRow);
        break;
    }
    case TEX_FORMAT_A5I3_TRANS: {
        struct RGBA8Color *pngRow = calloc(texture->width, sizeof(struct RGBA8Color));
        for (int row = 0; row < texture->height; row++) {
            for (int texel = 0; texel < texture->width; texel++) {
                int idx = texel + row * texture->width;
                if (palette != NULL) {
                    pngRow[texel] = NDSColorToRGBA8(palette->data[((uint8_t *)texture->texelData.rawData)[idx] % 8]);
                    pngRow[texel].a = ConvertBitDepth(((uint8_t *)texture->texelData.rawData)[idx] >> 3, 5, 8);
                } else {
                    pngRow[texel] = (struct RGBA8Color) {
                        .r = ConvertBitDepth(((uint8_t *)texture->texelData.rawData)[idx] % 8, 3, 8),
                        .g = ConvertBitDepth(((uint8_t *)texture->texelData.rawData)[idx] % 8, 3, 8),
                        .b = ConvertBitDepth(((uint8_t *)texture->texelData.rawData)[idx] % 8, 3, 8),
                        .a = ConvertBitDepth(((uint8_t *)texture->texelData.rawData)[idx] >> 3, 5, 8),
                    };
                }
            }
            png_write_row(png_ptr, (void *)pngRow);
        }
        free(pngRow);
        break;
    }
    case TEX_FORMAT_4X4_COMPRESSED:
        fprintf(stderr, "Tried to write texture with unsupported NDS format %u to PNG!\n", texture->format);
        return ERR_CODE_UNSUPPORTED_FORMAT;
    case TEX_FORMAT_AUTO:
    case TEX_FORMAT_INVALID:
    default:
        fprintf(stderr, "Tried to write texture with invalid NDS format %u to PNG!\n", texture->format);
        return ERR_CODE_INPUT_INVALID;
    }
    return ERR_CODE_OK;
}

int TexturesVec_ExtendFromSpritesheetPNG(struct TexturesVec *textures, const struct TextureInput *texture)
{
    enum ErrorCode res = ERR_CODE_OK;

    enum TextureFormat format = texture->format;

    switch (format) {
    case TEX_FORMAT_2BPP_PALETTED:
    case TEX_FORMAT_4BPP_PALETTED:
    case TEX_FORMAT_8BPP_PALETTED:
    case TEX_FORMAT_DIRECT_COLOR:
    case TEX_FORMAT_AUTO:
        break;
    default:
        return ERR_CODE_UNSUPPORTED_FORMAT;
    }

    int frameHeight = texture->frameHeight;
    int numFrames = texture->numFrames;
    if (frameHeight == -1 && numFrames == -1) {
        fprintf(stderr, "Spritesheet texture %s was given no frame height or number of frames!\n", texture->path);
        return ERR_CODE_INPUT_INVALID;
    }

    FILE *fp = NULL;
    png_structp png_ptr = NULL;
    png_infop info_ptr = NULL;

    if ((res = InitializeReadPNG(texture->path, &fp, &png_ptr, &info_ptr)) != ERR_CODE_OK) {
        return res;
    }

    FILE *namesFile = NULL;
    png_bytep pngBuffer = NULL;
    png_bytepp rowPointers = NULL;

    if (setjmp(png_jmpbuf(png_ptr))) {
        res = ERR_CODE_LIBPNG_ERROR;
        goto spritesheet_read_cleanup;
    }

    png_read_info(png_ptr, info_ptr);

    png_uint_32 width, height;
    int pngBitDepth, pngColorType;

    png_get_IHDR(png_ptr, info_ptr, &width, &height, &pngBitDepth, &pngColorType, NULL, NULL, NULL);

    int bitDepth = pngBitDepth;

    if (frameHeight == -1) {
        frameHeight = height / numFrames;
        if (height % numFrames != 0) {
            fprintf(stderr, "Spritesheet texture '%s' doesn't divide cleanly into %u frames!\n", texture->path, numFrames);
            res = ERR_CODE_INPUT_INVALID;
            goto spritesheet_read_cleanup;
        }
    }

    if (numFrames == -1) {
        numFrames = height / frameHeight;
        if (height % frameHeight != 0) {
            fprintf(stderr, "Spritesheet texture '%s' doesn't divide cleanly into frames of height %u!\n", texture->path, frameHeight);
            res = ERR_CODE_INPUT_INVALID;
            goto spritesheet_read_cleanup;
        }
    }

    png_colorp pal;
    int numColors;
    bool hasPLTE = png_get_PLTE(png_ptr, info_ptr, &pal, &numColors) != 0;
    if (texture->combinedPalette) {
        if (hasPLTE) {
            if (numColors % (numFrames * MIN_PAL_ALIGNMENT) != 0) {
                fprintf(stderr, "Palette from spritesheet '%s' doesn't divide cleanly into %u palettes whose sizes are a multiple of %u!\n", texture->path, numFrames, MIN_PAL_ALIGNMENT);
                res = ERR_CODE_INPUT_INVALID;
                goto spritesheet_read_cleanup;
            } else {
                numColors /= numFrames;
                bitDepth = CalcBitDepth(numColors);
            }
        } else {
            fprintf(stderr, "File '%s' has not palette but was used with the combined palette flag!\n", texture->path);
            res = ERR_CODE_INPUT_INVALID;
            goto spritesheet_read_cleanup;
        }
    }

    if (format == TEX_FORMAT_AUTO) {
        format = DetermineTexFmt(bitDepth, pngColorType, texture->transparencyInput != NULL);
        if (format == TEX_FORMAT_INVALID) {
            fprintf(stderr, "Couldn't automatically determine a NDS texture format for texture '%s'\n", texture->path);
            res = ERR_CODE_UNSUPPORTED_FORMAT;
            goto spritesheet_read_cleanup;
        }
    }

    if (!IsPNGColorTypeValidForFmt(format, pngColorType)) {
        fprintf(stderr, "File '%s' uses an unsupported color type for conversion to NDS texture format %u!\n", texture->path, format);
        res = ERR_CODE_INPUT_INVALID;
        goto spritesheet_read_cleanup;
    }

    if (bitDepth > GetPNGBitdepthForTexFmt(format) && !(hasPLTE && CalcBitDepth(numColors) <= GetPNGBitdepthForTexFmt(format))) {
        fprintf(stderr, "File '%s' has too many colors for conversion to NDS texture format %u!\n", texture->path, format);
        res = ERR_CODE_INPUT_INVALID;
        goto spritesheet_read_cleanup;
    }

    if (pngColorType == PNG_COLOR_TYPE_RGB) {
        png_set_add_alpha(png_ptr, 0xffff, PNG_FILLER_AFTER);
    }

    bool unpacked = false;
    if (pngColorType == PNG_COLOR_TYPE_PALETTE || pngColorType == PNG_COLOR_TYPE_GRAY) {
        png_set_packswap(png_ptr);

        if (texture->combinedPalette || !PNGBitDepthMatchesFmt(pngBitDepth, format)) {
            unpacked = true;
            png_set_packing(png_ptr);
            switch (format) {
            case TEX_FORMAT_2BPP_PALETTED:
                bitDepth = 2;
                png_set_user_transform_info(png_ptr, NULL, bitDepth, 1); // numColors has to be a multiple of 4 and PackTo2BPP already performs mod 4
                png_set_read_user_transform_fn(png_ptr, PackTo2BPP);
                break;
            case TEX_FORMAT_4BPP_PALETTED:
                bitDepth = 4;
                png_set_user_transform_info(png_ptr, &numColors, bitDepth, 1);
                png_set_read_user_transform_fn(png_ptr, PackTo4BPP);
                break;
            case TEX_FORMAT_8BPP_PALETTED:
                bitDepth = 8;
                png_set_user_transform_info(png_ptr, &numColors, bitDepth, 1);
                png_set_read_user_transform_fn(png_ptr, ReduceColors8BPP);
            default:
                break;
            }
        }
    }

    int basenameLength = RES_NAME_LENGTH;

    if (texture->namesFile == NULL) {
        if (numFrames > 1) {
            if (strlen(texture->name) + 1 + NumDigits(numFrames) > RES_NAME_LENGTH) {
                basenameLength = RES_NAME_LENGTH - 1 - NumDigits(numFrames);
                fprintf(stderr, "Warning: texture basename %s is too long to fit the texture number suffix! It will be truncated to %u characters: '%.*s'.\n", texture->name, basenameLength, basenameLength, texture->name);
            }
        } else {
            if (strlen(texture->name) > RES_NAME_LENGTH) {
                fprintf(stderr, "Warning: texture basename %s is too long! It will be truncated to %u characters: '%.*s'.\n", texture->name, basenameLength, basenameLength, texture->name);
            }
        }
    } else {
        namesFile = fopen(texture->namesFile, "r");
        if (namesFile == NULL) {
            fprintf(stderr, "Failed to open names file %s for reading!\n", texture->namesFile);
            res = ERR_CODE_FAILED_OPEN_INPUT;
            goto spritesheet_read_cleanup;
        }
    }

    png_set_interlace_handling(png_ptr);
    png_read_update_info(png_ptr, info_ptr);

    uint32_t pngRowBytes = png_get_rowbytes(png_ptr, info_ptr);
    if (unpacked) {
        pngRowBytes *= 8 / bitDepth;
    }

    pngBuffer = calloc(height, pngRowBytes);
    rowPointers = calloc(height, sizeof(*rowPointers));

    for (int row = 0; row < height; row++) {
        rowPointers[row] = pngBuffer + row * pngRowBytes;
    }

    png_read_image(png_ptr, rowPointers);

    bool texTrns = texture->transparent == TRANSPARENT_AUTO ? png_get_valid(png_ptr, info_ptr, PNG_INFO_tRNS) : texture->transparent;

    char nameBuf[RES_NAME_LENGTH + 1] = { 0 };
    for (int texIdx = 0; texIdx < numFrames; texIdx++) {
        VecAppend(*textures, (struct Texture) { 0 });
        struct Texture *tex = &VecLast(*textures);
        if (namesFile == NULL) {
            if (numFrames > 1) {
                snprintf(nameBuf, RES_NAME_LENGTH + 1, "%.*s.%u", basenameLength, texture->name, texIdx + 1);
            } else {
                snprintf(nameBuf, RES_NAME_LENGTH + 1, "%.*s", basenameLength, texture->name);
            }

            CopyToResName(&tex->name, nameBuf);
        } else {
            int nRead = ReadResNameLine(namesFile, &tex->name);
            if (nRead == 0) {
                fprintf(stderr, "Error: texture names file %s contains a blank line or has fewer lines than frames in texture spritesheet %s!\n", texture->namesFile, texture->path);
                res = ERR_CODE_INPUT_INVALID;
                goto spritesheet_read_cleanup;
            } else if (nRead > 16) {
                fprintf(stderr, "Warning: texture name from file %s too long, it has been truncated to %u characters: %.*s!\n", texture->namesFile, RES_NAME_LENGTH, RES_NAME_LENGTH, tex->name.asChars);
            }
        }

        PNGRectToTexture(rowPointers, texIdx * frameHeight, bitDepth, width, frameHeight, format, texTrns, tex);
    }

spritesheet_read_cleanup:
    png_destroy_read_struct(&png_ptr, &info_ptr, NULL);
    fclose(fp);
    if (namesFile) {
        fclose(namesFile);
    }
    free(pngBuffer);
    free(rowPointers);

    return res;
}

int TexturesVec_AppendFromPNG(struct TexturesVec *textures, const struct TextureInput *texture)
{
    enum ErrorCode res = ERR_CODE_OK;

    enum TextureFormat format = texture->format;

    switch (format) {
    case TEX_FORMAT_2BPP_PALETTED:
    case TEX_FORMAT_4BPP_PALETTED:
    case TEX_FORMAT_8BPP_PALETTED:
    case TEX_FORMAT_DIRECT_COLOR:
    case TEX_FORMAT_AUTO:
        break;
    default:
        return ERR_CODE_UNSUPPORTED_FORMAT;
    }

    FILE *fp;
    png_structp png_ptr = NULL;
    png_infop info_ptr = NULL;

    if ((res = InitializeReadPNG(texture->path, &fp, &png_ptr, &info_ptr)) != ERR_CODE_OK) {
        return res;
    }

    if (setjmp(png_jmpbuf(png_ptr))) {
        png_destroy_read_struct(&png_ptr, &info_ptr, NULL);
        fclose(fp);
        return ERR_CODE_LIBPNG_ERROR;
    }

    png_read_info(png_ptr, info_ptr);

    png_uint_32 width, height;
    int bitDepth, colorType;

    png_get_IHDR(png_ptr, info_ptr, &width, &height, &bitDepth, &colorType, NULL, NULL, NULL);

    if (format == TEX_FORMAT_AUTO) {
        format = DetermineTexFmt(bitDepth, colorType, texture->transparencyInput != NULL);
        if (format == TEX_FORMAT_INVALID) {
            fprintf(stderr, "Couldn't automatically determine a NDS texture format for texture '%s'\n", texture->path);
            return ERR_CODE_UNSUPPORTED_FORMAT;
        }
    }

    if (!IsPNGColorTypeValidForFmt(format, colorType)) {
        png_destroy_read_struct(&png_ptr, &info_ptr, NULL);
        fclose(fp);
        fprintf(stderr, "File '%s' uses an unsupported color type for conversion to NDS texture format %u!\n", texture->path, format);
        return ERR_CODE_INPUT_INVALID;
    }

    png_colorp pal;
    int numColors;
    bool hasPLTE = png_get_PLTE(png_ptr, info_ptr, &pal, &numColors) != 0;
    if (bitDepth > GetPNGBitdepthForTexFmt(format) && !(hasPLTE && CalcBitDepth(numColors) <= GetPNGBitdepthForTexFmt(format))) {
        fprintf(stderr, "File '%s' has too many colors for conversion to NDS texture format %u!\n", texture->path, format);
        png_destroy_read_struct(&png_ptr, &info_ptr, NULL);
        fclose(fp);
        return ERR_CODE_INPUT_INVALID;
    }

    if (colorType == PNG_COLOR_TYPE_RGB) {
        png_set_add_alpha(png_ptr, 0xffff, PNG_FILLER_AFTER);
    }

    bool unpacked = false;
    if (colorType == PNG_COLOR_TYPE_PALETTE || colorType == PNG_COLOR_TYPE_GRAY) {
        png_set_packswap(png_ptr);

        if (!PNGBitDepthMatchesFmt(bitDepth, format)) {
            unpacked = true;
            png_set_packing(png_ptr);
            switch (format) {
                case TEX_FORMAT_2BPP_PALETTED:
                    bitDepth = 2;
                    png_set_user_transform_info(png_ptr, NULL, bitDepth, 1);
                    png_set_read_user_transform_fn(png_ptr, PackTo2BPP);
                    break;
                case TEX_FORMAT_4BPP_PALETTED:
                    bitDepth = 4;
                    png_set_user_transform_info(png_ptr, NULL, bitDepth, 1);
                    png_set_read_user_transform_fn(png_ptr, PackTo4BPP);
                    break;
                case TEX_FORMAT_8BPP_PALETTED:
                    bitDepth = 8;
                    png_set_user_transform_info(png_ptr, NULL, bitDepth, 1);
                    png_set_read_user_transform_fn(png_ptr, ReduceColors8BPP);
                default:
                    break;
            }
        }
    }

    int basenameLength = RES_NAME_LENGTH;
    char nameBuf[RES_NAME_LENGTH + 1];

    if (strlen(texture->name) > RES_NAME_LENGTH) {
        fprintf(stderr, "Warning: texture basename %s is too long! It will be truncated to %u characters: '%.*s'.\n", texture->name, basenameLength, basenameLength, texture->name);
    }

    png_set_interlace_handling(png_ptr);
    png_read_update_info(png_ptr, info_ptr);

    uint32_t pngRowBytes = png_get_rowbytes(png_ptr, info_ptr);
    if (unpacked) {
        pngRowBytes *= 8 / bitDepth;
    }

    png_bytep pngBuffer = calloc(height, pngRowBytes);
    png_bytepp rowPointers = calloc(height, sizeof(*rowPointers));

    for (int row = 0; row < height; row++) {
        rowPointers[row] = pngBuffer + row * pngRowBytes;
    }

    png_read_image(png_ptr, rowPointers);

    bool texTrns = texture->transparent == TRANSPARENT_AUTO ? png_get_valid(png_ptr, info_ptr, PNG_INFO_tRNS) : texture->transparent;

    VecAppend(*textures, (struct Texture) { 0 });
    struct Texture *tex = &VecLast(*textures);
    snprintf(nameBuf, RES_NAME_LENGTH + 1, "%.*s", basenameLength, texture->name);

    CopyToResName(&tex->name, nameBuf);

    res = PNGRectToTexture(rowPointers, 0, bitDepth, width, height, format, texTrns, tex);

    png_destroy_read_struct(&png_ptr, &info_ptr, NULL);
    fclose(fp);
    free(pngBuffer);
    free(rowPointers);

    return res;
}

static int PNGRectToTexture(png_bytepp pngRows, int startRow, int bitDepth, int width, int height, enum TextureFormat format, bool transparent, struct Texture *tex)
{
    tex->width = width;
    tex->height = height;
    tex->format = format;
    tex->transparent = transparent;

    int texDataWidth = (8 << LengthToTexSize(tex->width));
    int texDataHeight = (8 << LengthToTexSize(tex->height));
    int rowSize = tex->width * GetTexelSizeForTexFmt(tex->format) / 8;
    int rowSpan = texDataWidth * GetTexelSizeForTexFmt(tex->format) / 8;
    tex->dataByteCount = texDataHeight * rowSpan;
    tex->texelData.rawData = malloc(tex->dataByteCount);

    for (int row = 0; row < tex->height; row++) {
        png_bytep pngRow = pngRows[startRow + row];
        switch (tex->format) {
        case TEX_FORMAT_2BPP_PALETTED:
        case TEX_FORMAT_4BPP_PALETTED:
        case TEX_FORMAT_8BPP_PALETTED: {
            memcpy(tex->texelData.rawData + row * rowSpan, pngRow, rowSize);
            uint8_t fillVal = GetRowFillValue(pngRow, tex->width, bitDepth);
            memset(tex->texelData.rawData + row * rowSpan + rowSize, fillVal, rowSpan - rowSize);
            if (bitDepth == 2 && (tex->width % 4) != 0) {
                uint8_t mask = (uint8_t)(~0) << 2 * ((tex->width - 1) % 4);
                ((uint8_t *)tex->texelData.rawData)[row * rowSpan + rowSize] = (pngRow[(tex->width - 1) / 4] & ~mask) | (fillVal & mask);
            }
        } break;
        case TEX_FORMAT_DIRECT_COLOR: {
            for (int col = 0; col < tex->width; col++) {
                struct NDSColor color = RGBA8ToNDSColor(((struct RGBA8Color *)pngRow)[col]);
                tex->texelData.texels[row * texDataWidth + col] = color;
            }

            struct NDSColor fillColor = RGBA8ToNDSColor(((struct RGBA8Color *)pngRow)[tex->width - 1]);
            for (int col = tex->width; col < texDataWidth; col++) {
                tex->texelData.texels[row * texDataWidth + col] = fillColor;
            }
        } break;
        default:
            fprintf(stderr, "Tried to create texture with unsupported format %u!\n", format);
            return ERR_CODE_UNSUPPORTED_FORMAT;
        }
    }
    for (int row = tex->height; row < texDataHeight; row++) {
        memcpy(tex->texelData.rawData + row * rowSpan, tex->texelData.rawData + (tex->height - 1) * rowSpan, rowSpan);
    }

    return ERR_CODE_OK;
}

void Texture_Free(struct Texture *texture)
{
    if (texture->format == TEX_FORMAT_4X4_COMPRESSED) {
        free(texture->texelData.chunks);
        free(texture->texelData.chunkAttrs);
        texture->texelData.chunks = NULL;
        texture->texelData.chunkAttrs = NULL;
    } else {
        free(texture->texelData.rawData);
        texture->texelData.rawData = NULL;
    }
    texture->dataByteCount = 0;
}

static int UnpackTo8BPPWithOffset(const struct Texture *in, struct Texture *out, unsigned int offset)
{
    switch (in->format) {
    case TEX_FORMAT_2BPP_PALETTED:
    case TEX_FORMAT_4BPP_PALETTED:
    case TEX_FORMAT_8BPP_PALETTED:
        break;
    case TEX_FORMAT_A3I5_TRANS:
    case TEX_FORMAT_A5I3_TRANS:
    case TEX_FORMAT_4X4_COMPRESSED:
    case TEX_FORMAT_DIRECT_COLOR:
    default:
        return ERR_CODE_INPUT_INVALID;
    }

    out->format = TEX_FORMAT_8BPP_PALETTED;
    out->width = in->width;
    out->height = in->height;
    out->name = in->name;
    out->transparent = in->transparent;

    out->dataByteCount = out->width * out->height;
    out->texelData.rawData = malloc(out->dataByteCount);

    uint8_t *inData = in->texelData.rawData;
    uint8_t *outData = out->texelData.rawData;

    for (int inIdx = 0, outIdx = 0; inIdx < in->dataByteCount; inIdx++) {
        uint8_t inByte = inData[inIdx];
        uint8_t tmp;
        switch (in->format) {
        case TEX_FORMAT_2BPP_PALETTED:
            tmp = ((inByte & 0b00000011) >> 0);
            outData[outIdx++] = in->transparent && tmp == 0 ? 0 : tmp + offset;
            tmp = ((inByte & 0b00001100) >> 2);
            outData[outIdx++] = in->transparent && tmp == 0 ? 0 : tmp + offset;
            tmp = ((inByte & 0b00110000) >> 4);
            outData[outIdx++] = in->transparent && tmp == 0 ? 0 : tmp + offset;
            tmp = ((inByte & 0b11000000) >> 6);
            outData[outIdx++] = in->transparent && tmp == 0 ? 0 : tmp + offset;
            break;
        case TEX_FORMAT_4BPP_PALETTED:
            tmp = ((inByte & 0b00001111) >> 0);
            outData[outIdx++] = in->transparent && tmp == 0 ? 0 : tmp + offset;
            tmp = ((inByte & 0b11110000) >> 4);
            outData[outIdx++] = in->transparent && tmp == 0 ? 0 : tmp + offset;
            break;
        case TEX_FORMAT_8BPP_PALETTED:
            outData[outIdx++] = in->transparent && inByte == 0 ? 0 : inByte + offset;
            break;
        default:
            break;
        }
    }

    return ERR_CODE_OK;
}

static uint8_t GetRowFillValue(png_bytep pngRow, int width, int bitDepth)
{
    uint8_t fillVal;
    switch (bitDepth) {
    case 2:
        fillVal = pngRow[(width - 1) / 4] & 0b11 << 2 * ((width - 1) % 4);
        fillVal >>= 2 * ((width - 1) % 4);
        fillVal = fillVal << 6 | fillVal << 4 | fillVal << 2 | fillVal;
        break;
    case 4:
        fillVal = pngRow[(width - 1) / 2] & 0b1111 << 4 * ((width - 1) % 2);
        fillVal = fillVal << 4 | fillVal | fillVal >> 4;
        break;
    case 8:
        fillVal = pngRow[width - 1];
        break;
    default:
        __builtin_unreachable();
    }

    return fillVal;
}

static int GetPNGBitdepthForTexFmt(enum TextureFormat format)
{
    switch (format) {
    case TEX_FORMAT_2BPP_PALETTED:
        return 2;
    case TEX_FORMAT_4BPP_PALETTED:
        return 4;
    case TEX_FORMAT_8BPP_PALETTED:
        return 8;
    case TEX_FORMAT_A3I5_TRANS:
    case TEX_FORMAT_A5I3_TRANS:
    case TEX_FORMAT_4X4_COMPRESSED:
    case TEX_FORMAT_DIRECT_COLOR:
        return 8;
    case TEX_FORMAT_AUTO:
    case TEX_FORMAT_INVALID:
        break;
    }

    return 0;
}

static int GetDestPNGColorTypeForTexFmt(enum TextureFormat format)
{
    switch (format) {
    case TEX_FORMAT_2BPP_PALETTED:
    case TEX_FORMAT_4BPP_PALETTED:
    case TEX_FORMAT_8BPP_PALETTED:
        return PNG_COLOR_TYPE_PALETTE;
    case TEX_FORMAT_A3I5_TRANS:
    case TEX_FORMAT_A5I3_TRANS:
    case TEX_FORMAT_4X4_COMPRESSED:
    case TEX_FORMAT_DIRECT_COLOR:
        return PNG_COLOR_TYPE_RGBA;
    case TEX_FORMAT_AUTO:
    case TEX_FORMAT_INVALID:
        break;
    }

    return 0;
}

static bool IsPNGColorTypeValidForFmt(enum TextureFormat format, int colorType)
{
    switch (format) {
    case TEX_FORMAT_2BPP_PALETTED:
    case TEX_FORMAT_4BPP_PALETTED:
    case TEX_FORMAT_8BPP_PALETTED:
        return colorType == PNG_COLOR_TYPE_PALETTE || colorType == PNG_COLOR_TYPE_GRAY;
    case TEX_FORMAT_DIRECT_COLOR:
        return colorType == PNG_COLOR_TYPE_RGBA || colorType == PNG_COLOR_TYPE_RGB;
    case TEX_FORMAT_A3I5_TRANS:
    case TEX_FORMAT_A5I3_TRANS:
    case TEX_FORMAT_4X4_COMPRESSED:
    default:
        return false;
    }
}

int GetMinimumPaletteSize(const struct Texture *texture)
{
    int maxIdx = 0;
    int depth = GetPNGBitdepthForTexFmt(texture->format);

    switch (texture->format) {
    case TEX_FORMAT_2BPP_PALETTED:
    case TEX_FORMAT_4BPP_PALETTED:
    case TEX_FORMAT_8BPP_PALETTED:
        for (int i = 0; i < texture->dataByteCount; i++) {
            for (int j = 0; j < 8 / depth; j++) {
                int val = (((uint8_t *)texture->texelData.rawData)[i] >> (j * depth)) % (1 << depth);
                if (val > maxIdx) {
                    maxIdx = val;
                }
            }
        }
        return maxIdx + 1;
    case TEX_FORMAT_A3I5_TRANS:
        for (int i = 0; i < texture->dataByteCount; i++) {
            int val = (((uint8_t *)texture->texelData.rawData)[i]) % (1 << 5);
            if (val > maxIdx) {
                maxIdx = val;
            }
        }
        return maxIdx + 1;
    case TEX_FORMAT_A5I3_TRANS:
        for (int i = 0; i < texture->dataByteCount; i++) {
            int val = (((uint8_t *)texture->texelData.rawData)[i]) % (1 << 3);
            if (val > maxIdx) {
                maxIdx = val;
            }
        }
        return maxIdx + 1;
    default:
        return 0;
    }
}

static void PackTo2BPP(png_structp png_ptr, png_row_infop row_info, png_bytep data)
{
    uint8_t *source = data;
    uint8_t *dest = data;

    for (int rowIdx = 0; rowIdx < row_info->width / 4; rowIdx++) {
        uint8_t val = (*source++ & 0b11);
        val |= (*source++ & 0b11) << 2;
        val |= (*source++ & 0b11) << 4;
        val |= (*source++ & 0b11) << 6;
        *dest++ = val;
    }

    uint8_t val = 0;
    switch (row_info->width % 4) {
    case 1:
        *dest = *source & 0b11;
        break;
    case 2:
        val = (*source++ & 0b11);
        val |= (*source++ & 0b11) << 2;
        *dest = val;
        break;
    case 3:
        val = (*source++ & 0b11);
        val |= (*source++ & 0b11) << 2;
        val |= (*source++ & 0b11) << 4;
        *dest = val;
        break;
    }

    row_info->pixel_depth = 2;
}

static void PackTo4BPP(png_structp png_ptr, png_row_infop row_info, png_bytep data)
{
    uint8_t *source = data;
    uint8_t *dest = data;

    int *png_transform_user_ptr = png_get_user_transform_ptr(png_ptr);
    int numColorsPerFrame = 16;
    if (png_transform_user_ptr) {
        numColorsPerFrame = *png_transform_user_ptr;
    }

    for (int rowIdx = 0; rowIdx < row_info->width / 2; rowIdx++) {
        uint8_t val = ((*source++ % numColorsPerFrame) & 0b1111);
        val |= ((*source++ % numColorsPerFrame) & 0b1111) << 4;
        *dest++ = val;
    }

    if (row_info->width % 2) {
        *dest = (*source % numColorsPerFrame) & 0b1111;
    }

    row_info->pixel_depth = 4;
}

static void ReduceColors8BPP(png_structp png_ptr, png_row_infop row_info, png_bytep data)
{
    uint8_t *source = data;
    uint8_t *dest = data;

    int *png_transform_user_ptr = png_get_user_transform_ptr(png_ptr);
    int numColorsPerFrame = 256;
    if (png_transform_user_ptr) {
        numColorsPerFrame = *png_transform_user_ptr;
    }

    for (int rowIdx = 0; rowIdx < row_info->width; rowIdx++) {
        *dest++ = *source++ % numColorsPerFrame;
    }

    row_info->pixel_depth = 8;
}

static enum TextureFormat DetermineTexFmt(int minBitDepth, int colorType, bool translucent)
{
    if (colorType == PNG_COLOR_TYPE_PALETTE || colorType == PNG_COLOR_TYPE_GRAY) {
        if (!translucent) {
            if (minBitDepth <= 2) {
                return TEX_FORMAT_2BPP_PALETTED;
            }
            if (minBitDepth <= 4) {
                return TEX_FORMAT_4BPP_PALETTED;
            }
            if (minBitDepth <= 8) {
                return TEX_FORMAT_8BPP_PALETTED;
            }
        } else {
            if (minBitDepth <= 3) {
                return TEX_FORMAT_A5I3_TRANS;
            }
            if (minBitDepth <= 5) {
                return TEX_FORMAT_A3I5_TRANS;
            }
        }
    } else if (colorType == PNG_COLOR_TYPE_RGB || colorType == PNG_COLOR_TYPE_RGBA) {
        return TEX_FORMAT_DIRECT_COLOR;
    }

    return TEX_FORMAT_INVALID;
}

static bool PNGBitDepthMatchesFmt(int pngBitDepth, enum TextureFormat format)
{
    switch (format) {
    case TEX_FORMAT_2BPP_PALETTED:
        return pngBitDepth == 2;
    case TEX_FORMAT_4BPP_PALETTED:
        return pngBitDepth == 4;
    case TEX_FORMAT_8BPP_PALETTED:
        return pngBitDepth == 8;
    default:
        return false;
    }
}

static uint32_t CalcBitDepth(uint32_t numColors)
{
    numColors--;
    int d = 1;
    while (numColors >>= 1) {
        d++;
    }
    return d;
}

static int ReadResNameLine(FILE *fp, struct ResourceName *resName)
{
    int c;
    int i;

    for (i = 0; (c = fgetc(fp)) != '\n' && c != EOF && i < RES_NAME_LENGTH; i++) {
        resName->asChars[i] = c;
    }

    while (c != '\n' && c != EOF) {
        c = fgetc(fp);
        i++;
    }

    return i;
}

static const unsigned int NumDigits(unsigned int val)
{
    int n = 0;
    for (int i = 10, n = 1; i < INT_MAX / 10; i *= 10, n++) {
        if (val < i) {
            return n;
        }
    }
    return n;
}
