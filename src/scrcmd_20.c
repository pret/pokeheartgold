#include "assert.h"
#include "bag.h"
#include "field_player_avatar.h"
#include "field_system.h"
#include "fieldmap.h"
#include "heap.h"
#include "mail.h"
#include "party.h"
#include "player_data.h"
#include "pokedex_util.h"
#include "pokemon_storage_system.h"
#include "pokemon.h"
#include "save_special_ribbons.h"
#include "scrcmd.h"
#include "script.h"
#include "task.h"
#include "unk_02030A98.h"
#include "unk_02035900.h"
#include "unk_0203DFA4.h"
#include "unk_0203E348.h"
#include "unk_0204F500.h"
#include "unk_0205BFF0.h"
#include "unk_02078E30.h"
#include "unk_02088288.h"
#include "unk_02091564.h"

typedef enum BattleHallChallengeType {
    BATTLE_HALL_CHALLENGE_TYPE_SINGLE,
    BATTLE_HALL_CHALLENGE_TYPE_DOUBLE,
    BATTLE_HALL_CHALLENGE_TYPE_MULTI,
} BattleHallChallengeType;

typedef struct UnkStruct_0204F1E4 {
    u8 state;
    u8 unk01;
    u8 filler[2];
    u16 playerSpecies;
    u16 partnerSpecies;
    u16 *resultPtr;
} UnkStruct_0204F1E4;

typedef struct UnkStruct_0204F284 {
    u32 state;
    u8 challengeType;
    u8 unk05;
    u8 unk06[2];
    void **unk08;
} UnkStruct_0204F284;

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
    u32 r0 = sub_02030AE8(ctx->fsys->savedata);
    u8 s = 0;
    sub_02030AA4(r0, 0xa, r5 * 4 + r4, &s);
    if (r4 == 3) {
        u32 r7;
        if (r5 == 0) {
            r7 = 0x66;
        } else {
            r7 = 0x68;
        }
        sub_02031108(sub_0203107C(ctx->fsys->savedata), r7, sub_0205C268(r7), 0);
    }
    sub_02031108(sub_0203107C(ctx->fsys->savedata), sub_0205BFF0(r5, r4), sub_0205C268(sub_0205BFF0(r5, r4)), 0);
    sub_02031108(sub_0203107C(ctx->fsys->savedata), sub_0205C048(r5, r4), sub_0205C268(sub_0205C048(r5, r4)), 0);
    return FALSE;
}

