// Copyright (c) 2015 YamaArashi, 2021-2024 red031000

#include "gfx.h"

#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "global.h"

#include "util.h"

static unsigned int FindNitroDataBlock(const unsigned char *data, const char *ident, unsigned int fileSize, unsigned int *blockSize_out) {
    unsigned int offset = 0x10;
    while (offset < fileSize) {
        unsigned int blockSize = data[offset + 4] | (data[offset + 5] << 8) | (data[offset + 6] << 16) | (data[offset + 7] << 24);
        if (offset + blockSize > fileSize) {
            FATAL_ERROR("corrupted NTR file");
        }
        if (memcmp(data + offset, ident, 4) == 0) {
            *blockSize_out = blockSize;
            return offset;
        }
        offset += blockSize;
    }
    return -1u;
}

#define GET_GBA_PAL_RED(x)   (((x) >> 0) & 0x1F)
#define GET_GBA_PAL_GREEN(x) (((x) >> 5) & 0x1F)
#define GET_GBA_PAL_BLUE(x)  (((x) >> 10) & 0x1F)

#define SET_GBA_PAL(r, g, b) (((b) << 10) | ((g) << 5) | (r))

#define UPCONVERT_BIT_DEPTH(x) (((x) * 255) / 31)

#define DOWNCONVERT_BIT_DEPTH(x) ((x) / 8)

static void AdvanceTilePosition(int *tilesSoFar, int *rowsSoFar, int *chunkStartX, int *chunkStartY, int chunksWide, int colsPerChunk, int rowsPerChunk) {
    (*tilesSoFar)++;
    if (*tilesSoFar == colsPerChunk) {
        *tilesSoFar = 0;
        (*rowsSoFar)++;
        if (*rowsSoFar == rowsPerChunk) {
            *rowsSoFar = 0;
            (*chunkStartX)++;
            if (*chunkStartX == chunksWide) {
                *chunkStartX = 0;
                (*chunkStartY)++;
            }
        }
    }
}

static void ConvertFromTiles1Bpp(unsigned char *src, unsigned char *dest, int numTiles, int chunksWide, int colsPerChunk, int rowsPerChunk, bool invertColors) {
    int tilesSoFar = 0;
    int rowsSoFar = 0;
    int chunkStartX = 0;
    int chunkStartY = 0;
    int pitch = chunksWide * colsPerChunk;

    for (int i = 0; i < numTiles; i++) {
        for (int j = 0; j < 8; j++) {
            int idxComponentY = (chunkStartY * rowsPerChunk + rowsSoFar) * 8 + j;
            int idxComponentX = chunkStartX * colsPerChunk + tilesSoFar;
            unsigned char srcPixelOctet = *src++;
            unsigned char *destPixelOctet = &dest[idxComponentY * pitch + idxComponentX];

            for (int k = 0; k < 8; k++) {
                *destPixelOctet <<= 1;
                *destPixelOctet |= (srcPixelOctet & 1) ^ invertColors;
                srcPixelOctet >>= 1;
            }
        }

        AdvanceTilePosition(&tilesSoFar, &rowsSoFar, &chunkStartX, &chunkStartY, chunksWide, colsPerChunk, rowsPerChunk);
    }
}

static void ConvertFromTiles4Bpp(unsigned char *src, unsigned char *dest, int numTiles, int chunksWide, int colsPerChunk, int rowsPerChunk, bool invertColors) {
    int tilesSoFar = 0;
    int rowsSoFar = 0;
    int chunkStartX = 0;
    int chunkStartY = 0;
    int pitch = (chunksWide * colsPerChunk) * 4;

    for (int i = 0; i < numTiles; i++) {
        for (int j = 0; j < 8; j++) {
            int idxComponentY = (chunkStartY * rowsPerChunk + rowsSoFar) * 8 + j;

            for (int k = 0; k < 4; k++) {
                int idxComponentX = (chunkStartX * colsPerChunk + tilesSoFar) * 4 + k;
                unsigned char srcPixelPair = *src++;
                unsigned char leftPixel = srcPixelPair & 0xF;
                unsigned char rightPixel = srcPixelPair >> 4;

                if (invertColors) {
                    leftPixel = 15 - leftPixel;
                    rightPixel = 15 - rightPixel;
                }

                dest[idxComponentY * pitch + idxComponentX] = (leftPixel << 4) | rightPixel;
            }
        }

        AdvanceTilePosition(&tilesSoFar, &rowsSoFar, &chunkStartX, &chunkStartY, chunksWide, colsPerChunk, rowsPerChunk);
    }
}

static uint32_t ConvertFromScanned4Bpp(unsigned char *src, unsigned char *dest, int fileSize, bool invertColours, bool scanFrontToBack) {
    uint32_t encValue = 0;
    if (scanFrontToBack) {
        encValue = (src[1] << 8) | src[0];
        for (int i = 0; i < fileSize; i += 2) {
            uint16_t val = src[i] | (src[i + 1] << 8);
            val ^= (encValue & 0xFFFF);
            src[i] = val;
            src[i + 1] = val >> 8;
            encValue = encValue * 1103515245;
            encValue = encValue + 24691;
        }
    } else {
        encValue = (src[fileSize - 1] << 8) | src[fileSize - 2];
        for (int i = fileSize; i > 0; i -= 2) {
            uint16_t val = (src[i - 1] << 8) | src[i - 2];
            val ^= (encValue & 0xFFFF);
            src[i - 1] = (val >> 8);
            src[i - 2] = val;
            encValue = encValue * 1103515245;
            encValue = encValue + 24691;
        }
    }
    for (int i = 0; i < fileSize; i++) {
        unsigned char srcPixelPair = src[i];
        unsigned char leftPixel = srcPixelPair & 0xF;
        unsigned char rightPixel = srcPixelPair >> 4;

        if (invertColours) {
            leftPixel = 15 - leftPixel;
            rightPixel = 15 - rightPixel;
        }

        dest[i] = (leftPixel << 4) | rightPixel;
    }
    return encValue;
}

static void ConvertFromTiles8Bpp(unsigned char *src, unsigned char *dest, int numTiles, int chunksWide, int colsPerChunk, int rowsPerChunk, bool invertColors) {
    int tilesSoFar = 0;
    int rowsSoFar = 0;
    int chunkStartX = 0;
    int chunkStartY = 0;
    int pitch = (chunksWide * colsPerChunk) * 8;

    for (int i = 0; i < numTiles; i++) {
        for (int j = 0; j < 8; j++) {
            int idxComponentY = (chunkStartY * rowsPerChunk + rowsSoFar) * 8 + j;

            for (int k = 0; k < 8; k++) {
                int idxComponentX = (chunkStartX * colsPerChunk + tilesSoFar) * 8 + k;
                unsigned char srcPixel = *src++;

                if (invertColors) {
                    srcPixel = 255 - srcPixel;
                }

                dest[idxComponentY * pitch + idxComponentX] = srcPixel;
            }
        }

        AdvanceTilePosition(&tilesSoFar, &rowsSoFar, &chunkStartX, &chunkStartY, chunksWide, colsPerChunk, rowsPerChunk);
    }
}

static uint32_t ConvertFromScanned8Bpp(unsigned char *src, unsigned char *dest, int fileSize, bool invertColours, bool scanFrontToBack) {
    uint32_t encValue = 0;
    if (scanFrontToBack) {
        encValue = (src[1] << 8) | src[0];
        for (int i = 0; i < fileSize; i += 2) {
            uint16_t val = src[i] | (src[i + 1] << 8);
            val ^= (encValue & 0xFFFF);
            src[i] = val;
            src[i + 1] = val >> 8;
            encValue = encValue * 1103515245;
            encValue = encValue + 24691;
        }
    } else {
        encValue = (src[fileSize - 1] << 8) | src[fileSize - 2];
        for (int i = fileSize; i > 0; i -= 2) {
            uint16_t val = (src[i - 1] << 8) | src[i - 2];
            val ^= (encValue & 0xFFFF);
            src[i - 1] = (val >> 8);
            src[i - 2] = val;
            encValue = encValue * 1103515245;
            encValue = encValue + 24691;
        }
    }
    for (int i = 0; i < fileSize; i++) {
        unsigned char srcPixel = src[i];

        if (invertColours) {
            srcPixel = 255 - srcPixel;
        }

        dest[i] = srcPixel;
    }
    return encValue;
}

static void ConvertToTiles1Bpp(unsigned char *src, unsigned char *dest, int numTiles, int chunksWide, int colsPerChunk, int rowsPerChunk, bool invertColors) {
    int tilesSoFar = 0;
    int rowsSoFar = 0;
    int chunkStartX = 0;
    int chunkStartY = 0;
    int pitch = chunksWide * colsPerChunk;

    for (int i = 0; i < numTiles; i++) {
        for (int j = 0; j < 8; j++) {
            int idxComponentY = (chunkStartY * rowsPerChunk + rowsSoFar) * 8 + j;
            int idxComponentX = chunkStartX * colsPerChunk + tilesSoFar;
            unsigned char srcPixelOctet = src[idxComponentY * pitch + idxComponentX];
            unsigned char *destPixelOctet = dest++;

            for (int k = 0; k < 8; k++) {
                *destPixelOctet <<= 1;
                *destPixelOctet |= (srcPixelOctet & 1) ^ invertColors;
                srcPixelOctet >>= 1;
            }
        }

        AdvanceTilePosition(&tilesSoFar, &rowsSoFar, &chunkStartX, &chunkStartY, chunksWide, colsPerChunk, rowsPerChunk);
    }
}

