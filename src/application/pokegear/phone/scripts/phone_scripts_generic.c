#include "global.h"

#include "constants/maps.h"

#include "application/pokegear/phone/phone_internal.h"

#include "map_events.h"
#include "math_util.h"
#include "sys_flags.h"
#include "sys_vars.h"

BOOL ov101_021F2CAC(PokegearPhoneApp_Sub0C4 *a0, const UnkStruct_ov101_021F968C *a1);
BOOL ov101_021F2CB8(PokegearPhoneApp_Sub0C4 *a0, const UnkStruct_ov101_021F968C *a1);
BOOL ov101_021F2D10(PokegearPhoneApp_Sub0C4 *a0, const UnkStruct_ov101_021F968C *a1);
BOOL ov101_021F2D48(PokegearPhoneApp_Sub0C4 *a0, const UnkStruct_ov101_021F968C *a1);
BOOL ov101_021F2D90(PokegearPhoneApp_Sub0C4 *a0, const UnkStruct_ov101_021F968C *a1);
BOOL ov101_021F2DC8(PokegearPhoneApp_Sub0C4 *a0, const UnkStruct_ov101_021F968C *a1);
BOOL ov101_021F2DE8(PokegearPhoneApp_Sub0C4 *a0, const UnkStruct_ov101_021F968C *a1);

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
        if (r4->type == 255 || r4->type == 0) {
            break;
        }
        switch (r4->type) {
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
            sp0->scriptType = r4->scriptType;
            return r4->scriptID;
        }
        a1 = r4++;
    }
    if (a1->type == 255 || a1->type == 0) {
        sp0->scriptType = 0;
        return PHONE_SCRIPT_NONE;
    }

    sp0->scriptType = a1->scriptType;
    return a1->scriptID;
}

BOOL ov101_021F2C78(int chance) {
    int rnd = MTRandom() ^ MTRandom();
    u16 rnd_xor_rem = (u16)rnd;
    rnd_xor_rem ^= (rnd >> 8);
    rnd_xor_rem %= 100;
    return rnd_xor_rem <= chance;
}

BOOL ov101_021F2CAC(PokegearPhoneApp_Sub0C4 *a0, const UnkStruct_ov101_021F968C *a1) {
    return ov101_021F2C78(a1->chance);
}

BOOL ov101_021F2CB8(PokegearPhoneApp_Sub0C4 *a0, const UnkStruct_ov101_021F968C *a1) {
    PokegearPhoneApp_Sub0C4_Sub88 *r6 = &a0->unk_88;

    if (PhoneRematches_IsSeeking(a0->momsSavings, r6->callerID)) {
        return FALSE;
    }
    if (PhoneRematches_GiftItemIdGet(a0->momsSavings, r6->callerID)) {
        return FALSE;
    }
    if (!Save_VarsFlags_CheckFlagInArray(a0->saveVarsFlags, FLAG_BEAT_RADIO_TOWER_ROCKETS) && a1->scriptType == 0 && ov101_021F2374(a1->scriptID)->kind == 3) {
        return FALSE;
    }
    return ov101_021F2C78(a1->chance);
}

BOOL ov101_021F2D10(PokegearPhoneApp_Sub0C4 *a0, const UnkStruct_ov101_021F968C *a1) {
    PokegearPhoneApp_Sub0C4_Sub88 *r4 = &a0->unk_88;

    if (!Save_VarsFlags_CheckFlagInArray(a0->saveVarsFlags, FLAG_BEAT_RADIO_TOWER_ROCKETS)) {
        return FALSE;
    }
    if (r4->date.week != r4->phoneBookEntry->rematchWeekday || r4->timeOfDay != r4->phoneBookEntry->rematchTimeOfDay) {
        return FALSE;
    }
    return ov101_021F2C78(a1->chance);
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
    return ov101_021F2C78(a1->chance);
}

BOOL ov101_021F2D90(PokegearPhoneApp_Sub0C4 *a0, const UnkStruct_ov101_021F968C *a1) {
    PokegearPhoneApp_Sub0C4_Sub88 *r4 = &a0->unk_88;

    if (r4->phoneBookEntry->mapId == MAP_NATIONAL_PARK && Save_VarsFlags_CheckBugContestFlag(a0->saveVarsFlags)) {
        return FALSE;
    }
    if (!PhoneRematches_GiftItemIdGet(a0->momsSavings, r4->callerID)) {
        return FALSE;
    }
    return ov101_021F2C78(a1->chance);
}

BOOL ov101_021F2DC8(PokegearPhoneApp_Sub0C4 *a0, const UnkStruct_ov101_021F968C *a1) {
    if (a0->unk_88.date.week == RTC_WEEK_TUESDAY || a0->unk_88.date.week == RTC_WEEK_THURSDAY || a0->unk_88.date.week == RTC_WEEK_SATURDAY) {
        return ov101_021F2C78(a1->chance);
    }
    return FALSE;
}

BOOL ov101_021F2DE8(PokegearPhoneApp_Sub0C4 *a0, const UnkStruct_ov101_021F968C *a1) {
    if (Save_VarsFlags_IsInRocketTakeover(a0->saveVarsFlags)) {
        return ov101_021F2C78(a1->chance);
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
