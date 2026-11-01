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

#include "palette.h"

#include <png.h>
#include <stdbool.h>
#include <stdlib.h>
#include <string.h>

#include "color.h"
#include "common.h"
#include "errors.h"
#include "ns/resource_name.h"
#include "vec.h"

enum PalReadError {
    PAL_READ_SUCCESS,
    PAL_READ_ERROR_NULL_BYTE,
    PAL_READ_ERROR_LINE_TOO_LONG,
    PAL_READ_ERROR_INVALID_SIGNATURE,
    PAL_READ_ERROR_INVALID_VERSION,
    PAL_READ_ERROR_INVALID_COLOR_COUNT,
    PAL_READ_ERROR_INVALID_CHANNEL_VALUE,
};

enum PaletteSource {
    PALETTE_SOURCE_PNG,
    PALETTE_SOURCE_JASC_PAL,
};

static png_color NDSColorToPNG(struct NDSColor color);
static struct NDSColor PNGToNDSColor(png_color color);
static unsigned int NumDigits(unsigned int val);
static enum ErrorCode Palette_ReadPNG(const char *inputPath, struct Palette *out);
static enum ErrorCode Palette_ReadJASCPAL(const char *path, struct Palette *palette);

static bool ParseInteger(char *str, char **end, int base, int *dest, int min, int max)
{
    long val = strtol(str, end, base);

    if (*end == str) {
        return false;
    }

    if (val > max || val < min) {
        return false;
    }

    *dest = (int)val;
    return true;
}

void *Palette_WritePLTE(const struct Palette *palette, int maxSize, png_structp png_ptr, png_infop info_ptr)
{
    int numColors = maxSize < palette->numColors ? maxSize : palette->numColors;
    png_colorp pngPalette = calloc(numColors, sizeof(png_color));
    for (int i = 0; i < numColors; i++) {
        pngPalette[i] = NDSColorToPNG(palette->data[i]);
    }
    png_set_PLTE(png_ptr, info_ptr, pngPalette, numColors);
    return pngPalette;
}

enum ErrorCode Palette_WriteJASCPAL(const struct Palette *palette, const char *path)
{
    FILE *fp = fopen(path, "w");
    if (fp == NULL) {
        fprintf(stderr, "Failed to open file %s for output!\n", path);
        return ERR_CODE_FAILED_OPEN_OUTPUT;
    }

    fputs("JASC-PAL\r\n", fp);
    fputs("0100\r\n", fp);
    fprintf(fp, "%d\r\n", palette->numColors);

    for (int i = 0; i < palette->numColors; i++) {
        struct RGBA8Color color = NDSColorToRGBA8(palette->data[i]);
        fprintf(fp, "%d %d %d\r\n", color.r, color.g, color.b);
    }

    fclose(fp);

    return ERR_CODE_OK;
}

static bool ParseJASCPALColor(char lineBuf[16], struct RGBA8Color *dest)
{
    char *c = lineBuf;
    char *end;
    int r, g, b;

    if (!ParseInteger(c, &end, 10, &r, 0, 255)) {
        return false;
    }

    c = end;

    while (*c == ' ') {
        c++;
    }

    if (!ParseInteger(c, &end, 10, &g, 0, 255)) {
        return false;
    }

    c = end;

    while (*c == ' ') {
        c++;
    }

    if (!ParseInteger(c, &end, 10, &b, 0, 255)) {
        return false;
    }

    dest->r = r;
    dest->g = g;
    dest->b = b;
    dest->a = 0;

    return true;
}

static int ReadLine(FILE *fp, char lineBuf[16])
{
    int length = 0;
    char c;

    while (true) {
        c = fgetc(fp);

        switch (c) {
        case '\n':
        case EOF:
            lineBuf[length] = 0;
            return PAL_READ_SUCCESS;
        case 0:
            return PAL_READ_ERROR_NULL_BYTE;
        case '\r':
            break;
        default:
            if (length == 15) {
                lineBuf[length] = 0;
                return PAL_READ_ERROR_LINE_TOO_LONG;
            }
            lineBuf[length++] = c;
            break;
        }
    }
}

enum ErrorCode PalettesVec_Append(struct PalettesVec *vec, struct PaletteInput *in) // enum PaletteSource source, const char *path, const char *name, unsigned int multiPalCount, bool addSuffix)
{
    int multiPalCount = in->multiPalCount;
    bool addSuffix = in->addSuffix;
    const char *name = in->name;
    const char *path = in->path;

    int maxNameLength = RES_NAME_LENGTH - (multiPalCount > 1 ? 1 + NumDigits(multiPalCount) : 0) - (addSuffix ? strlen("_pl") : 0);

