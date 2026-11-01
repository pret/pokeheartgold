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

#ifndef NITROBTX_OPTIONS_H
#define NITROBTX_OPTIONS_H

#include "palette.h"
#include "texture.h"
#include "vec.h"

enum Mode {
    MODE_DUMP,
    MODE_PACK,
};

struct NSBTXInput {
    bool spritesheet;
    bool combinedPalette;
    const char *path;
    const char *palettesPath;
};

struct Options {
    enum Mode mode;
    MakeVecType(TextureInputVec, struct TextureInput) textures;
    MakeVecType(PaletteInputVec, struct PaletteInput) palettes;
    MakeVecType(NSBTXInputVec, struct NSBTXInput) nsbtxs;
    char *outputPath;
};

void ParseOptions(int argc, char **argv, struct Options *options);
void FreeOptions(struct Options *options);

#endif // NITROBTX_OPTIONS_H
