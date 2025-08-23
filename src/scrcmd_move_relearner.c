#include "launch_application.h"
#include "move_relearner.h"
#include "scrcmd.h"
#include "unk_02088288.h"

BOOL ScrNative_WaitApplication(ScriptContext *ctx);

// Triggered for move deleter
BOOL ScrCmd_394(ScriptContext *ctx) {
    u16 var0 = ScriptGetVar(ctx);
    PokemonSummaryArgs **runningAppData = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_RUNNING_APP_DATA);
    *runningAppData = LearnForgetMove_LaunchApp(HEAP_ID_FIELD3, ctx->fieldSystem, var0, 0);
    SetupNativeScript(ctx, ScrNative_WaitApplication);
    return TRUE;
}

BOOL ScrCmd_395(ScriptContext *ctx) {
    u16 *retPtr = ScriptGetVarPointer(ctx);
    void **runningAppData = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_RUNNING_APP_DATA); //*could* be MoveRelearnerArgs, not sure
    GF_ASSERT(*runningAppData != NULL);

    *retPtr = sub_0203E864(*runningAppData);
    if (*retPtr == 4) {
        *retPtr = 255;
    }

    Heap_Free(*runningAppData);
    *runningAppData = NULL;
    return FALSE;
}

BOOL ScrCmd_466(ScriptContext *ctx) {
    u16 *retPtr = ScriptGetVarPointer(ctx);
    u16 slot = ScriptGetVar(ctx);
    Party *party = SaveArray_Party_Get(ctx->fieldSystem->saveData);
    Pokemon *mon = Party_GetMonByIndex(party, slot);
    u16 *eligibleMoves = MoveRelearner_GetEligibleLevelUpMoves(mon, HEAP_ID_FIELD3);
    *retPtr = MoveRelearner_IsValidMove(eligibleMoves);
    Heap_Free(eligibleMoves);
    return FALSE;
}

static void StartMoveRelearner(ScriptContext *ctx, int type, Pokemon *mon, u16 *eligibleMoves) {
    MoveRelearnerArgs **moveRelearnerPtr = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_RUNNING_APP_DATA);
    MoveRelearnerArgs *moveRelearner = MoveRelearner_New(HEAP_ID_FIELD3);
    *moveRelearnerPtr = moveRelearner;

    moveRelearner->mon = mon;
    moveRelearner->profile = Save_PlayerData_GetProfile(FieldSystem_GetSaveData(ctx->fieldSystem));
    moveRelearner->options = Save_PlayerData_GetOptionsAddr(ctx->fieldSystem->saveData);
    moveRelearner->eligibleMoves = eligibleMoves;
    moveRelearner->type = type;

    MoveRelearner_LaunchApp(ctx->fieldSystem, moveRelearner);
    SetupNativeScript(ctx, ScrNative_WaitApplication);
    Heap_Free(eligibleMoves);
}

BOOL ScrCmd_MoveRelearner(ScriptContext *ctx) {
    u16 slot = ScriptGetVar(ctx);
    Pokemon *mon = Party_GetMonByIndex(SaveArray_Party_Get(ctx->fieldSystem->saveData), slot);
    u16 *eligibleMoves = MoveRelearner_GetEligibleLevelUpMoves(mon, HEAP_ID_FIELD3);
    StartMoveRelearner(ctx, 1, mon, eligibleMoves);
    return TRUE;
}

BOOL ScrCmd_MoveTutor(ScriptContext *ctx) {
    u16 slot = ScriptGetVar(ctx);
    u16 move = ScriptGetVar(ctx);
    Pokemon *mon = Party_GetMonByIndex(SaveArray_Party_Get(ctx->fieldSystem->saveData), slot);
    u16 *eligibleMoves = Heap_Alloc(HEAP_ID_FIELD3, 2 * sizeof(u16));
    eligibleMoves[0] = move;
    eligibleMoves[1] = 0xffff;
    StartMoveRelearner(ctx, MOVE_RELEARNER_TUTOR, mon, eligibleMoves);
    return TRUE;
}

BOOL ScrCmd_MoveRelearnerGetResult(ScriptContext *ctx) {
    u16 *retPtr = ScriptGetVarPointer(ctx);
    MoveRelearnerArgs **moveRelearnerPtr = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_RUNNING_APP_DATA);
    MoveRelearnerArgs *moveRelearner = *moveRelearnerPtr;
    GF_ASSERT(moveRelearner != NULL);

    if (moveRelearner->padding_1A[0] == 0) {
        *retPtr = 0;
    } else {
        *retPtr = 255;
    }

    MoveRelearner_Delete(moveRelearner);
    return FALSE;
}
