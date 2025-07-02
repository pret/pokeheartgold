#include "global.h"

#include "constants/items.h"
#include "constants/maps.h"

#include "application/pokegear/map/pokegear_map_internal.h"

#include "sys_flags.h"
#include "text.h"
#include "touchscreen_list_menu.h"
#include "unk_02068F84.h"
#include "unk_020932A4.h"

void ov101_021E9288(PokegearMapAppData *mapApp);
void ov101_021E93D0(PokegearMapAppData *mapApp);
void ov101_021E9464(PokegearMapAppData *mapApp, s16 a1, s16 a2, u16 *a3, u16 *a4);
void ov101_021E94C0(PokegearMapAppData *mapApp);
void ov101_021E9530(PokegearMapAppData *mapApp, u8 a1, u16 a2, u16 a3, s16 a4, s16 a5);
void ov101_021E9848(PokegearMapAppData *mapApp, u16 a1, u16 a2, s16 a3, s16 a4, int *a5, int *a6);
void ov101_021E990C(PokegearMapAppData *mapApp);
void ov101_021E9BF4(PokegearMapAppData *mapApp, s16 a1, s16 a2);
BOOL ov101_021EA664(PokegearMapAppData *mapApp, int a1);
BOOL ov101_021EA6C4(PokegearMapAppData *mapApp, PokegearMapAppData_Sub118 *a1);
int ov101_021EA81C(PokegearMapAppData *mapApp, u16 a1, u16 a2);
BOOL ov101_021EA990(PokegearMapAppData *mapApp, int a1);
void ov101_021EAA0C(PokegearMapAppData *mapApp, BOOL a1, BOOL a2);
void ov101_021EADC0(PokegearMapAppData *mapApp, u8 a1, u16 a2);
void ov101_021EB428(PokegearMapAppData *mapApp, u32 a1);
void ov101_021EB560(u16 a0, HeapID a1, String *a2);

extern const TouchscreenListMenuTemplate ov101_021F7E80;

void ov101_021E9270(PokegearAppData *pokegear, void *appData) {
    PokegearMapAppData *mapApp = appData;

    if (mapApp->unk_138_7) {
        ov101_021E9B70(mapApp, &mapApp->unk_0C8);
    }
}

void ov101_021E9288(PokegearMapAppData *mapApp) {
    if (mapApp->unk_138_0) {
        mapApp->unk_0C8.unk_28 = (mapApp->unk_0C8.unk_04 + mapApp->unk_0C8.unk_14 - 8) / 16 + 1;
        mapApp->unk_0C8.unk_2C = (mapApp->unk_0C8.unk_00 + mapApp->unk_0C8.unk_10 - 8) / 16 + 1;
        mapApp->unk_0C8.unk_2A = mapApp->unk_0C8.unk_28 + 7;
        mapApp->unk_0C8.unk_2E = mapApp->unk_0C8.unk_2C + 11;
    } else {
        mapApp->unk_0C8.unk_28 = (-mapApp->unk_0C8.unk_04) / 8 + 1;
        mapApp->unk_0C8.unk_2C = mapApp->unk_0C8.unk_00 / 8 + 1;
        mapApp->unk_0C8.unk_2A = mapApp->unk_0C8.unk_28 + 16;
        mapApp->unk_0C8.unk_2E = mapApp->unk_0C8.unk_2C + 23;
    }
}

void ov101_021E933C(PokegearMapAppData *mapApp) {
    MI_CpuClear8(&mapApp->unk_014, sizeof(mapApp->unk_014));
    mapApp->unk_014.unk_1A = 0xFFFF;
    mapApp->unk_014.unk_00 = 1;
    mapApp->unk_014.unk_01 = mapApp->unk_138_0;
    mapApp->unk_014.unk_08 = mapApp->unk_110;
    mapApp->unk_014.unk_0A = mapApp->unk_112;
    mapApp->unk_014.unk_0C = mapApp->unk_084->unk_08[5].unk_04.x;
    mapApp->unk_014.unk_0E = mapApp->unk_084->unk_08[5].unk_04.y;
    mapApp->unk_014.unk_14 = mapApp->unk_0C8.unk_00;
    mapApp->unk_014.unk_16 = mapApp->unk_0C8.unk_04;
    mapApp->unk_014.unk_10 = mapApp->unk_0C8.unk_10;
    mapApp->unk_014.unk_12 = mapApp->unk_0C8.unk_14;
    mapApp->unk_014.unk_04 = mapApp->unk_0C8.unk_28;
    mapApp->unk_014.unk_05 = mapApp->unk_0C8.unk_2A;
    mapApp->unk_014.unk_06 = mapApp->unk_0C8.unk_2C;
    mapApp->unk_014.unk_07 = mapApp->unk_0C8.unk_2E;
}

void ov101_021E93D0(PokegearMapAppData *mapApp) {
    mapApp->unk_110 = mapApp->unk_014.unk_08;
    mapApp->unk_112 = mapApp->unk_014.unk_0A;
    mapApp->unk_084->unk_08[5].unk_04.x = mapApp->unk_014.unk_0C;
    mapApp->unk_084->unk_08[5].unk_04.y = mapApp->unk_014.unk_0E;
    mapApp->unk_0C8.unk_00 = mapApp->unk_014.unk_14;
    mapApp->unk_0C8.unk_04 = mapApp->unk_014.unk_16;
    mapApp->unk_0C8.unk_10 = mapApp->unk_014.unk_10;
    mapApp->unk_0C8.unk_14 = mapApp->unk_014.unk_12;
    mapApp->unk_0C8.unk_28 = mapApp->unk_014.unk_04;
    mapApp->unk_0C8.unk_2A = mapApp->unk_014.unk_05;
    mapApp->unk_0C8.unk_2C = mapApp->unk_014.unk_06;
    mapApp->unk_0C8.unk_2E = mapApp->unk_014.unk_07;
    MI_CpuClear8(&mapApp->unk_014, sizeof(mapApp->unk_014));
    mapApp->unk_014.unk_1A = 0xFFFF;
    mapApp->unk_014.unk_00 = 0;
}

void ov101_021E9464(PokegearMapAppData *mapApp, s16 a1, s16 a2, u16 *a3, u16 *a4) {
    s16 r2;
    s16 r1;

    r2 = a1 - mapApp->unk_132;
    r1 = a2 - mapApp->unk_131;

    if (mapApp->unk_138_0) {
        *a3 = r2 / 16;
        *a4 = r1 / 16;
    } else {
        *a3 = r2 / 8;
        *a4 = r1 / 8;
    }
}

void ov101_021E94C0(PokegearMapAppData *mapApp) {
    // this might give me brain damage
    // scratch: https://decomp.me/scratch/tbMr8
    s16 r5;
    s16 r4;
    u8 r1;

    r1 = mapApp->unk_138_0 + 1;

    r5 = mapApp->unk_110 - mapApp->unk_0C8.unk_2C;
    r4 = mapApp->unk_112 - mapApp->unk_0C8.unk_28;

    r5 = r5 * (8 * r1) + mapApp->unk_132 + 4 * r1;
    r4 = r4 * (8 * r1) + mapApp->unk_131 + 4 * r1;

    UnkStruct_ov100_021E6E20_Sub8_inline_setCoordUpdateSprite(&mapApp->unk_084->unk_08[5], r5, r4);
}

