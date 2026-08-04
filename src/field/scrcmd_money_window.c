#include "overlay_01_021EDAFC.h"
#include "scrcmd.h"

extern Window *FieldSystem_ShowMoneyWindow(FieldSystem *fieldSystem, u8 xPos, u8 yPos);

BOOL ScrCmd_ShowMoneyWindow(ScriptContext *ctx) {
    FieldSystem *fieldSystem = ctx->fieldSystem;
    u16 xPos = ScriptGetVar(ctx);
    u16 yPos = ScriptGetVar(ctx);

    Window **moneyWindow = FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_MONEY_WINDOW);
    *moneyWindow = FieldSystem_ShowMoneyWindow(ctx->fieldSystem, xPos, yPos);

    return FALSE;
}

BOOL ScrCmd_HideMoneyWindow(ScriptContext *ctx) {
    FieldSystem *fieldSystem = ctx->fieldSystem;
    Window **moneyWindow = FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_MONEY_WINDOW);
    MoneyBoxSys_Delete(*moneyWindow);
    return FALSE;
}

BOOL ScrCmd_UpdateMoneyWindow(ScriptContext *ctx) {
    FieldSystem *fieldSystem = ctx->fieldSystem;
    Window **moneyWindow = FieldSysGetAttrAddr(fieldSystem, SCRIPTENV_MONEY_WINDOW);
    MoneyBoxSys_Update(ctx->fieldSystem, *moneyWindow);
    return FALSE;
}
