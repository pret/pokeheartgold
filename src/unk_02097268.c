#include "unk_02097268.h"

#include "gf_gfx_loader.h"
#include "sys_flags.h"

typedef struct SafariZoneAreaEncounterSlot {
    u16 species;
    u16 level;
} SafariZoneAreaEncounterSlot;

typedef struct UnkStruct_020874C4_sub8 {
    u8 unk_0;
    u8 unk_1;
    u8 unk_2;
    u8 unk_3;
} UnkStruct_020874C4_sub8;

typedef struct UnkStruct_02097694 {
    u8 unk_0[4];
    u8 unk_4[4];
} UnkStruct_02097694;

typedef struct UnkStruct_020874C4 {
    SafariZoneAreaEncounterSlot *unk_00;
    SafariZoneAreaEncounterSlot *unk_04;
    UnkStruct_020874C4_sub8 *unk_08;
    int unk_0C;
    u8 unk_10;
} UnkStruct_020874C4;

BOOL sub_020972A4(const ENC_SLOT *a, const ENC_SLOT *b);
BOOL sub_020972C4(const ENC_SLOT *a, const ENC_SLOT *b);
BOOL sub_020972EC(u8 a0, const u8 *a1, u8 a2);
u8 sub_02097650(u8 a0, u8 a1);
void sub_02097694(SAFARIZONE_AREASET *areaSet, int area, UnkStruct_02097694 *out);

static const UnkStruct_02097268 _02108EEE[24] = {
    { 0xBD, 0x12, 0, 1 },
    { 0xBE, 0x12, 0, 1 },
    { 0xBF, 0x12, 0, 1 },
    { 0xC0, 0x24, 0, 2 },
    { 0xC1, 0x24, 0, 2 },
    { 0xC2, 0x24, 0, 2 },
    { 0xC3, 0x12, 0, 3 },
    { 0xC4, 0x24, 0, 3 },
    { 0xC5, 0x24, 0, 3 },
    { 0xC6, 0x24, 0, 4 },
    { 0xC7, 0x25, 0, 4 },
    { 0xC8, 0x24, 0, 4 },
    { 0xC9, 0x14, 0, 0 },
    { 0xCA, 0x12, 0, 0 },
    { 0xCB, 0x12, 0, 0 },
    { 0xCC, 0x14, 0, 0 },
    { 0xCD, 0x22, 0, 0 },
    { 0xCE, 0x12, 0, 0 },
    { 0xCF, 0x12, 1, 0 },
    { 0xD1, 0x12, 1, 0 },
    { 0xD3, 0x12, 0, 0 },
    { 0xD4, 0x12, 0, 0 },
    { 0xD5, 0x12, 0, 0 },
    { 0xD6, 0x12, 0, 0 },
};

static const u8 _02108EDA[][5] = {
    { 1, 5, 10, 15, 20 },
    { 2, 6, 11, 16, 21 },
    { 3, 7, 12, 17, 22 },
    { 4, 8, 13, 18, 23 },
};

void sub_02097268(UnkStruct_02097268 *a0, int a1, BOOL a2) {
    if (a1 >= 24) {
        GF_ASSERT(FALSE);
        a1 = 0;
    }
    *a0 = _02108EEE[a1];
    if (a0->unk_1_7 && a2 == TRUE) {
        ++a0->unk_0;
    }
}

BOOL sub_020972A4(const ENC_SLOT *a, const ENC_SLOT *b) {
    if (a->species != b->species || a->level_max != b->level_max || a->level_min != b->level_min) {
        return FALSE;
    }

    return TRUE;
}

BOOL sub_020972C4(const ENC_SLOT *a, const ENC_SLOT *b) {
    for (int i = 0; i < NUM_ENCOUNTERS_SAFARI; ++i) {
        if (!sub_020972A4(&a[i], &b[i])) {
            return FALSE;
        }
    }

    return TRUE;
}

BOOL sub_020972EC(u8 a0, const u8 *a1, u8 a2) {
    for (int i = 0; i < a2; ++i) {
        if (a1[i] == a0) {
            return TRUE;
        }
    }

    return FALSE;
}

void sub_0209730C(SaveData *saveData, int a1) {
    int i;
    int j;
    int sp20;
    ENC_SLOT *sp38[6][5];
    ENC_SLOT *r6;
    u8 sp30[6];
    PhoneCallPersistentState *sp2C = SaveData_GetPhoneCallPersistentState(saveData);
    SafariZone *sp28 = Save_SafariZone_Get(saveData);
    SAFARIZONE_AREASET *sp24 = SafariZone_GetAreaSet(sp28, 0);

    static const u16 ffff = 0xFFFF;

    if (SafariZone_GetObjectUnlockLevel(sp28) == 0 || a1 <= 0) {
        return;
    }

    if (Save_VarsFlags_CheckSafariSysFlag(Save_VarsFlags_Get(saveData))) {
        int r2 = sub_0202F6AC(sp28);
        sub_0202F6A0(sp28, r2 + a1);
        return;
    }

    sp20 = 0;
    MI_CpuClear8(sp30, sizeof(sp30));
    MI_CpuClear8(sp38, sizeof(sp38));
    for (i = 0; i < 6; ++i) {
        for (j = 0; j < (((ffff >> i) & 1) * 4) + 1; ++j) {
            sp38[i][j] = sub_020974C4(sp24, i, j, TIMEOFDAY_WILD_MORN, HEAP_ID_FIELD2);
        }
    }
    sub_0202F6B8(sp28, a1);
    for (i = 0; i < 6; ++i) {
        u8 r7 = sp24->areas[i].area_no;
        if (sub_020972EC(r7, sp30, sp20)) {
            continue;
        }
        for (j = 0; j < (((ffff >> i) & 1) * 4) + 1; ++j) {
            r6 = sub_020974C4(sp24, i, j, TIMEOFDAY_WILD_MORN, HEAP_ID_FIELD2);
            if (sub_020972C4(sp38[i][j], r6)) {
                Heap_Free(r6);
                continue;
            }
            if (!sub_020972EC(r7, sp30, sp20)) {
                sp30[sp20++] = r7;
            }
            Heap_Free(r6);
        }
    }
    for (i = 0; i < 6; ++i) {
        for (j = 0; j < (((ffff >> i) & 1) * 4) + 1; ++j) {
            if (sp38[i][j] != NULL) {
                Heap_Free(sp38[i][j]);
            }
        }
    }
    if (sp20 == 0) {
        sub_0202F050(sp2C, 6);
        PhoneCallPersistentState_SafariZoneArrangement_Set(sp2C, NULL, 0);
    } else {
        sub_0202F01C(sp2C, 6);
        PhoneCallPersistentState_SafariZoneArrangement_Set(sp2C, sp30, sp20);
    }
}