void ov101_021E9530(PokegearMapAppData *mapApp, u8 a1, u16 a2, u16 a3, s16 a4, s16 a5) {
    u16 sp16;
    u16 sp14;
    s16 r2;
    s16 ip;
    s16 r0;
    s16 r1;
    s16 sp08;
    s16 r6;
    s16 r3;
    s16 r5;
    u8 sp4;

    if (a1) {
        sp4 = 0x10;
        ov101_021E9464(mapApp, a4, a5, &sp16, &sp14);
        r2 = 5 - sp16;
        ip = 4 - sp14;
        sp08 = a3 - sp14 - ip;
        r6 = a3 + (7 - sp14) - ip;
        r3 = a2 - sp16 - r2;
        r5 = a2 + (11 - sp16) - r2;
    } else {
        sp4 = 0x8;
        sp16 = a2 - (mapApp->unk_0C8.unk_00 / 8 + 1);
        sp14 = a3 - (mapApp->unk_0C8.unk_04 / 8 + 1);
        r2 = 11 - sp16;
        ip = 8 - sp14;
        sp08 = a3 - sp14 - ip;
        r6 = a3 + (16 - sp14) - ip;
        r3 = a2 - sp16 - r2;
        r5 = a2 + (23 - sp16) - r2;
    }
    if (sp08 < mapApp->unk_104) {
        r1 = sp08 - mapApp->unk_104;
        ip += r1;
        sp08 -= r1;
        r6 -= r1;
    } else if (r6 > mapApp->unk_106) {
        r1 = r6 - mapApp->unk_106;
        ip += r1;
        r6 -= r1;
        sp08 -= r1;
    }
    if (r3 < mapApp->unk_100) {
        r0 = r3 - mapApp->unk_100;
        r2 += r0;
        r3 -= r0;
        r5 -= r0;
    } else if (r5 > mapApp->unk_102) {
        r0 = r5 - mapApp->unk_102;
        r2 += r0;
        r5 -= r0;
        r3 -= r0;
    }
    mapApp->unk_0C8.unk_28 = sp08;
    mapApp->unk_0C8.unk_2A = r6;
    mapApp->unk_0C8.unk_2C = r3;
    mapApp->unk_0C8.unk_2E = r5;
    mapApp->unk_0C8.unk_30 = -(r2 * sp4);
    mapApp->unk_0C8.unk_32 = -(ip * sp4);
    mapApp->unk_0C8.unk_34 = mapApp->unk_0C8.unk_00 + mapApp->unk_0C8.unk_30;
    mapApp->unk_0C8.unk_36 = mapApp->unk_0C8.unk_04 + mapApp->unk_0C8.unk_32;
    mapApp->unk_0C8.unk_20 = FX32_CONST(mapApp->unk_0C8.unk_00);
    mapApp->unk_0C8.unk_24 = FX32_CONST(mapApp->unk_0C8.unk_04);
    mapApp->unk_0C8.unk_18 = FX_Div(FX32_CONST(mapApp->unk_0C8.unk_30), FX32_CONST(mapApp->unk_13A));
    mapApp->unk_0C8.unk_1C = FX_Div(FX32_CONST(mapApp->unk_0C8.unk_32), FX32_CONST(mapApp->unk_13A));
}

void ov101_021E9848(PokegearMapAppData *mapApp, u16 a1, u16 a2, s16 a3, s16 a4, int *a5, int *a6) {
    u8 r2 = 0;
    u8 r1 = 0;
    if (!mapApp->unk_138_0) {
        r2 = (a3 - mapApp->unk_132) / 16;
        r1 = (a4 - mapApp->unk_131) / 16;
        if (r2 <= 5) {
            *a5 = a1 * 8 + 8;
        } else {
            *a5 = a1 * 8;
        }
        if (r1 > 4) {
            *a6 = a2 * 8 + 8;
        } else {
            *a6 = a2 * 8;
        }
    } else {
        r2 = ((a3 - mapApp->unk_132) / 8) % 2;
        r1 = ((a4 - mapApp->unk_131) / 8) % 2;
        *a5 = a1 * 8 + r2 * 8;
        *a6 = a2 * 8 + r1 * 8;
    }
}

void ov101_021E990C(PokegearMapAppData *mapApp) {
    s16 sp18;
    s16 sp14;
    u16 r7;
    u16 r6;
    u16 sp10;
    VecFx32 sp1C;
    UnkStruct_ov100_021E6E20_Sub8 *r5 = mapApp->unk_084->unk_08;
    if (mapApp->unk_138_0) {
        r7 = 2;
        r6 = 16;
    } else {
        r7 = 1;
        r6 = 8;
    }
    mapApp->unk_0C8.unk_08 = FX32_CONST(r7);
    mapApp->unk_0C8.unk_0C = FX32_CONST(r7);
    sp10 = r6 / 2;
    if (mapApp->unk_014.unk_00) {
        ov101_021E93D0(mapApp);
    } else {
        ov101_021E9530(mapApp, 0, mapApp->unk_110, mapApp->unk_112, 0, 0);
        mapApp->unk_0C8.unk_00 = mapApp->unk_0C8.unk_34;
        mapApp->unk_0C8.unk_04 = mapApp->unk_0C8.unk_36;
        sp18 = (mapApp->unk_110 - mapApp->unk_0C8.unk_2C) * 8 + mapApp->unk_132 + 4;
        sp14 = (mapApp->unk_112 - mapApp->unk_0C8.unk_28) * 8 + mapApp->unk_131 + 4;
        if (mapApp->unk_138_0) {
            ov101_021E9530(mapApp, 1, mapApp->unk_110, mapApp->unk_112, sp18, sp14);
            ov101_021E9848(mapApp, mapApp->unk_110, mapApp->unk_112, sp18, sp14, &mapApp->unk_0C8.unk_10, &mapApp->unk_0C8.unk_14);
            mapApp->unk_0C8.unk_00 = mapApp->unk_0C8.unk_34;
            mapApp->unk_0C8.unk_04 = mapApp->unk_0C8.unk_36;
            sp18 = (mapApp->unk_110 - mapApp->unk_0C8.unk_2C) * r6 + mapApp->unk_132 + sp10;
            sp14 = (mapApp->unk_112 - mapApp->unk_0C8.unk_28) * r6 + mapApp->unk_131 + sp10;
        }
        UnkStruct_ov100_021E6E20_Sub8_inline_setCoord(&r5[5], sp18, sp14);
    }
    UnkStruct_ov100_021E6E20_Sub8_inline_setCoord2(&r5[5], mapApp->unk_110, mapApp->unk_112);
    sp1C.x = sp1C.y = FX32_CONST(r7);
    sp1C.z = FX32_ONE;
    Sprite_SetAffineScale(r5[5].sprite, &sp1C);
    sp18 = (mapApp->unk_108 - mapApp->unk_0C8.unk_2C) * r6 + mapApp->unk_132 + sp10;
    sp14 = (mapApp->unk_10A - mapApp->unk_0C8.unk_28) * r6 + mapApp->unk_131 + sp10;
    UnkStruct_ov100_021E6E20_Sub8_inline_setCoord(&r5[6], sp18, sp14);
    UnkStruct_ov100_021E6E20_Sub8_inline_setCoord2(&r5[6], mapApp->unk_108, mapApp->unk_10A);
}

