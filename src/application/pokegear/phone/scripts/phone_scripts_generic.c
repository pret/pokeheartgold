#include "global.h"

#include "constants/maps.h"

#include "application/pokegear/phone/phone_internal.h"

#include "map_events.h"
#include "math_util.h"
#include "sys_flags.h"
#include "sys_vars.h"

static u16 PhoneScriptGeneric_GetScriptIdInternal(PokegearPhoneCallContext *ctx, const PhoneScriptGenericHeader *hdr, int count);
static BOOL rollPercentChance(int chance);
static BOOL PhoneScript_Generic_RandomChance(PokegearPhoneCallContext *ctx, const PhoneScriptGenericHeader *hdr);
static BOOL PhoneScript_Generic_NoRematchUntilClearedRadioTower(PokegearPhoneCallContext *ctx, const PhoneScriptGenericHeader *hdr);
static BOOL PhoneScript_Generic_RematchAfterRadioTowerSpecificDayAndTime(PokegearPhoneCallContext *ctx, const PhoneScriptGenericHeader *hdr);
static BOOL PhoneScript_Generic_RematchAfterRadioTowerExceptDuringBugContest(PokegearPhoneCallContext *ctx, const PhoneScriptGenericHeader *hdr);
static BOOL PhoneScript_Generic_GiftItemExceptDuringBugContest(PokegearPhoneCallContext *ctx, const PhoneScriptGenericHeader *hdr);
static BOOL PhoneScript_Generic_OnlyTuesThursSat(PokegearPhoneCallContext *ctx, const PhoneScriptGenericHeader *hdr);
static BOOL PhoneScript_Generic_DuringRocketTakeover(PokegearPhoneCallContext *ctx, const PhoneScriptGenericHeader *hdr);
static u16 getRandomEncounterSlot(u16 mapId, u8 trainerClass, u8 timeOfDay);
static u16 getRandomTrainerMon(u16 trainerID, enum HeapID heapID);

u16 PhoneCall_GetScriptId_Generic(PokegearPhoneCallContext *ctx, PokegearPhoneCallState *state) {
    const PhoneScriptGenericHeader *genericScripts;

    state->scriptType = 0;
    genericScripts = &sGenericPhoneCallHeaders[state->callerID * 16];
    if (state->isIncomingCall) {
        return PhoneScriptGeneric_GetScriptIdInternal(ctx, &genericScripts[8], 8);
    } else if (state->phoneBookEntry->mapId == ctx->playerMapSec) {
        return state->phoneBookEntry->phoneScriptIfLocal;
    } else {
        return PhoneScriptGeneric_GetScriptIdInternal(ctx, &genericScripts[0], 8);
    }
}

static u16 PhoneScriptGeneric_GetScriptIdInternal(PokegearPhoneCallContext *ctx, const PhoneScriptGenericHeader *hdrs, int count) {
    // at runtime, param:count is always 8
    int i;
    BOOL result;
    PokegearPhoneCallState *state = &ctx->state;
    const PhoneScriptGenericHeader *curHdr = hdrs;

    for (i = 0; i < count; ++i) {
        if (curHdr->type == PHONECALLGENERIC_NONE || curHdr->type == PHONECALLGENERIC_NIL) {
            break;
        }
        switch (curHdr->type) {
        case PHONECALLGENERIC_FIGHTPOSTROCKETS:
            result = PhoneScript_Generic_NoRematchUntilClearedRadioTower(ctx, curHdr);
            break;
        case PHONECALLGENERIC_FIGHTPOSTROCKETSNOTBUGCONTEST:
            result = PhoneScript_Generic_RematchAfterRadioTowerExceptDuringBugContest(ctx, curHdr);
            break;
        case PHONECALLGENERIC_GIFTNOTBUGCONTEST:
            result = PhoneScript_Generic_GiftItemExceptDuringBugContest(ctx, curHdr);
            break;
        case PHONECALLGENERIC_POSTROCKETWEEKTIME:
            result = PhoneScript_Generic_RematchAfterRadioTowerSpecificDayAndTime(ctx, curHdr);
            break;
        case PHONECALLGENERIC_BUGCONTESTDAYS:
            result = PhoneScript_Generic_OnlyTuesThursSat(ctx, curHdr);
            break;
        case PHONECALLGENERIC_DURINGROCKETS:
            result = PhoneScript_Generic_DuringRocketTakeover(ctx, curHdr);
            break;
        default:
            result = PhoneScript_Generic_RandomChance(ctx, curHdr);
            break;
        }
        if (result) {
            state->scriptType = curHdr->scriptType;
            return curHdr->scriptID;
        }
        hdrs = curHdr++;
    }
    if (hdrs->type == PHONECALLGENERIC_NONE || hdrs->type == PHONECALLGENERIC_NIL) {
        state->scriptType = 0;
        return PHONE_SCRIPT_NONE;
    }

    state->scriptType = hdrs->scriptType;
    return hdrs->scriptID;
}

