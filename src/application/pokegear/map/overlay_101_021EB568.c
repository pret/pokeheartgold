#include "global.h"

#include "application/pokegear/map/pokegear_map_internal.h"

#include "unk_02005D10.h"

BOOL ov101_021EB654(PokegearMapAppData *mapApp);
int ov101_021EB784(PokegearMapAppData *mapApp, int a1);
int ov101_021EB818(PokegearMapAppData *mapApp);
int ov101_021EB94C(PokegearMapAppData *mapApp);
BOOL ov101_021EA6C4(PokegearMapAppData *mapApp, PokegearMapAppData_Sub118 *a1);
int ov101_021EBA44(PokegearMapAppData *mapApp, BOOL *pRetIsTouch);
BOOL ov101_021EBDEC(PokegearMapAppData *mapApp);
s16 ov101_021EBF44(PokegearMapAppData *mapApp, s16 a1);
s16 ov101_021EBF98(PokegearMapAppData *mapApp, s16 a1, s16 a2);
s16 ov101_021EBFF8(PokegearMapAppData *mapApp, s16 a1);
s16 ov101_021EC04C(PokegearMapAppData *mapApp, s16 a1, s16 a2);
int ov101_021EC0AC(PokegearMapAppData *mapApp);
int ov101_021EBC1C(PokegearMapAppData *mapApp, BOOL *pRetIsTouch);
void ov101_021EC49C(PokegearMapAppData *mapApp, u16 a1, u16 a2, int *a3, int *a4);
void ov101_021EC304(PokegearMapAppData *mapApp);
void ov101_021EC778(PokegearMapAppData *mapApp);
void ov101_021EC920(UnkStruct_ov100_021E6E20_Sub8 *a0, u16 a1, s16 a2);
void ov101_021EC944(PokegearMapAppData *mapApp);
void ov101_021EC980(PokegearMapAppData *mapApp, s16 *a1, s16 *a2);
BOOL ov101_021ECA30(PokegearMapAppData *mapApp, u8 a1);
void ov101_021ECA84(PokegearMapAppData *mapApp, BOOL a1);
void ov101_021ECE58(PokegearMapAppData *mapApp);

extern const u8 ov101_021F7E8C[][2];
extern const u8 ov101_021F7E9C[][4];
extern const TouchscreenHitbox ov101_021F7E94[2];
extern const TouchscreenHitbox ov101_021F7EA4[2];
extern const TouchscreenHitbox ov101_021F7EAC[];
extern const TouchscreenHitbox ov101_021F7EF4[];

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

BOOL ov101_021EBDEC(PokegearMapAppData *mapApp) {
    s16 sp0;
    s16 r7;
    s16 r0;
    s16 r0_2;
    s16 sp14;
    s16 sp10;
    u8 r5;
    u8 r6;
    u8 spC;
    u8 sp8;
    s16 sp18;
    s16 sp4;
    s16 r3;
    s16 r12;
    s16 r6_2;
    s16 r6_3;
    s16 r6_4;
    s16 r6_5;

    if (mapApp->unk_138_0) {
        spC = 12;
        sp8 = 8;
    } else {
        spC = 24;
        sp8 = 17;
    }
    r5 = (8 * (1 + mapApp->unk_138_0));
    r6 = r5 / 2;

    sp0 = gSystem.touchX - mapApp->unk_132;
    r7 = gSystem.touchY - mapApp->unk_131;

    sp14 = (sp0 % r5) - r6;
    sp10 = (r7 % r5) - r6;

    r0 = sp0 / r5;
    r0_2 = r7 / r5;

    sp18 = mapApp->unk_112 - r0_2;
    sp4 = mapApp->unk_112 + (sp8 - 1 - r0_2);
    r12 = mapApp->unk_110 - r0;
    r3 = mapApp->unk_110 + (spC - 1 - r0);

    if (sp18 < mapApp->unk_104) {
        sp18 = mapApp->unk_104;
    }
    if (r12 < mapApp->unk_100) {
        r12 = mapApp->unk_100;
    }
    if (sp4 > mapApp->unk_106) {
        sp4 = mapApp->unk_106;
    }
    if (r3 > mapApp->unk_102) {
        r3 = mapApp->unk_102;
    }

    r6_2 = (mapApp->unk_112 - sp18) * r5 + sp10;
    r6_5 = (mapApp->unk_110 - r12) * r5 + sp14;
    r6_3 = (sp4 - mapApp->unk_112) * r5 + sp10;
    r6_4 = (r3 - mapApp->unk_110) * r5 + sp14;

    mapApp->unk_14A = r6_2;
    mapApp->unk_14C = r6_3;
    mapApp->unk_14E = r6_5;
    mapApp->unk_150 = r6_4;
    return FALSE;
}

