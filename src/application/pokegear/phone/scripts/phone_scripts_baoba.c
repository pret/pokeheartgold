#include "global.h"

#include "application/pokegear/phone/phone_internal.h"
#include "msgdata/msg/msg_0667.h"

#include "safari_zone.h"
#include "sys_vars.h"

u16 PhoneCall_GetScriptId_Baoba(PokegearPhoneCallContext *ctx, PokegearPhoneCallState *state) {
    SafariZone *safariZone;

    state->scriptType = 0;
    if (state->isScriptedCall == 2) {
        return PHONE_SCRIPT_141;
    }
    if (state->isIncomingCall) {
        safariZone = Save_SafariZone_Get(ctx->saveData);
        switch (state->predefinedScriptID) {
        case PHONE_SCRIPT_NONE:
            state->scriptType = 15;
            return PHONE_SCRIPT_NONE;
        case PHONE_SCRIPT_142:
            Save_VarsFlags_SetVar4057(ctx->saveVarsFlags, 4);
            return state->predefinedScriptID;
        case PHONE_SCRIPT_143:
        case PHONE_SCRIPT_144:
            SafariZone_IncObjectUnlockLevel(safariZone, 1);
            sub_0202F784(safariZone, Save_PlayerData_GetIGTAddr(ctx->saveData));
            break;
        case PHONE_SCRIPT_145:
        case PHONE_SCRIPT_146:
            SafariZone_IncObjectUnlockLevel(safariZone, 4);
            break;
        default:
            state->predefinedScriptID = PHONE_SCRIPT_154;
            return state->predefinedScriptID;
        }
        Save_VarsFlags_SetVar4057(ctx->saveVarsFlags, 7);
        return state->predefinedScriptID;
    }
    if (state->phoneBookEntry->mapId == ctx->playerMapSec) {
        return PHONE_SCRIPT_140;
    }
    return Save_VarsFlags_GetVar4057(ctx->saveVarsFlags) + PHONE_SCRIPT_147;
}

BOOL GearPhoneCall_Baoba(PokegearPhoneCallContext *ctx) {
    PokegearPhoneCallState *state = &ctx->state;
    u8 numAreas;
    u8 *areas;
    u8 i;

    switch (state->scriptState) {
    case 0:
        PhoneCall_InitMsgDataAndBufferNames(ctx);
        areas = PhoneCallPersistentState_SafariZoneArrangement_AllocAndGet(ctx->callPersistentState, &numAreas, ctx->heapID);
        if (numAreas == 0) {
            PhoneCallMessagePrint_Gendered(ctx, ctx->msgData_PhoneContact, msg_0667_00038, msg_0667_00039);
        } else if (numAreas >= 6) {
            PhoneCallMessagePrint_Gendered(ctx, ctx->msgData_PhoneContact, msg_0667_00024, msg_0667_00025);
        } else {
            for (i = 0; i < numAreas; ++i) {
                BufferSafariZoneAreaName(ctx->msgFormat, 10 + i, areas[i]);
            }
            numAreas = 2 * (numAreas - 1);
            PhoneCallMessagePrint_Gendered(ctx, ctx->msgData_PhoneContact, msg_0667_00014 + numAreas, msg_0667_00015 + numAreas);
        }
        Heap_Free(areas);
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
