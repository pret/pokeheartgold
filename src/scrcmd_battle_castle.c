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
#include "message_format.h"
#include "party.h"
#include "player_data.h"
#include "pokedex_util.h"
#include "save_special_ribbons.h"
#include "save.h"
#include "scrcmd.h"
#include "scrcmd_9.h"
#include "scrcmd_battle_castle.h"
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

typedef enum BattleCastleChallengeType {
    BATTLE_CASTLE_CHALLENGE_TYPE_SINGLE,
    BATTLE_CASTLE_CHALLENGE_TYPE_DOUBLE,
    BATTLE_CASTLE_CHALLENGE_TYPE_MULTI,
} BattleCastleChallengeType;

typedef struct UnkStruct_0204FBDC {
    u32 state;
    u8 challengeType;
    u8 unk05;
    u8 unk06[3];
    u8 filler[3];
    void **unk0c;
} UnkStruct_0204FBDC;

static void sub_0204FA14(SaveData*, u32, u8);
static void sub_0204FB20(TaskManager*, u16, u16, u16*);
static BOOL sub_0204FB60(TaskManager*);
static void sub_0204FBDC(TaskManager*, void*, BattleCastleChallengeType);
static BOOL sub_0204FC10(TaskManager*);
static u32 sub_0204FC78(UnkStruct_0204FBDC*, FieldSystem*, HeapID);
static u32 sub_0204FD50(UnkStruct_0204FBDC*, FieldSystem*);
static u32 sub_0204FDA0(UnkStruct_0204FBDC*, FieldSystem*, HeapID);
static u32 sub_0204FE30(UnkStruct_0204FBDC*, FieldSystem*);

static const u8 unk_020FC3A4[] = { 0, 1, 2, 3, 4, };

BOOL ScrCmd_637(ScriptContext *ctx) {
    u16 arg0 = ScriptReadHalfword(ctx);
    u16 arg1 = ScriptGetVar(ctx);
    u16 *result = ScriptGetVarPointer(ctx);
    sub_02030CC8(ctx->fieldSystem->saveData);
    u32 unk0 = sub_02030E08(ctx->fieldSystem->saveData);
    void *unk1 = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_RUNNING_APP_DATA);
    switch (arg0) {
        case 0:
            *result = sub_0204A5B0(arg1, ctx->fieldSystem->saveData, 0);
            break;
        case 1: // Unused
            if (arg1 == 3) {
                *result = sub_020310BC(sub_0203107C(ctx->fieldSystem->saveData), 108, sub_0205C268(108));
            } else {
                *result = sub_02030E58(unk0, 9, arg1, 0, 0);
            }
            break;
        case 3: // Unused
            sub_0204FA14(ctx->fieldSystem->saveData, unk0, arg1);
            break;
        case 4:
            BattleCastleChallengeType challengeType;
            if (arg1 == 0) {
                challengeType = BATTLE_CASTLE_CHALLENGE_TYPE_SINGLE;
            } else if (arg1 == 1) {
                challengeType = BATTLE_CASTLE_CHALLENGE_TYPE_DOUBLE;
            } else {
                challengeType = BATTLE_CASTLE_CHALLENGE_TYPE_MULTI;
            }
            sub_0204FBDC(ctx->taskman, unk1, challengeType);
            return TRUE;
        default:
            GF_ASSERT(FALSE);
            *result = 0;
            break;
    }
    return FALSE;
}

BOOL ScrCmd_640(ScriptContext *ctx) {
    u16 unk = ScriptGetVar(ctx);
    sub_0204FA14(ctx->fieldSystem->saveData, sub_02030E08(ctx->fieldSystem->saveData), unk);
    return FALSE;
}

