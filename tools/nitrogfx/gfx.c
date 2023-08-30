// Copyright (c) 2015 YamaArashi, 2021-2023 red031000

#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <stdbool.h>
#include "global.h"
#include "gfx.h"
#include "util.h"

#define GET_GBA_PAL_RED(x)   (((x) >>  0) & 0x1F)
#define GET_GBA_PAL_GREEN(x) (((x) >>  5) & 0x1F)
#define GET_GBA_PAL_BLUE(x)  (((x) >> 10) & 0x1F)

#define SET_GBA_PAL(r, g, b) (((b) << 10) | ((g) << 5) | (r))

#define UPCONVERT_BIT_DEPTH(x) (((x) * 255) / 31)

#define DOWNCONVERT_BIT_DEPTH(x) ((x) / 8)

static void AdvanceMetatilePosition(int *subTileX, int *subTileY, int *metatileX, int *metatileY, int metatilesWide, int metatileWidth, int metatileHeight)
{
    (*subTileX)++;
    if (*subTileX == metatileWidth) {
        *subTileX = 0;
        (*subTileY)++;
        if (*subTileY == metatileHeight) {
            *subTileY = 0;
            (*metatileX)++;
            if (*metatileX == metatilesWide) {
                *metatileX = 0;
                (*metatileY)++;
            }
        }
    }
}

static void ConvertFromTiles1Bpp(unsigned char *src, unsigned char *dest, int numTiles, int metatilesWide, int metatileWidth, int metatileHeight, bool invertColors)
{
    int subTileX = 0;
    int subTileY = 0;
    int metatileX = 0;
    int metatileY = 0;
    int pitch = metatilesWide * metatileWidth;

    for (int i = 0; i < numTiles; i++) {
        for (int j = 0; j < 8; j++) {
            int destY = (metatileY * metatileHeight + subTileY) * 8 + j;
            int destX = metatileX * metatileWidth + subTileX;
            unsigned char srcPixelOctet = *src++;
            unsigned char *destPixelOctet = &dest[destY * pitch + destX];

            for (int k = 0; k < 8; k++) {
                *destPixelOctet <<= 1;
                *destPixelOctet |= (srcPixelOctet & 1) ^ invertColors;
                srcPixelOctet >>= 1;
            }
        }

        AdvanceMetatilePosition(&subTileX, &subTileY, &metatileX, &metatileY, metatilesWide, metatileWidth, metatileHeight);
    }
}

static void ConvertFromTiles4Bpp(unsigned char *src, unsigned char *dest, int numTiles, int metatilesWide, int metatileWidth, int metatileHeight, bool invertColors)
{
    int subTileX = 0;
    int subTileY = 0;
    int metatileX = 0;
    int metatileY = 0;
    int pitch = (metatilesWide * metatileWidth) * 4;

    for (int i = 0; i < numTiles; i++) {
        for (int j = 0; j < 8; j++) {
            int destY = (metatileY * metatileHeight + subTileY) * 8 + j;

            for (int k = 0; k < 4; k++) {
                int destX = (metatileX * metatileWidth + subTileX) * 4 + k;
                unsigned char srcPixelPair = *src++;
                unsigned char leftPixel = srcPixelPair & 0xF;
                unsigned char rightPixel = srcPixelPair >> 4;

                if (invertColors) {
                    leftPixel = 15 - leftPixel;
                    rightPixel = 15 - rightPixel;
                }

                dest[destY * pitch + destX] = (leftPixel << 4) | rightPixel;
            }
        }

        AdvanceMetatilePosition(&subTileX, &subTileY, &metatileX, &metatileY, metatilesWide, metatileWidth, metatileHeight);
    }
}

