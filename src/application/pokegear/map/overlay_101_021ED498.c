#include "application/pokegear/map/pokegear_map_internal.h"

void ov101_021ED498(struct PokegearMapAppData_Sub218 *a0);
u8 ov101_021ED4B0(PokegearMapAppData *a0);

void ov101_021ED498(struct PokegearMapAppData_Sub218 *a0) {
    a0->unk_13 = 0;
    a0->unk_10 = a0->unk_11 = a0->unk_12 = 0xFF;
    sub_0202F3DC(&a0->unk_00);
}

u8 ov101_021ED4B0(PokegearMapAppData *a0) {
    u8 i;

    for (i = 0; i < 100; ++i) {
        if (a0->unk_218[i].unk_13 == 0) {
            return i;
        }
    }

    return -1;
}

void ov101_021ED4E0(PokegearMapAppData *mapApp) {
    u8 i;
    u8 r6;
    UnkPokegearSub8List *sp0;
    PokegearMapAppData_Sub218 *r4;

    sp0 = sub_0202EDF4(mapApp->pokegear->savePokegear);
    mapApp->unk_9F0 = mapApp->unk_9F1 = 0xFF;
    for (i = 0; i < 100; ++i) {
        ov101_021ED498(&mapApp->unk_218[i]);
    }

    r6 = 0;
    for (i = 0; i < 100; ++i) {
        if (!sub_0202F4E8(sp0, i)) {
            break;
        }
        r4 = &mapApp->unk_218[r6];
        sub_0202F514(sp0, &r4->unk_00, i);
        r4->unk_10 = r6;
        r4->unk_13 = 1;
        if (mapApp->unk_9F0 == 0xFF) {
            mapApp->unk_9F0 = r4->unk_10;
            mapApp->unk_9F1 = r4->unk_10;
            r4->unk_11 = 0xFF;
        } else {
            r4->unk_11 = mapApp->unk_9F1;
            mapApp->unk_218[mapApp->unk_9F1].unk_12 = r4->unk_10;
            mapApp->unk_9F1 = r4->unk_10;
        }
        ++r6;
    }
    mapApp->unk_9F2 = r6;
}

void ov101_021ED5AC(PokegearMapAppData *mapApp) {
    u8 i;
    u8 r5;
    UnkPokegearSub8List *r6;
    PokegearMapAppData_Sub218 *r4;

    r6 = sub_0202EDF4(mapApp->pokegear->savePokegear);
    r5 = 0;
    for (i = mapApp->unk_9F0; i != 0xFF; i = r4->unk_12) {
        r4 = &mapApp->unk_218[i];
        sub_0202F53C(r6, &r4->unk_00, r5++, TRUE);
    }
    for (i = r5; i < mapApp->unk_9F2; ++i) {
        sub_0202F500(r6, i);
    }
}
