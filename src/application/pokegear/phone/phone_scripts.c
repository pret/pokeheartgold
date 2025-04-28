#include "global.h"

#include "constants/maps.h"

#include "application/pokegear/phone/phone_internal.h"
#include "msgdata/msg/msg_0664.h"
#include "msgdata/msg/msg_0716.h"

#include "map_header.h"
#include "math_util.h"
#include "sys_flags.h"
#include "sys_vars.h"

u16 MomCallGetIntroMsgByLocation(PokegearPhoneApp_Sub0C4 *a0, PokegearPhoneApp_Sub0C4_Sub88 *a1);
int MomCallGetSaveMoneyPromptMsg(PokegearPhoneApp_Sub0C4 *a0, PokegearPhoneApp_Sub0C4_Sub88 *a1);
BOOL ov101_021F2CAC(PokegearPhoneApp_Sub0C4 *a0, const UnkStruct_ov101_021F968C *a1);
BOOL ov101_021F2CB8(PokegearPhoneApp_Sub0C4 *a0, const UnkStruct_ov101_021F968C *a1);
BOOL ov101_021F2D10(PokegearPhoneApp_Sub0C4 *a0, const UnkStruct_ov101_021F968C *a1);
BOOL ov101_021F2D48(PokegearPhoneApp_Sub0C4 *a0, const UnkStruct_ov101_021F968C *a1);
BOOL ov101_021F2D90(PokegearPhoneApp_Sub0C4 *a0, const UnkStruct_ov101_021F968C *a1);
BOOL ov101_021F2DC8(PokegearPhoneApp_Sub0C4 *a0, const UnkStruct_ov101_021F968C *a1);
BOOL ov101_021F2DE8(PokegearPhoneApp_Sub0C4 *a0, const UnkStruct_ov101_021F968C *a1);

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

static const u8 sPhoneCallData_ProfElm_MapScripts[][2] = {
    // H-hello? {STRVAR_1 3, 0, 0}?\rIt’s a disaster!\nUh, um, it’s just terrible!\rWhat should I do?\nIt... Oh, no...\rPlease get back here now!
    { 0, PHONE_SCRIPT_002 },
    // Hello, {STRVAR_1 3, 0, 0}?\nWe’ve discovered something!\rThe details are...well, I can’t really\nsay anything, but we want you to carry\fthat Egg!\rMy assistant is at the Poké Mart in\nViolet City. Could you go meet him and\fpick up that Egg?
    { 0, PHONE_SCRIPT_003 },
    // {STRVAR_1 3, 0, 0}, how are things going?\rI called because something weird is\nhappening with the radio broadcasts.\rThey were talking about Team Rocket.\r{STRVAR_1 3, 0, 0}, do you know anything\nabout it?\rMaybe Team Rocket has returned.\nNo, that just can’t be true.\rSorry to bug you. Take care!
    { 0, PHONE_SCRIPT_004 },
    // Hello, {STRVAR_1 3, 0, 0}?\nHow’s it going?\rI’ve gotten hold of something neat.\nSwing by my Lab and pick it up!\rSee you later!
    { 0, PHONE_SCRIPT_005 },
    // Hello, {STRVAR_1 3, 0, 0}?\rI have something here for you.\nCould you swing by my Lab?\rSee you later!
    { 0, PHONE_SCRIPT_006 },
};

