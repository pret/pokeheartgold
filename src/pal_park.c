#include "global.h"
#include "pal_park.h"
#include "field_system.h"
#include "gf_rtc.h"
#include "game_stats.h"
#include "save_arrays.h"
#include "math_util.h"
#include "unk_02054648.h"
#include "metatile_behavior.h"
#include "battle/battle_setup.h"
#include "constants/game_stat.h"
#include "constants/battle.h"
#include "arc/ppark.naix"

struct PalParkMon {
    u16 species;
    u8 area;
    u8 encounterRate;
    u16 score;
    u8 type1;
    u8 type2;
};

struct PalParkLocal {
    struct PalParkMon mons[PARTY_SIZE];
    u8 caught_order[PARTY_SIZE];
    s32 stepsUntilEncounterRoll;
    s32 encounterIndex;
    s64 timestamp; // 40
    int timeRemainingFactor;
};

static struct PalParkLocal sPalParkLocalState;

static void LoadMonPalParkStats(u16 species, u8* dest);
static void InitPalParkMonsData(FieldSystem* fieldSystem, struct PalParkLocal* palpark);
static int CountCaughtMons(struct PalParkLocal* palpark);
static void SetNumStepsUntilNextEncounterCheck(struct PalParkLocal* palpark);
static BOOL ShouldTryEncounter(struct PalParkLocal* palpark);
static enum PalParkEncounterType GetEncounterTypeAt(FieldSystem* fieldSystem, int x, int z);
static BOOL TryEncounter(FieldSystem* fieldSystem, struct PalParkLocal* palpark, int x, int z);
static BattleSetup* SetupEncounter(FieldSystem* fieldSystem, struct PalParkLocal* palpark);
static void HandleBattleEnd(FieldSystem *fieldSystem, BattleSetup *setup, struct PalParkLocal* palpark);
static int CalcSpeciesScore(struct PalParkLocal* palpark);
static u32 CalcTypesScore(struct PalParkLocal* palpark);
static int CalcTimeScore(struct PalParkLocal* palpark);

void PalPark_ClearState(FieldSystem* fieldSystem) {
    s32 i;
    struct PalParkLocal* local = &sPalParkLocalState;
    for (i = 0; i < PARTY_SIZE; ++i) {
        local->caught_order[i] = 0;
    }
}

void PalPark_InitFromSave(FieldSystem* fieldSystem) {
    MI_CpuClearFast(&sPalParkLocalState, sizeof sPalParkLocalState);
    InitPalParkMonsData(fieldSystem, &sPalParkLocalState);
    SetNumStepsUntilNextEncounterCheck(&sPalParkLocalState);
    sPalParkLocalState.timestamp = GF_RTC_DateTimeToSec();
}

void PalPark_StopClock(FieldSystem* fieldSystem) {
    struct PalParkLocal* local = &sPalParkLocalState;
    GAME_STATS* stats = Save_GameStats_Get(fieldSystem->saveData);
    s64 elapsed = GF_RTC_TimeDelta(local->timestamp, GF_RTC_DateTimeToSec());
    if (elapsed < 1000) {
        local->timeRemainingFactor = 2 * (1000 - elapsed);
    } else {
        local->timeRemainingFactor = 0;
    }
    GameStats_AddSpecial(stats, GAME_STAT_UNK17);
}

BOOL PalPark_TryEncounter(FieldSystem* fieldSystem, int x, int z) {
    if (ShouldTryEncounter(&sPalParkLocalState) == TRUE) {
        return TryEncounter(fieldSystem, &sPalParkLocalState, x, z);
    }
    return FALSE;
}

BattleSetup* PalPark_SetupEncounter(FieldSystem* fieldSystem) {
    return SetupEncounter(fieldSystem, &sPalParkLocalState);
}

void PalPark_HandleBattleEnd(FieldSystem *fieldSystem, BattleSetup *setup) {
    return HandleBattleEnd(fieldSystem, setup, &sPalParkLocalState);
}

int PalPark_CountMonsNotCaught(FieldSystem* fieldSystem) {
    return 6 - CountCaughtMons(&sPalParkLocalState);
}

int PalPark_CalcSpeciesScore(FieldSystem* fieldSystem) {
    return CalcSpeciesScore(&sPalParkLocalState);
}

int PalPark_CalcTimeScore(FieldSystem *fieldSystem) {
    return CalcTimeScore(&sPalParkLocalState);
}

u32 PalPark_CalcTypesScore(FieldSystem *fieldSystem) {
    return CalcTypesScore(&sPalParkLocalState);
}

// Local functions

static void LoadMonPalParkStats(u16 species, u8* dest) {
    GF_ASSERT(species != SPECIES_NONE && species <= SPECIES_ARCEUS);
    ReadFromNarcMemberByIdPair(dest, NARC_arc_ppark, 0, (species - 1) * 6, 6);
}