static void ConvertToTiles4Bpp(unsigned char *src, unsigned char *dest, int numTiles, int chunksWide, int colsPerChunk, int rowsPerChunk, bool invertColors) {
    int tilesSoFar = 0;
    int rowsSoFar = 0;
    int chunkStartX = 0;
    int chunkStartY = 0;
    int pitch = (chunksWide * colsPerChunk) * 4;

    for (int i = 0; i < numTiles; i++) {
        for (int j = 0; j < 8; j++) {
            int idxComponentY = (chunkStartY * rowsPerChunk + rowsSoFar) * 8 + j;

            for (int k = 0; k < 4; k++) {
                int idxComponentX = (chunkStartX * colsPerChunk + tilesSoFar) * 4 + k;
                unsigned char srcPixelPair = src[idxComponentY * pitch + idxComponentX];
                unsigned char leftPixel = srcPixelPair >> 4;
                unsigned char rightPixel = srcPixelPair & 0xF;

                if (invertColors) {
                    leftPixel = 15 - leftPixel;
                    rightPixel = 15 - rightPixel;
                }

                *dest++ = (rightPixel << 4) | leftPixel;
            }
        }

        AdvanceTilePosition(&tilesSoFar, &rowsSoFar, &chunkStartX, &chunkStartY, chunksWide, colsPerChunk, rowsPerChunk);
    }
}

static void ConvertToScanned4Bpp(unsigned char *src, unsigned char *dest, int fileSize, bool invertColours, uint32_t encValue, uint32_t scanMode) {
    for (int i = 0; i < fileSize; i++) {
        unsigned char srcPixelPair = src[i];
        unsigned char leftPixel = srcPixelPair & 0xF;
        unsigned char rightPixel = srcPixelPair >> 4;
        if (invertColours) {
            leftPixel = 15 - leftPixel;
            rightPixel = 15 - rightPixel;
        }
        dest[i] = (leftPixel << 4) | rightPixel;
    }

    if (scanMode == 2) { // front to back
        for (int i = fileSize - 1; i > 0; i -= 2) {
            uint16_t val = dest[i - 1] | (dest[i] << 8);
            encValue = (encValue - 24691) * 4005161829;
            val ^= (encValue & 0xFFFF);
            dest[i] = (val >> 8);
            dest[i - 1] = val;
        }
    } else if (scanMode == 1) {
        for (int i = 1; i < fileSize; i += 2) {
            uint16_t val = (dest[i] << 8) | dest[i - 1];
            encValue = (encValue - 24691) * 4005161829;
            val ^= (encValue & 0xFFFF);
            dest[i] = (val >> 8);
            dest[i - 1] = val;
        }
    }
}

static void ConvertToTiles8Bpp(unsigned char *src, unsigned char *dest, int numTiles, int chunksWide, int colsPerChunk, int rowsPerChunk, bool invertColors) {
    int tilesSoFar = 0;
    int rowsSoFar = 0;
    int chunkStartX = 0;
    int chunkStartY = 0;
    int pitch = (chunksWide * colsPerChunk) * 8;

    for (int i = 0; i < numTiles; i++) {
        for (int j = 0; j < 8; j++) {
            int idxComponentY = (chunkStartY * rowsPerChunk + rowsSoFar) * 8 + j;

            for (int k = 0; k < 8; k++) {
                int idxComponentX = (chunkStartX * colsPerChunk + tilesSoFar) * 8 + k;
                unsigned char srcPixel = src[idxComponentY * pitch + idxComponentX];

                if (invertColors) {
                    srcPixel = 255 - srcPixel;
                }

                *dest++ = srcPixel;
            }
        }

        AdvanceTilePosition(&tilesSoFar, &rowsSoFar, &chunkStartX, &chunkStartY, chunksWide, colsPerChunk, rowsPerChunk);
    }
}

void ReadImage(char *path, int tilesWide, int bitDepth, int colsPerChunk, int rowsPerChunk, struct Image *image, bool invertColors) {
    int tileSize = bitDepth * 8; // number of bytes per tile

    int fileSize;
    unsigned char *buffer = ReadWholeFile(path, &fileSize);

    int numTiles = fileSize / tileSize;

    int tilesTall = (numTiles + tilesWide - 1) / tilesWide;

    if (tilesWide % colsPerChunk != 0) {
        FATAL_ERROR("The width in tiles (%d) isn't a multiple of the specified tiles per row (%d)", tilesWide, colsPerChunk);
    }

    if (tilesTall % rowsPerChunk != 0) {
        FATAL_ERROR("The height in tiles (%d) isn't a multiple of the specified rows per chunk (%d)", tilesTall, rowsPerChunk);
    }

    image->width = tilesWide * 8;
    image->height = tilesTall * 8;
    image->bitDepth = bitDepth;
    image->pixels = calloc(tilesWide * tilesTall, tileSize);

    if (image->pixels == NULL) {
        FATAL_ERROR("Failed to allocate memory for pixels.\n");
    }

    int chunksWide = tilesWide / colsPerChunk; // how many chunks side-by-side are needed for the full width of the image

    switch (bitDepth) {
    case 1:
        ConvertFromTiles1Bpp(buffer, image->pixels, numTiles, chunksWide, colsPerChunk, rowsPerChunk, invertColors);
        break;
    case 4:
        ConvertFromTiles4Bpp(buffer, image->pixels, numTiles, chunksWide, colsPerChunk, rowsPerChunk, invertColors);
        break;
    case 8:
        ConvertFromTiles8Bpp(buffer, image->pixels, numTiles, chunksWide, colsPerChunk, rowsPerChunk, invertColors);
        break;
    }

    free(buffer);
}

uint32_t ReadNtrImage(char *path, int tilesWide, int bitDepth, int colsPerChunk, int rowsPerChunk, struct Image *image, bool invertColors, bool scanFrontToBack) {
    int fileSize;
    unsigned char *buffer = ReadWholeFile(path, &fileSize);

    if (memcmp(buffer, "RGCN", 4) != 0) {
        FATAL_ERROR("Not a valid NCGR character file.\n");
    }

    unsigned char *charHeader = buffer + 0x10;

    if (memcmp(charHeader, "RAHC", 4) != 0) {
        FATAL_ERROR("No valid CHAR file after NCLR header.\n");
    }

    bitDepth = bitDepth ? bitDepth : (charHeader[0xC] == 3 ? 4 : 8);

    if (bitDepth == 4) {
        image->palette.numColors = 16;
    }

    unsigned char *imageData = charHeader + 0x20;

    bool scanned = charHeader[0x14];

    int tileSize = bitDepth * 8; // number of bytes per tile

    if (tilesWide == 0) {
        tilesWide = ReadS16(charHeader, 0xA);
        if (tilesWide < 0) {
            tilesWide = 1;
        }
    }

    int numTiles = ReadS32(charHeader, 0x18) / (64 / (8 / bitDepth));

    int tilesTall = ReadS16(charHeader, 0x8);
    if (tilesTall < 0) {
        tilesTall = (numTiles + tilesWide - 1) / tilesWide;
    }

    if (tilesWide % colsPerChunk != 0) {
        FATAL_ERROR("The width in tiles (%d) isn't a multiple of the specified tiles per row (%d)", tilesWide, colsPerChunk);
    }

    if (tilesTall % rowsPerChunk != 0) {
        FATAL_ERROR("The height in tiles (%d) isn't a multiple of the specified rows per chunk (%d)", tilesTall, rowsPerChunk);
    }

    image->width = tilesWide * 8;
    image->height = tilesTall * 8;
    image->bitDepth = bitDepth;
    image->pixels = calloc(tilesWide * tilesTall, tileSize);

    if (image->pixels == NULL) {
        FATAL_ERROR("Failed to allocate memory for pixels.\n");
    }

    int chunksWide = tilesWide / colsPerChunk; // how many chunks side-by-side are needed for the full width of the image

    uint32_t key = 0;
    if (scanned) {
        switch (bitDepth) {
        case 4:
            key = ConvertFromScanned4Bpp(imageData, image->pixels, fileSize - 0x30, invertColors, scanFrontToBack);
            break;
        case 8:
            key = ConvertFromScanned8Bpp(imageData, image->pixels, fileSize - 0x30, invertColors, scanFrontToBack);
            break;
        }
    } else {
        switch (bitDepth) {
        case 4:
            ConvertFromTiles4Bpp(imageData, image->pixels, numTiles, chunksWide, colsPerChunk, rowsPerChunk, invertColors);
            break;
        case 8:
            ConvertFromTiles8Bpp(imageData, image->pixels, numTiles, chunksWide, colsPerChunk, rowsPerChunk, invertColors);
            break;
        }
    }

    free(buffer);
    return key;
}

