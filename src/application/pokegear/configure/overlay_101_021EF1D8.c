#include "application/pokegear/configure/pokegear_configure_internal.h"

#include "gf_gfx_loader.h"
#include "unk_0208805C.h"

typedef struct PokegearConfigureContextMenuParam {
    u8 x;
    u8 y;
    u8 alignment;
} PokegearConfigureContextMenuParam;

static const TouchscreenListMenuTemplate sContextMenuTemplate = {
    .wrapAround = TRUE,
    .centered = TRUE,
    .xOffset = 0,
    .bgId = 1,
    .plttOffset = 10,
    .unk4 = 1,
    .unk5 = 1,
    .baseTile = 28,
    .charOffset = 1,
    .unkA = 64,
};

static const PokegearConfigureContextMenuParam sContextMenuParam[] = {
    { 10, 2,  TSMENU_ALN_LEFT  },
    { 20, 2,  TSMENU_ALN_LEFT  },
    { 22, 2,  TSMENU_ALN_RIGHT },
    { 10, 11, TSMENU_ALN_LEFT  },
    { 20, 11, TSMENU_ALN_LEFT  },
    { 22, 11, TSMENU_ALN_RIGHT },
};

void ov101_021EF1D8(PokegearConfigureAppData *configureApp) {
    NARC *narc;

    narc = NARC_New(NARC_a_1_4_5, configureApp->heapId);
    BgConfig_LoadAssetFromOpenNarc(configureApp->pokegear->bgConfig, configureApp->heapId, narc, NARC_a_1_4_5, 10 + configureApp->backgroundStyle, GF_BG_LYR_MAIN_3, GF_BG_GFX_TYPE_CHAR, 0, 0);
    BgConfig_LoadAssetFromOpenNarc(configureApp->pokegear->bgConfig, configureApp->heapId, narc, NARC_a_1_4_5, 16 + configureApp->backgroundStyle, GF_BG_LYR_MAIN_3, GF_BG_GFX_TYPE_SCRN, 0, 0);
    configureApp->scrnDataRaw = GfGfxLoader_GetScrnDataFromOpenNarc(narc, 22 + configureApp->backgroundStyle, FALSE, &configureApp->scrnData, configureApp->heapId);
    NARC_Delete(narc);
    ScheduleBgTilemapBufferTransfer(configureApp->pokegear->bgConfig, GF_BG_LYR_MAIN_3);
}

void ov101_021EF260(PokegearConfigureAppData *configureApp) {
    Heap_Free(configureApp->scrnDataRaw);
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
    CopyToBgTilemapRect(configureApp->pokegear->bgConfig, GF_BG_LYR_MAIN_2, 10 * (backgroundStyle % 3) + 2, 9 * (backgroundStyle / 3) + 2, 9, 7, configureApp->scrnData->rawData, 0, 0, configureApp->scrnData->screenWidth / 8, configureApp->scrnData->screenHeight / 8);
    ScheduleBgTilemapBufferTransfer(configureApp->pokegear->bgConfig, GF_BG_LYR_MAIN_2);
}

void ov101_021EF414(PokegearConfigureAppData *configureApp) {
    int i;
    u16 r4 = 1;

    for (i = 0; i < 6; ++i) {
        if (configureApp->unlockedSkins & r4) {
            r4 <<= 1;
            continue;
        }
        CopyToBgTilemapRect(configureApp->pokegear->bgConfig, GF_BG_LYR_MAIN_3, 10 * (i % 3) + 3, 9 * (i / 3) + 3, 6, 5, configureApp->scrnData->rawData, 6, 0, configureApp->scrnData->screenWidth / 8, configureApp->scrnData->screenHeight / 8);
        r4 <<= 1;
    }
    ScheduleBgTilemapBufferTransfer(configureApp->pokegear->bgConfig, GF_BG_LYR_MAIN_3);
    ov101_021EF384(configureApp, configureApp->backgroundStyle);
}

