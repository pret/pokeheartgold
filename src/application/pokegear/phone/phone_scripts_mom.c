#include "global.h"

#include "application/pokegear/phone/phone_internal.h"
#include "msgdata/msg/msg_0664.h"

#include "map_header.h"
#include "sys_flags.h"

u16 MomCallGetIntroMsgByLocation(PokegearPhoneApp_Sub0C4 *a0, PokegearPhoneApp_Sub0C4_Sub88 *a1);
int MomCallGetSaveMoneyPromptMsg(PokegearPhoneApp_Sub0C4 *a0, PokegearPhoneApp_Sub0C4_Sub88 *a1);

u16 PhoneCall_GetCallScriptId_Mother(PokegearPhoneApp_Sub0C4 *a0, PokegearPhoneApp_Sub0C4_Sub88 *a1) {
    a1->unk_20 = 0;
    if (a1->unk_1A == 2) {
        Save_VarsFlags_SetFlagInArray(a0->unk_28, FLAG_TALKED_TO_MOM_AFTER_NAMING_RIVAL);
        a1->unk_20 = 4;
        return PHONE_SCRIPT_000;
    }

    if (a1->unk_10->mapId == a0->unk_30) {
        return PHONE_SCRIPT_023;
    }

    if (a1->unk_19 != 0) {
        a1->unk_20 = 0;
        return a1->unk_1C;
    }

    if (!Save_VarsFlags_CheckFlagInArray(a0->unk_28, FLAG_GAVE_RIVAL_NAME_TO_OFFICER)) {
        return PHONE_SCRIPT_025;
    }

    if (!Save_VarsFlags_CheckFlagInArray(a0->unk_28, FLAG_TALKED_TO_MOM_AFTER_NAMING_RIVAL)) {
        return PHONE_SCRIPT_026;
    }

    a1->unk_20 = 4;
    return PHONE_SCRIPT_000;
}

BOOL GearPhoneCall_Mom(PokegearPhoneApp_Sub0C4 *a0) {
    PokegearPhoneApp_Sub0C4_Sub88 *r4 = &a0->unk_88;
    int r6;

    switch (r4->unk_04) {
    case 0:
        ov101_021F2110(a0);
        r4->unk_44 = MomSavingsBalanceAction(a0->unk_20, MOMS_BALANCE_GET, 0);
        BufferIntegerAsString(a0->unk_50, 10, r4->unk_44, 6, PRINTING_MODE_LEFT_ALIGN, TRUE);
        r4->unk_4D_0 = Save_VarsFlags_MomsSavingsFlagCheck(a0->unk_28);
        r4->unk_4D_1 = sub_0202F240(a0->unk_20);
        if (r4->unk_1A == 2) {
            r4->unk_04 = 2;
            return FALSE;
        }
        PhoneCallMessagePrint_Ungendered(a0, a0->unk_4C, MomCallGetIntroMsgByLocation(a0, r4));
        break;
    case 1:
        if (!ov101_021F2220(a0)) {
            return FALSE;
        }
        if (r4->unk_4D_1) {
            PhoneCallMessagePrint_Ungendered(a0, a0->unk_4C, msg_0664_00021);
            r4->unk_04 = 255;
            return FALSE;
        }
        break;
    case 2:
        PhoneCallMessagePrint_Ungendered(a0, a0->unk_4C, MomCallGetSaveMoneyPromptMsg(a0, r4));
        break;
    case 3:
        if (!ov101_021F2220(a0)) {
            return FALSE;
        }
        ov101_021F2308(a0, 2);
        break;
    case 4:
        r6 = ov101_021F2338(a0);
        if (r6 == -1) {
            return FALSE;
        }
        ov101_021F2344(a0);
        if (r6 == 0) {
            r4->unk_4D_1 = TRUE;
            PhoneCallMessagePrint_Ungendered(a0, a0->unk_4C, msg_0664_00025);
        } else {
            r4->unk_4D_1 = FALSE;
            PhoneCallMessagePrint_Ungendered(a0, a0->unk_4C, msg_0664_00026);
        }
        Save_VarsFlags_MomsSavingsFlagAction(a0->unk_28, r4->unk_4D_1);
        break;
    default:
        if (!ov101_021F2220(a0)) {
            return FALSE;
        }
        DestroyMsgData(a0->unk_4C);
        return TRUE;
    }

    ++r4->unk_04;
    return FALSE;
}

u16 MomCallGetIntroMsgByLocation(PokegearPhoneApp_Sub0C4 *a0, PokegearPhoneApp_Sub0C4_Sub88 *a1) {
    return msg_0664_00007 + MapHeader_GetMomCallIntroParam(a0->unk_30);
}

int MomCallGetSaveMoneyPromptMsg(PokegearPhoneApp_Sub0C4 *a0, PokegearPhoneApp_Sub0C4_Sub88 *a1) {
    if (a1->unk_1A == 2) {
        return msg_0664_00022;
    }
    if (a1->unk_4D_0) {
        if (a1->unk_44 != 0) {
            return msg_0664_00023;
        } else {
            return msg_0664_00027;
        }
    } else {
        if (a1->unk_44 != 0) {
            return msg_0664_00024;
        } else {
            return msg_0664_00028;
        }
    }
}
