#include "application/pokegear/configure/pokegear_configure_internal.h"
#include "msgdata/msg.naix"
#include "msgdata/msg/msg_0270.h"

#include "font.h"
#include "unk_0200FA24.h"

void ov101_021EEE14(PokegearConfigureAppData *configureApp);
BOOL ov101_021EEE80(PokegearConfigureAppData *configureApp);
void ov101_021EEF0C(PokegearConfigureAppData *configureApp);
void ov101_021EEFDC(PokegearConfigureAppData *configureApp);
void ov101_021EEFE8(PokegearConfigureAppData *configureApp);
void ov101_021EEFFC(PokegearConfigureAppData *configureApp);
void ov101_021EF00C(PokegearConfigureAppData *configureApp);
void ov101_021EF028(PokegearConfigureAppData *configureApp);
void ov101_021EF03C(PokegearConfigureAppData *configureApp);
void ov101_021EF0C8(PokegearConfigureAppData *configureApp);
void ov101_021EF0E0(PokegearConfigureAppData *configureApp);
void ov101_021EF120(PokegearConfigureAppData *configureApp);
void ov101_021EF130(PokegearConfigureAppData *configureApp);
void ov101_021EF16C(PokegearConfigureAppData *configureApp);
void ov101_021EF17C(PokegearConfigureAppData *configureApp);

