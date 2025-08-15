#include "field_roamer.h"

#include "global.h"

#include "constants/maps.h"
#include "constants/species.h"

#include "math_util.h"
#include "player_data.h"
#include "pokemon.h"

#define MAX_ROAM_NEIGHBOR 6

struct RoamerAdjacency {
    u16 count;
    u16 neighbors[MAX_ROAM_NEIGHBOR];
};

static BOOL AreAnyRoamersActive(RoamerSaveData *roamer);
static void RoamerLocationSetRandom(RoamerSaveData *roamer, u8 roamer_idx, u32 last_loc);
static void RoamerLocationUpdateEx(RoamerSaveData *roamer, u8 roamer_idx, u32 last_loc);
static void ApplyRoamerLocation(RoamerSaveData *roamer, u8 roamer_idx, u8 new_loc, u32 new_mapno);

static const u32 sRoamerLocations[ROAMER_LOC_COUNT] = {
    // Johto
    MAP_ROUTE_29,
    MAP_ROUTE_30,
    MAP_ROUTE_31,
    MAP_ROUTE_32,
    MAP_ROUTE_33,
    MAP_ROUTE_34,
    MAP_ROUTE_35,
    MAP_ROUTE_36,
    MAP_ROUTE_37,
    MAP_ROUTE_38,
    MAP_ROUTE_39,
    MAP_ROUTE_42,
    MAP_ROUTE_43,
    MAP_ROUTE_44,
    MAP_ROUTE_45,
    MAP_ROUTE_46,

    // Kanto
    MAP_ROUTE_1,
    MAP_ROUTE_2,
    MAP_ROUTE_3,
    MAP_ROUTE_4,
    MAP_ROUTE_5,
    MAP_ROUTE_6,
    MAP_ROUTE_7,
    MAP_ROUTE_8,
    MAP_ROUTE_9,
    MAP_ROUTE_10,
    MAP_ROUTE_11,
    MAP_ROUTE_12,
    MAP_ROUTE_13,
    MAP_ROUTE_14,
    MAP_ROUTE_15,
    MAP_ROUTE_16,
    MAP_ROUTE_17,
    MAP_ROUTE_18,
    MAP_ROUTE_19,
    MAP_ROUTE_20,
    MAP_ROUTE_21,
    MAP_ROUTE_22,
    MAP_ROUTE_24,
    MAP_ROUTE_26,
    MAP_ROUTE_28,
};

