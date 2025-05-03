#include "global.h"

#include "application/pokegear/phone/phone_internal.h"
#include "msgdata/msg/msg_0643.h"

#include "unk_02031B0C.h"

u16 PhoneCall_GetScriptId_Kurt(PokegearPhoneApp_Sub0C4 *a0, PokegearPhoneApp_Sub0C4_Sub88 *a1) {
    a1->scriptType = 0;
    if (a1->phoneBookEntry->mapId == a0->playerMapSec) {
        return PHONE_SCRIPT_083;
    } else {
        a1->scriptType = 12;
        return PHONE_SCRIPT_000;
    }
}

BOOL GearPhoneCall_Kurt(PokegearPhoneApp_Sub0C4 *a0) {
    PokegearPhoneApp_Sub0C4_Sub88 *r4 = &a0->unk_88;
    SaveApricornBox *apricornBox;
    u32 kurtQuantity;
    u8 msgId;

    switch (r4->unk_04) {
    case 0:
        PhoneCall_InitMsgDataAndBufferNames(a0);
        if (Save_VarsFlags_CheckFlagInArray(a0->saveVarsFlags, FLAG_UNK_127)) {
            PhoneCallMessagePrint_Ungendered(a0, a0->msgData_PhoneContact, msg_0643_00006);
        } else {
            PhoneCallMessagePrint_Ungendered(a0, a0->msgData_PhoneContact, msg_0643_00002);
        }
        break;
    case 1:
        if (!PhoneCall_IsMessageDonePrinting(a0)) {
            return FALSE;
        }
        apricornBox = Save_ApricornBox_Get(a0->saveData);
        kurtQuantity = ApricornBox_GetKurtQuantity(apricornBox);
        if (kurtQuantity == 0) {
            msgId = msg_0643_00005;
        } else if (Save_VarsFlags_CheckFlagInArray(a0->saveVarsFlags, FLAG_DAILY_KURT_MAKING_BALLS)) {
            msgId = msg_0643_00004;
        } else {
            BufferItemName(a0->msgFormat, 10, ApricornBox_GetKurtBall(apricornBox));
            BufferIntegerAsString(a0->msgFormat, 11, kurtQuantity, 2, PRINTING_MODE_LEFT_ALIGN, TRUE);
            msgId = msg_0643_00003;
        }
        PhoneCallMessagePrint_Ungendered(a0, a0->msgData_PhoneContact, msgId);
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