u16 PhoneCall_GetCallScriptId_ProfElm(PokegearPhoneApp_Sub0C4 *a0, PokegearPhoneApp_Sub0C4_Sub88 *a1) {
    u8 badgeCount;
    u8 hatchedEgg;
    u8 gotEverstone;

    if (a1->unk_1A == 2) {
        a1->unk_20 = sPhoneCallData_ProfElm_MapScripts[a1->unk_1C][0];
        return sPhoneCallData_ProfElm_MapScripts[a1->unk_1C][1];
    }
    if (a1->unk_19) {
        a1->unk_20 = 0;
        return a1->unk_1C;
    }
    a1->unk_20 = 0;
    badgeCount = PlayerProfile_CountBadges(a0->unk_24);

    if (a1->unk_10->mapId == a0->unk_30) {
        return PHONE_SCRIPT_001;
    }
    if (!Save_VarsFlags_CheckFlagInArray(a0->unk_28, FLAG_GOT_ELMS_PANIC_CALL)) {
        return PHONE_SCRIPT_008;
    }
    if (!Save_VarsFlags_CheckFlagInArray(a0->unk_28, FLAG_GAVE_RIVAL_NAME_TO_OFFICER)) {
        return PHONE_SCRIPT_009;
    }
    if (!Save_VarsFlags_CheckFlagInArray(a0->unk_28, FLAG_GOT_PICK_UP_EGG_CALL_FROM_ELM)) {
        return PHONE_SCRIPT_010;
    }
    if (!Save_VarsFlags_CheckFlagInArray(a0->unk_28, FLAG_GOT_EGG_FROM_ELMS_ASSISTANT)) {
        return PHONE_SCRIPT_011;
    }
    hatchedEgg = Save_VarsFlags_CheckFlagInArray(a0->unk_28, FLAG_SYS_HATCHED_TOGEPI_EGG);
    gotEverstone = Save_VarsFlags_CheckFlagInArray(a0->unk_28, FLAG_GOT_EVERSTONE_FROM_ELM);
    if (badgeCount < 7) {
        if (!hatchedEgg) {
            return PHONE_SCRIPT_012;
        } else if (gotEverstone) {
            return PHONE_SCRIPT_014 + (LCRandom() % 2);
        } else {
            return PHONE_SCRIPT_013;
        }
    }
    if (Save_VarsFlags_IsInRocketTakeover(a0->unk_28)) {
        return PHONE_SCRIPT_016;
    }
    if (badgeCount < 8) {
        return PHONE_SCRIPT_017;
    }
    if (!CheckGameClearFlag(a0->unk_28)) {
        return PHONE_SCRIPT_018;
    }
    if (!Save_VarsFlags_CheckFlagInArray(a0->unk_28, FLAG_GOT_SS_TICKET_FROM_ELM)) {
        return PHONE_SCRIPT_019;
    }
    if (!gotEverstone) {
        if (hatchedEgg) {
            return PHONE_SCRIPT_013;
        } else {
            return PHONE_SCRIPT_012;
        }
    }
    if (Save_VarsFlags_CheckFlagInArray(a0->unk_28, FLAG_WAS_TOLD_ABOUT_POKERUS)) {
        return PHONE_SCRIPT_020 + (LCRandom() % 3);
    }
    return PHONE_SCRIPT_020 + (LCRandom() % 2);
}

u16 ov101_021F2B80(PokegearPhoneApp_Sub0C4 *a0, PokegearPhoneApp_Sub0C4_Sub88 *a1) {
    const UnkStruct_ov101_021F968C *r2;

    a1->unk_20 = 0;
    r2 = &ov101_021F968C[a1->unk_18 * 16];
    if (a1->unk_19) {
        return ov101_021F2BC0(a0, &r2[8], 8);
    } else if (a1->unk_10->mapId == a0->unk_30) {
        return a1->unk_10->unkA;
    } else {
        return ov101_021F2BC0(a0, &r2[0], 8);
    }
}

u16 ov101_021F2BC0(PokegearPhoneApp_Sub0C4 *a0, const UnkStruct_ov101_021F968C *a1, int a2) {
    int i;
    BOOL r0;
    PokegearPhoneApp_Sub0C4_Sub88 *sp0 = &a0->unk_88;
    const UnkStruct_ov101_021F968C *r4 = a1;

    for (i = 0; i < a2; ++i) {
        if (r4->unk_0 == 255 || r4->unk_0 == 0) {
            break;
        }
        switch (r4->unk_0) {
        case 2:
            r0 = ov101_021F2CB8(a0, r4);
            break;
        case 7:
            r0 = ov101_021F2D48(a0, r4);
            break;
        case 8:
            r0 = ov101_021F2D90(a0, r4);
            break;
        case 3:
            r0 = ov101_021F2D10(a0, r4);
            break;
        case 4:
            r0 = ov101_021F2DC8(a0, r4);
            break;
        case 5:
            r0 = ov101_021F2DE8(a0, r4);
            break;
        default:
            r0 = ov101_021F2CAC(a0, r4);
            break;
        }
        if (r0) {
            sp0->unk_20 = r4->unk_2;
            return r4->unk_4;
        }
        a1 = r4++;
    }
    if (a1->unk_0 == 255 || a1->unk_0 == 0) {
        sp0->unk_20 = 0;
        return PHONE_SCRIPT_000;
    }

    sp0->unk_20 = a1->unk_2;
    return a1->unk_4;
}

