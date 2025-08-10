#include "global.h"

#include "application/pokegear/phone/phone_internal.h"
#include "msgdata/msg/msg_0665.h"

#include "math_util.h"
#include "save_arrays.h"

u16 PhoneCall_GetScriptId_Bill(PokegearPhoneCallContext *ctx, PokegearPhoneCallState *state) {
    if (state->isIncomingCall != 0) {
        state->scriptType = 0;
        return PHONE_SCRIPT_093;
    }
    if (state->phoneBookEntry->mapId == ctx->playerMapSec) {
        state->scriptType = 0;
        return PHONE_SCRIPT_092;
    }
    state->scriptType = 3;
    return PHONE_SCRIPT_NONE;
}

BOOL GearPhoneCall_Bill(PokegearPhoneCallContext *ctx) {
    PokegearPhoneCallState *state = &ctx->state;
    PCStorage *pcStorage;
    u32 count;

    switch (state->scriptState) {
    case 0:
        PhoneCall_InitMsgDataAndBufferNames(ctx);
        break;
    case 1:
        if (!PhoneCall_PrintGreeting(ctx)) {
            return FALSE;
        }
        PhoneCallMessagePrint_Gendered(ctx, ctx->msgData_PhoneContact, msg_0665_00003, msg_0665_00004);
        break;
    case 2:
        if (!PhoneCall_IsMessageDonePrinting(ctx)) {
            return FALSE;
        }
        pcStorage = SaveArray_PCStorage_Get(ctx->saveData);
        PCStorage_GetBoxName(pcStorage, PCStorage_GetActiveBox(pcStorage), ctx->msgExpansionBuff);
        BufferString(ctx->msgFormat, 10, ctx->msgExpansionBuff, 2, 1, 2);
        count = PCStorage_CountEmptySpotsInAllBoxes(pcStorage);
        BufferIntegerAsString(ctx->msgFormat, 11, count, 3, PRINTING_MODE_LEFT_ALIGN, TRUE);
        if (count == 0) {
            PhoneCallMessagePrint_Ungendered(ctx, ctx->msgData_PhoneContact, msg_0665_00009);
        } else {
            PhoneCallMessagePrint_Ungendered(ctx, ctx->msgData_PhoneContact, msg_0665_00005 + (LCRandom() % 3));
        }
        break;
    case 3:
        if (!PhoneCall_IsMessageDonePrinting(ctx)) {
            return FALSE;
        }
        PhoneCallMessagePrint_Ungendered(ctx, ctx->msgData_PhoneContact, msg_0665_00008);
        break;
    case 4:
        if (!PhoneCall_IsMessageDonePrinting(ctx)) {
            return FALSE;
        }
        DestroyMsgData(ctx->msgData_PhoneContact);
        return TRUE;
    }

    ++state->scriptState;
    return FALSE;
}