void WriteImage(char *path, int numTiles, int bitDepth, int colsPerChunk, int rowsPerChunk, struct Image *image, bool invertColors) {
    int tileSize = bitDepth * 8; // number of bytes per tile

    if (image->width % 8 != 0) {
        FATAL_ERROR("The width in pixels (%d) isn't a multiple of 8.\n", image->width);
    }

    if (image->height % 8 != 0) {
        FATAL_ERROR("The height in pixels (%d) isn't a multiple of 8.\n", image->height);
    }

    int tilesWide = image->width / 8;  // how many tiles wide the image is
    int tilesTall = image->height / 8; // how many tiles tall the image is

    if (tilesWide % colsPerChunk != 0) {
        FATAL_ERROR("The width in tiles (%d) isn't a multiple of the specified tiles per row (%d)", tilesWide, colsPerChunk);
    }

    if (tilesTall % rowsPerChunk != 0) {
        FATAL_ERROR("The height in tiles (%d) isn't a multiple of the specified rows per chunk (%d)", tilesTall, rowsPerChunk);
    }

    int maxNumTiles = tilesWide * tilesTall;

    if (numTiles == 0) {
        numTiles = maxNumTiles;
    } else if (numTiles > maxNumTiles) {
        FATAL_ERROR("The specified number of tiles (%d) is greater than the maximum possible value (%d).\n", numTiles, maxNumTiles);
    }

    int bufferSize = numTiles * tileSize;
    unsigned char *buffer = malloc(bufferSize);

    if (buffer == NULL) {
        FATAL_ERROR("Failed to allocate memory for pixels.\n");
    }

    int chunksWide = tilesWide / colsPerChunk; // how many chunks side-by-side are needed for the full width of the image

    switch (bitDepth) {
    case 1:
        ConvertToTiles1Bpp(image->pixels, buffer, numTiles, chunksWide, colsPerChunk, rowsPerChunk, invertColors);
        break;
    case 4:
        ConvertToTiles4Bpp(image->pixels, buffer, numTiles, chunksWide, colsPerChunk, rowsPerChunk, invertColors);
        break;
    case 8:
        ConvertToTiles8Bpp(image->pixels, buffer, numTiles, chunksWide, colsPerChunk, rowsPerChunk, invertColors);
        break;
    }

    WriteWholeFile(path, buffer, bufferSize);

    free(buffer);
}

void WriteNtrImage(char *path, int numTiles, int bitDepth, int colsPerChunk, int rowsPerChunk, struct Image *image, bool invertColors, bool clobberSize, bool byteOrder, bool version101, bool sopc, bool vram, uint32_t scanMode, uint32_t mappingType, uint32_t key, bool wrongSize) {
    FILE *fp = fopen(path, "wb");

    if (fp == NULL) {
        FATAL_ERROR("Failed to open \"%s\" for writing.\n", path);
    }

    int tileSize = bitDepth * 8; // number of bytes per tile

    if (image->width % 8 != 0) {
        FATAL_ERROR("The width in pixels (%d) isn't a multiple of 8.\n", image->width);
    }

    if (image->height % 8 != 0) {
        FATAL_ERROR("The height in pixels (%d) isn't a multiple of 8.\n", image->height);
    }

    int tilesWide = image->width / 8;  // how many tiles wide the image is
    int tilesTall = image->height / 8; // how many tiles tall the image is

    if (tilesWide % colsPerChunk != 0) {
        FATAL_ERROR("The width in tiles (%d) isn't a multiple of the specified tiles per row (%d)", tilesWide, colsPerChunk);
    }

    if (tilesTall % rowsPerChunk != 0) {
        FATAL_ERROR("The height in tiles (%d) isn't a multiple of the specified rows per chunk (%d)", tilesTall, rowsPerChunk);
    }

    int maxNumTiles = tilesWide * tilesTall;

    if (numTiles == 0) {
        numTiles = maxNumTiles;
    } else if (numTiles > maxNumTiles) {
        FATAL_ERROR("The specified number of tiles (%d) is greater than the maximum possible value (%d).\n", numTiles, maxNumTiles);
    }

    int bufferSize = numTiles * tileSize;
    unsigned char *pixelBuffer = malloc(bufferSize);

    if (pixelBuffer == NULL) {
        FATAL_ERROR("Failed to allocate memory for pixels.\n");
    }

    int chunksWide = tilesWide / colsPerChunk; // how many chunks side-by-side are needed for the full width of the image

    if (scanMode) {
        switch (bitDepth) {
        case 4:
            ConvertToScanned4Bpp(image->pixels, pixelBuffer, bufferSize, invertColors, key, scanMode);
            break;
        case 8:
            FATAL_ERROR("8Bpp not supported yet.\n");
            break;
        }
    } else {
        switch (bitDepth) {
        case 4:
            ConvertToTiles4Bpp(image->pixels, pixelBuffer, numTiles, chunksWide, colsPerChunk, rowsPerChunk, invertColors);
            break;
        case 8:
            ConvertToTiles8Bpp(image->pixels, pixelBuffer, numTiles, chunksWide, colsPerChunk, rowsPerChunk, invertColors);
            break;
        }
    }

    WriteGenericNtrHeader(fp, "RGCN", bufferSize + (sopc ? 0x30 : 0x20) + (wrongSize ? -8 : 0), byteOrder, version101, sopc ? 2 : 1);

    unsigned char charHeader[0x20] = { 0x52, 0x41, 0x48, 0x43, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00 };

    charHeader[4] = (bufferSize + 0x20 + (wrongSize ? -8 : 0)) & 0xFF;
    charHeader[5] = ((bufferSize + 0x20 + (wrongSize ? -8 : 0)) >> 8) & 0xFF;
    charHeader[6] = ((bufferSize + 0x20 + (wrongSize ? -8 : 0)) >> 16) & 0xFF;
    charHeader[7] = ((bufferSize + 0x20 + (wrongSize ? -8 : 0)) >> 24) & 0xFF;

    if (!clobberSize) {
        charHeader[8] = tilesTall & 0xFF;
        charHeader[9] = (tilesTall >> 8) & 0xFF;

        charHeader[10] = tilesWide & 0xFF;
        charHeader[11] = (tilesWide >> 8) & 0xFF;
    } else {
        charHeader[8] = 0xFF;
        charHeader[9] = 0xFF;
        charHeader[10] = 0xFF;
        charHeader[11] = 0xFF;

        charHeader[16] = 0x10; // size clobbering implies mapping type is some variant of 1d - *should* have a mapping type that's not 0

        if (mappingType == 0) {
            mappingType = 32; // if not specified assume that it is 32k
        }
    }

    charHeader[12] = bitDepth == 4 ? 3 : 4;

    if (mappingType != 0) {
        uint32_t val = 0;
        switch (mappingType) {
        case 32:
            val = 0;
            break;
        case 64:
            val = 0x10;
            break;
        case 128:
            val = 0x20;
            break;
        case 256:
            val = 0x30;
            break;
        default:
            FATAL_ERROR("Invalid mapping type %d\n", mappingType);
            break;
        }

        charHeader[18] = val;
    }

    if (scanMode) {
        charHeader[20] = 1; // implies BMP
    }

    if (vram) {
        charHeader[21] = 1; // implies VRAM transfer
    }

    charHeader[24] = bufferSize & 0xFF;
    charHeader[25] = (bufferSize >> 8) & 0xFF;
    charHeader[26] = (bufferSize >> 16) & 0xFF;
    charHeader[27] = (bufferSize >> 24) & 0xFF;

    fwrite(charHeader, 1, 0x20, fp);

    fwrite(pixelBuffer, 1, bufferSize, fp);

    if (sopc) {
        unsigned char sopcBuffer[0x10] = { 0x53, 0x4F, 0x50, 0x43, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 };

        sopcBuffer[12] = tilesWide & 0xFF;
        sopcBuffer[13] = (tilesWide >> 8) & 0xFF;

        sopcBuffer[14] = tilesTall & 0xFF;
        sopcBuffer[15] = (tilesTall >> 8) & 0xFF;

        fwrite(sopcBuffer, 1, 0x10, fp);
    }

    free(pixelBuffer);
    fclose(fp);
}

void FreeImage(struct Image *image) {
    free(image->pixels);
    image->pixels = NULL;
}

void ReadGbaPalette(char *path, struct Palette *palette) {
    int fileSize;
    unsigned char *data = ReadWholeFile(path, &fileSize);

    if (fileSize % 2 != 0) {
        FATAL_ERROR("The file size (%d) is not a multiple of 2.\n", fileSize);
    }

    palette->numColors = fileSize / 2;

    for (int i = 0; i < palette->numColors; i++) {
        uint16_t paletteEntry = (data[i * 2 + 1] << 8) | data[i * 2];
        palette->colors[i].red = UPCONVERT_BIT_DEPTH(GET_GBA_PAL_RED(paletteEntry));
        palette->colors[i].green = UPCONVERT_BIT_DEPTH(GET_GBA_PAL_GREEN(paletteEntry));
        palette->colors[i].blue = UPCONVERT_BIT_DEPTH(GET_GBA_PAL_BLUE(paletteEntry));
    }

    free(data);
}

