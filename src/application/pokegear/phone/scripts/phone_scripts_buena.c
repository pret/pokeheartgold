#include "global.h"

#include "application/pokegear/phone/phone_internal.h"
#include "msgdata/msg/msg_0641.h"

#include "math_util.h"
#include "phonebook_dat.h"
#include "sys_flags.h"
#include "sys_vars.h"

static u8 IsBuenasPasswordOnAir(u8 hour);

u16 PhoneCall_GetScriptId_Buena(PokegearPhoneCallContext *ctx, PokegearPhoneCallState *state) {
    state->scriptType = 0;
    state->flag0 = CheckGameClearFlag(ctx->saveVarsFlags);
    state->sharedU8var = IsBuenasPasswordOnAir(state->time.hour);
    if (Save_VarsFlags_IsInRocketTakeover(ctx->saveVarsFlags)) {
        return PHONE_SCRIPT_099;
    }
    if (state->isIncomingCall) {
        state->scriptType = 9;
        return PHONE_SCRIPT_NONE;
    }
    if (state->sharedU8var == 3) {
        return PHONE_SCRIPT_100;
    }
    if (state->phoneBookEntry->mapId == ctx->playerMapSec) {
        return PHONE_SCRIPT_098;
    }
    state->scriptType = 8;
    return PHONE_SCRIPT_NONE;
}

BOOL GearPhoneCall_Buena(PokegearPhoneCallContext *ctx) {
    PokegearPhoneCallState *state = &ctx->state;

    switch (state->scriptState) {
    case 0:
        PhoneCall_InitMsgDataAndBufferNames(ctx);
        PhoneCallMessagePrint_Gendered(ctx, ctx->msgData_PhoneContact, state->timeOfDay * 2 + msg_0641_00003, state->timeOfDay * 2 + msg_0641_00004);
        break;
    case 1:
        if (!PhoneCall_IsMessageDonePrinting(ctx)) {
            return FALSE;
        }
        PhoneCallMessagePrint_Ungendered(ctx, ctx->msgData_PhoneContact, msg_0641_00010 + (LCRandom() % 3));
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

BOOL GearPhoneCall_Buena2(PokegearPhoneCallContext *ctx) {
    PokegearPhoneCallState *state = &ctx->state;
    u8 r5;
    u8 r2;

    switch (state->scriptState) {
    case 0:
        PhoneCall_InitMsgDataAndBufferNames(ctx);
        PhoneCallMessagePrint_Gendered(ctx, ctx->msgData_PhoneContact, state->timeOfDay * 2 + msg_0641_00015, state->timeOfDay * 2 + msg_0641_00016);
        break;
    case 1:
        if (!PhoneCall_IsMessageDonePrinting(ctx)) {
            return FALSE;
        }
        if (state->sharedU8var == 3) {
            PhoneCallMessagePrint_Ungendered(ctx, ctx->msgData_PhoneContact, msg_0641_00036);
        } else {
            r5 = 11 + state->flag0 * 3;
            r2 = LCRandom() % r5;
            if (r2 == 13) {
                PhoneCallMessagePrint_Gendered(ctx, ctx->msgData_PhoneContact, msg_0641_00034, msg_0641_00035);
            } else {
                PhoneCallMessagePrint_Ungendered(ctx, ctx->msgData_PhoneContact, msg_0641_00021 + r2);
            }
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

static u8 IsBuenasPasswordOnAir(u8 hour) {
    // Different messages at different times of day

    // hour % 3 == 2, so 2, 5, 8, 11 AM/PM
    if (sub_02095FF8(hour)) {
        return 3;
    }
    if (hour > 3 && hour < 10) {
        return 0;
    }
    if (hour > 9 && hour < 20) {
        return 1;
    }
    return 2;
}
