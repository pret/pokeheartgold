#include "global.h"

#include "application/pokegear/map/pokegear_map_internal.h"

#include "unk_02005D10.h"

BOOL ov101_021EB654(PokegearMapAppData *mapApp);
int ov101_021EB784(PokegearMapAppData *mapApp, int a1);
int ov101_021EB818(PokegearMapAppData *mapApp);
int ov101_021EB94C(PokegearMapAppData *mapApp);
int ov101_021EC49C(PokegearMapAppData *mapApp, u16 a1, u16 a2, int *a3, int *a4);
BOOL ov101_021EA6C4(PokegearMapAppData *mapApp, PokegearMapAppData_Sub118 *a1);
int ov101_021EBA44(PokegearMapAppData *mapApp, BOOL *pRetIsTouch);
int ov101_021EBC1C(PokegearMapAppData *mapApp, BOOL *pRetIsTouch);
void ov101_021EBDEC(PokegearMapAppData *mapApp);
int ov101_021EC0AC(PokegearMapAppData *mapApp);
int ov101_021EC304(PokegearMapAppData *mapApp);
int ov101_021EC778(PokegearMapAppData *mapApp);
void ov101_021EC980(PokegearMapAppData *mapApp, s16 *a1, s16 *a2);

extern const TouchscreenHitbox ov101_021F7E94[2];
extern const TouchscreenHitbox ov101_021F7EA4[2];
extern const TouchscreenHitbox ov101_021F7EAC[];

int ov101_021EB568(PokegearMapAppData *mapApp) {
    int ret;

    if ((gSystem.newKeys & PAD_BUTTON_B) && !mapApp->unk_139_2) {
        mapApp->pokegear->cursorInAppSwitchZone = TRUE;
        PokegearAppSwitchCursor_SetCursorSpritesDrawState(mapApp->pokegear->appSwitch, 0, TRUE);
        PokegearAppSwitch_SetSpecIndexAndCursorPos(mapApp->pokegear->appSwitch, 0, ov100_021E5DC8(mapApp->pokegear));
        ov101_021EB2D8(mapApp);
        PlaySE(SEQ_SE_GS_GEARCANCEL);
        return -1;
    }

    ret = ov101_021EB818(mapApp);
    if (ret == 7) {
        return ret;
    }
    ov101_021EC304(mapApp);
    ov101_021EC778(mapApp);
    return -1;
}

int ov101_021EB5DC(PokegearMapAppData *mapApp, BOOL *pRetIsTouch) {
    int ret = -1;

    if (!mapApp->unk_139_3) {
        ret = PokegearApp_HandleTouchInput_SwitchApps(mapApp->pokegear);
    }
    if (ret != -1) {
        *pRetIsTouch = TRUE;
        return ret;
    }
    if (!mapApp->unk_139_3) {
        ret = ov101_021EBA44(mapApp, pRetIsTouch);
        if (*pRetIsTouch && mapApp->pokegear->cursorInAppSwitchZone == TRUE) {
            mapApp->pokegear->cursorInAppSwitchZone = FALSE;
            ov101_021EB2FC(mapApp);
        }
        if (ret == 7) {
            return ret;
        }
        ov101_021EC778(mapApp);
    } else {
        *pRetIsTouch = TRUE;
        ret = ov101_021EC0AC(mapApp);
    }
    return ret;
}

BOOL ov101_021EB654(PokegearMapAppData *mapApp) {
    u8 r4 = 0;
    int r5 = gSystem.heldKeys;
    UnkStruct_ov100_021E6E20_Sub8 *r1 = &mapApp->unk_084->unk_08[5];

    if (r5 & PAD_KEY_UP) {
        if (mapApp->unk_112 > mapApp->unk_104 + 1) {
            --mapApp->unk_112;
            mapApp->unk_13B |= 1;
            r4 = 1;
        }
    } else if (r5 & PAD_KEY_DOWN) {
        if (mapApp->unk_112 < mapApp->unk_106) {
            ++mapApp->unk_112;
            mapApp->unk_13B |= 2;
            r4 = 1;
        }
    }
    if (r5 & PAD_KEY_LEFT) {
        if (mapApp->unk_110 > mapApp->unk_100 + 1) {
            --mapApp->unk_110;
            mapApp->unk_13B |= 4;
            r4 = 1;
        }
    } else if (r5 & PAD_KEY_RIGHT) {
        if (mapApp->unk_110 < mapApp->unk_102 - 1) {
            ++mapApp->unk_110;
            mapApp->unk_13B |= 8;
            r4 = 1;
        }
    }
    if (r4) {
        mapApp->unk_13A = 2;
        mapApp->unk_139_0 = 1;
        mapApp->unk_139_2 = 1;
        mapApp->unk_114 = r1->unk_04;
        return TRUE;
    }
    return FALSE;
}

