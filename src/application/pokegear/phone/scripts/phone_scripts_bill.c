#include "global.h"

#include "application/pokegear/phone/phone_internal.h"
#include "msgdata/msg/msg_0665.h"

#include "math_util.h"
#include "save_arrays.h"

u16 PhoneCall_GetScriptId_Bill(PokegearPhoneApp_Sub0C4 *a0, PokegearPhoneApp_Sub0C4_Sub88 *a1) {
    if (a1->unk_19 != 0) {
        a1->scriptType = 0;
        return PHONE_SCRIPT_093;
    }
    if (a1->phoneBookEntry->mapId == a0->playerMapSec) {
        a1->scriptType = 0;
        return PHONE_SCRIPT_092;
    }
    a1->scriptType = 3;
    return PHONE_SCRIPT_NONE;
}

BOOL GearPhoneCall_Bill(PokegearPhoneApp_Sub0C4 *a0) {
    PokegearPhoneApp_Sub0C4_Sub88 *r5 = &a0->unk_88;
    PCStorage *pcStorage;
    u32 count;

    switch (r5->unk_04) {
    case 0:
        PhoneCall_InitMsgDataAndBufferNames(a0);
        break;
    case 1:
        if (!ov101_021F2614(a0)) {
            return FALSE;
        }
        PhoneCallMessagePrint_Gendered(a0, a0->msgData_PhoneContact, msg_0665_00003, msg_0665_00004);
        break;
    case 2:
        if (!PhoneCall_IsMessageDonePrinting(a0)) {
            return FALSE;
        }
        pcStorage = SaveArray_PCStorage_Get(a0->saveData);
        PCStorage_GetBoxName(pcStorage, PCStorage_GetActiveBox(pcStorage), a0->msgExpansionBuff);
        BufferString(a0->msgFormat, 10, a0->msgExpansionBuff, 2, 1, 2);
        count = PCStorage_CountEmptySpotsInAllBoxes(pcStorage);
        BufferIntegerAsString(a0->msgFormat, 11, count, 3, PRINTING_MODE_LEFT_ALIGN, TRUE);
        if (count == 0) {
            PhoneCallMessagePrint_Ungendered(a0, a0->msgData_PhoneContact, msg_0665_00009);
        } else {
            PhoneCallMessagePrint_Ungendered(a0, a0->msgData_PhoneContact, msg_0665_00005 + (LCRandom() % 3));
        }
        break;
    case 3:
        if (!PhoneCall_IsMessageDonePrinting(a0)) {
            return FALSE;
        }
        PhoneCallMessagePrint_Ungendered(a0, a0->msgData_PhoneContact, msg_0665_00008);
        break;
    case 4:
        if (!PhoneCall_IsMessageDonePrinting(a0)) {
            return FALSE;
        }
        DestroyMsgData(a0->msgData_PhoneContact);
        return TRUE;
    }

    ++r5->unk_04;
    return FALSE;
}