void ReadNtrPalette(char *path, struct Palette *palette, int bitdepth, int palIndex, bool inverted) {
    int fileSize;
    unsigned char *data = ReadWholeFile(path, &fileSize);

    if (memcmp(data, "RLCN", 4) != 0 && memcmp(data, "RPCN", 4) != 0) // NCLR / NCPR
    {
        FATAL_ERROR("Not a valid NCLR or NCPR palette file.\n");
    }

    unsigned char *paletteHeader = data + 0x10;

    if (memcmp(paletteHeader, "TTLP", 4) != 0) {
        FATAL_ERROR("No valid PLTT file after NCLR header.\n");
    }

    if ((fileSize - 0x28) % 2 != 0) {
        FATAL_ERROR("The file size (%d) is not a multiple of 2.\n", fileSize);
    }

    palette->bitDepth = paletteHeader[0x8] == 3 ? 4 : 8;

    bitdepth = bitdepth ? bitdepth : palette->bitDepth;

    size_t paletteSize = (paletteHeader[0x10]) | (paletteHeader[0x11] << 8) | (paletteHeader[0x12] << 16) | (paletteHeader[0x13] << 24);
    if (inverted) {
        paletteSize = 0x200 - paletteSize;
    }
    if (palIndex == 0) {
        palette->numColors = paletteSize / 2;
    } else {
        palette->numColors = bitdepth == 4 ? 16 : 256; // remove header and divide by 2
        --palIndex;
    }

    unsigned char *paletteData = paletteHeader + 0x18;

    for (int i = 0; i < 256; i++) {
        if (i < palette->numColors) {
            uint16_t paletteEntry = (paletteData[(32 * palIndex) + i * 2 + 1] << 8) | paletteData[(32 * palIndex) + i * 2];
            palette->colors[i].red = UPCONVERT_BIT_DEPTH(GET_GBA_PAL_RED(paletteEntry));
            palette->colors[i].green = UPCONVERT_BIT_DEPTH(GET_GBA_PAL_GREEN(paletteEntry));
            palette->colors[i].blue = UPCONVERT_BIT_DEPTH(GET_GBA_PAL_BLUE(paletteEntry));
        } else {
            palette->colors[i].red = 0;
            palette->colors[i].green = 0;
            palette->colors[i].blue = 0;
        }
    }

    free(data);
}

void WriteGbaPalette(char *path, struct Palette *palette) {
    FILE *fp = fopen(path, "wb");

    if (fp == NULL) {
        FATAL_ERROR("Failed to open \"%s\" for writing.\n", path);
    }

    for (int i = 0; i < palette->numColors; i++) {
        unsigned char red = DOWNCONVERT_BIT_DEPTH(palette->colors[i].red);
        unsigned char green = DOWNCONVERT_BIT_DEPTH(palette->colors[i].green);
        unsigned char blue = DOWNCONVERT_BIT_DEPTH(palette->colors[i].blue);

        uint16_t paletteEntry = SET_GBA_PAL(red, green, blue);

        fputc(paletteEntry & 0xFF, fp);
        fputc(paletteEntry >> 8, fp);
    }

    fclose(fp);
}

void WriteNtrPalette(char *path, struct Palette *palette, bool ncpr, bool ir, int bitdepth, bool pad, int compNum, bool pcmp, bool inverted) {
    FILE *fp = fopen(path, "wb");

    if (fp == NULL) {
        FATAL_ERROR("Failed to open \"%s\" for writing.\n", path);
    }

    int colourNum = pad ? 256 : palette->numColors;

    uint32_t size = colourNum * 2; // todo check if there's a better way to detect :/
    uint32_t extSize = size + (ncpr ? 0x10 : 0x18);

    int numSections = 1;
    int pcmpColorNum = 0;
    uint32_t pcmpSize = 0;
    if (pcmp) {
        pcmpColorNum = colourNum / (bitdepth == 4 ? 16 : 256);
        if (pcmpColorNum == 0) {
            FATAL_ERROR("colourNum=%d palette->bitDepth=%d\n", colourNum, bitdepth);
        }
        pcmpSize = 16 + pcmpColorNum * 2;
        ++numSections;
    }

    // NCLR header
    WriteGenericNtrHeader(fp, (ncpr ? "RPCN" : "RLCN"), extSize + pcmpSize, !ncpr, false, numSections);

    unsigned char palHeader[0x18] = {
        0x54, 0x54, 0x4C, 0x50, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00
    };

    // section size
    palHeader[4] = extSize & 0xFF;
    palHeader[5] = (extSize >> 8) & 0xFF;
    palHeader[6] = (extSize >> 16) & 0xFF;
    palHeader[7] = (extSize >> 24) & 0xFF;

    if (!palette->bitDepth) {
        palette->bitDepth = 4;
    }

    bitdepth = bitdepth ? bitdepth : palette->bitDepth;

    // bit depth
    palHeader[8] = bitdepth == 4 ? 0x03 : 0x04;

    if (compNum) {
        palHeader[10] = compNum; // assuming this is an indicator of compression, literally no docs for it though
    }

    // size
    int colorSize = inverted ? 0x200 - size : size;
    palHeader[16] = colorSize & 0xFF;
    palHeader[17] = (colorSize >> 8) & 0xFF;
    palHeader[18] = (colorSize >> 16) & 0xFF;
    palHeader[19] = (colorSize >> 24) & 0xFF;

    fwrite(palHeader, 1, 0x18, fp);

    unsigned char *colours = malloc(colourNum * 2);
    // palette data
    for (int i = 0; i < colourNum; i++) {
        if (i < palette->numColors) {
            unsigned char red = DOWNCONVERT_BIT_DEPTH(palette->colors[i].red);
            unsigned char green = DOWNCONVERT_BIT_DEPTH(palette->colors[i].green);
            unsigned char blue = DOWNCONVERT_BIT_DEPTH(palette->colors[i].blue);

            uint16_t paletteEntry = SET_GBA_PAL(red, green, blue);

            colours[i * 2] = paletteEntry & 0xFF;
            colours[i * 2 + 1] = paletteEntry >> 8;
        } else {
            colours[i * 2] = 0x00;
            colours[i * 2 + 1] = 0x00;
        }
    }

    if (ir) {
        colours[colourNum * 2 - 2] = 'I';
        colours[colourNum * 2 - 1] = 'R';
    }

    fwrite(colours, 1, colourNum * 2, fp);
    free(colours);

    if (pcmp) {
        uint8_t pcmp_header[16] = { 0x50, 0x4D, 0x43, 0x50, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xEF, 0xBE, 0x08, 0x00, 0x00, 0x00 };
        pcmp_header[4] = pcmpSize & 0xFF;
        pcmp_header[5] = (pcmpSize >> 8) & 0xFF;
        pcmp_header[6] = (pcmpSize >> 16) & 0xFF;
        pcmp_header[7] = (pcmpSize >> 24) & 0xFF;
        pcmp_header[8] = pcmpColorNum & 0xFF;
        pcmp_header[9] = (pcmpColorNum >> 8) & 0xFF;
        fwrite(pcmp_header, 1, 16, fp);

        uint8_t *pcmp_data = malloc(2 * pcmpColorNum);
        if (pcmp_data == NULL) {
            FATAL_ERROR("failed to alloc pcmp_data\n");
        }
        for (int i = 0; i < pcmpColorNum; ++i) {
            pcmp_data[i * 2] = i & 0xFF;
            pcmp_data[i * 2 + 1] = (i >> 8) & 0xFF;
        }
        fwrite(pcmp_data, 1, pcmpColorNum * 2, fp);
        free(pcmp_data);
    }

    fclose(fp);
}