s16 ov101_021EBF44(PokegearMapAppData *mapApp, s16 a1) {
    s16 r4;
    s16 r2;
    s16 ret;

    r2 = mapApp->unk_0C8.unk_2C - a1 + 1;
    r4 = mapApp->unk_0C8.unk_2E - a1 - 1;
    if (mapApp->unk_110 >= r2 && r4 >= mapApp->unk_110) {
        return a1;
    }
    if (mapApp->unk_110 <= r2) {
        ret = a1 + (r2 - mapApp->unk_110);
    } else if (mapApp->unk_110 >= r4) {
        // Your language server may flag ret as being conditionally uninitalized.
        // This is technically not UB since logically
        // this block here is the only other possibility.
        ret = a1 - (mapApp->unk_110 - r4);
    }
    return ret;
}

s16 ov101_021EBF98(PokegearMapAppData *mapApp, s16 a1, s16 a2) {
    s16 r3;

    if (a1 > 0) {
        r3 = mapApp->unk_0C8.unk_2C - mapApp->unk_100;
        if (r3 <= 0) {
            return 0;
        } else if (r3 < a2) {
            return ov101_021EBF44(mapApp, r3);
        }
    } else {
        r3 = mapApp->unk_102 - mapApp->unk_0C8.unk_2E;
        if (r3 <= 0) {
            return 0;
        } else if (r3 < a2) {
            return ov101_021EBF44(mapApp, -r3);
        }
    }
    return ov101_021EBF44(mapApp, a1);
}

s16 ov101_021EBFF8(PokegearMapAppData *mapApp, s16 a1) {
    s16 ret;
    s16 r3;
    s16 r4;

    r3 = mapApp->unk_0C8.unk_28 - a1 + 1;
    r4 = mapApp->unk_0C8.unk_2A - a1;
    if (mapApp->unk_112 >= r3 && r4 >= mapApp->unk_112) {
        return a1;
    }
    if (mapApp->unk_112 <= r3) {
        ret = a1 + (r3 - mapApp->unk_112);
    } else if (mapApp->unk_112 >= r4) {
        // Your language server may flag ret as being conditionally uninitalized.
        // This is technically not UB since logically
        // this block here is the only other possibility.
        ret = a1 - (mapApp->unk_112 - r4);
    }
    return ret;
}

s16 ov101_021EC04C(PokegearMapAppData *mapApp, s16 a1, s16 a2) {
    s16 r3;

    if (a1 > 0) {
        r3 = mapApp->unk_0C8.unk_28 - mapApp->unk_104;
        if (r3 <= 0) {
            return 0;
        } else if (r3 < a2) {
            return ov101_021EBFF8(mapApp, r3);
        }
    } else {
        r3 = mapApp->unk_106 - mapApp->unk_0C8.unk_2A;
        if (r3 <= 0) {
            return 0;
        } else if (r3 < a2) {
            return ov101_021EBFF8(mapApp, -r3);
        }
    }
    return ov101_021EBFF8(mapApp, a1);
}

