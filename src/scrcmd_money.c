#include "scrcmd.h"
#include "player_data.h"

BOOL ScrCmd_AddMoney(ScriptContext* ctx) {
    SAVEDATA* savedata = FieldSys_GetSaveDataPtr(ctx->fsys);
    PLAYERPROFILE* profile = Save_PlayerData_GetProfileAddr(savedata);

    u32 amount = ScriptReadWord(ctx);
    PlayerProfile_AddMoney(profile, amount);

    return FALSE;
}

BOOL ScrCmd_SubMoneyImmediate(ScriptContext* ctx) {
    SAVEDATA* savedata = FieldSys_GetSaveDataPtr(ctx->fsys);
    PLAYERPROFILE* profile = Save_PlayerData_GetProfileAddr(savedata);

    u32 amount = ScriptReadWord(ctx);
    PlayerProfile_SubMoney(profile, amount);

    return FALSE;
}

BOOL ScrCmd_SubMoneyVar(ScriptContext* ctx) {
    SAVEDATA* savedata = FieldSys_GetSaveDataPtr(ctx->fsys);
    PLAYERPROFILE* profile = Save_PlayerData_GetProfileAddr(savedata);

    u16 amount = ScriptGetVar(ctx);
    PlayerProfile_SubMoney(profile, amount);

    return FALSE;
}

BOOL ScrCmd_HasEnoughMoneyImmediate(ScriptContext* ctx) {
    SAVEDATA* savedata = FieldSys_GetSaveDataPtr(ctx->fsys);
    PLAYERPROFILE* profile = Save_PlayerData_GetProfileAddr(savedata);
    u16* ret_ptr = ScriptGetVarPointer(ctx);

    u32 amount = ScriptReadWord(ctx);
    u32 money = PlayerProfile_GetMoney(profile);
    if (money < amount) {
        *ret_ptr = FALSE;
    } else {
        *ret_ptr = TRUE;
    }

    return FALSE;
}

BOOL ScrCmd_HasEnoughMoneyVar(ScriptContext* ctx) {
    SAVEDATA* savedata = FieldSys_GetSaveDataPtr(ctx->fsys);
    PLAYERPROFILE* profile = Save_PlayerData_GetProfileAddr(savedata);
    u16* ret_ptr = ScriptGetVarPointer(ctx);

    u16 amount = ScriptGetVar(ctx);
    u32 money = PlayerProfile_GetMoney(profile);
    if (money < amount) {
        *ret_ptr = FALSE;
    } else {
        *ret_ptr = TRUE;
    }

    return FALSE;
}
