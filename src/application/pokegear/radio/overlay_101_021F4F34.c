#include "global.h"

#include "application/pokegear/radio/radio_internal.h"

#include "sound_02004A44.h"
#include "touchscreen.h"
#include "unk_02005D10.h"

void ov101_021F4F34(PokegearRadioAppData *radioApp, u8 a1, u8 a2);
void ov101_021F5000(PokegearRadioAppData *radioApp);

void ov101_021F4F34(PokegearRadioAppData *radioApp, u8 a1, u8 a2) {
    // Must be scoped here to match
    static u8 ov101_021FB2C8[][2] = {
        { 2,  6  },
        { 26, 6  },
        { 2,  14 },
        { 26, 14 },
    };

    if (a2 < 4) {
        CopyToBgTilemapRect(radioApp->pokegear->bgConfig, GF_BG_LYR_MAIN_2, ov101_021FB2C8[a2][0], ov101_021FB2C8[a2][1], 4, 4, radioApp->unk_68->rawData, 0, 24, radioApp->unk_68->screenWidth / 8, radioApp->unk_68->screenHeight / 8);
    }
    if (a1 < 4) {
        CopyToBgTilemapRect(radioApp->pokegear->bgConfig, GF_BG_LYR_MAIN_2, ov101_021FB2C8[a1][0], ov101_021FB2C8[a1][1], 4, 4, radioApp->unk_68->rawData, 4, 24, radioApp->unk_68->screenWidth / 8, radioApp->unk_68->screenHeight / 8);
    }
    ScheduleBgTilemapBufferTransfer(radioApp->pokegear->bgConfig, GF_BG_LYR_MAIN_2);
}

void ov101_021F4FCC(void *cbArg) {
    PokegearRadioAppData *radioApp = cbArg;
    radioApp->unk_24_1 = 0;
}

void ov101_021F4FDC(void *cbArg) {
    PokegearRadioAppData *radioApp = cbArg;
    radioApp->unk_24_1 = 0;
    radioApp->pokegear->cursorInAppSwitchZone = FALSE;
    PokegearAppSwitchCursor_SetCursorSpritesDrawState(radioApp->pokegear->appSwitch, 0, FALSE);
}

void ov101_021F5000(PokegearRadioAppData *radioApp) {
    if (radioApp->unk_26_6 == 0) {
        if (radioApp->unk_26_4 == 2) {
            ov101_021F5970(radioApp->unk_60, radioApp->unk_27, 0);
        } else {
            ov101_021F5970(radioApp->unk_60, radioApp->unk_27, 1);
        }
        radioApp->unk_26_6 = 1;
    }
}

void ov101_021F5048(PokegearRadioAppData *radioApp) {
    if (radioApp->unk_26_6 != 0) {
        ov101_021F5A50(radioApp->unk_60);
        FillWindowPixelBuffer(&radioApp->unk_30[2], 0);
        FillWindowPixelBuffer(&radioApp->unk_30[1], 0);
        ScheduleWindowCopyToVram(&radioApp->unk_30[2]);
        ScheduleWindowCopyToVram(&radioApp->unk_30[1]);
        radioApp->unk_26_6 = 0;
    }
}

void ov101_021F5090(PokegearRadioAppData *radioApp) {
    u8 sp0;
    radioApp->unk_27 = ov101_021F54AC(radioApp, radioApp->unk_28, radioApp->unk_2A, &sp0);
    radioApp->unk_26_4 = sp0;
    if (radioApp->unk_27 < 8) {
        ov101_021F5000(radioApp);
    }
}

void ov101_021F50D8(PokegearAppData *pokegear, void *cbArg) {
    PokegearRadioAppData *radioApp = cbArg;

    if (radioApp->unk_26_6 != 0) {
        ov101_021F5B94(radioApp->unk_60);
    }
}

void ov101_021F50F0(PokegearRadioAppData *radioApp, int a1) {
    G2S_SetWnd0Position(0x00, 0x70, 0xFF, 0xC0);
    G2S_SetWnd1Position(0xFF, 0x70, 0x00, 0xC0);
    G2S_SetWndOutsidePlane(17, FALSE);
    G2S_SetWnd0InsidePlane(31, FALSE);
    G2S_SetWnd1InsidePlane(31, FALSE);
    GXS_SetVisibleWnd(3);
    if (a1 == 0) {
        for (int i = 0; i < 3; ++i) {
            BgSetPosTextAndCommit(radioApp->pokegear->bgConfig, GF_BG_LYR_SUB_1 + i, BG_POS_OP_SET_Y, -0x50);
            ToggleBgLayer(GF_BG_LYR_SUB_1 + i, TRUE);
        }
    } else {
        BgSetPosTextAndCommit(radioApp->pokegear->bgConfig, GF_BG_LYR_SUB_1, BG_POS_OP_SUB_Y, 0);
        BgSetPosTextAndCommit(radioApp->pokegear->bgConfig, GF_BG_LYR_SUB_2, BG_POS_OP_SUB_Y, 0);
        BgSetPosTextAndCommit(radioApp->pokegear->bgConfig, GF_BG_LYR_SUB_3, BG_POS_OP_SUB_Y, 0);
    }
    radioApp->unk_2E_0 = 0;
    radioApp->unk_2E_15 = 0;
}

