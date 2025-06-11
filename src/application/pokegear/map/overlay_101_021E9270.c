#include "global.h"

#include "application/pokegear/map/pokegear_map_internal.h"

void ov101_021E9288(PokegearMapAppData *mapApp);
void ov101_021E93D0(PokegearMapAppData *mapApp);
void ov101_021E9464(PokegearMapAppData *mapApp, s16 a1, s16 a2, u16 *a3, u16 *a4);
void ov101_021E94C0(PokegearMapAppData *mapApp);
void ov101_021E9530(PokegearMapAppData *mapApp, u8 a1, u16 a2, u16 a3, s16 a4, s16 a5);
void ov101_021E9848(PokegearMapAppData *mapApp, u16 a1, u16 a2, s16 a3, s16 a4, int *a5, int *a6);

void ov101_021E9270(PokegearAppData *pokegear, void *appData) {
    PokegearMapAppData *mapApp = appData;

    if (mapApp->unk_138_7) {
        ov101_021E9B70(mapApp, &mapApp->unk_0C8);
    }
}

void ov101_021E9288(PokegearMapAppData *mapApp) {
    if (mapApp->unk_138_0) {
        mapApp->unk_0F0 = (mapApp->unk_0C8.unk_04 + mapApp->unk_0C8.unk_14 - 8) / 16 + 1;
        mapApp->unk_0F4 = (mapApp->unk_0C8.unk_00 + mapApp->unk_0C8.unk_10 - 8) / 16 + 1;
        mapApp->unk_0F2 = mapApp->unk_0F0 + 7;
        mapApp->unk_0F6 = mapApp->unk_0F4 + 11;
    } else {
        mapApp->unk_0F0 = (-mapApp->unk_0C8.unk_04) / 8 + 1;
        mapApp->unk_0F4 = mapApp->unk_0C8.unk_00 / 8 + 1;
        mapApp->unk_0F2 = mapApp->unk_0F0 + 16;
        mapApp->unk_0F6 = mapApp->unk_0F4 + 23;
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
    mapApp->unk_014.unk_04 = mapApp->unk_0F0;
    mapApp->unk_014.unk_05 = mapApp->unk_0F2;
    mapApp->unk_014.unk_06 = mapApp->unk_0F4;
    mapApp->unk_014.unk_07 = mapApp->unk_0F6;
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
    mapApp->unk_0F0 = mapApp->unk_014.unk_04;
    mapApp->unk_0F2 = mapApp->unk_014.unk_05;
    mapApp->unk_0F4 = mapApp->unk_014.unk_06;
    mapApp->unk_0F6 = mapApp->unk_014.unk_07;
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

    r5 = mapApp->unk_110 - mapApp->unk_0F4;
    r4 = mapApp->unk_112 - mapApp->unk_0F0;

    r5 = r5 * (8 * r1) + mapApp->unk_132 + 4 * r1;
    r4 = r4 * (8 * r1) + mapApp->unk_131 + 4 * r1;

    UnkStruct_ov100_021E6E20_Sub8_inline_sub(&mapApp->unk_084->unk_08[5], r5, r4);
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
    mapApp->unk_0F0 = sp08;
    mapApp->unk_0F2 = r6;
    mapApp->unk_0F4 = r3;
    mapApp->unk_0F6 = r5;
    mapApp->unk_0F8 = -(r2 * sp4);
    mapApp->unk_0FA = -(ip * sp4);
    mapApp->unk_0FC = mapApp->unk_0C8.unk_00 + mapApp->unk_0F8;
    mapApp->unk_0FE = mapApp->unk_0C8.unk_04 + mapApp->unk_0FA;
    mapApp->unk_0E8 = FX32_CONST(mapApp->unk_0C8.unk_00);
    mapApp->unk_0EC = FX32_CONST(mapApp->unk_0C8.unk_04);
    mapApp->unk_0E0 = FX_Div(FX32_CONST(mapApp->unk_0F8), FX32_CONST(mapApp->unk_13A));
    mapApp->unk_0E4 = FX_Div(FX32_CONST(mapApp->unk_0FA), FX32_CONST(mapApp->unk_13A));
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