void ov101_021E9B70(PokegearMapAppData *mapApp, PokegearMapAppData_Sub0C8 *a1) {
    int i;
    MtxFx22 sp04;
    fx32 r5;
    fx32 r0;

    r5 = FX_Inv(a1->unk_08);
    r0 = FX_Inv(a1->unk_0C);

    sp04._00 = r5;
    sp04._01 = 0;
    sp04._10 = 0;
    sp04._11 = r0;

    for (i = 0; i < 2; ++i) {
        BgSetPosTextAndCommit(mapApp->pokegear->bgConfig, i + GF_BG_LYR_MAIN_2, BG_POS_OP_SET_X, a1->unk_00 + mapApp->unk_134);
        BgSetPosTextAndCommit(mapApp->pokegear->bgConfig, i + GF_BG_LYR_MAIN_2, BG_POS_OP_SET_Y, a1->unk_04 + mapApp->unk_133);
        SetBgAffine(mapApp->pokegear->bgConfig, i + GF_BG_LYR_MAIN_2, &sp04, a1->unk_10, a1->unk_14);
    }
    mapApp->unk_138_7 = FALSE;
}

void ov101_021E9BF4(PokegearMapAppData *mapApp, s16 a1, s16 a2) {
    u16 i;
    UnkStruct_ov100_021E6E20_Sub8 *r1 = mapApp->unk_084->unk_08;

    UnkStruct_ov100_021E6E20_Sub8_inline_addCoord(&r1[6], a1, a2);

    if (mapApp->unk_139_3) {
        UnkStruct_ov100_021E6E20_Sub8_inline_addCoord(&r1[5], a1, a2);
    }
    if (mapApp->unk_00D) {
        for (i = 0; i < 27; ++i) {
            UnkStruct_ov100_021E6E20_Sub8_inline_addCoord(&r1[15 + i], a1, a2);
        }
    } else {
        for (i = 0; i < 4; ++i) {
            UnkStruct_ov100_021E6E20_Sub8_inline_addCoord(&r1[7 + i], a1, a2);
        }
        for (i = 0; i < 100; ++i) {
            UnkStruct_ov100_021E6E20_Sub8_inline_addCoord(&r1[11 + i], a1, a2);
        }
    }
}

BOOL ov101_021E9CD4(PokegearMapAppData *mapApp, u8 direction) {
    if (mapApp->unk_135 > 16) {
        return TRUE;
    }
    if (direction == 0) {
        PaletteData_BlendPalette(mapApp->pokegear->plttData, PLTTBUF_MAIN_BG, 0, 0xE0, 16 - mapApp->unk_135, RGB_BLACK);
        PaletteData_BlendPalette(mapApp->pokegear->plttData, PLTTBUF_MAIN_OBJ, 0x40, 0xC0, 16 - mapApp->unk_135, RGB_BLACK);
    } else {
        PaletteData_BlendPalette(mapApp->pokegear->plttData, PLTTBUF_MAIN_BG, 0, 0xE0, mapApp->unk_135, RGB_BLACK);
        PaletteData_BlendPalette(mapApp->pokegear->plttData, PLTTBUF_MAIN_OBJ, 0x40, 0xC0, mapApp->unk_135, RGB_BLACK);
    }
    if (mapApp->unk_135 >= 16) {
        mapApp->unk_135 += 2;
        return TRUE;
    } else {
        mapApp->unk_135 += 2;
        return FALSE;
    }
}

void ov101_021E9D74(PokegearMapAppData *mapApp, u8 a1) {
    int i;
    UnkStruct_ov100_021E6E20_Sub8 *sp0 = mapApp->unk_084->unk_08;

    G2S_SetWnd0Position(0x00, 0x40, 0xFF, 0xC0);
    G2S_SetWnd1Position(0xFF, 0x40, 0x00, 0xC0);
    G2S_SetWndOutsidePlane(0x11, FALSE);
    G2S_SetWnd0InsidePlane(0x1F, FALSE);
    G2S_SetWnd1InsidePlane(0x1F, FALSE);
    GXS_SetVisibleWnd(3);

    if (a1 == 0) {
        for (i = 0; i < 3; ++i) {
            BgSetPosTextAndCommit(mapApp->pokegear->bgConfig, i + GF_BG_LYR_SUB_1, BG_POS_OP_SET_Y, -0x80);
            ToggleBgLayer(i + GF_BG_LYR_SUB_1, TRUE);
        }
        for (i = 0; i < 4; ++i) {
            UnkStruct_ov100_021E6E20_Sub8_inline_setCoord(&sp0[i], (i % 2) * 0x68 + 0x20, (i / 2) * 0x15 + 0x14B);
        }
        UnkStruct_ov100_021E6E20_Sub8_inline_setCoord(&sp0[4], 0x10, 0x118);
        ov100_021E6E84(mapApp->unk_084);
    } else {
        BgSetPosTextAndCommit(mapApp->pokegear->bgConfig, GF_BG_LYR_SUB_1, BG_POS_OP_SUB_Y, 0);
        BgSetPosTextAndCommit(mapApp->pokegear->bgConfig, GF_BG_LYR_SUB_2, BG_POS_OP_SUB_Y, 0);
        BgSetPosTextAndCommit(mapApp->pokegear->bgConfig, GF_BG_LYR_SUB_3, BG_POS_OP_SUB_Y, 0);
    }
    mapApp->unk_034 = 0;
    mapApp->unk_030 = 0;
}

BOOL ov101_021E9E90(PokegearMapAppData *mapApp, u8 a1) {
    UnkStruct_ov100_021E6E20_Sub8 *r4 = mapApp->unk_084->unk_08;
    int i;

    if (mapApp->unk_030) {
        return TRUE;
    }
    if (!a1) {
        BgSetPosTextAndCommit(mapApp->pokegear->bgConfig, GF_BG_LYR_SUB_1, BG_POS_OP_ADD_Y, 0x20);
        BgSetPosTextAndCommit(mapApp->pokegear->bgConfig, GF_BG_LYR_SUB_2, BG_POS_OP_ADD_Y, 0x20);
        BgSetPosTextAndCommit(mapApp->pokegear->bgConfig, GF_BG_LYR_SUB_3, BG_POS_OP_ADD_Y, 0x20);
        for (i = 0; i <= 4; ++i) {
            UnkStruct_ov100_021E6E20_Sub8_inline_addCoord(&r4[i], 0, -0x20);
        }
    } else {

        BgSetPosTextAndCommit(mapApp->pokegear->bgConfig, GF_BG_LYR_SUB_1, BG_POS_OP_SUB_Y, 0x20);
        BgSetPosTextAndCommit(mapApp->pokegear->bgConfig, GF_BG_LYR_SUB_2, BG_POS_OP_SUB_Y, 0x20);
        BgSetPosTextAndCommit(mapApp->pokegear->bgConfig, GF_BG_LYR_SUB_3, BG_POS_OP_SUB_Y, 0x20);
        for (i = 0; i <= 4; ++i) {
            UnkStruct_ov100_021E6E20_Sub8_inline_addCoord(&r4[i], 0, 0x20);
        }
    }
    ov100_021E6E84(mapApp->unk_084);
    if (++mapApp->unk_034 < 4) {
        return FALSE;
    }
    mapApp->unk_034 = 0;
    mapApp->unk_030 = 1;
    if (a1 == 1) {
        for (i = 0; i < 3; ++i) {
            ToggleBgLayer(i + GF_BG_LYR_SUB_1, FALSE);
            BgClearTilemapBufferAndCommit(mapApp->pokegear->bgConfig, i + GF_BG_LYR_SUB_1);
            BgSetPosTextAndCommit(mapApp->pokegear->bgConfig, i + GF_BG_LYR_SUB_1, BG_POS_OP_SET_Y, 0);
            ScheduleBgTilemapBufferTransfer(mapApp->pokegear->bgConfig, i + GF_BG_LYR_SUB_1);
        }
    }

    GXS_SetVisibleWnd(0);
    G2S_SetWnd0Position(0x00, 0x00, 0x00, 0x00);
    G2S_SetWnd1Position(0x00, 0x00, 0x00, 0x00);
    G2S_SetWnd0InsidePlane(0x00, FALSE);
    G2S_SetWnd1InsidePlane(0x00, FALSE);
    G2S_SetWndOutsidePlane(0x00, FALSE);
    return TRUE;
}