void ReadNtrCell_CEBK(unsigned char *restrict data, unsigned int blockOffset, unsigned int blockSize, struct JsonToCellOptions *options) {
    options->cellCount = data[blockOffset + 0x8] | (data[blockOffset + 0x9] << 8);
    options->extended = data[blockOffset + 0xA] == 1;

    int vramTransferOffset = (data[blockOffset + 0x14] | data[blockOffset + 0x15] << 8);
    options->vramTransferEnabled = vramTransferOffset > 0;
    /*if (!options->extended)
    {
        //in theory not extended should be implemented, however not 100% sure
        FATAL_ERROR("Don't know how to deal with not extended yet, bug red031000.\n");
    }*/

    options->mappingType = data[blockOffset + 0x10];

    options->cells = malloc(sizeof(struct Cell *) * options->cellCount);
    int celSize = options->extended ? 0x10 : 0x8;

    for (int i = 0; i < options->cellCount; i++) {
        int offset = blockOffset + 0x20 + (i * celSize);
        if (offset + celSize > blockOffset + blockSize) {
            FATAL_ERROR("corrupted CEBK block\n");
        }
        options->cells[i] = malloc(sizeof(struct Cell));
        options->cells[i]->oamCount = data[offset] | (data[offset + 1] << 8);
        short cellAttrs = data[offset + 2] | (data[offset + 3] << 8);
        options->cells[i]->attributes.hFlip = (cellAttrs >> 8) & 1;
        options->cells[i]->attributes.vFlip = (cellAttrs >> 9) & 1;
        options->cells[i]->attributes.hvFlip = (cellAttrs >> 10) & 1;
        options->cells[i]->attributes.boundingRect = (cellAttrs >> 11) & 1;
        options->cells[i]->attributes.boundingSphereRadius = cellAttrs & 0x3F;

        if (options->extended) {
            options->cells[i]->maxX = data[offset + 8] | (data[offset + 9] << 8);
            options->cells[i]->maxY = data[offset + 10] | (data[offset + 11] << 8);
            options->cells[i]->minX = data[offset + 12] | (data[offset + 13] << 8);
            options->cells[i]->minY = data[offset + 14] | (data[offset + 15] << 8);
        }
    }

    int offset = blockOffset + 0x20 + (options->cellCount * celSize);
    for (int i = 0; i < options->cellCount; i++) {
        options->cells[i]->oam = malloc(sizeof(struct OAM) * options->cells[i]->oamCount);
        for (int j = 0; j < options->cells[i]->oamCount; j++) {
            // Attr0

            // bits 0-7 Y coordinate
            options->cells[i]->oam[j].attr0.YCoordinate = data[offset];

            // bit 8 rotation
            options->cells[i]->oam[j].attr0.Rotation = data[offset + 1] & 1;

            // bit 9 Obj Size (if rotation) or Obj Disable (if not rotation)
            options->cells[i]->oam[j].attr0.SizeDisable = (data[offset + 1] >> 1) & 1;

            // bits 10-11 Obj Mode
            options->cells[i]->oam[j].attr0.Mode = (data[offset + 1] >> 2) & 3;

            // bit 12 Obj Mosaic
            options->cells[i]->oam[j].attr0.Mosaic = (data[offset + 1] >> 4) & 1;

            // bit 13 Colours
            options->cells[i]->oam[j].attr0.Colours = ((data[offset + 1] >> 5) & 1) == 0 ? 16 : 256;

            // bits 14-15 Obj Shape
            options->cells[i]->oam[j].attr0.Shape = (data[offset + 1] >> 6) & 3;

            // Attr1

            // bits 0-8 X coordinate
            options->cells[i]->oam[j].attr1.XCoordinate = data[offset + 2] | ((data[offset + 3] & 1) << 8);

            // bits 9-13 Rotation and scaling (if rotation) bit 12 Horizontal flip, bit 13 Vertical flip (if not rotation)
            options->cells[i]->oam[j].attr1.RotationScaling = (data[offset + 3] >> 1) & 0x1F;

            // bits 14-15 Obj Size
            options->cells[i]->oam[j].attr1.Size = (data[offset + 3] >> 6) & 3;

            // Attr2

            // bits 0-9 Character Name?
            options->cells[i]->oam[j].attr2.CharName = data[offset + 4] | ((data[offset + 5] & 3) << 8);

            // bits 10-11 Priority
            options->cells[i]->oam[j].attr2.Priority = (data[offset + 5] >> 2) & 3;

            // bits 12-15 Palette Number
            options->cells[i]->oam[j].attr2.Palette = (data[offset + 5] >> 4) & 0xF;

            offset += 6;
        }
    }

    if (options->vramTransferEnabled) {
        offset = blockOffset + 0x08 + vramTransferOffset;

        // first 2 dwords are max size and offset, offset *should* always be 0x08 since the transfer data list immediately follows this
        options->vramTransferMaxSize = data[offset] | (data[offset + 1] << 8) | (data[offset + 2] << 16) | (data[offset + 3] << 24);
        offset += 0x08;

        // read 1 VRAM transfer data block for each cell (this is an assumption based on the NCERs I looked at)
        options->transferData = malloc(sizeof(struct CellVramTransferData *) * options->cellCount);
        for (int idx = 0; idx < options->cellCount; idx++) {
            options->transferData[idx] = malloc(sizeof(struct CellVramTransferData));
            options->transferData[idx]->sourceDataOffset = data[offset] | (data[offset + 1] << 8) | (data[offset + 2] << 16) | (data[offset + 3] << 24);
            options->transferData[idx]->size = data[offset + 4] | (data[offset + 5] << 8) | (data[offset + 6] << 16) | (data[offset + 7] << 24);
            offset += 8;
        }
    }
}

void ReadNtrCell_LABL(unsigned char *restrict data, unsigned int blockOffset, unsigned int blockSize, struct JsonToCellOptions *options) {
    int count = 0;
    unsigned int textStart = blockOffset + 8;
    while (textStart < blockOffset + blockSize) {
        unsigned int labelOffset = data[textStart] | (data[textStart + 1] << 8) | (data[textStart + 2] << 16) | (data[textStart + 3] << 24);
        if (labelOffset > blockSize) {
            break;
        } else {
            ++count;
            textStart += 4;
        }
    }
    options->labelCount = count;
    options->labels = malloc(sizeof(char *) * count);
    for (int i = 0; i < count; ++i) {
        int offset = textStart + (data[blockOffset + 4 * i + 8] | (data[blockOffset + 4 * i + 9] << 8) | (data[blockOffset + 4 * i + 10] << 16) | (data[blockOffset + 4 * i + 11] << 24));
        if (offset > blockOffset + blockSize) {
            FATAL_ERROR("corrupted LABL block\n");
        }
        unsigned long slen = strnlen((char *)data + offset, blockSize - offset);
        options->labels[i] = malloc(slen + 1);
        strncpy(options->labels[i], (char *)data + offset, slen + 1);
    }
}

void ReadNtrCell(char *path, struct JsonToCellOptions *options) {
    int fileSize;
    unsigned char *data = ReadWholeFile(path, &fileSize);
    unsigned int offset = 0x10;

    if (memcmp(data, "RECN", 4) != 0) // NCER
    {
        FATAL_ERROR("Not a valid NCER cell file.\n");
    }

    options->labelEnabled = false;

    unsigned int blockSize;
    offset = FindNitroDataBlock(data, "KBEC", fileSize, &blockSize);
    if (offset != -1u) {
        ReadNtrCell_CEBK(data, offset, blockSize, options);
    } else {
        FATAL_ERROR("missing CEBK block");
    }
    offset = FindNitroDataBlock(data, "LBAL", fileSize, &blockSize);
    if (offset != -1u) {
        options->labelEnabled = true;
        ReadNtrCell_LABL(data, offset, blockSize, options);
    }

    free(data);
}

