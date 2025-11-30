#include "application/pokegear/configure/pokegear_configure_internal.h"

#include "unk_02005D10.h"

static BOOL PokegearConfigure_IsSkinUnlocked(PokegearConfigureAppData *configureApp, u8 skin);

static const TouchscreenHitbox sTouchscreenHitboxes[] = {
    { .rect = { 24, 64, 24, 72 } },
    { .rect = { 24, 64, 104, 152 } },
    { .rect = { 24, 64, 184, 232 } },
    { .rect = { 96, 136, 24, 72 } },
    { .rect = { 96, 136, 104, 152 } },
    { .rect = { 96, 136, 184, 232 } },
    { .rect = { TOUCHSCREEN_RECTLIST_END } },
};

static BOOL PokegearConfigure_IsSkinUnlocked(PokegearConfigureAppData *configureApp, u8 skin) {
    u16 mask = 1;
    mask <<= skin;
    return configureApp->unlockedSkins & mask;
}

int PokegearConfigure_HandleKeyInput(PokegearConfigureAppData *configureApp) {
    u8 input;

    if (gSystem.newKeys & PAD_BUTTON_B) {
        configureApp->pokegear->cursorInAppSwitchZone = TRUE;
        PokegearCursorManager_SetCursorSpritesDrawState(configureApp->pokegear->cursorManager, 1, FALSE);
        PokegearCursorManager_SetCursorSpritesDrawState(configureApp->pokegear->cursorManager, 0, TRUE);
        PokegearCursorManager_SetSpecIndexAndCursorPos(configureApp->pokegear->cursorManager, 0, PokegearApp_AppIdToButtonIndex(configureApp->pokegear));
        PlaySE(SEQ_SE_GS_GEARCANCEL);
        return -1;
    }
    if (gSystem.newKeys & PAD_BUTTON_A) {
        input = PokegearCursorManager_GetCursorPos(configureApp->pokegear->cursorManager);
        if (!PokegearConfigure_IsSkinUnlocked(configureApp, input)) {
            return TOUCH_MENU_NO_INPUT;
        }
        PokegearConfigure_SpawnContextMenu(configureApp, input);
        PlaySE(SEQ_SE_GS_GEARDECIDE);
        return GEAR_RETURN_8;
    }
    if (gSystem.newKeys & PAD_KEY_LEFT) {
        PokegearCursorManager_MoveActiveCursor(configureApp->pokegear->cursorManager, 0);
        PlaySE(SEQ_SE_GS_GEARCURSOR);
    } else if (gSystem.newKeys & PAD_KEY_RIGHT) {
        PokegearCursorManager_MoveActiveCursor(configureApp->pokegear->cursorManager, 1);
        PlaySE(SEQ_SE_GS_GEARCURSOR);
    } else if (gSystem.newKeys & PAD_KEY_UP) {
        PokegearCursorManager_MoveActiveCursor(configureApp->pokegear->cursorManager, 2);
        PlaySE(SEQ_SE_GS_GEARCURSOR);
    } else if (gSystem.newKeys & PAD_KEY_DOWN) {
        PokegearCursorManager_MoveActiveCursor(configureApp->pokegear->cursorManager, 3);
        PlaySE(SEQ_SE_GS_GEARCURSOR);
    }
    return TOUCH_MENU_NO_INPUT;
}

int PokegearConfigure_HandleTouchInput(PokegearConfigureAppData *configureApp) {
    int input;

    input = PokegearApp_HandleTouchInput_SwitchApps(configureApp->pokegear);
    if (input != TOUCH_MENU_NO_INPUT) {
        return input;
    }
    input = TouchscreenHitbox_FindRectAtTouchNew(sTouchscreenHitboxes);
    if (input != TOUCH_MENU_NO_INPUT) {
        if (!PokegearConfigure_IsSkinUnlocked(configureApp, input)) {
            return TOUCH_MENU_NO_INPUT;
        }
        if (configureApp->pokegear->cursorInAppSwitchZone == TRUE) {
            PokegearConfigure_SetAppCursorActive(configureApp);
        }
        PokegearCursorManager_SetActiveCursorPosition(configureApp->pokegear->cursorManager, input);
        PokegearConfigure_SpawnContextMenu(configureApp, input);
        PlaySE(SEQ_SE_GS_GEARDECIDE);
        configureApp->pokegear->menuInputState = MENU_INPUT_STATE_TOUCH;
        return GEAR_RETURN_8;
    }
    return TOUCH_MENU_NO_INPUT;
}
