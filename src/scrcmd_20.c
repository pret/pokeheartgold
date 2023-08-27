#include "global.h"
#include "assert.h"
#include "bag.h"
#include "field_player_avatar.h"
#include "field_system.h"
#include "fieldmap.h"
#include "frontier_data.h"
#include "game_stats.h"
#include "heap.h"
#include "mail.h"
#include "party.h"
#include "player_data.h"
#include "pokedex_util.h"
#include "pokemon_storage_system.h"
#include "pokemon.h"
#include "save_special_ribbons.h"
#include "scrcmd.h"
#include "scrcmd_20.h"
#include "script.h"
#include "task.h"
#include "unk_02030A98.h"
#include "unk_02035900.h"
#include "unk_0203DFA4.h"
#include "unk_0203E348.h"
#include "unk_0205BB1C.h"
#include "unk_0205BFF0.h"
#include "unk_02078E30.h"
#include "unk_02088288.h"
#include "unk_02091564.h"
#include "constants/game_stat.h"

typedef enum BattleHallChallengeType {
    BATTLE_HALL_CHALLENGE_TYPE_SINGLE,
    BATTLE_HALL_CHALLENGE_TYPE_DOUBLE,
    BATTLE_HALL_CHALLENGE_TYPE_MULTI,
} BattleHallChallengeType;

typedef struct UnkStruct_0204F284 {
    u32 state;
    u8 challengeType;
    u8 unk05;
    u8 unk06[2];
    void **unk08;
} UnkStruct_0204F284;

typedef struct WinStreakBP {
    u32 winStreakTarget;
    u32 bp;
} WinStreakBP;

static const WinStreakBP battleHallWinStreakBP[] = {
    {10, 1},
    {30, 3},
    {50, 5},
    {100, 5},
    {150, 5},
    {200, 5},
    {250, 5},
    {300, 5},
    {350, 5},
    {400, 5},
    {450, 5},
    {500, 10},
    {600, 10},
    {700, 10},
    {800, 10},
    {900, 10},
    {1000, 10},
    {1200, 30},
    {1400, 30},
    {1600, 30},
    {1800, 30},
    {2000, 50},
    {2500, 50},
    {3000, 50},
    {3500, 50},
    {4000, 50},
    {4500, 50},
    {5000, 50},
    {5500, 50},
    {6000, 50},
    {6500, 50},
    {7000, 50},
    {7500, 50},
    {8000, 50},
    {8500, 50},
    {9000, 50},
    {9500, 50},
    {10000, 100},
    {20000, 200},
    {30000, 300},
    {40000, 400},
    {50000, 500},
    {60000, 600},
    {70000, 700},
    {80000, 800},
    {90000, 900},
    {100000, 1000},
};

static BOOL BattleHall_DoesPartyContainEligibleMons(s32, SaveData*);
static void sub_0204F1E4(TaskManager*, u16, u16*);
static BOOL sub_0204F228(TaskManager*);
static void sub_0204F284(TaskManager*, void*, BattleHallChallengeType);
static BOOL sub_0204F2B8(TaskManager*);
static u32 sub_0204F320(UnkStruct_0204F284*, FieldSystem*, HeapID);
static u32 sub_0204F3F8(UnkStruct_0204F284*, FieldSystem*);
static u32 sub_0204F448(UnkStruct_0204F284*, FieldSystem*, HeapID);
static u32 sub_0204F4D8(UnkStruct_0204F284*, FieldSystem*);

const u8 unk_020FC224[] = { 0, 1, 2, 3, 4, };

// Essentially a nop
BOOL ScrCmd_NopVar490(ScriptContext *ctx) {
    u16 *unused = ScriptGetVarPointer(ctx);
    return FALSE;
}

// Essentially a nop
BOOL ScrCmd_491(ScriptContext *ctx) {
    u16 *unused = ScriptGetVarPointer(ctx);
    return FALSE;
}

// same as ScrCmd_636, but battle factory
BOOL ScrCmd_628(ScriptContext *ctx) {
    u16 r4 = ScriptGetVar(ctx);
    u16 r5 = ScriptGetVar(ctx);
    u32 r0 = sub_02030AE8(ctx->fieldSystem->saveData);
    u8 s = 0;
    sub_02030AA4(r0, 0xa, r5 * 4 + r4, &s);
    if (r4 == 3) {
        u32 r7;
        if (r5 == 0) {
            r7 = 0x66;
        } else {
            r7 = 0x68;
        }
        sub_02031108(sub_0203107C(ctx->fieldSystem->saveData), r7, sub_0205C268(r7), 0);
    }
    sub_02031108(sub_0203107C(ctx->fieldSystem->saveData), sub_0205BFF0(r5, r4), sub_0205C268(sub_0205BFF0(r5, r4)), 0);
    sub_02031108(sub_0203107C(ctx->fieldSystem->saveData), sub_0205C048(r5, r4), sub_0205C268(sub_0205C048(r5, r4)), 0);
    return FALSE;
}