static BOOL rollPercentChance(int chance) {
    int rnd = MTRandom() ^ MTRandom();
    u16 rnd_xor_rem = (u16)rnd;
    rnd_xor_rem ^= (rnd >> 8);
    rnd_xor_rem %= 100;
    return rnd_xor_rem <= chance;
}

static BOOL PhoneScript_Generic_RandomChance(PokegearPhoneCallContext *ctx, const PhoneScriptGenericHeader *hdr) {
    return rollPercentChance(hdr->chance);
}

static BOOL PhoneScript_Generic_NoRematchUntilClearedRadioTower(PokegearPhoneCallContext *ctx, const PhoneScriptGenericHeader *hdr) {
    PokegearPhoneCallState *state = &ctx->state;

    if (PhoneCallPersistentState_PhoneRematches_IsSeeking(ctx->callPersistentState, state->callerID)) {
        return FALSE;
    }
    if (PhoneCallPersistentState_PhoneRematches_GiftItemIdGet(ctx->callPersistentState, state->callerID)) {
        return FALSE;
    }
    if (!Save_VarsFlags_CheckFlagInArray(ctx->saveVarsFlags, FLAG_BEAT_RADIO_TOWER_ROCKETS) && hdr->scriptType == 0 && PhoneCall_GetScriptDefPtrByID(hdr->scriptID)->scriptType == PHONESCRIPTTYPE_REMATCH) {
        return FALSE;
    }
    return rollPercentChance(hdr->chance);
}

static BOOL PhoneScript_Generic_RematchAfterRadioTowerSpecificDayAndTime(PokegearPhoneCallContext *ctx, const PhoneScriptGenericHeader *hdr) {
    PokegearPhoneCallState *state = &ctx->state;

    if (!Save_VarsFlags_CheckFlagInArray(ctx->saveVarsFlags, FLAG_BEAT_RADIO_TOWER_ROCKETS)) {
        return FALSE;
    }
    if (state->date.week != state->phoneBookEntry->rematchWeekday || state->timeOfDay != state->phoneBookEntry->rematchTimeOfDay) {
        return FALSE;
    }
    return rollPercentChance(hdr->chance);
}

static BOOL PhoneScript_Generic_RematchAfterRadioTowerExceptDuringBugContest(PokegearPhoneCallContext *ctx, const PhoneScriptGenericHeader *hdr) {
    PokegearPhoneCallState *state = &ctx->state;

    if (!Save_VarsFlags_CheckFlagInArray(ctx->saveVarsFlags, FLAG_BEAT_RADIO_TOWER_ROCKETS)) {
        return FALSE;
    }
    if (state->phoneBookEntry->mapId == MAP_NATIONAL_PARK && Save_VarsFlags_CheckBugContestFlag(ctx->saveVarsFlags)) {
        return FALSE;
    }
    if (!PhoneCallPersistentState_PhoneRematches_IsSeeking(ctx->callPersistentState, state->callerID)) {
        return FALSE;
    }
    return rollPercentChance(hdr->chance);
}

static BOOL PhoneScript_Generic_GiftItemExceptDuringBugContest(PokegearPhoneCallContext *ctx, const PhoneScriptGenericHeader *hdr) {
    PokegearPhoneCallState *state = &ctx->state;

    if (state->phoneBookEntry->mapId == MAP_NATIONAL_PARK && Save_VarsFlags_CheckBugContestFlag(ctx->saveVarsFlags)) {
        return FALSE;
    }
    if (!PhoneCallPersistentState_PhoneRematches_GiftItemIdGet(ctx->callPersistentState, state->callerID)) {
        return FALSE;
    }
    return rollPercentChance(hdr->chance);
}

static BOOL PhoneScript_Generic_OnlyTuesThursSat(PokegearPhoneCallContext *ctx, const PhoneScriptGenericHeader *hdr) {
    if (ctx->state.date.week == RTC_WEEK_TUESDAY || ctx->state.date.week == RTC_WEEK_THURSDAY || ctx->state.date.week == RTC_WEEK_SATURDAY) {
        return rollPercentChance(hdr->chance);
    }
    return FALSE;
}

static BOOL PhoneScript_Generic_DuringRocketTakeover(PokegearPhoneCallContext *ctx, const PhoneScriptGenericHeader *hdr) {
    if (Save_VarsFlags_IsInRocketTakeover(ctx->saveVarsFlags)) {
        return rollPercentChance(hdr->chance);
    }
    return FALSE;
}