static void sub_0204FA14(SaveData *saveData, u32 a1, u8 a2) {
    u8 unk;
    unk = 0;
    sub_02030E18(a1, 9, a2, 0, &unk);
    if (a2 == 3) {
        sub_02031108(sub_0203107C(saveData), 108, sub_0205C268(108), 0);
    }
    sub_02031108(sub_0203107C(saveData), sub_0205C1A0(a2), sub_0205C268(sub_0205C1A0(a2)), 0);    
    sub_02031108(sub_0203107C(saveData), sub_0205C1F0(a2), sub_0205C268(sub_0205C1F0(a2)), 0);
    for (s32 i = 0; i < 3; i++) {    
        sub_02031108(sub_0203107C(saveData), sub_0205C174(a2, i), sub_0205C268(sub_0205C174(a2, i)), 1);
    }
}

BOOL ScrCmd_638(ScriptContext *ctx) {
    u16 firstMon = ScriptGetVar(ctx);
    u16 secondMon = ScriptGetVar(ctx);
    u16 *result = ScriptGetVarPointer(ctx);
    sub_0204FB20(ctx->taskman, firstMon, secondMon, result);
    return TRUE;
}

static void sub_0204FB20(TaskManager *taskManager, u16 firstMon, u16 secondMon, u16 *result) {
    UnkStruct_0204FB20 *unk = AllocFromHeap(HEAP_ID_FIELD, sizeof(UnkStruct_0204FB20));
    memset(unk, 0, sizeof(UnkStruct_0204FB20));
    unk->playerTeam[0] = firstMon;
    unk->playerTeam[1] = secondMon;
    unk->result = result;
    sub_02091574(unk);
    TaskManager_Call(taskManager, sub_0204FB60, unk);
}

static BOOL sub_0204FB60(TaskManager *taskManager) {
    UnkStruct_0204FB20 *unk = TaskManager_GetEnv(taskManager);
    switch (unk->state) {
        case 0:
            if (sub_02037030(133, unk, 16) == TRUE) {
                unk->state++;
            }
            break;
        case 1:
            if (unk->unk01 >= 2) {
                *unk->result = 0;
                if (unk->playerTeam[0] == unk->partnerTeam[0] || unk->playerTeam[0] == unk->partnerTeam[1]) {
                    *unk->result += 1;
                }
                if (unk->playerTeam[1] == unk->partnerTeam[0] || unk->playerTeam[1] == unk->partnerTeam[1]) {
                    *unk->result += 2;
                }
                unk->state++;
            }
            break;
        case 2:
            FreeToHeap(unk);
            return TRUE;
    }
    return FALSE;
}

static void sub_0204FBDC(TaskManager *taskManager, void *a1, BattleCastleChallengeType challengeType) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    UnkStruct_0204FBDC *unk = AllocFromHeap(HEAP_ID_FIELD, sizeof(UnkStruct_0204FBDC));
    MI_CpuFill8(unk, 0, sizeof(UnkStruct_0204FBDC));
    unk->challengeType = challengeType;
    unk->unk0c = a1;
    TaskManager_Call(fieldSystem->taskman, sub_0204FC10, unk);
}

static BOOL sub_0204FC10(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    UnkStruct_0204FBDC *unk = TaskManager_GetEnv(taskManager);
    switch (unk->state) {
        case 0:
            unk->state = sub_0204FC78(unk, fieldSystem, HEAP_ID_FIELD);
            break;
        case 1:
            unk->state = sub_0204FD50(unk, fieldSystem);
            break;
        case 2:
            unk->state = sub_0204FDA0(unk, fieldSystem, HEAP_ID_FIELD);
            break;
        case 3:
            unk->state = sub_0204FE30(unk, fieldSystem);
            break;
        case 4:
            FreeToHeap(unk);
            return TRUE;
    }
    return FALSE;
}