BOOL ScrCmd_633(ScriptContext *ctx) {
    u16 r7 = ScriptReadHalfword(ctx);
    u16 r5 = ScriptGetVar(ctx);
    u16 *resultPtr = ScriptGetVarPointer(ctx);
    sub_02030B04(ctx->fieldSystem->saveData);
    u32 sp04 = sub_02030C5C(ctx->fieldSystem->saveData);
    void *r1 = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_RUNNING_APP_DATA);
    switch (r7) {
        case 0:
            *resultPtr = BattleHall_DoesPartyContainEligibleMons(r5, ctx->fieldSystem->saveData);
            break;
        case 1:
            if (r5 == 3) {
                *resultPtr = sub_020310BC(sub_0203107C(ctx->fieldSystem->saveData), 0x6a, sub_0205C268(0x6a));
            } else {
                *resultPtr = sub_02030CA0(sp04, 5, r5, 0, 0);
            }
            break;
        case 2:
            *resultPtr = sub_020310BC(sub_0203107C(ctx->fieldSystem->saveData), sub_0205C11C(r5), sub_0205C268(sub_0205C11C(r5)));
            break;
        case 3:
            sub_0204F878(ctx->fieldSystem->saveData, sp04, r5);
            break;
        case 4:
            BattleHallChallengeType challengeType;
            if (r5 == 0) {
                challengeType = BATTLE_HALL_CHALLENGE_TYPE_SINGLE;
            } else if (r5 == 1) {
                challengeType = BATTLE_HALL_CHALLENGE_TYPE_DOUBLE;
            } else {
                challengeType = BATTLE_HALL_CHALLENGE_TYPE_MULTI;
            }
            sub_0204F284(ctx->taskman, r1, challengeType);
            return TRUE;
        default:
            GF_ASSERT(FALSE);
            *resultPtr = 0;
    }
    return FALSE;
}

static BOOL BattleHall_DoesPartyContainEligibleMons(s32 numRequiredMons, SaveData *saveData) {
    u8 i;
    u8 numEligibleMons;
    u16 species;
    u16 level;
    u16 form;
    Party *party = SaveArray_Party_Get(saveData);
    u8 partyCount = Party_GetCount(party);
    if (partyCount < numRequiredMons) {
        return FALSE;
    }
    u16 arr[6];
    for (i = 0; i < 6; i++) {
        arr[i] = SPECIES_NONE;
    }
    for (i = 0, numEligibleMons = 0; i < partyCount; i++) {
        Pokemon *mon = Party_GetMonByIndex(party, i);
        species = GetMonData(mon, MON_DATA_SPECIES, NULL);
        level = GetMonData(mon, MON_DATA_LEVEL, NULL);
        form = GetMonData(mon, MON_DATA_FORM, NULL);
        if (GetMonData(mon, MON_DATA_IS_EGG, NULL) == FALSE
                && level >= 30
                && IsPokemonBannedFromBattleFrontier(species, form) != TRUE) {
            numEligibleMons++;
            arr[i] = species;
        }
    }
    if (numRequiredMons == 2) {
        for (u8 j = 0; j < partyCount; j++) {
            for (i = 0; i < partyCount; i++) {
                if (j != i && arr[j] != SPECIES_NONE && arr[j] == arr[i]) {
                    return TRUE;
                }
            }
        }
        return FALSE;
    }
    return numEligibleMons >= numRequiredMons;
}

// upon continuing battle hall challenge without previously saving
BOOL ScrCmd_636(ScriptContext *ctx) {
    u16 r4 = ScriptGetVar(ctx);
    u32 r1 = sub_02030C5C(ctx->fieldSystem->saveData);
    sub_0204F878(ctx->fieldSystem->saveData, r1, r4);
    return FALSE;
}

// returns whether the player and partner chose different mons for battle hall
BOOL ScrCmd_634(ScriptContext *ctx) {
    u16 playerSpecies = ScriptGetVar(ctx);
    u16 *resultPtr = ScriptGetVarPointer(ctx);
    sub_0204F1E4(ctx->taskman, playerSpecies, resultPtr);
    return TRUE;
}

