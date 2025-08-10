#include "global.h"

#include "application/pokegear/radio/radio_internal.h"

#include "sound_02004A44.h"
#include "touchscreen.h"
#include "unk_02005D10.h"

void Radio_ToggleChannelSelectionButtons(PokegearRadioAppData *radioApp, u8 on, u8 off);
void Radio_OpenStation(PokegearRadioAppData *radioApp);

static const TouchscreenHitbox sTuningAreaHitbox = {
    .circle = { TOUCHSCREEN_CIRCLE_SENTINEL, 128, 92, 52 },
};

static const TouchscreenHitbox sTuningHitboxes_Johto[] = {
    { .circle = { TOUCHSCREEN_CIRCLE_SENTINEL, 112, 76, 4 } },
    { .circle = { TOUCHSCREEN_CIRCLE_SENTINEL, 112, 76, 16 } },
    { .circle = { TOUCHSCREEN_CIRCLE_SENTINEL, 152, 76, 4 } },
    { .circle = { TOUCHSCREEN_CIRCLE_SENTINEL, 152, 76, 20 } },
    { .circle = { TOUCHSCREEN_CIRCLE_SENTINEL, 96, 108, 4 } },
    { .circle = { TOUCHSCREEN_CIRCLE_SENTINEL, 96, 108, 16 } },
    { .circle = { TOUCHSCREEN_CIRCLE_SENTINEL, 136, 116, 4 } },
    { .circle = { TOUCHSCREEN_CIRCLE_SENTINEL, 136, 116, 20 } },
    { .rect = { TOUCHSCREEN_RECTLIST_END } },
};

static const TouchscreenHitbox sTuningHitboxes_Kanto[] = {
    { .circle = { TOUCHSCREEN_CIRCLE_SENTINEL, 112, 76, 4 } },
    { .circle = { TOUCHSCREEN_CIRCLE_SENTINEL, 112, 76, 16 } },
    { .circle = { TOUCHSCREEN_CIRCLE_SENTINEL, 152, 76, 4 } },
    { .circle = { TOUCHSCREEN_CIRCLE_SENTINEL, 152, 76, 20 } },
    { .circle = { TOUCHSCREEN_CIRCLE_SENTINEL, 96, 108, 4 } },
    { .circle = { TOUCHSCREEN_CIRCLE_SENTINEL, 96, 108, 16 } },
    { .rect = { TOUCHSCREEN_RECTLIST_END } },
};

static const TouchscreenHitbox sTuningHitboxes_KantoEXPN[] = {
    { .circle = { TOUCHSCREEN_CIRCLE_SENTINEL, 112, 76, 4 } },
    { .circle = { TOUCHSCREEN_CIRCLE_SENTINEL, 112, 76, 16 } },
    { .circle = { TOUCHSCREEN_CIRCLE_SENTINEL, 152, 76, 4 } },
    { .circle = { TOUCHSCREEN_CIRCLE_SENTINEL, 152, 76, 20 } },
    { .circle = { TOUCHSCREEN_CIRCLE_SENTINEL, 96, 108, 4 } },
    { .circle = { TOUCHSCREEN_CIRCLE_SENTINEL, 96, 108, 16 } },
    { .circle = { TOUCHSCREEN_CIRCLE_SENTINEL, 136, 116, 4 } },
    { .circle = { TOUCHSCREEN_CIRCLE_SENTINEL, 136, 116, 20 } },
    { .circle = { TOUCHSCREEN_CIRCLE_SENTINEL, 128, 48, 4 } },
    { .circle = { TOUCHSCREEN_CIRCLE_SENTINEL, 128, 48, 8 } },
    { .rect = { TOUCHSCREEN_RECTLIST_END } },
};

static const TouchscreenHitbox sTuningHitboxes_NoSignal[] = {
    { .rect = { TOUCHSCREEN_RECTLIST_END } },
};

static const TouchscreenHitbox sTuningHitboxes_Rocket_Mahogany[] = {
    { .circle = { TOUCHSCREEN_CIRCLE_SENTINEL, 128, 92, 38 } },
    { .circle = { TOUCHSCREEN_CIRCLE_SENTINEL, 128, 92, 52 } },
    { .rect = { TOUCHSCREEN_RECTLIST_END } },
};

