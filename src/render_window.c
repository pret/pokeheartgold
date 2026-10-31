#include "render_window.h"

#include "gf_gfx_loader.h"
#include "render_text.h"

void sub_0200E6B4(BgConfig *bgConfig, u8 bgLayer, u8 x, u8 y, u8 width, u8 height, u8 palette, u16 tile);
void sub_0200EA24(void *srcPixels, u16 srcX, u16 srcY, u16 srcWidth, u16 srcHeight, void *destPixels, u16 destWidth, u16 destHeight, u16 destX, u16 destY, u16 blitWidth, u16 blitHeight);
void sub_0200EA68(Window *window, int fileId, u16 baseTile, u8 count, u8 x, u8 y);

void sub_0200E398(BgConfig *bgConfig, GFBgLayer layer, u32 tileStart, u32 a3, enum HeapID heapID) {
    if (a3 == 0) {
        GfGfxLoader_LoadCharData(NARC_a_0_3_8, 0, bgConfig, layer, tileStart, 0, FALSE, heapID);
    } else {
        GfGfxLoader_LoadCharData(NARC_a_0_3_8, 1, bgConfig, layer, tileStart, 0, FALSE, heapID);
    }
}

u32 sub_0200E3D8(void) {
    return 25;
}

void LoadUserFrameGfx1(BgConfig *bg_config, GFBgLayer layer, u16 baseTile, u8 palette_num, u8 frame, enum HeapID heapID) {
    GfGfxLoader_LoadCharData(NARC_a_0_3_8, frame != 0 ? 1 : 0, bg_config, layer, baseTile, 0, FALSE, heapID);
    int pltt = frame == 2 ? 46 : 25;
    if ((u32)layer < GF_BG_LYR_SUB_0) {
        GfGfxLoader_GXLoadPal(NARC_a_0_3_8, pltt, GF_PAL_LOCATION_MAIN_BG, (enum GFPalSlotOffset)(palette_num * 32), 32, heapID);
    } else {
        GfGfxLoader_GXLoadPal(NARC_a_0_3_8, pltt, GF_PAL_LOCATION_SUB_BG, (enum GFPalSlotOffset)(palette_num * 32), 32, heapID);
    }
}

static void sub_0200E448(BgConfig *bgConfig, u8 layer, u8 x, u8 y, u8 width, u8 height, u8 palette, u16 tile) {
    // clang-format off
    FillBgTilemapRect(bgConfig, layer, tile,     x - 1,     y - 1,      1,     1,      palette);
    FillBgTilemapRect(bgConfig, layer, tile + 1, x,         y - 1,      width, 1,      palette);
    FillBgTilemapRect(bgConfig, layer, tile + 2, x + width, y - 1,      1,     1,      palette);
    FillBgTilemapRect(bgConfig, layer, tile + 3, x - 1,     y,          1,     height, palette);
    FillBgTilemapRect(bgConfig, layer, tile + 5, x + width, y,          1,     height, palette);
    FillBgTilemapRect(bgConfig, layer, tile + 6, x - 1,     y + height, 1,     1,      palette);
    FillBgTilemapRect(bgConfig, layer, tile + 7, x,         y + height, width, 1,      palette);
    FillBgTilemapRect(bgConfig, layer, tile + 8, x + width, y + height, 1,     1,      palette);
    // clang-format on
}

void DrawFrameAndWindow1(Window *window, BOOL skipTransfer, u16 tile, u8 palette) {
    sub_0200E448(window->bgConfig,
        GetWindowBgId(window),
        GetWindowX(window),
        GetWindowY(window),
        GetWindowWidth(window),
        GetWindowHeight(window),
        palette,
        tile);

    if (skipTransfer == FALSE) {
        CopyWindowToVram(window);
    }
}

void ClearWindowPixelBuffer(Window *window, BOOL skipTransfer) {
    FillBgTilemapRect(window->bgConfig,
        GetWindowBgId(window),
        0,
        GetWindowX(window) - 1,
        GetWindowY(window) - 1,
        GetWindowWidth(window) + 2,
        GetWindowHeight(window) + 2,
        0);

    if (skipTransfer == FALSE) {
        ClearWindowTilemapAndCopyToVram(window);
    }
}

