#include "global.h"

#include "application/pokegear/phone/phone_internal.h"
#include "msgdata/msg/msg_0641.h"

#include "math_util.h"
#include "phonebook_dat.h"
#include "sys_flags.h"
#include "sys_vars.h"

u8 ov101_021F3C60(u8 hour);

u16 PhoneCall_GetScriptId_Buena(PokegearPhoneApp_Sub0C4 *a0, PokegearPhoneApp_Sub0C4_Sub88 *a1) {
    a1->scriptType = 0;
    a1->flag0 = CheckGameClearFlag(a0->saveVarsFlags);
    a1->unk_4A = ov101_021F3C60(a1->time.hour);
    if (Save_VarsFlags_IsInRocketTakeover(a0->saveVarsFlags)) {
        return PHONE_SCRIPT_099;
    }
    if (a1->unk_19) {
        a1->scriptType = 9;
        return PHONE_SCRIPT_NONE;
    }
    if (a1->unk_4A == 3) {
        return PHONE_SCRIPT_100;
    }
    if (a1->phoneBookEntry->mapId == a0->playerMapSec) {
        return PHONE_SCRIPT_098;
    }
    a1->scriptType = 8;
    return PHONE_SCRIPT_NONE;
}

BOOL GearPhoneCall_Buena(PokegearPhoneApp_Sub0C4 *a0) {
    PokegearPhoneApp_Sub0C4_Sub88 *r4 = &a0->unk_88;

    switch (r4->unk_04) {
    case 0:
        PhoneCall_InitMsgDataAndBufferNames(a0);
        PhoneCallMessagePrint_Gendered(a0, a0->msgData_PhoneContact, r4->timeOfDay * 2 + msg_0641_00003, r4->timeOfDay * 2 + msg_0641_00004);
        break;
    case 1:
        if (!PhoneCall_IsMessageDonePrinting(a0)) {
            return FALSE;
        }
        PhoneCallMessagePrint_Ungendered(a0, a0->msgData_PhoneContact, msg_0641_00010 + (LCRandom() % 3));
        break;
    default:
        if (!PhoneCall_IsMessageDonePrinting(a0)) {
            return FALSE;
        }
        DestroyMsgData(a0->msgData_PhoneContact);
        return TRUE;
    }

    ++r4->unk_04;
    return FALSE;
}

BOOL GearPhoneCall_Buena2(PokegearPhoneApp_Sub0C4 *a0) {
    PokegearPhoneApp_Sub0C4_Sub88 *r4 = &a0->unk_88;
    u8 r5;
    u8 r2;

    switch (r4->unk_04) {
    case 0:
        PhoneCall_InitMsgDataAndBufferNames(a0);
        PhoneCallMessagePrint_Gendered(a0, a0->msgData_PhoneContact, r4->timeOfDay * 2 + msg_0641_00015, r4->timeOfDay * 2 + msg_0641_00016);
        break;
    case 1:
        if (!PhoneCall_IsMessageDonePrinting(a0)) {
            return FALSE;
        }
        if (r4->unk_4A == 3) {
            PhoneCallMessagePrint_Ungendered(a0, a0->msgData_PhoneContact, msg_0641_00036);
        } else {
            r5 = 11 + r4->flag0 * 3;
            r2 = LCRandom() % r5;
            if (r2 == 13) {
                PhoneCallMessagePrint_Gendered(a0, a0->msgData_PhoneContact, msg_0641_00034, msg_0641_00035);
            } else {
                PhoneCallMessagePrint_Ungendered(a0, a0->msgData_PhoneContact, msg_0641_00021 + r2);
            }
        }
        break;
    default:
        if (!PhoneCall_IsMessageDonePrinting(a0)) {
            return FALSE;
        }
        DestroyMsgData(a0->msgData_PhoneContact);
        return TRUE;
    }

    ++r4->unk_04;
    return FALSE;
}

u8 ov101_021F3C60(u8 hour) {
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
