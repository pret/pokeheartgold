// Copyright (c) 2015 YamaArashi

#include "font.h"

#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "global.h"

#include "gfx.h"
#include "options.h"
#include "util.h"

unsigned char gFontPalette[][3] = {
    { 0x90, 0xC8, 0xFF }, // bg (saturated blue that contrasts well with the shadow color)
    { 0x38, 0x38, 0x38 }, // fg (dark grey)
    { 0xD8, 0xD8, 0xD8 }, // shadow (light grey)
    { 0xFF, 0xFF, 0xFF }  // box (white)
};

// special palette for DS subscreen font
unsigned char gFontPalette_Subscreen[][3] = {
    { 0x90, 0xC8, 0xFF }, // bg (saturated blue that contrasts well with the shadow color)
    { 0xFF, 0xFF, 0xFF }, // fg (white)
    { 0xD8, 0xD8, 0xD8 }, // shadow (light grey)
    { 0x38, 0x38, 0x38 }, // outline (dark grey)
};

static void ConvertFromLatinFont(unsigned char *src, unsigned char *dest, unsigned int numRows)
{
    unsigned int srcPixelsOffset = 0;

    for (unsigned int row = 0; row < numRows; row++) {
        for (unsigned int column = 0; column < 16; column++) {
            for (unsigned int glyphTile = 0; glyphTile < 4; glyphTile++) {
                unsigned int pixelsX = (column * 16) + ((glyphTile & 1) * 8);

                for (unsigned int i = 0; i < 8; i++) {
                    unsigned int pixelsY = (row * 16) + ((glyphTile >> 1) * 8) + i;
                    unsigned int destPixelsOffset = (pixelsY * 64) + (pixelsX / 4);

                    dest[destPixelsOffset] = src[srcPixelsOffset + 1];
                    dest[destPixelsOffset + 1] = src[srcPixelsOffset];

                    srcPixelsOffset += 2;
                }
            }
        }
    }
}

static void ConvertToLatinFont(unsigned char *src, unsigned char *dest, unsigned int numRows)
{
    unsigned int destPixelsOffset = 0;

    for (unsigned int row = 0; row < numRows; row++) {
        for (unsigned int column = 0; column < 16; column++) {
            for (unsigned int glyphTile = 0; glyphTile < 4; glyphTile++) {
                unsigned int pixelsX = (column * 16) + ((glyphTile & 1) * 8);

                for (unsigned int i = 0; i < 8; i++) {
                    unsigned int pixelsY = (row * 16) + ((glyphTile >> 1) * 8) + i;
                    unsigned int srcPixelsOffset = (pixelsY * 64) + (pixelsX / 4);

                    dest[destPixelsOffset] = src[srcPixelsOffset + 1];
                    dest[destPixelsOffset + 1] = src[srcPixelsOffset];

                    destPixelsOffset += 2;
                }
            }
        }
    }
}

static void ConvertFromHalfwidthJapaneseFont(unsigned char *src, unsigned char *dest, unsigned int numRows)
{
    for (unsigned int row = 0; row < numRows; row++) {
        for (unsigned int column = 0; column < 16; column++) {
            unsigned int glyphIndex = (row * 16) + column;

            for (unsigned int glyphTile = 0; glyphTile < 2; glyphTile++) {
                unsigned int pixelsX = column * 8;
                unsigned int srcPixelsOffset = 512 * (glyphIndex >> 4) + 16 * (glyphIndex & 0xF) + 256 * glyphTile;

                for (unsigned int i = 0; i < 8; i++) {
                    unsigned int pixelsY = (row * 16) + (glyphTile * 8) + i;
                    unsigned int destPixelsOffset = (pixelsY * 32) + (pixelsX / 4);

                    dest[destPixelsOffset] = src[srcPixelsOffset + 1];
                    dest[destPixelsOffset + 1] = src[srcPixelsOffset];

                    srcPixelsOffset += 2;
                }
            }
        }
    }
}

static void ConvertToHalfwidthJapaneseFont(unsigned char *src, unsigned char *dest, unsigned int numRows)
{
    for (unsigned int row = 0; row < numRows; row++) {
        for (unsigned int column = 0; column < 16; column++) {
            unsigned int glyphIndex = (row * 16) + column;

            for (unsigned int glyphTile = 0; glyphTile < 2; glyphTile++) {
                unsigned int pixelsX = column * 8;
                unsigned int destPixelsOffset = 512 * (glyphIndex >> 4) + 16 * (glyphIndex & 0xF) + 256 * glyphTile;

                for (unsigned int i = 0; i < 8; i++) {
                    unsigned int pixelsY = (row * 16) + (glyphTile * 8) + i;
                    unsigned int srcPixelsOffset = (pixelsY * 32) + (pixelsX / 4);

                    dest[destPixelsOffset] = src[srcPixelsOffset + 1];
                    dest[destPixelsOffset + 1] = src[srcPixelsOffset];

                    destPixelsOffset += 2;
                }
            }
        }
    }
}