static const TouchscreenHitbox sTuningHitboxes_Alph[] = {
    { .circle = { TOUCHSCREEN_CIRCLE_SENTINEL, 128, 92, 4 } },
    { .circle = { TOUCHSCREEN_CIRCLE_SENTINEL, 128, 92, 16 } },
    { .rect = { TOUCHSCREEN_RECTLIST_END } },
};

static const TouchscreenHitbox *sTuningHitboxes[] = {
    sTuningHitboxes_Johto,
    sTuningHitboxes_Kanto,
    sTuningHitboxes_KantoEXPN,
    sTuningHitboxes_NoSignal,
    sTuningHitboxes_Alph,
    sTuningHitboxes_Rocket_Mahogany,
    sTuningHitboxes_Rocket_Mahogany,
};

static const TouchscreenHitbox sTuningButtonHitboxes[] = {
    { .rect = { 48, 76, 16, 48 } },
    { .rect = { 48, 76, 208, 240 } },
    { .rect = { 112, 140, 16, 48 } },
    { .rect = { 112, 140, 208, 240 } },
    { .rect = { TOUCHSCREEN_RECTLIST_END } },
};

void Radio_ToggleChannelSelectionButtons(PokegearRadioAppData *radioApp, u8 on, u8 off) {
    // Must be scoped here to match
    static u8 coords[][2] = {
        { 2,  6  },
        { 26, 6  },
        { 2,  14 },
        { 26, 14 },
    };

    if (off < 4) {
        CopyToBgTilemapRect(radioApp->pokegear->bgConfig, GF_BG_LYR_MAIN_2, coords[off][0], coords[off][1], 4, 4, radioApp->screenData->rawData, 0, 24, radioApp->screenData->screenWidth / 8, radioApp->screenData->screenHeight / 8);
    }
    if (on < 4) {
        CopyToBgTilemapRect(radioApp->pokegear->bgConfig, GF_BG_LYR_MAIN_2, coords[on][0], coords[on][1], 4, 4, radioApp->screenData->rawData, 4, 24, radioApp->screenData->screenWidth / 8, radioApp->screenData->screenHeight / 8);
    }
    ScheduleBgTilemapBufferTransfer(radioApp->pokegear->bgConfig, GF_BG_LYR_MAIN_2);
}

void Radio_OnReselectApp(void *cbArg) {
    PokegearRadioAppData *radioApp = cbArg;
    radioApp->isDraggingCursor = 0;
}

void Radio_UnknownCB(void *cbArg) {
    PokegearRadioAppData *radioApp = cbArg;
    radioApp->isDraggingCursor = 0;
    radioApp->pokegear->cursorInAppSwitchZone = FALSE;
    PokegearAppSwitchCursor_SetCursorSpritesDrawState(radioApp->pokegear->appSwitch, 0, FALSE);
}

void Radio_OpenStation(PokegearRadioAppData *radioApp) {
    if (!radioApp->stationActive) {
        if (radioApp->signalStrength == 2) {
            RadioShow_BeginSegment(radioApp->showData, radioApp->station, 0);
        } else {
            RadioShow_BeginSegment(radioApp->showData, radioApp->station, TRUE);
        }
        radioApp->stationActive = TRUE;
    }
}

void Radio_CloseStation(PokegearRadioAppData *radioApp) {
    if (radioApp->stationActive) {
        RadioShow_EndSegment(radioApp->showData);
        FillWindowPixelBuffer(&radioApp->windows[2], 0);
        FillWindowPixelBuffer(&radioApp->windows[1], 0);
        ScheduleWindowCopyToVram(&radioApp->windows[2]);
        ScheduleWindowCopyToVram(&radioApp->windows[1]);
        radioApp->stationActive = FALSE;
    }
}

void Radio_Start(PokegearRadioAppData *radioApp) {
    u8 signalStrength;
    radioApp->station = Radio_GetTunedStationID(radioApp, radioApp->cursorX, radioApp->cursorY, &signalStrength);
    radioApp->signalStrength = signalStrength;
    if (radioApp->station < 8) {
        Radio_OpenStation(radioApp);
    }
}

void Radio_Run(PokegearAppData *pokegear, void *cbArg) {
    PokegearRadioAppData *radioApp = cbArg;

    if (radioApp->stationActive) {
        RadioShow_Main(radioApp->showData);
    }
}

