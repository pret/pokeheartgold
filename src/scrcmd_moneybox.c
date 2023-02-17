#include "scrcmd.h"

extern WINDOW *Fsys_ShowMoneyBox(FieldSystem *, u8, u8);

BOOL ScrCmd_ShowMoneyBox(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    u16 xPos = ScriptGetVar(ctx);
    u16 yPos = ScriptGetVar(ctx);

    WINDOW **moneyBox = FieldSysGetAttrAddr(fsys, SCRIPTENV_MONEY_BOX);
    *moneyBox = Fsys_ShowMoneyBox(ctx->fsys, xPos, yPos);

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