int ov101_021EC0AC(PokegearMapAppData *mapApp) {
    s16 sp8;
    s16 sp0;
    s16 spC;
    s16 sp4;
    s16 r6;
    s16 r4;
    s16 sp1C;
    s16 sp18;
    s16 sp10;
    s16 sp14;

    sp8 = gSystem.touchX;
    sp0 = gSystem.touchY;
    sp14 = (mapApp->unk_138_0 * 8 + 8) / 2;

    if (mapApp->unk_138_0) {
        sp10 = 9;
    } else {
        sp10 = 5;
    }
    if (mapApp->unk_13A != 0) {
        mapApp->unk_0C8.unk_00 -= mapApp->unk_13E;
        mapApp->unk_0C8.unk_04 -= mapApp->unk_140;
        ov101_021E9BF4(mapApp, mapApp->unk_13E, mapApp->unk_140);
        ov100_021E6E84(mapApp->unk_084);
        mapApp->unk_138_7 = 1;
        mapApp->unk_13A = 0;
        return -1;
    }
    if (!System_GetTouchHeld()) {
        mapApp->unk_139_3 = 0;
        return -1;
    }

    spC = r6 = sp8 - mapApp->unk_142;
    sp4 = r4 = sp0 - mapApp->unk_144;
    if (r6 < 0) {
        r6 *= -1;
    }
    if (r4 < 0) {
        r4 *= -1;
    }
    r6 /= sp10;
    r4 /= sp10;
    sp1C = spC % sp10;
    sp18 = sp4 % sp10;
    if (r6 < 1 && r4 < 1) {
        return -1;
    }
    mapApp->unk_13E = mapApp->unk_140 = 0;
    if (r6 > 0) {
        spC = ov101_021EBF98(mapApp, spC / sp10, r6);
        if (spC != 0) {
            mapApp->unk_0C8.unk_00 -= spC * sp14;
            mapApp->unk_0C8.unk_2E -= spC;
            mapApp->unk_0C8.unk_2C -= spC;
            mapApp->unk_142 = sp8 - sp1C;
            mapApp->unk_13A = 1;
            mapApp->unk_13E = spC * sp14;
        }
    } else {
        spC = 0;
    }
    if (r4 > 0) {
        sp4 = ov101_021EC04C(mapApp, sp4 / sp10, r4);
        if (sp4 != 0) {
            mapApp->unk_0C8.unk_04 -= sp4 * sp14;
            mapApp->unk_0C8.unk_2A -= sp4;
            mapApp->unk_0C8.unk_28 -= sp4;
            mapApp->unk_144 = sp0 - sp18;
            mapApp->unk_13A = 1;
            mapApp->unk_140 = sp4 * sp14;
        }
    } else {
        sp4 = 0;
    }
    if (spC != 0 || sp4 != 0) {
        ov101_021E9BF4(mapApp, spC * sp14, sp4 * sp14);
        ov101_021EC944(mapApp);
        ov100_021E6E84(mapApp->unk_084);
        mapApp->unk_138_7 = 1;
    }
    return -1;
}

void ov101_021EC304(PokegearMapAppData *mapApp) {
    u8 sp8 = 0;
    s16 sp4 = 0;
    s16 r7 = 0;
    s16 r6 = 0;
    u16 spE;
    u16 spC;
    UnkStruct_ov100_021E6E20_Sub8 *r4 = &mapApp->unk_084->unk_08[5];

    if (!mapApp->unk_139_2) {
        return;
    }
    if (mapApp->unk_138_0) {
        r6 = 8;
    } else {
        r6 = 4;
    }
    ov101_021E9464(mapApp, mapApp->unk_114.x, mapApp->unk_114.y, &spE, &spC);
    if (mapApp->unk_13B & 1) {
        if (spC <= 1) {
            r7 -= r6;
            sp8 = 1;
        } else {
            r4->unk_04.y -= r6;
        }
    } else if (mapApp->unk_13B & 2) {
        if (spC >= ov101_021F7E8C[1][mapApp->unk_138_0]) {
            r7 += r6;
            sp8 = 1;
        } else {
            r4->unk_04.y += r6;
        }
    }
    if (mapApp->unk_13B & 4) {
        if (spE <= 1) {
            sp4 -= r6;
            sp8 = 1;
        } else {
            r4->unk_04.x -= r6;
        }
    } else if (mapApp->unk_13B & 8) {
        if (spE >= ov101_021F7E8C[0][mapApp->unk_138_0]) {
            sp4 += r6;
            sp8 = 1;
        } else {
            r4->unk_04.x += r6;
        }
    }
    if (sp8 != 0) {
        mapApp->unk_138_7 = 1;
        mapApp->unk_0C8.unk_00 += sp4;
        mapApp->unk_0C8.unk_04 += r7;
        ov101_021E9BF4(mapApp, -sp4, -r7);
        ov101_021EC944(mapApp);
    }
    ov100_021E6E84(mapApp->unk_084);
    if (--mapApp->unk_13A == 0) {
        ov101_021E9288(mapApp);
        mapApp->unk_139_0 = 0;
        mapApp->unk_139_2 = 0;
        mapApp->unk_13B = 0;
    }
}

