#include "global.h"

#include "constants/badge.h"

#include "application/pokegear/phone/phone_internal.h"

#include "math_util.h"
#include "sys_flags.h"
#include "sys_vars.h"

u16 ov101_021F42E4(PokegearPhoneCallContext *ctx, PokegearPhoneCallState *state, u8 badgeCount, u8 hasPlainBadge);

u16 PhoneCall_GetScriptId_Irwin(PokegearPhoneCallContext *ctx, PokegearPhoneCallState *state) {
    u8 badgeCount;
    u8 hasPlainBadge;
    u16 scriptID;

    state->scriptType = 0;
    if (!state->isIncomingCall) {
        if (Save_VarsFlags_IsInRocketTakeover(ctx->saveVarsFlags)) {
            return PHONE_SCRIPT_156;
        } else {
            return PHONE_SCRIPT_172 + (LCRandom() % 3);
        }
    }
    badgeCount = PlayerProfile_CountBadges(ctx->playerProfile);
    hasPlainBadge = PlayerProfile_TestBadgeFlag(ctx->playerProfile, BADGE_PLAIN);
    scriptID = ov101_021F42E4(ctx, state, badgeCount, hasPlainBadge);
    if (scriptID != 0xFFFF) {
        return scriptID;
    } else if (!hasPlainBadge) {
        return PHONE_SCRIPT_169;
    } else if (badgeCount < 16) {
        return PHONE_SCRIPT_170;
    } else {
        return PHONE_SCRIPT_171;
    }
}

u16 ov101_021F42E4(PokegearPhoneCallContext *ctx, PokegearPhoneCallState *state, u8 badgeCount, u8 hasPlainBadge) {
    if (!Save_VarsFlags_CheckFlagInArray(ctx->saveVarsFlags, FLAG_UNK_998)) {
        return 0xFFFF;
    }
    Save_VarsFlags_ClearFlagInArray(ctx->saveVarsFlags, FLAG_UNK_998);
    if (badgeCount >= 16) {
        if (!Save_VarsFlags_CheckFlagInArray(ctx->saveVarsFlags, FLAG_UNK_9A4)) {
            Save_VarsFlags_SetFlagInArray(ctx->saveVarsFlags, FLAG_UNK_9A4);
            return PHONE_SCRIPT_168;
        } else {
            return 0xFFFF;
        }
    } else if (PlayerProfile_TestBadgeFlag(ctx->playerProfile, BADGE_MARSH)) {
        if (!Save_VarsFlags_CheckFlagInArray(ctx->saveVarsFlags, FLAG_UNK_9A3)) {
            Save_VarsFlags_SetFlagInArray(ctx->saveVarsFlags, FLAG_UNK_9A3);
            return PHONE_SCRIPT_167;
        } else {
            return 0xFFFF;
        }
    } else if (Save_VarsFlags_CheckFlagInArray(ctx->saveVarsFlags, FLAG_SNORLAX_MEET)) {
        if (!Save_VarsFlags_CheckFlagInArray(ctx->saveVarsFlags, FLAG_UNK_9A2)) {
            Save_VarsFlags_SetFlagInArray(ctx->saveVarsFlags, FLAG_UNK_9A2);
            return PHONE_SCRIPT_166;
        } else {
            return 0xFFFF;
        }
    } else if (Save_VarsFlags_CheckFlagInArray(ctx->saveVarsFlags, FLAG_UNK_087)) {
        if (!Save_VarsFlags_CheckFlagInArray(ctx->saveVarsFlags, FLAG_UNK_9A1)) {
            Save_VarsFlags_SetFlagInArray(ctx->saveVarsFlags, FLAG_UNK_9A1);
            return PHONE_SCRIPT_165;
        } else {
            return 0xFFFF;
        }
    } else if (Save_VarsFlags_FlypointFlagAction(ctx->saveVarsFlags, FLAG_ACTION_CHECK, FLAG_SYS_FLYPOINT_VERMILION - FLAG_SYS_FLYPOINT_PALLET)) {
        return PHONE_SCRIPT_164;
    } else if (CheckGameClearFlag(ctx->saveVarsFlags)) {
        if (!Save_VarsFlags_CheckFlagInArray(ctx->saveVarsFlags, FLAG_UNK_9A5)) {
            Save_VarsFlags_SetFlagInArray(ctx->saveVarsFlags, FLAG_UNK_9A5);
            return PHONE_SCRIPT_163;
        } else {
            return 0xFFFF;
        }
    } else if (PlayerProfile_TestBadgeFlag(ctx->playerProfile, BADGE_RISING)) {
        return PHONE_SCRIPT_162;
    } else if (Save_VarsFlags_CheckFlagInArray(ctx->saveVarsFlags, FLAG_BEAT_RADIO_TOWER_ROCKETS)) {
        return PHONE_SCRIPT_161;
    } else if (Save_VarsFlags_CheckFlagInArray(ctx->saveVarsFlags, FLAG_RED_GYARADOS_MEET)) {
        if (!Save_VarsFlags_CheckFlagInArray(ctx->saveVarsFlags, FLAG_UNK_9A0)) {
            Save_VarsFlags_SetFlagInArray(ctx->saveVarsFlags, FLAG_UNK_9A0);
            return PHONE_SCRIPT_160;
        } else {
            return 0xFFFF;
        }
    } else if (Save_VarsFlags_CheckFlagInArray(ctx->saveVarsFlags, FLAG_UNK_96A)) {
        if (!Save_VarsFlags_CheckFlagInArray(ctx->saveVarsFlags, FLAG_UNK_99F)) {
            Save_VarsFlags_SetFlagInArray(ctx->saveVarsFlags, FLAG_UNK_99F);
            return PHONE_SCRIPT_159;
        } else {
            return 0xFFFF;
        }
    } else if (PlayerProfile_TestBadgeFlag(ctx->playerProfile, BADGE_FOG)) {
        return PHONE_SCRIPT_158;
    } else if (hasPlainBadge) {
        return PHONE_SCRIPT_157;
    } else {
        return 0xFFFF;
    }
}
