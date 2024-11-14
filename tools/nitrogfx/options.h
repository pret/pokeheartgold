// Copyright (c) 2018 huderlem, 2021-2024 red031000

#ifndef OPTIONS_H
#define OPTIONS_H

#include <stdint.h>
#include <stdbool.h>

struct GbaToPngOptions {
    char *paletteFilePath;
    int bitDepth;
    bool hasTransparency;
    int width;
    int colsPerChunk;
    int rowsPerChunk;
    int palIndex;
};

struct PngToGbaOptions {
    int numTiles;
    int bitDepth;
    int colsPerChunk;
    int rowsPerChunk;
};

struct PngToNtrOptions {
    int numTiles;
    int bitDepth;
    int colsPerChunk;
    int rowsPerChunk;
    bool clobberSize;
    bool byteOrder;
    bool version101;
    bool sopc;
    uint32_t scanMode;
    bool wrongSize;
    bool handleEmpty;
    bool vramTransfer;
    int mappingType;
};

struct NtrToPngOptions {
    char *paletteFilePath;
    int bitDepth;
    bool hasTransparency;
    int width;
    int colsPerChunk;
    int rowsPerChunk;
    int palIndex;
    bool scanFrontToBack;
    bool handleEmpty;
};

struct CellVramTransferData {
    int sourceDataOffset;
    int size;
};

struct Attr0 {
    int YCoordinate;
    bool Rotation;
    bool SizeDisable;
    int Mode;
    bool Mosaic;
    int Colours;
    int Shape;
};

struct Attr1 {
    int XCoordinate;
    int RotationScaling;
    int Size;
};

struct Attr2 {
    int CharName;
    int Priority;
    int Palette;
};

struct OAM {
    struct Attr0 attr0;
    struct Attr1 attr1;
    struct Attr2 attr2;
};

struct CellAttributes {
    bool hFlip; // 1 << 8
    bool vFlip; // 1 << 9
    bool hvFlip; // 1 << 10
    bool boundingRect; // 1 << 11
    int boundingSphereRadius; // 1 << 0 (6 bits);
};

struct Cell {
    struct CellAttributes attributes;
    short maxX;
    short maxY;
    short minX;
    short minY;
    short oamCount;
    struct OAM *oam;
};

struct JsonToCellOptions {
    bool labelEnabled;
    bool extended;
    bool vramTransferEnabled;
    int mappingType;
    int cellCount;
    struct Cell **cells;
    int vramTransferMaxSize;
    struct CellVramTransferData **transferData;
    char **labels;
    int labelCount;
};

struct JsonToScreenOptions {
    int height;
    int width;
    unsigned short *data;
    int bitdepth;
};

struct FrameData {
    int resultId;
    short frameDelay;
    int resultOffset;
};

struct SequenceData {
    short frameCount;
    short loopStartFrame;
    short animationElement;
    short animationType;
    int playbackMode;
    struct FrameData **frameData;
};

struct AnimationDataSRT {
    short index;
    unsigned short rotation;
    int scaleX;
    int scaleY;
    short positionX;
    short positionY;
};

struct AnimationDataT {
    short index;
    //unsigned short rotation;
    short positionX;
    short positionY;
};

struct AnimationResults {
    short resultType;
    bool padded;
    union {
        short index;
        struct AnimationDataSRT dataSrt;
        struct AnimationDataT dataT;
    };
};

struct JsonToAnimationOptions {
    bool multiCell;
    short sequenceCount;
    short frameCount;
    struct SequenceData **sequenceData;
    struct AnimationResults **animationResults;
    bool labelEnabled;
    char **labels;
    int labelCount;
    short resultCount;
};

struct NtrFontOptions {
    char *metadataFilePath;
    bool useSubscreenPalette;
};

struct NtrFontMetadata {
    uint32_t size;
    uint32_t widthTableOffset;
    uint32_t numGlyphs;
    uint8_t maxWidth;
    uint8_t maxHeight;
    uint8_t glyphWidth;
    uint8_t glyphHeight;

    uint8_t *glyphWidthTable;
};

#endif // OPTIONS_H