static u16 getRandomEncounterSlot(u16 mapId, u8 trainerClass, u8 timeOfDay) {
    ENC_DATA encounters;
    u16 *slots;

    if (!MapHeader_HasWildEncounters(mapId)) {
        return SPECIES_RATTATA;
    }
    WildEncounters_ReadFromNarc(&encounters, mapId);
    if (trainerClass == TRAINERCLASS_FISHERMAN) {
        if (timeOfDay == TIMEOFDAY_WILD_NITE) {
            encounters.goodRodSlots[3].species = encounters.swarmSpecies[2];
        }
        return encounters.goodRodSlots[LCRandom() % 5].species;
    } else {
        switch (timeOfDay) {
        case TIMEOFDAY_WILD_DAY:
            slots = encounters.landSlots.species_day;
            break;
        case TIMEOFDAY_WILD_NITE:
            slots = encounters.landSlots.species_nite;
            break;
        case TIMEOFDAY_WILD_MORN:
        default:
            slots = encounters.landSlots.species_morn;
            break;
        }
        return slots[LCRandom() % 12];
    }
}

static u16 getRandomTrainerMon(u16 trainerID, enum HeapID a1) {
    int i;
    Trainer trdata;
    TRPOKE *trpoke;
    u16 teamSpecies[PARTY_SIZE];

    TrainerData_ReadTrData(trainerID, &trdata);
    trpoke = Heap_Alloc(a1, sizeof(TRPOKE) * PARTY_SIZE);
    MI_CpuClear8(trpoke, sizeof(TRPOKE) * PARTY_SIZE);
    TrainerData_ReadTrPoke(trainerID, trpoke);
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
        Heap_Free(trpoke);
        return SPECIES_RATTATA;
    }
    Heap_Free(trpoke);
    return teamSpecies[LCRandom() % trdata.data.npoke];
}

BOOL GearPhoneCall_Generic(PokegearPhoneCallContext *ctx) {
    PokegearPhoneCallState *state = &ctx->state;
    const PhoneCallScriptDef *scriptDef;

    switch (state->scriptState) {
    case 0:
        PhoneCall_InitMsgDataAndBufferNames(ctx);
        PhoneCall_ApplyGenericNPCcallSideEffect(ctx, PhoneCall_GetScriptDefPtrByID(state->scriptID));
        BufferSpeciesName(ctx->msgFormat, 10, getRandomTrainerMon(state->phoneBookEntry->trainerId, ctx->heapID));
        BufferSpeciesName(ctx->msgFormat, 11, getRandomEncounterSlot(state->phoneBookEntry->mapId, state->phoneBookEntry->trainerClass, state->timeOfDay));
        if (state->phoneBookEntry->unkC == 255) {
            ++state->scriptState;
        }
        break;
    case 1:
        if (!PhoneCall_PrintGreeting(ctx)) {
            return FALSE;
        }
        break;
    case 2:
        scriptDef = PhoneCall_GetScriptDefPtrByID(state->scriptID);
        PhoneCallMessagePrint_Gendered(ctx, ctx->msgData_PhoneContact, scriptDef->msgIds[0], scriptDef->msgIds[1]);
        break;
    default:
        if (!PhoneCall_IsMessageDonePrinting(ctx)) {
            return FALSE;
        }
        DestroyMsgData(ctx->msgData_PhoneContact);
        return TRUE;
    }

    ++state->scriptState;
    return FALSE;
}

BOOL GearPhoneCall_Generic2(PokegearPhoneCallContext *ctx) {
    PokegearPhoneCallState *state = &ctx->state;
    u8 rnd;
    const PhoneCallScriptDef *scriptDef;

    switch (state->scriptState) {
    case 0:
        PhoneCall_InitMsgDataAndBufferNames(ctx);
        PhoneCall_ApplyGenericNPCcallSideEffect(ctx, PhoneCall_GetScriptDefPtrByID(state->scriptID));
        if (state->phoneBookEntry->unkC == 255) {
            ++state->scriptState;
        }
        break;
    case 1:
        if (!PhoneCall_PrintGreeting(ctx)) {
            return FALSE;
        }
        break;
    case 2:
        rnd = LCRandom() % 11;
        scriptDef = PhoneCall_GetScriptDefPtrByID(state->scriptID);
        if (scriptDef->msgIds[0] == scriptDef->msgIds[1]) {
            PhoneCallMessagePrint_Ungendered(ctx, ctx->msgData_PhoneContact, scriptDef->msgIds[0] + rnd);
        } else {
            rnd *= 2;
            PhoneCallMessagePrint_Gendered(ctx, ctx->msgData_PhoneContact, scriptDef->msgIds[0] + rnd, scriptDef->msgIds[1] + rnd + 1);
        }
        break;
    default:
        if (!PhoneCall_IsMessageDonePrinting(ctx)) {
            return FALSE;
        }
        DestroyMsgData(ctx->msgData_PhoneContact);
        return TRUE;
    }

    ++state->scriptState;
    return FALSE;
}