BOOL ScrCmd_633(ScriptContext *ctx) {
    u16 r7 = ScriptReadHalfword(ctx);
    u16 r5 = ScriptGetVar(ctx);
    u16 *resultPtr = ScriptGetVarPointer(ctx);
    sub_02030B04(ctx->fsys->savedata);
    u32 sp04 = sub_02030C5C(ctx->fsys->savedata);
    void *r1 = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_RUNNING_APP_DATA);
    switch (r7) {
        case 0:
            *resultPtr = BattleHall_DoesPartyContainEligibleMons(r5, ctx->fsys->savedata);
            break;
        case 1:
            if (r5 == 3) {
                *resultPtr = sub_020310BC(sub_0203107C(ctx->fsys->savedata), 0x6a, sub_0205C268(0x6a));
            } else {
                *resultPtr = sub_02030CA0(sp04, 5, r5, 0, 0);
            }
            break;
        case 2:
            *resultPtr = sub_020310BC(sub_0203107C(ctx->fsys->savedata), sub_0205C11C(r5), sub_0205C268(sub_0205C11C(r5)));
            break;
        case 3:
            sub_0204F878(ctx->fsys->savedata, sp04, r5);
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

static BOOL BattleHall_DoesPartyContainEligibleMons(s32 numRequiredMons, SaveData *savedata) {
    u8 i;
    u8 numEligibleMons;
    u16 species;
    u16 level;
    u16 form;
    PARTY *party = SaveArray_PlayerParty_Get(savedata);
    u8 partyCount = GetPartyCount(party);
    if (partyCount < numRequiredMons) {
        return FALSE;
    }
    u16 arr[6];
    for (i = 0; i < 6; i++) {
        arr[i] = SPECIES_NONE;
    }
    for (i = 0, numEligibleMons = 0; i < partyCount; i++) {
        Pokemon *mon = GetPartyMonByIndex(party, i);
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
    u32 r1 = sub_02030C5C(ctx->fsys->savedata);
    sub_0204F878(ctx->fsys->savedata, r1, r4);
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
    r4->playerSpecies = playerSpecies;
    r4->resultPtr = resultPtr;
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
                if (r4->playerSpecies == r4->partnerSpecies) {
                    *(r4->resultPtr) = FALSE;
                } else {
                    *(r4->resultPtr) = TRUE;
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
    FieldSystem *fsys = TaskManager_GetFieldSystem(taskManager);
    UnkStruct_0204F284 *r4 = AllocFromHeap(HEAP_ID_FIELD, sizeof(UnkStruct_0204F284));
    MI_CpuFill8(r4, 0, sizeof(UnkStruct_0204F284));
    r4->challengeType = challengeType;
    r4->unk08 = a1;
    TaskManager_Call(fsys->taskman, sub_0204F2B8, r4);
}

static BOOL sub_0204F2B8(TaskManager *taskManager) {
    FieldSystem *fsys = TaskManager_GetFieldSystem(taskManager);
    UnkStruct_0204F284 *r4 = TaskManager_GetEnv(taskManager);
    switch (r4->state) {
        case 0:
            r4->state = sub_0204F320(r4, fsys, HEAP_ID_FIELD);
            break;
        case 1:
            r4->state = sub_0204F3F8(r4, fsys);
            break;
        case 2:
            r4->state = sub_0204F448(r4, fsys, HEAP_ID_FIELD);
            break;
        case 3:
            r4->state = sub_0204F4D8(r4, fsys);
            break;
        case 4:
            FreeToHeap(r4);
            return TRUE;
    }
    return FALSE;
}

static u32 sub_0204F320(UnkStruct_0204F284 *a0, FieldSystem *fsys, HeapID unused) {
    PartyMenuAppData *partyMenu = AllocFromHeap(HEAP_ID_FIELD, sizeof(PartyMenuAppData));
    MIi_CpuClearFast(0, (u32*)partyMenu, sizeof(PartyMenuAppData));
    partyMenu->party = SaveArray_PlayerParty_Get(fsys->savedata);
    partyMenu->bag = Save_Bag_Get(fsys->savedata);
    partyMenu->mailbox = Save_Mailbox_Get(fsys->savedata);
    partyMenu->options = Save_PlayerData_GetOptionsAddr(fsys->savedata);
    partyMenu->unk_25 = 0;
    partyMenu->unk_24 = 22;
    partyMenu->fsys = fsys;
    partyMenu->unk_26 = a0->unk05;
    for (u8 i = 0; i < 2; i++) {
        partyMenu->unk_30[i] = a0->unk06[i];
    }
    partyMenu->unk_37 = 30;
    partyMenu->unk_36_0 = 1;
    partyMenu->unk_36_4 = 1;
    partyMenu->fsys_unk_10C = &fsys->unk_10C;
    if (a0->challengeType == 1) { // doubles
        partyMenu->unk_36_0 = 2;
        partyMenu->unk_36_4 = 2;
    }
    FieldSys_LaunchApplication(fsys, &_0210159C, partyMenu);
    *(a0->unk08) = partyMenu;
    return 1;
}

static u32 sub_0204F3F8(UnkStruct_0204F284 *a0, FieldSystem *fsys) {
    if (FieldSys_ApplicationIsRunning(fsys)) {
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

static u32 sub_0204F448(UnkStruct_0204F284 *a0, FieldSystem *fsys, HeapID heapId) {
    SaveData *savedata = fsys->savedata;
    UnkStruct_0204F448 *r4 = AllocFromHeapAtEnd(heapId, sizeof(UnkStruct_0204F448));
    MI_CpuFill8(r4, 0, sizeof(UnkStruct_0204F448));
    r4->options = Save_PlayerData_GetOptionsAddr(savedata);
    r4->party = SaveArray_PlayerParty_Get(savedata);
    r4->isNatDexEnabled = SaveArray_IsNatDexEnabled(savedata);
    r4->unk2C = sub_02088288(savedata);
    r4->unk11 = 1;
    r4->unk14 = a0->unk05;
    r4->partyCount = GetPartyCount(r4->party);
    r4->unk18 = 0;
    r4->unk12 = 0;
    r4->ribbons = Save_SpecialRibbons_Get(savedata);
    r4->isFlag982Set = sub_0208828C(savedata);
    sub_02089D40(r4, unk_020FC224);
    sub_0208AD34(r4, Save_PlayerData_GetProfileAddr(savedata));
    FieldSys_LaunchApplication(fsys, &_02103A1C, r4);
    *(a0->unk08) = r4;
    return 3;
}

static u32 sub_0204F4D8(UnkStruct_0204F284 *a0, FieldSystem *fsys) {
    if (FieldSys_ApplicationIsRunning(fsys)) {
        return 3;
    }
    UnkStruct_0204F448 *r0 = *(a0->unk08);
    a0->unk05 = r0->unk14;
    FreeToHeap(r0);
    *(a0->unk08) = NULL;
    return 0;
}
