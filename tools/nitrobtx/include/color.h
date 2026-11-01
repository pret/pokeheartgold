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

#ifndef NITROBTX_COLOR_H
#define NITROBTX_COLOR_H

#include <png.h>
#include <stdint.h>

struct NDSColor {
    uint16_t r : 5;
    uint16_t g : 5;
    uint16_t b : 5;
    uint16_t a : 1;
};

struct RGBA8Color {
    uint8_t r;
    uint8_t g;
    uint8_t b;
    uint8_t a;
};

static inline uint8_t ConvertBitDepth(uint8_t color, int srcDepth, int destDepth)
{
    if (srcDepth > destDepth) {
        return color >> (srcDepth - destDepth);
    } else {
        int mult = 1;
        int i;
        for (i = srcDepth; i < destDepth; i += srcDepth) {
            mult = mult << srcDepth | 1;
        }
        return (color * mult) >> (i - destDepth);
    }
}

static inline struct RGBA8Color NDSColorToRGBA8(struct NDSColor color)
{
    return (struct RGBA8Color) {
        .r = ConvertBitDepth(color.r, 5, 8),
        .g = ConvertBitDepth(color.g, 5, 8),
        .b = ConvertBitDepth(color.b, 5, 8),
        .a = ConvertBitDepth(color.a, 1, 8),
    };
}

static inline struct NDSColor RGBA8ToNDSColor(struct RGBA8Color color)
{
    return (struct NDSColor) {
        .r = ConvertBitDepth(color.r, 8, 5),
        .g = ConvertBitDepth(color.g, 8, 5),
        .b = ConvertBitDepth(color.b, 8, 5),
        .a = ConvertBitDepth(color.a, 8, 1),
    };
}

static inline png_color NDSColorToPNG(struct NDSColor color)
{
    return (png_color) {
        .red = ConvertBitDepth(color.r, 5, 8),
        .green = ConvertBitDepth(color.g, 5, 8),
        .blue = ConvertBitDepth(color.b, 5, 8),
    };
}

static inline struct NDSColor PNGToNDSColor(png_color color)
{
    return (struct NDSColor) {
        .r = ConvertBitDepth(color.red, 8, 5),
        .g = ConvertBitDepth(color.green, 8, 5),
        .b = ConvertBitDepth(color.blue, 8, 5),
    };
}

#endif // NITROBTX_COLOR_H