BOOL ov101_021F2C78(int a0) {
    int r2 = MTRandom() ^ MTRandom();
    u16 r0 = (u16)r2;
    r0 ^= (r2 >> 8);
    r0 %= 100;
    return r0 <= a0;
}

BOOL ov101_021F2CAC(PokegearPhoneApp_Sub0C4 *a0, const UnkStruct_ov101_021F968C *a1) {
    return ov101_021F2C78(a1->unk_1);
}

BOOL ov101_021F2CB8(PokegearPhoneApp_Sub0C4 *a0, const UnkStruct_ov101_021F968C *a1) {
    PokegearPhoneApp_Sub0C4_Sub88 *r6 = &a0->unk_88;

    if (PhoneRematches_IsSeeking(a0->unk_20, r6->unk_18)) {
        return FALSE;
    }
    if (PhoneRematches_GiftItemIdGet(a0->unk_20, r6->unk_18)) {
        return FALSE;
    }
    if (!Save_VarsFlags_CheckFlagInArray(a0->unk_28, FLAG_BEAT_RADIO_TOWER_ROCKETS) && a1->unk_2 == 0 && ov101_021F2374(a1->unk_4)->unk_2_0 == 3) {
        return FALSE;
    }
    return ov101_021F2C78(a1->unk_1);
}

BOOL ov101_021F2D10(PokegearPhoneApp_Sub0C4 *a0, const UnkStruct_ov101_021F968C *a1) {
    PokegearPhoneApp_Sub0C4_Sub88 *r4 = &a0->unk_88;

    if (!Save_VarsFlags_CheckFlagInArray(a0->unk_28, FLAG_BEAT_RADIO_TOWER_ROCKETS)) {
        return FALSE;
    }
    if (r4->unk_28.week != r4->unk_10->unkD || r4->unk_23 != r4->unk_10->unkE) {
        return FALSE;
    }
    return ov101_021F2C78(a1->unk_1);
}

BOOL ov101_021F2D48(PokegearPhoneApp_Sub0C4 *a0, const UnkStruct_ov101_021F968C *a1) {
    PokegearPhoneApp_Sub0C4_Sub88 *r4 = &a0->unk_88;

    if (!Save_VarsFlags_CheckFlagInArray(a0->unk_28, FLAG_BEAT_RADIO_TOWER_ROCKETS)) {
        return FALSE;
    }
    if (r4->unk_10->mapId == MAP_NATIONAL_PARK && Save_VarsFlags_CheckBugContestFlag(a0->unk_28)) {
        return FALSE;
    }
    if (!PhoneRematches_IsSeeking(a0->unk_20, r4->unk_18)) {
        return FALSE;
    }
    return ov101_021F2C78(a1->unk_1);
}

BOOL ov101_021F2D90(PokegearPhoneApp_Sub0C4 *a0, const UnkStruct_ov101_021F968C *a1) {
    PokegearPhoneApp_Sub0C4_Sub88 *r4 = &a0->unk_88;

    if (r4->unk_10->mapId == MAP_NATIONAL_PARK && Save_VarsFlags_CheckBugContestFlag(a0->unk_28)) {
        return FALSE;
    }
    if (!PhoneRematches_GiftItemIdGet(a0->unk_20, r4->unk_18)) {
        return FALSE;
    }
    return ov101_021F2C78(a1->unk_1);
}

BOOL ov101_021F2DC8(PokegearPhoneApp_Sub0C4 *a0, const UnkStruct_ov101_021F968C *a1) {
    if (a0->unk_88.unk_28.week == RTC_WEEK_TUESDAY || a0->unk_88.unk_28.week == RTC_WEEK_THURSDAY || a0->unk_88.unk_28.week == RTC_WEEK_SATURDAY) {
        return ov101_021F2C78(a1->unk_1);
    }
    return FALSE;
}

BOOL ov101_021F2DE8(PokegearPhoneApp_Sub0C4 *a0, const UnkStruct_ov101_021F968C *a1) {
    if (Save_VarsFlags_IsInRocketTakeover(a0->unk_28)) {
        return ov101_021F2C78(a1->unk_1);
    }
    return FALSE;
}
