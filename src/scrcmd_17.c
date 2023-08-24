#include "scrcmd.h"
#include "pokedex.h"
#include "save_local_field_data.h"
#include "sys_flags.h"

BOOL ScrCmd_CheckPokedex(ScriptContext *ctx) {
    Pokedex *pokedex = Save_Pokedex_Get(ctx->fieldSystem->saveData);
    u16 *retPtr = ScriptGetVarPointer(ctx);
    *retPtr = Pokedex_IsEnabled(pokedex);
    return FALSE;
}

BOOL ScrCmd_GivePokedex(ScriptContext *ctx) {
    Pokedex *pokedex = Save_Pokedex_Get(ctx->fieldSystem->saveData);
    Pokedex_Enable(pokedex);
    return FALSE;
}

BOOL ScrCmd_CheckRunningShoes(ScriptContext *ctx) {
    u16 *retPtr = ScriptGetVarPointer(ctx);
    LocalFieldData *localFieldData = Save_LocalFieldData_Get(ctx->fieldSystem->saveData);
    struct PlayerSaveData *sub = LocalFieldData_GetPlayer(localFieldData);
    *retPtr = PlayerSaveData_CheckRunningShoes(sub);
    return FALSE;
}

BOOL ScrCmd_GiveRunningShoes(ScriptContext *ctx) {
    LocalFieldData *localFieldData = Save_LocalFieldData_Get(ctx->fieldSystem->saveData);
    struct PlayerSaveData *sub = LocalFieldData_GetPlayer(localFieldData);
    PlayerSaveData_SetRunningShoesFlag(sub, TRUE);
    return FALSE;
}

BOOL ScrCmd_CheckBadge(ScriptContext *ctx) {
    u16 badgeIdx = ScriptGetVar(ctx);
    u16 *ret = ScriptGetVarPointer(ctx);

    GF_ASSERT(badgeIdx < 16);
    *ret = PlayerProfile_TestBadgeFlag(Save_PlayerData_GetProfileAddr(ctx->fieldSystem->saveData), badgeIdx);
    return FALSE;
}

BOOL ScrCmd_GiveBadge(ScriptContext *ctx) {
    u16 badgeIdx = ScriptGetVar(ctx);

    GF_ASSERT(badgeIdx < 16);
    PlayerProfile_SetBadgeFlag(Save_PlayerData_GetProfileAddr(ctx->fieldSystem->saveData), badgeIdx);
    return FALSE;
}

BOOL ScrCmd_297(ScriptContext *ctx) {
    u16 *ret = ScriptGetVarPointer(ctx);

    *ret = CheckFlag960(Save_VarsFlags_Get(ctx->fieldSystem->saveData));
    return FALSE;
}

BOOL ScrCmd_CountBadges(ScriptContext *ctx) {
    u16 *ret = ScriptGetVarPointer(ctx);

    *ret = PlayerProfile_CountBadges(Save_PlayerData_GetProfileAddr(ctx->fieldSystem->saveData));
    return FALSE;
}

BOOL ScrCmd_298(ScriptContext *ctx) {
    SetFlag960(Save_VarsFlags_Get(ctx->fieldSystem->saveData));
    return FALSE;
}

BOOL ScrCmd_CheckEscortMode(ScriptContext *ctx) {
    u16 *ret = ScriptGetVarPointer(ctx);

    *ret = Save_VarsFlags_CheckHaveFollower(Save_VarsFlags_Get(ctx->fieldSystem->saveData));
    return FALSE;
}

BOOL ScrCmd_SetEscortMode(ScriptContext *ctx) {
    Save_VarsFlags_SetHaveFollowerFlag(Save_VarsFlags_Get(ctx->fieldSystem->saveData));
    return FALSE;
}

BOOL ScrCmd_ClearEscortMode(ScriptContext *ctx) {
    Save_VarsFlags_ClearHaveFollowerFlag(Save_VarsFlags_Get(ctx->fieldSystem->saveData));
    return FALSE;
}

