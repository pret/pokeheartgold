#include "global.h"

#include "application/pokegear/phone/phone_internal.h"
#include "msgdata/msg/msg_0664.h"

#include "map_header.h"
#include "sys_flags.h"

u16 MomCallGetIntroMsgByLocation(PokegearPhoneCallContext *a0, PokegearPhoneCallState *a1);
int MomCallGetSaveMoneyPromptMsg(PokegearPhoneCallContext *a0, PokegearPhoneCallState *a1);

u16 PhoneCall_GetScriptId_Mother(PokegearPhoneCallContext *a0, PokegearPhoneCallState *a1) {
    a1->scriptType = 0;
    if (a1->unk_1A == 2) {
        Save_VarsFlags_SetFlagInArray(a0->saveVarsFlags, FLAG_TALKED_TO_MOM_AFTER_NAMING_RIVAL);
        a1->scriptType = 4;
        return PHONE_SCRIPT_NONE;
    }

    if (a1->phoneBookEntry->mapId == a0->playerMapSec) {
        return PHONE_SCRIPT_023;
    }

    if (a1->isIncomingCall != 0) {
        a1->scriptType = 0;
        return a1->predefinedScriptID;
    }

    if (!Save_VarsFlags_CheckFlagInArray(a0->saveVarsFlags, FLAG_GAVE_RIVAL_NAME_TO_OFFICER)) {
        return PHONE_SCRIPT_025;
    }

    if (!Save_VarsFlags_CheckFlagInArray(a0->saveVarsFlags, FLAG_TALKED_TO_MOM_AFTER_NAMING_RIVAL)) {
        return PHONE_SCRIPT_026;
    }

    a1->scriptType = 4;
    return PHONE_SCRIPT_NONE;
}

BOOL GearPhoneCall_Mother(PokegearPhoneCallContext *a0) {
    PokegearPhoneCallState *r4 = &a0->state;
    int r6;

    switch (r4->unk_04) {
    case 0:
        PhoneCall_InitMsgDataAndBufferNames(a0);
        r4->momsSavingsBalance = MomSavingsBalanceAction(a0->momsSavings, MOMS_BALANCE_GET, 0);
        BufferIntegerAsString(a0->msgFormat, 10, r4->momsSavingsBalance, 6, PRINTING_MODE_LEFT_ALIGN, TRUE);
        r4->flag0 = Save_VarsFlags_MomsSavingsFlagCheck(a0->saveVarsFlags);
        r4->flag1 = MomsSavings_GiftQueueFull(a0->momsSavings);
        if (r4->unk_1A == 2) {
            r4->unk_04 = 2;
            return FALSE;
        }
        PhoneCallMessagePrint_Ungendered(a0, a0->msgData_PhoneContact, MomCallGetIntroMsgByLocation(a0, r4));
        break;
    case 1:
        if (!PhoneCall_IsMessageDonePrinting(a0)) {
            return FALSE;
        }
        if (r4->flag1) {
            PhoneCallMessagePrint_Ungendered(a0, a0->msgData_PhoneContact, msg_0664_00021);
            r4->unk_04 = 255;
            return FALSE;
        }
        break;
    case 2:
        PhoneCallMessagePrint_Ungendered(a0, a0->msgData_PhoneContact, MomCallGetSaveMoneyPromptMsg(a0, r4));
        break;
    case 3:
        if (!PhoneCall_IsMessageDonePrinting(a0)) {
            return FALSE;
        }
        PhoneCall_TouchscreenListMenu_Create(a0, 2);
        break;
    case 4:
        r6 = PhoneCall_TouchscreenListMenu_HandleInput(a0);
        if (r6 == -1) {
            return FALSE;
        }
        PhoneCall_TouchscreenListMenu_Destroy(a0);
        if (r6 == 0) {
            r4->flag1 = TRUE;
            PhoneCallMessagePrint_Ungendered(a0, a0->msgData_PhoneContact, msg_0664_00025);
        } else {
            r4->flag1 = FALSE;
            PhoneCallMessagePrint_Ungendered(a0, a0->msgData_PhoneContact, msg_0664_00026);
        }
        Save_VarsFlags_MomsSavingsFlagAction(a0->saveVarsFlags, r4->flag1);
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

u16 MomCallGetIntroMsgByLocation(PokegearPhoneCallContext *a0, PokegearPhoneCallState *a1) {
    return msg_0664_00007 + MapHeader_GetMomCallIntroParam(a0->playerMapSec);
}

int MomCallGetSaveMoneyPromptMsg(PokegearPhoneCallContext *a0, PokegearPhoneCallState *a1) {
    if (a1->unk_1A == 2) {
        return msg_0664_00022;
    }
    if (a1->flag0) {
        if (a1->momsSavingsBalance != 0) {
            return msg_0664_00023;
        } else {
            return msg_0664_00027;
        }
    } else {
        if (a1->momsSavingsBalance != 0) {
            return msg_0664_00024;
        } else {
            return msg_0664_00028;
        }
    }
}
