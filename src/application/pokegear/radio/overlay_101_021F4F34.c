#include "global.h"

#include "application/pokegear/radio/radio_internal.h"

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
