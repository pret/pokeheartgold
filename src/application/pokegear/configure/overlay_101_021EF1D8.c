#include "application/pokegear/configure/pgconf_gra.naix"
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
    .bgId = GF_BG_LYR_MAIN_1,
    .plttOffset = 10,
    .unk4 = 1,
    .unk5 = 1,
    .baseTile = 28,
    .charOffset = 1,
    .unkA = 64,
};

static const PokegearConfigureContextMenuParam sContextMenuParam[] = {
    { 10, 2,  TSMENU_ALIGN_LEFT  },
    { 20, 2,  TSMENU_ALIGN_LEFT  },
    { 22, 2,  TSMENU_ALIGN_RIGHT },
    { 10, 11, TSMENU_ALIGN_LEFT  },
    { 20, 11, TSMENU_ALIGN_LEFT  },
    { 22, 11, TSMENU_ALIGN_RIGHT },
};

void PokegearConfigure_LoadGraphics_Internal(PokegearConfigureAppData *configureApp) {
    NARC *narc;

    narc = NARC_New(NARC_application_pokegear_configure_pgconf_gra, configureApp->heapId);
    BgConfig_LoadAssetFromOpenNarc(configureApp->pokegear->bgConfig, configureApp->heapId, narc, NARC_application_pokegear_configure_pgconf_gra, NARC_pgconf_gra_pgconf_gra_00000010_NCGR + configureApp->skin, GF_BG_LYR_MAIN_3, GF_BG_GFX_TYPE_CHAR, 0, 0);
    BgConfig_LoadAssetFromOpenNarc(configureApp->pokegear->bgConfig, configureApp->heapId, narc, NARC_application_pokegear_configure_pgconf_gra, NARC_pgconf_gra_pgconf_gra_00000016_NSCR + configureApp->skin, GF_BG_LYR_MAIN_3, GF_BG_GFX_TYPE_SCRN, 0, 0);
    configureApp->scrnDataRaw = GfGfxLoader_GetScrnDataFromOpenNarc(narc, NARC_pgconf_gra_pgconf_gra_00000022_NSCR + configureApp->skin, FALSE, &configureApp->scrnData, configureApp->heapId);
    NARC_Delete(narc);
    ScheduleBgTilemapBufferTransfer(configureApp->pokegear->bgConfig, GF_BG_LYR_MAIN_3);
}

void PokegearConfigure_UnloadGraphics_Internal(PokegearConfigureAppData *configureApp) {
    Heap_Free(configureApp->scrnDataRaw);
}

