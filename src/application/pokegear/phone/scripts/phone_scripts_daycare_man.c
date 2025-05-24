#include "global.h"

#include "application/pokegear/phone/phone_internal.h"
#include "msgdata/msg/msg_0661.h"

#include "get_egg.h"

u16 PhoneCall_GetScriptId_DayCareMan(PokegearPhoneCallContext *ctx, PokegearPhoneCallState *state) {
    int i;
    Daycare *daycare;
    DaycareMon *mon;

    state->scriptType = 0;
    if (state->isIncomingCall) {
        if (Save_VarsFlags_CheckFlagInArray(ctx->saveVarsFlags, FLAG_UNK_992)) {
            return PHONE_SCRIPT_096;
        } else {
            return PHONE_SCRIPT_095;
        }
    }

    daycare = Save_Daycare_Get(ctx->saveData);
    state->miscPtr.daycare = daycare;
    state->sharedU8var = 0;
    for (i = 0; i < 2; ++i) {
        mon = Save_Daycare_GetMonX(daycare, i);
        if (GetBoxMonData(DaycareMon_GetBoxMon(mon), MON_DATA_SPECIES, NULL) != SPECIES_NONE) {
            BufferBoxMonNickname(ctx->msgFormat, 10 + i, DaycareMon_GetBoxMon(mon));
            ++state->sharedU8var;
        }
    }
    if (state->sharedU8var == 2) {
        state->breedingCompatibility = Save_Daycare_CalcCompatibility(daycare);
    }
    state->scriptType = 7;
    return PHONE_SCRIPT_NONE;
}

BOOL GearPhoneCall_DayCareMan(PokegearPhoneCallContext *ctx) {
    PokegearPhoneCallState *state = &ctx->state;

    switch (state->scriptState) {
    case 0:
        PhoneCall_InitMsgDataAndBufferNames(ctx);
        PhoneCallMessagePrint_Ungendered(ctx, ctx->msgData_PhoneContact, msg_0661_00002);
        break;
    case 1:
        if (!PhoneCall_IsMessageDonePrinting(ctx)) {
            return FALSE;
        }
        if (Save_Daycare_HasEgg(state->miscPtr.daycare)) {
            PhoneCallMessagePrint_Ungendered(ctx, ctx->msgData_PhoneContact, msg_0661_00003);
            state->scriptState = 255;
        } else if (state->sharedU8var == 0) {
            PhoneCallMessagePrint_Ungendered(ctx, ctx->msgData_PhoneContact, msg_0661_00004);
            state->scriptState = 3;
        } else if (state->sharedU8var == 1) {
            state->scriptState = 3;
            PhoneCallMessagePrint_Ungendered(ctx, ctx->msgData_PhoneContact, msg_0661_00005);
        } else {
            state->scriptState = 2;
            PhoneCallMessagePrint_Ungendered(ctx, ctx->msgData_PhoneContact, msg_0661_00006);
        }
        return FALSE;
    case 2:
        if (!PhoneCall_IsMessageDonePrinting(ctx)) {
            return FALSE;
        }
        PhoneCallMessagePrint_Ungendered(ctx, ctx->msgData_PhoneContact, msg_0661_00007 + state->breedingCompatibility);
        break;
    case 3:
        if (!PhoneCall_IsMessageDonePrinting(ctx)) {
            return FALSE;
        }
        PhoneCallMessagePrint_Ungendered(ctx, ctx->msgData_PhoneContact, msg_0661_00011);
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