void ov101_021EC49C(PokegearMapAppData *mapApp, u16 a1, u16 a2, int *a3, int *a4) {
    u16 i;
    u8 r1 = 0, r0 = 0, r7, r5;
    UnkStruct_ov100_021E6E20_Sub8 *r4 = &mapApp->unk_084->unk_08[5];
    UnkStruct_ov100_021E6E20_Sub8 *sp1C = mapApp->unk_084->unk_08;
    r7 = 8 * (mapApp->unk_138_0 + 1);
    r5 = r7 / 2;
    ov101_021E9530(mapApp, mapApp->unk_138_0, mapApp->unk_110, mapApp->unk_112, r4->unk_04.x, r4->unk_04.y);
    if (!mapApp->unk_138_0) {
        r1 = (r4->unk_04.x - mapApp->unk_132) / 16;
        r0 = (r4->unk_04.y - mapApp->unk_131) / 16;
        if (r1 <= 5) {
            *a3 = a1 * 8 + 8;
        } else {
            *a3 = a1 * 8;
        }
        if (r0 > 4) {
            *a4 = a2 * 8 + 8;
        } else {
            *a4 = a2 * 8;
        }
    } else {
        r1 = ((r4->unk_04.x - mapApp->unk_132) / 8) % 2;
        r0 = ((r4->unk_04.y - mapApp->unk_131) / 8) % 2;
        *a3 = a1 * 8 + r1 * 8;
        *a4 = a2 * 8 + r0 * 8;
    }
    r4->unk_08 = (a1 - mapApp->unk_0C8.unk_2C) * r7 + mapApp->unk_132 + r5;
    r4->unk_0A = (a2 - mapApp->unk_0C8.unk_28) * r7 + mapApp->unk_131 + r5;
    sp1C[6].unk_08 = (sp1C[6].unk_0C - mapApp->unk_0C8.unk_2C) * r7 + mapApp->unk_132 + r5;
    sp1C[6].unk_0A = (sp1C[6].unk_0E - mapApp->unk_0C8.unk_28) * r7 + mapApp->unk_131 + r5;
    ov101_021EA238(mapApp, 1);
    for (i = 5; i < mapApp->unk_084->num; ++i) {
        sp1C[i].unk_18 = FX_Div(FX32_CONST(sp1C[i].unk_08 - sp1C[i].unk_04.x), FX32_CONST(mapApp->unk_13A));
        sp1C[i].unk_1C = FX_Div(FX32_CONST(sp1C[i].unk_0A - sp1C[i].unk_04.y), FX32_CONST(mapApp->unk_13A));
        UnkStruct_ov100_021E6E20_Sub8_inline_setFixCoords(&sp1C[i], sp1C[i].unk_04.x, sp1C[i].unk_04.y);
    }
}