u32 sub_0200E63C(int frame) {
    return 2 + frame;
}

u32 sub_0200E640(int frame) {
    return 26 + frame;
}

void LoadUserFrameGfx2(BgConfig *bgConfig, GFBgLayer layer, u16 baseTile, u8 paletteNum, u8 frame, enum HeapID heapID) {
    GfGfxLoader_LoadCharData(NARC_a_0_3_8,
        sub_0200E63C(frame),
        bgConfig,
        layer,
        baseTile,
        0,
        FALSE,
        heapID);

    if ((u32)layer < GF_BG_LYR_SUB_0) {
        GfGfxLoader_GXLoadPal(NARC_a_0_3_8,
            sub_0200E640(frame),
            GF_PAL_LOCATION_MAIN_BG,
            (enum GFPalSlotOffset)(paletteNum * 32),
            32,
            heapID);
    } else {
        GfGfxLoader_GXLoadPal(NARC_a_0_3_8,
            sub_0200E640(frame),
            GF_PAL_LOCATION_SUB_BG,
            (enum GFPalSlotOffset)(paletteNum * 32),
            32,
            heapID);
    }
}

void sub_0200E6B4(BgConfig *bgConfig, u8 bgLayer, u8 x, u8 y, u8 width, u8 height, u8 palette, u16 tile) {
    // clang-format off
    FillBgTilemapRect(bgConfig, bgLayer, tile,      x - 2,         y - 1,      1,     1,      palette);
    FillBgTilemapRect(bgConfig, bgLayer, tile + 1,  x - 1,         y - 1,      1,     1,      palette);
    FillBgTilemapRect(bgConfig, bgLayer, tile + 2,  x,             y - 1,      width, 1,      palette);
    FillBgTilemapRect(bgConfig, bgLayer, tile + 3,  x + width,     y - 1,      1,     1,      palette);
    FillBgTilemapRect(bgConfig, bgLayer, tile + 4,  x + width + 1, y - 1,      1,     1,      palette);
    FillBgTilemapRect(bgConfig, bgLayer, tile + 5,  x + width + 2, y - 1,      1,     1,      palette);
    FillBgTilemapRect(bgConfig, bgLayer, tile + 6,  x - 2,         y,          1,     height, palette);
    FillBgTilemapRect(bgConfig, bgLayer, tile + 7,  x - 1,         y,          1,     height, palette);
    FillBgTilemapRect(bgConfig, bgLayer, tile + 9,  x + width,     y,          1,     height, palette);
    FillBgTilemapRect(bgConfig, bgLayer, tile + 10, x + width + 1, y,          1,     height, palette);
    FillBgTilemapRect(bgConfig, bgLayer, tile + 11, x + width + 2, y,          1,     height, palette);
    FillBgTilemapRect(bgConfig, bgLayer, tile + 12, x - 2,         y + height, 1,     1,      palette);
    FillBgTilemapRect(bgConfig, bgLayer, tile + 13, x - 1,         y + height, 1,     1,      palette);
    FillBgTilemapRect(bgConfig, bgLayer, tile + 14, x,             y + height, width, 1,    palette);
    FillBgTilemapRect(bgConfig, bgLayer, tile + 15, x + width,     y + height, 1,     1,      palette);
    FillBgTilemapRect(bgConfig, bgLayer, tile + 16, x + width + 1, y + height, 1,     1,      palette);
    FillBgTilemapRect(bgConfig, bgLayer, tile + 17, x + width + 2, y + height, 1,     1,      palette);
    // clang-format on
}

void sub_0200E948(Window *window, u32 tile, u32 palette) {
    sub_0200E6B4(window->bgConfig,
        GetWindowBgId(window),
        GetWindowX(window),
        GetWindowY(window),
        GetWindowWidth(window),
        GetWindowHeight(window),
        palette,
        tile);
}

