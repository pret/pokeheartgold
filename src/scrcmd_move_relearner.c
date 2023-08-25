#include "scrcmd.h"
#include "unk_0203E348.h"
#include "field_blackthorn_tutors.h"

BOOL ScrNative_WaitApplication(ScriptContext *ctx);

BOOL ScrCmd_394(ScriptContext *ctx) {
    u16 var0 = ScriptGetVar(ctx);
    void **runningAppData = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_RUNNING_APP_DATA); //*could* be MoveRelearner, not sure
    *runningAppData = sub_0203E7F4(HEAP_ID_32, ctx->fieldSystem, var0, 0);
    SetupNativeScript(ctx, ScrNative_WaitApplication);
    return TRUE;
}

BOOL ScrCmd_395(ScriptContext *ctx) {
    u16 *retPtr = ScriptGetVarPointer(ctx);
    void **runningAppData = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_RUNNING_APP_DATA); //*could* be MoveRelearner, not sure
    GF_ASSERT(*runningAppData != NULL);

    *retPtr = sub_0203E864(*runningAppData);
    if (*retPtr == 4) {
        *retPtr = 255;
    }

    FreeToHeap(*runningAppData);
    *runningAppData = NULL;
    return FALSE;
}

BOOL ScrCmd_466(ScriptContext *ctx) {
    u16 *retPtr = ScriptGetVarPointer(ctx);
    u16 slot = ScriptGetVar(ctx);
    Party *party = SaveArray_Party_Get(ctx->fieldSystem->saveData);
    Pokemon *mon = Party_GetMonByIndex(party, slot);
    u16 *eligibleMoves = GetEligibleLevelUpMoves(mon, HEAP_ID_32);
    *retPtr = sub_0209186C(eligibleMoves);
    FreeToHeap(eligibleMoves);
    return FALSE;
}

static void CreateMoveRelearner(ScriptContext *ctx, int a1, Pokemon *mon, u16 *eligibleMoves) {
    MoveRelearner **moveRelearnerPtr = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_RUNNING_APP_DATA);
    MoveRelearner *moveRelearner = MoveRelearner_New(HEAP_ID_32);
    *moveRelearnerPtr = moveRelearner;

    moveRelearner->mon = mon;
    moveRelearner->profile = Save_PlayerData_GetProfileAddr(FieldSystem_GetSaveData(ctx->fieldSystem));
    moveRelearner->options = Save_PlayerData_GetOptionsAddr(ctx->fieldSystem->saveData);
    moveRelearner->eligibleMoves = eligibleMoves;
    moveRelearner->unk_19 = a1;

    sub_0203F9C4(ctx->fieldSystem, moveRelearner);
    SetupNativeScript(ctx, ScrNative_WaitApplication);
    FreeToHeap(eligibleMoves);
}

BOOL ScrCmd_MoveRelearnerInit(ScriptContext *ctx) {
    u16 slot = ScriptGetVar(ctx);
    Pokemon *mon = Party_GetMonByIndex(SaveArray_Party_Get(ctx->fieldSystem->saveData), slot);
    u16 *eligibleMoves = GetEligibleLevelUpMoves(mon, HEAP_ID_32);
    CreateMoveRelearner(ctx, 1, mon, eligibleMoves);
    return TRUE;
}

BOOL ScrCmd_MoveTutorInit(ScriptContext *ctx) {
    u16 slot = ScriptGetVar(ctx);
    u16 move = ScriptGetVar(ctx);
    Pokemon *mon = Party_GetMonByIndex(SaveArray_Party_Get(ctx->fieldSystem->saveData), slot);
    u16 *eligibleMoves = AllocFromHeap(HEAP_ID_32, 2 * sizeof(u16));
    eligibleMoves[0] = move;
    eligibleMoves[1] = 0xffff;
    CreateMoveRelearner(ctx, 0, mon, eligibleMoves);
    return TRUE;
}

BOOL ScrCmd_MoveRelearnerGetResult(ScriptContext *ctx) {
    u16 *retPtr = ScriptGetVarPointer(ctx);
    MoveRelearner **moveRelearnerPtr = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_RUNNING_APP_DATA);
    MoveRelearner *moveRelearner = *moveRelearnerPtr;
    GF_ASSERT(moveRelearner != NULL);

    if (moveRelearner->padding_1A[0] == 0) {
        *retPtr = 0;
    } else {
        *retPtr = 255;
    }

    MoveRelearner_Delete(moveRelearner);
    return FALSE;
}
