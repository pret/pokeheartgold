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

#include "ns/chunks/tex.h"

#include <png.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "common.h"
#include "ns/resource_dict.h"
#include "ns/resource_name.h"
#include "texture.h"
#include "vec.h"

enum TexChunkPaletteFlags {
    TEX_CHUNK_HAS_4_COLOR_PLTT = 0x8000,
};

struct NSChunkTexHeader {
    union Magic magic;
    uint32_t size;
    uint32_t padding_08;
    uint16_t textureDataSize;
    uint16_t textureDictOffset;
    uint32_t padding_10;
    uint32_t textureDataOffset;
    uint32_t padding_18;
    uint16_t compressedTexDataSize;
    uint16_t compressedTexDictOffs;
    uint32_t padding_20;
    uint32_t comprTexDataOffs;
    uint32_t comprTexAttrOffs;
    uint32_t padding_2C;
    uint16_t paletteDataSize;
    uint16_t palettesFlag;
    uint32_t paletteDictOffset;
    uint32_t paletteDataOffset;
};

static int ReadTextures(FILE *file, struct NSChunkTexHeader *header, struct NSChunkTex *chunk, long chunkStart);
static int ReadPalettes(FILE *file, struct NSChunkTexHeader *header, struct NSChunkTex *chunk, long chunkStart);
static int CompareTexNamesSmart(const void *first, const void *second);
static int ComparePalNamesSmart(const void *first, const void *second);
static int CompareTexNamesLexico(const void *first, const void *second);
static int ComparePalNamesLexico(const void *first, const void *second);

struct NSChunkTex *MakeTexChunk(void)
{
    struct NSChunkTex *chunk = malloc(sizeof(*chunk));
    VecInit(chunk->textures, 8);
    VecInit(chunk->palettes, 8);
    return chunk;
}

