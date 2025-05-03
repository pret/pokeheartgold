#include "global.h"

#include "constants/badge.h"
#include "constants/maps.h"

#include "application/pokegear/phone/phone_internal.h"
#include "msgdata/msg/msg_0641.h"
#include "msgdata/msg/msg_0642.h"
#include "msgdata/msg/msg_0643.h"
#include "msgdata/msg/msg_0644.h"
#include "msgdata/msg/msg_0645.h"
#include "msgdata/msg/msg_0646.h"
#include "msgdata/msg/msg_0647.h"
#include "msgdata/msg/msg_0648.h"
#include "msgdata/msg/msg_0649.h"
#include "msgdata/msg/msg_0650.h"
#include "msgdata/msg/msg_0651.h"
#include "msgdata/msg/msg_0652.h"
#include "msgdata/msg/msg_0653.h"
#include "msgdata/msg/msg_0654.h"
#include "msgdata/msg/msg_0655.h"
#include "msgdata/msg/msg_0656.h"
#include "msgdata/msg/msg_0657.h"
#include "msgdata/msg/msg_0658.h"
#include "msgdata/msg/msg_0659.h"
#include "msgdata/msg/msg_0660.h"
#include "msgdata/msg/msg_0661.h"
#include "msgdata/msg/msg_0662.h"
#include "msgdata/msg/msg_0663.h"
#include "msgdata/msg/msg_0664.h"
#include "msgdata/msg/msg_0665.h"
#include "msgdata/msg/msg_0666.h"
#include "msgdata/msg/msg_0667.h"
#include "msgdata/msg/msg_0669.h"
#include "msgdata/msg/msg_0670.h"
#include "msgdata/msg/msg_0671.h"
#include "msgdata/msg/msg_0672.h"
#include "msgdata/msg/msg_0673.h"
#include "msgdata/msg/msg_0674.h"
#include "msgdata/msg/msg_0675.h"
#include "msgdata/msg/msg_0676.h"
#include "msgdata/msg/msg_0677.h"
#include "msgdata/msg/msg_0678.h"
#include "msgdata/msg/msg_0679.h"
#include "msgdata/msg/msg_0680.h"
#include "msgdata/msg/msg_0681.h"
#include "msgdata/msg/msg_0682.h"
#include "msgdata/msg/msg_0683.h"
#include "msgdata/msg/msg_0684.h"
#include "msgdata/msg/msg_0685.h"
#include "msgdata/msg/msg_0686.h"
#include "msgdata/msg/msg_0687.h"
#include "msgdata/msg/msg_0688.h"
#include "msgdata/msg/msg_0689.h"
#include "msgdata/msg/msg_0690.h"
#include "msgdata/msg/msg_0691.h"
#include "msgdata/msg/msg_0692.h"
#include "msgdata/msg/msg_0693.h"
#include "msgdata/msg/msg_0694.h"
#include "msgdata/msg/msg_0695.h"
#include "msgdata/msg/msg_0696.h"
#include "msgdata/msg/msg_0697.h"
#include "msgdata/msg/msg_0698.h"
#include "msgdata/msg/msg_0699.h"
#include "msgdata/msg/msg_0700.h"
#include "msgdata/msg/msg_0701.h"
#include "msgdata/msg/msg_0702.h"
#include "msgdata/msg/msg_0703.h"
#include "msgdata/msg/msg_0704.h"
#include "msgdata/msg/msg_0705.h"
#include "msgdata/msg/msg_0706.h"
#include "msgdata/msg/msg_0707.h"
#include "msgdata/msg/msg_0708.h"
#include "msgdata/msg/msg_0709.h"
#include "msgdata/msg/msg_0710.h"
#include "msgdata/msg/msg_0711.h"
#include "msgdata/msg/msg_0712.h"
#include "msgdata/msg/msg_0713.h"
#include "msgdata/msg/msg_0714.h"
#include "msgdata/msg/msg_0715.h"
#include "msgdata/msg/msg_0716.h"

#include "daycare.h"
#include "encounter.h"
#include "get_egg.h"
#include "map_events.h"
#include "map_header.h"
#include "math_util.h"
#include "phonebook_dat.h"
#include "safari_zone.h"
#include "sys_flags.h"
#include "sys_vars.h"
#include "unk_02005D10.h"
#include "unk_02031B0C.h"
#include "unk_0205BB1C.h"

u16 MomCallGetIntroMsgByLocation(PokegearPhoneApp_Sub0C4 *a0, PokegearPhoneApp_Sub0C4_Sub88 *a1);
int MomCallGetSaveMoneyPromptMsg(PokegearPhoneApp_Sub0C4 *a0, PokegearPhoneApp_Sub0C4_Sub88 *a1);
BOOL ov101_021F2CAC(PokegearPhoneApp_Sub0C4 *a0, const UnkStruct_ov101_021F968C *a1);
BOOL ov101_021F2CB8(PokegearPhoneApp_Sub0C4 *a0, const UnkStruct_ov101_021F968C *a1);
BOOL ov101_021F2D10(PokegearPhoneApp_Sub0C4 *a0, const UnkStruct_ov101_021F968C *a1);
BOOL ov101_021F2D48(PokegearPhoneApp_Sub0C4 *a0, const UnkStruct_ov101_021F968C *a1);
BOOL ov101_021F2D90(PokegearPhoneApp_Sub0C4 *a0, const UnkStruct_ov101_021F968C *a1);
BOOL ov101_021F2DC8(PokegearPhoneApp_Sub0C4 *a0, const UnkStruct_ov101_021F968C *a1);
BOOL ov101_021F2DE8(PokegearPhoneApp_Sub0C4 *a0, const UnkStruct_ov101_021F968C *a1);
u8 ov101_021F3C60(u8 hour);
u16 ov101_021F3E74(u16 mapId);
BOOL ov101_021F40E8(PokegearPhoneApp_Sub0C4 *a0, u8 callerID);
u16 ov101_021F42E4(PokegearPhoneApp_Sub0C4 *a0, PokegearPhoneApp_Sub0C4_Sub88 *a1, u8 badgeCount, u8 hasPlainBadge);

