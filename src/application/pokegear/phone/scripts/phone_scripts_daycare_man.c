#include "global.h"

#include "application/pokegear/phone/phone_internal.h"
#include "msgdata/msg/msg_0661.h"

#include "get_egg.h"

u16 PhoneCall_GetScriptId_DayCareMan(PokegearPhoneApp_Sub0C4 *a0, PokegearPhoneApp_Sub0C4_Sub88 *a1) {
    int i;
    Daycare *daycare;
    DaycareMon *mon;

    a1->scriptType = 0;
    if (a1->unk_19) {
        if (Save_VarsFlags_CheckFlagInArray(a0->saveVarsFlags, FLAG_UNK_992)) {
            return PHONE_SCRIPT_096;
        } else {
            return PHONE_SCRIPT_095;
        }
    }

    daycare = Save_Daycare_Get(a0->saveData);
    a1->miscPtr.daycare = daycare;
    a1->unk_4A = 0;
    for (i = 0; i < 2; ++i) {
        mon = Save_Daycare_GetMonX(daycare, i);
        if (GetBoxMonData(DaycareMon_GetBoxMon(mon), MON_DATA_SPECIES, NULL) != SPECIES_NONE) {
            BufferBoxMonNickname(a0->msgFormat, 10 + i, DaycareMon_GetBoxMon(mon));
            ++a1->unk_4A;
        }
    }
    if (a1->unk_4A == 2) {
        a1->unk_48 = Save_Daycare_CalcCompatibility(daycare);
    }
    a1->scriptType = 7;
    return PHONE_SCRIPT_000;
}

BOOL GearPhoneCall_DayCareMan(PokegearPhoneApp_Sub0C4 *a0) {
    PokegearPhoneApp_Sub0C4_Sub88 *r4 = &a0->unk_88;

    switch (r4->unk_04) {
    case 0:
        PhoneCall_InitMsgDataAndBufferNames(a0);
        PhoneCallMessagePrint_Ungendered(a0, a0->msgData_PhoneContact, msg_0661_00002);
        break;
    case 1:
        if (!PhoneCall_IsMessageDonePrinting(a0)) {
            return FALSE;
        }
        if (Save_Daycare_HasEgg(r4->miscPtr.daycare)) {
            PhoneCallMessagePrint_Ungendered(a0, a0->msgData_PhoneContact, msg_0661_00003);
            r4->unk_04 = 255;
        } else if (r4->unk_4A == 0) {
            PhoneCallMessagePrint_Ungendered(a0, a0->msgData_PhoneContact, msg_0661_00004);
            r4->unk_04 = 3;
        } else if (r4->unk_4A == 1) {
            r4->unk_04 = 3;
            PhoneCallMessagePrint_Ungendered(a0, a0->msgData_PhoneContact, msg_0661_00005);
        } else {
            r4->unk_04 = 2;
            PhoneCallMessagePrint_Ungendered(a0, a0->msgData_PhoneContact, msg_0661_00006);
        }
        return FALSE;
    case 2:
        if (!PhoneCall_IsMessageDonePrinting(a0)) {
            return FALSE;
        }
        PhoneCallMessagePrint_Ungendered(a0, a0->msgData_PhoneContact, msg_0661_00007 + r4->unk_48);
        break;
    case 3:
        if (!PhoneCall_IsMessageDonePrinting(a0)) {
            return FALSE;
        }
        PhoneCallMessagePrint_Ungendered(a0, a0->msgData_PhoneContact, msg_0661_00011);
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
