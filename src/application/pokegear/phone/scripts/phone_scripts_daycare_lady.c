#include "global.h"

#include "application/pokegear/phone/phone_internal.h"
#include "msgdata/msg/msg_0660.h"

#include "get_egg.h"

u16 PhoneCall_GetScriptId_DayCareLady(PokegearPhoneApp_Sub0C4 *a0, PokegearPhoneApp_Sub0C4_Sub88 *a1) {
    int i;
    Daycare *daycare;
    DaycareMon *mon;

    a1->scriptType = 0;
    if (a1->phoneBookEntry->mapId == a0->playerMapSec) {
        return PHONE_SCRIPT_097;
    }

    daycare = Save_Daycare_Get(a0->saveData);
    a1->miscPtr.daycare = daycare;
    a1->unk_4A = 0;
    for (i = 0; i < 2; ++i) {
        mon = Save_Daycare_GetMonX(daycare, i);
        if (GetBoxMonData(DaycareMon_GetBoxMon(mon), MON_DATA_SPECIES, NULL) != SPECIES_NONE) {
            ++a1->unk_4A;
            a1->unk_4B[i] = DaycareMon_CalcLevelGrowth(mon);
        } else {
            a1->unk_4B[i] = 0;
        }
    }
    a1->scriptType = 6;
    return PHONE_SCRIPT_NONE;
}

BOOL GearPhoneCall_DayCareLady(PokegearPhoneApp_Sub0C4 *a0) {
    PokegearPhoneApp_Sub0C4_Sub88 *r4 = &a0->unk_88;
    int r6;

    switch (r4->unk_04) {
    case 0:
        PhoneCall_InitMsgDataAndBufferNames(a0);
        PhoneCallMessagePrint_Gendered(a0, a0->msgData_PhoneContact, msg_0660_00003, msg_0660_00004);
        break;
    case 1:
        if (!PhoneCall_IsMessageDonePrinting(a0)) {
            return FALSE;
        }
        if (r4->unk_4A == 0) {
            PhoneCallMessagePrint_Ungendered(a0, a0->msgData_PhoneContact, msg_0660_00010);
            r4->unk_04 = 255;
            return FALSE;
        } else {
            PhoneCallMessagePrint_Ungendered(a0, a0->msgData_PhoneContact, msg_0660_00005);
        }
        break;
    case 2:
        if (!PhoneCall_IsMessageDonePrinting(a0)) {
            return FALSE;
        }
        if (r4->unk_4B[0] != 0) {
            r6 = 0;
            if (r4->unk_4B[1] == 0) {
                r4->unk_04 = 4;
            } else {
                r4->unk_04 = 3;
            }
        } else {
            if (r4->unk_4B[1] != 0) {
                r6 = 1;
                r4->unk_04 = 4;
            } else {
                PhoneCallMessagePrint_Ungendered(a0, a0->msgData_PhoneContact, msg_0660_00009);
                r4->unk_04 = 255;
                return FALSE;
            }
        }
        BufferBoxMonNickname(a0->msgFormat, 10, DaycareMon_GetBoxMon(Save_Daycare_GetMonX(r4->miscPtr.daycare, r6)));
        BufferIntegerAsString(a0->msgFormat, 11, r4->unk_4B[r6], 3, PRINTING_MODE_LEFT_ALIGN, TRUE);
        PhoneCallMessagePrint_Ungendered(a0, a0->msgData_PhoneContact, msg_0660_00006);
        return FALSE;
    case 3:
        if (!PhoneCall_IsMessageDonePrinting(a0)) {
            return FALSE;
        }
        BufferBoxMonNickname(a0->msgFormat, 10, DaycareMon_GetBoxMon(Save_Daycare_GetMonX(r4->miscPtr.daycare, 1)));
        BufferIntegerAsString(a0->msgFormat, 11, r4->unk_4B[1], 3, PRINTING_MODE_LEFT_ALIGN, TRUE);
        PhoneCallMessagePrint_Ungendered(a0, a0->msgData_PhoneContact, msg_0660_00006);
        break;
    case 4:
        if (!PhoneCall_IsMessageDonePrinting(a0)) {
            return FALSE;
        }
        if (r4->unk_4A == 1) {
            PhoneCallMessagePrint_Ungendered(a0, a0->msgData_PhoneContact, msg_0660_00008);
        } else {
            PhoneCallMessagePrint_Ungendered(a0, a0->msgData_PhoneContact, msg_0660_00009);
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