void Radio_BeginScriptWindowSlide(PokegearRadioAppData *radioApp, int direction) {
    G2S_SetWnd0Position(0, 112, 255, 192);
    G2S_SetWnd1Position(255, 112, 0, 192);
    G2S_SetWndOutsidePlane(17, FALSE);
    G2S_SetWnd0InsidePlane(31, FALSE);
    G2S_SetWnd1InsidePlane(31, FALSE);
    GXS_SetVisibleWnd(3);
    if (direction == 0) {
        for (int i = 0; i < 3; ++i) {
            BgSetPosTextAndCommit(radioApp->pokegear->bgConfig, GF_BG_LYR_SUB_1 + i, BG_POS_OP_SET_Y, -80);
            ToggleBgLayer(GF_BG_LYR_SUB_1 + i, TRUE);
        }
    } else {
        BgSetPosTextAndCommit(radioApp->pokegear->bgConfig, GF_BG_LYR_SUB_1, BG_POS_OP_SUB_Y, 0);
        BgSetPosTextAndCommit(radioApp->pokegear->bgConfig, GF_BG_LYR_SUB_2, BG_POS_OP_SUB_Y, 0);
        BgSetPosTextAndCommit(radioApp->pokegear->bgConfig, GF_BG_LYR_SUB_3, BG_POS_OP_SUB_Y, 0);
    }
    radioApp->windowScrollStep = 0;
    radioApp->windowScrollFinished = FALSE;
}

BOOL Radio_RunScriptWindowSlide(PokegearRadioAppData *radioApp, int direction) {
    if (radioApp->windowScrollFinished) {
        return TRUE;
    }
    if (direction == 0) {
        BgSetPosTextAndCommit(radioApp->pokegear->bgConfig, GF_BG_LYR_SUB_1, BG_POS_OP_ADD_Y, 10);
        BgSetPosTextAndCommit(radioApp->pokegear->bgConfig, GF_BG_LYR_SUB_2, BG_POS_OP_ADD_Y, 10);
        BgSetPosTextAndCommit(radioApp->pokegear->bgConfig, GF_BG_LYR_SUB_3, BG_POS_OP_ADD_Y, 10);
    } else {
        BgSetPosTextAndCommit(radioApp->pokegear->bgConfig, GF_BG_LYR_SUB_1, BG_POS_OP_SUB_Y, 10);
        BgSetPosTextAndCommit(radioApp->pokegear->bgConfig, GF_BG_LYR_SUB_2, BG_POS_OP_SUB_Y, 10);
        BgSetPosTextAndCommit(radioApp->pokegear->bgConfig, GF_BG_LYR_SUB_3, BG_POS_OP_SUB_Y, 10);
    }
    ++radioApp->windowScrollStep;
    if (radioApp->windowScrollStep < 8) {
        return FALSE;
    }
    radioApp->windowScrollStep = 0;
    radioApp->windowScrollFinished = TRUE;
    if (direction == 1) {
        for (int i = 0; i < 3; ++i) {
            ToggleBgLayer(GF_BG_LYR_SUB_1 + i, FALSE);
            BgClearTilemapBufferAndCommit(radioApp->pokegear->bgConfig, GF_BG_LYR_SUB_1 + i);
            BgSetPosTextAndCommit(radioApp->pokegear->bgConfig, GF_BG_LYR_SUB_1 + i, BG_POS_OP_SET_Y, 0);
            ScheduleBgTilemapBufferTransfer(radioApp->pokegear->bgConfig, GF_BG_LYR_SUB_1 + i);
        }
    }
    GXS_SetVisibleWnd(0);
    G2S_SetWnd0Position(0, 0, 0, 0);
    G2S_SetWnd1Position(0, 0, 0, 0);
    G2S_SetWnd0InsidePlane(0, FALSE);
    G2S_SetWnd1InsidePlane(0, FALSE);
    G2S_SetWndOutsidePlane(0, FALSE);
    return TRUE;
}

