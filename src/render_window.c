#include "render_window.h"

#include "gf_gfx_loader.h"

void sub_0200E398(BgConfig *bgConfig, GFBgLayer layer, u32 tileStart, u32 a3, enum HeapID heapID) {
    if (a3 == 0) {
        GfGfxLoader_LoadCharData(NARC_a_0_3_8, 0, bgConfig, layer, tileStart, 0, FALSE, heapID);
    } else {
        GfGfxLoader_LoadCharData(NARC_a_0_3_8, 1, bgConfig, layer, tileStart, 0, FALSE, heapID);
    }
}
