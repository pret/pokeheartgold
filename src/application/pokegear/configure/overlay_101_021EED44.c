#include "application/pokegear/configure/pokegear_configure_internal.h"
#include "msgdata/msg.naix"
#include "msgdata/msg/msg_0270.h"

#include "font.h"
#include "unk_0200FA24.h"

static void PokegearConfigure_LoadAndSetSkin(PokegearConfigureAppData *configureApp);
static void PokegearConfigure_InitBGs(PokegearConfigureAppData *configureApp);
static void PokegearConfigure_UnloadBGs(PokegearConfigureAppData *configureApp);
static void PokegearConfigure_LoadGraphics(PokegearConfigureAppData *configureApp);
static void PokegearConfigure_UnloadGraphics(PokegearConfigureAppData *configureApp);
static void PokegearConfigure_CreateSpriteManager(PokegearConfigureAppData *configureApp);
static void PokegearConfigure_DestroySpriteManager(PokegearConfigureAppData *configureApp);
static void PokegearConfigure_CreateSprites(PokegearConfigureAppData *configureApp);
static void PokegearConfigure_DeleteSprites(PokegearConfigureAppData *configureApp);
static void PokegearConfigure_CreateCursor(PokegearConfigureAppData *configureApp);
static void PokegearConfigure_RemoveCursor(PokegearConfigureAppData *configureApp);
static void PokegearConfigure_LoadContextMenuText(PokegearConfigureAppData *configureApp);
static void PokegearConfigure_UnloadContextMenuText(PokegearConfigureAppData *configureApp);
static void PokegearConfigure_SetInitialCursorState(PokegearConfigureAppData *configureApp);

static const UnmanagedSpriteTemplate sSpriteTemplates[5] = {
    {
     .resourceSet = 0,
     .x = 0,
     .y = 0,
     .z = 0,
     .animation = 0,
     .drawPriority = 1,
     .pal = 6,
     .vram = NNS_G2D_VRAM_TYPE_2DMAIN,
     .paletteMode = 0,
     .unk_1C = 0,
     .unk_20 = 0,
     .unk_24 = 0,
     },
    {
     .resourceSet = 0,
     .x = 0,
     .y = 0,
     .z = 0,
     .animation = 1,
     .drawPriority = 1,
     .pal = 6,
     .vram = NNS_G2D_VRAM_TYPE_2DMAIN,
     .paletteMode = 0,
     .unk_1C = 0,
     .unk_20 = 0,
     .unk_24 = 0,
     },
    {
     .resourceSet = 0,
     .x = 0,
     .y = 0,
     .z = 0,
     .animation = 2,
     .drawPriority = 1,
     .pal = 6,
     .vram = NNS_G2D_VRAM_TYPE_2DMAIN,
     .paletteMode = 0,
     .unk_1C = 0,
     .unk_20 = 0,
     .unk_24 = 0,
     },
    {
     .resourceSet = 0,
     .x = 0,
     .y = 0,
     .z = 0,
     .animation = 3,
     .drawPriority = 1,
     .pal = 6,
     .vram = NNS_G2D_VRAM_TYPE_2DMAIN,
     .paletteMode = 0,
     .unk_1C = 0,
     .unk_20 = 0,
     .unk_24 = 0,
     },
    {
     .resourceSet = 0,
     .x = 0,
     .y = 0,
     .z = 0,
     .animation = 8,
     .drawPriority = 1,
     .pal = 4,
     .vram = NNS_G2D_VRAM_TYPE_2DMAIN,
     .paletteMode = 0,
     .unk_1C = 0,
     .unk_20 = 0,
     .unk_24 = 0,
     },
};

static const PokegearCursorGrid sCursorButtons[6] = {
    { 0, 2, 1, 3, 3, 48,  44,  -22, 22, -18, 18 },
    { 1, 0, 2, 4, 4, 128, 44,  -22, 22, -18, 18 },
    { 2, 1, 0, 5, 5, 208, 44,  -22, 22, -18, 18 },
    { 3, 5, 4, 0, 0, 48,  116, -22, 22, -18, 18 },
    { 4, 3, 5, 1, 1, 128, 116, -22, 22, -18, 18 },
    { 5, 4, 3, 2, 2, 208, 116, -22, 22, -18, 18 },
};

BOOL PokegearConfigure_LoadGFX(PokegearConfigureAppData *configureApp) {
    switch (configureApp->substate) {
    case 0:
        PokegearConfigure_InitBGs(configureApp);
        PokegearConfigure_LoadGraphics(configureApp);
        PokegearConfigure_CreateSpriteManager(configureApp);
        PokegearConfigure_LoadPalettes(configureApp, TRUE);
        break;
    case 1:
        PokegearConfigure_CreateSprites(configureApp);
        PokegearConfigure_CreateCursor(configureApp);
        PokegearConfigure_LoadContextMenuText(configureApp);
        PokegearConfigure_SetInitialCursorState(configureApp);
        configureApp->substate = 0;
        return TRUE;
    }
    ++configureApp->substate;
    return FALSE;
}

