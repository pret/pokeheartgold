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

#ifndef NITROBTX_PALETTE_H
#define NITROBTX_PALETTE_H

#include <png.h>
#include <stdbool.h>

#include "color.h"
#include "ns/resource_name.h"
#include "vec.h"

enum PaletteInputType {
    INPUT_TYPE_PNG,
    INPUT_TYPE_JASC_PAL,
};

enum MultiPaletteMode {
    SINGLE_PALETTE = 0,
    MULTI_PALETTE_REPEAT,
    MULTI_PALETTE_SPLIT,
};

struct PaletteInput {
    enum PaletteInputType inputType;
    enum MultiPaletteMode multiPalMode;
    int multiPalCount;
    bool addSuffix;
    const char *name;
    const char *path;
};

struct Palette {
    struct ResourceName name;
    struct NDSColor *data;
    int numColors;
    bool is4Color;
};

MakeVecType(PalettesVec, struct Palette);

void *Palette_WritePLTE(const struct Palette *palette, int maxSize, png_structp png_ptr, png_infop info_ptr);

enum ErrorCode Palette_WriteJASCPAL(const struct Palette *palette, const char *path);
enum ErrorCode PalettesVec_Append(struct PalettesVec *vec, struct PaletteInput *in);
enum ErrorCode PalettesVec_Combine(const struct PalettesVec *vec, struct Palette *out);
void Palette_Free(struct Palette *palette);

#endif // NITROBTX_PALETTE_H
