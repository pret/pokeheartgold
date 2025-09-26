#include "catching_show.h"

#include "global.h"

#include "constants/battle.h"
#include "constants/game_stats.h"

#include "arc/ppark.naix"
#include "battle/battle_setup.h"

#include "field_system.h"
#include "game_stats.h"
#include "gf_rtc.h"
#include "math_util.h"
#include "metatile_behavior.h"
#include "save_arrays.h"
#include "unk_02054648.h"

#define PAL_PARK_AREA_NONE     0
#define POINTS_LOST_PER_SECOND 2
#define WEIGHT_NO_ENCOUNTER    20
#define DISTINCT_TYPE_BONUS    50
#define DIFFERENT_TYPE_BONUS   200
#define MAX_TIME_SECONDS       1000

typedef struct CatchingShowPokemon {
    u16 species;
    u8 area;
    u8 rarity;
    u16 catchingPoints;
    u8 type1;
    u8 type2;
} CatchingShowPokemon;

typedef struct CatchingShow {
    CatchingShowPokemon pokemon[CATCHING_SHOW_MONS];
    u8 caughtMonsOrder[CATCHING_SHOW_MONS];
    int steps;
    int currentEncounterIndex;
    s64 startTime;
    int timePoints;
} CatchingShow;

static void BufferSpeciesData(u16 species, u8 *dest);
static void InitSpeciesData(FieldSystem *fieldSystem, CatchingShow *catchingShow);
static int CatchingShow_NumMonsCaptured(CatchingShow *catchingShow);
static void CatchingShow_ResetStepCount(CatchingShow *catchingShow);
static BOOL IsStepCountZero(CatchingShow *catchingShow);
static BOOL TryStartEncounter(FieldSystem *fieldSystem, CatchingShow *catchingShow, int x, int z);
static BattleSetup *FieldSystem_SetupCatchingShowEncounter(FieldSystem *fieldSystem, CatchingShow *catchingShow);
static void UpdateBattleResultInternal(FieldSystem *fieldSystem, BattleSetup *setup, CatchingShow *catchingShow);
static u32 CalcCatchingPoints(CatchingShow *catchingShow);
static u32 CalculateTypePoints(CatchingShow *catchingShow);
static u32 GetTimePoints(CatchingShow *catchingShow);

static CatchingShow sCatchingShow;

void CatchingShow_ClearState(FieldSystem *fieldSystem) {
    s32 i;
    CatchingShow *catchingShow = &sCatchingShow;
    for (i = 0; i < PARTY_SIZE; ++i) {
        catchingShow->caughtMonsOrder[i] = 0;
    }
}

void CatchingShow_Start(FieldSystem *fieldSystem) {
    MI_CpuClearFast(&sCatchingShow, sizeof sCatchingShow);
    InitSpeciesData(fieldSystem, &sCatchingShow);
    CatchingShow_ResetStepCount(&sCatchingShow);
    sCatchingShow.startTime = GF_RTC_DateTimeToSec();
}

void CatchingShow_End(FieldSystem *fieldSystem) {
    CatchingShow *catchingShow = &sCatchingShow;
    GameStats *stats = Save_GameStats_Get(fieldSystem->saveData);
    s64 elapsedTime = GF_RTC_TimeDelta(catchingShow->startTime, GF_RTC_DateTimeToSec());

    if (elapsedTime < MAX_TIME_SECONDS) {
        catchingShow->timePoints = ((MAX_TIME_SECONDS - elapsedTime) * POINTS_LOST_PER_SECOND);
    } else {
        catchingShow->timePoints = 0;
    }

    GameStats_AddScore(stats, SCORE_EVENT_17);
}

BOOL CatchingShow_CheckWildEncounter(FieldSystem *fieldSystem, int playerX, int playerY) {
    if (IsStepCountZero(&sCatchingShow) == TRUE) {
        return TryStartEncounter(fieldSystem, &sCatchingShow, playerX, playerY);
    }
    return FALSE;
}

BattleSetup *CatchingShow_GetBattleDataTransfer(FieldSystem *fieldSystem) {
    return FieldSystem_SetupCatchingShowEncounter(fieldSystem, &sCatchingShow);
}

void FieldSystem_UpdateCatchingShowResult(FieldSystem *fieldSystem, BattleSetup *setup) {
    UpdateBattleResultInternal(fieldSystem, setup, &sCatchingShow);
}

int FieldSystem_GetParkBallCount(FieldSystem *fieldSystem) {
    return CATCHING_SHOW_MONS - CatchingShow_NumMonsCaptured(&sCatchingShow);
}