void DrawFrameAndWindow2(Window *window, BOOL skipTransfer, u16 tile, u8 palette) {
    sub_0200E948(window, tile, palette);

    if (skipTransfer == FALSE) {
        CopyWindowToVram(window);
    }

    TextPrinter_SetDownArrowBaseTile(tile);
}

void ClearFrameAndWindow2(Window *window, BOOL skipTransfer) {
    FillBgTilemapRect(window->bgConfig,
        GetWindowBgId(window),
        0,
        GetWindowX(window) - 2,
        GetWindowY(window) - 1,
        GetWindowWidth(window) + 5,
        GetWindowHeight(window) + 2,
        0);

    if (skipTransfer == FALSE) {
        ClearWindowTilemapAndCopyToVram(window);
    }
}

void sub_0200EA24(void *srcPixels, u16 srcX, u16 srcY, u16 srcWidth, u16 srcHeight, void *destPixels, u16 destWidth, u16 destHeight, u16 destX, u16 destY, u16 blitWidth, u16 blitHeight) {
    Bitmap src, dest;

    src.pixels = (u8 *)srcPixels;
    src.width = srcWidth;
    src.height = srcHeight;

    dest.pixels = (u8 *)destPixels;
    dest.width = destWidth;
    dest.height = destHeight;

    BlitBitmapRect4Bit(&src, &dest, srcX, srcY, destX, destY, blitWidth, blitHeight, 0);
}

#define SCROLL_CURSOR_TILES_PER_FRAME 4
#define SCROLL_CURSOR_TILE_OFFSET(i)  (TILE_SIZE_4BPP * (i))
#define SCROLL_CURSOR_FRAME_SIZE      (SCROLL_CURSOR_TILE_OFFSET(SCROLL_CURSOR_TILES_PER_FRAME))

void sub_0200EA68(Window *window, int fileId, u16 baseTile, u8 count, u8 x, u8 y) {
    // must forward-declare these to match
    u8 *cursorTiles;
    void *cursorCharPtr;
    u32 size;

    enum HeapID heapID = BgConfig_GetHeapId(window->bgConfig);
    u8 bgLayer = GetWindowBgId(window);
    size = count * SCROLL_CURSOR_FRAME_SIZE;
    u8 *cursorBlit = Heap_Alloc(heapID, size);
    u8 *bgGfx = BgGetCharPtr(bgLayer);

    NNSG2dCharacterData *cursorCharData;
    cursorCharPtr = GfGfxLoader_GetCharData(NARC_a_0_3_8,
        fileId,
        FALSE,
        &cursorCharData,
        heapID);
    cursorTiles = cursorCharData->pRawData;

    // Copy the window frame tiles into the blit window as a background
    for (u8 i = 0; i < (int)count; i++) {
        u32 frameOffset = i * SCROLL_CURSOR_FRAME_SIZE;

        memcpy(&cursorBlit[frameOffset + SCROLL_CURSOR_TILE_OFFSET(0)], &bgGfx[(baseTile + 10) * TILE_SIZE_4BPP], TILE_SIZE_4BPP);
        memcpy(&cursorBlit[frameOffset + SCROLL_CURSOR_TILE_OFFSET(1)], &bgGfx[(baseTile + 11) * TILE_SIZE_4BPP], TILE_SIZE_4BPP);
        memcpy(&cursorBlit[frameOffset + SCROLL_CURSOR_TILE_OFFSET(2)], &bgGfx[(baseTile + 10) * TILE_SIZE_4BPP], TILE_SIZE_4BPP);
        memcpy(&cursorBlit[frameOffset + SCROLL_CURSOR_TILE_OFFSET(3)], &bgGfx[(baseTile + 11) * TILE_SIZE_4BPP], TILE_SIZE_4BPP);
    }

    u8 width = 16 - x;
    u8 height = (16 - y) * count;

    sub_0200EA24(cursorTiles,
        x,
        y,
        width,
        height,
        cursorBlit,
        width,
        height,
        0,
        0,
        width,
        height);

    BG_LoadCharTilesData(window->bgConfig, bgLayer, cursorBlit, size, baseTile + 18);
    Heap_Free(cursorCharPtr);
    Heap_Free(cursorBlit);
}
