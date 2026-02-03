#include "unk_02097268.h"

#include "constants/buildmodel.h"

#include "overlay_2/overlay_02_gear_phone.h"

#include "gf_gfx_loader.h"
#include "sys_flags.h"

typedef struct SafariZoneAreaEncounterSlot {
    u16 species;
    u16 level;
} SafariZoneAreaEncounterSlot;

typedef struct SafariZoneAreaBonusSlotUnlockConditions {
    u8 object1_type;
    u8 object1_level;
    u8 object2_type;
    u8 object2_level;
} SafariZoneAreaBonusSlotUnlockConditions;

typedef struct SafariZoneObjectLevels {
    u8 levels[4];
    u8 count[4];
} SafariZoneObjectLevels;

typedef struct LoadedSafariZoneEncounterData {
    SafariZoneAreaEncounterSlot *baseMons;
    SafariZoneAreaEncounterSlot *bonusMons;
    SafariZoneAreaBonusSlotUnlockConditions *unlockConditions;
    int bonusMonsArraySize;
    u8 numBonusMons;
} LoadedSafariZoneEncounterData;

static BOOL encSlotsEqual(const ENC_SLOT *a, const ENC_SLOT *b);
static BOOL encSlotArraysEqual(const ENC_SLOT *a, const ENC_SLOT *b);
static BOOL areaIsInArray(u8 areaNum, const u8 *areas, u8 numAreas);
static u8 getObjectLevelBoost(u8 days, u8 objectType);
static void SafariZoneAreaSet_GetObjectsInArea(SAFARIZONE_AREASET *areaSet, int area, SafariZoneObjectLevels *out);

