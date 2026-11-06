#include "global.h"

#include "application/pokegear/phone/phone_internal.h"
#include "msgdata/msg/msg_0660.h"

#include "get_egg.h"

u16 PhoneCall_GetScriptId_DayCareLady(PokegearPhoneCallContext *ctx, PokegearPhoneCallState *state) {
    int i;
    Daycare *daycare;
    DaycareMon *mon;

    state->scriptType = 0;
    if (state->phoneBookEntry->mapId == ctx->playerMapSec) {
        return PHONE_SCRIPT_097;
    }

    daycare = Save_Daycare_Get(ctx->saveData);
    state->miscPtr.daycare = daycare;
    state->sharedU8var = 0;
    for (i = 0; i < 2; ++i) {
        mon = Save_Daycare_GetMonX(daycare, i);
        if (GetBoxMonData(DaycareMon_GetBoxMon(mon), MON_DATA_SPECIES, NULL) != SPECIES_NONE) {
            ++state->sharedU8var;
            state->daycareMonsLevelGrowth[i] = DaycareMon_CalcLevelGrowth(mon);
        } else {
            state->daycareMonsLevelGrowth[i] = 0;
        }
    }
    state->scriptType = 6;
    return PHONE_SCRIPT_NONE;
}

BOOL GearPhoneCall_DayCareLady(PokegearPhoneCallContext *ctx) {
    PokegearPhoneCallState *state = &ctx->state;
    int monIdx;

    switch (state->scriptState) {
    case 0:
        PhoneCall_InitMsgDataAndBufferNames(ctx);
        PhoneCallMessagePrint_Gendered(ctx, ctx->msgData_PhoneContact, msg_0660_00003, msg_0660_00004);
        break;
    case 1:
        if (!PhoneCall_IsMessageDonePrinting(ctx)) {
            return FALSE;
        }
        if (state->sharedU8var == 0) {
            PhoneCallMessagePrint_Ungendered(ctx, ctx->msgData_PhoneContact, msg_0660_00010);
            state->scriptState = 255;
            return FALSE;
        } else {
            PhoneCallMessagePrint_Ungendered(ctx, ctx->msgData_PhoneContact, msg_0660_00005);
        }
        break;
    case 2:
        if (!PhoneCall_IsMessageDonePrinting(ctx)) {
            return FALSE;
        }
        if (state->daycareMonsLevelGrowth[0] != 0) {
            monIdx = 0;
            if (state->daycareMonsLevelGrowth[1] == 0) {
                state->scriptState = 4;
            } else {
                state->scriptState = 3;
            }
        } else {
            if (state->daycareMonsLevelGrowth[1] != 0) {
                monIdx = 1;
                state->scriptState = 4;
            } else {
                PhoneCallMessagePrint_Ungendered(ctx, ctx->msgData_PhoneContact, msg_0660_00009);
                state->scriptState = 255;
                return FALSE;
            }
        }
        BufferBoxMonNickname(ctx->msgFormat, 10, DaycareMon_GetBoxMon(Save_Daycare_GetMonX(state->miscPtr.daycare, monIdx)));
        BufferIntegerAsString(ctx->msgFormat, 11, state->daycareMonsLevelGrowth[monIdx], 3, PRINTING_MODE_LEFT_ALIGN, TRUE);
        PhoneCallMessagePrint_Ungendered(ctx, ctx->msgData_PhoneContact, msg_0660_00006);
        return FALSE;
    case 3:
        if (!PhoneCall_IsMessageDonePrinting(ctx)) {
            return FALSE;
        }
        BufferBoxMonNickname(ctx->msgFormat, 10, DaycareMon_GetBoxMon(Save_Daycare_GetMonX(state->miscPtr.daycare, 1)));
        BufferIntegerAsString(ctx->msgFormat, 11, state->daycareMonsLevelGrowth[1], 3, PRINTING_MODE_LEFT_ALIGN, TRUE);
        PhoneCallMessagePrint_Ungendered(ctx, ctx->msgData_PhoneContact, msg_0660_00006);
        break;
    case 4:
        if (!PhoneCall_IsMessageDonePrinting(ctx)) {
            return FALSE;
        }
        if (state->sharedU8var == 1) {
            PhoneCallMessagePrint_Ungendered(ctx, ctx->msgData_PhoneContact, msg_0660_00008);
        } else {
            PhoneCallMessagePrint_Ungendered(ctx, ctx->msgData_PhoneContact, msg_0660_00009);
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
