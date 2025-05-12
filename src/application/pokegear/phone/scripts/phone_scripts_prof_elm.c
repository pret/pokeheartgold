#include "global.h"

#include "application/pokegear/phone/phone_internal.h"

#include "math_util.h"
#include "sys_flags.h"
#include "sys_vars.h"

static const u8 sPhoneCallData_ProfElm_MapScripts[][2] = {
    // H-hello? {STRVAR_1 3, 0, 0}?\rIt’s a disaster!\nUh, um, it’s just terrible!\rWhat should I do?\nIt... Oh, no...\rPlease get back here now!
    { 0, PHONE_SCRIPT_002 },
    // Hello, {STRVAR_1 3, 0, 0}?\nWe’ve discovered something!\rThe details are...well, I can’t really\nsay anything, but we want you to carry\fthat Egg!\rMy assistant is at the Poké Mart in\nViolet City. Could you go meet him and\fpick up that Egg?
    { 0, PHONE_SCRIPT_003 },
    // {STRVAR_1 3, 0, 0}, how are things going?\rI called because something weird is\nhappening with the radio broadcasts.\rThey were talking about Team Rocket.\r{STRVAR_1 3, 0, 0}, do you know anything\nabout it?\rMaybe Team Rocket has returned.\nNo, that just can’t be true.\rSorry to bug you. Take care!
    { 0, PHONE_SCRIPT_004 },
    // Hello, {STRVAR_1 3, 0, 0}?\nHow’s it going?\rI’ve gotten hold of something neat.\nSwing by my Lab and pick it up!\rSee you later!
    { 0, PHONE_SCRIPT_005 },
    // Hello, {STRVAR_1 3, 0, 0}?\rI have something here for you.\nCould you swing by my Lab?\rSee you later!
    { 0, PHONE_SCRIPT_006 },
};

u16 PhoneCall_GetScriptId_ProfElm(PokegearPhoneCallContext *ctx, PokegearPhoneCallState *state) {
    u8 badgeCount;
    u8 hatchedEgg;
    u8 gotEverstone;

    if (state->isScriptedCall == 2) {
        state->scriptType = sPhoneCallData_ProfElm_MapScripts[state->predefinedScriptID][0];
        return sPhoneCallData_ProfElm_MapScripts[state->predefinedScriptID][1];
    }
    if (state->isIncomingCall) {
        state->scriptType = 0;
        return state->predefinedScriptID;
    }
    state->scriptType = 0;
    badgeCount = PlayerProfile_CountBadges(ctx->playerProfile);

    if (state->phoneBookEntry->mapId == ctx->playerMapSec) {
        return PHONE_SCRIPT_001;
    }
    if (!Save_VarsFlags_CheckFlagInArray(ctx->saveVarsFlags, FLAG_GOT_ELMS_PANIC_CALL)) {
        return PHONE_SCRIPT_008;
    }
    if (!Save_VarsFlags_CheckFlagInArray(ctx->saveVarsFlags, FLAG_GAVE_RIVAL_NAME_TO_OFFICER)) {
        return PHONE_SCRIPT_009;
    }
    if (!Save_VarsFlags_CheckFlagInArray(ctx->saveVarsFlags, FLAG_GOT_PICK_UP_EGG_CALL_FROM_ELM)) {
        return PHONE_SCRIPT_010;
    }
    if (!Save_VarsFlags_CheckFlagInArray(ctx->saveVarsFlags, FLAG_GOT_EGG_FROM_ELMS_ASSISTANT)) {
        return PHONE_SCRIPT_011;
    }
    hatchedEgg = Save_VarsFlags_CheckFlagInArray(ctx->saveVarsFlags, FLAG_SYS_HATCHED_TOGEPI_EGG);
    gotEverstone = Save_VarsFlags_CheckFlagInArray(ctx->saveVarsFlags, FLAG_GOT_EVERSTONE_FROM_ELM);
    if (badgeCount < 7) {
        if (!hatchedEgg) {
            return PHONE_SCRIPT_012;
        } else if (gotEverstone) {
            return PHONE_SCRIPT_014 + (LCRandom() % 2);
        } else {
            return PHONE_SCRIPT_013;
        }
    }
    if (Save_VarsFlags_IsInRocketTakeover(ctx->saveVarsFlags)) {
        return PHONE_SCRIPT_016;
    }
    if (badgeCount < 8) {
        return PHONE_SCRIPT_017;
    }
    if (!CheckGameClearFlag(ctx->saveVarsFlags)) {
        return PHONE_SCRIPT_018;
    }
    if (!Save_VarsFlags_CheckFlagInArray(ctx->saveVarsFlags, FLAG_GOT_SS_TICKET_FROM_ELM)) {
        return PHONE_SCRIPT_019;
    }
    if (!gotEverstone) {
        if (hatchedEgg) {
            return PHONE_SCRIPT_013;
        } else {
            return PHONE_SCRIPT_012;
        }
    }
    if (Save_VarsFlags_CheckFlagInArray(ctx->saveVarsFlags, FLAG_WAS_TOLD_ABOUT_POKERUS)) {
        return PHONE_SCRIPT_020 + (LCRandom() % 3);
    }
    return PHONE_SCRIPT_020 + (LCRandom() % 2);
}