int Radio_HandleKeyInput(PokegearRadioAppData *radioApp) {
    int xSpeed = 0;
    int ySpeed = 0;
    s16 prevX;
    s16 prevY;
    u8 prevButton;
    if (gSystem.newKeys & PAD_BUTTON_B) {
        radioApp->pokegear->cursorInAppSwitchZone = TRUE;
        PokegearAppSwitchCursor_SetCursorSpritesDrawState(radioApp->pokegear->appSwitch, 0, TRUE);
        PokegearAppSwitch_SetSpecIndexAndCursorPos(radioApp->pokegear->appSwitch, 0, ov100_021E5DC8(radioApp->pokegear));
        PlaySE(SEQ_SE_GS_GEARCANCEL);
        return TOUCH_MENU_NO_INPUT;
    }
    if (gSystem.newKeys & PAD_BUTTON_A) {
        prevButton = radioApp->selectedButton;
        radioApp->selectedButton = (radioApp->selectedButton + 1) % 4;
        Radio_ToggleChannelSelectionButtons(radioApp, radioApp->selectedButton, prevButton);
        Radio_SnapCursorToChannelHitbox(radioApp, radioApp->selectedButton);
        PlaySE(SEQ_SE_GS_GEARCURSOR);
        return TOUCH_MENU_NO_INPUT;
    }
    if (gSystem.heldKeys & PAD_KEY_LEFT) {
        xSpeed = -2;
    }
    if (gSystem.heldKeys & PAD_KEY_RIGHT) {
        xSpeed = 2;
    }
    if (gSystem.heldKeys & PAD_KEY_UP) {
        ySpeed = -2;
    }
    if (gSystem.heldKeys & PAD_KEY_DOWN) {
        ySpeed = 2;
    }
    if (xSpeed == 0 && ySpeed == 0) {
        return TOUCH_MENU_NO_INPUT;
    }

    prevX = radioApp->cursorX;
    prevY = radioApp->cursorY;
    if (TouchscreenHitbox_PointIsIn(&sTuningAreaHitbox, radioApp->cursorX + xSpeed, radioApp->cursorY)) {
        radioApp->cursorX += xSpeed;
    }
    if (TouchscreenHitbox_PointIsIn(&sTuningAreaHitbox, radioApp->cursorX, radioApp->cursorY + ySpeed)) {
        radioApp->cursorY += ySpeed;
    }
    if (radioApp->cursorX != prevX || radioApp->cursorY != prevY) {
        Sprite_SetPositionXY(radioApp->sprites[4], radioApp->cursorX, radioApp->cursorY);
    }
    Radio_ToggleChannelSelectionButtons(radioApp, 4, radioApp->selectedButton);
    Radio_CoordsToStation(radioApp, radioApp->cursorX, radioApp->cursorY);
    return TOUCH_MENU_NO_INPUT;
}

int Radio_HandleTouchInput(PokegearRadioAppData *radioApp, BOOL *inputWasTouch) {
    *inputWasTouch = FALSE;
    if (radioApp->isDraggingCursor) {
        *inputWasTouch = TRUE;
        return Radio_HandleDragCursor(radioApp);
    }
    int input = Radio_HandleTouchInput_Internal(radioApp, inputWasTouch);
    if (*inputWasTouch) {
        radioApp->pokegear->menuInputState = MENU_INPUT_STATE_TOUCH;
        if (radioApp->pokegear->cursorInAppSwitchZone == TRUE) {
            Radio_UnknownCB(radioApp);
        }
    }
    return input;
}

u8 Radio_GetTunedStationID(PokegearRadioAppData *radioApp, s16 x, s16 y, u8 *pSignalStrengthRet) {
    u8 ret;
    int station = TouchscreenHitbox_FindHitboxAtPoint(sTuningHitboxes[radioApp->stationSelection], x, y);
    if (station == TOUCH_MENU_NO_INPUT) {
        ret = 255;
        if (pSignalStrengthRet != NULL) {
            *pSignalStrengthRet = 0;
        }
    } else {
        switch (radioApp->stationSelection) {
        case RADIO_STATION_SELECTION_JOHTO:
        case RADIO_STATION_SELECTION_KANTO:
        case RADIO_STATION_SELECTION_KANTO_EXPN:
        case RADIO_STATION_SELECTION_NO_SIGNAL:
            ret = station / 2u;
            break;
        case RADIO_STATION_SELECTION_ROCKET:
            ret = 6;
            break;
        case RADIO_STATION_SELECTION_MAHOGANY:
            ret = 7;
            break;
        default:
            ret = 5;
            break;
        }
        if (pSignalStrengthRet != NULL) {
            // 1: yes static
            // 2: no static
            *pSignalStrengthRet = 2 - (station % 2u);
        }
    }
    return ret;
}

