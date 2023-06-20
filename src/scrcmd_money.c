#include "scrcmd.h"
#include "player_data.h"

BOOL ScrCmd_AddMoney(ScriptContext* ctx) {
    SaveData* savedata = FieldSys_GetSaveDataPtr(ctx->fsys);
    PlayerProfile* profile = Save_PlayerData_GetProfileAddr(savedata);

    u32 amount = ScriptReadWord(ctx);
    PlayerProfile_AddMoney(profile, amount);

    return FALSE;
}

BOOL ScrCmd_SubMoneyImmediate(ScriptContext* ctx) {
    SaveData* savedata = FieldSys_GetSaveDataPtr(ctx->fsys);
    PlayerProfile* profile = Save_PlayerData_GetProfileAddr(savedata);

    u32 amount = ScriptReadWord(ctx);
    PlayerProfile_SubMoney(profile, amount);

    return FALSE;
}

BOOL ScrCmd_SubMoneyVar(ScriptContext* ctx) {
    SaveData* savedata = FieldSys_GetSaveDataPtr(ctx->fsys);
    PlayerProfile* profile = Save_PlayerData_GetProfileAddr(savedata);

    u16 amount = ScriptGetVar(ctx);
    PlayerProfile_SubMoney(profile, amount);

    return FALSE;
}

BOOL ScrCmd_HasEnoughMoneyImmediate(ScriptContext* ctx) {
    SaveData* savedata = FieldSys_GetSaveDataPtr(ctx->fsys);
    PlayerProfile* profile = Save_PlayerData_GetProfileAddr(savedata);
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
    SaveData* savedata = FieldSys_GetSaveDataPtr(ctx->fsys);
    PlayerProfile* profile = Save_PlayerData_GetProfileAddr(savedata);
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
