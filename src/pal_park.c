#include "global.h"
#include "field_system.h"
#include "gf_rtc.h"
#include "game_stats.h"
#include "save_arrays.h"
#include "math_util.h"
#include "battle_setup.h"
#include "unk_02054648.h"
#include "metatile_behavior.h"
#include "constants/game_stat.h"
#include "pal_park.h"
#include "arc/ppark.naix"

struct PalParkMon {
    u16 species;
    u8 encounter_tile;
    u8 encounter_rate;
    u16 score;
    u8 type1;
    u8 type2;
};

struct PalParkLocal {
    struct PalParkMon mons[PARTY_SIZE];
    u8 caught_order[PARTY_SIZE];
    s32 stepsUntilEncounterRoll;
    s32 encounter_index;
    s64 timestamp; // 40
    int timeRemainingFactor;
};

typedef enum PalParkEncounterType {
    PP_ENCTYPE_NONE,
    PP_ENCTYPE_FOREST,
    PP_ENCTYPE_MOUNTAIN,
    PP_ENCTYPE_FIELD,
    PP_ENCTYPE_4, // unused
    PP_ENCTYPE_5, // unused
    PP_ENCTYPE_POND,
    PP_ENCTYPE_7, // unused
    PP_ENCTYPE_SEA,
} PalParkEncounterType;

static struct PalParkLocal sPalParkLocalState;

static void LoadMonPalParkStats(u16 species, u8* dest);
static void InitPalParkMonsData(FieldSystem* fsys, struct PalParkLocal* palpark);
static int CountCaughtMons(struct PalParkLocal* palpark);
static void SetNumStepsUntilNextEncounterCheck(struct PalParkLocal* palpark);
static BOOL ShouldTryEncounter(struct PalParkLocal* palpark);
static PalParkEncounterType GetEncounterTypeAt(FieldSystem* fsys, int x, int z);
static BOOL TryEncounter(FieldSystem* fsys, struct PalParkLocal* palpark, int x, int z);
static BATTLE_SETUP* SetupEncounter(FieldSystem* fsys, struct PalParkLocal* palpark);
static void HandleBattleEnd(FieldSystem *fsys, BATTLE_SETUP *setup, struct PalParkLocal* palpark);
static int CalcSpeciesScore(struct PalParkLocal* palpark);
static u32 CalcTypesScore(struct PalParkLocal* palpark);
static int CalcTimeScore(struct PalParkLocal* palpark);

void PalPark_ClearState(FieldSystem* fsys) {
    s32 i;
    struct PalParkLocal* local = &sPalParkLocalState;
    for (i = 0; i < PARTY_SIZE; ++i) {
        local->caught_order[i] = 0;
    }
}

void PalPark_InitFromSave(FieldSystem* fsys) {
    MI_CpuClearFast(&sPalParkLocalState, sizeof sPalParkLocalState);
    InitPalParkMonsData(fsys, &sPalParkLocalState);
    SetNumStepsUntilNextEncounterCheck(&sPalParkLocalState);
    sPalParkLocalState.timestamp = GF_RTC_DateTimeToSec();
}

void PalPark_StopClock(FieldSystem* fsys) {
    struct PalParkLocal* local = &sPalParkLocalState;
    GAME_STATS* stats = Save_GameStats_Get(fsys->savedata);
    s64 elapsed = GF_RTC_TimeDelta(local->timestamp, GF_RTC_DateTimeToSec());
    if (elapsed < 1000) {
        local->timeRemainingFactor = 2 * (1000 - elapsed);
    } else {
        local->timeRemainingFactor = 0;
    }
    GameStats_AddSpecial(stats, GAME_STAT_UNK17);
}

BOOL PalPark_TryEncounter(FieldSystem* fsys, int x, int z) {
    if (ShouldTryEncounter(&sPalParkLocalState) == TRUE) {
        return TryEncounter(fsys, &sPalParkLocalState, x, z);
    }
    return FALSE;
}

BATTLE_SETUP* PalPark_SetupEncounter(FieldSystem* fsys) {
    return SetupEncounter(fsys, &sPalParkLocalState);
}

void PalPark_HandleBattleEnd(FieldSystem *fsys, BATTLE_SETUP *setup) {
    return HandleBattleEnd(fsys, setup, &sPalParkLocalState);
}

int PalPark_CountMonsNotCaught(FieldSystem* fsys) {
    return 6 - CountCaughtMons(&sPalParkLocalState);
}

int PalPark_CalcSpeciesScore(FieldSystem* fsys) {
    return CalcSpeciesScore(&sPalParkLocalState);
}

int PalPark_CalcTimeScore(FieldSystem *fsys) {
    return CalcTimeScore(&sPalParkLocalState);
}

u32 PalPark_CalcTypesScore(FieldSystem *fsys) {
    return CalcTypesScore(&sPalParkLocalState);
}

// Local functions

static void LoadMonPalParkStats(u16 species, u8* dest) {
    GF_ASSERT(species != SPECIES_NONE && species <= SPECIES_ARCEUS);
    ReadFromNarcMemberByIdPair(dest, NARC_arc_ppark, 0, (species - 1) * 6, 6);
}

