#include "scrcmd_moneybox.h"

BOOL ScrCmd_ShowMoneyBox(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;    
    u16 var0 = VarGet(ctx->fsys, ScriptReadHalfword(ctx));
    u16 var1 = VarGet(ctx->fsys, ScriptReadHalfword(ctx));

    WINDOW **moneyBox = FieldSysGetAttrAddr(fsys, SCRIPTENV_MONEY_BOX);
    *moneyBox = Fsys_ShowMoneyBox(ctx->fsys, var0, var1);

    return FALSE;
}

BOOL ScrCmd_HideMoneyBox(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    WINDOW **moneyBox = FieldSysGetAttrAddr(fsys, SCRIPTENV_MONEY_BOX);
    MoneyBoxSys_Delete(*moneyBox);
    return FALSE;
}


BOOL ScrCmd_UpdateMoneyBox(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    WINDOW **moneyBox = FieldSysGetAttrAddr(fsys, SCRIPTENV_MONEY_BOX);
    MoneyBoxSys_Update(ctx->fsys, *moneyBox);
    return FALSE;
}