static const struct RoamerAdjacency sRoamerAdjacencyTable[ROAMER_LOC_COUNT] = {
    // Johto
    { 2, { ROAMER_LOC_R30, ROAMER_LOC_R46, -1, -1, -1, -1 }                                                 },
    { 2, { ROAMER_LOC_R29, ROAMER_LOC_R31, -1, -1, -1, -1 }                                                 },
    { 3, { ROAMER_LOC_R30, ROAMER_LOC_R32, ROAMER_LOC_R36, -1, -1, -1 }                                     },
    { 3, { ROAMER_LOC_R31, ROAMER_LOC_R33, ROAMER_LOC_R36, -1, -1, -1 }                                     },
    { 2, { ROAMER_LOC_R32, ROAMER_LOC_R34, -1, -1, -1, -1 }                                                 },
    { 2, { ROAMER_LOC_R33, ROAMER_LOC_R35, -1, -1, -1, -1 }                                                 },
    { 2, { ROAMER_LOC_R34, ROAMER_LOC_R36, -1, -1, -1, -1 }                                                 },
    { 3, { ROAMER_LOC_R31, ROAMER_LOC_R32, ROAMER_LOC_R37, -1, -1, -1 }                                     },
    { 3, { ROAMER_LOC_R36, ROAMER_LOC_R38, ROAMER_LOC_R42, -1, -1, -1 }                                     },
    { 3, { ROAMER_LOC_R37, ROAMER_LOC_R39, ROAMER_LOC_R42, -1, -1, -1 }                                     },
    { 1, { ROAMER_LOC_R38, -1, -1, -1, -1, -1 }                                                             },
    { 4, { ROAMER_LOC_R37, ROAMER_LOC_R38, ROAMER_LOC_R43, ROAMER_LOC_R44, -1, -1 }                         },
    { 2, { ROAMER_LOC_R42, ROAMER_LOC_R44, -1, -1, -1, -1 }                                                 },
    { 3, { ROAMER_LOC_R42, ROAMER_LOC_R43, ROAMER_LOC_R46, -1, -1, -1 }                                     },
    { 2, { ROAMER_LOC_R44, ROAMER_LOC_R46, -1, -1, -1, -1 }                                                 },
    { 2, { ROAMER_LOC_R29, ROAMER_LOC_R45, -1, -1, -1, -1 }                                                 },

    // Kanto
    { 2, { ROAMER_LOC_R02, ROAMER_LOC_R22, -1, -1, -1, -1 }                                                 },
    { 3, { ROAMER_LOC_R01, ROAMER_LOC_R22, ROAMER_LOC_R03, -1, -1, -1 }                                     },
    { 2, { ROAMER_LOC_R02, ROAMER_LOC_R04, -1, -1, -1, -1 }                                                 },
    { 3, { ROAMER_LOC_R03, ROAMER_LOC_R05, ROAMER_LOC_R24, -1, -1, -1 }                                     },
    { 6, { ROAMER_LOC_R04, ROAMER_LOC_R06, ROAMER_LOC_R07, ROAMER_LOC_R08, ROAMER_LOC_R09, ROAMER_LOC_R24 } },
    { 3, { ROAMER_LOC_R07, ROAMER_LOC_R08, ROAMER_LOC_R11, -1, -1, -1 }                                     },
    { 4, { ROAMER_LOC_R05, ROAMER_LOC_R06, ROAMER_LOC_R08, ROAMER_LOC_R16, -1, -1 }                         },
    { 5, { ROAMER_LOC_R05, ROAMER_LOC_R06, ROAMER_LOC_R07, ROAMER_LOC_R10, ROAMER_LOC_R12, -1 }             },
    { 4, { ROAMER_LOC_R04, ROAMER_LOC_R05, ROAMER_LOC_R10, ROAMER_LOC_R24, -1, -1 }                         },
    { 3, { ROAMER_LOC_R08, ROAMER_LOC_R09, ROAMER_LOC_R12, -1, -1, -1 }                                     },
    { 2, { ROAMER_LOC_R06, ROAMER_LOC_R12, -1, -1, -1, -1 }                                                 },
    { 4, { ROAMER_LOC_R08, ROAMER_LOC_R10, ROAMER_LOC_R11, ROAMER_LOC_R13, -1, -1 }                         },
    { 2, { ROAMER_LOC_R12, ROAMER_LOC_R14, -1, -1, -1, -1 }                                                 },
    { 2, { ROAMER_LOC_R13, ROAMER_LOC_R15, -1, -1, -1, -1 }                                                 },
    { 3, { ROAMER_LOC_R14, ROAMER_LOC_R18, ROAMER_LOC_W19, -1, -1, -1 }                                     },
    { 2, { ROAMER_LOC_R07, ROAMER_LOC_R22, -1, -1, -1, -1 }                                                 },
    { 2, { ROAMER_LOC_R16, ROAMER_LOC_R18, -1, -1, -1, -1 }                                                 },
    { 3, { ROAMER_LOC_R15, ROAMER_LOC_R17, ROAMER_LOC_W19, -1, -1, -1 }                                     },
    { 2, { ROAMER_LOC_R15, ROAMER_LOC_R18, -1, -1, -1, -1 }                                                 },
    { 2, { ROAMER_LOC_W19, ROAMER_LOC_W21, -1, -1, -1, -1 }                                                 },
    { 2, { ROAMER_LOC_R01, ROAMER_LOC_W19, -1, -1, -1 /*,-1*/ }                                             },
    { 4, { ROAMER_LOC_R01, ROAMER_LOC_R02, ROAMER_LOC_R26, ROAMER_LOC_R28, -1, -1 }                         },
    { 3, { ROAMER_LOC_R04, ROAMER_LOC_R05, ROAMER_LOC_R09, -1, -1, -1 }                                     },
    { 2, { ROAMER_LOC_R22, ROAMER_LOC_R28, -1, -1, -1, -1 }                                                 },
    { 3, { ROAMER_LOC_R22, ROAMER_LOC_R26, ROAMER_LOC_R09, -1, -1, -1 }                                     },
};

