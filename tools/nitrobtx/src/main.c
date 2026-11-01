/*
 * Copyright (c) 2026 Gudf
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, version 3.

 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */

#include <libgen.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include "errors.h"
#include "ns/chunks/tex.h"
#include "ns/container.h"
#include "options.h"
#include "palette.h"
#include "texture.h"
#include "vec.h"

#define PROG_NAME "nitrobtx"

static int DumpBTX(struct Options *options);
static int PackBTX(struct Options *options);
static char *ExtractFileNameFromPath(const char *path);

int main(int argc, char **argv)
{
    struct Options options;

    ParseOptions(argc, argv, &options);

    int res = 0;
    switch (options.mode) {
    case MODE_DUMP:
        res = DumpBTX(&options);
        break;
    case MODE_PACK:
        res = PackBTX(&options);
        break;
    }

    FreeOptions(&options);
    return res;
}

static int DumpBTX(struct Options *options)
{
    const char *inputPath = VecGet(options->nsbtxs, 0).path;

    FILE *inputFile = fopen(inputPath, "rb");
    if (inputFile == NULL) {
        fprintf(stderr, "Failed to open input file '%s'!\n", inputPath);
        return ERR_CODE_FAILED_OPEN_INPUT;
    }

    struct NSContainer container = { 0 };

    int res = NSContainer_ReadFromFile(&container, inputFile);

    if (res != ERR_CODE_OK) {
        NSContainer_Free(&container);
        fclose(inputFile);
        return res;
    }

    if (container.type.raw != containerMagics[CONTAINER_BTX0].raw) {
        fprintf(stderr, "File '%s' isn't a valid NSBTX! File magic: '%.*s'.\n", inputPath, 4, container.type.asBytes);
        NSContainer_Free(&container);
        fclose(inputFile);
        return ERR_CODE_INVALID_FILE_TYPE;
    }

    VecForEach (tex, container.chunks[0].texChunk->textures) {
        if (tex->format == TEX_FORMAT_4X4_COMPRESSED) {
            fprintf(stderr, "Texture %.*s uses 'compressed' format (format 5) and will not be dumped.\n", RES_NAME_LENGTH, tex->name.asChars);
        }
    }

    if (VecGet(options->nsbtxs, 0).spritesheet) {
        res = TexChunkToPNGSpritesheet(container.chunks[0].texChunk, options->outputPath, VecGet(options->nsbtxs, 0).combinedPalette);
        if (res == ERR_CODE_OK && VecGet(options->nsbtxs, 0).palettesPath) {
            res = TexChunkPalettesToDirectory(container.chunks[0].texChunk, VecGet(options->nsbtxs, 0).palettesPath);
        }
    } else {
        res = TexChunkToDirectory(container.chunks[0].texChunk, options->outputPath);
    }

    fclose(inputFile);
    NSContainer_Free(&container);
    return res;
}

static int PackBTX(struct Options *options)
{
    enum ErrorCode tmp, res = ERR_CODE_OK;
    struct NSContainer container = NSContainer_Init(CONTAINER_BTX0);
    struct NSChunkTex *chunk = container.chunks[0].texChunk;

    VecForEach (tex, options->textures) {
        bool freeName = false;
        if (tex->name == NULL) {
            tex->name = ExtractFileNameFromPath(tex->path);
            freeName = true;
        }
        if (tex->spritesheet) {
            int vecLen = chunk->textures.n;
            if ((tmp = TexturesVec_ExtendFromSpritesheetPNG(&chunk->textures, tex)) != ERR_CODE_OK) {
                res = tmp;
            }
            int repeatCount = chunk->textures.n - vecLen;
            if (tex->palIdx != -1) {
                VecGet(options->palettes, tex->palIdx).multiPalCount = repeatCount;
            }
        } else {
            if ((tmp = TexturesVec_AppendFromPNG(&chunk->textures, tex)) != ERR_CODE_OK) {
                res = tmp;
            }
        }
        if (freeName) {
            free((void *)tex->name);
        }
    }

    SortTexturesLexico(chunk);

    VecForEach (pal, options->palettes) {
        bool freeName = false;
        if (pal->name == NULL) {
            pal->name = ExtractFileNameFromPath(pal->path);
            freeName = true;
        }
        PalettesVec_Append(&chunk->palettes, pal);
        if (freeName) {
            free((void *)pal->name);
        }
    }

    SortPalettesLexico(chunk);

    FILE *out = fopen(options->outputPath, "wb");

    NSContainer_WriteToFile(&container, out);

    fclose(out);
    NSContainer_Free(&container);

    return res;
}

static char *ExtractFileNameFromPath(const char *path)
{
    int lastSepIdx = -1, lastPeriodIdx = 0;

    int i;
    for (i = 0; path[i] != 0; i++) {
        if (path[i] == '/') {
            lastSepIdx = i;
        }
        if (path[i] == '.') {
            lastPeriodIdx = i;
        }
    }

    if (lastSepIdx > lastPeriodIdx) {
        lastPeriodIdx = i;
    }

    lastSepIdx++;
    int fileNameLen = lastPeriodIdx - lastSepIdx;

    char *fileName = malloc(fileNameLen + 1);
    sprintf(fileName, "%.*s", fileNameLen, &path[lastSepIdx]);

    return fileName;
}