int ov101_021EB784(PokegearMapAppData *mapApp, int a1) {
    u16 sp6;
    u16 sp4;

    if (a1 < 0) {
        return -1;
    }
    mapApp->pokegear->appReturnCode = GEAR_RETURN_5;
    mapApp->pokegear->args->unk_20 = a1;
    mapApp->pokegear->args->mapCursorX = mapApp->unk_110;
    mapApp->pokegear->args->mapCursorY = mapApp->unk_112 - 2;
    if (mapApp->pokegear->menuInputState == MENU_INPUT_STATE_TOUCH) {
        ov101_021E9464(mapApp, gSystem.touchX, gSystem.touchY, &sp6, &sp4);
    } else {
        ov101_021E9464(mapApp, mapApp->unk_084->unk_08[5].unk_04.x, mapApp->unk_084->unk_08[5].unk_04.y, &sp6, &sp4);
    }
    ov101_021EB4C4(mapApp, mapApp->unk_118.unk_0->unk_0);
    ov101_021EB428(mapApp, sp6);
    return 8;
}

int ov101_021EB818(PokegearMapAppData *mapApp) {
    u32 r1 = gSystem.newKeys;
    if (gSystem.heldKeys == 0 || mapApp->unk_139_0 || mapApp->unk_139_1 || mapApp->unk_139_2) {
        return -1;
    }
    if (r1 & PAD_BUTTON_X) {
        mapApp->unk_138_0 ^= 1;
        mapApp->unk_13A = 4;
        ov101_021EC49C(mapApp, mapApp->unk_110, mapApp->unk_112, &mapApp->unk_0C8.unk_10, &mapApp->unk_0C8.unk_14);
        mapApp->unk_139_0 = 1;
        mapApp->unk_139_1 = 1;
        ov101_021EB38C(mapApp, TRUE, mapApp->unk_138_0);
        if (mapApp->unk_138_0 == 1) {
            PlaySE(SEQ_SE_GS_GEARXBUTTON);
        } else {
            PlaySE(SEQ_SE_GS_XBUTTON_SYUKUSHOU);
        }
        return -1;
    }
    if (r1 & PAD_BUTTON_Y) {
        if (!ov101_021EA6C4(mapApp, &mapApp->unk_118)) {
            return -1;
        }
        ov101_021EB38C(mapApp, FALSE, 1);
        PlaySE(SEQ_SE_GS_GEARDECIDE);
        return 7;
    }
    if (ov101_021EB654(mapApp)) {
        ov101_021EA794(mapApp, &mapApp->unk_118, mapApp->unk_110, mapApp->unk_112);
        ov101_021EAD90(mapApp, 0);
        ov101_021EB1E0(mapApp, 1);
    }
    return -1;
}

int ov101_021EB94C(PokegearMapAppData *mapApp) {
    u32 r1 = gSystem.newKeys;
    int r5;

    if (gSystem.heldKeys == 0 || mapApp->unk_139_0 || mapApp->unk_139_2) {
        return -1;
    }
    if (r1 & PAD_BUTTON_A) {
        if (mapApp->unk_00D == 1) {
            r5 = ov101_021EA874(mapApp, mapApp->unk_110, mapApp->unk_112 - 2);
            if (r5 > 0) {
                PlaySE(SEQ_SE_GS_GEARDECIDE);
                return ov101_021EB784(mapApp, r5);
            } else {
                return -1;
            }
        }
    }
    if (r1 & PAD_BUTTON_B) {
        PlaySE(SEQ_SE_GS_GEARCANCEL);
        return 4;
    }
    if (!ov101_021EB654(mapApp)) {
        return -1;
    }
    if (mapApp->unk_00D == 2) {
        ov101_021EA794(mapApp, &mapApp->unk_118, mapApp->unk_110, mapApp->unk_112);
        ov101_021EAD90(mapApp, 1);
        ov101_021EB1E0(mapApp, 1);
    } else {
        ov101_021EA8A8(mapApp, &mapApp->unk_118, mapApp->unk_110, mapApp->unk_112);
        ov101_021EAD90(mapApp, 0);
        ov101_021EB1E0(mapApp, 1);
    }
    return -1;
}