int Radio_HandleTouchInput_Internal(PokegearRadioAppData *radioApp, BOOL *inputWasTouch) {
    int ret;
    TouchscreenHitbox hitbox;
    if (!System_GetTouchNew()) {
        return TOUCH_MENU_NO_INPUT;
    }
    ret = PokegearApp_HandleTouchInput_SwitchApps(radioApp->pokegear);
    if (ret != TOUCH_MENU_NO_INPUT) {
        *inputWasTouch = TRUE;
        return ret;
    }
    ret = TouchscreenHitbox_FindRectAtTouchNew(sTuningButtonHitboxes);
    if (ret != TOUCH_MENU_NO_INPUT) {
        Radio_ToggleChannelSelectionButtons(radioApp, ret, radioApp->selectedButton);
        Radio_SnapCursorToChannelHitbox(radioApp, ret);
        PlaySE(SEQ_SE_GS_GEARCURSOR);
        radioApp->selectedButton = ret;
        *inputWasTouch = TRUE;
        return TOUCH_MENU_NO_INPUT;
    }
    if (!TouchscreenHitbox_PointIsIn(&sTuningAreaHitbox, gSystem.touchX, gSystem.touchY)) {
        return TOUCH_MENU_NO_INPUT;
    }

    // If you tapped within 8 pixels of the cursor, snap the cursor to where you tapped.
    hitbox.circle.sentinel = TOUCHSCREEN_CIRCLE_SENTINEL;
    hitbox.circle.r = 8;
    hitbox.circle.x = radioApp->cursorX;
    hitbox.circle.y = radioApp->cursorY;
    if (TouchscreenHitbox_PointIsIn(&hitbox, gSystem.touchX, gSystem.touchY)) {
        radioApp->cursorX = gSystem.touchX;
        radioApp->cursorY = gSystem.touchY;
        Sprite_SetPositionXY(radioApp->sprites[4], radioApp->cursorX, radioApp->cursorY);
        radioApp->isDraggingCursor = TRUE;
        *inputWasTouch = TRUE;
        Radio_ToggleChannelSelectionButtons(radioApp, 4, radioApp->selectedButton);
        Radio_CoordsToStation(radioApp, radioApp->cursorX, radioApp->cursorY);
    }
    return TOUCH_MENU_NO_INPUT;
}

int Radio_HandleDragCursor(PokegearRadioAppData *radioApp) {
    if (!System_GetTouchHeld()) {
        // released stylus
        radioApp->isDraggingCursor = FALSE;
        return TOUCH_MENU_NO_INPUT;
    }
    if (TouchscreenHitbox_PointIsIn(&sTuningAreaHitbox, gSystem.touchX, gSystem.touchY)) {
        radioApp->cursorX = gSystem.touchX;
        radioApp->cursorY = gSystem.touchY;
        Sprite_SetPositionXY(radioApp->sprites[4], radioApp->cursorX, radioApp->cursorY);
        Radio_CoordsToStation(radioApp, radioApp->cursorX, radioApp->cursorY);
    }
    return TOUCH_MENU_NO_INPUT;
}

BOOL Radio_CoordsToStation(PokegearRadioAppData *radioApp, s16 x, s16 y) {
    u8 signalStrength = 0;
    u8 station = Radio_GetTunedStationID(radioApp, x, y, &signalStrength);
    if (station == 255) {
        if (radioApp->signalStrength != 0) {
            Radio_CloseStation(radioApp);
            StopBGM(GF_GetCurrentPlayingBGM(), 0);
        }
        radioApp->signalStrength = 0;
        radioApp->station = 255;
        return 0;
    }

    if (station == radioApp->station) {
        if (signalStrength != radioApp->signalStrength) {
            if (signalStrength == 2) {
                RadioShow_SetStaticLevel(radioApp->showData, FALSE);
            } else {
                RadioShow_SetStaticLevel(radioApp->showData, TRUE);
            }
            radioApp->signalStrength = signalStrength;
        }
        return FALSE;
    }
    if (radioApp->station != 255) {
        Radio_CloseStation(radioApp);
    }
    radioApp->station = station;
    radioApp->signalStrength = signalStrength;
    Radio_OpenStation(radioApp);
    return TRUE;
}

void Radio_SnapCursorToChannelHitbox(PokegearRadioAppData *radioApp, u8 channel) {
    radioApp->cursorX = sTuningHitboxes_Johto[channel * 2].circle.x;
    radioApp->cursorY = sTuningHitboxes_Johto[channel * 2].circle.y;
    Sprite_SetPositionXY(radioApp->sprites[4], radioApp->cursorX, radioApp->cursorY);
    Radio_CoordsToStation(radioApp, radioApp->cursorX, radioApp->cursorY);
}