void ov101_021E9FDC(PokegearMapAppData *mapApp, u8 a1) {
    UnkStruct_ov100_021E6E20_Sub8 *sp0 = mapApp->unk_084->unk_08;
    int i;

    G2_SetWnd0Position(0x00, 0x00, 0xFF, 0x70);
    G2_SetWnd1Position(0xFF, 0x00, 0x00, 0x70);
    G2_SetWndOutsidePlane(0x18, FALSE);
    G2_SetWnd0InsidePlane(0x1F, FALSE);
    G2_SetWnd1InsidePlane(0x1F, FALSE);
    GX_SetVisibleWnd(3);
    if (a1 == 0) {
        for (i = 0; i < 2; ++i) {
            BgSetPosTextAndCommit(mapApp->pokegear->bgConfig, i + GF_BG_LYR_MAIN_1, BG_POS_OP_SET_Y, 0x70);
        }
        for (i = 20; i <= 27; ++i) {
            UnkStruct_ov100_021E6E20_Sub8_inline_addCoord(&sp0[i], 0, -0x70);
        }
        ov100_021E6E84(mapApp->unk_084);
        for (i = 0; i < 4; ++i) {
            sub_020136B4(mapApp->unk_044[i].unk_0, 4, -6);
        }
    } else {
        BgSetPosTextAndCommit(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_1, BG_POS_OP_SUB_Y, 0);
        BgSetPosTextAndCommit(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_SUB_Y, 0);
        Sprite_SetDrawFlag(mapApp->unk_084->unk_08[11].sprite, FALSE);
    }
    mapApp->unk_034 = 0;
    mapApp->unk_030 = 0;
}

BOOL ov101_021EA0D8(PokegearMapAppData *mapApp, u8 a1) {
    UnkStruct_ov100_021E6E20_Sub8 *r4 = mapApp->unk_084->unk_08;
    int i;

    if (mapApp->unk_030) {
        return TRUE;
    }

    if (!a1) {
        BgSetPosTextAndCommit(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_1, BG_POS_OP_SUB_Y, 0x1C);
        BgSetPosTextAndCommit(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_SUB_Y, 0x1C);
        for (i = 20; i <= 27; ++i) {
            UnkStruct_ov100_021E6E20_Sub8_inline_addCoord(&r4[i], 0, 0x1C);
        }
    } else {
        BgSetPosTextAndCommit(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_1, BG_POS_OP_ADD_Y, 0x1C);
        BgSetPosTextAndCommit(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_ADD_Y, 0x1C);
        for (i = 20; i <= 27; ++i) {
            UnkStruct_ov100_021E6E20_Sub8_inline_addCoord(&r4[i], 0, -0x1C);
        }
    }
    ov100_021E6E84(mapApp->unk_084);
    for (i = 0; i < 4; ++i) {
        sub_020136B4(mapApp->unk_044[i].unk_0, 4, -6);
    }
    if (++mapApp->unk_034 < 4) {
        return FALSE;
    }
    mapApp->unk_034 = 0;
    mapApp->unk_030 = 1;
    if (a1 == 1) {
        for (i = 0; i < 2; ++i) {
            BgClearTilemapBufferAndCommit(mapApp->pokegear->bgConfig, i + GF_BG_LYR_MAIN_1);
            ScheduleBgTilemapBufferTransfer(mapApp->pokegear->bgConfig, i + GF_BG_LYR_MAIN_1);
        }
    }

    GX_SetVisibleWnd(0);
    G2_SetWnd0Position(0x00, 0x00, 0x00, 0x00);
    G2_SetWnd1Position(0x00, 0x00, 0x00, 0x00);
    G2_SetWnd0InsidePlane(0x00, FALSE);
    G2_SetWnd1InsidePlane(0x00, FALSE);
    G2_SetWndOutsidePlane(0x00, FALSE);
    if (a1 == 0) {
        Sprite_SetDrawFlag(mapApp->unk_084->unk_08[11].sprite, TRUE);
        if (mapApp->pokegear->menuInputState != MENU_INPUT_STATE_TOUCH) {
            PokegearAppSwitchCursor_SetCursorSpritesDrawState(mapApp->pokegear->appSwitch, 1, TRUE);
        }
    }
    return TRUE;
}

void ov101_021EA238(PokegearMapAppData *mapApp, u8 a1) {
    u16 i;
    u16 r2;
    s16 spC;
    s16 r0;
    u8 sp4;
    u8 sp0;
    u8 sp8;
    const PokegearMapAppData_Sub214 *r1;

    sp8 = mapApp->unk_138_0 + 1;
    sp4 = sp8 * 8;
    sp0 = sp4 / 2;

    for (i = 0; i < 100; ++i) {
        r1 = &mapApp->unk_214[i];
        spC = (r1->unk_2 - mapApp->unk_0C8.unk_2C) * sp4 + mapApp->unk_132 + sp0 + r1->unk_4_8 * sp8;
        r0 = (r1->unk_3 - mapApp->unk_0C8.unk_28) * sp4 + mapApp->unk_131 + sp0 + r1->unk_4_C * sp8;
        r2 = i + 11;

        switch (a1) {
        case 0:
            mapApp->unk_084->unk_08[r2].unk_04.x = spC;
            mapApp->unk_084->unk_08[r2].unk_04.y = r0;
            if (ov101_021ED614(mapApp, r1->unk_0) != NULL) {
                Sprite_SetDrawFlag(mapApp->unk_084->unk_08[r2].sprite, TRUE);
                UnkStruct_ov100_021E6E20_Sub8_inline_setUnk01(&mapApp->unk_084->unk_08[r2], TRUE);
            } else {
                Sprite_SetDrawFlag(mapApp->unk_084->unk_08[r2].sprite, FALSE);
                UnkStruct_ov100_021E6E20_Sub8_inline_setUnk01(&mapApp->unk_084->unk_08[r2], FALSE);
            }
            break;
        case 1:
            mapApp->unk_084->unk_08[r2].unk_08 = spC;
            mapApp->unk_084->unk_08[r2].unk_0A = r0;
            break;
        case 2:
            Sprite_SetDrawFlag(mapApp->unk_084->unk_08[r2].sprite, FALSE);
            UnkStruct_ov100_021E6E20_Sub8_inline_setUnk01(&mapApp->unk_084->unk_08[r2], FALSE);
            break;
        }
    }
    for (i = 0; i < 4; ++i) {
        r2 = i + 7;
        if (!mapApp->unk_9E8[i]) {
            UnkStruct_ov100_021E6E20_Sub8_inline_setUnk01(&mapApp->unk_084->unk_08[r2], FALSE);
            Sprite_SetDrawFlag(mapApp->unk_084->unk_08[r2].sprite, FALSE);
            continue;
        }
        r1 = ov101_021EA758(mapApp, mapApp->unk_9E8[i]);
        spC = (r1->unk_2 - mapApp->unk_0C8.unk_2C) * sp4 + mapApp->unk_132 + sp0 + r1->unk_4_8 * sp8;
        r0 = (r1->unk_3 - mapApp->unk_0C8.unk_28) * sp4 + mapApp->unk_131 + sp0 + r1->unk_4_C * sp8;
        switch (a1) {
        case 0:
            mapApp->unk_084->unk_08[r2].unk_04.x = spC;
            mapApp->unk_084->unk_08[r2].unk_04.y = r0;
            UnkStruct_ov100_021E6E20_Sub8_inline_setUnk01(&mapApp->unk_084->unk_08[r2], TRUE);
            Sprite_SetDrawFlag(mapApp->unk_084->unk_08[r2].sprite, TRUE);
            break;
        case 1:
            mapApp->unk_084->unk_08[r2].unk_08 = spC;
            mapApp->unk_084->unk_08[r2].unk_0A = r0;
            break;
        case 2:
            UnkStruct_ov100_021E6E20_Sub8_inline_setUnk01(&mapApp->unk_084->unk_08[r2], FALSE);
            Sprite_SetDrawFlag(mapApp->unk_084->unk_08[r2].sprite, FALSE);
            break;
        }
    }
}