static uint32_t ConvertFromScanned4Bpp(unsigned char *src, unsigned char *dest, int fileSize, bool invertColours, bool scanFrontToBack)
{
    uint32_t encValue = 0;
    if (scanFrontToBack) {
        encValue = (src[1] << 8) | src[0];
        for (int i = 0; i < fileSize; i += 2)
        {
            uint16_t val = src[i] | (src[i + 1] << 8);
            val ^= (encValue & 0xFFFF);
            src[i] = val;
            src[i + 1] = val >> 8;
            encValue = encValue * 1103515245;
            encValue = encValue + 24691;
        }
    } else {
        encValue = (src[fileSize - 1] << 8) | src[fileSize - 2];
        for (int i = fileSize; i > 0; i -= 2)
        {
            uint16_t val = (src[i - 1] << 8) | src[i - 2];
            val ^= (encValue & 0xFFFF);
            src[i - 1] = (val >> 8);
            src[i - 2] = val;
            encValue = encValue * 1103515245;
            encValue = encValue + 24691;
        }
    }
    for (int i = 0; i < fileSize; i++)
    {
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

static void ConvertFromTiles8Bpp(unsigned char *src, unsigned char *dest, int numTiles, int metatilesWide, int metatileWidth, int metatileHeight, bool invertColors)
{
    int subTileX = 0;
    int subTileY = 0;
    int metatileX = 0;
    int metatileY = 0;
    int pitch = (metatilesWide * metatileWidth) * 8;

    for (int i = 0; i < numTiles; i++) {
        for (int j = 0; j < 8; j++) {
            int destY = (metatileY * metatileHeight + subTileY) * 8 + j;

            for (int k = 0; k < 8; k++) {
                int destX = (metatileX * metatileWidth + subTileX) * 8 + k;
                unsigned char srcPixel = *src++;

                if (invertColors)
                    srcPixel = 255 - srcPixel;

                dest[destY * pitch + destX] = srcPixel;
            }
        }

        AdvanceMetatilePosition(&subTileX, &subTileY, &metatileX, &metatileY, metatilesWide, metatileWidth, metatileHeight);
    }
}

static uint32_t ConvertFromScanned8Bpp(unsigned char *src, unsigned char *dest, int fileSize, bool invertColours, bool scanFrontToBack)
{
    uint32_t encValue = 0;
    if (scanFrontToBack) {
        encValue = (src[1] << 8) | src[0];
        for (int i = 0; i < fileSize; i += 2)
        {
            uint16_t val = src[i] | (src[i + 1] << 8);
            val ^= (encValue & 0xFFFF);
            src[i] = val;
            src[i + 1] = val >> 8;
            encValue = encValue * 1103515245;
            encValue = encValue + 24691;
        }
    } else {
        encValue = (src[fileSize - 1] << 8) | src[fileSize - 2];
        for (int i = fileSize; i > 0; i -= 2)
        {
            uint16_t val = (src[i - 1] << 8) | src[i - 2];
            val ^= (encValue & 0xFFFF);
            src[i - 1] = (val >> 8);
            src[i - 2] = val;
            encValue = encValue * 1103515245;
            encValue = encValue + 24691;
        }
    }
    for (int i = 0; i < fileSize; i++)
    {
        unsigned char srcPixel = src[i];

        if (invertColours) {
            srcPixel = 255 - srcPixel;
        }

        dest[i] = srcPixel;
    }
    return encValue;
}

static void ConvertToTiles1Bpp(unsigned char *src, unsigned char *dest, int numTiles, int metatilesWide, int metatileWidth, int metatileHeight, bool invertColors)
{
    int subTileX = 0;
    int subTileY = 0;
    int metatileX = 0;
    int metatileY = 0;
    int pitch = metatilesWide * metatileWidth;

    for (int i = 0; i < numTiles; i++) {
        for (int j = 0; j < 8; j++) {
            int srcY = (metatileY * metatileHeight + subTileY) * 8 + j;
            int srcX = metatileX * metatileWidth + subTileX;
            unsigned char srcPixelOctet = src[srcY * pitch + srcX];
            unsigned char *destPixelOctet = dest++;

            for (int k = 0; k < 8; k++) {
                *destPixelOctet <<= 1;
                *destPixelOctet |= (srcPixelOctet & 1) ^ invertColors;
                srcPixelOctet >>= 1;
            }
        }

        AdvanceMetatilePosition(&subTileX, &subTileY, &metatileX, &metatileY, metatilesWide, metatileWidth, metatileHeight);
    }
}

static void ConvertToTiles4Bpp(unsigned char *src, unsigned char *dest, int numTiles, int metatilesWide, int metatileWidth, int metatileHeight, bool invertColors)
{
    int subTileX = 0;
    int subTileY = 0;
    int metatileX = 0;
    int metatileY = 0;
    int pitch = (metatilesWide * metatileWidth) * 4;

    for (int i = 0; i < numTiles; i++) {
        for (int j = 0; j < 8; j++) {
            int srcY = (metatileY * metatileHeight + subTileY) * 8 + j;

            for (int k = 0; k < 4; k++) {
                int srcX = (metatileX * metatileWidth + subTileX) * 4 + k;
                unsigned char srcPixelPair = src[srcY * pitch + srcX];
                unsigned char leftPixel = srcPixelPair >> 4;
                unsigned char rightPixel = srcPixelPair & 0xF;

                if (invertColors) {
                    leftPixel = 15 - leftPixel;
                    rightPixel = 15 - rightPixel;
                }

                *dest++ = (rightPixel << 4) | leftPixel;
            }
        }

        AdvanceMetatilePosition(&subTileX, &subTileY, &metatileX, &metatileY, metatilesWide, metatileWidth, metatileHeight);
    }
}

static void ConvertToScanned4Bpp(unsigned char *src, unsigned char *dest, int fileSize, bool invertColours, uint32_t encValue, uint32_t scanMode)
{
    for (int i = 0; i < fileSize; i++)
    {
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
        for (int i = fileSize - 1; i > 0; i -= 2)
        {
            uint16_t val = dest[i - 1] | (dest[i] << 8);
            encValue = (encValue - 24691) * 4005161829;
            val ^= (encValue & 0xFFFF);
            dest[i] = (val >> 8);
            dest[i - 1] = val;
        }
    }
    else if (scanMode == 1) {
        for (int i = 1; i < fileSize; i += 2)
        {
            uint16_t val = (dest[i] << 8) | dest[i - 1];
            encValue = (encValue - 24691) * 4005161829;
            val ^= (encValue & 0xFFFF);
            dest[i] = (val >> 8);
            dest[i - 1] = val;
        }
    }
}

static void ConvertToTiles8Bpp(unsigned char *src, unsigned char *dest, int numTiles, int metatilesWide, int metatileWidth, int metatileHeight, bool invertColors)
{
    int subTileX = 0;
    int subTileY = 0;
    int metatileX = 0;
    int metatileY = 0;
    int pitch = (metatilesWide * metatileWidth) * 8;

    for (int i = 0; i < numTiles; i++) {
        for (int j = 0; j < 8; j++) {
            int srcY = (metatileY * metatileHeight + subTileY) * 8 + j;

            for (int k = 0; k < 8; k++) {
                int srcX = (metatileX * metatileWidth + subTileX) * 8 + k;
                unsigned char srcPixel = src[srcY * pitch + srcX];

                if (invertColors)
                    srcPixel = 255 - srcPixel;

                *dest++ = srcPixel;
            }
        }

        AdvanceMetatilePosition(&subTileX, &subTileY, &metatileX, &metatileY, metatilesWide, metatileWidth, metatileHeight);
    }
}

void ReadImage(char *path, int tilesWidth, int bitDepth, int metatileWidth, int metatileHeight, struct Image *image, bool invertColors)
{
    int tileSize = bitDepth * 8;

    int fileSize;
    unsigned char *buffer = ReadWholeFile(path, &fileSize);

    int numTiles = fileSize / tileSize;

    int tilesHeight = (numTiles + tilesWidth - 1) / tilesWidth;

    if (tilesWidth % metatileWidth != 0)
        FATAL_ERROR("The width in tiles (%d) isn't a multiple of the specified metatile width (%d)", tilesWidth, metatileWidth);

    if (tilesHeight % metatileHeight != 0)
        FATAL_ERROR("The height in tiles (%d) isn't a multiple of the specified metatile height (%d)", tilesHeight, metatileHeight);

    image->width = tilesWidth * 8;
    image->height = tilesHeight * 8;
    image->bitDepth = bitDepth;
    image->pixels = calloc(tilesWidth * tilesHeight, tileSize);

    if (image->pixels == NULL)
        FATAL_ERROR("Failed to allocate memory for pixels.\n");

    int metatilesWide = tilesWidth / metatileWidth;

    switch (bitDepth) {
    case 1:
        ConvertFromTiles1Bpp(buffer, image->pixels, numTiles, metatilesWide, metatileWidth, metatileHeight, invertColors);
        break;
    case 4:
        ConvertFromTiles4Bpp(buffer, image->pixels, numTiles, metatilesWide, metatileWidth, metatileHeight, invertColors);
        break;
    case 8:
        ConvertFromTiles8Bpp(buffer, image->pixels, numTiles, metatilesWide, metatileWidth, metatileHeight, invertColors);
        break;
    }

    free(buffer);
}

uint32_t ReadNtrImage(char *path, int tilesWidth, int bitDepth, int metatileWidth, int metatileHeight, struct Image *image, bool invertColors, bool scanFrontToBack)
{
    int fileSize;
    unsigned char *buffer = ReadWholeFile(path, &fileSize);

    if (memcmp(buffer, "RGCN", 4) != 0)
    {
        FATAL_ERROR("Not a valid NCGR character file.\n");
    }

    unsigned char *charHeader = buffer + 0x10;

    if (memcmp(charHeader, "RAHC", 4) != 0)
    {
        FATAL_ERROR("No valid CHAR file after NCLR header.\n");
    }

    bitDepth = bitDepth ? bitDepth : (charHeader[0xC] == 3 ? 4 : 8);

    if (bitDepth == 4)
    {
        image->palette.numColors = 16;
    }

    unsigned char *imageData = charHeader + 0x20;

    bool scanned = charHeader[0x14];

    int tileSize = bitDepth * 8;

    if (tilesWidth == 0) {
        tilesWidth = ReadS16(charHeader, 0xA);
        if (tilesWidth < 0) {
            tilesWidth = 1;
        }
    }

    int numTiles = ReadS32(charHeader, 0x18) / (64 / (8 / bitDepth));

    int tilesHeight = ReadS16(charHeader, 0x8);
    if (tilesHeight < 0)
        tilesHeight = (numTiles + tilesWidth - 1) / tilesWidth;

    if (tilesWidth % metatileWidth != 0)
        FATAL_ERROR("The width in tiles (%d) isn't a multiple of the specified metatile width (%d)", tilesWidth, metatileWidth);

    if (tilesHeight % metatileHeight != 0)
        FATAL_ERROR("The height in tiles (%d) isn't a multiple of the specified metatile height (%d)", tilesHeight, metatileHeight);


    image->width = tilesWidth * 8;
    image->height = tilesHeight * 8;
    image->bitDepth = bitDepth;
    image->pixels = calloc(tilesWidth * tilesHeight, tileSize);

    if (image->pixels == NULL)
        FATAL_ERROR("Failed to allocate memory for pixels.\n");

    int metatilesWide = tilesWidth / metatileWidth;

    uint32_t key = 0;
    if (scanned)
    {
        switch (bitDepth)
        {
            case 4:
                key = ConvertFromScanned4Bpp(imageData, image->pixels, fileSize - 0x30, invertColors, scanFrontToBack);
                break;
            case 8:
                key = ConvertFromScanned8Bpp(imageData, image->pixels, fileSize - 0x30, invertColors, scanFrontToBack);
                break;
        }
    }
    else
    {
        switch (bitDepth)
        {
            case 4:
                ConvertFromTiles4Bpp(imageData, image->pixels, numTiles, metatilesWide, metatileWidth, metatileHeight,
                                     invertColors);
                break;
            case 8:
                ConvertFromTiles8Bpp(imageData, image->pixels, numTiles, metatilesWide, metatileWidth, metatileHeight,
                                     invertColors);
                break;
        }
    }

    free(buffer);
    return key;
}

void WriteImage(char *path, int numTiles, int bitDepth, int metatileWidth, int metatileHeight, struct Image *image, bool invertColors)
{
    int tileSize = bitDepth * 8;

    if (image->width % 8 != 0)
        FATAL_ERROR("The width in pixels (%d) isn't a multiple of 8.\n", image->width);

    if (image->height % 8 != 0)
        FATAL_ERROR("The height in pixels (%d) isn't a multiple of 8.\n", image->height);

    int tilesWidth = image->width / 8;
    int tilesHeight = image->height / 8;

    if (tilesWidth % metatileWidth != 0)
        FATAL_ERROR("The width in tiles (%d) isn't a multiple of the specified metatile width (%d)", tilesWidth, metatileWidth);

    if (tilesHeight % metatileHeight != 0)
        FATAL_ERROR("The height in tiles (%d) isn't a multiple of the specified metatile height (%d)", tilesHeight, metatileHeight);

    int maxNumTiles = tilesWidth * tilesHeight;

    if (numTiles == 0)
        numTiles = maxNumTiles;
    else if (numTiles > maxNumTiles)
        FATAL_ERROR("The specified number of tiles (%d) is greater than the maximum possible value (%d).\n", numTiles, maxNumTiles);

    int bufferSize = numTiles * tileSize;
    unsigned char *buffer = malloc(bufferSize);

    if (buffer == NULL)
        FATAL_ERROR("Failed to allocate memory for pixels.\n");

    int metatilesWide = tilesWidth / metatileWidth;

    switch (bitDepth) {
    case 1:
        ConvertToTiles1Bpp(image->pixels, buffer, numTiles, metatilesWide, metatileWidth, metatileHeight, invertColors);
        break;
    case 4:
        ConvertToTiles4Bpp(image->pixels, buffer, numTiles, metatilesWide, metatileWidth, metatileHeight, invertColors);
        break;
    case 8:
        ConvertToTiles8Bpp(image->pixels, buffer, numTiles, metatilesWide, metatileWidth, metatileHeight, invertColors);
        break;
    }

    WriteWholeFile(path, buffer, bufferSize);

    free(buffer);
}

void WriteNtrImage(char *path, int numTiles, int bitDepth, int metatileWidth, int metatileHeight, struct Image *image,
                   bool invertColors, bool clobberSize, bool byteOrder, bool version101, bool sopc, bool vram, uint32_t scanMode,
                   uint32_t mappingType, uint32_t key, bool wrongSize)
{
    FILE *fp = fopen(path, "wb");

    if (fp == NULL)
        FATAL_ERROR("Failed to open \"%s\" for writing.\n", path);

    int tileSize = bitDepth * 8;

    if (image->width % 8 != 0)
        FATAL_ERROR("The width in pixels (%d) isn't a multiple of 8.\n", image->width);

    if (image->height % 8 != 0)
        FATAL_ERROR("The height in pixels (%d) isn't a multiple of 8.\n", image->height);

    int tilesWidth = image->width / 8;
    int tilesHeight = image->height / 8;

    if (tilesWidth % metatileWidth != 0)
        FATAL_ERROR("The width in tiles (%d) isn't a multiple of the specified metatile width (%d)", tilesWidth, metatileWidth);

    if (tilesHeight % metatileHeight != 0)
        FATAL_ERROR("The height in tiles (%d) isn't a multiple of the specified metatile height (%d)", tilesHeight, metatileHeight);

    int maxNumTiles = tilesWidth * tilesHeight;

    if (numTiles == 0)
        numTiles = maxNumTiles;
    else if (numTiles > maxNumTiles)
        FATAL_ERROR("The specified number of tiles (%d) is greater than the maximum possible value (%d).\n", numTiles, maxNumTiles);

    int bufferSize = numTiles * tileSize;
    unsigned char *pixelBuffer = malloc(bufferSize);

    if (pixelBuffer == NULL)
        FATAL_ERROR("Failed to allocate memory for pixels.\n");

    int metatilesWide = tilesWidth / metatileWidth;

    if (scanMode)
    {
        switch (bitDepth)
        {
            case 4:
                ConvertToScanned4Bpp(image->pixels, pixelBuffer, bufferSize, invertColors, key, scanMode);
                break;
            case 8:
                FATAL_ERROR("8Bpp not supported yet.\n");
                break;
        }
    }
    else
    {
        switch (bitDepth)
        {
            case 4:
                ConvertToTiles4Bpp(image->pixels, pixelBuffer, numTiles, metatilesWide, metatileWidth, metatileHeight,
                                   invertColors);
                break;
            case 8:
                ConvertToTiles8Bpp(image->pixels, pixelBuffer, numTiles, metatilesWide, metatileWidth, metatileHeight,
                                   invertColors);
                break;
        }
    }

    WriteGenericNtrHeader(fp, "RGCN", bufferSize + (sopc ? 0x30 : 0x20) + (wrongSize ? -8 : 0), byteOrder, version101, sopc ? 2 : 1);

    unsigned char charHeader[0x20] = { 0x52, 0x41, 0x48, 0x43, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00 };

    charHeader[4] = (bufferSize + 0x20 + (wrongSize ? -8 : 0)) & 0xFF;
    charHeader[5] = ((bufferSize + 0x20 + (wrongSize ? -8 : 0)) >> 8) & 0xFF;
    charHeader[6] = ((bufferSize + 0x20 + (wrongSize ? -8 : 0)) >> 16) & 0xFF;
    charHeader[7] = ((bufferSize + 0x20 + (wrongSize ? -8 : 0)) >> 24) & 0xFF;

    if (!clobberSize)
    {
        charHeader[8] = tilesHeight & 0xFF;
        charHeader[9] = (tilesHeight >> 8) & 0xFF;

        charHeader[10] = tilesWidth & 0xFF;
        charHeader[11] = (tilesWidth >> 8) & 0xFF;
    }
    else
    {
        charHeader[8] = 0xFF;
        charHeader[9] = 0xFF;
        charHeader[10] = 0xFF;
        charHeader[11] = 0xFF;

        charHeader[16] = 0x10; //size clobbering implies mapping type is some variant of 1d - *should* have a mapping type that's not 0

        if (mappingType == 0)
        {
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

    if (scanMode)
    {
        charHeader[20] = 1; //implies BMP
    }

    if (vram)
    {
        charHeader[21] = 1; //implies VRAM transfer
    }

    charHeader[24] = bufferSize & 0xFF;
    charHeader[25] = (bufferSize >> 8) & 0xFF;
    charHeader[26] = (bufferSize >> 16) & 0xFF;
    charHeader[27] = (bufferSize >> 24) & 0xFF;

    fwrite(charHeader, 1, 0x20, fp);

    fwrite(pixelBuffer, 1, bufferSize, fp);

    if (sopc)
    {
        unsigned char sopcBuffer[0x10] = { 0x53, 0x4F, 0x50, 0x43, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 };

        sopcBuffer[12] = tilesWidth & 0xFF;
        sopcBuffer[13] = (tilesWidth >> 8) & 0xFF;

        sopcBuffer[14] = tilesHeight & 0xFF;
        sopcBuffer[15] = (tilesHeight >> 8) & 0xFF;

        fwrite(sopcBuffer, 1, 0x10, fp);
    }

    free(pixelBuffer);
    fclose(fp);
}

void FreeImage(struct Image *image)
{
    free(image->pixels);
    image->pixels = NULL;
}

void ReadGbaPalette(char *path, struct Palette *palette)
{
    int fileSize;
    unsigned char *data = ReadWholeFile(path, &fileSize);

    if (fileSize % 2 != 0)
    FATAL_ERROR("The file size (%d) is not a multiple of 2.\n", fileSize);

    palette->numColors = fileSize / 2;

    for (int i = 0; i < palette->numColors; i++) {
        uint16_t paletteEntry = (data[i * 2 + 1] << 8) | data[i * 2];
        palette->colors[i].red = UPCONVERT_BIT_DEPTH(GET_GBA_PAL_RED(paletteEntry));
        palette->colors[i].green = UPCONVERT_BIT_DEPTH(GET_GBA_PAL_GREEN(paletteEntry));
        palette->colors[i].blue = UPCONVERT_BIT_DEPTH(GET_GBA_PAL_BLUE(paletteEntry));
    }

    free(data);
}

void ReadNtrPalette(char *path, struct Palette *palette, int bitdepth, int palIndex)
{
    int fileSize;
    unsigned char *data = ReadWholeFile(path, &fileSize);

    if (memcmp(data, "RLCN", 4) != 0 && memcmp(data, "RPCN", 4) != 0) //NCLR / NCPR
    {
        FATAL_ERROR("Not a valid NCLR or NCPR palette file.\n");
    }

    unsigned char *paletteHeader = data + 0x10;

    if (memcmp(paletteHeader, "TTLP", 4) != 0)
    {
        FATAL_ERROR("No valid PLTT file after NCLR header.\n");
    }

    if ((fileSize - 0x28) % 2 != 0)
        FATAL_ERROR("The file size (%d) is not a multiple of 2.\n", fileSize);

    palette->bitDepth = paletteHeader[0x8] == 3 ? 4 : 8;

    bitdepth = bitdepth ? bitdepth : palette->bitDepth;

    size_t paletteSize = (paletteHeader[0x10]) | (paletteHeader[0x11] << 8) | (paletteHeader[0x12] << 16) | (paletteHeader[0x13] << 24);
    if (palIndex == 0) {
        palette->numColors = paletteSize / 2;
    } else {
        palette->numColors = bitdepth == 4 ? 16 : 256; //remove header and divide by 2
        --palIndex;
    }

    unsigned char *paletteData = paletteHeader + 0x18;

    for (int i = 0; i < 256; i++)
    {
        if (i < palette->numColors)
        {
            uint16_t paletteEntry = (paletteData[(32 * palIndex) + i * 2 + 1] << 8) | paletteData[(32 * palIndex) + i * 2];
            palette->colors[i].red = UPCONVERT_BIT_DEPTH(GET_GBA_PAL_RED(paletteEntry));
            palette->colors[i].green = UPCONVERT_BIT_DEPTH(GET_GBA_PAL_GREEN(paletteEntry));
            palette->colors[i].blue = UPCONVERT_BIT_DEPTH(GET_GBA_PAL_BLUE(paletteEntry));
        }
        else
        {
            palette->colors[i].red = 0;
            palette->colors[i].green = 0;
            palette->colors[i].blue = 0;
        }
    }

    free(data);
}

void WriteGbaPalette(char *path, struct Palette *palette)
{
    FILE *fp = fopen(path, "wb");

    if (fp == NULL)
        FATAL_ERROR("Failed to open \"%s\" for writing.\n", path);

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

void WriteNtrPalette(char *path, struct Palette *palette, bool ncpr, bool ir, int bitdepth, bool pad, int compNum)
{
    FILE *fp = fopen(path, "wb");

    if (fp == NULL)
        FATAL_ERROR("Failed to open \"%s\" for writing.\n", path);

    int colourNum = pad ? 256 : 16;

    uint32_t size = colourNum * 2; //todo check if there's a better way to detect :/
    uint32_t extSize = size + (ncpr ? 0x10 : 0x18);

    //NCLR header
    WriteGenericNtrHeader(fp, (ncpr ? "RPCN" : "RLCN"), extSize, !ncpr, false, 1);

    unsigned char palHeader[0x18] =
            {
                0x54, 0x54, 0x4C, 0x50, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00
            };

    //section size
    palHeader[4] = extSize & 0xFF;
    palHeader[5] = (extSize >> 8) & 0xFF;
    palHeader[6] = (extSize >> 16) & 0xFF;
    palHeader[7] = (extSize >> 24) & 0xFF;

    if (!palette->bitDepth)
        palette->bitDepth = 4;

    bitdepth = bitdepth ? bitdepth : palette->bitDepth;

    //bit depth
    palHeader[8] = bitdepth == 4 ? 0x03: 0x04;

    if (compNum)
    {
        palHeader[10] = compNum; //assuming this is an indicator of compression, literally no docs for it though
    }

    //size
    palHeader[16] = size & 0xFF;
    palHeader[17] = (size >> 8) & 0xFF;
    palHeader[18] = (size >> 16) & 0xFF;
    palHeader[19] = (size >> 24) & 0xFF;

    fwrite(palHeader, 1, 0x18, fp);

    unsigned char * colours = malloc(colourNum * 2);
    //palette data
    for (int i = 0; i < colourNum; i++)
    {
        if (i < palette->numColors)
        {
            unsigned char red = DOWNCONVERT_BIT_DEPTH(palette->colors[i].red);
            unsigned char green = DOWNCONVERT_BIT_DEPTH(palette->colors[i].green);
            unsigned char blue = DOWNCONVERT_BIT_DEPTH(palette->colors[i].blue);

            uint16_t paletteEntry = SET_GBA_PAL(red, green, blue);

            colours[i * 2] = paletteEntry & 0xFF;
            colours[i * 2 + 1] = paletteEntry >> 8;
        }
        else
        {
            colours[i * 2] = 0x00;
            colours[i * 2 + 1] = 0x00;
        }
    }

    if (ir)
    {
        colours[colourNum * 2 - 2] = 'I';
        colours[colourNum * 2 - 1] = 'R';
    }

    fwrite(colours, 1, colourNum * 2, fp);
    free(colours);

    fclose(fp);
}

void ReadNtrCell(char *path, struct JsonToCellOptions *options)
{
    int fileSize;
    unsigned char *data = ReadWholeFile(path, &fileSize);

    if (memcmp(data, "RECN", 4) != 0) //NCER
    {
        FATAL_ERROR("Not a valid NCER cell file.\n");
    }

    options->labelEnabled = data[0xE] != 1;

    if (memcmp(data + 0x10, "KBEC", 4) != 0 ) //KBEC
    {
        FATAL_ERROR("Not a valid KBEC cell file.\n");
    }

    options->cellCount = data[0x18] | (data[0x19] << 8);
    options->extended = data[0x1A] == 1;
    /*if (!options->extended)
    {
        //in theory not extended should be implemented, however not 100% sure
        FATAL_ERROR("Don't know how to deal with not extended yet, bug red031000.\n");
    }*/

    options->mappingType = data[0x20];

    options->cells = malloc(sizeof(struct Cell *) * options->cellCount);

    for (int i = 0; i < options->cellCount; i++)
    {
        int offset = 0x30 + (i * (options->extended ? 0x10 : 0x8));
        options->cells[i] = malloc(sizeof(struct Cell));
        options->cells[i]->oamCount = data[offset] | (data[offset + 1] << 8);
        short cellAttrs = data[offset + 2] | (data[offset + 3] << 8);
        options->cells[i]->attributes.hFlip = (cellAttrs >> 8) & 1;
        options->cells[i]->attributes.vFlip = (cellAttrs >> 9) & 1;
        options->cells[i]->attributes.hvFlip = (cellAttrs >> 10) & 1;
        options->cells[i]->attributes.boundingRect = (cellAttrs >> 11) & 1;
        options->cells[i]->attributes.boundingSphereRadius = cellAttrs & 0x3F;

        if (options->extended)
        {
            options->cells[i]->maxX = data[offset + 8] | (data[offset + 9] << 8);
            options->cells[i]->maxY = data[offset + 10] | (data[offset + 11] << 8);
            options->cells[i]->minX = data[offset + 12] | (data[offset + 13] << 8);
            options->cells[i]->minY = data[offset + 14] | (data[offset + 15] << 8);
        }
    }

    int offset = 0x30 + (options->cellCount * (options->extended ? 0x10 : 0x8));
    for (int i = 0; i < options->cellCount; i++)
    {
        options->cells[i]->oam = malloc(sizeof(struct OAM) * options->cells[i]->oamCount);
        for (int j = 0; j < options->cells[i]->oamCount; j++)
        {
            //Attr0

            //bits 0-7 Y coordinate
            options->cells[i]->oam[j].attr0.YCoordinate = data[offset];

            //bit 8 rotation
            options->cells[i]->oam[j].attr0.Rotation = data[offset + 1] & 1;

            //bit 9 Obj Size (if rotation) or Obj Disable (if not rotation)
            options->cells[i]->oam[j].attr0.SizeDisable = (data[offset + 1] >> 1) & 1;

            //bits 10-11 Obj Mode
            options->cells[i]->oam[j].attr0.Mode = (data[offset + 1] >> 2) & 3;

            //bit 12 Obj Mosaic
            options->cells[i]->oam[j].attr0.Mosaic = (data[offset + 1] >> 4) & 1;

            //bit 13 Colours
            options->cells[i]->oam[j].attr0.Colours = ((data[offset + 1] >> 5) & 1) == 0 ? 16 : 256;

            //bits 14-15 Obj Shape
            options->cells[i]->oam[j].attr0.Shape = (data[offset + 1] >> 6) & 3;

            //Attr1

            //bits 0-8 X coordinate
            options->cells[i]->oam[j].attr1.XCoordinate = data[offset + 2] | ((data[offset + 3] & 1) << 8);

            //bits 9-13 Rotation and scaling (if rotation) bit 12 Horizontal flip, bit 13 Vertical flip (if not rotation)
            options->cells[i]->oam[j].attr1.RotationScaling = (data[offset + 3] >> 1) & 0x1F;

            //bits 14-15 Obj Size
            options->cells[i]->oam[j].attr1.Size = (data[offset + 3] >> 6) & 3;

            //Attr2

            //bits 0-9 Character Name?
            options->cells[i]->oam[j].attr2.CharName = data[offset + 4] | ((data[offset + 5] & 3) << 8);

            //bits 10-11 Priority
            options->cells[i]->oam[j].attr2.Priority = (data[offset + 5] >> 2) & 3;

            //bits 12-15 Palette Number
            options->cells[i]->oam[j].attr2.Palette = (data[offset + 5] >> 4) & 0xF;

            offset += 6;
        }
    }

    if (options->labelEnabled)
    {
        int count = 0;
        int offset = 0x30 + (options->cellCount * 0x16) + 0x8;
        bool flag = false;
        //this entire thing is a huge assumption, it will not work with labels that are less than 2 characters long
        while (!flag)
        {
            if (strlen((char *) data + offset) < 2)
            {
                //probably a pointer, maybe?
                count++;
                offset += 4;
            }
            else
            {
                //huzzah a string
                flag = true;
            }
        }
        options->labelCount = count;
        options->labels = malloc(sizeof(char *) * count);
        for (int i = 0; i < count; i++)
        {
            options->labels[i] = malloc(strlen((char *) data + offset) + 1);
            strcpy(options->labels[i], (char *) data + offset);
            offset += strlen(options->labels[i]) + 1;
        }
        //after this should be txeu, if everything was done right
    }

    free(data);
}

void WriteNtrCell(char *path, struct JsonToCellOptions *options)
{
    FILE *fp = fopen(path, "wb");

    if (fp == NULL)
        FATAL_ERROR("Failed to open \"%s\" for writing.\n", path);

    unsigned int totalSize = (options->labelEnabled > 0 ? 0x34 : 0x20) + options->cellCount * (options->extended ? 0x16 : 0xe);

    if (options->labelEnabled)
    {
        for (int j = 0; j < options->labelCount; j++)
        {
            totalSize += (unsigned)strlen(options->labels[j]) + 5; //strlen + terminator + pointer
        }
    }

    WriteGenericNtrHeader(fp, "RECN", totalSize, true, false, options->labelEnabled ? 3 : 1);

    unsigned char KBECHeader[0x20] =
            {
                0x4B, 0x42, 0x45, 0x43, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00,
                0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
            };

    KBECHeader[8] = options->cellCount; //cell count

    if (options->extended)
    {
        KBECHeader[10] = 1; //extended
    }

    unsigned int size = options->cellCount * (options->extended ? 0x16 : 0xe);

    KBECHeader[4] = (size + 0x20) & 0xFF; //size
    KBECHeader[5] = (size + 0x20) >> 8; //unlikely to be more than 16 bits, but there are 32 allocated, change if necessary

    KBECHeader[16] = (options->mappingType & 0xFF); //not possible to be more than 8 bits, though 32 are allocated

    fwrite(KBECHeader, 1, 0x20, fp);

    unsigned char *KBECContents = malloc(size);

    memset(KBECContents, 0, size);

    /*if (!options->extended)
    {
        //in theory not extended should be implemented, however not 100% sure
        FATAL_ERROR("Don't know how to deal with not extended yet, bug red031000.\n");
    }*/

    int i;
    int iterNum = (options->extended ? 0x10 : 0x8);
    int totalOam = 0;
    for (i = 0; i < options->cellCount * iterNum; i += iterNum)
    {
        KBECContents[i] = options->cells[i / iterNum]->oamCount; //number of OAM entries
        short cellAttrs = (options->cells[i / iterNum]->attributes.hFlip << 8) | (options->cells[i / iterNum]->attributes.vFlip << 9)
                        | (options->cells[i / iterNum]->attributes.hvFlip << 10) | (options->cells[i / iterNum]->attributes.boundingRect << 11)
                        | (options->cells[i / iterNum]->attributes.boundingSphereRadius & 0x3F);
        KBECContents[i + 2] = cellAttrs & 0xff; //cell attributes
        KBECContents[i + 3] = cellAttrs >> 8;
        KBECContents[i + 4] = (totalOam * 6) & 0xff; //pointer to OAM data
        KBECContents[i + 5] = (totalOam * 6) >> 8; //unlikely to be more than 16 bits, but there are 32 allocated, change if necessary
        if (options->extended)
        {
            KBECContents[i + 8] = options->cells[i / iterNum]->maxX & 0xff; //maxX
            KBECContents[i + 9] = options->cells[i / iterNum]->maxX >> 8;
            KBECContents[i + 10] = options->cells[i / iterNum]->maxY & 0xff; //maxY
            KBECContents[i + 11] = options->cells[i / iterNum]->maxY >> 8;
            KBECContents[i + 12] = options->cells[i / iterNum]->minX & 0xff; //minX
            KBECContents[i + 13] = options->cells[i / iterNum]->minX >> 8;
            KBECContents[i + 14] = options->cells[i / iterNum]->minY & 0xff; //minY
            KBECContents[i + 15] = options->cells[i / iterNum]->minY >> 8;
        }
        totalOam += options->cells[i / iterNum]->oamCount;
    }

    //OAM data

    int offset = i;
    for (int j = 0; j < options->cellCount; j++)
    {
        for (int k = 0; k < options->cells[j]->oamCount; k++)
        {
            //Attr0

            //bits 0-7 Y coordinate
            KBECContents[offset] = options->cells[j]->oam[k].attr0.YCoordinate & 0xff;

            //bit 8 rotation
            KBECContents[offset + 1] = options->cells[j]->oam[k].attr0.Rotation;

            //bit 9 Obj Size (if rotation) or Obj Disable (if not rotation)
            KBECContents[offset + 1] |= options->cells[j]->oam[k].attr0.SizeDisable << 1;

            //bits 10-11 Obj Mode
            KBECContents[offset + 1] |= options->cells[j]->oam[k].attr0.Mode << 2;

            //bit 12 Obj Mosaic
            KBECContents[offset + 1] |= options->cells[j]->oam[k].attr0.Mosaic << 4;

            //bit 13 Colours
            KBECContents[offset + 1] |= (options->cells[j]->oam[k].attr0.Colours == 16 ? 0 : 1) << 5;

            //bits 14-15 Obj Shape
            KBECContents[offset + 1] |= options->cells[j]->oam[k].attr0.Shape << 6;

            //Attr1

            //bits 0-8 X coordinate
            KBECContents[offset + 2] = options->cells[j]->oam[k].attr1.XCoordinate & 0xff;
            KBECContents[offset + 3] = options->cells[j]->oam[k].attr1.XCoordinate >> 8;

            //bits 9-13 Rotation and scaling (if rotation) bit 12 Horizontal flip, bit 13 Vertical flip (if not rotation)
            KBECContents[offset + 3] |= options->cells[j]->oam[k].attr1.RotationScaling << 1;

            //bits 14-15 Obj Size
            KBECContents[offset + 3] |= options->cells[j]->oam[k].attr1.Size << 6;

            //Attr2

            //bits 0-9 Character Name?
            KBECContents[offset + 4] = options->cells[j]->oam[k].attr2.CharName & 0xff;
            KBECContents[offset + 5] = options->cells[j]->oam[k].attr2.CharName >> 8;

            //bits 10-11 Priority
            KBECContents[offset + 5] |= options->cells[j]->oam[k].attr2.Priority << 2;

            //bits 12-15 Palette Number
            KBECContents[offset + 5] |= options->cells[j]->oam[k].attr2.Palette << 4;

            offset += 6;
        }
    }

    fwrite(KBECContents, 1, size, fp);

    free(KBECContents);

    if (options->labelEnabled)
    {
        unsigned int lablSize = 8;
        for (int j = 0; j < options->labelCount; j++)
        {
            lablSize += (unsigned)strlen(options->labels[j]) + 5;
        }

        unsigned char *labl = malloc(lablSize);

        memset(labl, 0, lablSize);

        strcpy((char *) labl, "LBAL");
        labl[4] = lablSize & 0xff;
        labl[5] = lablSize >> 8;

        unsigned int position = 0;

        i = 0;
        for (int j = 0; j < options->labelCount; j++)
        {
            labl[i + 8] = position & 0xff;
            labl[i + 9] = position >> 8;

            position += (unsigned)strlen(options->labels[j]) + 1;
            i += 4;
        }

        for (int j = 0; j < options->labelCount; j++)
        {
            strcpy((char *) (labl + (i + 8)), options->labels[j]);
            i += (int)strlen(options->labels[j]) + 1;
        }

        fwrite(labl, 1, lablSize, fp);

        free(labl);

        unsigned char txeu[0xc] = {0x54, 0x58, 0x45, 0x55, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};

        fwrite(txeu, 1, 0xc, fp);
    }

    fclose(fp);
}

void WriteNtrScreen(char *path, struct JsonToScreenOptions *options)
{
    FILE *fp = fopen(path, "wb");

    if (fp == NULL)
        FATAL_ERROR("Failed to open \"%s\" for writing.\n", path);

    int totalSize = options->width * options->height * 2 + 0x14;

    WriteGenericNtrHeader(fp, "RCSN", totalSize, true, false, 1);

    unsigned char NSCRHeader[0x14] = { 0x4E, 0x52, 0x43, 0x53, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                       0x00, 0x00, 0x00, 0x00 };

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

void ReadNtrAnimation(char *path, struct JsonToAnimationOptions *options)
{
    int fileSize;
    unsigned char *data = ReadWholeFile(path, &fileSize);

    if (memcmp(data, "RNAN", 4) != 0 && memcmp(data, "RAMN", 4) != 0) //NANR/NMAR
    {
        FATAL_ERROR("Not a valid NANR/NMAR animation file.\n");
    }

    options->labelEnabled = data[0xE] != 1;

    if (memcmp(data + 0x10, "KNBA", 4) != 0 ) //ABNK
    {
        FATAL_ERROR("Not a valid ABNK animation file.\n");
    }

    options->sequenceCount = data[0x18] | (data[0x19] << 8);
    options->frameCount = data[0x1A] | (data[0x1B] << 8);

    options->sequenceData = malloc(sizeof(struct SequenceData *) * options->sequenceCount);

    for (int i = 0; i < options->sequenceCount; i++)
    {
        options->sequenceData[i] = malloc(sizeof(struct SequenceData));
    }

    int offset = 0x30;

    unsigned int *frameOffsets = malloc(sizeof(unsigned int) * options->sequenceCount);

    for (int i = 0; i < options->sequenceCount; i++, offset += 0x10)
    {
        options->sequenceData[i]->frameCount = data[offset] | (data[offset + 1] << 8);
        options->sequenceData[i]->loopStartFrame = data[offset + 2] | (data[offset + 3] << 8);
        options->sequenceData[i]->animationElement = data[offset + 4] | (data[offset + 5] << 8);
        options->sequenceData[i]->animationType = data[offset + 6] | (data[offset + 7] << 8);
        options->sequenceData[i]->playbackMode = data[offset + 8] | (data[offset + 9] << 8) | (data[offset + 10] << 16) | (data[offset + 11] << 24);
        frameOffsets[i] = data[offset + 12] | (data[offset + 13] << 8) | (data[offset + 14] << 16) | (data[offset + 15] << 24);

        options->sequenceData[i]->frameData = malloc(sizeof(struct FrameData *) * options->sequenceData[i]->frameCount);
        for (int j = 0; j < options->sequenceData[i]->frameCount; j++)
        {
            options->sequenceData[i]->frameData[j] = malloc(sizeof(struct FrameData));
        }
    }

    int *resultOffsets = malloc(sizeof(int) * options->frameCount);
    memset(resultOffsets, -1, sizeof(int) * options->frameCount);

    for (int i = 0; i < options->sequenceCount; i++)
    {
        for (int j = 0; j < options->sequenceData[i]->frameCount; j++)
        {
            int frameOffset = offset + frameOffsets[i] + j * 0x8;
            options->sequenceData[i]->frameData[j]->resultOffset = data[frameOffset] | (data[frameOffset + 1] << 8) | (data[frameOffset + 2] << 16) | (data[frameOffset + 3] << 24);
            options->sequenceData[i]->frameData[j]->frameDelay = data[frameOffset + 4] | (data[frameOffset + 5] << 8);
            //0xBEEF

            //the following is messy
            bool present = false;
            //check for offset in array
            for (int k = 0; k < options->frameCount; k++)
            {
                if (resultOffsets[k] == options->sequenceData[i]->frameData[j]->resultOffset)
                {
                    present = true;
                    break;
                }
            }

            //add data if not present
            if (!present)
            {
                for (int k = 0; i < options->frameCount; k++)
                {
                    if (resultOffsets[k] == -1)
                    {
                        resultOffsets[k] = options->sequenceData[i]->frameData[j]->resultOffset;
                        break;
                    }
                }
            }
        }
    }

    free(frameOffsets);

    offset = 0x18 + (data[0x24] | (data[0x25] << 8) | (data[0x26] << 16) | (data[0x27] << 24)); //start of animation results

    int k;

    for (k = 0; k < options->frameCount; k++)
    {
        if (resultOffsets[k] == -1)
            break;
    }
    options->resultCount = k;

    free(resultOffsets);

    options->animationResults = malloc(sizeof(struct AnimationResults *) * options->resultCount);

    for (int i = 0; i < options->resultCount; i++)
    {
        options->animationResults[i] = malloc(sizeof(struct AnimationResults));
    }
    
    int resultOffset = 0;
    for (int i = 0; i < options->resultCount; i++)
    {
        if (data[offset + 2] == 0xCC && data[offset + 3] == 0xCC)
        {
            options->animationResults[i]->resultType = 0;
        }
        else if (data[offset + 2] == 0xEF && data[offset + 3] == 0xBE)
        {
            options->animationResults[i]->resultType = 2;
        }
        else
        {
            options->animationResults[i]->resultType = 1;
        }
        for (int j = 0; j < options->sequenceCount; j++)
        {
            for (int k = 0; k < options->sequenceData[j]->frameCount; k++)
            {
                if (options->sequenceData[j]->frameData[k]->resultOffset == resultOffset)
                {
                    options->sequenceData[j]->frameData[k]->resultId = i;
                }
            }
        }
        switch (options->animationResults[i]->resultType)
        {
            case 0: //index
                options->animationResults[i]->index = data[offset] | (data[offset + 1] << 8);
                resultOffset += 0x4;
                offset += 0x4;
                break;

            case 1: //SRT
                options->animationResults[i]->dataSrt.index = data[offset] | (data[offset + 1] << 8);
                options->animationResults[i]->dataSrt.rotation = data[offset + 2] | (data[offset + 3] << 8);
                options->animationResults[i]->dataSrt.scaleX = data[offset + 4] | (data[offset + 5] << 8) | (data[offset + 6] << 16) | (data[offset + 7] << 24);
                options->animationResults[i]->dataSrt.scaleY = data[offset + 8] | (data[offset + 9] << 8) | (data[offset + 10] << 16) | (data[offset + 11] << 24);
                options->animationResults[i]->dataSrt.positionX = data[offset + 12] | (data[offset + 13] << 8);
                options->animationResults[i]->dataSrt.positionY = data[offset + 14] | (data[offset + 15] << 8);
                resultOffset += 0x10;
                offset += 0x10;
                break;

            case 2: //T
                options->animationResults[i]->dataT.index = data[offset] | (data[offset + 1] << 8);
                options->animationResults[i]->dataT.positionX = data[offset + 4] | (data[offset + 5] << 8);
                options->animationResults[i]->dataT.positionY = data[offset + 6] | (data[offset + 7] << 8);
                resultOffset += 0x8;
                offset += 0x8;
                break;
        }
    }

    if (options->labelEnabled)
    {
        options->labelCount = options->sequenceCount; //*should* be the same
        options->labels = malloc(sizeof(char *) * options->labelCount);
        offset += 0x8 + options->labelCount * 0x4; //skip to label data
        for (int i = 0; i < options->labelCount; i++)
        {
            options->labels[i] = malloc(strlen((char *)data + offset) + 1);
            strcpy(options->labels[i], (char *)data + offset);
            offset += strlen((char *)data + offset) + 1;
        }
    }

    free(data);
}

void WriteNtrAnimation(char *path, struct JsonToAnimationOptions *options)
{
    FILE *fp = fopen(path, "wb");

    if (fp == NULL)
        FATAL_ERROR("Failed to open \"%s\" for writing.\n", path);

    unsigned int totalSize = 0x20 + options->sequenceCount * 0x10 + options->frameCount * 0x8;

    //todo: check these
    for (int i = 0; i < options->resultCount; i++)
    {
        if (options->animationResults[i]->resultType == 0)
            totalSize += 0x4;
        else if (options->animationResults[i]->resultType == 1)
            totalSize += 0x10;
        else if (options->animationResults[i]->resultType == 2)
            totalSize += 0x8;
    }

    unsigned int KNBASize = totalSize;

    if (options->labelEnabled)
    {
        totalSize += options->multiCell ? 0x8 : 0x14;
        for (int j = 0; j < options->labelCount; j++)
        {
            totalSize += (unsigned)strlen(options->labels[j]) + 5; //strlen + terminator + pointer
        }
    }

    WriteGenericNtrHeader(fp, options->multiCell ? "RAMN" : "RNAN", totalSize, true, false, options->labelEnabled ? (options->multiCell ? 2 : 3) : 1);

    unsigned char KBNAHeader[0x20] =
        {
            0x4B, 0x4E, 0x42, 0x41, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00,
            0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
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
    for (i = 0; i < options->sequenceCount * 0x10; i += 0x10)
    {
        KBNAContents[i] = options->sequenceData[i / 0x10]->frameCount & 0xff;
        KBNAContents[i + 1] = options->sequenceData[i / 0x10]->frameCount >> 8;
        KBNAContents[i + 2] = options->sequenceData[i / 0x10]->loopStartFrame & 0xff;
        KBNAContents[i + 3] = options->sequenceData[i / 0x10]->loopStartFrame >> 8;
        KBNAContents[i + 4] = options->sequenceData[i / 0x10]->animationElement & 0xff;
        KBNAContents[i + 5] = options->sequenceData[i / 0x10]->animationElement >> 8;
        KBNAContents[i + 6] = options->sequenceData[i / 0x10]->animationType & 0xff;
        KBNAContents[i + 7] = options->sequenceData[i / 0x10]->animationType >> 8;
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
    for (j = i, m = 0; m < options->sequenceCount; m++)
    {
        for (int k = 0; k < options->sequenceData[m]->frameCount; k++) {
            int resPtr = 0;
            for (int l = 0; l < options->sequenceData[m]->frameData[k]->resultId; l++) {
                if (options->animationResults[l]->resultType == 0)
                    resPtr += 0x4;
                else if (options->animationResults[l]->resultType == 1)
                    resPtr += 0x10;
                else if (options->animationResults[l]->resultType == 2)
                    resPtr += 0x8;
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

    //todo: these are extrapolated, need confirming
    int resPtrCounter = j;
    for (int k = 0; k < options->resultCount; k++)
    {
        switch (options->animationResults[k]->resultType)
        {
            case 0:
                KBNAContents[resPtrCounter] = options->animationResults[k]->index & 0xff;
                KBNAContents[resPtrCounter + 1] = options->animationResults[k]->index >> 8;
                KBNAContents[resPtrCounter + 2] = 0xCC;
                KBNAContents[resPtrCounter + 3] = 0xCC;
                resPtrCounter += 0x4;
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
    }

    fwrite(KBNAContents, 1, contentsSize, fp);

    free(KBNAContents);

    if (options->labelEnabled)
    {
        unsigned int lablSize = 8;
        for (int j = 0; j < options->labelCount; j++)
        {
            lablSize += (unsigned)strlen(options->labels[j]) + 5;
        }

        unsigned char *labl = malloc(lablSize);

        memset(labl, 0, lablSize);

        strcpy((char *) labl, "LBAL");
        labl[4] = lablSize & 0xff;
        labl[5] = lablSize >> 8;

        unsigned int position = 0;

        i = 0;
        for (int j = 0; j < options->labelCount; j++)
        {
            labl[i + 8] = position & 0xff;
            labl[i + 9] = position >> 8;

            position += (unsigned)strlen(options->labels[j]) + 1;
            i += 4;
        }

        for (int j = 0; j < options->labelCount; j++)
        {
            strcpy((char *) (labl + (i + 8)), options->labels[j]);
            i += (int)strlen(options->labels[j]) + 1;
        }

        fwrite(labl, 1, lablSize, fp);

        free(labl);

        if(!options->multiCell)
        {
            unsigned char txeu[0xc] = {0x54, 0x58, 0x45, 0x55, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};

            fwrite(txeu, 1, 0xc, fp);
        }
    }

    fclose(fp);
}