void WriteNtrCell(char *path, struct JsonToCellOptions *options) {
    FILE *fp = fopen(path, "wb");

    if (fp == NULL) {
        FATAL_ERROR("Failed to open \"%s\" for writing.\n", path);
    }

    int iterNum = (options->extended ? 0x10 : 0x8);

    // KBEC base size: 0x08 per bank, or 0x10 per extended bank
    unsigned int kbecSize = options->cellCount * (options->extended ? 0x10 : 0x08);
    // if VRAM transfer is enabled, add 0x08 for the header and 0x08 for each cell
    if (options->vramTransferEnabled) {
        kbecSize += 0x08 + (0x08 * options->cellCount);
    }
    // add 0x06 for number of OAMs - can be more than 1
    for (int idx = 0; idx < options->cellCount * iterNum; idx += iterNum) {
        kbecSize += options->cells[idx / iterNum]->oamCount * 0x06;
    }

    // KBEC size is padded to be 4-byte aligned
    kbecSize += kbecSize % 4;

    unsigned int totalSize = (options->labelEnabled > 0 ? 0x34 : 0x20) + kbecSize;

    if (options->labelEnabled) {
        for (int j = 0; j < options->labelCount; j++) {
            totalSize += (unsigned)strlen(options->labels[j]) + 5; // strlen + terminator + pointer
        }
    }

    WriteGenericNtrHeader(fp, "RECN", totalSize, true, false, options->labelEnabled ? 3 : 1);

    unsigned char KBECHeader[0x20] = {
        0x4B, 0x42, 0x45, 0x43, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    };

    KBECHeader[8] = options->cellCount; // cell count

    if (options->extended) {
        KBECHeader[10] = 1; // extended
    }

    KBECHeader[4] = (kbecSize + 0x20) & 0xFF; // size
    KBECHeader[5] = (kbecSize + 0x20) >> 8;   // unlikely to be more than 16 bits, but there are 32 allocated, change if necessary

    KBECHeader[16] = (options->mappingType & 0xFF); // not possible to be more than 8 bits, though 32 are allocated

    // offset to VRAM transfer data within KBEC section (offset from KBEC start + 0x08)
    if (options->vramTransferEnabled) {
        unsigned int vramTransferLength = 0x08 + (0x08 * options->cellCount);
        unsigned int vramTransferOffset = (kbecSize + 0x20) - vramTransferLength - 0x08;
        KBECHeader[20] = vramTransferOffset & 0xFF;
        KBECHeader[21] = (vramTransferOffset >> 8) & 0xFF;
        KBECHeader[22] = (vramTransferOffset >> 16) & 0xFF;
        KBECHeader[23] = (vramTransferOffset >> 24) & 0xFF;
    }

    fwrite(KBECHeader, 1, 0x20, fp);

    unsigned char *KBECContents = malloc(kbecSize);

    memset(KBECContents, 0, kbecSize);

    /*if (!options->extended)
    {
        //in theory not extended should be implemented, however not 100% sure
        FATAL_ERROR("Don't know how to deal with not extended yet, bug red031000.\n");
    }*/

    int i;
    int totalOam = 0;
    for (i = 0; i < options->cellCount * iterNum; i += iterNum) {
        KBECContents[i] = options->cells[i / iterNum]->oamCount; // number of OAM entries
        short cellAttrs = (options->cells[i / iterNum]->attributes.hFlip << 8) | (options->cells[i / iterNum]->attributes.vFlip << 9)
            | (options->cells[i / iterNum]->attributes.hvFlip << 10) | (options->cells[i / iterNum]->attributes.boundingRect << 11)
            | (options->cells[i / iterNum]->attributes.boundingSphereRadius & 0x3F);
        KBECContents[i + 2] = cellAttrs & 0xff; // cell attributes
        KBECContents[i + 3] = cellAttrs >> 8;
        KBECContents[i + 4] = (totalOam * 6) & 0xff; // pointer to OAM data
        KBECContents[i + 5] = (totalOam * 6) >> 8;   // unlikely to be more than 16 bits, but there are 32 allocated, change if necessary
        if (options->extended) {
            KBECContents[i + 8] = options->cells[i / iterNum]->maxX & 0xff; // maxX
            KBECContents[i + 9] = options->cells[i / iterNum]->maxX >> 8;
            KBECContents[i + 10] = options->cells[i / iterNum]->maxY & 0xff; // maxY
            KBECContents[i + 11] = options->cells[i / iterNum]->maxY >> 8;
            KBECContents[i + 12] = options->cells[i / iterNum]->minX & 0xff; // minX
            KBECContents[i + 13] = options->cells[i / iterNum]->minX >> 8;
            KBECContents[i + 14] = options->cells[i / iterNum]->minY & 0xff; // minY
            KBECContents[i + 15] = options->cells[i / iterNum]->minY >> 8;
        }
        totalOam += options->cells[i / iterNum]->oamCount;
    }

    // OAM data

    int offset = i;
    for (int j = 0; j < options->cellCount; j++) {
        for (int k = 0; k < options->cells[j]->oamCount; k++) {
            // Attr0

            // bits 0-7 Y coordinate
            KBECContents[offset] = options->cells[j]->oam[k].attr0.YCoordinate & 0xff;

            // bit 8 rotation
            KBECContents[offset + 1] = options->cells[j]->oam[k].attr0.Rotation;

            // bit 9 Obj Size (if rotation) or Obj Disable (if not rotation)
            KBECContents[offset + 1] |= options->cells[j]->oam[k].attr0.SizeDisable << 1;

            // bits 10-11 Obj Mode
            KBECContents[offset + 1] |= options->cells[j]->oam[k].attr0.Mode << 2;

            // bit 12 Obj Mosaic
            KBECContents[offset + 1] |= options->cells[j]->oam[k].attr0.Mosaic << 4;

            // bit 13 Colours
            KBECContents[offset + 1] |= (options->cells[j]->oam[k].attr0.Colours == 16 ? 0 : 1) << 5;

            // bits 14-15 Obj Shape
            KBECContents[offset + 1] |= options->cells[j]->oam[k].attr0.Shape << 6;

            // Attr1

            // bits 0-8 X coordinate
            KBECContents[offset + 2] = options->cells[j]->oam[k].attr1.XCoordinate & 0xff;
            KBECContents[offset + 3] = options->cells[j]->oam[k].attr1.XCoordinate >> 8;

            // bits 9-13 Rotation and scaling (if rotation) bit 12 Horizontal flip, bit 13 Vertical flip (if not rotation)
            KBECContents[offset + 3] |= options->cells[j]->oam[k].attr1.RotationScaling << 1;

            // bits 14-15 Obj Size
            KBECContents[offset + 3] |= options->cells[j]->oam[k].attr1.Size << 6;

            // Attr2

            // bits 0-9 Character Name?
            KBECContents[offset + 4] = options->cells[j]->oam[k].attr2.CharName & 0xff;
            KBECContents[offset + 5] = options->cells[j]->oam[k].attr2.CharName >> 8;

            // bits 10-11 Priority
            KBECContents[offset + 5] |= options->cells[j]->oam[k].attr2.Priority << 2;

            // bits 12-15 Palette Number
            KBECContents[offset + 5] |= options->cells[j]->oam[k].attr2.Palette << 4;

            offset += 6;
        }
    }

    // VRAM transfer data
    if (options->vramTransferEnabled) {
        // max transfer size + fixed offset 0x08
        KBECContents[offset] = options->vramTransferMaxSize & 0xFF;
        KBECContents[offset + 1] = (options->vramTransferMaxSize >> 8) & 0xFF;
        KBECContents[offset + 2] = (options->vramTransferMaxSize >> 16) & 0xFF;
        KBECContents[offset + 3] = (options->vramTransferMaxSize >> 24) & 0xFF;

        KBECContents[offset + 4] = 0x08;

        offset += 8;

        // write a VRAM transfer block for each cell
        for (int idx = 0; idx < options->cellCount; idx++) {
            // offset
            KBECContents[offset] = options->transferData[idx]->sourceDataOffset & 0xFF;
            KBECContents[offset + 1] = (options->transferData[idx]->sourceDataOffset >> 8) & 0xFF;
            KBECContents[offset + 2] = (options->transferData[idx]->sourceDataOffset >> 16) & 0xFF;
            KBECContents[offset + 3] = (options->transferData[idx]->sourceDataOffset >> 24) & 0xFF;

            // size
            KBECContents[offset + 4] = options->transferData[idx]->size & 0xFF;
            KBECContents[offset + 5] = (options->transferData[idx]->size >> 8) & 0xFF;
            KBECContents[offset + 6] = (options->transferData[idx]->size >> 16) & 0xFF;
            KBECContents[offset + 7] = (options->transferData[idx]->size >> 24) & 0xFF;
            offset += 8;
        }
    }

    fwrite(KBECContents, 1, kbecSize, fp);

    free(KBECContents);

    if (options->labelEnabled) {
        unsigned int lablSize = 8;
        for (int j = 0; j < options->labelCount; j++) {
            lablSize += (unsigned)strlen(options->labels[j]) + 5;
        }

        unsigned char *labl = malloc(lablSize);

        memset(labl, 0, lablSize);

        strcpy((char *)labl, "LBAL");
        labl[4] = lablSize & 0xff;
        labl[5] = lablSize >> 8;

        unsigned int position = 0;

        i = 0;
        for (int j = 0; j < options->labelCount; j++) {
            labl[i + 8] = position & 0xff;
            labl[i + 9] = position >> 8;

            position += (unsigned)strlen(options->labels[j]) + 1;
            i += 4;
        }

        for (int j = 0; j < options->labelCount; j++) {
            strcpy((char *)(labl + (i + 8)), options->labels[j]);
            i += (int)strlen(options->labels[j]) + 1;
        }

        fwrite(labl, 1, lablSize, fp);

        free(labl);

        unsigned char txeu[0xc] = { 0x54, 0x58, 0x45, 0x55, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 };

        fwrite(txeu, 1, 0xc, fp);
    }

    fclose(fp);
}

void WriteNtrScreen(char *path, struct JsonToScreenOptions *options) {
    FILE *fp = fopen(path, "wb");

    if (fp == NULL) {
        FATAL_ERROR("Failed to open \"%s\" for writing.\n", path);
    }

    int totalSize = options->width * options->height * 2 + 0x14;

    WriteGenericNtrHeader(fp, "RCSN", totalSize, true, false, 1);

    unsigned char NSCRHeader[0x14] = { 0x4E, 0x52, 0x43, 0x53, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 };

    NSCRHeader[0x4] = totalSize & 0xff;
    NSCRHeader[0x5] = (totalSize >> 8) & 0xff;
    NSCRHeader[0x6] = (totalSize >> 16) & 0xff;
    NSCRHeader[0x7] = totalSize >> 24;

    NSCRHeader[0x8] = (options->width * 8) & 0xff;
    NSCRHeader[0x9] = (options->width * 8) >> 8;

    NSCRHeader[0xA] = (options->height * 8) & 0xff;
    NSCRHeader[0xB] = (options->height * 8) >> 8;

    NSCRHeader[0xC] = options->bitdepth == 4 ? 0 : 1;

    NSCRHeader[0x10] = (totalSize - 0x14) & 0xff;
    NSCRHeader[0x11] = ((totalSize - 0x14) >> 8) & 0xff;
    NSCRHeader[0x12] = ((totalSize - 0x14) >> 16) & 0xff;
    NSCRHeader[0x13] = (totalSize - 0x14) >> 24;

    fwrite(NSCRHeader, 1, 0x14, fp);

    fwrite(options->data, 1, totalSize - 0x14, fp);

    fclose(fp);
}

