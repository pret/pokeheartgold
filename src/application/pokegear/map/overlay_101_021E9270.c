#include "global.h"

#include "application/pokegear/map/pokegear_map_internal.h"

void ov101_021E9288(PokegearMapAppData *mapApp);
void ov101_021E93D0(PokegearMapAppData *mapApp);
void ov101_021E9464(PokegearMapAppData *mapApp, s16 a1, s16 a2, s16 *a3, s16 *a4);
void ov101_021E94C0(PokegearMapAppData *mapApp);

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

void ov101_021E9464(PokegearMapAppData *mapApp, s16 a1, s16 a2, s16 *a3, s16 *a4) {
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