ENC_SLOT *sub_020974C4(SAFARIZONE_AREASET *areaSet, int area, int encounterType, TimeOfDayWildParam timeOfDay, enum HeapID heapID) {
    int i;
    int offset;
    u8 *r5;
    ENC_SLOT *sp20;
    SAFARIZONE_AREA *r7;
    UnkStruct_020874C4 *sp1C;
    u32 lcl_heapID; // required to match

    r7 = &areaSet->areas[area];
    lcl_heapID = heapID;
    sp20 = Heap_AllocAtEnd((enum HeapID)lcl_heapID, NUM_ENCOUNTERS_SAFARI * sizeof(ENC_SLOT));

    for (i = 0; i < NUM_ENCOUNTERS_SAFARI; ++i) {
        if (encounterType == SAFARI_ENCOUNTER_SLOTS_LAND) {
            sp20[i].species = SPECIES_RATTATA;
        } else {
            sp20[i].species = SPECIES_MAGIKARP;
        }
        sp20[i].level_max = sp20[i].level_min = 5;
    }

    r5 = GfGfxLoader_LoadFromNarc(NARC_a_2_3_0, r7->area_no, FALSE, (enum HeapID)lcl_heapID, TRUE);
    if (r5 == NULL) {
        return sp20;
    }

    sp1C = Heap_AllocAtEnd((enum HeapID)lcl_heapID, 5 * sizeof(UnkStruct_020874C4));
    offset = 8;
    for (i = 0; i < 5; ++i) {
        sp1C[i].unk_00 = (SafariZoneAreaEncounterSlot *)&r5[offset];
        offset += 3 * NUM_ENCOUNTERS_SAFARI * sizeof(SafariZoneAreaEncounterSlot);
        sp1C[i].unk_04 = (SafariZoneAreaEncounterSlot *)&r5[offset];
        sp1C[i].unk_10 = r5[i];
        sp1C[i].unk_0C = sp1C[i].unk_10 * sizeof(SafariZoneAreaEncounterSlot);
        offset += 3 * sp1C[i].unk_0C;
        sp1C[i].unk_08 = (UnkStruct_020874C4_sub8 *)&r5[offset];
        offset += sp1C[i].unk_10 * sizeof(UnkStruct_020874C4_sub8);
    }
    if (sp1C[1].unk_10 == 0 && encounterType > 0) {
        Heap_Free(sp1C);
        Heap_Free(r5);
        return sp20;
    }
    offset = NUM_ENCOUNTERS_SAFARI * timeOfDay;
    for (i = 0; i < NUM_ENCOUNTERS_SAFARI; ++i) {
        SafariZoneAreaEncounterSlot *r6 = &sp1C[encounterType].unk_00[offset + i];
        sp20[i].species = r6->species;
        sp20[i].level_max = sp20[i].level_min = r6->level;
    }

    {
        UnkStruct_02097694 sp2C;
        u8 sp18 = 0;
        sub_02097694(areaSet, area, &sp2C);
        for (i = 0; i < sp1C[encounterType].unk_10; ++i) {
            int idx;
            UnkStruct_020874C4_sub8 *r0;
            r0 = &sp1C[encounterType].unk_08[i];
            if (sp2C.unk_0[r0->unk_0 - 1] < r0->unk_1) {
                continue;
            }
            if (r0->unk_2 != 0 && sp2C.unk_0[r0->unk_2 - 1] < r0->unk_3) {
                continue;
            }
            idx = sp1C[encounterType].unk_10 * timeOfDay + i;
            sp20[sp18].species = sp1C[encounterType].unk_04[idx].species;
            sp20[sp18].level_max = sp20[sp18].level_min = sp1C[encounterType].unk_04[idx].level;
            if (++sp18 > NUM_ENCOUNTERS_SAFARI - 1) {
                break;
            }
        }
    }
    Heap_Free(sp1C);
    Heap_Free(r5);
    return sp20;
}

u8 sub_02097650(u8 a0, u8 a1) {
    if (a1 == 0) {
        return 0;
    }
    for (int i = 0; i < 5; ++i) {
        if (a0 < _02108EDA[a1 - 1][i]) {
            return i + 1;
        }
    }
    if (a0 < 25) {
        return 6;
    }
    return 7;
}
