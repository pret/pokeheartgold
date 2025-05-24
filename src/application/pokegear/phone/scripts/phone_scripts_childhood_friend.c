#include "global.h"

#include "constants/maps.h"

#include "application/pokegear/phone/phone_internal.h"
#include "msgdata/msg/msg_0662.h"

#include "math_util.h"
#include "sys_flags.h"

u16 GearPhoneCall_GetEthanLyraMessage(u16 mapId);

u16 PhoneCall_GetScriptId_EthanLyra(PokegearPhoneCallContext *ctx, PokegearPhoneCallState *state) {
    ALIGN(4)
    static const u16 ov101_021F86C8[] = {
        PHONE_SCRIPT_102,
        PHONE_SCRIPT_101,
    };

    if (state->isIncomingCall) {
        state->scriptType = 11;
        return PHONE_SCRIPT_NONE;
    }
    if (state->phoneBookEntry->mapId == ctx->playerMapSec) {
        state->scriptType = 0;
        return ov101_021F86C8[ctx->playerGender];
    }
    state->scriptType = 10;
    return PHONE_SCRIPT_NONE;
}

BOOL GearPhoneCall_EthanLyra(PokegearPhoneCallContext *ctx) {
    PokegearPhoneCallState *state = &ctx->state;

    switch (state->scriptState) {
    case 0:
        PhoneCall_InitMsgDataAndBufferNames(ctx);
        break;
    case 1:
        PhoneCallMessagePrint_Ungendered(ctx, ctx->msgData_PhoneContact, msg_0662_00004 + state->timeOfDay);
        break;
    case 2:
        if (!PhoneCall_IsMessageDonePrinting(ctx)) {
            return FALSE;
        }
        PhoneCallMessagePrint_Ungendered(ctx, ctx->msgData_PhoneContact, GearPhoneCall_GetEthanLyraMessage(ctx->playerMapID));
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

u8 ov101_021F3D34(PokegearPhoneCallContext *ctx) {
    int i;
    u8 count;
    u8 *ptr;
    u8 unlockLevel;
    u8 sp0[4];

    count = 0;
    unlockLevel = Pokegear_GetMapUnlockLevel(SaveData_Pokegear_Get(ctx->saveData));
    sp0[0] = 1;
    if (Save_VarsFlags_FlypointFlagAction(ctx->saveVarsFlags, FLAG_ACTION_CHECK, FLAG_UNK_9C9 - FLAG_SYS_FLYPOINT_PALLET)) {
        sp0[1] = 1; // 2D 2E 48
    } // UB: else, sp0[1] is undefined
    if (unlockLevel != 0) {
        sp0[2] = 1; // 19 1A 39
    } // UB: else, sp0[2] is undefined
    if (unlockLevel > 1) {
        sp0[3] = 1; // 00-17 1A 2F-37 39
    } // UB: else, sp0[3] is undefined

    ptr = AllocFromHeapAtEnd(ctx->heapId, 73);
    MI_CpuClear8(ptr, 73);
    for (i = 0; i < 73; ++i) {
        if (sp0[ov101_021F8760[i]]) {
            ptr[count++] = i;
        }
    }
    count = ptr[LCRandom() % count];
    FreeToHeap(ptr);
    return count + msg_0662_00086;
}

BOOL GearPhoneCall_EthanLyra2(PokegearPhoneCallContext *ctx) {
    PokegearPhoneCallState *state = &ctx->state;

    switch (state->scriptState) {
    case 0:
        PhoneCall_InitMsgDataAndBufferNames(ctx);
        break;
    case 1:
        PhoneCallMessagePrint_Ungendered(ctx, ctx->msgData_PhoneContact, msg_0662_00007 + state->timeOfDay);
        break;
    case 2:
        if (!PhoneCall_IsMessageDonePrinting(ctx)) {
            return FALSE;
        }
        if ((LCRandom() % 1000) < 500) {
            PhoneCallMessagePrint_Ungendered(ctx, ctx->msgData_PhoneContact, msg_0662_00010 + ((LCRandom() % 900) / 300));
        } else {
            PhoneCallMessagePrint_Ungendered(ctx, ctx->msgData_PhoneContact, ov101_021F3D34(ctx));
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

u16 GearPhoneCall_GetEthanLyraMessage(u16 mapId) {
    int i;

    static const u16 ov101_021F86CC[] = {
        MAP_ROUTE_1,
        MAP_ROUTE_2,
        MAP_ROUTE_3,
        MAP_ROUTE_4,
        MAP_ROUTE_5,
        MAP_ROUTE_6,
        MAP_ROUTE_7,
        MAP_ROUTE_8,
        MAP_ROUTE_9,
        MAP_ROUTE_10,
        MAP_ROUTE_11,
        MAP_ROUTE_12,
        MAP_ROUTE_13,
        MAP_ROUTE_14,
        MAP_ROUTE_15,
        MAP_ROUTE_16,
        MAP_ROUTE_17,
        MAP_ROUTE_18,
        MAP_ROUTE_19,
        MAP_ROUTE_20,
        MAP_ROUTE_21,
        MAP_ROUTE_22,
        MAP_ROUTE_24,
        MAP_ROUTE_25,
        MAP_ROUTE_26,
        MAP_ROUTE_27,
        MAP_ROUTE_28,
        MAP_ROUTE_29,
        MAP_ROUTE_30,
        MAP_ROUTE_31,
        MAP_ROUTE_32,
        MAP_ROUTE_33,
        MAP_ROUTE_34,
        MAP_ROUTE_35,
        MAP_ROUTE_36,
        MAP_ROUTE_37,
        MAP_ROUTE_38,
        MAP_ROUTE_39,
        MAP_ROUTE_40,
        MAP_ROUTE_41,
        MAP_ROUTE_42,
        MAP_ROUTE_43,
        MAP_ROUTE_44,
        MAP_ROUTE_45,
        MAP_ROUTE_46,
        MAP_ROUTE_47,
        MAP_ROUTE_48,
        MAP_PALLET,
        MAP_VIRIDIAN,
        MAP_PEWTER,
        MAP_CERULEAN,
        MAP_LAVENDER,
        MAP_VERMILION,
        MAP_CELADON,
        MAP_FUCHSIA,
        MAP_CINNABAR_ISLAND,
        MAP_INDIGO_PLATEAU,
        MAP_SAFFRON,
        MAP_NEW_BARK,
        MAP_CHERRYGROVE,
        MAP_VIOLET,
        MAP_AZALEA,
        MAP_CIANWOOD,
        MAP_GOLDENROD,
        MAP_OLIVINE,
        MAP_ECRUTEAK,
        MAP_MAHOGANY,
        MAP_LAKE_OF_RAGE,
        MAP_BLACKTHORN,
        MAP_MOUNT_SILVER,
        MAP_NATIONAL_PARK,
        MAP_RUINS_OF_ALPH,
        MAP_SAFARI_ZONE_GATE,
    };

    for (i = 0; i < 73; ++i) {
        if (mapId == ov101_021F86CC[i]) {
            return msg_0662_00013 + i;
        }
    }
    return msg_0662_00010 + (LCRandom() % 3);
}
