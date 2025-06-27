#include "global.h"

#include "application/pokegear/map/pokegear_map_internal.h"

void ov101_021E9288(PokegearMapAppData *mapApp);
void ov101_021E93D0(PokegearMapAppData *mapApp);
void ov101_021E9464(PokegearMapAppData *mapApp, s16 a1, s16 a2, u16 *a3, u16 *a4);
void ov101_021E94C0(PokegearMapAppData *mapApp);
void ov101_021E9530(PokegearMapAppData *mapApp, u8 a1, u16 a2, u16 a3, s16 a4, s16 a5);
void ov101_021E9848(PokegearMapAppData *mapApp, u16 a1, u16 a2, s16 a3, s16 a4, int *a5, int *a6);
void ov101_021E990C(PokegearMapAppData *mapApp);
void ov101_021E9BF4(PokegearMapAppData *mapApp, s16 a1, s16 a2);
const PokegearMapAppData_Sub214 *ov101_021EA758(PokegearMapAppData *mapApp, u16 a1);

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
    mapApp->unk_014.unk_0C = mapApp->unk_084->unk_08[5].unk_04;
    mapApp->unk_014.unk_0E = mapApp->unk_084->unk_08[5].unk_06;
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
    mapApp->unk_084->unk_08[5].unk_04 = mapApp->unk_014.unk_0C;
    mapApp->unk_084->unk_08[5].unk_06 = mapApp->unk_014.unk_0E;
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
            mapApp->unk_084->unk_08[r2].unk_04 = spC;
            mapApp->unk_084->unk_08[r2].unk_06 = r0;
            if (ov101_021ED614(mapApp, r1->unk_0)) {
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
            mapApp->unk_084->unk_08[r2].unk_04 = spC;
            mapApp->unk_084->unk_08[r2].unk_06 = r0;
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