void ov101_021EA4D0(PokegearMapAppData *mapApp, u8 a1) {
    u16 i;
    u16 r0;
    s16 r2;
    s16 r1;
    s16 r2_2;
    s16 r1_2;
    const UnkStruct_ov101_021F79B4 *r6;

    for (i = 0; i < 27; ++i) {
        r6 = &ov101_021F79B4[i];
        r2_2 = r6->unk_0A_0 * 4;
        r1_2 = r6->unk_0A_4 * 4;
        r2 = (r6->unk_06 - mapApp->unk_0C8.unk_2C) * 8 + mapApp->unk_132 + r2_2;
        r1 = ((r6->unk_07 + 2) - mapApp->unk_0C8.unk_28) * 8 + mapApp->unk_131 + r1_2;
        r0 = i + 15;

        switch (a1) {
        case 0:
            mapApp->unk_084->unk_08[r0].unk_04.x = r2;
            mapApp->unk_084->unk_08[r0].unk_04.y = r1;
            if (Save_VarsFlags_FlypointFlagAction(mapApp->pokegear->saveVarsFlags, FLAG_ACTION_CHECK, r6->unk_04)) {
                Sprite_SetDrawFlag(mapApp->unk_084->unk_08[r0].sprite, TRUE);
            } else {
                Sprite_SetDrawFlag(mapApp->unk_084->unk_08[r0].sprite, FALSE);
            }
            if (ov101_021EA804(mapApp, r6->unk_02, r6->unk_06, r6->unk_07)) {
                Sprite_SetAnimCtrlSeq(mapApp->unk_084->unk_08[r0].sprite, 10);
            }
            break;
        case 1:
            mapApp->unk_084->unk_08[r0].unk_08 = r2;
            mapApp->unk_084->unk_08[r0].unk_0A = r1;
            break;
        case 2:
            Sprite_SetDrawFlag(mapApp->unk_084->unk_08[r0].sprite, FALSE);
            break;
        }
    }
}

void ov101_021EA608(PokegearMapAppData *mapApp, u8 a1) {
    int i;
    UnkStruct_ov100_021E6E20_Sub8 *r5 = mapApp->unk_084->unk_08;

    if (a1 == 0) {
        Sprite_SetDrawFlag(r5[5].sprite, FALSE);
        Sprite_SetDrawFlag(r5[6].sprite, FALSE);
        for (i = 7; i <= 10; ++i) {
            Sprite_SetDrawFlag(r5[i].sprite, FALSE);
        }
    } else {
        Sprite_SetDrawFlag(r5[5].sprite, TRUE);
        Sprite_SetDrawFlag(r5[6].sprite, TRUE);
    }
}

BOOL ov101_021EA664(PokegearMapAppData *mapApp, int a1) {
    switch (a1) {
    case MAP_ROUTE_47:
    case MAP_ROUTE_48:
    case MAP_SAFARI_ZONE_GATE:
        if (!mapApp->unk_13D_1) {
            return TRUE;
        }
        break;
    case MAP_SINJOH_RUINS_EXTERIOR:
        if (!mapApp->unk_13D_2) {
            return TRUE;
        }
        break;
    case MAP_SS_AQUA_1F:
        if (!mapApp->unk_13D_3) {
            return TRUE;
        }
        break;
    }
    return FALSE;
}

BOOL ov101_021EA6C4(PokegearMapAppData *mapApp, PokegearMapAppData_Sub118 *a1) {
    if (!a1->unk_0) {
        return FALSE;
    }
    if (a1->unk_0->unk_0 == MAP_SINJOH_RUINS_EXTERIOR || a1->unk_0->unk_0 == MAP_SS_AQUA_1F) {
        return FALSE;
    }
    return TRUE;
}

const PokegearMapAppData_Sub214 *ov101_021EA6E8(PokegearMapAppData *mapApp, u8 a1, u8 a2) {
    const PokegearMapAppData_Sub214 *r4;
    u16 i;

    for (i = 0; i < mapApp->unk_136; ++i) {
        r4 = &mapApp->unk_214[i];
        if (a1 >= r4->unk_2 && a2 >= r4->unk_3 && a1 < r4->unk_2 + r4->unk_4_0 && a2 < r4->unk_3 + r4->unk_4_4) {
            if (ov101_021EA664(mapApp, r4->unk_0)) {
                r4 = NULL;
            }
            return r4;
        }
    }
    return NULL;
}

const PokegearMapAppData_Sub214 *ov101_021EA758(PokegearMapAppData *mapApp, u16 a1) {
    const PokegearMapAppData_Sub214 *r4;
    u16 i;

    for (i = 0; i < mapApp->unk_136; ++i) {
        r4 = &mapApp->unk_214[i];
        if (r4->unk_0 == a1) {
            if (ov101_021EA664(mapApp, r4->unk_0)) {
                r4 = NULL;
            }
            return r4;
        }
    }
    return NULL;
}

void ov101_021EA794(PokegearMapAppData *mapApp, PokegearMapAppData_Sub118 *a1, u8 a2, u8 a3) {
    a1->unk_0 = ov101_021EA6E8(mapApp, a2, a3);
    if (mapApp->unk_138_5 == 0) {
        if (!(a2 == 25 && a3 == 10) && a2 >= 22) {
            a1->unk_0 = NULL;
        }
    }
    if (a1->unk_0 == NULL) {
        a1->unk_4 = 0;
    } else {
        a1->unk_4 = ov101_021ED614(mapApp, mapApp->unk_118.unk_0->unk_0);
    }
    a1->unk_8 = a2;
    a1->unk_A = a3;
}