    if (strlen(name) > maxNameLength) {
        if (multiPalCount > 1) {
            if (addSuffix) {
                fprintf(stderr, "Warning: palette name %s is too long! It will be truncated to %u characters to fit the palette number and '_pl' suffixes: '%.*s'.\n", name, maxNameLength, maxNameLength, name);
            } else {
                fprintf(stderr, "Warning: palette name %s is too long! It will be truncated to %u characters to fit the palette number suffix: '%.*s'.\n", name, maxNameLength, maxNameLength, name);
            }
        } else {
            if (addSuffix) {
                fprintf(stderr, "Warning: palette name %s is too long! It will be truncated to %u characters to fit the '_pl' suffix: '%.*s'.\n", name, maxNameLength, maxNameLength, name);
            } else {
                fprintf(stderr, "Warning: palette name %s is too long! It will be truncated to %u characters: '%.*s'.\n", name, maxNameLength, maxNameLength, name);
            }
        }
    }

    struct Palette tmp = { 0 };

    enum ErrorCode res;
    switch (in->inputType) {
    case PALETTE_SOURCE_PNG:
        if ((res = Palette_ReadPNG(path, &tmp)) != ERR_CODE_OK) {
            return res;
        }
        break;
    case PALETTE_SOURCE_JASC_PAL:
        if ((res = Palette_ReadJASCPAL(path, &tmp)) != ERR_CODE_OK) {
            return res;
        }
        break;
    }

    if (in->multiPalMode == MULTI_PALETTE_SPLIT && tmp.numColors % in->multiPalCount != 0) {
        fprintf(stderr, "Cannot split palette %s into %u palettes of equal size cleanly!", in->path, in->multiPalCount);
        Palette_Free(&tmp);
        return ERR_CODE_INPUT_INVALID;
    }

    char nameBuf[RES_NAME_LENGTH + 1] = { 0 };

    if (in->multiPalMode == SINGLE_PALETTE) {
        snprintf(nameBuf, RES_NAME_LENGTH + 1, "%.*s%s", maxNameLength, name, addSuffix ? "_pl" : "");
        CopyToResName(&tmp.name, nameBuf);
        VecAppend(*vec, tmp);
        return ERR_CODE_OK;
    }

    for (int i = 0; i < multiPalCount; i++) {
        VecAppend(*vec, (struct Palette) { 0 });
        struct Palette *pal = &VecLast(*vec);

        snprintf(nameBuf, RES_NAME_LENGTH + 1, "%.*s.%u%s", maxNameLength, name, i + 1, addSuffix ? "_pl" : "");
        CopyToResName(&pal->name, nameBuf);

        size_t offset = 0;
        switch (in->multiPalMode) {
        case SINGLE_PALETTE:
            __builtin_unreachable();
            break;
        case MULTI_PALETTE_REPEAT:
            offset = 0;
            pal->numColors = tmp.numColors;
            break;
        case MULTI_PALETTE_SPLIT:
            offset = i * tmp.numColors / in->multiPalCount;
            pal->numColors = tmp.numColors / in->multiPalCount;
        }
        pal->is4Color = tmp.is4Color;

        pal->data = calloc(pal->numColors, sizeof(*pal->data));
        memcpy(pal->data, tmp.data + offset, pal->numColors * sizeof(struct NDSColor));
    }

    Palette_Free(&tmp);

    return ERR_CODE_OK;
}

enum ErrorCode PalettesVec_Combine(const struct PalettesVec *vec, struct Palette *out)
{
    int colorsPerPalette = VecGet(*vec, 0).numColors;

    VecForEach (pal, *vec) {
        if (pal->numColors != colorsPerPalette) {
            fprintf(stderr, "Cannot combine palettes with differing numbers of colors!\n");
            return ERR_CODE_INPUT_INVALID;
        }
    }

    out->numColors = colorsPerPalette * vec->n;
    out->name = VecGet(*vec, 0).name;
    int lastCommon = RES_NAME_LENGTH - 1;

    VecForEach (pal, *vec) {
        for (int i = 0; i < lastCommon; i++) {
            if (pal->name.asChars[i] != out->name.asChars[i]) {
                lastCommon = i - 1;
                break;
            }
        }
    }

    if (lastCommon != -1) {
        for (int i = lastCommon + 1; i < RES_NAME_LENGTH; i++) {
            out->name.asChars[i] = '\0';
        }
    }

    out->data = calloc(out->numColors, sizeof(*out->data));

    for (int i = 0; i < vec->n; i++) {
        memcpy(&out->data[i * colorsPerPalette], VecGet(*vec, i).data, colorsPerPalette * sizeof(*out->data));
    }