// static const u16 ov101_021F86C8[] = {
//     PHONE_SCRIPT_102,
//     PHONE_SCRIPT_101,
// };

extern const u16 ov101_021F86C8[];
extern const u8 ov101_021F8760[];
extern const u16 ov101_021F86CC[];

u16 PhoneCall_GetCallScriptId_Mother(PokegearPhoneApp_Sub0C4 *a0, PokegearPhoneApp_Sub0C4_Sub88 *a1) {
    a1->scriptType = 0;
    if (a1->unk_1A == 2) {
        Save_VarsFlags_SetFlagInArray(a0->saveVarsFlags, FLAG_TALKED_TO_MOM_AFTER_NAMING_RIVAL);
        a1->scriptType = 4;
        return PHONE_SCRIPT_000;
    }

    if (a1->phoneBookEntry->mapId == a0->playerMapSec) {
        return PHONE_SCRIPT_023;
    }

    if (a1->unk_19 != 0) {
        a1->scriptType = 0;
        return a1->unk_1C;
    }

    if (!Save_VarsFlags_CheckFlagInArray(a0->saveVarsFlags, FLAG_GAVE_RIVAL_NAME_TO_OFFICER)) {
        return PHONE_SCRIPT_025;
    }

    if (!Save_VarsFlags_CheckFlagInArray(a0->saveVarsFlags, FLAG_TALKED_TO_MOM_AFTER_NAMING_RIVAL)) {
        return PHONE_SCRIPT_026;
    }

    a1->scriptType = 4;
    return PHONE_SCRIPT_000;
}