BOOL ov101_021EA7E4(PokegearMapAppData *mapApp, u16 a1, u16 a2) {
    int r0 = ov100_021E5C50(a1, a2);
    if (mapApp->unk_00E == 1 || r0 == mapApp->unk_00E) {
        return TRUE;
    } else {
        return FALSE;
    }
}

BOOL ov101_021EA804(PokegearMapAppData *mapApp, u16 a1, u16 a2, u16 a3) {
    if (a1 == MAP_INDIGO_PLATEAU || a1 == MAP_ROUTE_26) {
        return TRUE;
    } else {
        return ov101_021EA7E4(mapApp, a2, a3);
    }
}

int ov101_021EA81C(PokegearMapAppData *mapApp, u16 a1, u16 a2) {
    int i;
    const UnkStruct_ov101_021F79B4 *r4;

    for (i = 0; i < 27; ++i) {
        r4 = &ov101_021F79B4[i];
        if (a1 < r4->unk_06 || a1 >= r4->unk_06 + r4->unk_0A_0 || a2 < r4->unk_07 || a2 >= r4->unk_07 + r4->unk_0A_4) {
            continue;
        }
        if (!Save_VarsFlags_FlypointFlagAction(mapApp->pokegear->saveVarsFlags, FLAG_ACTION_CHECK, r4->unk_04)) {
            continue;
        }
        return i;
    }

    return -1;
}

int ov101_021EA874(PokegearMapAppData *mapApp, u16 a1, u16 a2) {
    int r0;

    r0 = ov101_021EA81C(mapApp, a1, a2);
    if (r0 < 0 || !ov101_021EA804(mapApp, ov101_021F79B4[r0].unk_02, a1, a2)) {
        return 0;
    }
    return ov101_021F79B4[r0].unk_02;
}

int ov101_021EA8A8(PokegearMapAppData *mapApp, PokegearMapAppData_Sub118 *a1, u8 a2, u8 a3) {
    int sp8;
    int r6;

    r6 = ov101_021EA81C(mapApp, a2, a3 - 2);
    if (r6 < 0) {
        ov101_021EA794(mapApp, a1, a2, a3);
        if (mapApp->unk_00F >= 0) {
            Sprite_SetAnimCtrlSeq(mapApp->unk_084->unk_08[15 + mapApp->unk_00F].sprite, 10);
            mapApp->unk_00F = -1;
        }
        return -1;
    }

    sp8 = ov101_021F79B4[r6].unk_00;
    a1->unk_8 = a2;
    a1->unk_A = a3;
    a1->unk_0 = ov101_021EA758(mapApp, sp8);
    if (mapApp->unk_00F != r6) {
        if (mapApp->unk_00F >= 0) {
            Sprite_SetAnimCtrlSeq(mapApp->unk_084->unk_08[15 + mapApp->unk_00F].sprite, 10);
            mapApp->unk_00F = -1;
        }
        if (ov101_021EA804(mapApp, sp8, a2, a3 - 2)) {
            Sprite_SetAnimCtrlSeq(mapApp->unk_084->unk_08[15 + r6].sprite, 11);
            mapApp->unk_00F = r6;
        }
    }
    a1->unk_4 = ov101_021ED614(mapApp, sp8);
    return sp8;
}

BOOL ov101_021EA990(PokegearMapAppData *mapApp, int a1) {
    int i;
    TimeOfDayWildParam r0;
    PhoneBookEntry *r3;

    r0 = GF_RTC_GetTimeOfDayWildParam();
    for (i = 0; i < mapApp->unk_130; ++i) {
        r3 = &mapApp->unk_128->entries[mapApp->unk_12C[i].id];
        if (r3->mapId != a1) {
            continue;
        }
        if (r3->type != 0) {
            continue;
        }
        if (PhoneBookTrainerGetRematchInfo(mapApp->unk_12C[i].id, mapApp->pokegear->saveData, mapApp->unk_128, r0) != 0) {
            return TRUE;
        }
        if (PhoneCallPersistentState_PhoneRematches_GiftItemIdGet(mapApp->unk_124, mapApp->unk_12C[i].id) != ITEM_NONE) {
            return TRUE;
        }
    }
    return FALSE;
}

void ov101_021EAA0C(PokegearMapAppData *mapApp, BOOL a1, BOOL a2) {
    u32 sp0;
    u32 i;
    u32 r6;
    u8 r1;
    PokegearMapAppData_Sub118 *sp30;
    const PokegearMapAppData_Sub214 *sp2C;
    PokegearMapAppData_Sub118_Sub4 *sp28;
    UnkStruct_ov100_021E6E20_Sub8 *r4 = mapApp->unk_084->unk_08;

    sp30 = &mapApp->unk_118;
    sp2C = sp30->unk_0;
    sp28 = sp30->unk_4;

    String_SetEmpty(mapApp->unk_0A4);
    for (i = 0; i < 3; ++i) {
        FillWindowPixelBuffer(&mapApp->unk_184[i], 0);
    }
    AddTextPrinterParameterizedWithColor(&mapApp->unk_184[0], 0, mapApp->unk_09C[a2], 2, 4, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(1, 2, 0), NULL);
    if (mapApp->unk_00D == 0) {
        if (!ov101_021EA6C4(mapApp, sp30)) {
            ov101_021EB38C(mapApp, FALSE, 2);
        } else {
            ov101_021EB38C(mapApp, FALSE, 0);
        }
    }
    if (sp2C != NULL) {
        ov101_021EB560(sp2C->unk_0, mapApp->heapId, mapApp->unk_0A4);
        if (mapApp->unk_00D == 2) {
            sp0 = 1;
        } else {
            sp0 = 0;
        }
        AddTextPrinterParameterizedWithColor(&mapApp->unk_184[1], 0, mapApp->unk_0A4, 0, sp0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(1, 2, 0), NULL);
        if (a1) {
            for (i = 0; i <= 1; ++i) {
                CopyWindowToVram(&mapApp->unk_184[i]);
            }
            CopyToBgTilemapRect(mapApp->pokegear->bgConfig, GF_BG_LYR_SUB_2, 23, 11, 8, 7, mapApp->unk_16C->rawData, 0, 0, mapApp->unk_16C->screenWidth / 8, mapApp->unk_16C->screenHeight / 8);
            ScheduleBgTilemapBufferTransfer(mapApp->pokegear->bgConfig, GF_BG_LYR_SUB_1);
            ScheduleBgTilemapBufferTransfer(mapApp->pokegear->bgConfig, GF_BG_LYR_SUB_2);
            return;
        }
        if (sp2C->unk_7 != 0) {
            r1 = 8;
            r6 = sp2C->unk_7 - 1;
        } else {
            r1 = 0;
            r6 = 0;
        }
        CopyToBgTilemapRect(mapApp->pokegear->bgConfig, GF_BG_LYR_SUB_2, 23, 11, 8, 7, mapApp->unk_16C->rawData, r1, 0, mapApp->unk_16C->screenWidth / 8, mapApp->unk_16C->screenHeight / 8);
        CopyToBgTilemapRect(mapApp->pokegear->bgConfig, GF_BG_LYR_SUB_3, 24, 11, 7, 7, mapApp->unk_174->rawData, (r6 % 4) * 7, (r6 / 4) * 7, mapApp->unk_174->screenWidth / 8, mapApp->unk_174->screenHeight / 8);
        String_SetEmpty(mapApp->unk_090);
        ReadMsgDataIntoString(mapApp->unk_088, sp2C->unk_6, mapApp->unk_090);
        AddTextPrinterParameterizedWithColor(&mapApp->unk_184[2], 0, mapApp->unk_090, 0, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(1, 2, 0), NULL);
        Sprite_SetDrawFlag(r4[4].sprite, ov101_021EA990(mapApp, sp2C->unk_0));
    } else {
        CopyToBgTilemapRect(mapApp->pokegear->bgConfig, GF_BG_LYR_SUB_2, 23, 11, 8, 7, mapApp->unk_16C->rawData, 0, 0, mapApp->unk_16C->screenWidth / 8, mapApp->unk_16C->screenHeight / 8);
        Sprite_SetDrawFlag(r4[4].sprite, FALSE);
    }
    if (sp28 != NULL) {
        FillWindowPixelBuffer(&mapApp->unk_184[3], 0);
        FillWindowPixelBuffer(&mapApp->unk_184[4], 0);
        for (i = 0; i < 4; ++i) {
            if (sp28->unk_00.unk_4[i] != 15) {
                Sprite_SetDrawFlag(r4[i].sprite, TRUE);
                Sprite_SetAnimationFrame(r4[i].sprite, sp28->unk_00.unk_4[i]);
            } else {
                Sprite_SetDrawFlag(r4[i].sprite, FALSE);
            }
            if (sp28->unk_00.unk_8[i] != EC_WORD_NULL) {
                BufferECWord(mapApp->unk_08C, 0, sp28->unk_00.unk_8[i]);
                StringExpandPlaceholders(mapApp->unk_08C, mapApp->unk_090, mapApp->unk_0B4);
                AddTextPrinterParameterizedWithColor(&mapApp->unk_184[(i % 2) + 3], 0, mapApp->unk_090, 4, (i / 2) * 21 + 2, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(3, 4, 0), NULL);
            }
        }
    } else {
        for (i = 0; i < 4; ++i) {
            Sprite_SetDrawFlag(r4[i].sprite, FALSE);
            FillWindowPixelBuffer(&mapApp->unk_184[i + 3], 0);
        }
    }
    for (i = 0; i <= 4; ++i) {
        CopyWindowToVram(&mapApp->unk_184[i]);
    }
    ScheduleBgTilemapBufferTransfer(mapApp->pokegear->bgConfig, GF_BG_LYR_SUB_1);
    ScheduleBgTilemapBufferTransfer(mapApp->pokegear->bgConfig, GF_BG_LYR_SUB_2);
    ScheduleBgTilemapBufferTransfer(mapApp->pokegear->bgConfig, GF_BG_LYR_SUB_3);
}