    return ERR_CODE_OK;
}

enum ErrorCode Palette_ReadJASCPAL(const char *path, struct Palette *palette)
{
    enum ErrorCode err = ERR_CODE_OK;

    char lineBuf[16];
    FILE *fp = fopen(path, "rb");

    if (!fp) {
        fprintf(stderr, "Failed to open file %s for reading!\n", path);
        return ERR_CODE_FAILED_OPEN_INPUT;
    }

    if (ReadLine(fp, lineBuf) != PAL_READ_SUCCESS) {
        fprintf(stderr, "Error while reading %s!\n", path);
        err = ERR_CODE_INPUT_INVALID;
        goto cleanup;
    }

    if (strcmp(lineBuf, "JASC-PAL") != 0) {
        fprintf(stderr, "Invalid JASC-PAL signature!\n");
        err = ERR_CODE_INPUT_INVALID;
        goto cleanup;
    }

    if (ReadLine(fp, lineBuf) != PAL_READ_SUCCESS) {
        fprintf(stderr, "Error while reading %s!\n", path);
        err = ERR_CODE_INPUT_INVALID;
        goto cleanup;
    }

    if (strcmp(lineBuf, "0100") != 0) {
        fprintf(stderr, "Invalid JASC-PAL version!\n");
        err = ERR_CODE_INPUT_INVALID;
        goto cleanup;
    }

    if (ReadLine(fp, lineBuf) != PAL_READ_SUCCESS) {
        fprintf(stderr, "Error while reading %s!\n", path);
        err = ERR_CODE_INPUT_INVALID;
        goto cleanup;
    }

    char *end;
    int numColors = strtol(lineBuf, &end, 10);

    if (end == lineBuf || numColors < 1 || numColors > 256) {
        fprintf(stderr, "Invalid JASC-PAL color count!\n");
        err = ERR_CODE_INPUT_INVALID;
        goto cleanup;
    }

    palette->numColors = numColors < 8 ? 8 : numColors;
    palette->data = calloc(palette->numColors, sizeof(*palette->data));

    for (int i = 0; i < numColors; i++) {
        ReadLine(fp, lineBuf);
        struct RGBA8Color color;
        if (!ParseJASCPALColor(lineBuf, &color)) {
            fprintf(stderr, "Invalid JASC-PAL channel value!\n");
            err = ERR_CODE_INPUT_INVALID;
            goto cleanup_free_pal;
        }

        palette->data[i] = RGBA8ToNDSColor(color);
    }

    for (int i = numColors; i < palette->numColors; i++) {
        palette->is4Color = true;
        palette->data[i] = (struct NDSColor) { 0 };
    }

    goto cleanup;

cleanup_free_pal:
    free(palette->data);
    palette->data = NULL;
    palette->numColors = 0;

cleanup:
    fclose(fp);
    return err;
}

enum ErrorCode Palette_ReadPNG(const char *inputPath, struct Palette *out)
{
    png_colorp palette;
    int num_palette;

    FILE *fp;
    png_structp png_ptr = NULL;
    png_infop info_ptr = NULL;

    enum ErrorCode res;
    if ((res = InitializeReadPNG(inputPath, &fp, &png_ptr, &info_ptr)) != ERR_CODE_OK) {
        return res;
    }

    png_read_info(png_ptr, info_ptr);

    uint32_t result = png_get_PLTE(png_ptr, info_ptr, &palette, &num_palette);
    if (!result) {
        png_destroy_read_struct(&png_ptr, &info_ptr, NULL);
        fclose(fp);
        fprintf(stderr, "Palette input PNG %s doesn't contain a pLTE chunk!\n", inputPath);
        return ERR_CODE_INPUT_INVALID;
    }

    out->numColors = num_palette < 8 ? 8 : num_palette;
    out->data = calloc(out->numColors, sizeof(struct NDSColor));

    for (int i = 0; i < num_palette; i++) {
        out->data[i] = PNGToNDSColor(palette[i]);
    }

    for (int i = num_palette; i < out->numColors; i++) {
        out->is4Color = true;
        out->data[i] = (struct NDSColor) { 0 };
    }

    png_destroy_read_struct(&png_ptr, &info_ptr, NULL);
    fclose(fp);

    return ERR_CODE_OK;
}

void Palette_Free(struct Palette *palette)
{
    free(palette->data);
    palette->data = NULL;
    palette->numColors = 0;
}

static unsigned int NumDigits(unsigned int val)
{
    int n = 0;
    for (int i = 10, n = 1; i < INT_MAX / 10; i *= 10, n++) {
        if (val < i) {
            return n;
        }
    }
    return n;
}