void ov101_021EC778(PokegearMapAppData *mapApp) {
    u16 i;
    VecFx32 sp0;
    UnkStruct_ov100_021E6E20_Sub8 *r0 = &mapApp->unk_084->unk_08[5];
    UnkStruct_ov100_021E6E20_Sub8 *r6 = mapApp->unk_084->unk_08;
    s16 r1;
    s16 r2;

    if (!mapApp->unk_139_1) {
        return;
    }
    if (mapApp->unk_138_0) {
        mapApp->unk_0C8.unk_08 += FX32_CONST(0.25);
        mapApp->unk_0C8.unk_0C += FX32_CONST(0.25);
    } else {
        mapApp->unk_0C8.unk_08 -= FX32_CONST(0.25);
        mapApp->unk_0C8.unk_0C -= FX32_CONST(0.25);
    }
    sp0.x = mapApp->unk_0C8.unk_08;
    sp0.z = FX32_ONE;
    sp0.y = mapApp->unk_0C8.unk_0C;
    Sprite_SetAffineScale(r0->sprite, &sp0);
    if (--mapApp->unk_13A == 0) {
        mapApp->unk_0C8.unk_00 = mapApp->unk_0C8.unk_34;
        mapApp->unk_0C8.unk_04 = mapApp->unk_0C8.unk_36;
        for (i = 5; i < mapApp->unk_084->num; ++i) {
            UnkStruct_ov100_021E6E20_Sub8_inline_setCoord(&r6[i], r6[i].unk_08, r6[i].unk_0A);
            ov101_021EC920(&r6[i], i, r6[i].unk_0A);
        }
        mapApp->unk_139_0 = 0;
        mapApp->unk_139_1 = 0;
        mapApp->unk_13B = 0;
    } else {
        mapApp->unk_0C8.unk_20 += mapApp->unk_0C8.unk_18;
        mapApp->unk_0C8.unk_24 += mapApp->unk_0C8.unk_1C;
        mapApp->unk_0C8.unk_00 = FX_Whole(mapApp->unk_0C8.unk_20);
        mapApp->unk_0C8.unk_04 = FX_Whole(mapApp->unk_0C8.unk_24);
        for (i = 5; i < mapApp->unk_084->num; ++i) {
            r6[i].unk_10 += r6[i].unk_18;
            r6[i].unk_14 += r6[i].unk_1C;
            r1 = FX_Whole(r6[i].unk_10);
            r2 = FX_Whole(r6[i].unk_14);
            UnkStruct_ov100_021E6E20_Sub8_inline_setCoord(&r6[i], r1, r2);
            ov101_021EC920(&r6[i], i, r2);
        }
    }
    ov100_021E6E84(mapApp->unk_084);
    mapApp->unk_138_7 = 1;
}

void ov101_021EC920(UnkStruct_ov100_021E6E20_Sub8 *a0, u16 a1, s16 a2) {
    if (!a0->unk_01) {
        return;
    }
    if (a2 > 216 || a2 < 0) {
        Sprite_SetDrawFlag(a0->sprite, FALSE);
    } else {
        Sprite_SetDrawFlag(a0->sprite, TRUE);
    }
}

void ov101_021EC944(PokegearMapAppData *mapApp) {
    u16 i;
    UnkStruct_ov100_021E6E20_Sub8 *r5 = mapApp->unk_084->unk_08;

    if (mapApp->unk_00D) {
        return;
    }
    for (i = 5; i < mapApp->unk_084->num; ++i) {
        ov101_021EC920(&r5[i], i, r5[i].unk_04.y);
    }
}

void ov101_021EC980(PokegearMapAppData *mapApp, s16 *a1, s16 *a2) {
    s16 r7;
    s16 r4;
    const u8 *r6 = ov101_021F7E9C[mapApp->unk_138_0];

    r7 = gSystem.touchX - mapApp->unk_132;
    r4 = gSystem.touchY - mapApp->unk_131;
    r7 /= ((mapApp->unk_138_0 + 1) * 8);
    r4 /= ((mapApp->unk_138_0 + 1) * 8);
    if (r4 < r6[0]) {
        r4 = r6[0];
    }
    if (r4 > r6[1]) {
        r4 = r6[1];
    }
    if (r7 < r6[2]) {
        r7 = r6[2];
    }
    if (r7 > r6[3]) {
        r7 = r6[3];
    }
    r7 += mapApp->unk_0C8.unk_2C;
    r4 += mapApp->unk_0C8.unk_28;
    if (a1 != NULL) {
        *a1 = r7;
    }
    if (a2 != NULL) {
        *a2 = r4;
    }
    ov101_021E94C0(mapApp);
}

BOOL ov101_021ECA30(PokegearMapAppData *mapApp, u8 a1) {
    UnkStruct_0202F3DC *r0;
    if (mapApp->unk_118.unk_4 == NULL || a1 >= 8) {
        return FALSE;
    }

    r0 = &mapApp->unk_118.unk_4->unk_00;
    if (a1 % 2 == 0) {
        if (r0->unk_4[a1 / 2] != 15) {
            return TRUE;
        }
    } else {
        if (r0->unk_8[a1 / 2] != EC_WORD_NULL) {
            return TRUE;
        }
    }

    return FALSE;
}

void ov101_021ECA84(PokegearMapAppData *mapApp, BOOL a1) {
    mapApp->unk_13C_7 = a1;
    CopyToBgTilemapRect(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_2, 5, 8, 8, 5, mapApp->unk_17C->rawData, 8 * mapApp->unk_13C_7 + 14, 16, mapApp->unk_17C->screenWidth / 8, mapApp->unk_17C->screenHeight / 8);
    ScheduleBgTilemapBufferTransfer(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_2);
}

