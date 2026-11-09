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

#include "common.h"

#include <png.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>

#include "errors.h"

int CompareInts(const void *first, const void *second)
{
    return (*(const int *)first > *(const int *)second) - (*(const int *)second > *(const int *)first);
}

uint64_t Fletcher64(uint8_t *_data, size_t len)
{
    uint32_t *data = (uint32_t *)_data;
    uint64_t sum1 = 0, sum2 = 0;

    for (size_t i = 0; i < len / 4; i++) {
        sum1 = (sum1 + data[i]) % ((1ll << 32) - 1);
        sum2 = (sum1 + sum2) % ((1ll << 32) - 1);
    }

    return ((uint64_t)sum2 << 32) + sum1;
}

bool AreSame(void *first, void *second, size_t len)
{
    int i;
    for (i = 0; i < len / sizeof(uint64_t); i++) {
        if (((uint64_t *)first)[i] != ((uint64_t *)second)[i]) {
            return false;
        }
    }

    for (int j = 8 * i; j < len; j++) {
        if (((uint8_t *)first)[j] != ((uint8_t *)second)[j]) {
            return false;
        }
    }

    return true;
}

enum ErrorCode InitializeReadPNG(const char *inputPath, FILE **fp, png_structp *png_ptr, png_infop *info_ptr)
{
    uint8_t header[8];

    *fp = fopen(inputPath, "rb");

    if (!fp) {
        fprintf(stderr, "Failed to open file '%s' for reading!\n", inputPath);
        return ERR_CODE_FAILED_OPEN_INPUT;
    }

    if (fread(header, 1, 8, *fp) != 8) {
        fprintf(stderr, "Couldn't read PNG signature from file '%s'!\n", inputPath);
        fclose(*fp);
        return ERR_CODE_INPUT_INVALID;
    }

    if (png_sig_cmp(header, 0, 8)) {
        fprintf(stderr, "Invalid PNG signature for file '%s'!\n", inputPath);
        fclose(*fp);
        return ERR_CODE_INVALID_FILE_TYPE;
    }

    *png_ptr = png_create_read_struct(PNG_LIBPNG_VER_STRING, NULL, NULL, NULL);

    if (!*png_ptr) {
        fprintf(stderr, "Failed to create libPNG read struct for file '%s'!\n", inputPath);
        fclose(*fp);
        return ERR_CODE_LIBPNG_ERROR;
    }

    *info_ptr = png_create_info_struct(*png_ptr);

    if (!*info_ptr) {
        png_destroy_read_struct(png_ptr, NULL, NULL);
        fprintf(stderr, "Failed to create libPNG info struct for file '%s'!\n", inputPath);
        fclose(*fp);
        return ERR_CODE_LIBPNG_ERROR;
    }

    if (setjmp(png_jmpbuf(*png_ptr))) {
        png_destroy_read_struct(png_ptr, info_ptr, NULL);
        fclose(*fp);
        return ERR_CODE_LIBPNG_ERROR;
    }

    png_init_io(*png_ptr, *fp);
    png_set_sig_bytes(*png_ptr, 8);
    return ERR_CODE_OK;
}

enum ErrorCode InitializeWritePNG(const char *outputPath, FILE **fp, png_structp *png_ptr, png_infop *info_ptr)
{
    *fp = fopen(outputPath, "wb");

    if (!fp) {
        fprintf(stderr, "Failed to open file '%s' for writing!\n", outputPath);
        return ERR_CODE_FAILED_OPEN_OUTPUT;
    }

    *png_ptr = png_create_write_struct(PNG_LIBPNG_VER_STRING, NULL, NULL, NULL);

    if (!png_ptr) {
        fprintf(stderr, "Failed to create libPNG write struct for file '%s'!\n", outputPath);
        fclose(*fp);
        return ERR_CODE_LIBPNG_ERROR;
    }

    *info_ptr = png_create_info_struct(*png_ptr);

    if (!*info_ptr) {
        png_destroy_write_struct(png_ptr, NULL);
        fclose(*fp);
        fprintf(stderr, "Failed to create libPNG info struct for file '%s'!\n", outputPath);
        return ERR_CODE_LIBPNG_ERROR;
    }

    if (setjmp(png_jmpbuf(*png_ptr))) {
        png_destroy_write_struct(png_ptr, info_ptr);
        fclose(*fp);
        return ERR_CODE_LIBPNG_ERROR;
    }

    png_init_io(*png_ptr, *fp);
    return ERR_CODE_OK;
}
