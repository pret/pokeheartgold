#include "global.h"

#include "application/pokegear/phone.h"

#include "system.h"
#include "touch_hitbox_controller.h"
#include "unk_02005D10.h"

int ov100_021E59CC(PokegearPhoneApp *phoneApp);
void ov100_021E5A88(PokegearPhoneApp *phoneApp);
BOOL ov100_021E5B4C(PokegearPhoneApp *phoneApp, u8 selection, u8 a2);
void ov100_021E7128(PokegearPhoneApp_UnkSub07C *a0, int a1, int a2);
void ov100_021E73AC(PokegearPhoneApp_UnkSub07C *a0, int a1);

extern const TouchscreenHitbox ov100_021E74C4[5];

BOOL ov100_021E5900(PokegearPhoneApp *phoneApp) {
    phoneApp->unk_010 = phoneApp->unk_00C;
    if (gSystem.newKeys & (PAD_BUTTON_A | PAD_BUTTON_B | PAD_KEY_RIGHT | PAD_KEY_LEFT | PAD_KEY_UP | PAD_KEY_DOWN | PAD_BUTTON_X | PAD_BUTTON_Y)) {
        phoneApp->unk_00C = MENU_INPUT_STATE_BUTTONS;
        return TRUE;
    } else {
        return FALSE;
    }
}

int ov100_021E5924(PokegearPhoneApp *phoneApp) {
    int result = TouchscreenHitbox_FindRectAtTouchNew(ov100_021E74C4);
    if (result == -1) {
        return -1;
    }
    u16 val = 0;
    if (DoesPixelAtScreenXYMatchPtrVal(phoneApp->bgConfig, GF_BG_LYR_MAIN_0, gSystem.touchX, gSystem.touchY, &val) == 1) {
        return -1;
    }
    if (result == phoneApp->unk_004) {
        return -1;
    }
    if ((result == 1 && !(phoneApp->unk_005_0 & 2)) || (result == 2 && !(phoneApp->unk_005_0 & 1))) {
        return -1;
    }
    ov100_021E5B4C(phoneApp, result, 1);
    PlaySE(result != 4 ? SEQ_SE_GS_GEARAPPLICHANGE : SEQ_SE_GS_GEARCANCEL);
    phoneApp->unk_006 = 0;
    phoneApp->unk_00C = MENU_INPUT_STATE_TOUCH;
    return result;
}

int ov100_021E59CC(PokegearPhoneApp *phoneApp) {
    if (gSystem.newKeys & PAD_BUTTON_B) {
        PlaySE(SEQ_SE_GS_GEARCANCEL);
        return 4;
    }
    if (gSystem.newKeys & PAD_BUTTON_A) {
        PokegearPhoneApp_UnkSub07C_Sub8_Sub4 *r4 = &phoneApp->unk_07C->unk_08->unk_04[phoneApp->unk_07C->unk_08->unk_01];
        ov100_021E7128(phoneApp->unk_07C, 0, 0);
        phoneApp->unk_006 = 0;
        PlaySE(r4->unk_00 != 4 ? SEQ_SE_GS_GEARAPPLICHANGE : SEQ_SE_GS_GEARCANCEL);
        if (r4->unk_00 == phoneApp->unk_004) {
            if (phoneApp->unk_05C != NULL) {
                phoneApp->unk_05C(phoneApp->unk_064);
            }
            return -1;
        }
        ov100_021E5B4C(phoneApp, r4->unk_00, 1);
        return r4->unk_00;
    }
    if (gSystem.newKeys & PAD_KEY_LEFT) {
        PlaySE(SEQ_SE_GS_GEARCURSOR);
        ov100_021E73AC(phoneApp->unk_07C, 0);
        return -1;
    }
    if (gSystem.newKeys & PAD_KEY_RIGHT) {
        PlaySE(SEQ_SE_GS_GEARCURSOR);
        ov100_021E73AC(phoneApp->unk_07C, 1);
        return -1;
    }
    return -1;
}

void ov100_021E5A88(PokegearPhoneApp *phoneApp) {
    u8 r4 = phoneApp->unk_005_0;
    CopyToBgTilemapRect(phoneApp->bgConfig, GF_BG_LYR_MAIN_0, 0, 20, 32, 4, phoneApp->unk_0C8->unk_0C, 0, 0, phoneApp->unk_0C8->unk_00 / 8, phoneApp->unk_0C8->unk_02 / 8);
    if (!(r4 & 1)) {
        CopyToBgTilemapRect(phoneApp->bgConfig, GF_BG_LYR_MAIN_0, 13, 20, 6, 4, phoneApp->unk_0C8->unk_0C, 0, 8, phoneApp->unk_0C8->unk_00 / 8, phoneApp->unk_0C8->unk_02 / 8);
    }
    if (!(r4 & 2)) {
        CopyToBgTilemapRect(phoneApp->bgConfig, GF_BG_LYR_MAIN_0, 7, 20, 6, 4, phoneApp->unk_0C8->unk_0C, 0, 8, phoneApp->unk_0C8->unk_00 / 8, phoneApp->unk_0C8->unk_02 / 8);
    }
    ScheduleBgTilemapBufferTransfer(phoneApp->bgConfig, GF_BG_LYR_MAIN_0);
}

BOOL ov100_021E5B4C(PokegearPhoneApp *phoneApp, u8 selection, u8 a2) {
    u8 r2;
    ov100_021E5A88(phoneApp);
    if (selection == 4) {
        r2 = 26;
    } else {
        r2 = selection * 6 + 1;
    }
    CopyToBgTilemapRect(phoneApp->bgConfig, GF_BG_LYR_MAIN_0, r2, 20, 6, 4, phoneApp->unk_0C8->unk_0C, r2, a2 * 4, phoneApp->unk_0C8->unk_00 / 8, phoneApp->unk_0C8->unk_02 / 8);
    ScheduleBgTilemapBufferTransfer(phoneApp->bgConfig, GF_BG_LYR_MAIN_0);
    return FALSE;
}

BOOL ov100_021E5BB0(PokegearPhoneApp *phoneApp, BOOL a1) {
    RTCDate date;
    RTCTime time;
    u8 sp0[4];

    GF_RTC_CopyDateTime(&date, &time);
    if (a1 == 0 && phoneApp->unk_080.second == time.second) {
        return FALSE;
    }

    sp0[0] = time.hour / 10;
    sp0[1] = time.hour % 10;
    sp0[2] = time.minute / 10;
    sp0[3] = time.minute % 10;
    for (u8 i = 0; i < 4; i++) {
        UnkImageStruct_SetSpriteAnimCtrlCurrentFrame(phoneApp->unk_0AC[i], sp0[i]);
    }
    UnkImageStruct_SetSpriteAnimCtrlCurrentFrame(phoneApp->unk_0A8, date.week);
    phoneApp->unk_080 = time;
    phoneApp->unk_007 = 0;
    return TRUE;
}

int ov100_021E5C50(u16 a0, u16 a1) {
    if (a0 > 21) {
        if (a0 == 25 && a1 == 8) {
            return 2;
        } else if ((a0 == 28 && a1 == 6) || (a0 == 28 && a1 > 8 && a1 < 13)) {
            return 1;
        } else {
            return 0;
        }
    }

    return 2;
}

int ov100_021E5C80(PokegearPhoneApp *phoneApp) {
    return ov100_021E5C50(phoneApp->args->x / 32, phoneApp->args->y / 32);
}