int WriteTexChunk(FILE *file, struct NSChunkTex *chunk)
{
    long chunkStart = ftell(file);

    struct NSChunkTexHeader header = {
        .magic.asBytes = TEX0_MAGIC,
    };

    struct NSResourceDict texDict = {
        .dataEntrySize = sizeof(struct TextureDictData),
        .entryCount = chunk->textures.n,
        .data = calloc(chunk->textures.n, sizeof(struct TextureDictData)),
        .names = calloc(chunk->textures.n, sizeof(struct ResourceName)),
    };

    for (size_t i = 0; i < chunk->textures.n; i++) {
        struct Texture *tex = &VecGet(chunk->textures, i);
        texDict.names[i] = tex->name;

        int sSize = LengthToTexSize(tex->width);
        int tSize = LengthToTexSize(tex->height);

        ((struct TextureDictData *)texDict.data)[i] = (struct TextureDictData) {
            .format = tex->format,
            .transparent = tex->transparent,
            .width = tex->width,
            .height = tex->height,
            .sSize = sSize,
            .tSize = tSize,
            .fillsTexSize = (8 << sSize) == tex->width && (8 << tSize) == tex->height,
        };

        if (tex->format == TEX_FORMAT_2BPP_PALETTED) {
            header.palettesFlag |= TEX_CHUNK_HAS_4_COLOR_PLTT;
        }
    }

    struct NSResourceDict palDict = {
        .dataEntrySize = sizeof(struct PaletteDictData),
        .entryCount = chunk->palettes.n,
        .data = calloc(chunk->palettes.n, sizeof(struct PaletteDictData)),
        .names = calloc(chunk->palettes.n, sizeof(struct ResourceName)),
    };

    for (size_t i = 0; i < chunk->palettes.n; i++) {
        palDict.names[i] = VecGet(chunk->palettes, i).name;

        ((struct PaletteDictData *)palDict.data)[i] = (struct PaletteDictData) {
            .is4Color = VecGet(chunk->palettes, i).is4Color,
        };
    }

    header.textureDictOffset = sizeof(struct NSChunkTexHeader);
    header.compressedTexDictOffs = header.textureDictOffset;
    header.paletteDictOffset = header.textureDictOffset + CalcNSResourceDictSize(&texDict);
    header.textureDataOffset = header.paletteDictOffset + CalcNSResourceDictSize(&palDict);

    fseek(file, header.textureDataOffset, SEEK_CUR);

    uint64_t *texChecksums = calloc(chunk->textures.n, sizeof(uint64_t));
    int *texOffsets = calloc(chunk->textures.n, sizeof(int));
    int texDataSize = 0;

    for (int toWrite = 0; toWrite < chunk->textures.n; toWrite++) {
        struct Texture *tex = &(VecGet(chunk->textures, toWrite));

        texChecksums[toWrite] = Fletcher64(tex->texelData.rawData, tex->dataByteCount);

        int sameAs = -1;

        for (int other = 0; other < toWrite; other++) {

            if (texChecksums[toWrite] == texChecksums[other]
                && tex->dataByteCount == VecGet(chunk->textures, other).dataByteCount
                && AreSame(tex->texelData.rawData, VecGet(chunk->textures, other).texelData.rawData, tex->dataByteCount)) {
                sameAs = other;
                break;
            }
        }

        if (sameAs == -1) {
            texOffsets[toWrite] = texDataSize;
            fwrite(tex->texelData.rawData, tex->dataByteCount, 1, file);
            texDataSize += tex->dataByteCount;
        } else {
            texOffsets[toWrite] = texOffsets[sameAs];
        }

        ((struct TextureDictData *)texDict.data)[toWrite].textureOffset = texOffsets[toWrite] / 8;
    }
    free(texChecksums);
    free(texOffsets);

    header.textureDataSize = texDataSize / 8;

    header.paletteDataOffset = header.textureDataOffset + texDataSize;
    header.comprTexDataOffs = header.paletteDataOffset;
    header.comprTexAttrOffs = header.paletteDataOffset;
    int *palOffsets = calloc(chunk->palettes.n, sizeof(int));
    int palDataSize = 0;
    for (int toWrite = 0; toWrite < chunk->palettes.n; toWrite++) {
        struct Palette *pal = &(VecGet(chunk->palettes, toWrite));
        int sameAs = -1;
        for (int other = 0; other < toWrite; other++) {
            if (pal->numColors == VecGet(chunk->palettes, other).numColors
                && AreSame(pal->data, VecGet(chunk->palettes, other).data, pal->numColors * sizeof(struct NDSColor))) {
                sameAs = other;
                break;
            }
        }
        if (sameAs == -1) {
            palOffsets[toWrite] = palDataSize;
            fwrite(pal->data, sizeof(struct NDSColor), pal->numColors, file);
            palDataSize += pal->numColors * sizeof(struct NDSColor);
        } else {
            palOffsets[toWrite] = palOffsets[sameAs];
        }
        ((struct PaletteDictData *)palDict.data)[toWrite].plttOffset = palOffsets[toWrite] / 8;
    }
    free(palOffsets);

    header.paletteDataSize = palDataSize / 8;

    header.size = header.textureDataOffset + header.textureDataSize * 8 + header.paletteDataSize * 8;

    long end = ftell(file);
    fseek(file, chunkStart, SEEK_SET);

    fwrite(&header, sizeof(header), 1, file);
    WriteNSResourceDict(file, &texDict);
    WriteNSResourceDict(file, &palDict);

    fseek(file, end, SEEK_SET);

    FreeResourceDict(&texDict);
    FreeResourceDict(&palDict);
    return 0;
}