static void ConvertFromFullwidthJapaneseFont(unsigned char *src, unsigned char *dest, unsigned int numRows)
{
    for (unsigned int row = 0; row < numRows; row++) {
        for (unsigned int column = 0; column < 16; column++) {
            unsigned int glyphIndex = (row * 16) + column;

            for (unsigned int glyphTile = 0; glyphTile < 4; glyphTile++) {
                unsigned int pixelsX = (column * 16) + ((glyphTile & 1) * 8);
                unsigned int srcPixelsOffset = 512 * (glyphIndex >> 3) + 32 * (glyphIndex & 7) + 256 * (glyphTile >> 1) + 16 * (glyphTile & 1);

                for (unsigned int i = 0; i < 8; i++) {
                    unsigned int pixelsY = (row * 16) + ((glyphTile >> 1) * 8) + i;
                    unsigned int destPixelsOffset = (pixelsY * 64) + (pixelsX / 4);

                    dest[destPixelsOffset] = src[srcPixelsOffset + 1];
                    dest[destPixelsOffset + 1] = src[srcPixelsOffset];

                    srcPixelsOffset += 2;
                }
            }
        }
    }
}

static void ConvertToFullwidthJapaneseFont(unsigned char *src, unsigned char *dest, unsigned int numRows)
{
    for (unsigned int row = 0; row < numRows; row++) {
        for (unsigned int column = 0; column < 16; column++) {
            unsigned int glyphIndex = (row * 16) + column;

            for (unsigned int glyphTile = 0; glyphTile < 4; glyphTile++) {
                unsigned int pixelsX = (column * 16) + ((glyphTile & 1) * 8);
                unsigned int destPixelsOffset = 512 * (glyphIndex >> 3) + 32 * (glyphIndex & 7) + 256 * (glyphTile >> 1) + 16 * (glyphTile & 1);

                for (unsigned int i = 0; i < 8; i++) {
                    unsigned int pixelsY = (row * 16) + ((glyphTile >> 1) * 8) + i;
                    unsigned int srcPixelsOffset = (pixelsY * 64) + (pixelsX / 4);

                    dest[destPixelsOffset] = src[srcPixelsOffset + 1];
                    dest[destPixelsOffset + 1] = src[srcPixelsOffset];

                    destPixelsOffset += 2;
                }
            }
        }
    }
}

static void ConvertFromNitroFont(unsigned char *src, unsigned char *dest, unsigned int numRows, struct NtrFontMetadata *metadata) {
    unsigned int srcPixelsOffset = 0;
    unsigned int curGlyph = 0;

    for (unsigned int row = 0; row < numRows; row++) {
        for (unsigned int column = 0; column < 16 && curGlyph < metadata->numGlyphs; column++, curGlyph++) {
            for (unsigned int glyphTile = 0; glyphTile < 4; glyphTile++) {
                unsigned int pixelsX = (column * 16) + ((glyphTile & 1) * 8);

                for (unsigned int i = 0; i < 8; i++) {
                    unsigned int pixelsY = (row * 16) + ((glyphTile >> 1) * 8) + i;
                    unsigned int destPixelsOffset = (pixelsY * 64) + (pixelsX / 4);

                    dest[destPixelsOffset] = src[srcPixelsOffset + 1];
                    dest[destPixelsOffset + 1] = src[srcPixelsOffset];

                    srcPixelsOffset += 2;
                }
            }
        }
    }
}

static void ConvertToNitroFont(unsigned char *src, unsigned char *dest, unsigned int numRows, struct NtrFontMetadata *metadata) {
    unsigned int destPixelsOffset = 0;
    unsigned int curGlyph = 0;

    for (unsigned int row = 0; row < numRows; row++) {
        for (unsigned int column = 0; column < 16 && curGlyph < metadata->numGlyphs; column++, curGlyph++) {
            for (unsigned int glyphTile = 0; glyphTile < 4; glyphTile++) {
                unsigned int pixelsX = (column * 16) + ((glyphTile & 1) * 8);

                for (unsigned int i = 0; i < 8; i++) {
                    unsigned int pixelsY = (row * 16) + ((glyphTile >> 1) * 8) + i;
                    unsigned int srcPixelsOffset = (pixelsY * 64) + (pixelsX / 4);

                    dest[destPixelsOffset] = src[srcPixelsOffset + 1];
                    dest[destPixelsOffset + 1] = src[srcPixelsOffset];

                    destPixelsOffset += 2;
                }
            }
        }
    }
}

