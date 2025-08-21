#include "application/pokegear/configure/pokegear_configure_internal.h"

#include "unk_02005D10.h"

BOOL ov101_021EF6D0(PokegearConfigureAppData *configureApp, u8 a1);

const TouchscreenHitbox ov101_021F83E4[] = {
    { .rect = { 24, 64, 24, 72 } },
    { .rect = { 24, 64, 104, 152 } },
    { .rect = { 24, 64, 184, 232 } },
    { .rect = { 96, 136, 24, 72 } },
    { .rect = { 96, 136, 104, 152 } },
    { .rect = { 96, 136, 184, 232 } },
    { .rect = { TOUCHSCREEN_RECTLIST_END } },
};

BOOL ov101_021EF6D0(PokegearConfigureAppData *configureApp, u8 a1) {
    u16 r2 = 1;
    r2 <<= a1;
    return configureApp->unk_12_00 & r2;
}

int ov101_021EF6E4(PokegearConfigureAppData *configureApp) {
    u8 r5;

    if (gSystem.newKeys & PAD_BUTTON_B) {
        configureApp->pokegear->cursorInAppSwitchZone = TRUE;
        PokegearAppSwitch_SetCursorSpritesDrawState(configureApp->pokegear->appSwitch, 1, FALSE);
        PokegearAppSwitch_SetCursorSpritesDrawState(configureApp->pokegear->appSwitch, 0, TRUE);
        PokegearAppSwitch_SetSpecIndexAndCursorPos(configureApp->pokegear->appSwitch, 0, PokegearApp_AppIDtoButtonIndex(configureApp->pokegear));
        PlaySE(SEQ_SE_GS_GEARCANCEL);
        return -1;
    }
    if (gSystem.newKeys & PAD_BUTTON_A) {
        r5 = PokegearAppSwitch_GetCursorPos(configureApp->pokegear->appSwitch);
        if (!ov101_021EF6D0(configureApp, r5)) {
            return -1;
        }
        ov101_021EF50C(configureApp, r5);
        PlaySE(SEQ_SE_GS_GEARDECIDE);
        return 8;
    }
    if (gSystem.newKeys & PAD_KEY_LEFT) {
        PokegearAppSwitch_MoveActiveCursor(configureApp->pokegear->appSwitch, 0);
        PlaySE(SEQ_SE_GS_GEARCURSOR);
    } else if (gSystem.newKeys & PAD_KEY_RIGHT) {
        PokegearAppSwitch_MoveActiveCursor(configureApp->pokegear->appSwitch, 1);
        PlaySE(SEQ_SE_GS_GEARCURSOR);
    } else if (gSystem.newKeys & PAD_KEY_UP) {
        PokegearAppSwitch_MoveActiveCursor(configureApp->pokegear->appSwitch, 2);
        PlaySE(SEQ_SE_GS_GEARCURSOR);
    } else if (gSystem.newKeys & PAD_KEY_DOWN) {
        PokegearAppSwitch_MoveActiveCursor(configureApp->pokegear->appSwitch, 3);
        PlaySE(SEQ_SE_GS_GEARCURSOR);
    }
    return -1;
}

int ov101_021EF7D4(PokegearConfigureAppData *configureApp) {
    int input;

    input = PokegearApp_HandleTouchInput_SwitchApps(configureApp->pokegear);
    if (input != -1) {
        return input;
    }
    input = TouchscreenHitbox_FindRectAtTouchNew(ov101_021F83E4);
    if (input != -1) {
        if (!ov101_021EF6D0(configureApp, input)) {
            return -1;
        }
        if (configureApp->pokegear->cursorInAppSwitchZone == TRUE) {
            ov101_021EF4DC(configureApp);
        }
        PokegearAppSwitch_SetActiveCursorPosition(configureApp->pokegear->appSwitch, input);
        ov101_021EF50C(configureApp, input);
        PlaySE(SEQ_SE_GS_GEARDECIDE);
        configureApp->pokegear->menuInputState = MENU_INPUT_STATE_TOUCH;
        return 8;
    }
    return -1;
}