int ov101_021ECAF0(PokegearMapAppData *mapApp) {
    u8 r5;

    if (gSystem.newKeys & PAD_BUTTON_B) {
        PlaySE(SEQ_SE_GS_GEARCANCEL);
        PokegearAppSwitchCursor_SetCursorSpritesDrawState(mapApp->pokegear->appSwitch, 0xFFFF, FALSE);
        return 10;
    }
    if (gSystem.newKeys & PAD_BUTTON_A) {
        r5 = PokegearAppSwitch_GetCursorPos(mapApp->pokegear->appSwitch);
        PlaySE(SEQ_SE_GS_GEARDECIDE);
        if (r5 == 8) {
            PokegearAppSwitchCursor_SetCursorSpritesDrawState(mapApp->pokegear->appSwitch, 0xFFFF, FALSE);
            return 10;
        }
        if (ov101_021ECA30(mapApp, r5)) {
            PokegearAppSwitch_SetCursorSpritesAnimateFlag(mapApp->pokegear->appSwitch, 0xFFFF, FALSE);
            PokegearAppSwitch_SetSpecIndexAndCursorPos(mapApp->pokegear->appSwitch, 3, 0);
            PokegearAppSwitchCursor_SetCursorSpritesDrawState(mapApp->pokegear->appSwitch, 0xFFFF, TRUE);
            ov101_021ECA84(mapApp, TRUE);
            mapApp->unk_13C_0 = 2;
            return -1;
        } else {
            if (r5 % 2 == 0) {
                PokegearAppSwitch_SetCursorSpritesAnimateFlag(mapApp->pokegear->appSwitch, 0xFFFF, FALSE);
                PokegearAppSwitch_SetSpecIndexAndCursorPos(mapApp->pokegear->appSwitch, 2, 0);
                PokegearAppSwitchCursor_SetCursorSpritesDrawState(mapApp->pokegear->appSwitch, 0xFFFF, TRUE);
                mapApp->unk_13C_0 = 1;
                return -1;
            } else {
                mapApp->unk_014.unk_02 = r5 / 2;
                mapApp->unk_014.unk_18 = mapApp->unk_118.unk_0->unk_0;
                return 11;
            }
        }
    }
    if (gSystem.newKeys & PAD_KEY_LEFT) {
        PlaySE(SEQ_SE_GS_GEARCURSOR);
        ov100_021E73AC(mapApp->pokegear->appSwitch, 0);
    } else if (gSystem.newKeys & PAD_KEY_RIGHT) {
        PlaySE(SEQ_SE_GS_GEARCURSOR);
        ov100_021E73AC(mapApp->pokegear->appSwitch, 1);
    } else if (gSystem.newKeys & PAD_KEY_UP) {
        PlaySE(SEQ_SE_GS_GEARCURSOR);
        ov100_021E73AC(mapApp->pokegear->appSwitch, 2);
    } else if (gSystem.newKeys & PAD_KEY_DOWN) {
        PlaySE(SEQ_SE_GS_GEARCURSOR);
        ov100_021E73AC(mapApp->pokegear->appSwitch, 3);
    }
    return -1;
}

