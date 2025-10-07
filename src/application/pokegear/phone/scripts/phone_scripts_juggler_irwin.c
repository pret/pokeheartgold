#include "global.h"

#include "constants/badge.h"

#include "application/pokegear/phone/phone_internal.h"

#include "math_util.h"
#include "sys_flags.h"
#include "sys_vars.h"

u16 PhoneCall_Irwin_GetQueuedScriptID(PokegearPhoneCallContext *ctx, PokegearPhoneCallState *state, u8 badgeCount, u8 hasPlainBadge);

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
    scriptID = PhoneCall_Irwin_GetQueuedScriptID(ctx, state, badgeCount, hasPlainBadge);
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

u16 PhoneCall_Irwin_GetQueuedScriptID(PokegearPhoneCallContext *ctx, PokegearPhoneCallState *state, u8 badgeCount, u8 hasPlainBadge) {
    if (!Save_VarsFlags_CheckFlagInArray(ctx->saveVarsFlags, FLAG_SYS_QUEUE_IRWIN_CALL)) {
        return 0xFFFF;
    }
    Save_VarsFlags_ClearFlagInArray(ctx->saveVarsFlags, FLAG_SYS_QUEUE_IRWIN_CALL);
    if (badgeCount >= 16) {
        if (!Save_VarsFlags_CheckFlagInArray(ctx->saveVarsFlags, FLAG_SYS_GOT_IRWIN_CALL_POST_16_BADGES)) {
            Save_VarsFlags_SetFlagInArray(ctx->saveVarsFlags, FLAG_SYS_GOT_IRWIN_CALL_POST_16_BADGES);
            return PHONE_SCRIPT_168;
        } else {
            return 0xFFFF;
        }
    } else if (PlayerProfile_TestBadgeFlag(ctx->playerProfile, BADGE_MARSH)) {
        if (!Save_VarsFlags_CheckFlagInArray(ctx->saveVarsFlags, FLAG_SYS_GOT_IRWIN_CALL_POST_MARSH_BADGE)) {
            Save_VarsFlags_SetFlagInArray(ctx->saveVarsFlags, FLAG_SYS_GOT_IRWIN_CALL_POST_MARSH_BADGE);
            return PHONE_SCRIPT_167;
        } else {
            return 0xFFFF;
        }
    } else if (Save_VarsFlags_CheckFlagInArray(ctx->saveVarsFlags, FLAG_SNORLAX_MEET)) {
        if (!Save_VarsFlags_CheckFlagInArray(ctx->saveVarsFlags, FLAG_SYS_GOT_IRWIN_CALL_POST_SNORLAX)) {
            Save_VarsFlags_SetFlagInArray(ctx->saveVarsFlags, FLAG_SYS_GOT_IRWIN_CALL_POST_SNORLAX);
            return PHONE_SCRIPT_166;
        } else {
            return 0xFFFF;
        }
    } else if (Save_VarsFlags_CheckFlagInArray(ctx->saveVarsFlags, FLAG_RETURNED_LOST_ITEM)) {
        if (!Save_VarsFlags_CheckFlagInArray(ctx->saveVarsFlags, FLAG_SYS_GOT_IRWIN_CALL_POST_LOST_ITEM_RETURN)) {
            Save_VarsFlags_SetFlagInArray(ctx->saveVarsFlags, FLAG_SYS_GOT_IRWIN_CALL_POST_LOST_ITEM_RETURN);
            return PHONE_SCRIPT_165;
        } else {
            return 0xFFFF;
        }
    } else if (Save_VarsFlags_FlypointFlagAction(ctx->saveVarsFlags, FLAG_ACTION_CHECK, VISITED_FLAG_VERMILION)) {
        return PHONE_SCRIPT_164;
    } else if (CheckGameClearFlag(ctx->saveVarsFlags)) {
        if (!Save_VarsFlags_CheckFlagInArray(ctx->saveVarsFlags, FLAG_SYS_GOT_IRWIN_CALL_POST_LANCE)) {
            Save_VarsFlags_SetFlagInArray(ctx->saveVarsFlags, FLAG_SYS_GOT_IRWIN_CALL_POST_LANCE);
            return PHONE_SCRIPT_163;
        } else {
            return 0xFFFF;
        }
    } else if (PlayerProfile_TestBadgeFlag(ctx->playerProfile, BADGE_RISING)) {
        return PHONE_SCRIPT_162;
    } else if (Save_VarsFlags_CheckFlagInArray(ctx->saveVarsFlags, FLAG_BEAT_RADIO_TOWER_ROCKETS)) {
        return PHONE_SCRIPT_161;
    } else if (Save_VarsFlags_CheckFlagInArray(ctx->saveVarsFlags, FLAG_RED_GYARADOS_MEET)) {
        if (!Save_VarsFlags_CheckFlagInArray(ctx->saveVarsFlags, FLAG_SYS_GOT_IRWIN_CALL_POST_RED_GYARADOS)) {
            Save_VarsFlags_SetFlagInArray(ctx->saveVarsFlags, FLAG_SYS_GOT_IRWIN_CALL_POST_RED_GYARADOS);
            return PHONE_SCRIPT_160;
        } else {
            return 0xFFFF;
        }
    } else if (Save_VarsFlags_CheckFlagInArray(ctx->saveVarsFlags, FLAG_SYS_HEALED_AMPHAROS)) {
        if (!Save_VarsFlags_CheckFlagInArray(ctx->saveVarsFlags, FLAG_SYS_GOT_IRWIN_CALL_POST_AMPHAROS)) {
            Save_VarsFlags_SetFlagInArray(ctx->saveVarsFlags, FLAG_SYS_GOT_IRWIN_CALL_POST_AMPHAROS);
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
