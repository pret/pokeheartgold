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
void ov101_021EF1D8(PokegearConfigureAppData *configureApp);
void ov101_021EF260(PokegearConfigureAppData *configureApp);
void ov101_021EF26C(PokegearConfigureAppData *configureApp, int a1);
void ov101_021EF384(PokegearConfigureAppData *configureApp, u32 backgroundStyle);
void ov101_021EF414(PokegearConfigureAppData *configureApp);

extern const UnmanagedSpriteTemplate ov101_021F82FC[5];
extern const PokegearAppSwitchButtonSpec ov101_021F820C[6];

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
        PokegearAppSwitch_SetCursorSpritesAnimateFlag(configureApp->pokegear->appSwitch, 0xFFFF, TRUE);
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
        extern const BgTemplate ov101_021F8254[6];
        BgTemplate bgTemplates[6];
        ARRAY_ASSIGN(bgTemplates, ov101_021F8254);

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
    PokegearAppSwitch_AddButtons(configureApp->pokegear->appSwitch, ov101_021F820C, NELEMS(ov101_021F820C), 0, FALSE, configureApp->heapId, configureApp->unk_14[0], configureApp->unk_14[1], configureApp->unk_14[2], configureApp->unk_14[3]);
    PokegearAppSwitch_SetCursorSpritesDrawState(configureApp->pokegear->appSwitch, 1, FALSE);
}

void ov101_021EF120(PokegearConfigureAppData *configureApp) {
    PokegearAppSwitch_RemoveButtons(configureApp->pokegear->appSwitch, 1);
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
