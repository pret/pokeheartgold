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
    GF_BG_TYPE_MAX,
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
    BG_POS_OP_SET_XSCALE,
    BG_POS_OP_ADD_XSCALE,
    BG_POS_OP_SUB_XSCALE,
    BG_POS_OP_SET_YSCALE,
    BG_POS_OP_ADD_YSCALE,
    BG_POS_OP_SUB_YSCALE,
    BG_POS_OP_SET_CENTERX,
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

BGCONFIG *BgConfig_Alloc(HeapID heapId);
HeapID BgConfig_GetHeapId(BGCONFIG *bgConfig);
void SetBothScreensModesAndDisable(const struct GFBgModeSet *modeSet);
void SetScreenModeAndDisable(const struct GFBgModeSet *modeSet, enum GFScreen screen);
void InitBgFromTemplateEx(BGCONFIG *bgConfig, u8 bgId, const BGTEMPLATE *template, u8 bgMode, GX_LayerToggle enable);
void InitBgFromTemplate(BGCONFIG *bgConfig, u8 bgId, const BGTEMPLATE *template, u8 bgMode);
void SetBgControlParam(BGCONFIG *config, u8 bgId, enum GFBgCntSet attr, u8 value);
void FreeBgTilemapBuffer(BGCONFIG *bgConfig, u8 layer);
void SetBgPriority(u8 layer, int priority);
void ToggleBgLayer(u8 layer, u8 toggle);
void BgSetPosTextAndCommit(BGCONFIG *bgConfig, enum GFBgLayer bgId, enum BgPosAdjustOp op, fx32 val);
fx32 Bg_GetXpos(const BGCONFIG *bgConfig, u8 layer);
fx32 Bg_GetYpos(const BGCONFIG *bgConfig, u8 layer);
void Bg_SetTextDimAndAffineParams(BGCONFIG *bgConfig, u8 layer, enum BgPosAdjustOp op, fx32 value, MtxFx22 *mtx, fx32 centerX, fx32 centerY);
void SetBgAffine(BGCONFIG *bgConfig, u8 layer, MtxFx22 *mtx, fx32 centerX, fx32 centerY);
void BgCommitTilemapBufferToVram(BGCONFIG *bgConfig, u8 layer);
void BgCopyOrUncompressTilemapBufferRangeToVram(BGCONFIG *bgConfig, u8 layer, const void *buffer, u32 bufferSize, u32 baseTile);
void BG_LoadScreenTilemapData(BGCONFIG *bgConfig, u8 layer, const void *data, u32 size);
void BG_LoadCharTilesData(BGCONFIG *bgConfig, u8 layer, const void *data, u32 size, u32 tileStart);
void BG_ClearCharDataRange(u8 layer, u32 size, u32 offset, HeapID heapId);
void BG_FillCharDataRange(BGCONFIG *bgConfig, u32 layer, u8 fillValue, u32 ntiles, u32 offset);
void BG_LoadPlttData(u8 layer, const void *data, u32 size, u32 offset);
void BG_LoadBlankPltt(u8 layer, u32 size, u32 offset, HeapID heapId);
void BG_SetMaskColor(u8 layer, u16 value);
void LoadRectToBgTilemapRect(BGCONFIG *bgConfig, u8 layer, const void *buf, u8 destX, u8 destY, u8 width, u8 height);
void CopyToBgTilemapRect(BGCONFIG *bgConfig, u8 layer, u8 destX, u8 destY, u8 destWidth, u8 destHeight, const void *buf, u8 srcX, u8 srcY, u8 srcWidth, u8 srcHeight);
void CopyRectToBgTilemapRect(BGCONFIG *bgConfig, u8 layer, u8 destX, u8 destY, u8 destWidth, u8 destHeight, const void *buf, u8 srcX, u8 srcY, u8 srcWidth, u8 srcHeight);
void FillBgTilemapRect(BGCONFIG *bgConfig, u8 layer, u16 value, u8 x, u8 y, u8 width, u8 height, u8 mode);
void BgTilemapRectChangePalette(BGCONFIG *bgConfig, u8 layer, u8 x, u8 y, u8 width, u8 height, u8 palette);
void BgClearTilemapBufferAndCommit(BGCONFIG *bgConfig, u8 layer);
void BgFillTilemapBufferAndCommit(BGCONFIG *bgConfig, u8 layer, u16 value);
void BgFillTilemapBufferAndSchedule(BGCONFIG *bgConfig, u8 layer, u16 value);
void *BgGetCharPtr(u8 layer);
u8 *Convert4bppTo8bpp(u8 *src4Bpp, u32 size, u8 paletteNum, u32 heap_id);
void *GetBgTilemapBuffer(BGCONFIG *bgConfig, u8 layer);
fx32 GetBgHOffset(BGCONFIG *bgConfig, u8 layer);
u8 GetBgColorMode(BGCONFIG *bgConfig, u8 layer);
u16 GetBgPriority(BGCONFIG *bgConfig, u8 layer);
void BlitBitmapRect4Bit(const BITMAP *src, const BITMAP *dst, u16 srcX, u16 srcY, u16 dstX, u16 dstY, u16 width, u16 height, u16 colorKey);
WINDOW *AllocWindows(HeapID heapId, int num);
void InitWindow(WINDOW *window);
BOOL WindowIsInUse(const WINDOW *window);
void AddWindowParameterized(BGCONFIG *bgConfig, WINDOW *window, u8 layer, u8 x, u8 y, u8 width, u8 height, u8 paletteNum, u16 baseTile);
void AddTextWindowTopLeftCorner(BGCONFIG *bgConfig, WINDOW *window, u8 width, u8 height, u16 baseTile, u8 paletteNum);
void AddWindow(BGCONFIG *bgConfig, WINDOW *window, const WINDOWTEMPLATE *template);
void RemoveWindow(WINDOW* window);
void WindowArray_dtor(WINDOW *window, int num);
void CopyWindowToVram(WINDOW *window);
void ScheduleWindowCopyToVram(WINDOW *window);
void PutWindowTilemap(WINDOW *window);
void ClearWindowTilemap(WINDOW *window);
void CopyWindowPixelsToVram_TextMode(WINDOW *window);
void ClearWindowTilemapAndCopyToVram(WINDOW *window);
void ClearWindowTilemapAndScheduleTransfer(WINDOW *window);
void FillWindowPixelBuffer(WINDOW *window, u8 fillValue);
void FillWindowPixelBufferText_AssumeTileSize32(WINDOW *window, u8 fillValue);
void BlitBitmapRectToWindow(WINDOW *window, void *src, u16 srcX, u16 srcY, u16 srcWidth, u16 srcHeight, u16 destX, u16 destY, u16 destWidth, u16 destHeight);
void BlitBitmapRect(WINDOW *window, void *src, u16 srcX, u16 srcY, u16 srcWidth, u16 srcHeight, u16 destX, u16 destY, u16 destWidth, u16 destHeight, u16 colorKey);
void FillWindowPixelRect(WINDOW *window, u8 fillValue, u16 x, u16 y, u16 width, u16 height);
void CopyGlyphToWindow(WINDOW *window, u8 *glyphPixels, u16 srcWidth, u16 srcHeight, u16 dstX, u16 dstY, u16 table);
void ScrollWindow(WINDOW *window, u8 direction, u8 y, u8 fillValue);
BGCONFIG *GetWindowBgConfig(WINDOW *window);
u8 GetWindowBgId(WINDOW *window);
u8 GetWindowWidth(WINDOW *window);
u8 GetWindowHeight(WINDOW *window);
u8 GetWindowX(WINDOW *window);
u8 GetWindowY(WINDOW *window);
u16 GetWindowBaseTile(WINDOW *window);
void SetWindowX(WINDOW *window, u8 x);
void SetWindowY(WINDOW *window, u8 y);
void SetWindowPaletteNum(WINDOW *window, u8 paletteNum);
void BgConfig_HandleScheduledScrollAndTransferOps(BGCONFIG *bgConfig);
void ScheduleBgTilemapBufferTransfer(BGCONFIG *bgConfig, u8 layer);
void ScheduleSetBgPosText(BGCONFIG *bgConfig, u8 layer, enum BgPosAdjustOp op, fx32 value);
void ScheduleSetBgAffineScale(BGCONFIG *bgConfig, u8 layer, enum BgPosAdjustOp op, fx32 value);
BOOL DoesPixelAtScreenXYMatchPtrVal(BGCONFIG *bgConfig, u8 layer, u8 x, u8 y, u16 *src);

#endif //POKEHEARTGOLD_WINDOW_H
