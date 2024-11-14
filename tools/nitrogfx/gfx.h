// Copyright (c) 2015 YamaArashi, 2021-2024 red031000

#ifndef GFX_H
#define GFX_H

#include <stdint.h>
#include <stdbool.h>
#include "options.h"

struct Color {
	unsigned char red;
	unsigned char green;
	unsigned char blue;
};

struct Palette {
	struct Color colors[256];
	int numColors;
	int bitDepth;
};

struct Image {
	int width;
	int height;
	int bitDepth;
    /**
     * Pseudocode for converting index in pixels to coordinates in image is as follows
     *      (where (0, 0) is the top left corner with the format (x, y) ):
     * if (bitDepth == 4)
     *      for (int i = 0; i < width * height / 2; i++)
     *          xCoord = i % <WIDTH OF IMAGE>
     *          yCoord = i / <WIDTH OF IMAGE>
     *
     *          leftPixel = pixels[i] & 0xF
     *          rightPixel = pixels[i] >> 4)
     *
     *          leftPixel coordinates: (xCoord, yCoord)
     *          rightPixel coordinates: (xCoord + 1, yCoord)
     * else if (bitDepth == 8)
     *      for (int i = 0; i < width * height; i++)
     *          xCoord = i % <WIDTH OF IMAGE>
     *          yCoord = i / <WIDTH OF IMAGE>
     *
     *          pixel = pixels[i]
     *          pixel coordinates: (xCoord, yCoord)
     */
	unsigned char *pixels;
	bool hasPalette;
	struct Palette palette;
	bool hasTransparency;
};

void ReadImage(char *path, int tilesWide, int bitDepth, int colsPerChunk, int rowsPerChunk, struct Image *image, bool invertColors);
uint32_t ReadNtrImage(char *path, int tilesWide, int bitDepth, int colsPerChunk, int rowsPerChunk, struct Image *image, bool invertColors, bool scanFrontToBack);
void WriteImage(char *path, int numTiles, int bitDepth, int colsPerChunk, int rowsPerChunk, struct Image *image, bool invertColors);
void WriteNtrImage(char *path, int numTiles, int bitDepth, int colsPerChunk, int rowsPerChunk, struct Image *image,
                   bool invertColors, bool clobberSize, bool byteOrder, bool version101, bool sopc, bool vram, uint32_t scanMode,
                   uint32_t mappingType, uint32_t key, bool wrongSize);
void FreeImage(struct Image *image);
void ReadGbaPalette(char *path, struct Palette *palette);
void ReadNtrPalette(char *path, struct Palette *palette, int bitdepth, int palIndex, bool inverted);
void WriteGbaPalette(char *path, struct Palette *palette);
void WriteNtrPalette(char *path, struct Palette *palette, bool ncpr, bool ir, int bitdepth, bool pad, int compNum, bool pcmp, bool inverted);
void ReadNtrCell(char *path, struct JsonToCellOptions *options);
void WriteNtrCell(char *path, struct JsonToCellOptions *options);
void WriteNtrScreen(char *path, struct JsonToScreenOptions *options);
void ReadNtrAnimation(char *path, struct JsonToAnimationOptions *options);
void WriteNtrAnimation(char *path, struct JsonToAnimationOptions *options);

#endif // GFX_H
