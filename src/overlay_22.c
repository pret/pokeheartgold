#include "coins.h"
#include "fieldmap.h"
#include "save_pokeathlon.h"
#include "script.h"
#include "scrcmd.h"

extern WINDOW *ov01_021EEC00(struct FieldSystem *fsys, u8 type, u8 x, u8 y);

BOOL ScrCmd_116(SCRIPTCONTEXT *ctx) {
    u8 type = *ctx->script_ptr++;
    u16 x = VarGet(ctx->fsys, ScriptReadHalfword(ctx));
    u16 y = VarGet(ctx->fsys, ScriptReadHalfword(ctx));
    WINDOW **window = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_BC);
    *window = ov01_021EEC00(ctx->fsys, type, x, y);
    return FALSE;
}

BOOL ScrCmd_117(SCRIPTCONTEXT *ctx) {
    WINDOW **window = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_BC);
    ov01_021EEC68(*window);
    return FALSE;
}

BOOL ScrCmd_118(SCRIPTCONTEXT *ctx) {
    u8 type = *ctx->script_ptr++;
    WINDOW **window = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_BC);
    ov01_021EEC7C(ctx->fsys, *window, type);
    return FALSE;
}

BOOL ScrCmd_GetCoinAmount(SCRIPTCONTEXT *ctx) {
    u16 *ptr = GetVarPointer(ctx->fsys, ScriptReadHalfword(ctx));
    *ptr = CheckCoins(Sav2_PlayerData_GetCoinsAddr(ctx->fsys->savedata));
    return FALSE;
}

BOOL ScrCmd_GiveCoins(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    u16 amount = VarGet(ctx->fsys, ScriptReadHalfword(ctx));
    GiveCoins(Sav2_PlayerData_GetCoinsAddr(fsys->savedata), amount);
    return FALSE;
}

BOOL ScrCmd_TakeCoins(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    u16 amount = VarGet(ctx->fsys, ScriptReadHalfword(ctx));
    TakeCoins(Sav2_PlayerData_GetCoinsAddr(fsys->savedata), amount);
    return FALSE;
}

BOOL ScrCmd_569(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    u16 *ptr = GetVarPointer(ctx->fsys, ScriptReadHalfword(ctx));
    TakeCoins(Sav2_PlayerData_GetCoinsAddr(fsys->savedata), *ptr);
    return FALSE;
}

BOOL ScrCmd_CheckCoinsImmediate(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    u16 *ptr = GetVarPointer(ctx->fsys, ScriptReadHalfword(ctx));
    u32 amount = ScriptReadWord(ctx);
    u16 coins = CheckCoins(Sav2_PlayerData_GetCoinsAddr(fsys->savedata));
    if (coins < amount) {
        *ptr = FALSE;
    } else {
        *ptr = TRUE;
    }
    return FALSE;
}

BOOL ScrCmd_CheckCoinsVar(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    u16 *resultPtr = GetVarPointer(ctx->fsys, ScriptReadHalfword(ctx));
    u16 *amountPtr = GetVarPointer(ctx->fsys, ScriptReadHalfword(ctx));
    u16 coins = CheckCoins(Sav2_PlayerData_GetCoinsAddr(fsys->savedata));
    if (coins < *amountPtr) {
        *resultPtr = FALSE;
    } else {
        *resultPtr = TRUE;
    }
    return FALSE;
}

BOOL ScrCmd_CheckGiveCoins(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    u16 *ptr = GetVarPointer(ctx->fsys, ScriptReadHalfword(ctx));
    u16 amount = VarGet(ctx->fsys, ScriptReadHalfword(ctx));
    *ptr = CanGiveCoins(Sav2_PlayerData_GetCoinsAddr(fsys->savedata), amount);
    return FALSE;
}

BOOL ScrCmd_GiveAthletePoints(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    u16 amount = VarGet(ctx->fsys, ScriptReadHalfword(ctx));
    SavePokeathlon_AddAthletePoints(Save_Pokeathlon_get(fsys->savedata), amount);
    return FALSE;
}

BOOL ScrCmd_TakeAthletePoints(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    u16 amount = VarGet(ctx->fsys, ScriptReadHalfword(ctx));
    SavePokeathlon_SubAthletePoints(Save_Pokeathlon_get(fsys->savedata), amount);
    return FALSE;
}

BOOL ScrCmd_CheckAthletePoints(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    u16 *ptr = GetVarPointer(ctx->fsys, ScriptReadHalfword(ctx));
    u16 amount = VarGet(ctx->fsys, ScriptReadHalfword(ctx));
    u32 points = SavePokeathlon_GetAthletePoints(Save_Pokeathlon_get(fsys->savedata));
    if (points < amount) {
        *ptr = FALSE;
    } else {
        *ptr = TRUE;
    }
    return FALSE;
}