int ov101_021EBA44(PokegearMapAppData *mapApp, BOOL *pRetIsTouch) {
    u16 sp4;
    int r6;

    if (!System_GetTouchHeld()) {
        return -1;
    }
    if (mapApp->unk_139_0 || mapApp->unk_139_1) {
        return -1;
    }
    r6 = TouchscreenHitbox_FindRectAtTouchNew(ov101_021F7EAC);
    if (r6 != TOUCH_MENU_NO_INPUT) {
        *pRetIsTouch = TRUE;
        ov101_021E94C0(mapApp);
        if (r6 == 0) {
            if (!ov101_021EA6C4(mapApp, &mapApp->unk_118)) {
                return -1;
            }
            ov101_021EB38C(mapApp, FALSE, 1);
            PlaySE(SEQ_SE_GS_GEARDECIDE);
            return 7;
        } else {
            mapApp->unk_138_0 ^= 1;
            mapApp->unk_13A = 4;
            ov101_021EC49C(mapApp, mapApp->unk_110, mapApp->unk_112, &mapApp->unk_0C8.unk_10, &mapApp->unk_0C8.unk_14);
            mapApp->unk_139_0 = 1;
            mapApp->unk_139_1 = 1;
            ov101_021EB38C(mapApp, TRUE, mapApp->unk_138_0);
            if (mapApp->unk_138_0 == 1) {
                PlaySE(SEQ_SE_GS_GEARXBUTTON);
            } else {
                PlaySE(SEQ_SE_GS_XBUTTON_SYUKUSHOU);
            }
            return -1;
        }
    }
    if (!TouchscreenHitbox_TouchNewIsIn(&ov101_021F7EA4[0])) {
        return -1;
    }
    sp4 = 1;
    if (!DoesPixelAtScreenXYMatchPtrVal(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_1, gSystem.touchX, gSystem.touchY, &sp4)) {
        return -1;
    }
    PlaySE(SEQ_SE_GS_GEARMAPTOUCH);
    ov101_021EC980(mapApp, &mapApp->unk_110, &mapApp->unk_112);
    ov101_021EA794(mapApp, &mapApp->unk_118, mapApp->unk_110, mapApp->unk_112);
    ov101_021EAD90(mapApp, 0);
    ov101_021EB1E0(mapApp, 1);
    mapApp->unk_146 = mapApp->unk_142 = gSystem.touchX;
    mapApp->unk_148 = mapApp->unk_144 = gSystem.touchY;
    ov101_021EBDEC(mapApp);
    mapApp->unk_139_3 = 1;
    *pRetIsTouch = TRUE;
    return -1;
}

int ov101_021EBC1C(PokegearMapAppData *mapApp, BOOL *pRetIsTouch) {
    u16 sp1C;
    int r4;
    int r0;

    if (!System_GetTouchHeld()) {
        return -1;
    }
    if (mapApp->unk_139_0) {
        return -1;
    }
    r0 = TouchscreenHitbox_FindRectAtTouchNew(ov101_021F7E94);
    if (r0 != -1) {
        CopyToBgTilemapRect(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_1, 24, 20, 8, 4, mapApp->unk_178->rawData, 0, 24, mapApp->unk_178->screenWidth / 8, mapApp->unk_178->screenHeight / 8);
        ScheduleBgTilemapBufferTransfer(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_1);
        ov101_021E94C0(mapApp);
        PlaySE(SEQ_SE_GS_GEARCANCEL);
        *pRetIsTouch = TRUE;
        return 4;
    }
    if (!TouchscreenHitbox_TouchNewIsIn(&ov101_021F7EA4[1])) {
        return -1;
    }
    sp1C = 1;
    if (!DoesPixelAtScreenXYMatchPtrVal(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_1, gSystem.touchX, gSystem.touchY, &sp1C)) {
        return -1;
    }
    PlaySE(SEQ_SE_GS_GEARMAPTOUCH);
    *pRetIsTouch = TRUE;
    if (mapApp->unk_00D == 2) {
        ov101_021EC980(mapApp, &mapApp->unk_110, &mapApp->unk_112);
        ov101_021EA794(mapApp, &mapApp->unk_118, mapApp->unk_110, mapApp->unk_112);
        ov101_021EAD90(mapApp, 1);
        ov101_021EB1E0(mapApp, 1);
    } else {
        ov101_021EC980(mapApp, &mapApp->unk_110, &mapApp->unk_112);
        ov101_021EA8A8(mapApp, &mapApp->unk_118, mapApp->unk_110, mapApp->unk_112);
        ov101_021EAD90(mapApp, 0);
        ov101_021EB1E0(mapApp, 1);
        r4 = ov101_021EA874(mapApp, mapApp->unk_110, mapApp->unk_112 - 2);
        if (r4 > 0) {
            PlaySE(SEQ_SE_GS_GEARDECIDE);
            return ov101_021EB784(mapApp, r4);
        }
    }
    mapApp->unk_146 = mapApp->unk_142 = gSystem.touchX;
    mapApp->unk_148 = mapApp->unk_144 = gSystem.touchY;
    ov101_021EBDEC(mapApp);
    mapApp->unk_139_3 = 1;
    return -1;
}