static void SetFontPalette(struct Image *image)
{
    image->hasPalette = true;

    image->palette.numColors = 4;

    for (int i = 0; i < image->palette.numColors; i++) {
        image->palette.colors[i].red = gFontPalette[i][0];
        image->palette.colors[i].green = gFontPalette[i][1];
        image->palette.colors[i].blue = gFontPalette[i][2];
    }

    image->hasTransparency = false;
}

static void SetSubscreenFontPalette(struct Image *image) {
    image->hasPalette = true;

    image->palette.numColors = 4;

    for (int i = 0; i < image->palette.numColors; i++) {
        image->palette.colors[i].red = gFontPalette_Subscreen[i][0];
        image->palette.colors[i].green = gFontPalette_Subscreen[i][1];
        image->palette.colors[i].blue = gFontPalette_Subscreen[i][2];
    }

    image->hasTransparency = false;
}

void ReadLatinFont(char *path, struct Image *image)
{
    int fileSize;
    unsigned char *buffer = ReadWholeFile(path, &fileSize);

    int numGlyphs = fileSize / 64;

    if (numGlyphs % 16 != 0) {
        FATAL_ERROR("The number of glyphs (%d) is not a multiple of 16.\n", numGlyphs);
    }

    int numRows = numGlyphs / 16;

    image->width = 256;
    image->height = numRows * 16;
    image->bitDepth = 2;
    image->pixels = malloc(fileSize);

    if (image->pixels == NULL) {
        FATAL_ERROR("Failed to allocate memory for font.\n");
    }

    ConvertFromLatinFont(buffer, image->pixels, numRows);

    free(buffer);

    SetFontPalette(image);
}

void WriteLatinFont(char *path, struct Image *image)
{
    if (image->width != 256) {
        FATAL_ERROR("The width of the font image (%d) is not 256.\n", image->width);
    }

    if (image->height % 16 != 0) {
        FATAL_ERROR("The height of the font image (%d) is not a multiple of 16.\n", image->height);
    }

    int numRows = image->height / 16;
    int bufferSize = numRows * 16 * 64;
    unsigned char *buffer = malloc(bufferSize);

    if (buffer == NULL) {
        FATAL_ERROR("Failed to allocate memory for font.\n");
    }

    ConvertToLatinFont(image->pixels, buffer, numRows);

    WriteWholeFile(path, buffer, bufferSize);

    free(buffer);
}

void ReadHalfwidthJapaneseFont(char *path, struct Image *image)
{
    int fileSize;
    unsigned char *buffer = ReadWholeFile(path, &fileSize);

    int glyphSize = 32;

    if (fileSize % glyphSize != 0) {
        FATAL_ERROR("The file size (%d) is not a multiple of %d.\n", fileSize, glyphSize);
    }

    int numGlyphs = fileSize / glyphSize;

    if (numGlyphs % 16 != 0) {
        FATAL_ERROR("The number of glyphs (%d) is not a multiple of 16.\n", numGlyphs);
    }

    int numRows = numGlyphs / 16;

    image->width = 128;
    image->height = numRows * 16;
    image->bitDepth = 2;
    image->pixels = malloc(fileSize);

    if (image->pixels == NULL) {
        FATAL_ERROR("Failed to allocate memory for font.\n");
    }

    ConvertFromHalfwidthJapaneseFont(buffer, image->pixels, numRows);

    free(buffer);

    SetFontPalette(image);
}

void WriteHalfwidthJapaneseFont(char *path, struct Image *image)
{
    if (image->width != 128) {
        FATAL_ERROR("The width of the font image (%d) is not 128.\n", image->width);
    }

    if (image->height % 16 != 0) {
        FATAL_ERROR("The height of the font image (%d) is not a multiple of 16.\n", image->height);
    }

    int numRows = image->height / 16;
    int bufferSize = numRows * 16 * 32;
    unsigned char *buffer = malloc(bufferSize);

    if (buffer == NULL) {
        FATAL_ERROR("Failed to allocate memory for font.\n");
    }

    ConvertToHalfwidthJapaneseFont(image->pixels, buffer, numRows);

    WriteWholeFile(path, buffer, bufferSize);

    free(buffer);
}

void ReadFullwidthJapaneseFont(char *path, struct Image *image)
{
    int fileSize;
    unsigned char *buffer = ReadWholeFile(path, &fileSize);

    int numGlyphs = fileSize / 64;

    if (numGlyphs % 16 != 0) {
        FATAL_ERROR("The number of glyphs (%d) is not a multiple of 16.\n", numGlyphs);
    }

    int numRows = numGlyphs / 16;

    image->width = 256;
    image->height = numRows * 16;
    image->bitDepth = 2;
    image->pixels = malloc(fileSize);

    if (image->pixels == NULL) {
        FATAL_ERROR("Failed to allocate memory for font.\n");
    }

    ConvertFromFullwidthJapaneseFont(buffer, image->pixels, numRows);

    free(buffer);

    SetFontPalette(image);
}

