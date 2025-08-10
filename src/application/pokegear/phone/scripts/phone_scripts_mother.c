#include "global.h"

#include "application/pokegear/phone/phone_internal.h"
#include "msgdata/msg/msg_0664.h"

#include "map_header.h"
#include "sys_flags.h"

u16 MomCallGetIntroMsgByLocation(PokegearPhoneCallContext *ctx, PokegearPhoneCallState *state);
int MomCallGetSaveMoneyPromptMsg(PokegearPhoneCallContext *ctx, PokegearPhoneCallState *state);

u16 PhoneCall_GetScriptId_Mother(PokegearPhoneCallContext *ctx, PokegearPhoneCallState *state) {
    state->scriptType = 0;
    if (state->isScriptedCall == 2) {
        Save_VarsFlags_SetFlagInArray(ctx->saveVarsFlags, FLAG_TALKED_TO_MOM_AFTER_NAMING_RIVAL);
        state->scriptType = 4;
        return PHONE_SCRIPT_NONE;
    }

    if (state->phoneBookEntry->mapId == ctx->playerMapSec) {
        return PHONE_SCRIPT_023;
    }

    if (state->isIncomingCall != 0) {
        state->scriptType = 0;
        return state->predefinedScriptID;
    }

    if (!Save_VarsFlags_CheckFlagInArray(ctx->saveVarsFlags, FLAG_GAVE_RIVAL_NAME_TO_OFFICER)) {
        return PHONE_SCRIPT_025;
    }

    if (!Save_VarsFlags_CheckFlagInArray(ctx->saveVarsFlags, FLAG_TALKED_TO_MOM_AFTER_NAMING_RIVAL)) {
        return PHONE_SCRIPT_026;
    }

    state->scriptType = 4;
    return PHONE_SCRIPT_NONE;
}

BOOL GearPhoneCall_Mother(PokegearPhoneCallContext *ctx) {
    PokegearPhoneCallState *state = &ctx->state;
    int response;

    switch (state->scriptState) {
    case 0:
        PhoneCall_InitMsgDataAndBufferNames(ctx);
        state->momsSavingsBalance = PhoneCallPersistentState_MomSavings_BalanceAction(ctx->callPersistentState, MOMS_BALANCE_GET, 0);
        BufferIntegerAsString(ctx->msgFormat, 10, state->momsSavingsBalance, 6, PRINTING_MODE_LEFT_ALIGN, TRUE);
        state->flag0 = Save_VarsFlags_MomsSavingsFlagCheck(ctx->saveVarsFlags);
        state->flag1 = PhoneCallPersistentState_MomGiftQueue_IsFull(ctx->callPersistentState);
        if (state->isScriptedCall == 2) {
            state->scriptState = 2;
            return FALSE;
        }
        PhoneCallMessagePrint_Ungendered(ctx, ctx->msgData_PhoneContact, MomCallGetIntroMsgByLocation(ctx, state));
        break;
    case 1:
        if (!PhoneCall_IsMessageDonePrinting(ctx)) {
            return FALSE;
        }
        if (state->flag1) {
            PhoneCallMessagePrint_Ungendered(ctx, ctx->msgData_PhoneContact, msg_0664_00021);
            state->scriptState = 255;
            return FALSE;
        }
        break;
    case 2:
        PhoneCallMessagePrint_Ungendered(ctx, ctx->msgData_PhoneContact, MomCallGetSaveMoneyPromptMsg(ctx, state));
        break;
    case 3:
        if (!PhoneCall_IsMessageDonePrinting(ctx)) {
            return FALSE;
        }
        PhoneCall_TouchscreenListMenu_Create(ctx, 2);
        break;
    case 4:
        response = PhoneCall_TouchscreenListMenu_HandleInput(ctx);
        if (response == -1) {
            return FALSE;
        }
        PhoneCall_TouchscreenListMenu_Destroy(ctx);
        if (response == 0) {
            state->flag1 = TRUE;
            PhoneCallMessagePrint_Ungendered(ctx, ctx->msgData_PhoneContact, msg_0664_00025);
        } else {
            state->flag1 = FALSE;
            PhoneCallMessagePrint_Ungendered(ctx, ctx->msgData_PhoneContact, msg_0664_00026);
        }
        Save_VarsFlags_MomsSavingsFlagAction(ctx->saveVarsFlags, state->flag1);
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

u16 MomCallGetIntroMsgByLocation(PokegearPhoneCallContext *ctx, PokegearPhoneCallState *state) {
    return msg_0664_00007 + MapHeader_GetMomCallIntroParam(ctx->playerMapSec);
}

int MomCallGetSaveMoneyPromptMsg(PokegearPhoneCallContext *ctx, PokegearPhoneCallState *state) {
    if (state->isScriptedCall == 2) {
        return msg_0664_00022;
    }
    if (state->flag0) {
        if (state->momsSavingsBalance != 0) {
            return msg_0664_00023;
        } else {
            return msg_0664_00027;
        }
    } else {
        if (state->momsSavingsBalance != 0) {
            return msg_0664_00024;
        } else {
            return msg_0664_00028;
        }
    }
}
