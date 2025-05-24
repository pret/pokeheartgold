#include "global.h"

#include "application/pokegear/phone/phone_internal.h"
#include "msgdata/msg/msg_0644.h" // Using Whitney as the representative. All 16 Gym Leaders have the same gmm layout.

#include "math_util.h"

static BOOL isDojoFull(PokegearPhoneCallContext *ctx, u8 callerID);

u16 PhoneCall_GetScriptId_GymLeader(PokegearPhoneCallContext *ctx, PokegearPhoneCallState *state) {
    if (PlayerProfile_CountBadges(ctx->playerProfile) >= 16) {
        state->flag0 = TRUE;
    } else {
        state->flag0 = FALSE;
    }
    state->flag1 = PhoneCallPersistentState_PhoneRematches_IsSeeking(ctx->callPersistentState, state->callerID);
    if (state->isIncomingCall) {
        state->scriptType = 14;
    } else {
        state->scriptType = 13;
    }
    return PHONE_SCRIPT_NONE;
}

BOOL GearPhoneCall_GymLeader_Outgoing(PokegearPhoneCallContext *ctx) {
    PokegearPhoneCallState *state = &ctx->state;
    int yesNoResponse;

    switch (state->scriptState) {
    case 0:
        PhoneCall_InitMsgDataAndBufferNames(ctx);

        if (state->phoneBookEntry->mapId == ctx->playerMapSec) {
            state->scriptState = 255;
            PhoneCallMessagePrint_Ungendered(ctx, ctx->msgData_PhoneContact, msg_0644_00001);
            return FALSE;
        }
        PhoneCallMessagePrint_Ungendered(ctx, ctx->msgData_PhoneContact, msg_0644_00002);
        break;
    case 1:
        if (!PhoneCall_IsMessageDonePrinting(ctx)) {
            return FALSE;
        }
        if (!state->flag0) {
            PhoneCallMessagePrint_Ungendered(ctx, ctx->msgData_PhoneContact, msg_0644_00003);
            state->scriptState = 255;
            return FALSE;
        }
        if (state->flag1) {
            PhoneCallMessagePrint_Ungendered(ctx, ctx->msgData_PhoneContact, msg_0644_00009);
            state->scriptState = 255;
            return FALSE;
        }
        if (state->date.week != state->phoneBookEntry->rematchWeekday || state->timeOfDay != state->phoneBookEntry->rematchTimeOfDay) {
            PhoneCallMessagePrint_Ungendered(ctx, ctx->msgData_PhoneContact, msg_0644_00004);
            state->scriptState = 255;
            return FALSE;
        }
        PhoneCallMessagePrint_Ungendered(ctx, ctx->msgData_PhoneContact, msg_0644_00005);
        break;
    case 2:
        if (!PhoneCall_IsMessageDonePrinting(ctx)) {
            return FALSE;
        }
        PhoneCall_TouchscreenListMenu_Create(ctx, 6);
        break;
    case 3:
        yesNoResponse = PhoneCall_TouchscreenListMenu_HandleInput(ctx);
        if (yesNoResponse == TOUCH_MENU_NO_INPUT) {
            return FALSE;
        }
        PhoneCall_TouchscreenListMenu_Destroy(ctx);
        if (yesNoResponse) { // said no
            PhoneCallMessagePrint_Ungendered(ctx, ctx->msgData_PhoneContact, msg_0644_00007);
        } else if (isDojoFull(ctx, state->callerID)) {
            PhoneCallMessagePrint_Ungendered(ctx, ctx->msgData_PhoneContact, msg_0644_00006);
            PhoneCallPersistentState_PhoneRematches_SetSeeking(ctx->callPersistentState, state->callerID, TRUE);
        } else {
            PhoneCallMessagePrint_Ungendered(ctx, ctx->msgData_PhoneContact, msg_0644_00008);
        }
        break;
    default:
        if (!PhoneCall_IsMessageDonePrinting(ctx)) {
            return FALSE;
        }
        DestroyMsgData(ctx->msgData_PhoneContact);
        return TRUE;
    }

    ++state->scriptState;
    return FALSE;
}

BOOL GearPhoneCall_GymLeader_Incoming(PokegearPhoneCallContext *ctx) {
    PokegearPhoneCallState *state = &ctx->state;

    switch (state->scriptState) {
    case 0:
        PhoneCall_InitMsgDataAndBufferNames(ctx);
        PhoneCallMessagePrint_Ungendered(ctx, ctx->msgData_PhoneContact, msg_0644_00010);
        break;
    case 1:
        if (!PhoneCall_IsMessageDonePrinting(ctx)) {
            return FALSE;
        }
        if (state->flag1) {
            PhoneCallMessagePrint_Ungendered(ctx, ctx->msgData_PhoneContact, msg_0644_00011);
        } else {
            PhoneCallMessagePrint_Ungendered(ctx, ctx->msgData_PhoneContact, msg_0644_00012 + (LCRandom() % 3));
        }
        break;
    default:
        if (!PhoneCall_IsMessageDonePrinting(ctx)) {
            return FALSE;
        }
        DestroyMsgData(ctx->msgData_PhoneContact);
        return TRUE;
    }

    ++state->scriptState;
    return FALSE;
}

// It's possible this function was intended to check whether the dojo is full.
// However, it stops after a single iteration.
static BOOL isDojoFull(PokegearPhoneCallContext *ctx, u8 callerID) {
    int i;
    int count;

    static const u8 sGymLeaderContacts[] = {
        PHONE_CONTACT_FALKNER,
        PHONE_CONTACT_BUGSY,
        PHONE_CONTACT_WHITNEY,
        PHONE_CONTACT_MORTY,
        PHONE_CONTACT_CHUCK,
        PHONE_CONTACT_JASMINE,
        PHONE_CONTACT_PRYCE,
        PHONE_CONTACT_CLAIR,
        PHONE_CONTACT_BROCK,
        PHONE_CONTACT_MISTY,
        PHONE_CONTACT_LT__SURGE,
        PHONE_CONTACT_ERIKA,
        PHONE_CONTACT_JANINE,
        PHONE_CONTACT_SABRINA,
        PHONE_CONTACT_BLAINE,
        PHONE_CONTACT_BLUE,
    };

    count = 0;
    for (i = 0; i < 1; ++i) {
        if (callerID != sGymLeaderContacts[i] && PhoneCallPersistentState_PhoneRematches_IsSeeking(ctx->callPersistentState, sGymLeaderContacts[i])) {
            ++count;
        }
    }
    return count < 5;
}