void WriteFullwidthJapaneseFont(char *path, struct Image *image)
{
    if (image->width != 256) {
        FATAL_ERROR("The width of the font image (%d) is not 256.\n", image->width);
    }

    if (image->height % 16 != 0) {
        FATAL_ERROR("The height of the font image (%d) is not a multiple of 16.\n", image->height);
    }

    int numRows = image->height / 16;
    int bufferSize = numRows * 16 * 64;
    unsigned char *buffer = malloc(bufferSize);

    if (buffer == NULL) {
        FATAL_ERROR("Failed to allocate memory for font.\n");
    }

    ConvertToFullwidthJapaneseFont(image->pixels, buffer, numRows);

    WriteWholeFile(path, buffer, bufferSize);

    free(buffer);
}

static inline uint32_t ReadLittleEndianWord(unsigned char *buffer, size_t start) {
    return (buffer[start + 3] << 24)
        | (buffer[start + 2] << 16)
        | (buffer[start + 1] << 8)
        | (buffer[start]);
}

void ReadNtrFont(char *path, struct Image *image, struct NtrFontMetadata *metadata, bool useSubscreenPalette) {
    int filesize;
    unsigned char *buffer = ReadWholeFile(path, &filesize);

    metadata->size = ReadLittleEndianWord(buffer, 0x00);
    metadata->widthTableOffset = ReadLittleEndianWord(buffer, 0x04);
    metadata->numGlyphs = ReadLittleEndianWord(buffer, 0x08);
    metadata->maxWidth = buffer[0x0C];
    metadata->maxHeight = buffer[0x0D];
    metadata->glyphWidth = buffer[0x0E];
    metadata->glyphHeight = buffer[0x0F];

    int numRows = (metadata->numGlyphs + 15) / 16; // Round up to next multiple of 16.

    metadata->glyphWidthTable = malloc(metadata->numGlyphs);
    memcpy(metadata->glyphWidthTable, buffer + metadata->widthTableOffset, metadata->numGlyphs);

    image->width = 256;
    image->height = numRows * 16;
    image->bitDepth = 2;
    image->pixels = malloc(filesize);

    if (image->pixels == NULL) {
        FATAL_ERROR("Failed to allocate memory for font.\n");
    }

    ConvertFromNitroFont(buffer + metadata->size, image->pixels, numRows, metadata);

    free(buffer);

    if (useSubscreenPalette) {
        SetSubscreenFontPalette(image);
    } else {
        SetFontPalette(image);
    }
}

void WriteNtrFont(char *path, struct Image *image, struct NtrFontMetadata *metadata) {
    if (image->width != 256) {
        FATAL_ERROR("The width of the font image (%d) is not 256.\n", image->width);
    }

    if (image->height % 16 != 0) {
        FATAL_ERROR("The height of the font image (%d) is not a multiple of 16.\n", image->height);
    }

    int numRows = image->height / 16;
    int bufferSize = metadata->widthTableOffset + metadata->numGlyphs;
    unsigned char *buffer = malloc(bufferSize);

    if (buffer == NULL) {
        FATAL_ERROR("Failed to allocate memory for font.\n");
    }

    buffer[0x00] = (metadata->size & 0x000000FF);
    buffer[0x01] = (metadata->size & 0x0000FF00) >> 8;
    buffer[0x02] = (metadata->size & 0x00FF0000) >> 16;
    buffer[0x03] = (metadata->size & 0xFF000000) >> 24;
    buffer[0x04] = (metadata->widthTableOffset & 0x000000FF);
    buffer[0x05] = (metadata->widthTableOffset & 0x0000FF00) >> 8;
    buffer[0x06] = (metadata->widthTableOffset & 0x00FF0000) >> 16;
    buffer[0x07] = (metadata->widthTableOffset & 0xFF000000) >> 24;
    buffer[0x08] = (metadata->numGlyphs & 0x000000FF);
    buffer[0x09] = (metadata->numGlyphs & 0x0000FF00) >> 8;
    buffer[0x0A] = (metadata->numGlyphs & 0x00FF0000) >> 16;
    buffer[0x0B] = (metadata->numGlyphs & 0xFF000000) >> 24;
    buffer[0x0C] = metadata->maxWidth;
    buffer[0x0D] = metadata->maxHeight;
    buffer[0x0E] = metadata->glyphWidth;
    buffer[0x0F] = metadata->glyphHeight;

    ConvertToNitroFont(image->pixels, buffer + metadata->size, numRows, metadata);
    memcpy(buffer + metadata->widthTableOffset, metadata->glyphWidthTable, metadata->numGlyphs);

    WriteWholeFile(path, buffer, bufferSize);

    free(buffer);
}

void FreeNtrFontMetadata(struct NtrFontMetadata *metadata) {
    free(metadata->glyphWidthTable);
    free(metadata);
}