void ReadNtrAnimation(char *path, struct JsonToAnimationOptions *options) {
    int fileSize;
    unsigned char *data = ReadWholeFile(path, &fileSize);

    if (memcmp(data, "RNAN", 4) != 0 && memcmp(data, "RAMN", 4) != 0) // NANR/NMAR
    {
        FATAL_ERROR("Not a valid NANR/NMAR animation file.\n");
    }

    options->labelEnabled = data[0xE] != 1;

    if (memcmp(data + 0x10, "KNBA", 4) != 0) // ABNK
    {
        FATAL_ERROR("Not a valid ABNK animation file.\n");
    }

    options->sequenceCount = data[0x18] | (data[0x19] << 8);
    options->frameCount = data[0x1A] | (data[0x1B] << 8);

    options->sequenceData = malloc(sizeof(struct SequenceData *) * options->sequenceCount);

    for (int i = 0; i < options->sequenceCount; i++) {
        options->sequenceData[i] = malloc(sizeof(struct SequenceData));
    }

    int offset = 0x30;

    unsigned int *frameOffsets = malloc(sizeof(unsigned int) * options->sequenceCount);

    for (int i = 0; i < options->sequenceCount; i++, offset += 0x10) {
        options->sequenceData[i]->frameCount = data[offset] | (data[offset + 1] << 8);
        options->sequenceData[i]->loopStartFrame = data[offset + 2] | (data[offset + 3] << 8);
        options->sequenceData[i]->animationElement = data[offset + 4] | (data[offset + 5] << 8);
        options->sequenceData[i]->animationType = data[offset + 6] | (data[offset + 7] << 8);
        options->sequenceData[i]->playbackMode = data[offset + 8] | (data[offset + 9] << 8) | (data[offset + 10] << 16) | (data[offset + 11] << 24);
        frameOffsets[i] = data[offset + 12] | (data[offset + 13] << 8) | (data[offset + 14] << 16) | (data[offset + 15] << 24);

        options->sequenceData[i]->frameData = malloc(sizeof(struct FrameData *) * options->sequenceData[i]->frameCount);
        for (int j = 0; j < options->sequenceData[i]->frameCount; j++) {
            options->sequenceData[i]->frameData[j] = malloc(sizeof(struct FrameData));
        }
    }

    int *resultOffsets = malloc(sizeof(int) * options->frameCount);
    memset(resultOffsets, -1, sizeof(int) * options->frameCount);

    for (int i = 0; i < options->sequenceCount; i++) {
        for (int j = 0; j < options->sequenceData[i]->frameCount; j++) {
            int frameOffset = offset + frameOffsets[i] + j * 0x8;
            options->sequenceData[i]->frameData[j]->resultOffset = data[frameOffset] | (data[frameOffset + 1] << 8) | (data[frameOffset + 2] << 16) | (data[frameOffset + 3] << 24);
            options->sequenceData[i]->frameData[j]->frameDelay = data[frameOffset + 4] | (data[frameOffset + 5] << 8);
            // 0xBEEF

            // the following is messy
            bool present = false;
            // check for offset in array
            for (int k = 0; k < options->frameCount; k++) {
                if (resultOffsets[k] == options->sequenceData[i]->frameData[j]->resultOffset) {
                    options->sequenceData[i]->frameData[j]->resultId = k;
                    present = true;
                    break;
                }
            }

            // add data if not present
            if (!present) {
                for (int k = 0; i < options->frameCount; k++) {
                    if (resultOffsets[k] == -1) {
                        options->sequenceData[i]->frameData[j]->resultId = k;
                        resultOffsets[k] = options->sequenceData[i]->frameData[j]->resultOffset;
                        break;
                    }
                }
            }
        }
    }

    free(frameOffsets);

    offset = 0x18 + (data[0x24] | (data[0x25] << 8) | (data[0x26] << 16) | (data[0x27] << 24)); // start of animation results

    int k;

    for (k = 0; k < options->frameCount; k++) {
        if (resultOffsets[k] == -1) {
            break;
        }
    }
    options->resultCount = k;

    free(resultOffsets);

    options->animationResults = malloc(sizeof(struct AnimationResults *) * options->resultCount);

    for (int i = 0; i < options->resultCount; i++) {
        options->animationResults[i] = malloc(sizeof(struct AnimationResults));
    }

    // store the animationElement of the corresponding sequence as this result's resultType
    for (int i = 0; i < options->sequenceCount; i++) {
        for (int j = 0; j < options->sequenceData[i]->frameCount; j++) {
            options->animationResults[options->sequenceData[i]->frameData[j]->resultId]->resultType = options->sequenceData[i]->animationElement;
        }
    }

    int resultOffset = 0;
    int lastSequence = 0;
    for (int i = 0; i < options->resultCount; i++) {
        // find the earliest sequence matching this animation result,
        // and add padding if the sequence changes + the total offset is not 4-byte aligned.
        bool found = false;
        for (int j = 0; j < options->sequenceCount; j++) {
            for (int k = 0; k < options->sequenceData[j]->frameCount; k++) {
                if (options->sequenceData[j]->frameData[k]->resultId == i) {
                    if (lastSequence != j) {
                        lastSequence = j;
                        if (resultOffset % 4 != 0) {
                            resultOffset += 0x2;
                            offset += 0x2;
                        }
                    }
                    found = true;
                    break;
                }
            }
            if (found) {
                break;
            }
        }
        switch (options->animationResults[i]->resultType) {
        case 0: // index
            options->animationResults[i]->index = data[offset] | (data[offset + 1] << 8);
            resultOffset += 0x2;
            offset += 0x2;
            break;

        case 1: // SRT
            options->animationResults[i]->dataSrt.index = data[offset] | (data[offset + 1] << 8);
            options->animationResults[i]->dataSrt.rotation = data[offset + 2] | (data[offset + 3] << 8);
            options->animationResults[i]->dataSrt.scaleX = data[offset + 4] | (data[offset + 5] << 8) | (data[offset + 6] << 16) | (data[offset + 7] << 24);
            options->animationResults[i]->dataSrt.scaleY = data[offset + 8] | (data[offset + 9] << 8) | (data[offset + 10] << 16) | (data[offset + 11] << 24);
            options->animationResults[i]->dataSrt.positionX = data[offset + 12] | (data[offset + 13] << 8);
            options->animationResults[i]->dataSrt.positionY = data[offset + 14] | (data[offset + 15] << 8);
            resultOffset += 0x10;
            offset += 0x10;
            break;

        case 2: // T
            options->animationResults[i]->dataT.index = data[offset] | (data[offset + 1] << 8);
            options->animationResults[i]->dataT.positionX = data[offset + 4] | (data[offset + 5] << 8);
            options->animationResults[i]->dataT.positionY = data[offset + 6] | (data[offset + 7] << 8);
            resultOffset += 0x8;
            offset += 0x8;
            break;
        }
    }

    // add any missed padding from the final frame before processing labels
    if (offset % 4 != 0) {
        offset += 2;
    }

    if (options->labelEnabled) {
        options->labelCount = options->sequenceCount; //*should* be the same
        options->labels = malloc(sizeof(char *) * options->labelCount);
        offset += 0x8 + options->labelCount * 0x4; // skip to label data
        for (int i = 0; i < options->labelCount; i++) {
            options->labels[i] = malloc(strlen((char *)data + offset) + 1);
            strcpy(options->labels[i], (char *)data + offset);
            offset += strlen((char *)data + offset) + 1;
        }
    }

    free(data);
}