int ov101_021ECC58(PokegearMapAppData *mapApp, BOOL *a1) {
    int r4;
    u16 r6;
    UnkStruct_ov100_021E6E20_Sub8 *r7 = mapApp->unk_084->unk_08;

    if (!System_GetTouchHeld()) {
        return -1;
    }

    if (mapApp->unk_139_0) {
        return -1;
    }

    r4 = TouchscreenHitbox_FindRectAtTouchNew(ov101_021F7EF4);
    if (r4 != -1) {
        *a1 = TRUE;
        if (r4 == 16) {
            CopyToBgTilemapRect(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_2, 23, 8, 6, 5, mapApp->unk_17C->rawData, 7, 16, mapApp->unk_17C->screenWidth / 8, mapApp->unk_17C->screenHeight / 8);
            ScheduleBgTilemapBufferTransfer(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_2);
            PlaySE(SEQ_SE_GS_GEARCANCEL);
            return 10;
        } else if (r4 >= 8) {
            mapApp->unk_139_4 = r4 - 8;
            mapApp->unk_13C_0 = 1;
            thunk_Sprite_SetDrawPriority(r7[r4 + 20].sprite, 1);
            PlaySE(SEQ_SE_GS_GEARSEALGRAB);
            return -1;
        } else if (ov101_021ECA30(mapApp, r4)) {
            r6 = r4 / 2;
            if (r4 % 2 == 0) {
                mapApp->unk_139_4 = r6;
                mapApp->unk_13E = mapApp->unk_140 = 0;
                thunk_Sprite_SetDrawPriority(r7[r6 + 20].sprite, 1);
            } else {
                mapApp->unk_139_4 = r6 + 4;
                mapApp->unk_13E = ((r6 % 2) * 0x68 + 0x28) - gSystem.touchX;
                mapApp->unk_140 = ((r6 / 2) * 0x15 + 0x1F) - gSystem.touchY;
                thunk_Sprite_SetDrawPriority(r7[r6 + 24].sprite, 1);
                sub_02013820(mapApp->unk_044[r6].unk_0, 0);
            }
            mapApp->unk_13C_0 = 2;
            PlaySE(SEQ_SE_GS_GEARSEALGRAB);
            return -1;
        } else if (r4 % 2 == 1) {
            mapApp->unk_014.unk_02 = r4 / 2;
            mapApp->unk_014.unk_18 = mapApp->unk_118.unk_0->unk_0;
            PlaySE(SEQ_SE_GS_GEARDECIDE);
            return 11;
        } else {
            return -1;
        }
    }

    return -1;
}

void ov101_021ECE58(PokegearMapAppData *mapApp) {
    ov100_021E73C8(mapApp->pokegear->appSwitch, 0);
    PokegearAppSwitchCursor_SetCursorSpritesDrawState(mapApp->pokegear->appSwitch, 0xFFFF, FALSE);
    PokegearAppSwitch_SetSpecIndexAndCursorPos(mapApp->pokegear->appSwitch, 1, PokegearAppSwitch_GetSpecCursorPos(mapApp->pokegear->appSwitch, 1));
    PokegearAppSwitch_SetCursorSpritesAnimateFlag(mapApp->pokegear->appSwitch, 0xFFFF, TRUE);
    mapApp->unk_13C_0 = 0;
}

int ov101_021ECEA8(PokegearMapAppData *mapApp) {
    u8 r6;
    u8 r4;

    if (gSystem.newKeys & PAD_BUTTON_A) {
        PlaySE(SEQ_SE_GS_GEARDECIDE);
        r6 = PokegearAppSwitch_GetCursorPos(mapApp->pokegear->appSwitch);
        r4 = PokegearAppSwitch_GetSpecCursorPos(mapApp->pokegear->appSwitch, 1);
        if (mapApp->unk_118.unk_4 == NULL) {
            mapApp->unk_118.unk_4 = ov101_021ED64C(mapApp, mapApp->unk_118.unk_0->unk_0);
        }
        ov101_021ED750(mapApp->unk_118.unk_4, r4 / 2, r6);
        ov101_021EAE54(mapApp, 0);
    }
    if (gSystem.newKeys & PAD_BUTTON_B) {
        PlaySE(SEQ_SE_GS_GEARCANCEL);
        ov101_021ECE58(mapApp);
        return -1;
    }
    if (System_GetTouchNew()) {
        PlaySE(SEQ_SE_GS_GEARCANCEL);
        ov101_021ECE58(mapApp);
        if (mapApp->pokegear->menuInputState != MENU_INPUT_STATE_TOUCH) {
            ov101_021EB364(mapApp);
            mapApp->pokegear->menuInputState = MENU_INPUT_STATE_TOUCH;
        }
        return -1;
    }
    if (gSystem.newKeys & PAD_KEY_LEFT) {
        PlaySE(SEQ_SE_GS_GEARCURSOR);
        ov100_021E73AC(mapApp->pokegear->appSwitch, 0);
    } else if (gSystem.newKeys & PAD_KEY_RIGHT) {
        PlaySE(SEQ_SE_GS_GEARCURSOR);
        ov100_021E73AC(mapApp->pokegear->appSwitch, 1);
    }
    return -1;
}
