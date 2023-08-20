#include "scrcmd.h"
#include "overlay_01_021EDAFC.h"

extern Window *FieldSystem_ShowMoneyBox(FieldSystem *, u8, u8);

BOOL ScrCmd_ShowMoneyBox(ScriptContext *ctx) {
    FieldSystem *fieldSystem = ctx->fieldSystem;
    u16 xPos = ScriptGetVar(ctx);
    u16 yPos = ScriptGetVar(ctx);

    Window **moneyBox = FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_MONEY_BOX);
    *moneyBox = FieldSystem_ShowMoneyBox(ctx->fieldSystem, xPos, yPos);

    return FALSE;
}

BOOL ScrCmd_HideMoneyBox(ScriptContext *ctx) {
    FieldSystem *fieldSystem = ctx->fieldSystem;
    Window **moneyBox = FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_MONEY_BOX);
    MoneyBoxSys_Delete(*moneyBox);
    return FALSE;
}

BOOL ScrCmd_UpdateMoneyBox(ScriptContext *ctx) {
    FieldSystem *fieldSystem = ctx->fieldSystem;
    Window **moneyBox = FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_MONEY_BOX);
    MoneyBoxSys_Update(ctx->fieldSystem, *moneyBox);
    return FALSE;
}