int CatchingShow_CalcCatchingPoints(FieldSystem *fieldSystem) {
    return CalcCatchingPoints(&sCatchingShow);
}

int CatchingShow_GetTimePoints(FieldSystem *fieldSystem) {
    return GetTimePoints(&sCatchingShow);
}

int CatchingShow_GetTypePoints(FieldSystem *fieldSystem) {
    return CalculateTypePoints(&sCatchingShow);
}

static void BufferSpeciesData(u16 species, u8 *dest) {
    GF_ASSERT(species != SPECIES_NONE && species <= NATIONAL_DEX_COUNT);
    ReadFromNarcMemberByIdPair(dest, NARC_arc_ppark, 0, (species - 1) * 6, 6);
}

static void InitSpeciesData(FieldSystem *fieldSystem, CatchingShow *catchingShow) {
    MigratedPokemon *transferData = Save_MigratedPokemon_Get(fieldSystem->saveData);
    Pokemon *mon = AllocMonZeroed(HEAP_ID_FIELD1);
    u8 narc_data[6];
    u16 species;

    for (int i = 0; i < CATCHING_SHOW_MONS; i++) {
        catchingShow->caughtMonsOrder[i] = 0;
        MigratedPokemon_ConvertToPokemon(transferData, i, mon);

        species = GetMonData(mon, MON_DATA_SPECIES, NULL);

        catchingShow->pokemon[i].species = species;
        BufferSpeciesData(species, narc_data);

        if (narc_data[0] != 0) {
            catchingShow->pokemon[i].area = narc_data[PPMONDAT_OFFSET_LAND_SECTOR];
        } else {
            catchingShow->pokemon[i].area = narc_data[PPMONDAT_OFFSET_WATER_SECTOR] + (int)(PP_ENCTYPE_WATER_MIN - PP_ENCTYPE_LAND_MIN);
        }
        catchingShow->pokemon[i].rarity = narc_data[PPMONDAT_OFFSET_ENCOUTER_RATE];
        catchingShow->pokemon[i].catchingPoints = narc_data[PPMONDAT_OFFSET_SCORE];
        catchingShow->pokemon[i].type1 = GetMonData(mon, MON_DATA_TYPE_1, NULL);
        catchingShow->pokemon[i].type2 = GetMonData(mon, MON_DATA_TYPE_2, NULL);
    }

    Heap_Free(mon);
}

static int CatchingShow_NumMonsCaptured(CatchingShow *catchingShow) {
    int i;
    int numMonsCaptured = 0;

    for (i = 0; i < CATCHING_SHOW_MONS; i++) {
        if (catchingShow->caughtMonsOrder[i] != 0) {
            numMonsCaptured++;
        }
    }

    return numMonsCaptured;
}

static void CatchingShow_ResetStepCount(CatchingShow *catchingShow) {
    u16 rnd = LCRandom() % 10;
    catchingShow->steps = rnd + 5;
}

static BOOL IsStepCountZero(CatchingShow *catchingShow) {
    if (--catchingShow->steps == 0) {
        CatchingShow_ResetStepCount(catchingShow);
        return TRUE;
    }

    return FALSE;
}

static enum PalParkEncounterType GetEncounterArea(FieldSystem *fieldSystem, int playerX, int playerY) {
    int behavior = GetMetatileBehavior(fieldSystem, playerX, playerY);
    int quadrant = (playerX < 32) ? 0 : 1;
    quadrant += (playerY < 32) ? 0 : 2;
    if (MetatileBehavior_IsEncounterGrass(behavior)) {
        return (enum PalParkEncounterType)(quadrant + PP_ENCTYPE_LAND_MIN);
    } else if (MetatileBehavior_IsSurfableWater(behavior)) {
        return (enum PalParkEncounterType)(quadrant + PP_ENCTYPE_WATER_MIN);
    }

    return PP_ENCTYPE_NONE;
}

