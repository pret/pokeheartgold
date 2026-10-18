#include "global.h"

#include "application/pokegear/phone/phone_internal.h"
#include "msgdata/msg/msg_0643.h"

#include "unk_02031B0C.h"

u16 PhoneCall_GetScriptId_Kurt(PokegearPhoneCallContext *ctx, PokegearPhoneCallState *state) {
    state->scriptType = 0;
    if (state->phoneBookEntry->mapId == ctx->playerMapSec) {
        return PHONE_SCRIPT_083;
    } else {
        state->scriptType = 12;
        return PHONE_SCRIPT_NONE;
    }
}

BOOL GearPhoneCall_Kurt(PokegearPhoneCallContext *ctx) {
    PokegearPhoneCallState *state = &ctx->state;
    SaveApricornBox *apricornBox;
    u32 kurtQuantity;
    u8 msgId;

    switch (state->scriptState) {
    case 0:
        PhoneCall_InitMsgDataAndBufferNames(ctx);
        if (Save_VarsFlags_CheckFlagInArray(ctx->saveVarsFlags, FLAG_UNK_127)) {
            PhoneCallMessagePrint_Ungendered(ctx, ctx->msgData_PhoneContact, msg_0643_00006);
        } else {
            PhoneCallMessagePrint_Ungendered(ctx, ctx->msgData_PhoneContact, msg_0643_00002);
        }
        break;
    case 1:
        if (!PhoneCall_IsMessageDonePrinting(ctx)) {
            return FALSE;
        }
        apricornBox = Save_ApricornBox_Get(ctx->saveData);
        kurtQuantity = ApricornBox_GetKurtQuantity(apricornBox);
        if (kurtQuantity == 0) {
            msgId = msg_0643_00005;
        } else if (Save_VarsFlags_CheckFlagInArray(ctx->saveVarsFlags, FLAG_DAILY_KURT_MAKING_BALLS)) {
            msgId = msg_0643_00004;
        } else {
            BufferItemName(ctx->msgFormat, 10, ApricornBox_GetKurtBall(apricornBox));
            BufferIntegerAsString(ctx->msgFormat, 11, kurtQuantity, 2, PRINTING_MODE_LEFT_ALIGN, TRUE);
            msgId = msg_0643_00003;
        }
        PhoneCallMessagePrint_Ungendered(ctx, ctx->msgData_PhoneContact, msgId);
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
