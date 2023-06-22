#include "scrcmd.h"
#include "overlay_01_021EDAFC.h"

extern Window *Fsys_ShowMoneyBox(FieldSystem *, u8, u8);

BOOL ScrCmd_ShowMoneyBox(ScriptContext *ctx) {
    FieldSystem *fsys = ctx->fsys;
    u16 xPos = ScriptGetVar(ctx);
    u16 yPos = ScriptGetVar(ctx);

    Window **moneyBox = FieldSysGetAttrAddr(fsys, SCRIPTENV_MONEY_BOX);
    *moneyBox = Fsys_ShowMoneyBox(ctx->fsys, xPos, yPos);

    return FALSE;
}

BOOL ScrCmd_HideMoneyBox(ScriptContext *ctx) {
    FieldSystem *fsys = ctx->fsys;
    Window **moneyBox = FieldSysGetAttrAddr(fsys, SCRIPTENV_MONEY_BOX);
    MoneyBoxSys_Delete(*moneyBox);
    return FALSE;
}

BOOL ScrCmd_UpdateMoneyBox(ScriptContext *ctx) {
    FieldSystem *fsys = ctx->fsys;
    Window **moneyBox = FieldSysGetAttrAddr(fsys, SCRIPTENV_MONEY_BOX);
    MoneyBoxSys_Update(ctx->fsys, *moneyBox);
    return FALSE;
}
