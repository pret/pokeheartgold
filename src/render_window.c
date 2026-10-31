#include "render_window.h"

#include "gf_gfx_loader.h"

void sub_0200E448(BgConfig *bgConfig, u8 bgId, u8 x, u8 y, u8 width, u8 height, u8 mode, u16 fillValue);

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

void sub_0200E448(BgConfig *bgConfig, u8 layer, u8 x, u8 y, u8 width, u8 height, u8 palette, u16 tile) {
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