void ov101_021EAD90(PokegearMapAppData *mapApp, int a1) {
    ov101_021EAA0C(mapApp, a1, (ov100_021E5C50(mapApp->unk_110, mapApp->unk_112 - 2) / 2) ^ TRUE);
}

void ov101_021EADC0(PokegearMapAppData *mapApp, u8 a1, u16 a2) {
    if (a2 == EC_WORD_NULL) {
        sub_020137C0(mapApp->unk_044[a1].unk_0, 0);
    } else {
        BufferECWord(mapApp->unk_08C, 0, a2);
        StringExpandPlaceholders(mapApp->unk_08C, mapApp->unk_090, mapApp->unk_0B4);
        FillWindowPixelBufferText_AssumeTileSize32(&mapApp->unk_184[8], 0);
        AddTextPrinterParameterizedWithColor(&mapApp->unk_184[8], 0, mapApp->unk_090, 0, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(3, 4, 0), NULL);
        sub_020139D0(mapApp->unk_044[a1].unk_0, mapApp->unk_040, &mapApp->unk_184[8], mapApp->heapId);
        sub_020137C0(mapApp->unk_044[a1].unk_0, 1);
    }
}

void ov101_021EAE54(PokegearMapAppData *mapApp, int a1) {
    u32 i;
    const PokegearMapAppData_Sub214 *r5;
    PokegearMapAppData_Sub118_Sub4 *sp10;
    PokegearMapAppData_Sub118 *r0;
    UnkStruct_ov100_021E6E20_Sub8 *r4 = mapApp->unk_084->unk_08;

    r0 = &mapApp->unk_118;
    r5 = r0->unk_0;
    sp10 = r0->unk_4;

    if (a1) {
        String_SetEmpty(mapApp->unk_0A4);
        FillWindowPixelBuffer(&mapApp->unk_184[7], 0);
        ov101_021EB560(r5->unk_0, mapApp->heapId, mapApp->unk_0A4);
        AddTextPrinterParameterizedWithColor(&mapApp->unk_184[7], 0, mapApp->unk_0A4, 0, 5, TEXT_SPEED_INSTANT, MAKE_TEXT_COLOR(1, 2, 0), NULL);
        ScheduleBgTilemapBufferTransfer(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_1);
    }
    if (sp10 == NULL) {
        for (i = 0; i < 4; ++i) {
            Sprite_SetDrawFlag(r4[i + 20].sprite, FALSE);
            ov101_021EADC0(mapApp, i, 0xFFFF);
        }
    } else {
        for (i = 0; i < 4; ++i) {
            if (sp10->unk_00.unk_4[i] == 15) {
                Sprite_SetDrawFlag(r4[i + 20].sprite, FALSE);
            } else {
                Sprite_SetAnimationFrame(r4[i + 20].sprite, sp10->unk_00.unk_4[i]);
                Sprite_SetDrawFlag(r4[i + 20].sprite, TRUE);
            }
            ov101_021EADC0(mapApp, i, sp10->unk_00.unk_8[i]);
        }
    }
}

void ov101_021EAF40(PokegearMapAppData *mapApp) {
    int i;
    const UnkStruct_ov101_021F79B4 *r4;

    CopyToBgTilemapRect(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_3, 0, 0, 47, 20, mapApp->unk_170->rawData, 0, 0, mapApp->unk_170->screenWidth / 8, mapApp->unk_170->screenHeight / 8);

    switch (mapApp->unk_138_5) {
    case 0:
        CopyToBgTilemapRect(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_3, 22, 0, 6, 20, mapApp->unk_170->rawData, 48, 0, mapApp->unk_170->screenWidth / 8, mapApp->unk_170->screenHeight / 8);
        break;
    case 1:
        CopyToBgTilemapRect(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_3, 29, 0, 3, 20, mapApp->unk_170->rawData, 54, 0, mapApp->unk_170->screenWidth / 8, mapApp->unk_170->screenHeight / 8);
        break;
    }

    for (i = 0; i < 27; ++i) {
        r4 = &ov101_021F79B4[i];
        if (r4->unk_00 == MAP_CIANWOOD) {
            continue;
        }
        if (r4->unk_05 == 0xFF) {
            continue;
        }
        if (mapApp->unk_138_5 < 2 && !ov100_021E5C50(r4->unk_06, r4->unk_07)) {
            continue;
        }
        if (Save_VarsFlags_FlypointFlagAction(mapApp->pokegear->saveVarsFlags, FLAG_ACTION_CHECK, r4->unk_04)) {
            continue;
        }
        CopyToBgTilemapRect(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_3, r4->unk_06 - r4->unk_0C_0, r4->unk_07 - r4->unk_0C_4 + 2, r4->unk_0B_0, r4->unk_0B_4, mapApp->unk_170->rawData, r4->unk_08, r4->unk_09, mapApp->unk_170->screenWidth / 8, mapApp->unk_170->screenHeight / 8);
    }

    if (mapApp->unk_13D_1) {
        if (!mapApp->unk_13D_0) {
            CopyToBgTilemapRect(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_3, 1, 9, 5, 6, mapApp->unk_170->rawData, 48, 27, mapApp->unk_170->screenWidth / 8, mapApp->unk_170->screenHeight / 8);
        }
    } else if (mapApp->unk_13D_0) {
        CopyToBgTilemapRect(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_3, 1, 9, 5, 6, mapApp->unk_170->rawData, 41, 20, mapApp->unk_170->screenWidth / 8, mapApp->unk_170->screenHeight / 8);
    } else {
        CopyToBgTilemapRect(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_3, 1, 9, 5, 6, mapApp->unk_170->rawData, 41, 27, mapApp->unk_170->screenWidth / 8, mapApp->unk_170->screenHeight / 8);
    }
    if (mapApp->unk_13D_2) {
        CopyToBgTilemapRect(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_3, 19, 1, 3, 4, mapApp->unk_170->rawData, 55, 20, mapApp->unk_170->screenWidth / 8, mapApp->unk_170->screenHeight / 8);
    }
    if (mapApp->unk_13D_3) {
        CopyToBgTilemapRect(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_3, 24, 15, 3, 3, mapApp->unk_170->rawData, 55, 24, mapApp->unk_170->screenWidth / 8, mapApp->unk_170->screenHeight / 8);
    }
}

