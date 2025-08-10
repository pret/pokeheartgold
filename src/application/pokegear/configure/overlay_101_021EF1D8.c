#include "application/pokegear/configure/pokegear_configure_internal.h"

#include "gf_gfx_loader.h"
#include "unk_0208805C.h"

void ov101_021EF1D8(PokegearConfigureAppData *configureApp) {
    NARC *narc;

    narc = NARC_New(NARC_a_1_4_5, configureApp->heapId);
    BgConfig_LoadAssetFromOpenNarc(configureApp->pokegear->bgConfig, configureApp->heapId, narc, NARC_a_1_4_5, 10 + configureApp->backgroundStyle, GF_BG_LYR_MAIN_3, GF_BG_GFX_TYPE_CHAR, 0, 0);
    BgConfig_LoadAssetFromOpenNarc(configureApp->pokegear->bgConfig, configureApp->heapId, narc, NARC_a_1_4_5, 16 + configureApp->backgroundStyle, GF_BG_LYR_MAIN_3, GF_BG_GFX_TYPE_SCRN, 0, 0);
    configureApp->unk_44 = GfGfxLoader_GetScrnDataFromOpenNarc(narc, 22 + configureApp->backgroundStyle, FALSE, &configureApp->unk_48, configureApp->heapId);
    NARC_Delete(narc);
    ScheduleBgTilemapBufferTransfer(configureApp->pokegear->bgConfig, GF_BG_LYR_MAIN_3);
}

void ov101_021EF260(PokegearConfigureAppData *configureApp) {
    Heap_Free(configureApp->unk_44);
}

void ov101_021EF26C(PokegearConfigureAppData *configureApp, int a1) {
    NARC *narc;

    narc = NARC_New(NARC_a_1_4_5, configureApp->heapId);
    PaletteData_LoadFromOpenNarc(configureApp->pokegear->plttData, narc, 4 + configureApp->backgroundStyle, configureApp->heapId, PLTTBUF_MAIN_BG, 0x1C0, 0, 0);
    PaletteData_LoadFromOpenNarc(configureApp->pokegear->plttData, narc, 4 + configureApp->backgroundStyle, configureApp->heapId, PLTTBUF_SUB_BG, 0x180, 0, 0);
    if (a1) {
        PaletteData_LoadFromOpenNarc(configureApp->pokegear->plttData, narc, 0, configureApp->heapId, PLTTBUF_MAIN_OBJ, 0x160, 0x40, 0);
        PaletteData_LoadFromOpenNarc(configureApp->pokegear->plttData, narc, 0, configureApp->heapId, PLTTBUF_SUB_OBJ, 0x160, 0x40, 0);
    }
    PaletteData_SetAutoTransparent(configureApp->pokegear->plttData, TRUE);
    if (a1) {
        PaletteData_BlendPalette(configureApp->pokegear->plttData, PLTTBUF_MAIN_BG, 0, 0xE0, 16, 0);
        PaletteData_BlendPalette(configureApp->pokegear->plttData, PLTTBUF_MAIN_OBJ, 0x40, 0xC0, 16, 0);
    } else {
        PaletteData_BlendPalette(configureApp->pokegear->plttData, PLTTBUF_MAIN_BG, 0, 0x100, 0, 0);
        PaletteData_BlendPalette(configureApp->pokegear->plttData, PLTTBUF_MAIN_OBJ, 0, 0x100, 0, 0);
    }
    PaletteData_PushTransparentBuffers(configureApp->pokegear->plttData);
    PaletteData_SetAutoTransparent(configureApp->pokegear->plttData, FALSE);
    NARC_Delete(narc);
}

void ov101_021EF384(PokegearConfigureAppData *configureApp, int backgroundStyle) {
    configureApp->backgroundStyle = backgroundStyle;
    BgClearTilemapBufferAndCommit(configureApp->pokegear->bgConfig, GF_BG_LYR_MAIN_2);
    CopyToBgTilemapRect(configureApp->pokegear->bgConfig, GF_BG_LYR_MAIN_2, 10 * (backgroundStyle % 3) + 2, 9 * (backgroundStyle / 3) + 2, 9, 7, configureApp->unk_48->rawData, 0, 0, configureApp->unk_48->screenWidth / 8, configureApp->unk_48->screenHeight / 8);
    ScheduleBgTilemapBufferTransfer(configureApp->pokegear->bgConfig, GF_BG_LYR_MAIN_2);
}

void ov101_021EF414(PokegearConfigureAppData *configureApp) {
    int i;
    u16 r4 = 1;

    for (i = 0; i < 6; ++i) {
        if (configureApp->unk_12_00 & r4) {
            r4 <<= 1;
            continue;
        }
        CopyToBgTilemapRect(configureApp->pokegear->bgConfig, GF_BG_LYR_MAIN_3, 10 * (i % 3) + 3, 9 * (i / 3) + 3, 6, 5, configureApp->unk_48->rawData, 6, 0, configureApp->unk_48->screenWidth / 8, configureApp->unk_48->screenHeight / 8);
        r4 <<= 1;
    }
    ScheduleBgTilemapBufferTransfer(configureApp->pokegear->bgConfig, GF_BG_LYR_MAIN_3);
    ov101_021EF384(configureApp, configureApp->backgroundStyle);
}
