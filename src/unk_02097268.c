#include "unk_02097268.h"

#include "constants/buildmodel.h"

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
    u8 levels[4];
    u8 count[4];
} UnkStruct_02097694;

typedef struct UnkStruct_020874C4 {
    SafariZoneAreaEncounterSlot *unk_00;
    SafariZoneAreaEncounterSlot *unk_04;
    UnkStruct_020874C4_sub8 *unk_08;
    int unk_0C;
    u8 unk_10;
} UnkStruct_020874C4;

static BOOL sub_020972A4(const ENC_SLOT *a, const ENC_SLOT *b);
static BOOL sub_020972C4(const ENC_SLOT *a, const ENC_SLOT *b);
static BOOL sub_020972EC(u8 a0, const u8 *a1, u8 a2);
static u8 sub_02097650(u8 a0, u8 a1);
static void sub_02097694(SAFARIZONE_AREASET *areaSet, int area, UnkStruct_02097694 *out);

static const UnkStruct_02097268 _02108EEE[NUM_SAFARI_ZONE_OBJECT_IDS] = {
    [SAFARI_ZONE_OBJECTID_SHRUBBERY] = { BUILD_MODEL_SAF_GO01,  0, 1, 1, FALSE, SAFARI_ZONE_OBJECT_TYPE_PLAINS },
    [SAFARI_ZONE_OBJECTID_RED_FLOWER] = { BUILD_MODEL_SAF_GO02,  0, 1, 1, FALSE, SAFARI_ZONE_OBJECT_TYPE_PLAINS },
    [SAFARI_ZONE_OBJECTID_WHITE_FLOWER] = { BUILD_MODEL_SAF_GO03,  0, 1, 1, FALSE, SAFARI_ZONE_OBJECT_TYPE_PLAINS },
    [SAFARI_ZONE_OBJECTID_TREE] = { BUILD_MODEL_SAF_TO01,  0, 2, 2, FALSE, SAFARI_ZONE_OBJECT_TYPE_FOREST },
    [SAFARI_ZONE_OBJECTID_STUMP] = { BUILD_MODEL_SAF_TO02,  0, 2, 2, FALSE, SAFARI_ZONE_OBJECT_TYPE_FOREST },
    [SAFARI_ZONE_OBJECTID_BRANCHES] = { BUILD_MODEL_SAF_TO03,  0, 2, 2, FALSE, SAFARI_ZONE_OBJECT_TYPE_FOREST },
    [SAFARI_ZONE_OBJECTID_SMALL_ROCK] = { BUILD_MODEL_SAF_RO01,  0, 1, 1, FALSE, SAFARI_ZONE_OBJECT_TYPE_PEAK   },
    [SAFARI_ZONE_OBJECTID_BIG_ROCK] = { BUILD_MODEL_SAF_RO02,  0, 2, 2, FALSE, SAFARI_ZONE_OBJECT_TYPE_PEAK   },
    [SAFARI_ZONE_OBJECTID_MOSSY_ROCK] = { BUILD_MODEL_SAF_RO03,  0, 2, 2, FALSE, SAFARI_ZONE_OBJECT_TYPE_PEAK   },
    [SAFARI_ZONE_OBJECTID_PUDDLE] = { BUILD_MODEL_SAF_WO01,  0, 2, 2, FALSE, SAFARI_ZONE_OBJECT_TYPE_WATER  },
    [SAFARI_ZONE_OBJECTID_FOUNTAIN] = { BUILD_MODEL_SAF_WO02,  1, 2, 2, FALSE, SAFARI_ZONE_OBJECT_TYPE_WATER  },
    [SAFARI_ZONE_OBJECTID_WATER_HOLE] = { BUILD_MODEL_SAF_WO03,  0, 2, 2, FALSE, SAFARI_ZONE_OBJECT_TYPE_WATER  },
    [SAFARI_ZONE_OBJECTID_BENCH] = { BUILD_MODEL_SAF_EO01,  0, 2, 1, FALSE, SAFARI_ZONE_OBJECT_TYPE_NONE   },
    [SAFARI_ZONE_OBJECTID_SHORT_FENCE1] = { BUILD_MODEL_SAF_EO02,  0, 1, 1, FALSE, SAFARI_ZONE_OBJECT_TYPE_NONE   },
    [SAFARI_ZONE_OBJECTID_SHORT_FENCE2] = { BUILD_MODEL_SAF_EO03,  0, 1, 1, FALSE, SAFARI_ZONE_OBJECT_TYPE_NONE   },
    [SAFARI_ZONE_OBJECTID_LONG_FENCE1] = { BUILD_MODEL_SAF_EO04,  0, 2, 1, FALSE, SAFARI_ZONE_OBJECT_TYPE_NONE   },
    [SAFARI_ZONE_OBJECTID_LONG_FENCE2] = { BUILD_MODEL_SAF_EO05,  0, 1, 2, FALSE, SAFARI_ZONE_OBJECT_TYPE_NONE   },
    [SAFARI_ZONE_OBJECTID_SIGNBOARD] = { BUILD_MODEL_SAF_EO06,  0, 1, 1, FALSE, SAFARI_ZONE_OBJECT_TYPE_NONE   },
    [SAFARI_ZONE_OBJECTID_YOUR_STATUE] = { BUILD_MODEL_SAF_EO07M, 0, 1, 1, TRUE,  SAFARI_ZONE_OBJECT_TYPE_NONE   },
    [SAFARI_ZONE_OBJECTID_YOUR_FLAG] = { BUILD_MODEL_SAF_EO08M, 0, 1, 1, TRUE,  SAFARI_ZONE_OBJECT_TYPE_NONE   },
    [SAFARI_ZONE_OBJECTID_OUTSIDE_LAMP] = { BUILD_MODEL_SAF_EO09,  0, 1, 1, FALSE, SAFARI_ZONE_OBJECT_TYPE_NONE   },
    [SAFARI_ZONE_OBJECTID_GUIDEPOST_R_] = { BUILD_MODEL_SAF_EO10,  0, 1, 1, FALSE, SAFARI_ZONE_OBJECT_TYPE_NONE   },
    [SAFARI_ZONE_OBJECTID_GUIDEPOST_L_] = { BUILD_MODEL_SAF_EO11,  0, 1, 1, FALSE, SAFARI_ZONE_OBJECT_TYPE_NONE   },
    [SAFARI_ZONE_OBJECTID_TRASH_CAN] = { BUILD_MODEL_SAF_EO12,  0, 1, 1, FALSE, SAFARI_ZONE_OBJECT_TYPE_NONE   },
};

