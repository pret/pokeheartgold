#include "coins.h"
#include "fieldmap.h"
#include "unk_02031904.h"
#include "script.h"
#include "scrcmd.h"
#include "overlay_01_021EDAFC.h"

extern Window *ov01_021EEC00(struct FieldSystem *fsys, u8 type, u8 x, u8 y);

BOOL ScrCmd_116(ScriptContext *ctx) {
    u8 type = ScriptReadByte(ctx);
    u16 x = ScriptGetVar(ctx);
    u16 y = ScriptGetVar(ctx);
    Window **window = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_POINTS_BOX);
    *window = ov01_021EEC00(ctx->fsys, type, x, y);
    return FALSE;
}

BOOL ScrCmd_117(ScriptContext *ctx) {
    Window **window = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_POINTS_BOX);
    ov01_021EEC68(*window);
    return FALSE;
}

BOOL ScrCmd_118(ScriptContext *ctx) {
    u8 type = ScriptReadByte(ctx);
    Window **window = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_POINTS_BOX);
    ov01_021EEC7C(ctx->fsys, *window, type);
    return FALSE;
}

BOOL ScrCmd_GetCoinAmount(ScriptContext *ctx) {
    u16 *ptr = ScriptGetVarPointer(ctx);
    *ptr = CheckCoins(Save_PlayerData_GetCoinsAddr(ctx->fsys->savedata));
    return FALSE;
}

BOOL ScrCmd_GiveCoins(ScriptContext *ctx) {
    FieldSystem *fsys = ctx->fsys;
    u16 amount = ScriptGetVar(ctx);
    GiveCoins(Save_PlayerData_GetCoinsAddr(fsys->savedata), amount);
    return FALSE;
}

BOOL ScrCmd_TakeCoins(ScriptContext *ctx) {
    FieldSystem *fsys = ctx->fsys;
    u16 amount = ScriptGetVar(ctx);
    TakeCoins(Save_PlayerData_GetCoinsAddr(fsys->savedata), amount);
    return FALSE;
}

BOOL ScrCmd_569(ScriptContext *ctx) {
    FieldSystem *fsys = ctx->fsys;
    u16 *ptr = ScriptGetVarPointer(ctx);
    TakeCoins(Save_PlayerData_GetCoinsAddr(fsys->savedata), *ptr);
    return FALSE;
}

BOOL ScrCmd_CheckCoinsImmediate(ScriptContext *ctx) {
    FieldSystem *fsys = ctx->fsys;
    u16 *ptr = ScriptGetVarPointer(ctx);
    u32 amount = ScriptReadWord(ctx);
    u16 coins = CheckCoins(Save_PlayerData_GetCoinsAddr(fsys->savedata));
    if (coins < amount) {
        *ptr = FALSE;
    } else {
        *ptr = TRUE;
    }
    return FALSE;
}

BOOL ScrCmd_CheckCoinsVar(ScriptContext *ctx) {
    FieldSystem *fsys = ctx->fsys;
    u16 *resultPtr = ScriptGetVarPointer(ctx);
    u16 *amountPtr = ScriptGetVarPointer(ctx);
    u16 coins = CheckCoins(Save_PlayerData_GetCoinsAddr(fsys->savedata));
    if (coins < *amountPtr) {
        *resultPtr = FALSE;
    } else {
        *resultPtr = TRUE;
    }
    return FALSE;
}

BOOL ScrCmd_CheckGiveCoins(ScriptContext *ctx) {
    FieldSystem *fsys = ctx->fsys;
    u16 *ptr = ScriptGetVarPointer(ctx);
    u16 amount = ScriptGetVar(ctx);
    *ptr = CanGiveCoins(Save_PlayerData_GetCoinsAddr(fsys->savedata), amount);
    return FALSE;
}

BOOL ScrCmd_GiveAthletePoints(ScriptContext *ctx) {
    FieldSystem *fsys = ctx->fsys;
    u16 amount = ScriptGetVar(ctx);
    SavePokeathlon_AddAthletePoints(Save_Pokeathlon_Get(fsys->savedata), amount);
    return FALSE;
}

BOOL ScrCmd_TakeAthletePoints(ScriptContext *ctx) {
    FieldSystem *fsys = ctx->fsys;
    u16 amount = ScriptGetVar(ctx);
    SavePokeathlon_SubAthletePoints(Save_Pokeathlon_Get(fsys->savedata), amount);
    return FALSE;
}

BOOL ScrCmd_CheckAthletePoints(ScriptContext *ctx) {
    FieldSystem *fsys = ctx->fsys;
    u16 *ptr = ScriptGetVarPointer(ctx);
    u16 amount = ScriptGetVar(ctx);
    u32 points = SavePokeathlon_GetAthletePoints(Save_Pokeathlon_Get(fsys->savedata));
    if (points < amount) {
        *ptr = FALSE;
    } else {
        *ptr = TRUE;
    }
    return FALSE;
}
