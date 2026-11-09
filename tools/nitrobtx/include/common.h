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

#ifndef NITROBTX_COMMON_STRUCTS_H
#define NITROBTX_COMMON_STRUCTS_H

#include <png.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>

#include "errors.h"

#define RES_NAME_LENGTH 16

union Magic {
    uint8_t asBytes[4];
    uint32_t raw;
};

int CompareInts(const void *first, const void *second);
uint64_t Fletcher64(uint8_t *_data, size_t len);
bool AreSame(void *first, void *second, size_t len);
enum ErrorCode InitializeReadPNG(const char *inputPath, FILE **fp, png_structp *png_ptr, png_infop *info_ptr);
enum ErrorCode InitializeWritePNG(const char *inputPath, FILE **fp, png_structp *png_ptr, png_infop *info_ptr);

#endif // NITROBTX_COMMON_STRUCTS_H