void sub_02097268(UnkStruct_02097268 *dest, int idx, int gender) {
    if (idx >= NUM_SAFARI_ZONE_OBJECT_IDS) {
        GF_ASSERT(FALSE);
        idx = 0;
    }
    *dest = _02108EEE[idx];
    if (dest->hasGenderedLayout && gender == TRAINER_FEMALE) {
        ++dest->unk_0;
    }
}

static BOOL sub_020972A4(const ENC_SLOT *a, const ENC_SLOT *b) {
    if (a->species != b->species || a->level_max != b->level_max || a->level_min != b->level_min) {
        return FALSE;
    }

    return TRUE;
}

static BOOL sub_020972C4(const ENC_SLOT *a, const ENC_SLOT *b) {
    for (int i = 0; i < NUM_ENCOUNTERS_SAFARI; ++i) {
        if (!sub_020972A4(&a[i], &b[i])) {
            return FALSE;
        }
    }

    return TRUE;
}

static BOOL sub_020972EC(u8 a0, const u8 *a1, u8 a2) {
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
            if (sp2C.levels[r0->unk_0 - 1] < r0->unk_1) {
                continue;
            }
            if (r0->unk_2 != 0 && sp2C.levels[r0->unk_2 - 1] < r0->unk_3) {
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

static const u8 _02108EDA[][5] = {
    [SAFARI_ZONE_OBJECT_TYPE_PLAINS - 1] = { 1, 5, 10, 15, 20 },
    [SAFARI_ZONE_OBJECT_TYPE_FOREST - 1] = { 2, 6, 11, 16, 21 },
    [SAFARI_ZONE_OBJECT_TYPE_PEAK - 1] = { 3, 7, 12, 17, 22 },
    [SAFARI_ZONE_OBJECT_TYPE_WATER - 1] = { 4, 8, 13, 18, 23 },
};

static u8 sub_02097650(u8 level, u8 attr) {
    if (attr == SAFARI_ZONE_OBJECT_TYPE_NONE) {
        return 0;
    }
    for (int i = 0; i < 5; ++i) {
        if (level < _02108EDA[attr - 1][i]) {
            return i + 1;
        }
    }
    if (level < 25) {
        return 6;
    }
    return 7;
}

static void sub_02097694(SAFARIZONE_AREASET *areaSet, int area, UnkStruct_02097694 *out) {
    UnkStruct_02097268 sp8;
    u8 areaLevel;
    SAFARIZONE_AREA *szArea;

    szArea = &areaSet->areas[area];
    areaLevel = areaSet->unk2DC[szArea->area_no] / 10;

    MI_CpuClear8(out, sizeof(UnkStruct_02097694));

    for (int i = 0; i < szArea->active_object_count; ++i) {
        sub_02097268(&sp8, szArea->objects[i].unk[0], 2);
        if (sp8.objectType == SAFARI_ZONE_OBJECT_TYPE_NONE) {
            continue;
        }
        ++out->count[sp8.objectType - 1];
        u8 attrBonus = sub_02097650(areaLevel, sp8.objectType);
        if (out->levels[sp8.objectType - 1] + attrBonus > 255) {
            out->levels[sp8.objectType - 1] = 255;
        } else {
            out->levels[sp8.objectType - 1] += attrBonus;
        }
    }
}