void WriteNtrAnimation(char *path, struct JsonToAnimationOptions *options) {
    FILE *fp = fopen(path, "wb");

    if (fp == NULL) {
        FATAL_ERROR("Failed to open \"%s\" for writing.\n", path);
    }

    unsigned int totalSize = 0x20 + options->sequenceCount * 0x10 + options->frameCount * 0x8;

    for (int i = 0; i < options->resultCount; i++) {
        if (options->animationResults[i]->resultType == 0) {
            totalSize += 0x2;
        } else if (options->animationResults[i]->resultType == 1) {
            totalSize += 0x10;
        } else if (options->animationResults[i]->resultType == 2) {
            totalSize += 0x8;
        }
    }

    // foreach sequence, need to check whether padding is applied for its results
    // then add 0x02 to totalSize if padding exists.
    // padding exists if the animation results for that sequence are not 4-byte aligned.
    // also flag the last result for the sequence with `padded` to save having to redo this same step later.
    int *usedResults = malloc(sizeof(int) * options->frameCount);
    memset(usedResults, -1, sizeof(int) * options->frameCount);
    for (int i = 0; i < options->sequenceCount; i++) {
        int sequenceLen = 0;
        int resultIndex = 0;
        int lastNewResultIndex = -1;
        for (int j = 0; j < options->sequenceData[i]->frameCount; j++) {
            // check if the result has already been used
            bool isUsed = false;
            for (resultIndex = 0; resultIndex < options->resultCount; resultIndex++) {
                if (usedResults[resultIndex] == options->sequenceData[i]->frameData[j]->resultId) {
                    isUsed = true;
                    break;
                }

                // if not already used, add it to the list
                if (usedResults[resultIndex] == -1) {
                    usedResults[resultIndex] = options->sequenceData[i]->frameData[j]->resultId;
                    lastNewResultIndex = options->sequenceData[i]->frameData[j]->resultId;
                    break;
                }
            }

            // if not already used, add it to the result size for the sequence
            if (!isUsed) {
                if (options->animationResults[resultIndex]->resultType == 0) {
                    sequenceLen += 0x2;
                } else if (options->animationResults[resultIndex]->resultType == 1) {
                    sequenceLen += 0x10;
                } else if (options->animationResults[resultIndex]->resultType == 2) {
                    sequenceLen += 0x8;
                }
            }
        }
        if (sequenceLen % 4 != 0 && lastNewResultIndex != -1) {
            totalSize += 0x02;
            // mark the last new animationResult index for the sequence as padded, this saves needing to check this again later
            options->animationResults[lastNewResultIndex]->padded = true;
        }
    }

    free(usedResults);

    unsigned int KNBASize = totalSize;

    if (options->labelEnabled) {
        totalSize += options->multiCell ? 0x8 : 0x14;
        for (int j = 0; j < options->labelCount; j++) {
            totalSize += (unsigned)strlen(options->labels[j]) + 5; // strlen + terminator + pointer
        }
    }

    WriteGenericNtrHeader(fp, options->multiCell ? "RAMN" : "RNAN", totalSize, true, false, options->labelEnabled ? (options->multiCell ? 2 : 3) : 1);

    unsigned char KBNAHeader[0x20] = {
        0x4B, 0x4E, 0x42, 0x41, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    };

    KBNAHeader[4] = KNBASize & 0xff;
    KBNAHeader[5] = (KNBASize >> 8) & 0xff;
    KBNAHeader[6] = (KNBASize >> 16) & 0xff;
    KBNAHeader[7] = KNBASize >> 24;

    KBNAHeader[8] = options->sequenceCount & 0xff;
    KBNAHeader[9] = options->sequenceCount >> 8;

    KBNAHeader[10] = options->frameCount & 0xff;
    KBNAHeader[11] = options->frameCount >> 8;

    unsigned int frameOffset = 0x18 + options->sequenceCount * 0x10;

    KBNAHeader[16] = frameOffset & 0xff;
    KBNAHeader[17] = (frameOffset >> 8) & 0xff;
    KBNAHeader[18] = (frameOffset >> 16) & 0xff;
    KBNAHeader[19] = frameOffset >> 24;

    unsigned int resultsOffset = frameOffset + options->frameCount * 0x8;

    KBNAHeader[20] = resultsOffset & 0xff;
    KBNAHeader[21] = (resultsOffset >> 8) & 0xff;
    KBNAHeader[22] = (resultsOffset >> 16) & 0xff;
    KBNAHeader[23] = resultsOffset >> 24;

    fwrite(KBNAHeader, 1, 0x20, fp);

    int contentsSize = KNBASize - 0x20;
    unsigned char *KBNAContents = malloc(contentsSize);

    int i;
    int framePtrCounter = 0;
    for (i = 0; i < options->sequenceCount * 0x10; i += 0x10) {
        KBNAContents[i] = options->sequenceData[i / 0x10]->frameCount & 0xff;
        KBNAContents[i + 1] = options->sequenceData[i / 0x10]->frameCount >> 8;
        KBNAContents[i + 2] = options->sequenceData[i / 0x10]->loopStartFrame & 0xff;
        KBNAContents[i + 3] = options->sequenceData[i / 0x10]->loopStartFrame >> 8;
        KBNAContents[i + 4] = options->sequenceData[i / 0x10]->animationElement & 0xff;
        KBNAContents[i + 5] = (options->sequenceData[i / 0x10]->animationElement >> 8) & 0xff;
        KBNAContents[i + 6] = options->sequenceData[i / 0x10]->animationType & 0xff;
        KBNAContents[i + 7] = (options->sequenceData[i / 0x10]->animationType >> 8) & 0xff;
        KBNAContents[i + 8] = options->sequenceData[i / 0x10]->playbackMode & 0xff;
        KBNAContents[i + 9] = (options->sequenceData[i / 0x10]->playbackMode >> 8) & 0xff;
        KBNAContents[i + 10] = (options->sequenceData[i / 0x10]->playbackMode >> 16) & 0xff;
        KBNAContents[i + 11] = options->sequenceData[i / 0x10]->playbackMode >> 24;
        KBNAContents[i + 12] = framePtrCounter & 0xff;
        KBNAContents[i + 13] = (framePtrCounter >> 8) & 0xff;
        KBNAContents[i + 14] = (framePtrCounter >> 16) & 0xff;
        KBNAContents[i + 15] = framePtrCounter >> 24;
        framePtrCounter += options->sequenceData[i / 0x10]->frameCount * 8;
    }

    int j;
    int m;
    for (j = i, m = 0; m < options->sequenceCount; m++) {
        for (int k = 0; k < options->sequenceData[m]->frameCount; k++) {
            int resPtr = 0;
            for (int l = 0; l < options->sequenceData[m]->frameData[k]->resultId; l++) {
                if (options->animationResults[l]->resultType == 0) {
                    resPtr += 0x2;
                } else if (options->animationResults[l]->resultType == 1) {
                    resPtr += 0x10;
                } else if (options->animationResults[l]->resultType == 2) {
                    resPtr += 0x8;
                }

                if (options->animationResults[l]->padded) {
                    resPtr += 0x02;
                }
            }
            KBNAContents[j + (k * 8)] = resPtr & 0xff;
            KBNAContents[j + (k * 8) + 1] = (resPtr >> 8) & 0xff;
            KBNAContents[j + (k * 8) + 2] = (resPtr >> 16) & 0xff;
            KBNAContents[j + (k * 8) + 3] = resPtr >> 24;
            KBNAContents[j + (k * 8) + 4] = options->sequenceData[m]->frameData[k]->frameDelay & 0xff;
            KBNAContents[j + (k * 8) + 5] = options->sequenceData[m]->frameData[k]->frameDelay >> 8;
            KBNAContents[j + (k * 8) + 6] = 0xEF;
            KBNAContents[j + (k * 8) + 7] = 0xBE;
        }
        j += options->sequenceData[m]->frameCount * 8;
    }

    int resPtrCounter = j;
    for (int k = 0; k < options->resultCount; k++) {
        switch (options->animationResults[k]->resultType) {
        case 0:
            KBNAContents[resPtrCounter] = options->animationResults[k]->index & 0xff;
            KBNAContents[resPtrCounter + 1] = options->animationResults[k]->index >> 8;
            resPtrCounter += 0x2;
            break;

        case 1:
            KBNAContents[resPtrCounter] = options->animationResults[k]->dataSrt.index & 0xff;
            KBNAContents[resPtrCounter + 1] = options->animationResults[k]->dataSrt.index >> 8;
            KBNAContents[resPtrCounter + 2] = options->animationResults[k]->dataSrt.rotation & 0xff;
            KBNAContents[resPtrCounter + 3] = options->animationResults[k]->dataSrt.rotation >> 8;
            KBNAContents[resPtrCounter + 4] = options->animationResults[k]->dataSrt.scaleX & 0xff;
            KBNAContents[resPtrCounter + 5] = (options->animationResults[k]->dataSrt.scaleX >> 8) & 0xff;
            KBNAContents[resPtrCounter + 6] = (options->animationResults[k]->dataSrt.scaleX >> 16) & 0xff;
            KBNAContents[resPtrCounter + 7] = options->animationResults[k]->dataSrt.scaleX >> 24;
            KBNAContents[resPtrCounter + 8] = options->animationResults[k]->dataSrt.scaleY & 0xff;
            KBNAContents[resPtrCounter + 9] = (options->animationResults[k]->dataSrt.scaleY >> 8) & 0xff;
            KBNAContents[resPtrCounter + 10] = (options->animationResults[k]->dataSrt.scaleY >> 16) & 0xff;
            KBNAContents[resPtrCounter + 11] = options->animationResults[k]->dataSrt.scaleY >> 24;
            KBNAContents[resPtrCounter + 12] = options->animationResults[k]->dataSrt.positionX & 0xff;
            KBNAContents[resPtrCounter + 13] = options->animationResults[k]->dataSrt.positionX >> 8;
            KBNAContents[resPtrCounter + 14] = options->animationResults[k]->dataSrt.positionY & 0xff;
            KBNAContents[resPtrCounter + 15] = options->animationResults[k]->dataSrt.positionY >> 8;
            resPtrCounter += 0x10;
            break;

        case 2:
            KBNAContents[resPtrCounter] = options->animationResults[k]->dataT.index & 0xff;
            KBNAContents[resPtrCounter + 1] = options->animationResults[k]->dataT.index >> 8;
            KBNAContents[resPtrCounter + 2] = 0xEF;
            KBNAContents[resPtrCounter + 3] = 0xBE;
            KBNAContents[resPtrCounter + 4] = options->animationResults[k]->dataT.positionX & 0xff;
            KBNAContents[resPtrCounter + 5] = options->animationResults[k]->dataT.positionX >> 8;
            KBNAContents[resPtrCounter + 6] = options->animationResults[k]->dataT.positionY & 0xff;
            KBNAContents[resPtrCounter + 7] = options->animationResults[k]->dataT.positionY >> 8;
            resPtrCounter += 0x8;
            break;
        }

        // use the `padded` flag which was stored earlier to inject padding
        if (options->animationResults[k]->padded) {
            KBNAContents[resPtrCounter] = 0xCC;
            KBNAContents[resPtrCounter + 1] = 0xCC;
            resPtrCounter += 0x2;
        }
    }

    fwrite(KBNAContents, 1, contentsSize, fp);

    free(KBNAContents);

    if (options->labelEnabled) {
        unsigned int lablSize = 8;
        for (int j = 0; j < options->labelCount; j++) {
            lablSize += (unsigned)strlen(options->labels[j]) + 5;
        }

        unsigned char *labl = malloc(lablSize);

        memset(labl, 0, lablSize);

        strcpy((char *)labl, "LBAL");
        labl[4] = lablSize & 0xff;
        labl[5] = lablSize >> 8;

        unsigned int position = 0;

        i = 0;
        for (int j = 0; j < options->labelCount; j++) {
            labl[i + 8] = position & 0xff;
            labl[i + 9] = position >> 8;

            position += (unsigned)strlen(options->labels[j]) + 1;
            i += 4;
        }

        for (int j = 0; j < options->labelCount; j++) {
            strcpy((char *)(labl + (i + 8)), options->labels[j]);
            i += (int)strlen(options->labels[j]) + 1;
        }

        fwrite(labl, 1, lablSize, fp);

        free(labl);

        if (!options->multiCell) {
            unsigned char txeu[0xc] = { 0x54, 0x58, 0x45, 0x55, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 };

            fwrite(txeu, 1, 0xc, fp);
        }
    }

    fclose(fp);
}