static void InitPalParkMonsData(FieldSystem* fieldSystem, struct PalParkLocal* palpark) {
    struct MigratedPokemonSav* migrated = Save_MigratedPokemon_Get(fieldSystem->saveData);
    Pokemon* mon = AllocMonZeroed(HEAP_ID_4);
    u8 narc_data[6];
    u16 species;
    for (int i = 0; i < PARTY_SIZE; ++i) {
        palpark->caught_order[i] = 0;
        GetMigratedPokemonByIndex(migrated, i, mon);
        palpark->mons[i].species = species = GetMonData(mon, MON_DATA_SPECIES, NULL);
        LoadMonPalParkStats(species, narc_data);
        if (narc_data[0] != 0) {
            palpark->mons[i].area = narc_data[PPMONDAT_OFFSET_LAND_SECTOR];    
        } else {
            palpark->mons[i].area = narc_data[PPMONDAT_OFFSET_WATER_SECTOR] + (int)(PP_ENCTYPE_WATER_MIN - PP_ENCTYPE_LAND_MIN);
        }
        palpark->mons[i].encounterRate = narc_data[PPMONDAT_OFFSET_ENCOUTER_RATE];
        palpark->mons[i].score = narc_data[PPMONDAT_OFFSET_SCORE];
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

static enum PalParkEncounterType GetEncounterTypeAt(FieldSystem* fieldSystem, int x, int z) {
    int behavior = GetMetatileBehaviorAt(fieldSystem, x, z);
    int quadrant = (x < 32 ? 0 : 1);
    quadrant += (z < 32 ? 0 : 2);
    if (MetatileBehavior_IsEncounterGrass(behavior)) {
        return (enum PalParkEncounterType)(quadrant + PP_ENCTYPE_LAND_MIN);
    }
    if (MetatileBehavior_IsSurfableWater(behavior)) {
        return (enum PalParkEncounterType)(quadrant + PP_ENCTYPE_WATER_MIN);
    }
    return PP_ENCTYPE_NONE;
}

static BOOL TryEncounter(FieldSystem* fieldSystem, struct PalParkLocal* palpark, int x, int z) {
    int i;
    int rnd, total_rate = 0;
    enum PalParkEncounterType area = GetEncounterTypeAt(fieldSystem, x, z);

    if (area == PP_ENCTYPE_NONE) {
        return FALSE;
    }

    // Each uncaught Pokemon has an encounter
    // chance weight based on its species.
    // Compute the total weight for the current
    // area. If it's zero, bail.
    for (i = 0; i < PARTY_SIZE; ++i) {
        if (palpark->caught_order[i] == 0 && palpark->mons[i].area == area) {
            total_rate += palpark->mons[i].encounterRate;
        }
    }
    if (total_rate == 0) {
        return FALSE;
    }

    // Prepend an extra bucket of weight 20
    // for a no-encounter roll.
    rnd = LCRandRange(total_rate + 20);
    if (rnd < 20) {
        return FALSE;
    }
    rnd -= 20;

    // Using the random number generated,
    // select the bucket to serve as the
    // encounter.
    for (i = 0; i < PARTY_SIZE; ++i) {
        if (palpark->caught_order[i] == 0 && palpark->mons[i].area == area) {
            if (rnd < palpark->mons[i].encounterRate) {
                palpark->encounterIndex = i;
                return TRUE;
            } else {
                rnd -= palpark->mons[i].encounterRate;
            }
        }
    }

    // In theory, this is unreachable.
    GF_ASSERT(0);
    return FALSE;
}

static void HandleBattleEnd(FieldSystem *fieldSystem, BattleSetup *setup, struct PalParkLocal* palpark) {
    switch (setup->winFlag) {
    case BATTLE_OUTCOME_MON_CAUGHT:
        palpark->caught_order[palpark->encounterIndex] = CountCaughtMons(palpark) + 1;
        break;
    case BATTLE_OUTCOME_PLAYER_FLED:
        break;
    default:
        GF_ASSERT(0);
    }
}

static BattleSetup* SetupEncounter(FieldSystem* fieldSystem, struct PalParkLocal* palpark) {
    Pokemon* mon = AllocMonZeroed(HEAP_ID_32);
    struct MigratedPokemonSav* migratedMons = Save_MigratedPokemon_Get(fieldSystem->saveData);
    BattleSetup* ret = BattleSetup_New_PalPark(HEAP_ID_FIELD, PalPark_CountMonsNotCaught(fieldSystem));
    BattleSetup_InitFromFieldSystem(ret, fieldSystem);
    GetMigratedPokemonByIndex(migratedMons, palpark->encounterIndex, mon);
    BattleSetup_AddMonToParty(ret, mon, BATTLER_ENEMY);
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

    // This score is calculated in two phases
    // Phase 1: +200 points each time you don't
    // catch two Pokemon sharing a type in a row.
    // Maximum 1000 points.
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

    // Phase 2: +50 points for each unique
    // type caught. Maximum 600 points.
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
