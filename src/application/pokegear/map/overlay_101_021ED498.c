#include "application/pokegear/map/pokegear_map_internal.h"

void ov101_021ED498(struct PokegearMapAppData_Sub218 *a0);
u8 ov101_021ED4B0(PokegearMapAppData *mapApp);

void ov101_021ED498(struct PokegearMapAppData_Sub218 *a0) {
    a0->unk_13 = 0;
    a0->unk_10 = a0->unk_11 = a0->unk_12 = 0xFF;
    sub_0202F3DC(&a0->unk_00);
}

u8 ov101_021ED4B0(PokegearMapAppData *mapApp) {
    u8 i;

    for (i = 0; i < 100; ++i) {
        if (mapApp->unk_218[i].unk_13 == 0) {
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

PokegearMapAppData_Sub218 *ov101_021ED614(PokegearMapAppData *mapApp, int a1) {
    u8 i;
    PokegearMapAppData_Sub218 *ret;

    if (a1 <= 0) {
        return NULL;
    }
    for (i = mapApp->unk_9F0; i != 0xFF; i = ret->unk_12) {
        ret = &mapApp->unk_218[i];
        if (ret->unk_00.unk_0 == a1) {
            return ret;
        }
    }
    return NULL;
}

PokegearMapAppData_Sub218 *ov101_021ED64C(PokegearMapAppData *mapApp, u16 a1) {
    u8 r0;
    PokegearMapAppData_Sub218 *ret;

    ret = ov101_021ED614(mapApp, a1);
    if (ret != NULL) {
        return ret;
    }
    r0 = ov101_021ED4B0(mapApp);
    if (r0 == 0xFF) {
        GF_ASSERT(FALSE);
        return NULL;
    }
    ret = &mapApp->unk_218[r0];
    ret->unk_10 = r0;
    ret->unk_13 = 1;
    ret->unk_00.unk_0 = a1;
    if (mapApp->unk_9F0 == 0xFF) {
        mapApp->unk_9F0 = mapApp->unk_9F1 = r0;
        ret->unk_11 = 0xFF;
    } else {
        mapApp->unk_218[mapApp->unk_9F1].unk_12 = r0;
        ret->unk_11 = mapApp->unk_9F1;
        mapApp->unk_9F1 = r0;
    }
    return ret;
}

BOOL ov101_021ED6B8(PokegearMapAppData *mapApp, PokegearMapAppData_Sub218 *a1) {
    if (a1 == NULL) {
        return FALSE;
    }
    if (a1->unk_10 == mapApp->unk_9F0) {
        if (a1->unk_12 == 0xFF) {
            mapApp->unk_9F0 = mapApp->unk_9F1 = 0xFF;
        } else {
            mapApp->unk_9F0 = mapApp->unk_218[a1->unk_12].unk_10;
            mapApp->unk_218[a1->unk_12].unk_11 = 0xFF;
        }
    } else if (a1->unk_10 == mapApp->unk_9F1) {
        mapApp->unk_218[a1->unk_11].unk_12 = 0xFF;
        mapApp->unk_9F1 = mapApp->unk_218[a1->unk_11].unk_10;
    } else {
        mapApp->unk_218[a1->unk_11].unk_12 = a1->unk_12;
        mapApp->unk_218[a1->unk_12].unk_11 = a1->unk_11;
    }
    ov101_021ED498(a1);
    return TRUE;
}

BOOL ov101_021ED750(PokegearMapAppData_Sub218 *a0, u8 a1, u8 a2) {
    if (a0 == NULL) {
        return FALSE;
    }
    a0->unk_00.unk_4[a1] = a2;
    return TRUE;
}

BOOL ov101_021ED760(PokegearMapAppData_Sub218 *a0, u8 a1) {
    if (a0 == NULL) {
        return FALSE;
    }
    a0->unk_00.unk_4[a1] = 15;
    if (sub_0202F400(&a0->unk_00)) {
        return TRUE;
    } else {
        return FALSE;
    }
}

BOOL ov101_021ED780(PokegearMapAppData_Sub218 *a0, u8 a1, u8 a2) {
    u8 tmp;
    if (a0 == NULL) {
        return FALSE;
    }
    tmp = a0->unk_00.unk_4[a1];
    a0->unk_00.unk_4[a1] = a0->unk_00.unk_4[a2];
    a0->unk_00.unk_4[a2] = tmp;
    return TRUE;
}

BOOL ov101_021ED79C(PokegearMapAppData_Sub218 *a0, u8 a1, u16 a2) {
    if (a0 == NULL) {
        return FALSE;
    }
    a0->unk_00.unk_8[a1] = a2;
    return TRUE;
}

BOOL ov101_021ED7B0(PokegearMapAppData_Sub218 *a0, u8 a1) {
    if (a0 == NULL) {
        return FALSE;
    }
    a0->unk_00.unk_8[a1] = EC_WORD_NULL;
    if (sub_0202F400(&a0->unk_00)) {
        return TRUE;
    } else {
        return FALSE;
    }
}

BOOL ov101_021ED7D8(PokegearMapAppData_Sub218 *a0, u8 a1, u8 a2) {
    u16 tmp;
    if (a0 == NULL) {
        return FALSE;
    }
    tmp = a0->unk_00.unk_8[a1];
    a0->unk_00.unk_8[a1] = a0->unk_00.unk_8[a2];
    a0->unk_00.unk_8[a2] = tmp;
    return TRUE;
}
