#include "scrcmd.h"
#include "unk_0203E348.h"
#include "field_blackthorn_tutors.h"

BOOL ScrNative_WaitApplication(SCRIPTCONTEXT *ctx);

BOOL ScrCmd_394(SCRIPTCONTEXT *ctx) {
    u16 var0 = ScriptGetVar(ctx);
    void **unkAC = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_AC);
    *unkAC = sub_0203E7F4(32, ctx->fsys, var0, 0);
    SetupNativeScript(ctx, ScrNative_WaitApplication);
    return TRUE;
}

BOOL ScrCmd_395(SCRIPTCONTEXT *ctx) {
    u16 *retPtr = ScriptGetVarPointer(ctx);
    void **unkAC = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_AC);
    GF_ASSERT(*unkAC != NULL);

    *retPtr = sub_0203E864(*unkAC);
    if (*retPtr == 4) {
        *retPtr = 255;
    }

    FreeToHeap(*unkAC);
    *unkAC = NULL;
    return FALSE;
}

BOOL ScrCmd_466(SCRIPTCONTEXT *ctx) {
    u16 *retPtr = ScriptGetVarPointer(ctx);
    u16 slot = ScriptGetVar(ctx);
    PARTY *party = SavArray_PlayerParty_get(ctx->fsys->savedata);
    POKEMON *pokemon = GetPartyMonByIndex(party, slot);
    u16 *eligibleMoves = GetEligibleLevelUpMoves(pokemon, 32);
    *retPtr = sub_0209186C(eligibleMoves);
    FreeToHeap(eligibleMoves);
    return FALSE;
}

static void CreateMoveRelearner(SCRIPTCONTEXT *ctx, int a1, POKEMON *pokemon, u16 *eligibleMoves) {
    void **unkAC = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_AC);
    struct MoveRelearner *moveRelearner = MoveRelearner_new(32);
    *unkAC = moveRelearner;

    moveRelearner->pokemon = pokemon;
    moveRelearner->profile = Sav2_PlayerData_GetProfileAddr(Fsys_GetSaveDataPtr(ctx->fsys)); 
    moveRelearner->options = Sav2_PlayerData_GetOptionsAddr(ctx->fsys->savedata);
    moveRelearner->eligibleMoves = eligibleMoves;
    moveRelearner->unk_19 = a1;

    sub_0203F9C4(ctx->fsys, moveRelearner);
    SetupNativeScript(ctx, ScrNative_WaitApplication);
    FreeToHeap(eligibleMoves);
}

BOOL ScrCmd_MoveRelearnerInit(SCRIPTCONTEXT *ctx) {
    u16 slot = ScriptGetVar(ctx);
    POKEMON *pokemon = GetPartyMonByIndex(SavArray_PlayerParty_get(ctx->fsys->savedata), slot);
    u16 *eligibleMoves = GetEligibleLevelUpMoves(pokemon, 32);
    CreateMoveRelearner(ctx, 1, pokemon, eligibleMoves);
    return TRUE;
}

BOOL ScrCmd_MoveTutorInit(SCRIPTCONTEXT *ctx) {
    u16 slot = ScriptGetVar(ctx);
    u16 move = ScriptGetVar(ctx);
    POKEMON *pokemon = GetPartyMonByIndex(SavArray_PlayerParty_get(ctx->fsys->savedata), slot);
    u16 *eligibleMoves = AllocFromHeap(32, 4);
    eligibleMoves[0] = move;
    eligibleMoves[1] = 0xffff;
    CreateMoveRelearner(ctx, 0, pokemon, eligibleMoves);
    return TRUE;
}

BOOL ScrCmd_MoveRelearnerGetResult(SCRIPTCONTEXT *ctx) {
    u16 *retPtr = ScriptGetVarPointer(ctx);
    void **unkAC = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_AC);
    struct MoveRelearner *moveRelearner = *unkAC;
    GF_ASSERT(moveRelearner != NULL);

    if (moveRelearner->padding_1A[0] == 0) {
        *retPtr = 0;
    } else {
        *retPtr = 255;
    }

    MoveRelearner_delete(moveRelearner);
    return FALSE;
}
