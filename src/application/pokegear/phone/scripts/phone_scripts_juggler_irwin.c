#include "global.h"

#include "constants/badge.h"

#include "application/pokegear/phone/phone_internal.h"

#include "math_util.h"
#include "sys_flags.h"
#include "sys_vars.h"

u16 ov101_021F42E4(PokegearPhoneApp_Sub0C4 *a0, PokegearPhoneApp_Sub0C4_Sub88 *a1, u8 badgeCount, u8 hasPlainBadge);

u16 PhoneCall_GetScriptId_Irwin(PokegearPhoneApp_Sub0C4 *a0, PokegearPhoneApp_Sub0C4_Sub88 *a1) {
    u8 badgeCount;
    u8 hasPlainBadge;
    u16 scriptID;

    a1->scriptType = 0;
    if (!a1->isIncomingCall) {
        if (Save_VarsFlags_IsInRocketTakeover(a0->saveVarsFlags)) {
            return PHONE_SCRIPT_156;
        } else {
            return PHONE_SCRIPT_172 + (LCRandom() % 3);
        }
    }
    badgeCount = PlayerProfile_CountBadges(a0->playerProfile);
    hasPlainBadge = PlayerProfile_TestBadgeFlag(a0->playerProfile, BADGE_PLAIN);
    scriptID = ov101_021F42E4(a0, a1, badgeCount, hasPlainBadge);
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

u16 ov101_021F42E4(PokegearPhoneApp_Sub0C4 *a0, PokegearPhoneApp_Sub0C4_Sub88 *a1, u8 badgeCount, u8 hasPlainBadge) {
    if (!Save_VarsFlags_CheckFlagInArray(a0->saveVarsFlags, FLAG_UNK_998)) {
        return 0xFFFF;
    }
    Save_VarsFlags_ClearFlagInArray(a0->saveVarsFlags, FLAG_UNK_998);
    if (badgeCount >= 16) {
        if (!Save_VarsFlags_CheckFlagInArray(a0->saveVarsFlags, FLAG_UNK_9A4)) {
            Save_VarsFlags_SetFlagInArray(a0->saveVarsFlags, FLAG_UNK_9A4);
            return PHONE_SCRIPT_168;
        } else {
            return 0xFFFF;
        }
    } else if (PlayerProfile_TestBadgeFlag(a0->playerProfile, BADGE_MARSH)) {
        if (!Save_VarsFlags_CheckFlagInArray(a0->saveVarsFlags, FLAG_UNK_9A3)) {
            Save_VarsFlags_SetFlagInArray(a0->saveVarsFlags, FLAG_UNK_9A3);
            return PHONE_SCRIPT_167;
        } else {
            return 0xFFFF;
        }
    } else if (Save_VarsFlags_CheckFlagInArray(a0->saveVarsFlags, FLAG_SNORLAX_MEET)) {
        if (!Save_VarsFlags_CheckFlagInArray(a0->saveVarsFlags, FLAG_UNK_9A2)) {
            Save_VarsFlags_SetFlagInArray(a0->saveVarsFlags, FLAG_UNK_9A2);
            return PHONE_SCRIPT_166;
        } else {
            return 0xFFFF;
        }
    } else if (Save_VarsFlags_CheckFlagInArray(a0->saveVarsFlags, FLAG_UNK_087)) {
        if (!Save_VarsFlags_CheckFlagInArray(a0->saveVarsFlags, FLAG_UNK_9A1)) {
            Save_VarsFlags_SetFlagInArray(a0->saveVarsFlags, FLAG_UNK_9A1);
            return PHONE_SCRIPT_165;
        } else {
            return 0xFFFF;
        }
    } else if (Save_VarsFlags_FlypointFlagAction(a0->saveVarsFlags, FLAG_ACTION_CHECK, FLAG_SYS_FLYPOINT_VERMILION - FLAG_SYS_FLYPOINT_PALLET)) {
        return PHONE_SCRIPT_164;
    } else if (CheckGameClearFlag(a0->saveVarsFlags)) {
        if (!Save_VarsFlags_CheckFlagInArray(a0->saveVarsFlags, FLAG_UNK_9A5)) {
            Save_VarsFlags_SetFlagInArray(a0->saveVarsFlags, FLAG_UNK_9A5);
            return PHONE_SCRIPT_163;
        } else {
            return 0xFFFF;
        }
    } else if (PlayerProfile_TestBadgeFlag(a0->playerProfile, BADGE_RISING)) {
        return PHONE_SCRIPT_162;
    } else if (Save_VarsFlags_CheckFlagInArray(a0->saveVarsFlags, FLAG_BEAT_RADIO_TOWER_ROCKETS)) {
        return PHONE_SCRIPT_161;
    } else if (Save_VarsFlags_CheckFlagInArray(a0->saveVarsFlags, FLAG_RED_GYARADOS_MEET)) {
        if (!Save_VarsFlags_CheckFlagInArray(a0->saveVarsFlags, FLAG_UNK_9A0)) {
            Save_VarsFlags_SetFlagInArray(a0->saveVarsFlags, FLAG_UNK_9A0);
            return PHONE_SCRIPT_160;
        } else {
            return 0xFFFF;
        }
    } else if (Save_VarsFlags_CheckFlagInArray(a0->saveVarsFlags, FLAG_UNK_96A)) {
        if (!Save_VarsFlags_CheckFlagInArray(a0->saveVarsFlags, FLAG_UNK_99F)) {
            Save_VarsFlags_SetFlagInArray(a0->saveVarsFlags, FLAG_UNK_99F);
            return PHONE_SCRIPT_159;
        } else {
            return 0xFFFF;
        }
    } else if (PlayerProfile_TestBadgeFlag(a0->playerProfile, BADGE_FOG)) {
        return PHONE_SCRIPT_158;
    } else if (hasPlainBadge) {
        return PHONE_SCRIPT_157;
    } else {
        return 0xFFFF;
    }
}