static u32 sub_0204FC78(UnkStruct_0204FBDC *a0, FieldSystem *fieldSystem, HeapID unused) {
    PartyMenuAppData *partyMenu = AllocFromHeap(HEAP_ID_FIELD, sizeof(PartyMenuAppData));
    MIi_CpuClearFast(0, (u32 *)partyMenu, sizeof(PartyMenuAppData));
    partyMenu->party = SaveArray_Party_Get(fieldSystem->saveData);
    partyMenu->bag = Save_Bag_Get(fieldSystem->saveData);
    partyMenu->mailbox = Save_Mailbox_Get(fieldSystem->saveData);
    partyMenu->options = Save_PlayerData_GetOptionsAddr(fieldSystem->saveData);
    partyMenu->unk_25 = 0;
    partyMenu->unk_24 = 23;
    partyMenu->fieldSystem = fieldSystem;
    partyMenu->unk_26 = a0->unk05;
    for (u8 i = 0; i < 3; i++) {
        partyMenu->unk_30[i] = a0->unk06[i];
    }
    partyMenu->unk_37 = 100;
    partyMenu->unk_36_0 = 3;
    partyMenu->unk_36_4 = 3;
    partyMenu->fieldSystem_unk_10C = &(fieldSystem->unk_10C);
    if (a0->challengeType == BATTLE_CASTLE_CHALLENGE_TYPE_MULTI) {
        partyMenu->unk_36_0 = 2;
        partyMenu->unk_36_4 = 2;
    }
    FieldSystem_LaunchApplication(fieldSystem, &_0210159C, partyMenu);
    *(a0->unk0c) = partyMenu;
    return 1;
}

static u32 sub_0204FD50(UnkStruct_0204FBDC *a0, FieldSystem *fieldSystem) {
    if (FieldSystem_ApplicationIsRunning(fieldSystem)) {
        return TRUE;
    }
    PartyMenuAppData *partyMenu = *(a0->unk0c);
    switch (partyMenu->unk_26) {
        case 7:
            return 4;
        case 6:
            return 4;
    }
    MI_CpuCopy8(partyMenu->unk_30, a0->unk06, sizeof(partyMenu->unk_30));
    a0->unk05 = partyMenu->unk_26;
    FreeToHeap(partyMenu);
    *(a0->unk0c) = NULL;
    return 2;
}

static u32 sub_0204FDA0(UnkStruct_0204FBDC *a0, FieldSystem *fieldSystem, HeapID heapId) {
    SaveData *saveData = fieldSystem->saveData;
    UnkStruct_0204F448 *unk = AllocFromHeapAtEnd(heapId, sizeof(UnkStruct_0204F448));
    MI_CpuFill8(unk, 0, sizeof(UnkStruct_0204F448));
    unk->options = Save_PlayerData_GetOptionsAddr(saveData);
    unk->party = SaveArray_Party_Get(saveData);
    unk->isNatDexEnabled = SaveArray_IsNatDexEnabled(saveData);
    unk->unk2C = sub_02088288(saveData);
    unk->unk11 = 1;
    unk->unk14 = a0->unk05;
    unk->partyCount = Party_GetCount(unk->party);
    unk->unk18 = 0;
    unk->unk12 = 0;
    unk->ribbons = Save_SpecialRibbons_Get(saveData);
    unk->isFlag982Set = sub_0208828C(saveData);
    sub_02089D40((void*)unk, unk_020FC3A4);
    sub_0208AD34((void*)unk, Save_PlayerData_GetProfileAddr(saveData));
    FieldSystem_LaunchApplication(fieldSystem, &_02103A1C, unk);
    *(a0->unk0c) = unk;
    return 3;
}

static u32 sub_0204FE30(UnkStruct_0204FBDC *a0, FieldSystem *fieldSystem) {
    if (FieldSystem_ApplicationIsRunning(fieldSystem)) {
        return 3;
    }
    UnkStruct_0204F448 *unk = *(a0->unk0c);
    a0->unk05 = unk->unk14;
    FreeToHeap(unk);
    *(a0->unk0c) = NULL;
    return 0;
}

void sub_0204FE58(u32 a0, u32 unused, UnkStruct_0204FB20 *a2, UnkStruct_0204FB20 *a3) {
    a3->unk01++;
    if (sub_0203769C() != a0) {
        a3->partnerTeam[0] = a2->playerTeam[0];
        a3->partnerTeam[1] = a2->playerTeam[1];
    }
}