int ReadTexChunk(FILE *file, struct NSChunkTex *chunk)
{
    long chunkStart = ftell(file);

    struct NSChunkTexHeader header;

    int nRead = fread(&header, sizeof(struct NSChunkTexHeader), 1, file);

    if (nRead != 1) {
        return ERR_CODE_INPUT_INVALID;
    }

    if (header.compressedTexDictOffs != header.textureDictOffset) {
        fprintf(stderr, "Files with different compressed textures and non-compressed texture dicts aren't supported.\n");
        return ERR_CODE_UNSUPPORTED;
    }

    int err;

    if ((err = ReadTextures(file, &header, chunk, chunkStart)) != 0) {
        return err;
    }

    if ((err = ReadPalettes(file, &header, chunk, chunkStart)) != 0) {
        return err;
    }

    VecSort(chunk->textures, CompareTexNamesSmart);
    VecSort(chunk->palettes, ComparePalNamesSmart);

    return 0;
}

static int ReadTextures(FILE *file, struct NSChunkTexHeader *header, struct NSChunkTex *chunk, long chunkStart)
{
    struct NSResourceDict *texturesDict = malloc(sizeof(struct NSResourceDict));
    fseek(file, chunkStart + header->textureDictOffset, SEEK_SET);
    ReadNSResourceDict(file, texturesDict);

    VecInit(chunk->textures, texturesDict->entryCount);
    for (int i = 0; i < texturesDict->entryCount; i++) {
        VecAppend(chunk->textures, (struct Texture) { 0 });
        struct Texture *tex = &(VecLast(chunk->textures));
        tex->name = texturesDict->names[i];

        struct TextureDictData texMetadata = ((struct TextureDictData *)texturesDict->data)[i];

        tex->format = texMetadata.format;
        tex->width = texMetadata.width;
        tex->height = texMetadata.height;
        tex->transparent = texMetadata.transparent;

        int texelCount = (8 << texMetadata.tSize) * (8 << texMetadata.sSize);
        tex->dataByteCount = (texelCount * GetTexelSizeForTexFmt(texMetadata.format)) / 8;
        if (texMetadata.format == TEX_FORMAT_4X4_COMPRESSED) {
            tex->texelData.chunks = malloc(tex->dataByteCount);
            tex->texelData.chunkAttrs = malloc(tex->dataByteCount / 2);

            fseek(file, chunkStart + header->comprTexDataOffs + (texMetadata.textureOffset << 3), SEEK_SET);
            int nRead = fread(tex->texelData.chunks, 1, tex->dataByteCount, file);
            if (nRead != tex->dataByteCount) {
                return 1;
            }

            fseek(file, chunkStart + header->comprTexAttrOffs + (texMetadata.textureOffset << 2), SEEK_SET);
            nRead = fread(tex->texelData.chunkAttrs, 1, tex->dataByteCount / 2, file);
            if (nRead != tex->dataByteCount / 2) {
                return 1;
            }
        } else {
            tex->texelData.rawData = malloc(tex->dataByteCount);
            fseek(file, chunkStart + header->textureDataOffset + (texMetadata.textureOffset << 3), SEEK_SET);
            int nRead = fread(tex->texelData.rawData, 1, tex->dataByteCount, file);
            if (nRead != tex->dataByteCount) {
                return 1;
            }
        }
    }

    FreeResourceDict(texturesDict);
    free(texturesDict);
    return 0;
}