static void sub_0204F1E4(TaskManager *taskManager, u16 playerSpecies, u16 *resultPtr) {
    UnkStruct_0204F1E4 *r4 = AllocFromHeap(HEAP_ID_FIELD, sizeof(UnkStruct_0204F1E4));
    memset(r4, 0, sizeof(UnkStruct_0204F1E4));
    r4->playerTeam = playerSpecies;
    r4->result = resultPtr;
    sub_02091574((FieldSystem *)r4);
    TaskManager_Call(taskManager, sub_0204F228, r4);
}

static BOOL sub_0204F228(TaskManager *taskManager) {
    UnkStruct_0204F1E4 *r4 = TaskManager_GetEnv(taskManager);
    switch (r4->state) {
        case 0:
            if (sub_02037030(0x84, r4, sizeof(UnkStruct_0204F1E4)) == 1) {
                r4->state++;
            }
            break;
        case 1:
            if (r4->unk01 >= 2) {
                if (r4->playerTeam == r4->partnerTeam) {
                    *(r4->result) = FALSE;
                } else {
                    *(r4->result) = TRUE;
                }
                r4->state++;
            }
            break;
        case 2:
            FreeToHeap(r4);
            return TRUE;
    }
    return FALSE;
}

static void sub_0204F284(TaskManager *taskManager, void *a1, BattleHallChallengeType challengeType) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    UnkStruct_0204F284 *r4 = AllocFromHeap(HEAP_ID_FIELD, sizeof(UnkStruct_0204F284));
    MI_CpuFill8(r4, 0, sizeof(UnkStruct_0204F284));
    r4->challengeType = challengeType;
    r4->unk08 = a1;
    TaskManager_Call(fieldSystem->taskman, sub_0204F2B8, r4);
}

static BOOL sub_0204F2B8(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    UnkStruct_0204F284 *r4 = TaskManager_GetEnv(taskManager);
    switch (r4->state) {
        case 0:
            r4->state = sub_0204F320(r4, fieldSystem, HEAP_ID_FIELD);
            break;
        case 1:
            r4->state = sub_0204F3F8(r4, fieldSystem);
            break;
        case 2:
            r4->state = sub_0204F448(r4, fieldSystem, HEAP_ID_FIELD);
            break;
        case 3:
            r4->state = sub_0204F4D8(r4, fieldSystem);
            break;
        case 4:
            FreeToHeap(r4);
            return TRUE;
    }
    return FALSE;
}

static u32 sub_0204F320(UnkStruct_0204F284 *a0, FieldSystem *fieldSystem, HeapID unused) {
    PartyMenuAppData *partyMenu = AllocFromHeap(HEAP_ID_FIELD, sizeof(PartyMenuAppData));
    MIi_CpuClearFast(0, (u32*)partyMenu, sizeof(PartyMenuAppData));
    partyMenu->party = SaveArray_Party_Get(fieldSystem->saveData);
    partyMenu->bag = Save_Bag_Get(fieldSystem->saveData);
    partyMenu->mailbox = Save_Mailbox_Get(fieldSystem->saveData);
    partyMenu->options = Save_PlayerData_GetOptionsAddr(fieldSystem->saveData);
    partyMenu->unk_25 = 0;
    partyMenu->unk_24 = 22;
    partyMenu->fieldSystem = fieldSystem;
    partyMenu->unk_26 = a0->unk05;
    for (u8 i = 0; i < 2; i++) {
        partyMenu->unk_30[i] = a0->unk06[i];
    }
    partyMenu->unk_37 = 30;
    partyMenu->unk_36_0 = 1;
    partyMenu->unk_36_4 = 1;
    partyMenu->fieldSystem_unk_10C = &fieldSystem->unk_10C;
    if (a0->challengeType == 1) { // doubles
        partyMenu->unk_36_0 = 2;
        partyMenu->unk_36_4 = 2;
    }
    FieldSystem_LaunchApplication(fieldSystem, &_0210159C, partyMenu);
    *(a0->unk08) = partyMenu;
    return 1;
}

static u32 sub_0204F3F8(UnkStruct_0204F284 *a0, FieldSystem *fieldSystem) {
    if (FieldSystem_ApplicationIsRunning(fieldSystem)) {
        return 1;
    }
    PartyMenuAppData *partyMenu = *(a0->unk08);
    switch (partyMenu->unk_26) {
        case 7:
            return 4;
        case 6:
            return 4;
        default:
            MI_CpuCopy8(partyMenu->unk_30, a0->unk06, 2);
            a0->unk05 = partyMenu->unk_26;
            FreeToHeap(partyMenu);
            *(a0->unk08) = NULL;
            return 2;
    }
}

