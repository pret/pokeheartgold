// Copyright (c) 2015 YamaArashi

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
                FATAL_ERROR("8bpp is not implemented yet\n");
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

void WriteNtrImage(char *path, int numTiles, int bitDepth, int metatileWidth, int metatileHeight, struct Image *image, bool invertColors, bool clobberSize, bool byteOrder, bool version101, bool sopc, uint32_t scanMode, uint32_t key)
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

    WriteGenericNtrHeader(fp, "RGCN", bufferSize + (sopc ? 0x30 : 0x20), byteOrder, version101, sopc ? 2 : 1);

    unsigned char charHeader[0x20] = { 0x52, 0x41, 0x48, 0x43, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00 };

    charHeader[4] = (bufferSize + 0x20) & 0xFF;
    charHeader[5] = ((bufferSize + 0x20) >> 8) & 0xFF;
    charHeader[6] = ((bufferSize + 0x20) >> 16) & 0xFF;
    charHeader[7] = ((bufferSize + 0x20) >> 24) & 0xFF;

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

        charHeader[16] = 0x10; //seems to be set when size is clobbered
    }

    charHeader[12] = bitDepth == 4 ? 3 : 4;

    if (scanMode)
    {
        charHeader[20] = 1;
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

    palette->numColors = bitdepth == 4 ? 16 : 256; //remove header and divide by 2

    unsigned char *paletteData = paletteHeader + 0x18;
    palIndex = palIndex - 1;

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

    unsigned char colours[colourNum * 2];
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

    fclose(fp);
}