BOOL PokegearConfigure_UnloadGFX(PokegearConfigureAppData *configureApp) {
    PokegearConfigure_UnloadContextMenuText(configureApp);
    PokegearConfigure_RemoveCursor(configureApp);
    PokegearConfigure_DeleteSprites(configureApp);
    PokegearConfigure_DestroySpriteManager(configureApp);
    PokegearConfigure_UnloadGraphics(configureApp);
    PokegearConfigure_UnloadBGs(configureApp);
    return TRUE;
}

int PokegearConfigure_ContextMenu(PokegearConfigureAppData *configureApp) {
    int input;

    input = TouchscreenListMenu_HandleInput(configureApp->contextMenu);
    if (input != LIST_NOTHING_CHOSEN) {
        configureApp->pokegear->menuInputState = (MenuInputState)TouchscreenListMenu_WasLastInputTouch(configureApp->contextMenu);
        TouchscreenListMenu_Destroy(configureApp->contextMenu);
        PokegearConfigure_ToggleButtonFocusState(configureApp, 0, FALSE);
        PokegearCursorManager_SetCursorSpritesAnimateFlag(configureApp->pokegear->cursorManager, 0xFFFF, TRUE);
        if (input == 0) {
            return PGCONF_MAIN_STATE_SWAP_SKINS;
        } else {
            return PGCONF_MAIN_STATE_HANDLE_INPUT;
        }
    }

    return PGCONF_MAIN_STATE_CONTEXT_MENU;
}

static void PokegearConfigure_LoadAndSetSkin(PokegearConfigureAppData *configureApp) {
    PokegearConfigure_UnloadGraphics_Internal(configureApp);
    configureApp->skin = configureApp->selectedSkin;
    configureApp->pokegear->skin = configureApp->skin;
    PokegearApp_LoadSkinGraphics(configureApp->pokegear, configureApp->skin);
    PokegearUIManager_LoadSkinGfx(configureApp->pokegear->uiManager, configureApp->skin);
    PokegearConfigure_LoadGraphics_Internal(configureApp);
    PokegearConfigure_LoadPalettes(configureApp, FALSE);
    PokegearConfigure_DrawUnlockedSkinsButtons(configureApp);
    PokegearConfigure_SetNewSkin(configureApp, configureApp->skin);
}

BOOL PokegearConfigure_SwapSkins(PokegearConfigureAppData *configureApp) {
    switch (configureApp->substate) {
    case 0:
        BeginNormalPaletteFade(1, 4, 4, RGB_BLACK, 6, 1, configureApp->heapId);
        break;
    case 1:
        if (!IsPaletteFadeFinished()) {
            return FALSE;
        }
        PokegearConfigure_LoadAndSetSkin(configureApp);
        break;
    case 2:
        BeginNormalPaletteFade(2, 3, 3, RGB_BLACK, 6, 1, configureApp->heapId);
        break;
    case 3:
        if (!IsPaletteFadeFinished()) {
            return FALSE;
        }
        configureApp->substate = 0;
        return TRUE;
    }

    ++configureApp->substate;
    return FALSE;
}

