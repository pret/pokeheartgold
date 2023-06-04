#include "scrcmd.h"
#include "pokedex.h"
#include "save_flypoints.h"
#include "sys_flags.h"

BOOL ScrCmd_CheckPokedex(SCRIPTCONTEXT *ctx) {
    POKEDEX *pokedex = Sav2_Pokedex_Get(ctx->fsys->savedata);
    u16 *retPtr = ScriptGetVarPointer(ctx);
    *retPtr = Pokedex_IsEnabled(pokedex);
    return FALSE;
}

BOOL ScrCmd_GivePokedex(SCRIPTCONTEXT *ctx) {
    POKEDEX *pokedex = Sav2_Pokedex_Get(ctx->fsys->savedata);
    Pokedex_Enable(pokedex);
    return FALSE;
}

BOOL ScrCmd_CheckRunningShoes(SCRIPTCONTEXT *ctx) {
    u16 *retPtr = ScriptGetVarPointer(ctx);
    FLYPOINTS_SAVE *flypointsSave = Save_FlyPoints_Get(ctx->fsys->savedata);
    struct FlypointsPlayerSub *sub = SaveFlyPoints_GetPlayerSub(flypointsSave);
    *retPtr = FlypointsPlayerSub_CheckRunningShoes(sub);
    return FALSE;
}

BOOL ScrCmd_GiveRunningShoes(SCRIPTCONTEXT *ctx) {
    FLYPOINTS_SAVE *flypointsSave = Save_FlyPoints_Get(ctx->fsys->savedata);
    struct FlypointsPlayerSub *sub = SaveFlyPoints_GetPlayerSub(flypointsSave);
    FlypointsPlayerSub_SetRunningShoesFlag(sub, TRUE);
    return FALSE;
}

BOOL ScrCmd_CheckBadge(SCRIPTCONTEXT *ctx) {
    u16 badgeIdx = ScriptGetVar(ctx);
    u16 *ret = ScriptGetVarPointer(ctx);

    GF_ASSERT(badgeIdx < 16);
    *ret = PlayerProfile_TestBadgeFlag(Sav2_PlayerData_GetProfileAddr(ctx->fsys->savedata), badgeIdx);
    return FALSE;
}

BOOL ScrCmd_GiveBadge(SCRIPTCONTEXT *ctx) {
    u16 badgeIdx = ScriptGetVar(ctx);

    GF_ASSERT(badgeIdx < 16);
    PlayerProfile_SetBadgeFlag(Sav2_PlayerData_GetProfileAddr(ctx->fsys->savedata), badgeIdx);
    return FALSE;
}

BOOL ScrCmd_297(SCRIPTCONTEXT *ctx) {
    u16 *ret = ScriptGetVarPointer(ctx);

    *ret = CheckFlag960(SavArray_Flags_Get(ctx->fsys->savedata));
    return FALSE;
}

BOOL ScrCmd_CountBadges(SCRIPTCONTEXT *ctx) {
    u16 *ret = ScriptGetVarPointer(ctx);

    *ret = PlayerProfile_CountBadges(Sav2_PlayerData_GetProfileAddr(ctx->fsys->savedata));
    return FALSE;
}

BOOL ScrCmd_298(SCRIPTCONTEXT *ctx) {
    SetFlag960(SavArray_Flags_Get(ctx->fsys->savedata));
    return FALSE;
}

BOOL ScrCmd_CheckEscortMode(SCRIPTCONTEXT *ctx) {
    u16 *ret = ScriptGetVarPointer(ctx);

    *ret = ScriptState_CheckHaveFollower(SavArray_Flags_Get(ctx->fsys->savedata));
    return FALSE;
}

BOOL ScrCmd_SetEscortMode(SCRIPTCONTEXT *ctx) {
    ScriptState_SetHaveFollowerFlag(SavArray_Flags_Get(ctx->fsys->savedata));
    return FALSE;
}

BOOL ScrCmd_ClearEscortMode(SCRIPTCONTEXT *ctx) {
    ScriptState_ClearHaveFollowerFlag(SavArray_Flags_Get(ctx->fsys->savedata));
    return FALSE;
}

BOOL ScrCmd_RocketCostumeFlagCheck(SCRIPTCONTEXT *ctx) {
    u16 *ret = ScriptGetVarPointer(ctx);

    *ret = ScriptState_CheckRocketCostumeFlag(SavArray_Flags_Get(ctx->fsys->savedata));
    return FALSE;
}

BOOL ScrCmd_RocketCostumeFlagAction(SCRIPTCONTEXT *ctx) {
    u8 mode = ScriptReadByte(ctx);

    if (mode) {
        ScriptState_SetRocketCostumeFlag(SavArray_Flags_Get(ctx->fsys->savedata));
    } else {
        ScriptState_ClearRocketCostumeFlag(SavArray_Flags_Get(ctx->fsys->savedata));
    }
    return FALSE;
}

BOOL ScrCmd_302(SCRIPTCONTEXT *ctx) {
    u16 *ret = ScriptGetVarPointer(ctx);

    *ret = CheckFlag965(SavArray_Flags_Get(ctx->fsys->savedata));
    return FALSE;
}

BOOL ScrCmd_303(SCRIPTCONTEXT *ctx) {
    SetFlag965(SavArray_Flags_Get(ctx->fsys->savedata));
    return FALSE;
}

BOOL ScrCmd_304(SCRIPTCONTEXT *ctx) {
    ClearFlag965(SavArray_Flags_Get(ctx->fsys->savedata));
    return FALSE;
}

BOOL ScrCmd_305(SCRIPTCONTEXT *ctx) {
    u16 *ret = ScriptGetVarPointer(ctx);

    *ret = CheckGameClearFlag(SavArray_Flags_Get(ctx->fsys->savedata));
    return FALSE;
}

BOOL ScrCmd_306(SCRIPTCONTEXT *ctx) {
    SetGameClearFlag(SavArray_Flags_Get(ctx->fsys->savedata));
    return FALSE;
}

BOOL ScrCmd_StrengthFlagAction(SCRIPTCONTEXT *ctx) {
    SCRIPT_STATE *state = SavArray_Flags_Get(ctx->fsys->savedata);
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

BOOL ScrCmd_FlashAction(SCRIPTCONTEXT *ctx) {
    SCRIPT_STATE *state = SavArray_Flags_Get(ctx->fsys->savedata);
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
BOOL ScrCmd_DefogAction(SCRIPTCONTEXT *ctx) {
    SCRIPT_STATE *state = SavArray_Flags_Get(ctx->fsys->savedata);
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