static const SafariObjectConfig sObjects[NUM_SAFARI_ZONE_OBJECT_IDS] = {
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

void GetSafariObjectConfig(SafariObjectConfig *dest, int idx, int gender) {
    if (idx >= NUM_SAFARI_ZONE_OBJECT_IDS) {
        GF_ASSERT(FALSE);
        idx = 0;
    }
    *dest = sObjects[idx];
    if (dest->hasGenderedLayout && gender == TRAINER_FEMALE) {
        ++dest->unk_0;
    }
}

static BOOL encSlotsEqual(const ENC_SLOT *a, const ENC_SLOT *b) {
    if (a->species != b->species || a->level_max != b->level_max || a->level_min != b->level_min) {
        return FALSE;
    }

    return TRUE;
}

static BOOL encSlotArraysEqual(const ENC_SLOT *a, const ENC_SLOT *b) {
    for (int i = 0; i < NUM_ENCOUNTERS_SAFARI; ++i) {
        if (!encSlotsEqual(&a[i], &b[i])) {
            return FALSE;
        }
    }

    return TRUE;
}

static BOOL areaIsInArray(u8 areaNum, const u8 *areas, u8 numAreas) {
    for (int i = 0; i < numAreas; ++i) {
        if (areas[i] == areaNum) {
            return TRUE;
        }
    }

    return FALSE;
}

void SaveData_SafariZone_CheckAreasWithUpdatedEncounters(SaveData *saveData, int daysElapsed) {
    int i;
    int j;
    int numAreas;
    ENC_SLOT *allEncounterSlots[SAFARI_ZONE_MAX_AREAS_PER_SET][NUM_SAFARI_ENCOUNTER_TYPES];
    ENC_SLOT *encounters;
    u8 areas[SAFARI_ZONE_MAX_AREAS_PER_SET];
    PhoneCallPersistentState *callPersistentState = SaveData_GetPhoneCallPersistentState(saveData);
    SafariZone *safariZone = Save_SafariZone_Get(saveData);
    SAFARIZONE_AREASET *areaSet = SafariZone_GetAreaSet(safariZone, 0);

    static const u16 ffff = 0xFFFF;

    if (SafariZone_GetObjectUnlockLevel(safariZone) == 0 || daysElapsed <= 0) {
        return;
    }

    if (Save_VarsFlags_CheckSafariSysFlag(Save_VarsFlags_Get(saveData))) {
        int zoneLevel = SafariZone_GetLevel(safariZone);
        SafariZone_SetLevel(safariZone, zoneLevel + daysElapsed);
        return;
    }

    numAreas = 0;
    MI_CpuClear8(areas, sizeof(areas));
    MI_CpuClear8(allEncounterSlots, sizeof(allEncounterSlots));
    for (i = 0; i < SAFARI_ZONE_MAX_AREAS_PER_SET; ++i) {
        // (((ffff >> i) & 1) * 4) + 1
        // fancy way of saying
        // mapHasWater ? 5 : 1
        for (j = 0; j < (((ffff >> i) & 1) * 4) + 1; ++j) {
            allEncounterSlots[i][j] = SafariZoneAreaSet_LoadAreaEncounters(areaSet, i, j, TIMEOFDAY_WILD_MORN, HEAP_ID_FIELD2);
        }
    }
    SafariZone_AddToAllAreaLevels(safariZone, daysElapsed);
    for (i = 0; i < SAFARI_ZONE_MAX_AREAS_PER_SET; ++i) {
        u8 areaNum = areaSet->areas[i].area_no;
        if (areaIsInArray(areaNum, areas, numAreas)) {
            continue;
        }
        for (j = 0; j < (((ffff >> i) & 1) * 4) + 1; ++j) {
            encounters = SafariZoneAreaSet_LoadAreaEncounters(areaSet, i, j, TIMEOFDAY_WILD_MORN, HEAP_ID_FIELD2);
            if (encSlotArraysEqual(allEncounterSlots[i][j], encounters)) {
                Heap_Free(encounters);
                continue;
            }
            if (!areaIsInArray(areaNum, areas, numAreas)) {
                areas[numAreas++] = areaNum;
            }
            Heap_Free(encounters);
        }
    }
    for (i = 0; i < SAFARI_ZONE_MAX_AREAS_PER_SET; ++i) {
        for (j = 0; j < (((ffff >> i) & 1) * 4) + 1; ++j) {
            if (allEncounterSlots[i][j] != NULL) {
                Heap_Free(allEncounterSlots[i][j]);
            }
        }
    }
    if (numAreas == 0) {
        PhoneCallPersistentState_ClearCallTriggerFlag(callPersistentState, CALL_TRIGGER_BAOBA_NEW_POKEMON);
        PhoneCallPersistentState_SafariZoneArrangement_Set(callPersistentState, NULL, 0);
    } else {
        PhoneCallPersistentState_SetCallTriggerFlag(callPersistentState, CALL_TRIGGER_BAOBA_NEW_POKEMON);
        PhoneCallPersistentState_SafariZoneArrangement_Set(callPersistentState, areas, numAreas);
    }
}

ENC_SLOT *SafariZoneAreaSet_LoadAreaEncounters(SAFARIZONE_AREASET *areaSet, int area, int encounterType, TimeOfDayWildParam timeOfDay, enum HeapID heapID) {
    int i;
    int offset;
    u8 *encDataArc;
    ENC_SLOT *ret;
    SAFARIZONE_AREA *safariZoneArea;
    LoadedSafariZoneEncounterData *loadedEncData;
    u32 lcl_heapID; // required to match

    safariZoneArea = &areaSet->areas[area];
    lcl_heapID = heapID;
    ret = Heap_AllocAtEnd((enum HeapID)lcl_heapID, NUM_ENCOUNTERS_SAFARI * sizeof(ENC_SLOT));

    for (i = 0; i < NUM_ENCOUNTERS_SAFARI; ++i) {
        if (encounterType == SAFARI_ENCOUNTER_SLOTS_LAND) {
            ret[i].species = SPECIES_RATTATA;
        } else {
            ret[i].species = SPECIES_MAGIKARP;
        }
        ret[i].level_max = ret[i].level_min = 5;
    }

    encDataArc = GfGfxLoader_LoadFromNarc(NARC_a_2_3_0, safariZoneArea->area_no, FALSE, (enum HeapID)lcl_heapID, TRUE);
    if (encDataArc == NULL) {
        return ret;
    }

    loadedEncData = Heap_AllocAtEnd((enum HeapID)lcl_heapID, NUM_SAFARI_ENCOUNTER_TYPES * sizeof(LoadedSafariZoneEncounterData));
    offset = 8;
    for (i = 0; i < NUM_SAFARI_ENCOUNTER_TYPES; ++i) {
        loadedEncData[i].baseMons = (SafariZoneAreaEncounterSlot *)&encDataArc[offset];
        offset += TIMEOFDAY_WILD_MAX * NUM_ENCOUNTERS_SAFARI * sizeof(SafariZoneAreaEncounterSlot);
        loadedEncData[i].bonusMons = (SafariZoneAreaEncounterSlot *)&encDataArc[offset];
        loadedEncData[i].numBonusMons = encDataArc[i];
        loadedEncData[i].bonusMonsArraySize = loadedEncData[i].numBonusMons * sizeof(SafariZoneAreaEncounterSlot);
        offset += TIMEOFDAY_WILD_MAX * loadedEncData[i].bonusMonsArraySize;
        loadedEncData[i].unlockConditions = (SafariZoneAreaBonusSlotUnlockConditions *)&encDataArc[offset];
        offset += loadedEncData[i].numBonusMons * sizeof(SafariZoneAreaBonusSlotUnlockConditions);
    }
    if (loadedEncData[1].numBonusMons == 0 && encounterType > 0) {
        Heap_Free(loadedEncData);
        Heap_Free(encDataArc);
        return ret;
    }
    offset = NUM_ENCOUNTERS_SAFARI * timeOfDay;
    for (i = 0; i < NUM_ENCOUNTERS_SAFARI; ++i) {
        SafariZoneAreaEncounterSlot *slot = &loadedEncData[encounterType].baseMons[offset + i];
        ret[i].species = slot->species;
        ret[i].level_max = ret[i].level_min = slot->level;
    }

    {
        SafariZoneObjectLevels areaObjects;
        u8 numBonusMons = 0;
        SafariZoneAreaSet_GetObjectsInArea(areaSet, area, &areaObjects);
        for (i = 0; i < loadedEncData[encounterType].numBonusMons; ++i) {
            int idx;
            SafariZoneAreaBonusSlotUnlockConditions *unlockConditions = &loadedEncData[encounterType].unlockConditions[i];
            if (areaObjects.levels[unlockConditions->object1_type - 1] < unlockConditions->object1_level) {
                continue;
            }
            if (unlockConditions->object2_type != 0 && areaObjects.levels[unlockConditions->object2_type - 1] < unlockConditions->object2_level) {
                continue;
            }
            idx = loadedEncData[encounterType].numBonusMons * timeOfDay + i;
            ret[numBonusMons].species = loadedEncData[encounterType].bonusMons[idx].species;
            ret[numBonusMons].level_max = ret[numBonusMons].level_min = loadedEncData[encounterType].bonusMons[idx].level;
            if (++numBonusMons > NUM_ENCOUNTERS_SAFARI - 1) {
                break;
            }
        }
    }
    Heap_Free(loadedEncData);
    Heap_Free(encDataArc);
    return ret;
}

static const u8 sObjectLevelBoosts[][5] = {
    [SAFARI_ZONE_OBJECT_TYPE_PLAINS - 1] = { 1, 5, 10, 15, 20 },
    [SAFARI_ZONE_OBJECT_TYPE_FOREST - 1] = { 2, 6, 11, 16, 21 },
    [SAFARI_ZONE_OBJECT_TYPE_PEAK - 1] = { 3, 7, 12, 17, 22 },
    [SAFARI_ZONE_OBJECT_TYPE_WATER - 1] = { 4, 8, 13, 18, 23 },
};

static u8 getObjectLevelBoost(u8 days, u8 objectType) {
    if (objectType == SAFARI_ZONE_OBJECT_TYPE_NONE) {
        return 0;
    }
    for (int i = 0; i < 5; ++i) {
        if (days < sObjectLevelBoosts[objectType - 1][i]) {
            return i + 1;
        }
    }
    if (days < 25) {
        return 6;
    }
    return 7;
}

static void SafariZoneAreaSet_GetObjectsInArea(SAFARIZONE_AREASET *areaSet, int area, SafariZoneObjectLevels *out) {
    SafariObjectConfig sp8;
    u8 areaLevel;
    SAFARIZONE_AREA *szArea;

    szArea = &areaSet->areas[area];
    areaLevel = areaSet->areaLevels[szArea->area_no] / 10;

    MI_CpuClear8(out, sizeof(SafariZoneObjectLevels));

    for (int i = 0; i < szArea->active_object_count; ++i) {
        GetSafariObjectConfig(&sp8, szArea->objects[i].unk[0], 2);
        if (sp8.objectType == SAFARI_ZONE_OBJECT_TYPE_NONE) {
            continue;
        }
        ++out->count[sp8.objectType - 1];
        u8 attrBonus = getObjectLevelBoost(areaLevel, sp8.objectType);
        if (out->levels[sp8.objectType - 1] + attrBonus > 255) {
            out->levels[sp8.objectType - 1] = 255;
        } else {
            out->levels[sp8.objectType - 1] += attrBonus;
        }
    }
}