BOOL ScrCmd_RocketCostumeFlagCheck(ScriptContext *ctx) {
    u16 *ret = ScriptGetVarPointer(ctx);

    *ret = Save_VarsFlags_CheckRocketCostumeFlag(Save_VarsFlags_Get(ctx->fieldSystem->saveData));
    return FALSE;
}

BOOL ScrCmd_RocketCostumeFlagAction(ScriptContext *ctx) {
    u8 mode = ScriptReadByte(ctx);

    if (mode) {
        Save_VarsFlags_SetRocketCostumeFlag(Save_VarsFlags_Get(ctx->fieldSystem->saveData));
    } else {
        Save_VarsFlags_ClearRocketCostumeFlag(Save_VarsFlags_Get(ctx->fieldSystem->saveData));
    }
    return FALSE;
}

BOOL ScrCmd_302(ScriptContext *ctx) {
    u16 *ret = ScriptGetVarPointer(ctx);

    *ret = CheckFlag965(Save_VarsFlags_Get(ctx->fieldSystem->saveData));
    return FALSE;
}

BOOL ScrCmd_303(ScriptContext *ctx) {
    SetFlag965(Save_VarsFlags_Get(ctx->fieldSystem->saveData));
    return FALSE;
}

BOOL ScrCmd_304(ScriptContext *ctx) {
    ClearFlag965(Save_VarsFlags_Get(ctx->fieldSystem->saveData));
    return FALSE;
}

BOOL ScrCmd_305(ScriptContext *ctx) {
    u16 *ret = ScriptGetVarPointer(ctx);

    *ret = CheckGameClearFlag(Save_VarsFlags_Get(ctx->fieldSystem->saveData));
    return FALSE;
}

BOOL ScrCmd_306(ScriptContext *ctx) {
    SetGameClearFlag(Save_VarsFlags_Get(ctx->fieldSystem->saveData));
    return FALSE;
}

BOOL ScrCmd_StrengthFlagAction(ScriptContext *ctx) {
    SaveVarsFlags *state = Save_VarsFlags_Get(ctx->fieldSystem->saveData);
    u8 mode = ScriptReadByte(ctx);
    switch (mode) {
    case FLAG_ACTION_SET:
        StrengthFlagAction(state, FLAG_ACTION_SET);
        break;
    case FLAG_ACTION_CLEAR:
        StrengthFlagAction(state, FLAG_ACTION_CLEAR);
        break;
    case FLAG_ACTION_CHECK: {
        u16 *ret = ScriptGetVarPointer(ctx);
        *ret = StrengthFlagAction(state, FLAG_ACTION_CHECK);
        break;
    }
    default:
        GF_ASSERT(0);
    }
    return FALSE;
}

BOOL ScrCmd_FlashAction(ScriptContext *ctx) {
    SaveVarsFlags *state = Save_VarsFlags_Get(ctx->fieldSystem->saveData);
    u8 mode = ScriptReadByte(ctx);
    switch (mode) {
    case FLAG_ACTION_SET:
        SysFlagFlashSet(state);
        break;
    case FLAG_ACTION_CLEAR:
        SysFlagFlashClear(state);
        break;
    case FLAG_ACTION_CHECK: {
        u16 *ret = ScriptGetVarPointer(ctx);
        *ret = SysFlagFlashCheck(state);
        break;
    }
    default:
        GF_ASSERT(0);
    }
    return FALSE;
}

// Leftover from DPPt
BOOL ScrCmd_DefogAction(ScriptContext *ctx) {
    SaveVarsFlags *state = Save_VarsFlags_Get(ctx->fieldSystem->saveData);
    u8 mode = ScriptReadByte(ctx);
    switch (mode) {
    case FLAG_ACTION_SET:
        SysFlagDefogSet(state);
        break;
    case FLAG_ACTION_CLEAR:
        SysFlagDefogClear(state);
        break;
    case FLAG_ACTION_CHECK: {
        u16 *ret = ScriptGetVarPointer(ctx);
        *ret = SysFlagDefogCheck(state);
        break;
    }
    default:
        GF_ASSERT(0);
    }
    return FALSE;
}
