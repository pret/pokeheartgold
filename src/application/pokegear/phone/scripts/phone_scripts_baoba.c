#include "global.h"

#include "application/pokegear/phone/phone_internal.h"
#include "msgdata/msg/msg_0667.h"

#include "safari_zone.h"
#include "sys_vars.h"

u16 PhoneCall_GetScriptId_Baoba(PokegearPhoneCallContext *a0, PokegearPhoneCallState *a1) {
    SafariZone *safariZone;

    a1->scriptType = 0;
    if (a1->unk_1A == 2) {
        return PHONE_SCRIPT_141;
    }
    if (a1->isIncomingCall) {
        safariZone = Save_SafariZone_Get(a0->saveData);
        switch (a1->predefinedScriptID) {
        case PHONE_SCRIPT_NONE:
            a1->scriptType = 15;
            return PHONE_SCRIPT_NONE;
        case PHONE_SCRIPT_142:
            Save_VarsFlags_SetVar4057(a0->saveVarsFlags, 4);
            return a1->predefinedScriptID;
        case PHONE_SCRIPT_143:
        case PHONE_SCRIPT_144:
            sub_0202F730(safariZone, 1);
            sub_0202F784(safariZone, Save_PlayerData_GetIGTAddr(a0->saveData));
            break;
        case PHONE_SCRIPT_145:
        case PHONE_SCRIPT_146:
            sub_0202F730(safariZone, 4);
            break;
        default:
            a1->predefinedScriptID = PHONE_SCRIPT_154;
            return a1->predefinedScriptID;
        }
        Save_VarsFlags_SetVar4057(a0->saveVarsFlags, 7);
        return a1->predefinedScriptID;
    }
    if (a1->phoneBookEntry->mapId == a0->playerMapSec) {
        return PHONE_SCRIPT_140;
    }
    return Save_VarsFlags_GetVar4057(a0->saveVarsFlags) + PHONE_SCRIPT_147;
}

BOOL GearPhoneCall_Baoba(PokegearPhoneCallContext *a0) {
    PokegearPhoneCallState *sp0 = &a0->state;
    u8 sp4;
    u8 *r6;
    u8 r4;

    switch (sp0->state1) {
    case 0:
        PhoneCall_InitMsgDataAndBufferNames(a0);
        r6 = sub_0202F340(a0->momsSavings, &sp4, a0->heapId);
        if (sp4 == 0) {
            PhoneCallMessagePrint_Gendered(a0, a0->msgData_PhoneContact, msg_0667_00038, msg_0667_00039);
        } else if (sp4 >= 6) {
            PhoneCallMessagePrint_Gendered(a0, a0->msgData_PhoneContact, msg_0667_00024, msg_0667_00025);
        } else {
            for (r4 = 0; r4 < sp4; ++r4) {
                BufferSafariZoneAreaName(a0->msgFormat, 10 + r4, r6[r4]);
            }
            sp4 = 2 * (sp4 - 1);
            PhoneCallMessagePrint_Gendered(a0, a0->msgData_PhoneContact, msg_0667_00014 + sp4, msg_0667_00015 + sp4);
        }
        FreeToHeap(r6);
        break;
    default:
        if (!PhoneCall_IsMessageDonePrinting(a0)) {
            return FALSE;
        }
        DestroyMsgData(a0->msgData_PhoneContact);
        return TRUE;
    }

    ++sp0->state1;
    return FALSE;
}