static BOOL TryStartEncounter(FieldSystem *fieldSystem, CatchingShow *catchingShow, int playerX, int playerY) {
    int i;
    int encounterChance, totalRarity = 0;
    enum PalParkEncounterType area = GetEncounterArea(fieldSystem, playerX, playerY);

    if (area == PP_ENCTYPE_NONE) {
        return FALSE;
    }

    // Each uncaught Pokemon has an encounter
    // chance weight based on its species.
    // Compute the total weight for the current
    // area. If it's zero, bail.
    for (i = 0; i < CATCHING_SHOW_MONS; i++) {
        if (catchingShow->caughtMonsOrder[i] == 0 && catchingShow->pokemon[i].area == area) {
            totalRarity += catchingShow->pokemon[i].rarity;
        }
    }

    if (totalRarity == 0) {
        return FALSE;
    }

    // Prepend an extra bucket of weight 20
    // for a no-encounter roll.
    encounterChance = LCRandRange(totalRarity + WEIGHT_NO_ENCOUNTER);

    if (encounterChance < WEIGHT_NO_ENCOUNTER) {
        return FALSE;
    }

    encounterChance -= WEIGHT_NO_ENCOUNTER;

    // Using the random number generated,
    // select the bucket to serve as the
    // encounter.
    for (i = 0; i < CATCHING_SHOW_MONS; i++) {
        if (catchingShow->caughtMonsOrder[i] == 0 && catchingShow->pokemon[i].area == area) {
            if (encounterChance < catchingShow->pokemon[i].rarity) {
                catchingShow->currentEncounterIndex = i;
                return TRUE;
            } else {
                encounterChance -= catchingShow->pokemon[i].rarity;
            }
        }
    }

    // In theory, this is unreachable.
    GF_ASSERT(FALSE);
    return FALSE;
}

static void UpdateBattleResultInternal(FieldSystem *fieldSystem, BattleSetup *setup, CatchingShow *catchingShow) {
    switch (setup->winFlag) {
    case BATTLE_OUTCOME_MON_CAUGHT:
        catchingShow->caughtMonsOrder[catchingShow->currentEncounterIndex] = CatchingShow_NumMonsCaptured(catchingShow) + 1;
        break;
    case BATTLE_OUTCOME_PLAYER_FLED:
        break;
    default:
        GF_ASSERT(FALSE);
    }
}

static BattleSetup *FieldSystem_SetupCatchingShowEncounter(FieldSystem *fieldSystem, CatchingShow *catchingShow) {
    Pokemon *mon = AllocMonZeroed(HEAP_ID_FIELD3);
    MigratedPokemon *migratedMons = Save_MigratedPokemon_Get(fieldSystem->saveData);
    BattleSetup *ret = BattleSetup_New_PalPark(HEAP_ID_FIELD2, FieldSystem_GetParkBallCount(fieldSystem));

    BattleSetup_InitFromFieldSystem(ret, fieldSystem);
    MigratedPokemon_ConvertToPokemon(migratedMons, catchingShow->currentEncounterIndex, mon);
    BattleSetup_AddMonToParty(ret, mon, BATTLER_ENEMY);
    Heap_Free(mon);
    return ret;
}

static u32 CalcCatchingPoints(CatchingShow *catchingShow) {
    int i, totalCatchingPoints = 0;

    for (i = 0; i < CATCHING_SHOW_MONS; i++) {
        totalCatchingPoints += catchingShow->pokemon[i].catchingPoints;
    }

    return totalCatchingPoints;
}

static u32 CalculateTypePoints(CatchingShow *catchingShow) {
    int i, j;
    int prevMonType1, prevMonType2, currMonType1, currMonType2;
    u32 distinctTypeTracker = 0, totalTypePoints = 0;

    // This score is calculated in two phases
    // Phase 1: +200 points each time you don't
    // catch two Pokemon sharing a type in a row.
    // Maximum 1000 points.
    for (i = 1; i < CATCHING_SHOW_MONS + 1; i++) {
        for (j = 0; j < CATCHING_SHOW_MONS; j++) {
            if (catchingShow->caughtMonsOrder[j] == i) {
                currMonType1 = catchingShow->pokemon[j].type1;
                currMonType2 = catchingShow->pokemon[j].type2;

                if (i != 1
                    && prevMonType1 != currMonType1
                    && prevMonType1 != currMonType2
                    && prevMonType2 != currMonType1
                    && prevMonType2 != currMonType2) {
                    totalTypePoints += DIFFERENT_TYPE_BONUS;
                }

                prevMonType1 = currMonType1;
                prevMonType2 = currMonType2;
                distinctTypeTracker |= (1 << prevMonType1);
                distinctTypeTracker |= (1 << prevMonType2);

                break;
            }
        }
    }

    // Phase 2: +50 points for each unique
    // type caught. Maximum 600 points.
    while (distinctTypeTracker != 0) {
        if (distinctTypeTracker & 1) {
            totalTypePoints += DISTINCT_TYPE_BONUS;
        }
        distinctTypeTracker >>= 1;
    }

    return totalTypePoints;
}

static u32 GetTimePoints(CatchingShow *catchingShow) {
    return catchingShow->timePoints;
}