static int ReadPalettes(FILE *file, struct NSChunkTexHeader *header, struct NSChunkTex *chunk, long chunkStart)
{
    struct NSResourceDict *palettesDict = malloc(sizeof(struct NSResourceDict));
    fseek(file, chunkStart + header->paletteDictOffset, SEEK_SET);
    ReadNSResourceDict(file, palettesDict);

    VecInit(chunk->palettes, palettesDict->entryCount);
    int *paletteOffs = calloc(palettesDict->entryCount, sizeof(*paletteOffs));
    for (int i = 0; i < palettesDict->entryCount; i++) {
        struct PaletteDictData palMeta = ((struct PaletteDictData *)palettesDict->data)[i];
        paletteOffs[i] = palMeta.plttOffset;
    }

    qsort(paletteOffs, palettesDict->entryCount, sizeof(int), CompareInts);

    int i, j;
    for (i = 0, j = 0; i < palettesDict->entryCount && j < palettesDict->entryCount; i++) {
        paletteOffs[i] = paletteOffs[j];
        while (j < palettesDict->entryCount && paletteOffs[i] == paletteOffs[j]) {
            j++;
        }
    }

    int numPaletteBounds = i;

    for (int i = 0; i < palettesDict->entryCount; i++) {
        VecAppend(chunk->palettes, (struct Palette) { .name = palettesDict->names[i] });
        struct Palette *pal = &VecLast(chunk->palettes);
        struct PaletteDictData palMeta = ((struct PaletteDictData *)palettesDict->data)[i];
        int paletteEnd = header->paletteDataSize;

        for (int j = numPaletteBounds - 1; j >= 0; j--) {
            if (paletteOffs[j] > palMeta.plttOffset) {
                paletteEnd = paletteOffs[j];
            }
        }

        pal->numColors = ((paletteEnd - palMeta.plttOffset) << 3) / (sizeof(struct NDSColor));
        pal->data = calloc(pal->numColors, sizeof(struct NDSColor));
        fseek(file, chunkStart + header->paletteDataOffset + (palMeta.plttOffset << 3), SEEK_SET);
        int nRead = fread(pal->data, sizeof(struct NDSColor), pal->numColors, file);
        if (nRead != pal->numColors) {
            return 1;
        }

        pal->is4Color = palMeta.is4Color;
    }

    FreeResourceDict(palettesDict);
    free(palettesDict);
    free(paletteOffs);

    return 0;
}

void SortTexturesLexico(struct NSChunkTex *chunk)
{
    VecSort(chunk->textures, CompareTexNamesLexico);
}

void SortPalettesLexico(struct NSChunkTex *chunk)
{
    VecSort(chunk->palettes, ComparePalNamesLexico);
}

void SortTexturesSmart(struct NSChunkTex *chunk)
{
    VecSort(chunk->textures, CompareTexNamesSmart);
}

void SortPalettesSmart(struct NSChunkTex *chunk)
{
    VecSort(chunk->palettes, ComparePalNamesSmart);
}

int TexChunkToPNGSpritesheet(const struct NSChunkTex *chunk, const char *path, bool combinedPalette)
{
    if (!combinedPalette) {
        return TexturesVec_ToSpritesheetPNG(&chunk->textures, chunk->palettes.n > 0 ? &VecGet(chunk->palettes, 0) : NULL, path, combinedPalette);
    } else if (chunk->palettes.n == chunk->textures.n) {
        struct Palette pal;
        PalettesVec_Combine(&chunk->palettes, &pal);
        if (pal.numColors > 256) {
            fprintf(stderr, "Can't combine palettes with more than 256 total colors!\n");
            Palette_Free(&pal);
            return ERR_CODE_INPUT_INVALID;
        }
        int res = TexturesVec_ToSpritesheetPNG(&chunk->textures, &pal, path, combinedPalette);
        Palette_Free(&pal);
        return res;
    } else {
        fprintf(stderr, "Can't combine palettes when the number of textures and the number of palettes don't match!\n");
        return ERR_CODE_INPUT_INVALID;
    }
}