static void PokegearConfigure_InitBGs(PokegearConfigureAppData *configureApp) {
    int i;
    GX_SetGraphicsMode(GX_DISPMODE_GRAPHICS, GX_BGMODE_0, GX_BG0_AS_2D);

    {
        BgTemplate bgTemplates[6] = {
            {
             .x = 0,
             .y = 0,
             .bufferSize = GF_BG_BUF_SIZE_256x256_4BPP,
             .baseTile = 0,
             .size = GF_BG_SCR_SIZE_256x256,
             .colorMode = GX_BG_COLORMODE_16,
             .screenBase = GX_BG_SCRBASE_0xf000,
             .charBase = GX_BG_CHARBASE_0x10000,
             .bgExtPltt = GX_BG_EXTPLTT_01,
             .priority = 1,
             .areaOver = GX_BG_AREAOVER_XLU,
             .mosaic = 0,
             },
            {
             .x = 0,
             .y = 0,
             .bufferSize = GF_BG_BUF_SIZE_256x256_4BPP,
             .baseTile = 0,
             .size = GF_BG_SCR_SIZE_256x256,
             .colorMode = GX_BG_COLORMODE_16,
             .screenBase = GX_BG_SCRBASE_0xe800,
             .charBase = GX_BG_CHARBASE_0x00000,
             .bgExtPltt = GX_BG_EXTPLTT_01,
             .priority = 2,
             .areaOver = GX_BG_AREAOVER_XLU,
             .mosaic = 0,
             },
            {
             .x = 0,
             .y = 0,
             .bufferSize = GF_BG_BUF_SIZE_256x256_4BPP,
             .baseTile = 0,
             .size = GF_BG_SCR_SIZE_256x256,
             .colorMode = GX_BG_COLORMODE_16,
             .screenBase = GX_BG_SCRBASE_0xe000,
             .charBase = GX_BG_CHARBASE_0x00000,
             .bgExtPltt = GX_BG_EXTPLTT_01,
             .priority = 3,
             .areaOver = GX_BG_AREAOVER_XLU,
             .mosaic = 0,
             },
            {
             .x = 0,
             .y = 0,
             .bufferSize = GF_BG_BUF_SIZE_256x256_4BPP,
             .baseTile = 0,
             .size = GF_BG_SCR_SIZE_256x256,
             .colorMode = GX_BG_COLORMODE_16,
             .screenBase = GX_BG_SCRBASE_0xf000,
             .charBase = GX_BG_CHARBASE_0x00000,
             .bgExtPltt = GX_BG_EXTPLTT_01,
             .priority = 0,
             .areaOver = GX_BG_AREAOVER_XLU,
             .mosaic = 0,
             },
            {
             .x = 0,
             .y = 0,
             .bufferSize = GF_BG_BUF_SIZE_256x256_4BPP,
             .baseTile = 0,
             .size = GF_BG_SCR_SIZE_256x256,
             .colorMode = GX_BG_COLORMODE_16,
             .screenBase = GX_BG_SCRBASE_0xe800,
             .charBase = GX_BG_CHARBASE_0x00000,
             .bgExtPltt = GX_BG_EXTPLTT_01,
             .priority = 1,
             .areaOver = GX_BG_AREAOVER_XLU,
             .mosaic = 0,
             },
            {
             .x = 0,
             .y = 0,
             .bufferSize = GF_BG_BUF_SIZE_256x256_4BPP,
             .baseTile = 0,
             .size = GF_BG_SCR_SIZE_256x256,
             .colorMode = GX_BG_COLORMODE_16,
             .screenBase = GX_BG_SCRBASE_0xe000,
             .charBase = GX_BG_CHARBASE_0x00000,
             .bgExtPltt = GX_BG_EXTPLTT_01,
             .priority = 2,
             .areaOver = GX_BG_AREAOVER_XLU,
             .mosaic = 0,
             },
        };

        InitBgFromTemplateEx(configureApp->pokegear->bgConfig, GF_BG_LYR_MAIN_1, &bgTemplates[0], GF_BG_TYPE_TEXT, FALSE);
        InitBgFromTemplateEx(configureApp->pokegear->bgConfig, GF_BG_LYR_MAIN_2, &bgTemplates[1], GF_BG_TYPE_TEXT, FALSE);
        InitBgFromTemplateEx(configureApp->pokegear->bgConfig, GF_BG_LYR_MAIN_3, &bgTemplates[2], GF_BG_TYPE_TEXT, FALSE);
        InitBgFromTemplateEx(configureApp->pokegear->bgConfig, GF_BG_LYR_SUB_1, &bgTemplates[3], GF_BG_TYPE_TEXT, FALSE);
        InitBgFromTemplateEx(configureApp->pokegear->bgConfig, GF_BG_LYR_SUB_2, &bgTemplates[4], GF_BG_TYPE_TEXT, FALSE);
        InitBgFromTemplateEx(configureApp->pokegear->bgConfig, GF_BG_LYR_SUB_3, &bgTemplates[5], GF_BG_TYPE_TEXT, FALSE);
    }

    for (i = 0; i < 3; ++i) {
        BgClearTilemapBufferAndCommit(configureApp->pokegear->bgConfig, GF_BG_LYR_MAIN_1 + i);
        BG_ClearCharDataRange(GF_BG_LYR_MAIN_1 + i, 0x20, 0, configureApp->heapId);
        BgClearTilemapBufferAndCommit(configureApp->pokegear->bgConfig, GF_BG_LYR_SUB_1 + i);
        BG_ClearCharDataRange(GF_BG_LYR_SUB_1 + i, 0x20, 0, configureApp->heapId);
    }
}

static void PokegearConfigure_UnloadBGs(PokegearConfigureAppData *configureApp) {
    Pokegear_ClearAppBgLayers(configureApp->pokegear);
}

static void PokegearConfigure_LoadGraphics(PokegearConfigureAppData *configureApp) {
    FontID_Alloc(4, configureApp->heapId);
    PokegearConfigure_LoadGraphics_Internal(configureApp);
}

static void PokegearConfigure_UnloadGraphics(PokegearConfigureAppData *configureApp) {
    PokegearConfigure_UnloadGraphics_Internal(configureApp);
    FontID_Release(4);
}

