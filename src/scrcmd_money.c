#include "scrcmd.h"
#include "player_data.h"

BOOL ScrCmd_AddMoney(ScriptContext* ctx) {
    SaveData* saveData = FieldSystem_GetSaveData(ctx->fieldSystem);
    PlayerProfile* profile = Save_PlayerData_GetProfileAddr(saveData);

    u32 amount = ScriptReadWord(ctx);
    PlayerProfile_AddMoney(profile, amount);

    return FALSE;
}

BOOL ScrCmd_SubMoneyImmediate(ScriptContext* ctx) {
    SaveData* saveData = FieldSystem_GetSaveData(ctx->fieldSystem);
    PlayerProfile* profile = Save_PlayerData_GetProfileAddr(saveData);

    u32 amount = ScriptReadWord(ctx);
    PlayerProfile_SubMoney(profile, amount);

    return FALSE;
}

BOOL ScrCmd_SubMoneyVar(ScriptContext* ctx) {
    SaveData* saveData = FieldSystem_GetSaveData(ctx->fieldSystem);
    PlayerProfile* profile = Save_PlayerData_GetProfileAddr(saveData);

    u16 amount = ScriptGetVar(ctx);
    PlayerProfile_SubMoney(profile, amount);

    return FALSE;
}

BOOL ScrCmd_HasEnoughMoneyImmediate(ScriptContext* ctx) {
    SaveData* saveData = FieldSystem_GetSaveData(ctx->fieldSystem);
    PlayerProfile* profile = Save_PlayerData_GetProfileAddr(saveData);
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
    SaveData* saveData = FieldSystem_GetSaveData(ctx->fieldSystem);
    PlayerProfile* profile = Save_PlayerData_GetProfileAddr(saveData);
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