BOOL ov101_021F51C0(PokegearRadioAppData *radioApp, int a1) {
    if (radioApp->unk_2E_15) {
        return TRUE;
    }
    if (a1 == 0) {
        BgSetPosTextAndCommit(radioApp->pokegear->bgConfig, GF_BG_LYR_SUB_1, BG_POS_OP_ADD_Y, 10);
        BgSetPosTextAndCommit(radioApp->pokegear->bgConfig, GF_BG_LYR_SUB_2, BG_POS_OP_ADD_Y, 10);
        BgSetPosTextAndCommit(radioApp->pokegear->bgConfig, GF_BG_LYR_SUB_3, BG_POS_OP_ADD_Y, 10);
    } else {
        BgSetPosTextAndCommit(radioApp->pokegear->bgConfig, GF_BG_LYR_SUB_1, BG_POS_OP_SUB_Y, 10);
        BgSetPosTextAndCommit(radioApp->pokegear->bgConfig, GF_BG_LYR_SUB_2, BG_POS_OP_SUB_Y, 10);
        BgSetPosTextAndCommit(radioApp->pokegear->bgConfig, GF_BG_LYR_SUB_3, BG_POS_OP_SUB_Y, 10);
    }
    ++radioApp->unk_2E_0;
    if (radioApp->unk_2E_0 < 8) {
        return FALSE;
    }
    radioApp->unk_2E_0 = 0;
    radioApp->unk_2E_15 = 1;
    if (a1 == 1) {
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

extern const TouchscreenHitbox ov101_021F8968;

int ov101_021F5304(PokegearRadioAppData *radioApp) {
    int xSpeed = 0;
    int ySpeed = 0;
    s16 prevX;
    s16 prevY;
    u8 r2;
    if (gSystem.newKeys & PAD_BUTTON_B) {
        radioApp->pokegear->cursorInAppSwitchZone = TRUE;
        PokegearAppSwitchCursor_SetCursorSpritesDrawState(radioApp->pokegear->appSwitch, 0, TRUE);
        PokegearAppSwitch_SetSpecIndexAndCursorPos(radioApp->pokegear->appSwitch, 0, ov100_021E5DC8(radioApp->pokegear));
        PlaySE(SEQ_SE_GS_GEARCANCEL);
        return TOUCH_MENU_NO_INPUT;
    }
    if (gSystem.newKeys & PAD_BUTTON_A) {
        r2 = radioApp->unk_24_5;
        radioApp->unk_24_5 = (radioApp->unk_24_5 + 1) % 4;
        ov101_021F4F34(radioApp, radioApp->unk_24_5, r2);
        ov101_021F5780(radioApp, radioApp->unk_24_5);
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

    prevX = radioApp->unk_28;
    prevY = radioApp->unk_2A;
    if (TouchscreenHitbox_PointIsIn(&ov101_021F8968, radioApp->unk_28 + xSpeed, radioApp->unk_2A)) {
        radioApp->unk_28 += xSpeed;
    }
    if (TouchscreenHitbox_PointIsIn(&ov101_021F8968, radioApp->unk_28, radioApp->unk_2A + ySpeed)) {
        radioApp->unk_2A += ySpeed;
    }
    if (radioApp->unk_28 != prevX || radioApp->unk_2A != prevY) {
        Sprite_SetPositionXY(radioApp->unk_10[4], radioApp->unk_28, radioApp->unk_2A);
    }
    ov101_021F4F34(radioApp, 4, radioApp->unk_24_5);
    ov101_021F56B4(radioApp, radioApp->unk_28, radioApp->unk_2A);
    return TOUCH_MENU_NO_INPUT;
}

int ov101_021F5468(PokegearRadioAppData *radioApp, BOOL *inputWasTouch) {
    *inputWasTouch = FALSE;
    if (radioApp->unk_24_1 != 0) {
        *inputWasTouch = TRUE;
        return ov101_021F5650(radioApp);
    }
    int r6 = ov101_021F5524(radioApp, inputWasTouch);
    if (*inputWasTouch) {
        radioApp->pokegear->menuInputState = MENU_INPUT_STATE_TOUCH;
        if (radioApp->pokegear->cursorInAppSwitchZone == TRUE) {
            ov101_021F4FDC(radioApp);
        }
    }
    return r6;
}

extern const TouchscreenHitbox *ov101_021FB2D0[];

u8 ov101_021F54AC(PokegearRadioAppData *radioApp, s16 x, s16 y, u8 *a3) {
    u8 ret;
    int r0 = TouchscreenHitbox_FindHitboxAtPoint(ov101_021FB2D0[radioApp->unk_26_0], x, y);
    if (r0 == TOUCH_MENU_NO_INPUT) {
        ret = 0xFF;
        if (a3 != NULL) {
            *a3 = 0;
        }
    } else {
        switch (radioApp->unk_26_0) {
        case 0:
        case 1:
        case 2:
        case 3:
            ret = r0 / 2u;
            break;
        case 5:
            ret = 6;
            break;
        case 6:
            ret = 7;
            break;
        default:
            ret = 5;
            break;
        }
        if (a3 != NULL) {
            *a3 = 2 - (r0 % 2u);
        }
    }
    return ret;
}

extern const TouchscreenHitbox ov101_021F8984[];

int ov101_021F5524(PokegearRadioAppData *radioApp, BOOL *inputWasTouch) {
    int ret;
    TouchscreenHitbox sp0;
    if (!System_GetTouchNew()) {
        return TOUCH_MENU_NO_INPUT;
    }
    ret = PokegearApp_HandleTouchInput_SwitchApps(radioApp->pokegear);
    if (ret != TOUCH_MENU_NO_INPUT) {
        *inputWasTouch = TRUE;
        return ret;
    }
    ret = TouchscreenHitbox_FindRectAtTouchNew(ov101_021F8984);
    if (ret != TOUCH_MENU_NO_INPUT) {
        ov101_021F4F34(radioApp, ret, radioApp->unk_24_5);
        ov101_021F5780(radioApp, ret);
        PlaySE(SEQ_SE_GS_GEARCURSOR);
        radioApp->unk_24_5 = ret;
        *inputWasTouch = TRUE;
        return TOUCH_MENU_NO_INPUT;
    }
    if (!TouchscreenHitbox_PointIsIn(&ov101_021F8968, gSystem.touchX, gSystem.touchY)) {
        return TOUCH_MENU_NO_INPUT;
    }
    sp0.circle.sentinel = TOUCHSCREEN_CIRCLE_SENTINEL;
    sp0.circle.r = 8;
    sp0.circle.x = radioApp->unk_28;
    sp0.circle.y = radioApp->unk_2A;
    if (TouchscreenHitbox_PointIsIn(&sp0, gSystem.touchX, gSystem.touchY)) {
        radioApp->unk_28 = gSystem.touchX;
        radioApp->unk_2A = gSystem.touchY;
        Sprite_SetPositionXY(radioApp->unk_10[4], radioApp->unk_28, radioApp->unk_2A);
        radioApp->unk_24_1 = 1;
        *inputWasTouch = TRUE;
        ov101_021F4F34(radioApp, 4, radioApp->unk_24_5);
        ov101_021F56B4(radioApp, radioApp->unk_28, radioApp->unk_2A);
    }
    return TOUCH_MENU_NO_INPUT;
}

int ov101_021F5650(PokegearRadioAppData *radioApp) {
    if (!System_GetTouchHeld()) {
        radioApp->unk_24_1 = 0;
        return TOUCH_MENU_NO_INPUT;
    }
    if (TouchscreenHitbox_PointIsIn(&ov101_021F8968, gSystem.touchX, gSystem.touchY)) {
        radioApp->unk_28 = gSystem.touchX;
        radioApp->unk_2A = gSystem.touchY;
        Sprite_SetPositionXY(radioApp->unk_10[4], radioApp->unk_28, radioApp->unk_2A);
        ov101_021F56B4(radioApp, radioApp->unk_28, radioApp->unk_2A);
    }
    return TOUCH_MENU_NO_INPUT;
}

BOOL ov101_021F56B4(PokegearRadioAppData *radioApp, s16 x, s16 y) {
    u8 sp0 = 0;
    u8 r4 = ov101_021F54AC(radioApp, x, y, &sp0);
    if (r4 == 0xFF) {
        if (radioApp->unk_26_4 != 0) {
            ov101_021F5048(radioApp);
            StopBGM(GF_GetCurrentPlayingBGM(), 0);
        }
        radioApp->unk_26_4 = 0;
        radioApp->unk_27 = 0xFF;
        return 0;
    }

    if (r4 == radioApp->unk_27) {
        if (sp0 != radioApp->unk_26_4) {
            if (sp0 == 2) {
                ov101_021F5A9C(radioApp->unk_60, 0);
            } else {
                ov101_021F5A9C(radioApp->unk_60, 1);
            }
            radioApp->unk_26_4 = sp0;
        }
        return FALSE;
    }
    if (radioApp->unk_27 != 0xFF) {
        ov101_021F5048(radioApp);
    }
    radioApp->unk_27 = r4;
    radioApp->unk_26_4 = sp0;
    ov101_021F5000(radioApp);
    return TRUE;
}

extern const TouchscreenHitbox ov101_021F89B4[];

void ov101_021F5780(PokegearRadioAppData *radioApp, u8 a1) {
    radioApp->unk_28 = ov101_021F89B4[a1 * 2].circle.x;
    radioApp->unk_2A = ov101_021F89B4[a1 * 2].circle.y;
    Sprite_SetPositionXY(radioApp->unk_10[4], radioApp->unk_28, radioApp->unk_2A);
    ov101_021F56B4(radioApp, radioApp->unk_28, radioApp->unk_2A);
}