int TexChunkToDirectory(const struct NSChunkTex *chunk, const char *directory)
{
    VecForEach (tex, chunk->textures) {
        size_t pathLength = strlen(directory) + RES_NAME_LENGTH + strlen(".png") + 2;
        char *path = calloc(pathLength, 1);
        snprintf(path, pathLength, "%s/%.*s.png", directory, RES_NAME_LENGTH, tex->name.asChars);

        int minPalSize = GetMinimumPaletteSize(tex);

        int minDist = 16;
        int minDistIdx = -1;
        for (int pal = 0; pal < chunk->palettes.n; pal++) {
            if (VecGet(chunk->palettes, pal).numColors < minPalSize) {
                continue;
            }
            struct ResourceName palName = VecGet(chunk->palettes, pal).name;
            for (int i = RES_NAME_LENGTH - 1; i > 2; i--) {
                if (palName.asChars[i] != 0 && palName.asChars[i] != 'l') {
                    break;
                }

                if (palName.asChars[i] == 'l' && palName.asChars[i - 1] == 'p' && palName.asChars[i - 2] == '_') {
                    palName.asChars[i] = 0;
                    palName.asChars[i - 1] = 0;
                    palName.asChars[i - 2] = 0;
                    break;
                }
            }
            int dist = LevenshteinDist(&tex->name, &palName);
            if (dist < minDist) {
                minDist = dist;
                minDistIdx = pal;
            }

            if (minDist == 0) {
                break;
            }
        }

        Texture_WritePNG(tex, minDistIdx == -1 ? NULL : &VecGet(chunk->palettes, minDistIdx), path);
        free(path);
    }

    TexChunkPalettesToDirectory(chunk, directory);

    return 0;
}

int TexChunkPalettesToDirectory(const struct NSChunkTex *chunk, const char *directory)
{
    size_t pathLength = strlen(directory) + RES_NAME_LENGTH + strlen(".pal") + 2;
    char *path = calloc(pathLength, 1);
    VecForEach (pal, chunk->palettes) {
        snprintf(path, pathLength, "%s/%.*s.pal", directory, RES_NAME_LENGTH, pal->name.asChars);
        Palette_WriteJASCPAL(pal, path);
    }
    free(path);
    return 0;
}

void FreeTexChunk(struct NSChunkTex *chunk)
{
    if (chunk == NULL) {
        return;
    }

    VecForEach (texture, chunk->textures) {
        Texture_Free(texture);
    }
    VecFree(chunk->textures);

    VecForEach (palette, chunk->palettes) {
        Palette_Free(palette);
    }
    VecFree(chunk->palettes);
    return;
}

int GetTexelSizeForTexFmt(enum TextureFormat format)
{
    switch (format) {
    case TEX_FORMAT_2BPP_PALETTED:
    case TEX_FORMAT_4X4_COMPRESSED:
        return 2;
    case TEX_FORMAT_4BPP_PALETTED:
        return 4;
    case TEX_FORMAT_8BPP_PALETTED:
    case TEX_FORMAT_A3I5_TRANS:
    case TEX_FORMAT_A5I3_TRANS:
        return 8;
    case TEX_FORMAT_DIRECT_COLOR:
        return 16;
    case TEX_FORMAT_AUTO:
    case TEX_FORMAT_INVALID:
        break;
    }

    return 0;
}

static int CompareTexNamesSmart(const void *first, const void *second)
{
    return CompareResNamesSmart(&((struct Texture *)first)->name, &((struct Texture *)second)->name);
}

static int ComparePalNamesSmart(const void *first, const void *second)
{
    return CompareResNamesSmart(&((struct Palette *)first)->name, &((struct Palette *)second)->name);
}

static int CompareTexNamesLexico(const void *first, const void *second)
{
    return CompareResNamesLexico(&((struct Texture *)first)->name, &((struct Texture *)second)->name);
}

static int ComparePalNamesLexico(const void *first, const void *second)
{
    return CompareResNamesLexico(&((struct Palette *)first)->name, &((struct Palette *)second)->name);
}

int LengthToTexSize(uint32_t x)
{
    if (x <= 8) {
        return 0;
    } else if (x <= 8 << 1) {
        return 1;
    } else if (x <= 8 << 2) {
        return 2;
    } else if (x <= 8 << 3) {
        return 3;
    } else if (x <= 8 << 4) {
        return 4;
    } else if (x <= 8 << 5) {
        return 5;
    } else if (x <= 8 << 6) {
        return 6;
    } else {
        return 7;
    }
}
