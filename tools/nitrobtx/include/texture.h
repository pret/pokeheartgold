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

#ifndef NITROBTX_TEXTURE_H
#define NITROBTX_TEXTURE_H

#include <png.h>
#include <stdbool.h>
#include <stdint.h>
#include <vec.h>

#include "ns/resource_name.h"
#include "palette.h"

enum TextureFormat {
    TEX_FORMAT_MIN = 1,
    TEX_FORMAT_A3I5_TRANS = TEX_FORMAT_MIN,
    TEX_FORMAT_2BPP_PALETTED,
    TEX_FORMAT_4BPP_PALETTED,
    TEX_FORMAT_8BPP_PALETTED,
    TEX_FORMAT_4X4_COMPRESSED,
    TEX_FORMAT_A5I3_TRANS,
    TEX_FORMAT_DIRECT_COLOR,
    TEX_FORMAT_MAX = TEX_FORMAT_DIRECT_COLOR,
    TEX_FORMAT_AUTO,
    TEX_FORMAT_INVALID,
};

#define TRANSPARENT_AUTO (-1)

struct TextureInput {
    enum TextureFormat format;
    int transparent;
    int numFrames;
    int frameHeight;
    bool spritesheet;
    bool combinedPalette;
    int palIdx;
    const char *name;
    const char *path;
    const char *transparencyInput;
    const char *namesFile;
};

struct Texture {
    enum TextureFormat format;
    struct ResourceName name;
    int width;
    int height;
    int dataByteCount;
    bool transparent;
    union {
        // For all formats
        void *rawData;

        // For format 5
        struct {
            uint32_t *chunks;
            uint16_t *chunkAttrs;
        };

        // For format 7
        struct NDSColor *texels;
    } texelData;
};

MakeVecType(TexturesVec, struct Texture);

int Texture_WritePNG(const struct Texture *texture, const struct Palette *palette, const char *filepath);
int TexturesVec_ToSpritesheetPNG(const struct TexturesVec *textures, const struct Palette *palette, const char *filepath, bool combinedPalette);
int TexturesVec_ExtendFromSpritesheetPNG(struct TexturesVec *textures, const struct TextureInput *texture);
int TexturesVec_AppendFromPNG(struct TexturesVec *textures, const struct TextureInput *texture);
void Texture_Free(struct Texture *texture);
int GetMinimumPaletteSize(const struct Texture *texture);

#endif // NITROBTX_TEXTURE_H
