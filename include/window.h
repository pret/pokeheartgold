#ifndef POKEHEARTGOLD_WINDOW_H
#define POKEHEARTGOLD_WINDOW_H

#include "heap.h"
#include "gx_layers.h"

typedef struct BGTEMPLATE {
    u32 x;
    u32 y;
    u32 bufferSize;
    u32 baseTile;
    u8 size;
    u8 colorMode;
    u8 screenBase;
    u8 charBase;
    u8 bgExtPltt;
    u8 priority;
    u8 areaOver;
    u8 dummy;
    u32 mosaic;
} BGTEMPLATE;

typedef struct BG {
    void *tilemapBuffer;
    u32 bufferSize;
    u32 baseTile;

    fx32 hOffset;
    fx32 vOffset;

    u8 mode;
    u8 size;
    u8 colorMode;
    u8 tileSize;
    u16 rotation;
    u16 unk22; // probably padding
    fx32 xScale;
    fx32 yScale;
    fx32 centerX;
    fx32 centerY;
} BG;

typedef struct BGCONFIG {
    HeapID heap_id;
    u16 scrollScheduled;
    u16 bufferTransferScheduled;
    BG bgs[8];
} BGCONFIG;

typedef struct BITMAP {
    const u8 *pixels;
    u16 width;
    u16 height;
} BITMAP;

typedef struct WINDOWTEMPLATE {
    u8 bgId;
    u8 left;
    u8 top;
    u8 width;
    u8 height;
    u8 palette;
    u16 baseBlock;
} WINDOWTEMPLATE;

typedef struct WINDOW {
    BGCONFIG *bgConfig;
    u8 bgId;
    u8 tilemapLeft;
    u8 tilemapTop;
    u8 width;
    u8 height;
    u8 paletteNum;
    u16 baseTile : 15;
    u16 colorMode : 1;
    void *pixelBuffer;
} WINDOW;

enum GFScreen {
    SCREEN_MAIN = 0,
    SCREEN_SUB  = 1,
};

enum GFBppMode {
    GF_BG_CLR_4BPP = 0,
    GF_BG_CLR_8BPP,
};

enum GFBgType {
    GF_BG_TYPE_TEXT = 0,
    GF_BG_TYPE_AFFINE,
    GF_BG_TYPE_256x16PLTT,
};

enum GFBgCntSet {
    GF_BG_CNT_SET_COLOR_MODE = 0,
    GF_BG_CNT_SET_SCREEN_BASE,
    GF_BG_CNT_SET_CHAR_BASE,
    GF_BG_CNT_SET_SCREEN_SIZE,
};

enum GFBgScreenSize {
    GF_BG_SCR_SIZE_128x128 = 0,
    GF_BG_SCR_SIZE_256x256,
    GF_BG_SCR_SIZE_256x512,
    GF_BG_SCR_SIZE_512x256,
    GF_BG_SCR_SIZE_512x512,
    GF_BG_SCR_SIZE_1024x1024,
};

enum BgPosAdjustOp {
    // Text layers
    BG_POS_OP_SET_X = 0,
    BG_POS_OP_ADD_X,
    BG_POS_OP_SUB_X,
    BG_POS_OP_SET_Y,
    BG_POS_OP_ADD_Y,
    BG_POS_OP_SUB_Y,

    // Affine layers
    BG_POS_OP_SET_ROT = 0,
    BG_POS_OP_ADD_ROT,
    BG_POS_OP_SUB_ROT,
    BG_POS_OP_SET_CENTERX = 9,
    BG_POS_OP_ADD_CENTERX,
    BG_POS_OP_SUB_CENTERX,
    BG_POS_OP_SET_CENTERY,
    BG_POS_OP_ADD_CENTERY,
    BG_POS_OP_SUB_CENTERY,
};

enum {
    TILE_SIZE_4BPP = 32,
    TILE_SIZE_8BPP = 64,
};

struct GFBgModeSet {
    GXDispMode dispMode;
    GXBGMode bgModeMain;
    GXBGMode bgModeSub;
    GXBG0As _2d3dSwitch;
};

#define TILEMAP_COPY_SRC_FLAT       0  // Source dimensions are equal to dest dimensions
#define TILEMAP_COPY_SRC_RECT       1  // Dest dimensions carve out a window from source

// Passed to FillBgTilemapRect(Text) mode arg. 0-15 = palette selection. 16,17 as defined.
#define TILEMAP_FILL_KEEP_PAL      16  // Do not replace the selected palette index
#define TILEMAP_FILL_OVWT_PAL      17  // Fill value includes palette

void BgSetPosTextAndCommit(BGCONFIG *bgConfig, enum GFBgLayer bgId, enum BgPosAdjustOp op, fx32 value);

#endif //POKEHEARTGOLD_WINDOW_H