void RoamerLocationUpdateRand(RoamerSaveData *roamer, u8 roamer_idx) {
    u32 last_loc = PlayerLocationHistoryGetBack(roamer);
    RoamerLocationSetRandom(roamer, roamer_idx, last_loc);
}

void Save_RandomizeRoamersLocation(RoamerSaveData *roamer) {
    u8 i;

    for (i = 0; i < ROAMER_MAX; i++) {
        if (GetRoamerIsActiveByIndex(roamer, i)) {
            RoamerLocationUpdateRand(roamer, i);
        }
    }
}

void Save_UpdateRoamersLocation(RoamerSaveData *roamer) {
    u8 i;
    u16 rnd;
    u32 last_loc;

    for (i = 0; i < ROAMER_MAX; i++) {
        if (GetRoamerIsActiveByIndex(roamer, i)) {
            rnd = LCRandom() % 16;
            if (rnd == 0) {
                RoamerLocationUpdateRand(roamer, i);
            } else {
                last_loc = PlayerLocationHistoryGetBack(roamer);
                RoamerLocationUpdateEx(roamer, i, last_loc);
            }
        }
    }
}

u32 GetRoamMapByLocationIdx(u8 idx) {
    GF_ASSERT(idx < NELEMS(sRoamerLocations));
    return sRoamerLocations[idx];
}

static BOOL AreAnyRoamersActive(RoamerSaveData *roamers) {
    u8 i;

    for (i = 0; i < ROAMER_MAX; i++) {
        if (GetRoamerIsActiveByIndex(roamers, i)) {
            return TRUE;
        }
    }

    return FALSE;
}

void UpdatePlayerLocationHistoryIfAnyRoamersActive(RoamerSaveData *roamers, u32 location) {
    if (AreAnyRoamersActive(roamers)) {
        PlayerLocationHistoryPush(roamers, location);
    }
}

void Save_CreateRoamerByID(SaveData *saveData, u8 idx) {
    PlayerProfile *profile;
    RoamerSaveData *roamerSave = Save_Roamers_Get(saveData);
    Roamer *roamerStats = Roamers_GetRoamMonStats(roamerSave, idx);
    Pokemon *mon;
    u16 species;
    u8 level;

    switch (idx) {
    case ROAMER_RAIKOU:
        species = SPECIES_RAIKOU;
        level = 40;
        break;
    case ROAMER_ENTEI:
        species = SPECIES_ENTEI;
        level = 40;
        break;
    case ROAMER_LATIAS:
        species = SPECIES_LATIAS;
        level = 35;
        break;
    case ROAMER_LATIOS:
        species = SPECIES_LATIOS;
        level = 35;
        break;
    default:
        GF_ASSERT(FALSE);
        return;
    }

    SetRoamerData(roamerStats, ROAMER_DATA_SPECIES, species);
    SetRoamerData(roamerStats, ROAMER_DATA_LEVEL, level);

    profile = Save_PlayerData_GetProfile(saveData);
    mon = AllocMonZeroed((enum HeapID)4);
    ZeroMonData(mon);
    CreateMon(mon, species, level, 32, FALSE, 0, OT_ID_PRESET, PlayerProfile_GetTrainerID_VisibleHalf(profile));
    SetRoamerData(roamerStats, ROAMER_DATA_STATUS, 0);
    SetRoamerData(roamerStats, ROAMER_DATA_ACTIVE, TRUE);
    SetRoamerData(roamerStats, ROAMER_DATA_IVS, GetMonData(mon, MON_DATA_IVS_WORD, NULL));
    SetRoamerData(roamerStats, ROAMER_DATA_PERSONALITY, GetMonData(mon, MON_DATA_PERSONALITY, NULL));
    SetRoamerData(roamerStats, ROAMER_DATA_HP, GetMonData(mon, MON_DATA_MAXHP, NULL));
    Heap_Free(mon);
    RoamerLocationSetRandom(roamerSave, idx, PlayerLocationHistoryGetBack(roamerSave));
}