void ov101_021EB1E0(PokegearMapAppData *mapApp, u8 a1) {
    int i;
    u16 r2;
    u16 r7;
    const PokegearMapAppData_Sub214 *r0;

    if (mapApp->unk_00D == 1) {
        return;
    }

    if (a1 == 0 || mapApp->unk_118.unk_0 == NULL) {
        BgClearTilemapBufferAndCommit(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_2);
        ScheduleBgTilemapBufferTransfer(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_2);
        mapApp->unk_152 = 0;
        return;
    }

    if (mapApp->unk_118.unk_0->unk_0 == mapApp->unk_152) {
        return;
    }
    mapApp->unk_152 = mapApp->unk_118.unk_0->unk_0;
    BgClearTilemapBufferAndCommit(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_2);

    for (i = 0; i < mapApp->unk_136; ++i) {
        if (mapApp->unk_118.unk_0->unk_0 != mapApp->unk_214[i].unk_0) {
            continue;
        }
        r0 = &mapApp->unk_214[i];
        if (r0->unk_E * r0->unk_F >= 9) {
            r2 = r0->unk_2 - 1;
            r7 = r0->unk_3 - 1;
        } else {
            r2 = r0->unk_2;
            r7 = r0->unk_3;
        }
        CopyToBgTilemapRect(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_2, r2, r7, r0->unk_E, r0->unk_F, mapApp->unk_170->rawData, r0->unk_C, r0->unk_D, mapApp->unk_170->screenWidth / 8, mapApp->unk_170->screenHeight / 8);
    }
    ScheduleBgTilemapBufferTransfer(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_2);
}

void ov101_021EB2D8(PokegearMapAppData *mapApp) {
    Sprite_SetDrawFlag(mapApp->unk_084->unk_08[5].sprite, FALSE);
    mapApp->unk_139_3 = FALSE;
}

void ov101_021EB2FC(void *appData) {
    PokegearMapAppData *mapApp = appData;

    PokegearAppSwitchCursor_SetCursorSpritesDrawState(mapApp->pokegear->appSwitch, 0, FALSE);
    ov101_021E94C0(mapApp);
    Sprite_SetDrawFlag(mapApp->unk_084->unk_08[5].sprite, TRUE);
    ov101_021EB1E0(mapApp, 1);
    ToggleBgLayer(GF_BG_LYR_MAIN_2, GF_PLANE_TOGGLE_ON);
}

void ov101_021EB338(void *appData) {
    PokegearMapAppData *mapApp = appData;

    ov101_021E94C0(mapApp);
    Sprite_SetDrawFlag(mapApp->unk_084->unk_08[5].sprite, TRUE);
    mapApp->unk_139_3 = FALSE;
}

void ov101_021EB364(void *appData) {
    PokegearMapAppData *mapApp = appData;

    PokegearAppSwitchCursor_SetCursorSpritesDrawState(mapApp->pokegear->appSwitch, 0xFFFF, FALSE);
}

void ov101_021EB378(void *appData) {
    PokegearMapAppData *mapApp = appData;

    PokegearAppSwitchCursor_SetCursorSpritesDrawState(mapApp->pokegear->appSwitch, 0xFFFF, TRUE);
}

void ov101_021EB38C(PokegearMapAppData *mapApp, BOOL a1, int a2) {
    if (!a1) {
        CopyToBgTilemapRect(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_1, 26, 2, 6, 7, mapApp->unk_178->rawData, 6 * a2, 21, mapApp->unk_178->screenWidth / 8, mapApp->unk_178->screenHeight / 8);
    } else {
        CopyToBgTilemapRect(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_1, 26, 11, 6, 9, mapApp->unk_178->rawData, 6 * a2 + 18, 21, mapApp->unk_178->screenWidth / 8, mapApp->unk_178->screenHeight / 8);
    }
    ScheduleBgTilemapBufferTransfer(mapApp->pokegear->bgConfig, GF_BG_LYR_MAIN_1);
}

void ov101_021EB428(PokegearMapAppData *mapApp, u32 a1) {
    TouchscreenListMenuHeader spC;

    MI_CpuClear8(&spC, sizeof(TouchscreenListMenuHeader));

    spC.template = ov101_021F7E80;
    spC.listMenuItems = mapApp->unk_0C0;
    spC.bgConfig = mapApp->pokegear->bgConfig;
    spC.numWindows = 2;
    if (a1 < 8 || a1 > 15) {
        mapApp->unk_0C4 = TouchscreenListMenu_Create(mapApp->unk_0BC, &spC, mapApp->pokegear->menuInputState, 11, 4, 0, 0);
    } else {
        mapApp->unk_0C4 = TouchscreenListMenu_Create(mapApp->unk_0BC, &spC, mapApp->pokegear->menuInputState, 3, 4, 0, 0);
    }
}

void ov101_021EB4C4(PokegearMapAppData *mapApp, int a1) {
    FillWindowPixelBuffer(&mapApp->unk_184[7], 0);
    if (a1 < 0) {
        AddTextPrinterParameterizedWithColor(&mapApp->unk_184[7], 0, mapApp->unk_0A8, 8, 0, TEXT_SPEED_INSTANT, MAKE_TEXT_COLOR(3, 2, 0), NULL);
    } else {
        ov101_021EB560(a1, mapApp->heapId, mapApp->unk_0A4);
        BufferString(mapApp->unk_08C, 0, mapApp->unk_0A4, 0, 0, 2);
        StringExpandPlaceholders(mapApp->unk_08C, mapApp->unk_090, mapApp->unk_0AC);
        AddTextPrinterParameterizedWithColor(&mapApp->unk_184[7], 0, mapApp->unk_090, 8, 0, TEXT_SPEED_INSTANT, MAKE_TEXT_COLOR(3, 2, 0), NULL);
    }
}

void ov101_021EB560(u16 a0, HeapID a1, String *a2) {
    sub_02068F98(a0, a1, a2);
}