const UnmanagedSpriteTemplate ov101_021F82FC[5] = {
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

const PokegearCursorGrid ov101_021F820C[6] = {
    { 0, 2, 1, 3, 3, 48,  44,  -22, 22, -18, 18 },
    { 1, 0, 2, 4, 4, 128, 44,  -22, 22, -18, 18 },
    { 2, 1, 0, 5, 5, 208, 44,  -22, 22, -18, 18 },
    { 3, 5, 4, 0, 0, 48,  116, -22, 22, -18, 18 },
    { 4, 3, 5, 1, 1, 128, 116, -22, 22, -18, 18 },
    { 5, 4, 3, 2, 2, 208, 116, -22, 22, -18, 18 },
};

BOOL ov101_021EED44(PokegearConfigureAppData *configureApp) {
    switch (configureApp->substate) {
    case 0:
        ov101_021EEF0C(configureApp);
        ov101_021EEFE8(configureApp);
        ov101_021EF00C(configureApp);
        ov101_021EF26C(configureApp, 1);
        break;
    case 1:
        ov101_021EF03C(configureApp);
        ov101_021EF0E0(configureApp);
        ov101_021EF130(configureApp);
        ov101_021EF17C(configureApp);
        configureApp->substate = 0;
        return TRUE;
    }
    ++configureApp->substate;
    return FALSE;
}

BOOL ov101_021EED98(PokegearConfigureAppData *configureApp) {
    ov101_021EF16C(configureApp);
    ov101_021EF120(configureApp);
    ov101_021EF0C8(configureApp);
    ov101_021EF028(configureApp);
    ov101_021EEFFC(configureApp);
    ov101_021EEFDC(configureApp);
    return TRUE;
}

int ov101_021EEDC4(PokegearConfigureAppData *configureApp) {
    int input;

    input = TouchscreenListMenu_HandleInput(configureApp->unk_40);
    if (input != LIST_NOTHING_CHOSEN) {
        configureApp->pokegear->menuInputState = (MenuInputState)TouchscreenListMenu_WasLastInputTouch(configureApp->unk_40);
        TouchscreenListMenu_Destroy(configureApp->unk_40);
        ov101_021EF5A4(configureApp, 0, 0);
        PokegearCursorManager_SetCursorSpritesAnimateFlag(configureApp->pokegear->cursorManager, 0xFFFF, TRUE);
        if (input == 0) {
            return 4;
        } else {
            return 1;
        }
    }

    return 3;
}

void ov101_021EEE14(PokegearConfigureAppData *configureApp) {
    ov101_021EF260(configureApp);
    configureApp->backgroundStyle = configureApp->unk_11;
    configureApp->pokegear->backgroundStyle = configureApp->backgroundStyle;
    PokegearApp_LoadSkinGraphics(configureApp->pokegear, configureApp->backgroundStyle);
    ov100_021E6A58(configureApp->pokegear->unk_094, configureApp->backgroundStyle);
    ov101_021EF1D8(configureApp);
    ov101_021EF26C(configureApp, 0);
    ov101_021EF414(configureApp);
    ov101_021EF384(configureApp, configureApp->backgroundStyle);
}

BOOL ov101_021EEE80(PokegearConfigureAppData *configureApp) {
    switch (configureApp->substate) {
    case 0:
        BeginNormalPaletteFade(1, 4, 4, RGB_BLACK, 6, 1, configureApp->heapId);
        break;
    case 1:
        if (!IsPaletteFadeFinished()) {
            return FALSE;
        }
        ov101_021EEE14(configureApp);
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

void ov101_021EEF0C(PokegearConfigureAppData *configureApp) {
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

void ov101_021EEFDC(PokegearConfigureAppData *configureApp) {
    Pokegear_ClearAppBgLayers(configureApp->pokegear);
}

void ov101_021EEFE8(PokegearConfigureAppData *configureApp) {
    FontID_Alloc(4, configureApp->heapId);
    ov101_021EF1D8(configureApp);
}

void ov101_021EEFFC(PokegearConfigureAppData *configureApp) {
    ov101_021EF260(configureApp);
    FontID_Release(4);
}

void ov101_021EF00C(PokegearConfigureAppData *configureApp) {
    PokegearApp_CreateSpriteManager(configureApp->pokegear, GEAR_APP_CONFIGURE);
    configureApp->unk_38 = TouchscreenListMenuSpawner_Create(configureApp->heapId, configureApp->pokegear->plttData);
}

void ov101_021EF028(PokegearConfigureAppData *configureApp) {
    TouchscreenListMenuSpawner_Destroy(configureApp->unk_38);
    PokegearApp_DestroySpriteManager(configureApp->pokegear);
}

void ov101_021EF03C(PokegearConfigureAppData *configureApp) {
    int i;

    for (i = 0; i <= 4; ++i) {
        configureApp->unk_14[i] = SpriteSystem_CreateSpriteFromResourceHeader(configureApp->pokegear->spriteSystem, configureApp->pokegear->spriteManager, &ov101_021F82FC[i]);
        thunk_Sprite_SetPriority(configureApp->unk_14[i], 1);
        Sprite_SetDrawFlag(configureApp->unk_14[i], FALSE);
        Sprite_SetAnimActiveFlag(configureApp->unk_14[i], TRUE);
    }
    for (i = 5; i <= 8; ++i) {
        configureApp->unk_14[i] = SpriteSystem_CreateSpriteFromResourceHeader(configureApp->pokegear->spriteSystem, configureApp->pokegear->spriteManager, &ov101_021F82FC[i - 5]);
        thunk_Sprite_SetPriority(configureApp->unk_14[i], 1);
        thunk_Sprite_SetDrawPriority(configureApp->unk_14[i], 0);
        Sprite_SetDrawFlag(configureApp->unk_14[i], FALSE);
        Sprite_SetAnimActiveFlag(configureApp->unk_14[i], FALSE);
    }
}

void ov101_021EF0C8(PokegearConfigureAppData *configureApp) {
    int i;

    for (i = 0; i < 9; ++i) {
        thunk_Sprite_Delete(configureApp->unk_14[i]);
    }
}

void ov101_021EF0E0(PokegearConfigureAppData *configureApp) {
    PokegearCursorManager_AddButtons(configureApp->pokegear->cursorManager, ov101_021F820C, NELEMS(ov101_021F820C), 0, FALSE, configureApp->heapId, configureApp->unk_14[0], configureApp->unk_14[1], configureApp->unk_14[2], configureApp->unk_14[3]);
    PokegearCursorManager_SetCursorSpritesDrawState(configureApp->pokegear->cursorManager, 1, FALSE);
}

void ov101_021EF120(PokegearConfigureAppData *configureApp) {
    PokegearCursorManager_RemoveCursor(configureApp->pokegear->cursorManager, 1);
}

void ov101_021EF130(PokegearConfigureAppData *configureApp) {
    MsgData *msgData;
    int i;

    configureApp->unk_3C = ListMenuItems_New(2, configureApp->heapId);
    msgData = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, NARC_msg_msg_0270_bin, configureApp->heapId);
    for (i = 0; i < 2; ++i) {
        ListMenuItems_AppendFromMsgData(configureApp->unk_3C, msgData, msg_0270_00000 + i, i);
    }
    DestroyMsgData(msgData);
}

void ov101_021EF16C(PokegearConfigureAppData *configureApp) {
    ListMenuItems_Delete(configureApp->unk_3C);
    configureApp->unk_3C = NULL;
}

void ov101_021EF17C(PokegearConfigureAppData *configureApp) {
    ov101_021EF414(configureApp);
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