u8 SpeciesToRoamerIdx(u16 species) {
    switch (species) {
    case SPECIES_RAIKOU:
        return ROAMER_RAIKOU;
    case SPECIES_ENTEI:
        return ROAMER_ENTEI;
    case SPECIES_LATIOS:
        return ROAMER_LATIOS;
    case SPECIES_LATIAS:
        return ROAMER_LATIAS;
    default:
        GF_ASSERT(FALSE);
        return ROAMER_MAX;
    }
}

static void RoamerLocationSetRandom(RoamerSaveData *roamer, u8 roamer_idx, u32 last_loc) {
    u32 roamer_cur_loc, roamer_test_loc;
    u8 loc_min, loc_num;
    u8 loc_cur_rand;

    roamer_cur_loc = sRoamerLocations[Roamer_GetLocation(roamer, roamer_idx)];
    if (roamer_idx == ROAMER_RAIKOU || roamer_idx == ROAMER_ENTEI) {
        loc_num = ROAMER_LOC_JOHTO_COUNT;
        loc_min = ROAMER_LOC_JOHTO_START;
    } else {
        loc_num = ROAMER_LOC_KANTO_COUNT;
        loc_min = ROAMER_LOC_KANTO_START;
    }
    do {
        loc_cur_rand = (LCRandom() % loc_num) + loc_min;
        roamer_test_loc = sRoamerLocations[loc_cur_rand];
    } while (roamer_test_loc == last_loc || roamer_test_loc == roamer_cur_loc);
    ApplyRoamerLocation(roamer, roamer_idx, loc_cur_rand, roamer_test_loc);
}

static void RoamerLocationUpdateEx(RoamerSaveData *roamer, u8 roamer_idx, u32 last_loc) {
    u8 roamer_last_loc;
    u8 roamer_next_loc;
    u32 roamer_next_mapno;
    u8 sel_idx;
    const struct RoamerAdjacency *adj;

    roamer_last_loc = Roamer_GetLocation(roamer, roamer_idx);
    adj = &sRoamerAdjacencyTable[roamer_last_loc];
    if (adj->count == 1) {
        roamer_next_loc = adj->neighbors[0];
        roamer_next_mapno = sRoamerLocations[roamer_next_loc];
        if (roamer_next_mapno == last_loc) {
            RoamerLocationSetRandom(roamer, roamer_idx, last_loc);
        } else {
            ApplyRoamerLocation(roamer, roamer_idx, roamer_next_loc, roamer_next_mapno);
        }
    } else {
        while (1) {
            sel_idx = LCRandRange(adj->count);
            roamer_next_loc = adj->neighbors[sel_idx];
            roamer_next_mapno = sRoamerLocations[roamer_next_loc];
            if (roamer_next_mapno != last_loc) {
                ApplyRoamerLocation(roamer, roamer_idx, roamer_next_loc, roamer_next_mapno);
                break;
            }
        }
    }
}

static void ApplyRoamerLocation(RoamerSaveData *roamer, u8 roamer_idx, u8 new_loc, u32 new_mapno) {
    Roamer *roamerStats = Roamers_GetRoamMonStats(roamer, roamer_idx);
    Roamer_SetLocation(roamer, roamer_idx, new_loc);
    SetRoamerData(roamerStats, ROAMER_DATA_MET_LOCATION, new_mapno);
}
