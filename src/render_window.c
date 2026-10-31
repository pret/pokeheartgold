#include "render_window.h"

#include "gf_gfx_loader.h"

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