void ov101_021EF4B0(void *appData) {
    PokegearConfigureAppData *configureApp = appData;

    PokegearCursorManager_SetSpecIndexAndCursorPos(configureApp->pokegear->cursorManager, 1, 0xFF);
    PokegearCursorManager_SetCursorSpritesDrawState(configureApp->pokegear->cursorManager, 0, FALSE);
    PokegearCursorManager_SetCursorSpritesDrawState(configureApp->pokegear->cursorManager, 1, TRUE);
}

void ov101_021EF4DC(PokegearConfigureAppData *configureApp) {
    configureApp->pokegear->cursorInAppSwitchZone = FALSE;
    PokegearCursorManager_SetSpecIndexAndCursorPos(configureApp->pokegear->cursorManager, 1, 0xFF);
    PokegearCursorManager_SetCursorSpritesDrawState(configureApp->pokegear->cursorManager, 0, FALSE);
    PokegearCursorManager_SetCursorSpritesDrawState(configureApp->pokegear->cursorManager, 1, TRUE);
}

void ov101_021EF50C(PokegearConfigureAppData *configureApp, u8 backgroundStyle) {
    TouchscreenListMenuHeader header;

    configureApp->selectedBackgroundStyle = backgroundStyle;
    MI_CpuClear8(&header, sizeof(TouchscreenListMenuHeader));
    header.template = sContextMenuTemplate;
    header.listMenuItems = configureApp->contextMenuItems;
    header.bgConfig = configureApp->pokegear->bgConfig;
    header.numWindows = 2;
    configureApp->contextMenu = TouchscreenListMenu_CreateWithAlignment(configureApp->contextMenuSpawner, &header, configureApp->pokegear->menuInputState, sContextMenuParam[backgroundStyle].x, sContextMenuParam[backgroundStyle].y, 0, 0, (enum TouchscreenListMenuTextAlignment)sContextMenuParam[backgroundStyle].alignment);
    ov101_021EF5A4(configureApp, backgroundStyle, 1);
    PokegearCursorManager_SetCursorSpritesAnimateFlag(configureApp->pokegear->cursorManager, 0xFFFF, FALSE);
}

void ov101_021EF5A4(PokegearConfigureAppData *configureApp, int a1, int a2) {
    int x;
    int y;
    int width;

    if (a2) {
        G2_SetWnd0InsidePlane(31, FALSE);
        G2_SetWnd1InsidePlane(31, FALSE);
        G2_SetWndOutsidePlane(31, TRUE);

        x = configureApp->contextMenu->x * 8;
        y = configureApp->contextMenu->y * 8;
        width = (configureApp->contextMenu->width + 2) * 8;
        G2_SetWnd0Position(x, y, x + width, y + 56);
        G2_SetWnd1Position(24 + (a1 % 3) * 80, 24 + (a1 / 3) * 72, 72 + (a1 % 3) * 80, 64 + (a1 / 3) * 72);
        GX_SetVisibleWnd(GX_WNDMASK_W0 | GX_WNDMASK_W1);
        G2_SetBlendBrightness(GX_BLEND_PLANEMASK_BG0 | GX_BLEND_PLANEMASK_BG1 | GX_BLEND_PLANEMASK_BG2 | GX_BLEND_PLANEMASK_BG3 | GX_BLEND_PLANEMASK_OBJ, -8);
    } else {
        G2_SetWnd0InsidePlane(GX_WND_PLANEMASK_NONE, FALSE);
        G2_SetWnd1InsidePlane(GX_WND_PLANEMASK_NONE, FALSE);
        G2_SetWndOutsidePlane(GX_WND_PLANEMASK_NONE, FALSE);
        GX_SetVisibleWnd(GX_WNDMASK_NONE);
        G2_SetBlendBrightness(GX_BLEND_PLANEMASK_BG0 | GX_BLEND_PLANEMASK_BG1 | GX_BLEND_PLANEMASK_BG2 | GX_BLEND_PLANEMASK_BG3 | GX_BLEND_PLANEMASK_OBJ, 0);
        G2_BlendNone();
    }
}