static u32 sub_0204F448(UnkStruct_0204F284 *a0, FieldSystem *fieldSystem, HeapID heapId) {
    SaveData *saveData = fieldSystem->saveData;
    UnkStruct_0204F448 *r4 = AllocFromHeapAtEnd(heapId, sizeof(UnkStruct_0204F448));
    MI_CpuFill8(r4, 0, sizeof(UnkStruct_0204F448));
    r4->options = Save_PlayerData_GetOptionsAddr(saveData);
    r4->party = SaveArray_Party_Get(saveData);
    r4->isNatDexEnabled = SaveArray_IsNatDexEnabled(saveData);
    r4->unk2C = sub_02088288(saveData);
    r4->unk11 = 1;
    r4->unk14 = a0->unk05;
    r4->partyCount = Party_GetCount(r4->party);
    r4->unk18 = 0;
    r4->unk12 = 0;
    r4->ribbons = Save_SpecialRibbons_Get(saveData);
    r4->isFlag982Set = sub_0208828C(saveData);
    sub_02089D40(r4, unk_020FC224);
    sub_0208AD34(r4, Save_PlayerData_GetProfileAddr(saveData));
    FieldSystem_LaunchApplication(fieldSystem, &_02103A1C, r4);
    *(a0->unk08) = r4;
    return 3;
}

static u32 sub_0204F4D8(UnkStruct_0204F284 *a0, FieldSystem *fieldSystem) {
    if (FieldSystem_ApplicationIsRunning(fieldSystem)) {
        return 3;
    }
    UnkStruct_0204F448 *r0 = *(a0->unk08);
    a0->unk05 = r0->unk14;
    FreeToHeap(r0);
    *(a0->unk08) = NULL;
    return 0;
}

BOOL ScrCmd_BufferBattleHallStreak(ScriptContext *ctx) {
    u32 i;
    void *unk0;
    FieldSystem* fieldSystem = ctx->fieldSystem;
    MessageFormat **messageFormat = FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_MESSAGE_FORMAT);
    u8 strIdxWinStreak = ScriptReadByte(ctx);
    u8 strIdxCurrWinStreakTarget = ScriptReadByte(ctx);
    u8 strIdxNextWinStreakTarget = ScriptReadByte(ctx);
    u8 strIdxBP = ScriptReadByte(ctx);
    u16 *winStreakLevel = ScriptGetVarPointer(ctx);
    u16 *result = ScriptGetVarPointer(ctx);
    u32 winStreak = 0;
    u32 unk1 = 1;
    if (Save_CheckExtraChunksExist(fieldSystem->saveData) == FALSE) {
        *result = 0;
        return FALSE;
    }
    unk0 = sub_020312C4(fieldSystem->saveData, 0x20, &unk1);
    if (unk1 != 1)  {
        winStreak = 0;
    } else {
        for (i = 0; i < MAX_SPECIES; i++) {
            winStreak += sub_020312E0(fieldSystem->saveData, unk0, 0, i);
        }
    }
    if (unk0 != NULL) {
        FreeToHeap(unk0);
    }
    BufferIntegerAsString(*messageFormat, strIdxWinStreak, winStreak, CountDigits(winStreak), PRINTING_MODE_RIGHT_ALIGN, TRUE);
    u16 bp = 0;
    u32 currWinStreakLevel = 0;
    u16 prevWinStreakLevel = *winStreakLevel;
    for (i = *winStreakLevel; i < NELEMS(battleHallWinStreakBP); i++) {
        if (battleHallWinStreakBP[i].winStreakTarget <= winStreak) {
            bp += battleHallWinStreakBP[i].bp;
            (*winStreakLevel)++;
            currWinStreakLevel = i;
        }
    }
    GameStats_Add(Save_GameStats_Get(ctx->fieldSystem->saveData), GAME_STAT_BATTLE_POINTS, bp);
    if (bp != 0) {
        FrontierData_BattlePointAction(Save_FrontierData_Get(ctx->fieldSystem->saveData), bp, 5);
    }
    if (winStreak == 0) {
        *result = 0;
    } else {
        if (prevWinStreakLevel != *winStreakLevel) {
            *result = 1;
        } else {
            *result = 2;
        }
        if (prevWinStreakLevel >= NELEMS(battleHallWinStreakBP)) {
            *result = 3;
            return FALSE;
        }
    }
    u32 currWinStreakTarget = battleHallWinStreakBP[currWinStreakLevel].winStreakTarget;
    BufferIntegerAsString(*messageFormat, strIdxCurrWinStreakTarget, currWinStreakTarget, CountDigits(currWinStreakTarget), PRINTING_MODE_RIGHT_ALIGN, TRUE);
    BufferIntegerAsString(*messageFormat, strIdxNextWinStreakTarget, battleHallWinStreakBP[*winStreakLevel].winStreakTarget, CountDigits(battleHallWinStreakBP[*winStreakLevel].winStreakTarget), PRINTING_MODE_RIGHT_ALIGN, TRUE);
    BufferIntegerAsString(*messageFormat, strIdxBP, bp, CountDigits(bp), PRINTING_MODE_RIGHT_ALIGN, TRUE);
    return FALSE;
}

