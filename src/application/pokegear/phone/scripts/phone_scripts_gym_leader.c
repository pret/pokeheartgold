#include "global.h"

#include "application/pokegear/phone/phone_internal.h"
#include "msgdata/msg/msg_0644.h" // Using Whitney as the representative. All 16 Gym Leaders have the same gmm layout.

#include "math_util.h"

BOOL ov101_021F40E8(PokegearPhoneCallContext *a0, u8 callerID);

u16 PhoneCall_GetScriptId_GymLeader(PokegearPhoneCallContext *a0, PokegearPhoneCallState *a1) {
    if (PlayerProfile_CountBadges(a0->playerProfile) >= 16) {
        a1->flag0 = TRUE;
    } else {
        a1->flag0 = FALSE;
    }
    a1->flag1 = PhoneRematches_IsSeeking(a0->momsSavings, a1->callerID);
    if (a1->isIncomingCall) {
        a1->scriptType = 14;
    } else {
        a1->scriptType = 13;
    }
    return PHONE_SCRIPT_NONE;
}

BOOL GearPhoneCall_GymLeader(PokegearPhoneCallContext *a0) {
    PokegearPhoneCallState *r4 = &a0->state;
    int r6;

    switch (r4->unk_04) {
    case 0:
        PhoneCall_InitMsgDataAndBufferNames(a0);

        if (r4->phoneBookEntry->mapId == a0->playerMapSec) {
            r4->unk_04 = 255;
            PhoneCallMessagePrint_Ungendered(a0, a0->msgData_PhoneContact, msg_0644_00001);
            return FALSE;
        }
        PhoneCallMessagePrint_Ungendered(a0, a0->msgData_PhoneContact, msg_0644_00002);
        break;
    case 1:
        if (!PhoneCall_IsMessageDonePrinting(a0)) {
            return FALSE;
        }
        if (!r4->flag0) {
            PhoneCallMessagePrint_Ungendered(a0, a0->msgData_PhoneContact, msg_0644_00003);
            r4->unk_04 = 255;
            return FALSE;
        }
        if (r4->flag1) {
            PhoneCallMessagePrint_Ungendered(a0, a0->msgData_PhoneContact, msg_0644_00009);
            r4->unk_04 = 255;
            return FALSE;
        }
        if (r4->date.week != r4->phoneBookEntry->rematchWeekday || r4->timeOfDay != r4->phoneBookEntry->rematchTimeOfDay) {
            PhoneCallMessagePrint_Ungendered(a0, a0->msgData_PhoneContact, msg_0644_00004);
            r4->unk_04 = 255;
            return FALSE;
        }
        PhoneCallMessagePrint_Ungendered(a0, a0->msgData_PhoneContact, msg_0644_00005);
        break;
    case 2:
        if (!PhoneCall_IsMessageDonePrinting(a0)) {
            return FALSE;
        }
        PhoneCall_TouchscreenListMenu_Create(a0, 6);
        break;
    case 3:
        r6 = PhoneCall_TouchscreenListMenu_HandleInput(a0);
        if (r6 == -1) {
            return FALSE;
        }
        PhoneCall_TouchscreenListMenu_Destroy(a0);
        if (r6) { // said no
            PhoneCallMessagePrint_Ungendered(a0, a0->msgData_PhoneContact, msg_0644_00007);
        } else if (ov101_021F40E8(a0, r4->callerID)) {
            PhoneCallMessagePrint_Ungendered(a0, a0->msgData_PhoneContact, msg_0644_00006);
            PhoneRematches_SetSeeking(a0->momsSavings, r4->callerID, TRUE);
        } else {
            PhoneCallMessagePrint_Ungendered(a0, a0->msgData_PhoneContact, msg_0644_00008);
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

BOOL GearPhoneCall_GymLeader2(PokegearPhoneCallContext *a0) {
    PokegearPhoneCallState *r4 = &a0->state;

    switch (r4->unk_04) {
    case 0:
        PhoneCall_InitMsgDataAndBufferNames(a0);
        PhoneCallMessagePrint_Ungendered(a0, a0->msgData_PhoneContact, msg_0644_00010);
        break;
    case 1:
        if (!PhoneCall_IsMessageDonePrinting(a0)) {
            return FALSE;
        }
        if (r4->flag1) {
            PhoneCallMessagePrint_Ungendered(a0, a0->msgData_PhoneContact, msg_0644_00011);
        } else {
            PhoneCallMessagePrint_Ungendered(a0, a0->msgData_PhoneContact, msg_0644_00012 + (LCRandom() % 3));
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

// It's possible this function was intended to check whether the dojo is full.
// However, it stops after a single iteration.
BOOL ov101_021F40E8(PokegearPhoneCallContext *a0, u8 callerID) {
    int i;
    int r4;

    static const u8 sGymLeaderContacts[] = {
        PHONE_CONTACT_FALKNER,
        PHONE_CONTACT_BUGSY,
        PHONE_CONTACT_WHITNEY,
        PHONE_CONTACT_MORTY,
        PHONE_CONTACT_CHUCK,
        PHONE_CONTACT_JASMINE,
        PHONE_CONTACT_PRYCE,
        PHONE_CONTACT_CLAIR,
        PHONE_CONTACT_BROCK,
        PHONE_CONTACT_MISTY,
        PHONE_CONTACT_LT__SURGE,
        PHONE_CONTACT_ERIKA,
        PHONE_CONTACT_JANINE,
        PHONE_CONTACT_SABRINA,
        PHONE_CONTACT_BLAINE,
        PHONE_CONTACT_BLUE,
    };

    r4 = 0;
    for (i = 0; i < 1; ++i) {
        if (callerID != sGymLeaderContacts[i] && PhoneRematches_IsSeeking(a0->momsSavings, sGymLeaderContacts[i])) {
            ++r4;
        }
    }
    return r4 < 5;
}