BOOL GearPhoneCall_Mom(PokegearPhoneApp_Sub0C4 *a0) {
    PokegearPhoneApp_Sub0C4_Sub88 *r4 = &a0->unk_88;
    int r6;

    switch (r4->unk_04) {
    case 0:
        PhoneCall_InitMsgDataAndBufferNames(a0);
        r4->unk_44 = MomSavingsBalanceAction(a0->momsSavings, MOMS_BALANCE_GET, 0);
        BufferIntegerAsString(a0->msgFormat, 10, r4->unk_44, 6, PRINTING_MODE_LEFT_ALIGN, TRUE);
        r4->flag0 = Save_VarsFlags_MomsSavingsFlagCheck(a0->saveVarsFlags);
        r4->flag1 = sub_0202F240(a0->momsSavings);
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

u16 MomCallGetIntroMsgByLocation(PokegearPhoneApp_Sub0C4 *a0, PokegearPhoneApp_Sub0C4_Sub88 *a1) {
    return msg_0664_00007 + MapHeader_GetMomCallIntroParam(a0->playerMapSec);
}

int MomCallGetSaveMoneyPromptMsg(PokegearPhoneApp_Sub0C4 *a0, PokegearPhoneApp_Sub0C4_Sub88 *a1) {
    if (a1->unk_1A == 2) {
        return msg_0664_00022;
    }
    if (a1->flag0) {
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
        a1->scriptType = sPhoneCallData_ProfElm_MapScripts[a1->unk_1C][0];
        return sPhoneCallData_ProfElm_MapScripts[a1->unk_1C][1];
    }
    if (a1->unk_19) {
        a1->scriptType = 0;
        return a1->unk_1C;
    }
    a1->scriptType = 0;
    badgeCount = PlayerProfile_CountBadges(a0->playerProfile);

    if (a1->phoneBookEntry->mapId == a0->playerMapSec) {
        return PHONE_SCRIPT_001;
    }
    if (!Save_VarsFlags_CheckFlagInArray(a0->saveVarsFlags, FLAG_GOT_ELMS_PANIC_CALL)) {
        return PHONE_SCRIPT_008;
    }
    if (!Save_VarsFlags_CheckFlagInArray(a0->saveVarsFlags, FLAG_GAVE_RIVAL_NAME_TO_OFFICER)) {
        return PHONE_SCRIPT_009;
    }
    if (!Save_VarsFlags_CheckFlagInArray(a0->saveVarsFlags, FLAG_GOT_PICK_UP_EGG_CALL_FROM_ELM)) {
        return PHONE_SCRIPT_010;
    }
    if (!Save_VarsFlags_CheckFlagInArray(a0->saveVarsFlags, FLAG_GOT_EGG_FROM_ELMS_ASSISTANT)) {
        return PHONE_SCRIPT_011;
    }
    hatchedEgg = Save_VarsFlags_CheckFlagInArray(a0->saveVarsFlags, FLAG_SYS_HATCHED_TOGEPI_EGG);
    gotEverstone = Save_VarsFlags_CheckFlagInArray(a0->saveVarsFlags, FLAG_GOT_EVERSTONE_FROM_ELM);
    if (badgeCount < 7) {
        if (!hatchedEgg) {
            return PHONE_SCRIPT_012;
        } else if (gotEverstone) {
            return PHONE_SCRIPT_014 + (LCRandom() % 2);
        } else {
            return PHONE_SCRIPT_013;
        }
    }
    if (Save_VarsFlags_IsInRocketTakeover(a0->saveVarsFlags)) {
        return PHONE_SCRIPT_016;
    }
    if (badgeCount < 8) {
        return PHONE_SCRIPT_017;
    }
    if (!CheckGameClearFlag(a0->saveVarsFlags)) {
        return PHONE_SCRIPT_018;
    }
    if (!Save_VarsFlags_CheckFlagInArray(a0->saveVarsFlags, FLAG_GOT_SS_TICKET_FROM_ELM)) {
        return PHONE_SCRIPT_019;
    }
    if (!gotEverstone) {
        if (hatchedEgg) {
            return PHONE_SCRIPT_013;
        } else {
            return PHONE_SCRIPT_012;
        }
    }
    if (Save_VarsFlags_CheckFlagInArray(a0->saveVarsFlags, FLAG_WAS_TOLD_ABOUT_POKERUS)) {
        return PHONE_SCRIPT_020 + (LCRandom() % 3);
    }
    return PHONE_SCRIPT_020 + (LCRandom() % 2);
}

u16 PhoneCall_GetScriptId_Generic(PokegearPhoneApp_Sub0C4 *a0, PokegearPhoneApp_Sub0C4_Sub88 *a1) {
    const UnkStruct_ov101_021F968C *r2;

    a1->scriptType = 0;
    r2 = &ov101_021F968C[a1->callerID * 16];
    if (a1->unk_19) {
        return ov101_021F2BC0(a0, &r2[8], 8);
    } else if (a1->phoneBookEntry->mapId == a0->playerMapSec) {
        return a1->phoneBookEntry->phoneScriptIfLocal;
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
            sp0->scriptType = r4->unk_2;
            return r4->unk_4;
        }
        a1 = r4++;
    }
    if (a1->unk_0 == 255 || a1->unk_0 == 0) {
        sp0->scriptType = 0;
        return PHONE_SCRIPT_000;
    }

    sp0->scriptType = a1->unk_2;
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

    if (PhoneRematches_IsSeeking(a0->momsSavings, r6->callerID)) {
        return FALSE;
    }
    if (PhoneRematches_GiftItemIdGet(a0->momsSavings, r6->callerID)) {
        return FALSE;
    }
    if (!Save_VarsFlags_CheckFlagInArray(a0->saveVarsFlags, FLAG_BEAT_RADIO_TOWER_ROCKETS) && a1->unk_2 == 0 && ov101_021F2374(a1->unk_4)->unk_2_0 == 3) {
        return FALSE;
    }
    return ov101_021F2C78(a1->unk_1);
}

BOOL ov101_021F2D10(PokegearPhoneApp_Sub0C4 *a0, const UnkStruct_ov101_021F968C *a1) {
    PokegearPhoneApp_Sub0C4_Sub88 *r4 = &a0->unk_88;

    if (!Save_VarsFlags_CheckFlagInArray(a0->saveVarsFlags, FLAG_BEAT_RADIO_TOWER_ROCKETS)) {
        return FALSE;
    }
    if (r4->date.week != r4->phoneBookEntry->rematchWeekday || r4->timeOfDay != r4->phoneBookEntry->rematchTimeOfDay) {
        return FALSE;
    }
    return ov101_021F2C78(a1->unk_1);
}

BOOL ov101_021F2D48(PokegearPhoneApp_Sub0C4 *a0, const UnkStruct_ov101_021F968C *a1) {
    PokegearPhoneApp_Sub0C4_Sub88 *r4 = &a0->unk_88;

    if (!Save_VarsFlags_CheckFlagInArray(a0->saveVarsFlags, FLAG_BEAT_RADIO_TOWER_ROCKETS)) {
        return FALSE;
    }
    if (r4->phoneBookEntry->mapId == MAP_NATIONAL_PARK && Save_VarsFlags_CheckBugContestFlag(a0->saveVarsFlags)) {
        return FALSE;
    }
    if (!PhoneRematches_IsSeeking(a0->momsSavings, r4->callerID)) {
        return FALSE;
    }
    return ov101_021F2C78(a1->unk_1);
}

BOOL ov101_021F2D90(PokegearPhoneApp_Sub0C4 *a0, const UnkStruct_ov101_021F968C *a1) {
    PokegearPhoneApp_Sub0C4_Sub88 *r4 = &a0->unk_88;

    if (r4->phoneBookEntry->mapId == MAP_NATIONAL_PARK && Save_VarsFlags_CheckBugContestFlag(a0->saveVarsFlags)) {
        return FALSE;
    }
    if (!PhoneRematches_GiftItemIdGet(a0->momsSavings, r4->callerID)) {
        return FALSE;
    }
    return ov101_021F2C78(a1->unk_1);
}

BOOL ov101_021F2DC8(PokegearPhoneApp_Sub0C4 *a0, const UnkStruct_ov101_021F968C *a1) {
    if (a0->unk_88.date.week == RTC_WEEK_TUESDAY || a0->unk_88.date.week == RTC_WEEK_THURSDAY || a0->unk_88.date.week == RTC_WEEK_SATURDAY) {
        return ov101_021F2C78(a1->unk_1);
    }
    return FALSE;
}

BOOL ov101_021F2DE8(PokegearPhoneApp_Sub0C4 *a0, const UnkStruct_ov101_021F968C *a1) {
    if (Save_VarsFlags_IsInRocketTakeover(a0->saveVarsFlags)) {
        return ov101_021F2C78(a1->unk_1);
    }
    return FALSE;
}

u16 ov101_021F2E04(u16 a0, u8 a1, u8 a2) {
    ENC_DATA encounters;
    u16 *r4;

    if (!MapHeader_HasWildEncounters(a0)) {
        return SPECIES_RATTATA;
    }
    WildEncounters_ReadFromNarc(&encounters, a0);
    if (a1 == TRAINERCLASS_FISHERMAN) {
        if (a2 == TIMEOFDAY_WILD_NITE) {
            encounters.goodRodSlots[3].species = encounters.swarmSpecies[2];
        }
        return encounters.goodRodSlots[LCRandom() % 5].species;
    } else {
        switch (a2) {
        case TIMEOFDAY_WILD_DAY:
            r4 = encounters.landSlots.species_day;
            break;
        case TIMEOFDAY_WILD_NITE:
            r4 = encounters.landSlots.species_nite;
            break;
        case 0:
        default:
            r4 = encounters.landSlots.species_morn;
            break;
        }
        return r4[LCRandom() % 12];
    }
}

u16 ov101_021F2E74(u16 a0, HeapID a1) {
    int i;
    Trainer trdata;
    TRPOKE *trpoke;
    u16 teamSpecies[PARTY_SIZE];

    TrainerData_ReadTrData(a0, &trdata);
    trpoke = AllocFromHeap(a1, sizeof(TRPOKE) * PARTY_SIZE);
    MI_CpuClear8(trpoke, sizeof(TRPOKE) * PARTY_SIZE);
    TrainerData_ReadTrPoke(a0, trpoke);
    switch (trdata.data.trainerType) {
    case 0: {
        TRPOKE_NOITEM_DFLTMOVES *trpoke_ = &trpoke->species;
        for (i = 0; i < trdata.data.npoke; ++i) {
            teamSpecies[i] = trpoke_[i].species;
        }
        break;
    }
    case 1: {
        TRPOKE_NOITEM_CUSTMOVES *trpoke_ = &trpoke->species_moves;
        for (i = 0; i < trdata.data.npoke; ++i) {
            teamSpecies[i] = trpoke_[i].species;
        }
        break;
    }
    case 2: {
        TRPOKE_ITEM_DFLTMOVES *trpoke_ = &trpoke->species_item;
        for (i = 0; i < trdata.data.npoke; ++i) {
            teamSpecies[i] = trpoke_[i].species;
        }
        break;
    }
    case 3: {
        TRPOKE_ITEM_CUSTMOVES *trpoke_ = &trpoke->species_item_moves;
        for (i = 0; i < trdata.data.npoke; ++i) {
            teamSpecies[i] = trpoke_[i].species;
        }
        break;
    }
    default:
        FreeToHeap(trpoke);
        return SPECIES_RATTATA;
    }
    FreeToHeap(trpoke);
    return teamSpecies[LCRandom() % trdata.data.npoke];
}

BOOL ov101_021F2F50(PokegearPhoneApp_Sub0C4 *a0) {
    PokegearPhoneApp_Sub0C4_Sub88 *r4 = &a0->unk_88;
    const PhoneCallScriptDef *scriptDef;

    switch (r4->unk_04) {
    case 0:
        PhoneCall_InitMsgDataAndBufferNames(a0);
        ov101_021F2248(a0, ov101_021F2374(r4->scriptID));
        BufferSpeciesName(a0->msgFormat, 10, ov101_021F2E74(r4->phoneBookEntry->trainerId, a0->heapId));
        BufferSpeciesName(a0->msgFormat, 11, ov101_021F2E04(r4->phoneBookEntry->mapId, r4->phoneBookEntry->trainerClass, r4->timeOfDay));
        if (r4->phoneBookEntry->unkC == 255) {
            ++r4->unk_04;
        }
        break;
    case 1:
        if (!ov101_021F2614(a0)) {
            return FALSE;
        }
        break;
    case 2:
        scriptDef = ov101_021F2374(r4->scriptID);
        PhoneCallMessagePrint_Gendered(a0, a0->msgData_PhoneContact, scriptDef->msgIds[0], scriptDef->msgIds[1]);
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

BOOL ov101_021F2FFC(PokegearPhoneApp_Sub0C4 *a0) {
    PokegearPhoneApp_Sub0C4_Sub88 *r4 = &a0->unk_88;
    u8 r5;
    const PhoneCallScriptDef *scriptDef;

    switch (r4->unk_04) {
    case 0:
        PhoneCall_InitMsgDataAndBufferNames(a0);
        ov101_021F2248(a0, ov101_021F2374(r4->scriptID));
        if (r4->phoneBookEntry->unkC == 255) {
            ++r4->unk_04;
        }
        break;
    case 1:
        if (!ov101_021F2614(a0)) {
            return FALSE;
        }
        break;
    case 2:
        r5 = LCRandom() % 11;
        scriptDef = ov101_021F2374(r4->scriptID);
        if (scriptDef->msgIds[0] == scriptDef->msgIds[1]) {
            PhoneCallMessagePrint_Ungendered(a0, a0->msgData_PhoneContact, scriptDef->msgIds[0] + r5);
        } else {
            r5 *= 2;
            PhoneCallMessagePrint_Gendered(a0, a0->msgData_PhoneContact, scriptDef->msgIds[0] + r5, scriptDef->msgIds[1] + r5 + 1);
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

u16 PhoneCall_GetCallScriptId_ProfOak(PokegearPhoneApp_Sub0C4 *a0, PokegearPhoneApp_Sub0C4_Sub88 *a1) {
    Pokedex *pokedex;
    u16 dexCountParam;

    a1->scriptType = 0;
    pokedex = Save_Pokedex_Get(a0->saveData);
    if (a1->unk_1A == 2) {
        a1->scriptType = 0;
        return PHONE_SCRIPT_082;
    }
    if (a1->unk_19 != 0) {
        dexCountParam = Pokedex_CountNationalDexOwned(pokedex) / 50;
        if (dexCountParam == 0) {
            dexCountParam = 1;
        } else if (dexCountParam > 9) {
            dexCountParam = 9;
        }
        return PHONE_SCRIPT_068 + dexCountParam;
    }
    if (a1->phoneBookEntry->mapId == a0->playerMapSec) {
        return PHONE_SCRIPT_068;
    }
    if (Save_VarsFlags_CheckFlagInArray(a0->saveVarsFlags, FLAG_SYS_OAK_ACKNOWLEDGED_NATIONAL_DEX_COMPLETION)) {
        return PHONE_SCRIPT_081;
    }
    if (!Pokedex_GetNatDexFlag(pokedex) && Save_VarsFlags_CheckFlagInArray(a0->saveVarsFlags, FLAG_SYS_OAK_ACKNOWLEDGED_JOHTO_DEX_COMPLETION)) {
        return PHONE_SCRIPT_080;
    }
    a1->scriptType = 5;
    return PHONE_SCRIPT_000;
}

BOOL GearPhoneCall_ProfOak(PokegearPhoneApp_Sub0C4 *a0) {
    PokegearPhoneApp_Sub0C4_Sub88 *r4 = &a0->unk_88;
    Pokedex *pokedex;
    int r6;
    u16 r7;
    u16 r6_2;
    u16 dexFanfare;
    BOOL r6_3;

    switch (r4->unk_04) {
    case 0:
        PhoneCall_InitMsgDataAndBufferNames(a0);
        pokedex = Save_Pokedex_Get(a0->saveData);
        r4->flag0 = Pokedex_GetNatDexFlag(pokedex);
        r4->flag1 = Pokedex_JohtoDexIsComplete(pokedex);
        r4->flag2 = Pokedex_NationalDexIsComplete(pokedex);
        r4->miscPtr.pokedex = pokedex;
        PhoneCallMessagePrint_Gendered(a0, a0->msgData_PhoneContact, msg_0666_00013, msg_0666_00014);
        break;
    case 1:
        if (!PhoneCall_IsMessageDonePrinting(a0)) {
            return FALSE;
        }
        PhoneCallMessagePrint_Ungendered(a0, a0->msgData_PhoneContact, msg_0666_00015);
        break;
    case 2:
        if (!PhoneCall_IsMessageDonePrinting(a0)) {
            return FALSE;
        }
        if (r4->flag0) {
            if (Save_VarsFlags_CheckFlagInArray(a0->saveVarsFlags, FLAG_SYS_OAK_ACKNOWLEDGED_JOHTO_DEX_COMPLETION)) {
                r4->unk_4A = 2;
            } else {
                r4->unk_4A = 1;
            }
        } else {
            r4->unk_4A = 0;
        }
        PhoneCall_TouchscreenListMenu_Create(a0, msg_0666_00003 + r4->unk_4A);
        break;
    case 3:
        r6 = PhoneCall_TouchscreenListMenu_HandleInput(a0);
        if (r6 == -1) {
            return FALSE;
        }
        PhoneCall_TouchscreenListMenu_Destroy(a0);
        if (r6 == 0) {
            if (r4->unk_4A == 2) {
                r4->flag3 = TRUE;
            } else {
                r4->flag3 = FALSE;
            }
        } else if (r6 == 1 && r4->unk_4A == 1) {
            r4->flag3 = TRUE;
        } else {
            PhoneCallMessagePrint_Ungendered(a0, a0->msgData_PhoneContact, msg_0666_00021);
            r4->unk_04 = 255;
            return FALSE;
        }
        if (!r4->flag3) {
            r7 = Pokedex_CountJohtoDexSeen(r4->miscPtr.pokedex);
            r6_2 = Pokedex_CountJohtoDexOwned(r4->miscPtr.pokedex);
        } else {
            r7 = Pokedex_CountNationalDexSeen(r4->miscPtr.pokedex);
            r6_2 = Pokedex_CountNationalDexOwned(r4->miscPtr.pokedex);
        }
        BufferIntegerAsString(a0->msgFormat, 5, r7, 3, PRINTING_MODE_LEFT_ALIGN, TRUE);
        BufferIntegerAsString(a0->msgFormat, 6, r6_2, 3, PRINTING_MODE_LEFT_ALIGN, TRUE);
        PhoneCallMessagePrint_Ungendered(a0, a0->msgData_PhoneContact, msg_0666_00020);
        break;
    case 4:
        if (!PhoneCall_IsMessageDonePrinting(a0)) {
            return FALSE;
        }
        r6_3 = FALSE;
        if (!r4->flag3) {
            r7 = GetOakJohtoDexRating(Pokedex_CountJohtoOwned_ExcludeMythical(r4->miscPtr.pokedex), a0->playerGender, &dexFanfare);
            if (r4->flag1) {
                Save_VarsFlags_SetFlagInArray(a0->saveVarsFlags, FLAG_SYS_OAK_ACKNOWLEDGED_JOHTO_DEX_COMPLETION);
                r6_3 = TRUE;
            }
        } else {
            r7 = GetOakNationalDexRating(Pokedex_CountNationalOwned_ExcludeMythical(r4->miscPtr.pokedex), a0->playerGender, &dexFanfare);
            if (r4->flag2) {
                Save_VarsFlags_SetFlagInArray(a0->saveVarsFlags, FLAG_SYS_OAK_ACKNOWLEDGED_NATIONAL_DEX_COMPLETION);
                r6_3 = TRUE;
            }
        }
        PlayFanfare(dexFanfare);
        PhoneCallMessagePrint_Ungendered(a0, a0->msgData_PhoneContact, r7);
        if (r6_3) {
            r4->unk_04 = 255;
            return FALSE;
        }
        break;
    case 5:
        if (!PhoneCall_IsMessageDonePrinting(a0)) {
            return FALSE;
        }
        if (IsFanfarePlaying()) {
            return FALSE;
        }
        PhoneCallMessagePrint_Ungendered(a0, a0->msgData_PhoneContact, msg_0666_00021);
        break;
    default:
        if (!PhoneCall_IsMessageDonePrinting(a0)) {
            return FALSE;
        }
        if (r4->unk_04 == 255 && IsFanfarePlaying()) {
            return FALSE;
        }
        DestroyMsgData(a0->msgData_PhoneContact);
        return TRUE;
    }

    ++r4->unk_04;
    return FALSE;
}

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

u16 PhoneCall_GetScriptId_BikeShop(PokegearPhoneApp_Sub0C4 *a0, PokegearPhoneApp_Sub0C4_Sub88 *a1) {
    a1->scriptType = 0;
    if (a1->phoneBookEntry->mapId == a0->playerMapSec) {
        return PHONE_SCRIPT_084;
    } else {
        return PHONE_SCRIPT_085;
    }
}

u16 PhoneCall_GetScriptId_Kenji(PokegearPhoneApp_Sub0C4 *a0, PokegearPhoneApp_Sub0C4_Sub88 *a1) {
    u8 r6;
    u8 timeOfDay;
    a1->scriptType = 0;
    if (a1->phoneBookEntry->mapId == a0->playerMapSec) {
        return PHONE_SCRIPT_086;
    }
    a1->unk_4A = sub_0202F284(a0->momsSavings);
    if (a1->unk_4A > 1) {
        return PHONE_SCRIPT_087;
    } else if (a1->unk_4A == 1) {
        return PHONE_SCRIPT_088;
    }
    r6 = sub_0202F274(a0->momsSavings);
    if (r6 != 0 && !PhoneRematches_IsSeeking(a0->momsSavings, 16)) {
        return PHONE_SCRIPT_087;
    }
    timeOfDay = GF_RTC_GetTimeOfDayByHour(a1->time.hour);
    if (timeOfDay == RTC_TIMEOFDAY_EVE || timeOfDay == RTC_TIMEOFDAY_NITE) {
        return PHONE_SCRIPT_091;
    }
    if (r6 == 0) {
        sub_0202F254(a0->momsSavings, TRUE);
        PhoneRematches_SetSeeking(a0->momsSavings, 16, TRUE);
    }
    if (a1->timeOfDay == TIMEOFDAY_WILD_DAY) {
        return PHONE_SCRIPT_090;
    } else {
        return PHONE_SCRIPT_089;
    }
}

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
    return PHONE_SCRIPT_000;
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
    return PHONE_SCRIPT_000;
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

u16 PhoneCall_GetScriptId_Buena(PokegearPhoneApp_Sub0C4 *a0, PokegearPhoneApp_Sub0C4_Sub88 *a1) {
    a1->scriptType = 0;
    a1->flag0 = CheckGameClearFlag(a0->saveVarsFlags);
    a1->unk_4A = ov101_021F3C60(a1->time.hour);
    if (Save_VarsFlags_IsInRocketTakeover(a0->saveVarsFlags)) {
        return PHONE_SCRIPT_099;
    }
    if (a1->unk_19) {
        a1->scriptType = 9;
        return PHONE_SCRIPT_000;
    }
    if (a1->unk_4A == 3) {
        return PHONE_SCRIPT_100;
    }
    if (a1->phoneBookEntry->mapId == a0->playerMapSec) {
        return PHONE_SCRIPT_098;
    }
    a1->scriptType = 8;
    return PHONE_SCRIPT_000;
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

u16 PhoneCall_GetScriptId_EthanLyra(PokegearPhoneApp_Sub0C4 *a0, PokegearPhoneApp_Sub0C4_Sub88 *a1) {
    if (a1->unk_19) {
        a1->scriptType = 11;
        return PHONE_SCRIPT_000;
    }
    if (a1->phoneBookEntry->mapId == a0->playerMapSec) {
        a1->scriptType = 0;
        return ov101_021F86C8[a0->playerGender];
    }
    a1->scriptType = 10;
    return PHONE_SCRIPT_000;
}

BOOL GearPhoneCall_EthanLyra(PokegearPhoneApp_Sub0C4 *a0) {
    PokegearPhoneApp_Sub0C4_Sub88 *r4 = &a0->unk_88;

    switch (r4->unk_04) {
    case 0:
        PhoneCall_InitMsgDataAndBufferNames(a0);
        break;
    case 1:
        PhoneCallMessagePrint_Ungendered(a0, a0->msgData_PhoneContact, msg_0662_00004 + r4->timeOfDay);
        break;
    case 2:
        if (!PhoneCall_IsMessageDonePrinting(a0)) {
            return FALSE;
        }
        PhoneCallMessagePrint_Ungendered(a0, a0->msgData_PhoneContact, ov101_021F3E74(a0->playerMapID));
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

u8 ov101_021F3D34(PokegearPhoneApp_Sub0C4 *a0) {
    int i;
    u8 r4;
    u8 *r5;
    u8 r6;
    u8 sp0[4];

    r4 = 0;
    r6 = Pokegear_GetMapUnlockLevel(SaveData_GSPlayerMisc_Get(a0->saveData));
    sp0[0] = 1;
    if (Save_VarsFlags_FlypointFlagAction(a0->saveVarsFlags, FLAG_ACTION_CHECK, FLAG_UNK_9C9 - FLAG_SYS_FLYPOINT_PALLET)) {
        sp0[1] = 1; // 2D 2E 48
    } // UB: else, sp0[1] is undefined
    if (r6) {
        sp0[2] = 1; // 19 1A 39
    } // UB: else, sp0[2] is undefined
    if (r6 > 1) {
        sp0[3] = 1; // 00-17 1A 2F-37 39
    } // UB: else, sp0[3] is undefined

    r5 = AllocFromHeapAtEnd(a0->heapId, 73);
    MI_CpuClear8(r5, 73);
    for (i = 0; i < 73; ++i) {
        if (sp0[ov101_021F8760[i]]) {
            r5[r4++] = i;
        }
    }
    r4 = r5[LCRandom() % r4];
    FreeToHeap(r5);
    return r4 + msg_0662_00086;
}

BOOL GearPhoneCall_EthanLyra2(PokegearPhoneApp_Sub0C4 *a0) {
    PokegearPhoneApp_Sub0C4_Sub88 *r4 = &a0->unk_88;

    switch (r4->unk_04) {
    case 0:
        PhoneCall_InitMsgDataAndBufferNames(a0);
        break;
    case 1:
        PhoneCallMessagePrint_Ungendered(a0, a0->msgData_PhoneContact, msg_0662_00007 + r4->timeOfDay);
        break;
    case 2:
        if (!PhoneCall_IsMessageDonePrinting(a0)) {
            return FALSE;
        }
        if ((LCRandom() % 1000) < 500) {
            PhoneCallMessagePrint_Ungendered(a0, a0->msgData_PhoneContact, msg_0662_00010 + ((LCRandom() % 900) / 300));
        } else {
            PhoneCallMessagePrint_Ungendered(a0, a0->msgData_PhoneContact, ov101_021F3D34(a0));
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

u16 ov101_021F3E74(u16 mapId) {
    int i;

    for (i = 0; i < 73; ++i) {
        if (mapId == ov101_021F86CC[i]) {
            return msg_0662_00013 + i;
        }
    }
    return msg_0662_00010 + (LCRandom() % 3);
}

u16 PhoneCall_GetScriptId_GymLeader(PokegearPhoneApp_Sub0C4 *a0, PokegearPhoneApp_Sub0C4_Sub88 *a1) {
    if (PlayerProfile_CountBadges(a0->playerProfile) >= 16) {
        a1->flag0 = TRUE;
    } else {
        a1->flag0 = FALSE;
    }
    a1->flag1 = PhoneRematches_IsSeeking(a0->momsSavings, a1->callerID);
    if (a1->unk_19) {
        a1->scriptType = 14;
    } else {
        a1->scriptType = 13;
    }
    return PHONE_SCRIPT_000;
}

BOOL GearPhoneCall_GymLeader(PokegearPhoneApp_Sub0C4 *a0) {
    PokegearPhoneApp_Sub0C4_Sub88 *r4 = &a0->unk_88;
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

BOOL GearPhoneCall_GymLeader2(PokegearPhoneApp_Sub0C4 *a0) {
    PokegearPhoneApp_Sub0C4_Sub88 *r4 = &a0->unk_88;

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
BOOL ov101_021F40E8(PokegearPhoneApp_Sub0C4 *a0, u8 callerID) {
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

u16 PhoneCall_GetScriptId_Baoba(PokegearPhoneApp_Sub0C4 *a0, PokegearPhoneApp_Sub0C4_Sub88 *a1) {
    SafariZone *safariZone;

    a1->scriptType = 0;
    if (a1->unk_1A == 2) {
        return PHONE_SCRIPT_141;
    }
    if (a1->unk_19) {
        safariZone = Save_SafariZone_Get(a0->saveData);
        switch (a1->unk_1C) {
        case PHONE_SCRIPT_000:
            a1->scriptType = 15;
            return PHONE_SCRIPT_000;
        case PHONE_SCRIPT_142:
            Save_VarsFlags_SetVar4057(a0->saveVarsFlags, 4);
            return a1->unk_1C;
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
            a1->unk_1C = PHONE_SCRIPT_154;
            return a1->unk_1C;
        }
        Save_VarsFlags_SetVar4057(a0->saveVarsFlags, 7);
        return a1->unk_1C;
    }
    if (a1->phoneBookEntry->mapId == a0->playerMapSec) {
        return PHONE_SCRIPT_140;
    }
    return Save_VarsFlags_GetVar4057(a0->saveVarsFlags) + PHONE_SCRIPT_147;
}

BOOL GearPhoneCall_Baoba(PokegearPhoneApp_Sub0C4 *a0) {
    PokegearPhoneApp_Sub0C4_Sub88 *sp0 = &a0->unk_88;
    u8 sp4;
    u8 *r6;
    u8 r4;

    switch (sp0->unk_04) {
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

    ++sp0->unk_04;
    return FALSE;
}

u16 PhoneCall_GetScriptId_Irwin(PokegearPhoneApp_Sub0C4 *a0, PokegearPhoneApp_Sub0C4_Sub88 *a1) {
    u8 badgeCount;
    u8 hasPlainBadge;
    u16 scriptID;

    a1->scriptType = 0;
    if (!a1->unk_19) {
        if (Save_VarsFlags_IsInRocketTakeover(a0->saveVarsFlags)) {
            return PHONE_SCRIPT_156;
        } else {
            return PHONE_SCRIPT_172 + (LCRandom() % 3);
        }
    }
    badgeCount = PlayerProfile_CountBadges(a0->playerProfile);
    hasPlainBadge = PlayerProfile_TestBadgeFlag(a0->playerProfile, BADGE_PLAIN);
    scriptID = ov101_021F42E4(a0, a1, badgeCount, hasPlainBadge);
    if (scriptID != 0xFFFF) {
        return scriptID;
    } else if (!hasPlainBadge) {
        return PHONE_SCRIPT_169;
    } else if (badgeCount < 16) {
        return PHONE_SCRIPT_170;
    } else {
        return PHONE_SCRIPT_171;
    }
}

u16 ov101_021F42E4(PokegearPhoneApp_Sub0C4 *a0, PokegearPhoneApp_Sub0C4_Sub88 *a1, u8 badgeCount, u8 hasPlainBadge) {
    if (!Save_VarsFlags_CheckFlagInArray(a0->saveVarsFlags, FLAG_UNK_998)) {
        return 0xFFFF;
    }
    Save_VarsFlags_ClearFlagInArray(a0->saveVarsFlags, FLAG_UNK_998);
    if (badgeCount >= 16) {
        if (!Save_VarsFlags_CheckFlagInArray(a0->saveVarsFlags, FLAG_UNK_9A4)) {
            Save_VarsFlags_SetFlagInArray(a0->saveVarsFlags, FLAG_UNK_9A4);
            return PHONE_SCRIPT_168;
        } else {
            return 0xFFFF;
        }
    } else if (PlayerProfile_TestBadgeFlag(a0->playerProfile, BADGE_MARSH)) {
        if (!Save_VarsFlags_CheckFlagInArray(a0->saveVarsFlags, FLAG_UNK_9A3)) {
            Save_VarsFlags_SetFlagInArray(a0->saveVarsFlags, FLAG_UNK_9A3);
            return PHONE_SCRIPT_167;
        } else {
            return 0xFFFF;
        }
    } else if (Save_VarsFlags_CheckFlagInArray(a0->saveVarsFlags, FLAG_SNORLAX_MEET)) {
        if (!Save_VarsFlags_CheckFlagInArray(a0->saveVarsFlags, FLAG_UNK_9A2)) {
            Save_VarsFlags_SetFlagInArray(a0->saveVarsFlags, FLAG_UNK_9A2);
            return PHONE_SCRIPT_166;
        } else {
            return 0xFFFF;
        }
    } else if (Save_VarsFlags_CheckFlagInArray(a0->saveVarsFlags, FLAG_UNK_087)) {
        if (!Save_VarsFlags_CheckFlagInArray(a0->saveVarsFlags, FLAG_UNK_9A1)) {
            Save_VarsFlags_SetFlagInArray(a0->saveVarsFlags, FLAG_UNK_9A1);
            return PHONE_SCRIPT_165;
        } else {
            return 0xFFFF;
        }
    } else if (Save_VarsFlags_FlypointFlagAction(a0->saveVarsFlags, FLAG_ACTION_CHECK, FLAG_SYS_FLYPOINT_VERMILION - FLAG_SYS_FLYPOINT_PALLET)) {
        return PHONE_SCRIPT_164;
    } else if (CheckGameClearFlag(a0->saveVarsFlags)) {
        if (!Save_VarsFlags_CheckFlagInArray(a0->saveVarsFlags, FLAG_UNK_9A5)) {
            Save_VarsFlags_SetFlagInArray(a0->saveVarsFlags, FLAG_UNK_9A5);
            return PHONE_SCRIPT_163;
        } else {
            return 0xFFFF;
        }
    } else if (PlayerProfile_TestBadgeFlag(a0->playerProfile, BADGE_RISING)) {
        return PHONE_SCRIPT_162;
    } else if (Save_VarsFlags_CheckFlagInArray(a0->saveVarsFlags, FLAG_BEAT_RADIO_TOWER_ROCKETS)) {
        return PHONE_SCRIPT_161;
    } else if (Save_VarsFlags_CheckFlagInArray(a0->saveVarsFlags, FLAG_RED_GYARADOS_MEET)) {
        if (!Save_VarsFlags_CheckFlagInArray(a0->saveVarsFlags, FLAG_UNK_9A0)) {
            Save_VarsFlags_SetFlagInArray(a0->saveVarsFlags, FLAG_UNK_9A0);
            return PHONE_SCRIPT_160;
        } else {
            return 0xFFFF;
        }
    } else if (Save_VarsFlags_CheckFlagInArray(a0->saveVarsFlags, FLAG_UNK_96A)) {
        if (!Save_VarsFlags_CheckFlagInArray(a0->saveVarsFlags, FLAG_UNK_99F)) {
            Save_VarsFlags_SetFlagInArray(a0->saveVarsFlags, FLAG_UNK_99F);
            return PHONE_SCRIPT_159;
        } else {
            return 0xFFFF;
        }
    } else if (PlayerProfile_TestBadgeFlag(a0->playerProfile, BADGE_FOG)) {
        return PHONE_SCRIPT_158;
    } else if (hasPlainBadge) {
        return PHONE_SCRIPT_157;
    } else {
        return 0xFFFF;
    }
}
