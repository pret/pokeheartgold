#include "global.h"

#include "application/pokegear/radio/radio_internal.h"

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