BOOL ScrCmd_BattleHallCountUsedSpecies(ScriptContext *ctx) {
    u32 i;
    FieldSystem* fieldSystem = ctx->fieldSystem;
    u16 *result = ScriptGetVarPointer(ctx);
    u32 numSpecies = 0;
    u32 unk0 = 1;
    if (!Save_CheckExtraChunksExist(fieldSystem->saveData)) {
        *result = 0;
        return FALSE;
    }
    void *unk1 = sub_020312C4(fieldSystem->saveData, 0x20, &unk0);
    if (unk0 != 1) {
        numSpecies = 0;
    } else {
        for (i = 0; i < MAX_SPECIES; i++) {
            u32 winStreak = 0;
            winStreak += sub_020312E0(fieldSystem->saveData, unk1, 0, i);
            winStreak += sub_020312E0(fieldSystem->saveData, unk1, 1, i);
            winStreak += sub_020312E0(fieldSystem->saveData, unk1, 2, i);
            if (winStreak > 0) {
                numSpecies++;
            }
        }
    }
    if (unk1 != NULL) {
        FreeToHeap(unk1);
    }
    *result = numSpecies;
    return FALSE;
}

#define BATTLE_HALL_MAX_WIN_STREAK (10000)

BOOL ScrCmd_BattleHallGetTotalStreak(ScriptContext *ctx) {
    FieldSystem* fieldSystem = ctx->fieldSystem;
    u16 *result = ScriptGetVarPointer(ctx);
    u32 winStreak = 0;
    u32 unk0 = 1;
    if (!Save_CheckExtraChunksExist(fieldSystem->saveData)) {
        *result = 0;
        return FALSE;
    }
    void *unk1 = sub_020312C4(fieldSystem->saveData, 0x20, &unk0);
    if (unk0 == 1) {
        for (u32 i = 0; i < MAX_SPECIES; i++) {
            winStreak += sub_020312E0(fieldSystem->saveData, unk1, 0, i);
        }
    }
    if (unk1 != NULL) {
        FreeToHeap(unk1);
    }
    if (winStreak > BATTLE_HALL_MAX_WIN_STREAK) {
        winStreak = BATTLE_HALL_MAX_WIN_STREAK;
    }
    *result = winStreak;
    return FALSE;
}

// Unused
BOOL ScrCmd_697(ScriptContext *ctx) {
    u16 *result = ScriptGetVarPointer(ctx);
    sub_020310BC(sub_0203107C(ctx->fieldSystem->saveData), sub_0205C11C(0), 0xff);
    u32 unk0 = sub_020310BC(sub_0203107C(ctx->fieldSystem->saveData), sub_0205C0CC(0), 0xff);
    *result = 0;
    if (unk0 == 50) {
        *result = 1;
    }
    return FALSE;
}

void sub_0204F85C(u32 a0, u32 unused, UnkStruct_0204F1E4 *a2, UnkStruct_0204F1E4 *a3) {
    a3->unk01++;
    if (sub_0203769C() != a0) {
        a3->partnerTeam = a2->playerTeam;
    }
}

void sub_0204F878(SaveData *saveData, u32 a1, u8 a2) {
    u8 unk0;
    unk0 = 0;
    sub_02030C6C(a1, 5, a2, 0, &unk0);
    if (a2 == 3) {
        sub_02031108(sub_0203107C(saveData), 0x6a, sub_0205C268(0x6a), 0);
    }
    sub_02031108(sub_0203107C(saveData), sub_0205C0CC(a2), sub_0205C268(sub_0205C0CC(a2)), 0);
}