static void InitPalParkMonsData(FieldSystem* fsys, struct PalParkLocal* palpark) {
    struct MigratedPokemonSav* migrated = Save_MigratedPokemon_Get(fsys->savedata);
    Pokemon* mon = AllocMonZeroed(HEAP_ID_4);
    u8 narc_data[6];
    u16 species;
    for (int i = 0; i < PARTY_SIZE; ++i) {
        palpark->caught_order[i] = 0;
        GetMigratedPokemonI(migrated, i, mon);
        palpark->mons[i].species = species = GetMonData(mon, MON_DATA_SPECIES, NULL);
        LoadMonPalParkStats(species, narc_data);
        if (narc_data[0] != 0) {
            palpark->mons[i].encounter_tile = narc_data[0];    
        } else {
            palpark->mons[i].encounter_tile = narc_data[1] + 4;
        }
        palpark->mons[i].encounter_rate = narc_data[3];
        palpark->mons[i].score = narc_data[2];
        palpark->mons[i].type1 = GetMonData(mon, MON_DATA_TYPE_1, NULL);
        palpark->mons[i].type2 = GetMonData(mon, MON_DATA_TYPE_2, NULL);
    }
    FreeToHeap(mon);
}

static int CountCaughtMons(struct PalParkLocal* palpark) {
    int i;
    int total = 0;
    for (i = 0; i < PARTY_SIZE; ++i) {
        if (palpark->caught_order[i] != 0) {
            ++total;
        }
    }
    return total;
}

static void SetNumStepsUntilNextEncounterCheck(struct PalParkLocal* palpark) {
    u16 rnd = LCRandom() % 10;
    palpark->stepsUntilEncounterRoll = rnd + 5;
}

static BOOL ShouldTryEncounter(struct PalParkLocal* palpark) {
    if (--palpark->stepsUntilEncounterRoll == 0) {
        SetNumStepsUntilNextEncounterCheck(palpark);
        return TRUE;
    }
    return FALSE;
}

static PalParkEncounterType GetEncounterTypeAt(FieldSystem* fsys, int x, int z) {
    int behavior = GetMetatileBehaviorAt(fsys, x, z);
    int r5 = (x >= 32 ? 1 : 0);
    r5 += (z < 32 ? 0 : 2);
    if (sub_0205B6E8(behavior)) {
        return (PalParkEncounterType)(r5 + PP_ENCTYPE_FOREST);
    }
    if (sub_0205B778(behavior)) {
        return (PalParkEncounterType)(r5 + PP_ENCTYPE_5);
    }
    return PP_ENCTYPE_NONE;
}

static BOOL TryEncounter(FieldSystem* fsys, struct PalParkLocal* palpark, int x, int z) {
    int i;
    int rnd, total_rate = 0;
    PalParkEncounterType standing_tile = GetEncounterTypeAt(fsys, x, z);

    if (standing_tile == PP_ENCTYPE_NONE) {
        return FALSE;
    }
    for (i = 0; i < PARTY_SIZE; ++i) {
        if (palpark->caught_order[i] == 0 && palpark->mons[i].encounter_tile == standing_tile) {
            total_rate += palpark->mons[i].encounter_rate;
        }
    }
    if (total_rate == 0) {
        return FALSE;
    }
    rnd = LCRandRange(total_rate + 20);
    if (rnd < 20) {
        return FALSE;
    }
    rnd -= 20;
    for (i = 0; i < PARTY_SIZE; ++i) {
        if (palpark->caught_order[i] == 0 && palpark->mons[i].encounter_tile == standing_tile) {
            if (rnd < palpark->mons[i].encounter_rate) {
                palpark->encounter_index = i;
                return TRUE;
            } else {
                rnd -= palpark->mons[i].encounter_rate;
            }
        }
    }
    GF_ASSERT(0);
    return FALSE;
}

static void HandleBattleEnd(FieldSystem *fsys, BATTLE_SETUP *setup, struct PalParkLocal* palpark) {
    switch (setup->winFlag) {
    case 4:
        palpark->caught_order[palpark->encounter_index] = CountCaughtMons(palpark) + 1;
        break;
    case 5:
        break;
    default:
        GF_ASSERT(0);
    }
}

static BATTLE_SETUP* SetupEncounter(FieldSystem* fsys, struct PalParkLocal* palpark) {
    Pokemon* mon = AllocMonZeroed(HEAP_ID_32);
    struct MigratedPokemonSav* migratedMons = Save_MigratedPokemon_Get(fsys->savedata);
    BATTLE_SETUP* ret = sub_02051A98(HEAP_ID_FIELD, PalPark_CountMonsNotCaught(fsys));
    BattleSetup_InitFromFsys(ret, fsys);
    GetMigratedPokemonI(migratedMons, palpark->encounter_index, mon);
    sub_02051C9C(ret, mon, 1);
    FreeToHeap(mon);
    return ret;
}

static int CalcSpeciesScore(struct PalParkLocal* palpark) {
    int i, score = 0;
    for (i = 0; i < PARTY_SIZE; ++i) {
        score += palpark->mons[i].score;
    }
    return score;
}

static u32 CalcTypesScore(struct PalParkLocal* palpark) {
    int j, i;
    u8 type1, type2, last_type1, last_type2;
    u32 seen_types = 0, score = 0;
    for (i = 1; i < PARTY_SIZE + 1; ++i) {
        for (j = 0; j < PARTY_SIZE; ++j) {
            if (palpark->caught_order[j] == i) {
                type1 = palpark->mons[j].type1;
                type2 = palpark->mons[j].type2;
                if (i != 1 && last_type1 != type1 && last_type1 != type2 && last_type2 != type1 && last_type2 != type2) {
                    score += 200;
                }
                last_type1 = type1;
                last_type2 = type2;
                seen_types |= 1 << type1;
                seen_types |= 1 << type2;
                break;
            }
        }
    }
    while (seen_types != 0) {
        if (seen_types & 1) {
            score += 50;
        }
        seen_types >>= 1;
    }
    return score;
}

static int CalcTimeScore(struct PalParkLocal* palpark) {
    return palpark->timeRemainingFactor;
}
