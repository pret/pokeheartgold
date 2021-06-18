// Copyright (c) 2015 YamaArashi

#ifndef GFX_H
#define GFX_H

#include <stdint.h>
#include <stdbool.h>

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
	unsigned char *pixels;
	bool hasPalette;
	struct Palette palette;
	bool hasTransparency;
};

void ReadImage(char *path, int tilesWidth, int bitDepth, int metatileWidth, int metatileHeight, struct Image *image, bool invertColors);
uint32_t ReadNtrImage(char *path, int tilesWidth, int bitDepth, int metatileWidth, int metatileHeight, struct Image *image, bool invertColors);
void WriteImage(char *path, int numTiles, int bitDepth, int metatileWidth, int metatileHeight, struct Image *image, bool invertColors);
void WriteNtrImage(char *path, int numTiles, int bitDepth, int metatileWidth, int metatileHeight, struct Image *image, bool invertColors, bool clobberSize, bool byteOrder, bool version101, bool sopc, bool scanned, uint32_t key);
void FreeImage(struct Image *image);
void ReadGbaPalette(char *path, struct Palette *palette);
void ReadNtrPalette(char *path, struct Palette *palette, int bitdepth, int palIndex);
void WriteGbaPalette(char *path, struct Palette *palette);
void WriteNtrPalette(char *path, struct Palette *palette, bool ncpr, bool ir, int bitdepth, bool pad, int compNum);

#endif // GFX_H