void PokegearConfigure_LoadPalettes(PokegearConfigureAppData *configureApp, BOOL isInit) {
    NARC *narc;

    narc = NARC_New(NARC_application_pokegear_configure_pgconf_gra, configureApp->heapId);
    PaletteData_LoadFromOpenNarc(configureApp->pokegear->plttData, narc, NARC_pgconf_gra_pgconf_gra_00000004_NCLR + configureApp->skin, configureApp->heapId, PLTTBUF_MAIN_BG, 0x1C0, 0, 0);
    PaletteData_LoadFromOpenNarc(configureApp->pokegear->plttData, narc, NARC_pgconf_gra_pgconf_gra_00000004_NCLR + configureApp->skin, configureApp->heapId, PLTTBUF_SUB_BG, 0x180, 0, 0);
    if (isInit) {
        PaletteData_LoadFromOpenNarc(configureApp->pokegear->plttData, narc, NARC_pgconf_gra_pgconf_gra_00000000_NCLR, configureApp->heapId, PLTTBUF_MAIN_OBJ, 0x160, 0x40, 0);
        PaletteData_LoadFromOpenNarc(configureApp->pokegear->plttData, narc, NARC_pgconf_gra_pgconf_gra_00000000_NCLR, configureApp->heapId, PLTTBUF_SUB_OBJ, 0x160, 0x40, 0);
    }
    PaletteData_SetAutoTransparent(configureApp->pokegear->plttData, TRUE);
    if (isInit) {
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

void PokegearConfigure_SetNewSkin(PokegearConfigureAppData *configureApp, int skin) {
    configureApp->skin = skin;
    BgClearTilemapBufferAndCommit(configureApp->pokegear->bgConfig, GF_BG_LYR_MAIN_2);
    CopyToBgTilemapRect(configureApp->pokegear->bgConfig, GF_BG_LYR_MAIN_2, 10 * (skin % 3) + 2, 9 * (skin / 3) + 2, 9, 7, configureApp->scrnData->rawData, 0, 0, configureApp->scrnData->screenWidth / 8, configureApp->scrnData->screenHeight / 8);
    ScheduleBgTilemapBufferTransfer(configureApp->pokegear->bgConfig, GF_BG_LYR_MAIN_2);
}

void PokegearConfigure_DrawUnlockedSkinsButtons(PokegearConfigureAppData *configureApp) {
    int i;
    u16 mask = 1;

    for (i = 0; i < 6; ++i) {
        if (configureApp->unlockedSkins & mask) {
            mask <<= 1;
            continue;
        }
        CopyToBgTilemapRect(configureApp->pokegear->bgConfig, GF_BG_LYR_MAIN_3, 10 * (i % 3) + 3, 9 * (i / 3) + 3, 6, 5, configureApp->scrnData->rawData, 6, 0, configureApp->scrnData->screenWidth / 8, configureApp->scrnData->screenHeight / 8);
        mask <<= 1;
    }
    ScheduleBgTilemapBufferTransfer(configureApp->pokegear->bgConfig, GF_BG_LYR_MAIN_3);
    PokegearConfigure_SetNewSkin(configureApp, configureApp->skin);
}

void PokegearConfigure_OnReselectApp(void *appData) {
    PokegearConfigureAppData *configureApp = appData;

    PokegearCursorManager_SetSpecIndexAndCursorPos(configureApp->pokegear->cursorManager, 1, 0xFF);
    PokegearCursorManager_SetCursorSpritesDrawState(configureApp->pokegear->cursorManager, 0, FALSE);
    PokegearCursorManager_SetCursorSpritesDrawState(configureApp->pokegear->cursorManager, 1, TRUE);
}

void PokegearConfigure_SetAppCursorActive(PokegearConfigureAppData *configureApp) {
    configureApp->pokegear->cursorInAppSwitchZone = FALSE;
    PokegearCursorManager_SetSpecIndexAndCursorPos(configureApp->pokegear->cursorManager, 1, 0xFF);
    PokegearCursorManager_SetCursorSpritesDrawState(configureApp->pokegear->cursorManager, 0, FALSE);
    PokegearCursorManager_SetCursorSpritesDrawState(configureApp->pokegear->cursorManager, 1, TRUE);
}

void PokegearConfigure_SpawnContextMenu(PokegearConfigureAppData *configureApp, u8 skin) {
    TouchscreenListMenuHeader header;

    configureApp->selectedSkin = skin;
    MI_CpuClear8(&header, sizeof(TouchscreenListMenuHeader));
    header.template = sContextMenuTemplate;
    header.listMenuItems = configureApp->contextMenuItems;
    header.bgConfig = configureApp->pokegear->bgConfig;
    header.numWindows = 2;
    configureApp->contextMenu = TouchscreenListMenu_CreateWithAlignment(configureApp->contextMenuSpawner, &header, configureApp->pokegear->menuInputState, sContextMenuParam[skin].x, sContextMenuParam[skin].y, 0, 0, (enum TouchscreenListMenuTextAlignment)sContextMenuParam[skin].alignment);
    PokegearConfigure_ToggleButtonFocusState(configureApp, skin, TRUE);
    PokegearCursorManager_SetCursorSpritesAnimateFlag(configureApp->pokegear->cursorManager, 0xFFFF, FALSE);
}

void PokegearConfigure_ToggleButtonFocusState(PokegearConfigureAppData *configureApp, int skin, BOOL selected) {
    int x;
    int y;
    int width;

    if (selected) {
        G2_SetWnd0InsidePlane(31, FALSE);
        G2_SetWnd1InsidePlane(31, FALSE);
        G2_SetWndOutsidePlane(31, TRUE);

        x = configureApp->contextMenu->x * 8;
        y = configureApp->contextMenu->y * 8;
        width = (configureApp->contextMenu->width + 2) * 8;
        G2_SetWnd0Position(x, y, x + width, y + 56);
        G2_SetWnd1Position(24 + (skin % 3) * 80, 24 + (skin / 3) * 72, 72 + (skin % 3) * 80, 64 + (skin / 3) * 72);
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
