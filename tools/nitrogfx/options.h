// Copyright (c) 2018 huderlem

#ifndef OPTIONS_H
#define OPTIONS_H

#include <stdbool.h>

struct GbaToPngOptions {
    char *paletteFilePath;
    int bitDepth;
    bool hasTransparency;
    int width;
    int metatileWidth;
    int metatileHeight;
    int palIndex;
};

struct PngToGbaOptions {
    int numTiles;
    int bitDepth;
    int metatileWidth;
    int metatileHeight;
};

struct PngToNtrOptions {
    int numTiles;
    int bitDepth;
    int metatileWidth;
    int metatileHeight;
    bool clobberSize;
    bool byteOrder;
    bool version101;
    bool sopc;
    uint32_t scanMode;
    bool handleEmpty;
};

struct NtrToPngOptions {
    char *paletteFilePath;
    int bitDepth;
    bool hasTransparency;
    int width;
    int metatileWidth;
    int metatileHeight;
    int palIndex;
    bool scanFrontToBack;
    bool handleEmpty;
};


#endif // OPTIONS_H