static void PokegearConfigure_CreateSpriteManager(PokegearConfigureAppData *configureApp) {
    PokegearApp_CreateSpriteManager(configureApp->pokegear, GEAR_APP_CONFIGURE);
    configureApp->contextMenuSpawner = TouchscreenListMenuSpawner_Create(configureApp->heapId, configureApp->pokegear->plttData);
}

static void PokegearConfigure_DestroySpriteManager(PokegearConfigureAppData *configureApp) {
    TouchscreenListMenuSpawner_Destroy(configureApp->contextMenuSpawner);
    PokegearApp_DestroySpriteManager(configureApp->pokegear);
}

static void PokegearConfigure_CreateSprites(PokegearConfigureAppData *configureApp) {
    int i;

    for (i = 0; i <= 4; ++i) {
        configureApp->sprites[i] = SpriteSystem_CreateSpriteFromResourceHeader(configureApp->pokegear->spriteSystem, configureApp->pokegear->spriteManager, &sSpriteTemplates[i]);
        thunk_Sprite_SetPriority(configureApp->sprites[i], 1);
        Sprite_SetDrawFlag(configureApp->sprites[i], FALSE);
        Sprite_SetAnimActiveFlag(configureApp->sprites[i], TRUE);
    }
    for (i = 5; i <= 8; ++i) {
        configureApp->sprites[i] = SpriteSystem_CreateSpriteFromResourceHeader(configureApp->pokegear->spriteSystem, configureApp->pokegear->spriteManager, &sSpriteTemplates[i - 5]);
        thunk_Sprite_SetPriority(configureApp->sprites[i], 1);
        thunk_Sprite_SetDrawPriority(configureApp->sprites[i], 0);
        Sprite_SetDrawFlag(configureApp->sprites[i], FALSE);
        Sprite_SetAnimActiveFlag(configureApp->sprites[i], FALSE);
    }
}

static void PokegearConfigure_DeleteSprites(PokegearConfigureAppData *configureApp) {
    int i;

    for (i = 0; i < 9; ++i) {
        thunk_Sprite_Delete(configureApp->sprites[i]);
    }
}

static void PokegearConfigure_CreateCursor(PokegearConfigureAppData *configureApp) {
    PokegearCursorManager_AddButtons(configureApp->pokegear->cursorManager, sCursorButtons, NELEMS(sCursorButtons), 0, FALSE, configureApp->heapId, configureApp->sprites[0], configureApp->sprites[1], configureApp->sprites[2], configureApp->sprites[3]);
    PokegearCursorManager_SetCursorSpritesDrawState(configureApp->pokegear->cursorManager, 1, FALSE);
}

static void PokegearConfigure_RemoveCursor(PokegearConfigureAppData *configureApp) {
    PokegearCursorManager_RemoveCursor(configureApp->pokegear->cursorManager, 1);
}

static void PokegearConfigure_LoadContextMenuText(PokegearConfigureAppData *configureApp) {
    MsgData *msgData;
    int i;

    configureApp->contextMenuItems = ListMenuItems_New(2, configureApp->heapId);
    msgData = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, NARC_msg_msg_0270_bin, configureApp->heapId);
    for (i = 0; i < 2; ++i) {
        ListMenuItems_AppendFromMsgData(configureApp->contextMenuItems, msgData, msg_0270_00000 + i, i);
    }
    DestroyMsgData(msgData);
}

static void PokegearConfigure_UnloadContextMenuText(PokegearConfigureAppData *configureApp) {
    ListMenuItems_Delete(configureApp->contextMenuItems);
    configureApp->contextMenuItems = NULL;
}

static void PokegearConfigure_SetInitialCursorState(PokegearConfigureAppData *configureApp) {
    PokegearConfigure_DrawUnlockedSkinsButtons(configureApp);
    if (configureApp->pokegear->cursorInAppSwitchZone == TRUE) {
        PokegearCursorManager_SetCursorSpritesDrawState(configureApp->pokegear->cursorManager, 0, TRUE);
        PokegearCursorManager_SetCursorSpritesDrawState(configureApp->pokegear->cursorManager, 1, FALSE);
        PokegearCursorManager_SetSpecIndexAndCursorPos(configureApp->pokegear->cursorManager, 0, PokegearApp_AppIdToButtonIndex(configureApp->pokegear));
    } else {
        PokegearCursorManager_SetCursorSpritesDrawState(configureApp->pokegear->cursorManager, 0, FALSE);
        PokegearCursorManager_SetCursorSpritesDrawState(configureApp->pokegear->cursorManager, 1, TRUE);
        PokegearCursorManager_SetSpecIndexAndCursorPos(configureApp->pokegear->cursorManager, 1, 0);
    }
}
