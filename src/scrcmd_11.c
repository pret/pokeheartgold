#include "global.h"
#include "mystery_gift.h"
#include "scrcmd.h"
#include "math_util.h"
#include "save_vars_flags.h"
#include "script_pokemon_util.h"
#include "ribbon.h"
#include "pokedex.h"
#include "sys_vars.h"
#include "trainer_memo.h"
#include "constants/map_sections.h"
#include "msgdata/msg.naix"
#include "msgdata/msg/msg_0209.h"

struct GetMysteryGiftGmmState {
    FieldSystem* fieldSys;
    MessageFormat* msgFormat;
    MysteryGiftData* mgData;
};

struct ScriptMysteryGiftFuncs {
    BOOL (*check)(FieldSystem*, MysteryGiftData*);
    void (*give)(FieldSystem*, MysteryGiftData*);
    void (*messageSuccess)(struct GetMysteryGiftGmmState*, u16*, u16*);
    void (*messageFailure)(struct GetMysteryGiftGmmState*, u16*, u16*);
};

void FieldSystem_InitGetMysteryGiftGmmState(struct GetMysteryGiftGmmState* state, FieldSystem* fieldSys, MessageFormat* msgFormat, MysteryGiftData* mgData);
int FieldSystem_GetTagOfNextMG(FieldSystem* fieldSys);
MysteryGiftData* FieldSystem_GetDataOfNextMG(FieldSystem* fieldSys);
void FieldSystem_SetQueuedMGReceived(FieldSystem* fieldSys);
BOOL MGCheck_PartySpace(FieldSystem* fieldSys, MysteryGiftData* mgData);
void MGGive_Mon(FieldSystem* fieldSys, MysteryGiftData* mgData);
void MGMessageSuccess_GiveMon(struct GetMysteryGiftGmmState* fsysUnk80, u16* pMsgBank, u16* pMsgNum);
void MGMessageFailure_GiveMon(struct GetMysteryGiftGmmState* fsysUnk80, u16* pMsgBank, u16* pMsgNum);
void MGGive_Egg(FieldSystem* fieldSys, MysteryGiftData* mgData);
void MGMessageSuccess_Egg(struct GetMysteryGiftGmmState* fsysUnk80, u16* pMsgBank, u16* pMsgNum);
BOOL MGCheck_Item(FieldSystem* fieldSys, MysteryGiftData* mgData);
void MGGive_Item(FieldSystem* fieldSys, MysteryGiftData* mgData);
void MGMessageSuccess_Item(struct GetMysteryGiftGmmState* fsysUnk80, u16* pMsgBank, u16* pMsgNum);
void MGMessageFailure_Item(struct GetMysteryGiftGmmState* fsysUnk80, u16* pMsgBank, u16* pMsgNum);
BOOL MGCheck_BattleRules(FieldSystem* fieldSys, MysteryGiftData* mgData);
void MGGive_BattleRules(FieldSystem* fieldSys, MysteryGiftData* mgData);
void MGMessageSuccess_BattleRules(struct GetMysteryGiftGmmState* fsysUnk80, u16* pMsgBank, u16* pMsgNum);
void MGMessageFailure_BattleRules(struct GetMysteryGiftGmmState* fsysUnk80, u16* pMsgBank, u16* pMsgNum);
BOOL MGCheck_Decoration(FieldSystem* fieldSys, MysteryGiftData* mgData);
void MGGive_Decoration(FieldSystem* fieldSys, MysteryGiftData* mgData);
void MGMessageSuccess_Decoration(struct GetMysteryGiftGmmState* fsysUnk80, u16* pMsgBank, u16* pMsgNum);
void MGMessageFailure_Decoration(struct GetMysteryGiftGmmState* fsysUnk80, u16* pMsgBank, u16* pMsgNum);
BOOL MGCheck_MonDeco(FieldSystem* fieldSys, MysteryGiftData* mgData);
void MGGive_MonDeco(FieldSystem* fieldSys, MysteryGiftData* mgData);
void MGMessageSuccess_MonDeco(struct GetMysteryGiftGmmState* fsysUnk80, u16* pMsgBank, u16* pMsgNum);
void MGMessageFailure_MonDeco(struct GetMysteryGiftGmmState* fsysUnk80, u16* pMsgBank, u16* pMsgNum);
void MGGive_ManaphyEgg(FieldSystem* fieldSys, MysteryGiftData* mgData);
void MGMessageSuccess_ManaphyEgg(struct GetMysteryGiftGmmState* fsysUnk80, u16* pMsgBank, u16* pMsgNum);
BOOL MGCheck_MemberCard(FieldSystem* fieldSys, MysteryGiftData* mgData);
void MGGive_MemberCard(FieldSystem* fieldSys, MysteryGiftData* mgData);
void MGMessageSuccess_MemberCard(struct GetMysteryGiftGmmState* fsysUnk80, u16* pMsgBank, u16* pMsgNum);
void MGMessageFailure_MemberCard(struct GetMysteryGiftGmmState* fsysUnk80, u16* pMsgBank, u16* pMsgNum);
BOOL MGCheck_OaksLetter(FieldSystem* fieldSys, MysteryGiftData* mgData);
void MGGive_OaksLetter(FieldSystem* fieldSys, MysteryGiftData* mgData);
void MGMessageSuccess_OaksLetter(struct GetMysteryGiftGmmState* fsysUnk80, u16* pMsgBank, u16* pMsgNum);
void MGMessageFailure_OaksLetter(struct GetMysteryGiftGmmState* fsysUnk80, u16* pMsgBank, u16* pMsgNum);
BOOL MGCheck_AzureFlute(FieldSystem* fieldSys, MysteryGiftData* mgData);
void MGGive_AzureFlute(FieldSystem* fieldSys, MysteryGiftData* mgData);
void MGMessageSuccess_AzureFlute(struct GetMysteryGiftGmmState* fsysUnk80, u16* pMsgBank, u16* pMsgNum);
void MGMessageFailure_AzureFlute(struct GetMysteryGiftGmmState* fsysUnk80, u16* pMsgBank, u16* pMsgNum);
BOOL MGCheck_PoketchApp(FieldSystem* fieldSys, MysteryGiftData* mgData);
void MGGive_PoketchApp(FieldSystem* fieldSys, MysteryGiftData* mgData);
void MGMessageSuccess_PoketchApp(struct GetMysteryGiftGmmState* fsysUnk80, u16* pMsgBank, u16* pMsgNum);
void MGMessageFailure_PoketchApp(struct GetMysteryGiftGmmState* fsysUnk80, u16* pMsgBank, u16* pMsgNum);
BOOL MGCheck_SecretKey(FieldSystem* fieldSys, MysteryGiftData* mgData);
void MGGive_SecretKey(FieldSystem* fieldSys, MysteryGiftData* mgData);
void MGMessageSuccess_SecretKey(struct GetMysteryGiftGmmState* fsysUnk80, u16* pMsgBank, u16* pMsgNum);
void MGMessageFailure_SecretKey(struct GetMysteryGiftGmmState* fsysUnk80, u16* pMsgBank, u16* pMsgNum);
BOOL MGCheck_PokewalkerCourse(FieldSystem* fieldSys, MysteryGiftData* mgData);
void MGGive_PokewalkerCourse(FieldSystem* fieldSys, MysteryGiftData* mgData);
void MGMesageSuccess_PokewalkerCourse(struct GetMysteryGiftGmmState* fsysUnk80, u16* pMsgBank, u16* pMsgNum);
void MGMesageFailure_PokewalkerCourse(struct GetMysteryGiftGmmState* fsysUnk80, u16* pMsgBank, u16* pMsgNum);
BOOL MGCheck_MemorialPhoto(FieldSystem* fieldSys, MysteryGiftData* mgData);
void MGGive_MemorialPhoto(FieldSystem* fieldSys, MysteryGiftData* mgData);
void MGMessageSuccess_MemorialPhoto(struct GetMysteryGiftGmmState* fsysUnk80, u16* pMsgBank, u16* pMsgNum);
void MGMessageFailure_MemorialPhoto(struct GetMysteryGiftGmmState* fsysUnk80, u16* pMsgBank, u16* pMsgNum);

static const struct ScriptMysteryGiftFuncs sScriptMysteryGiftActionTable[MG_TAG_MAX - 1] = {
    { MGCheck_PartySpace, MGGive_Mon, MGMessageSuccess_GiveMon, MGMessageFailure_GiveMon },
    { MGCheck_PartySpace, MGGive_Egg, MGMessageSuccess_Egg, MGMessageFailure_GiveMon },
    { MGCheck_Item, MGGive_Item, MGMessageSuccess_Item, MGMessageFailure_Item },
    { MGCheck_BattleRules, MGGive_BattleRules, MGMessageSuccess_BattleRules, MGMessageFailure_BattleRules },
    { MGCheck_Decoration, MGGive_Decoration, MGMessageSuccess_Decoration, MGMessageFailure_Decoration },
    { MGCheck_MonDeco, MGGive_MonDeco, MGMessageSuccess_MonDeco, MGMessageFailure_MonDeco },
    { MGCheck_PartySpace, MGGive_ManaphyEgg, MGMessageSuccess_ManaphyEgg, MGMessageFailure_GiveMon },
    { MGCheck_MemberCard, MGGive_MemberCard, MGMessageSuccess_MemberCard, MGMessageFailure_MemberCard },
    { MGCheck_OaksLetter, MGGive_OaksLetter, MGMessageSuccess_OaksLetter, MGMessageFailure_OaksLetter },
    { MGCheck_AzureFlute, MGGive_AzureFlute, MGMessageSuccess_AzureFlute, MGMessageFailure_AzureFlute },
    { MGCheck_PoketchApp, MGGive_PoketchApp, MGMessageSuccess_PoketchApp, MGMessageFailure_PoketchApp },
    { MGCheck_SecretKey, MGGive_SecretKey, MGMessageSuccess_SecretKey, MGMessageFailure_SecretKey },
    { MGCheck_PartySpace, MGGive_Mon, MGMessageSuccess_GiveMon, MGMessageFailure_GiveMon },
    { MGCheck_PokewalkerCourse, MGGive_PokewalkerCourse, MGMesageSuccess_PokewalkerCourse, MGMesageFailure_PokewalkerCourse },
    { MGCheck_MemorialPhoto, MGGive_MemorialPhoto, MGMessageSuccess_MemorialPhoto, MGMessageFailure_MemorialPhoto },
};

void FieldSystem_InitGetMysteryGiftGmmState(struct GetMysteryGiftGmmState* state, FieldSystem* fieldSys, MessageFormat* msgFormat, MysteryGiftData* mgData) {
    state->fieldSys = fieldSys;
    state->msgFormat = msgFormat;
    state->mgData = mgData;
}

int FieldSystem_GetTagOfNextMG(FieldSystem* fieldSys) {
    return GetMysteryGiftTagByIdx(GetFirstQueuedMysteryGiftIdx());
}

MysteryGiftData* FieldSystem_GetDataOfNextMG(FieldSystem* fieldSys) {
    return GetMysteryGiftDataByIdx(GetFirstQueuedMysteryGiftIdx());
}

void FieldSystem_SetQueuedMGReceived(FieldSystem* fieldSys) {
    SetMysteryGiftReceivedByIdx(GetFirstQueuedMysteryGiftIdx());
}

BOOL ScrCmd_MysteryGift(ScriptContext* ctx) {
    switch (ScriptReadHalfword(ctx)) {
    case 0:
        GetStaticPointerToSaveMysteryGift(ctx->fieldSystem->saveData, HEAP_ID_32);
        break;
    case 7:
        DeleteStaticPointerToMysteryGift(ctx->fieldSystem->saveData, FALSE);
        break;
    case 8:
        DeleteStaticPointerToMysteryGift(ctx->fieldSystem->saveData, TRUE);
        break;
    case 1:
    {
        u16* ptr = ScriptGetVarPointer(ctx);
        if (FieldSystem_GetTagOfNextMG(ctx->fieldSystem) != MG_TAG_INVALID) {
            *ptr = TRUE;
        } else {
            *ptr = FALSE;
        }
        break;
    }
    case 2:
    {
        u16* ptr = ScriptGetVarPointer(ctx);
        *ptr = FieldSystem_GetTagOfNextMG(ctx->fieldSystem);
        break;
    }
    case 3:
    {
        u16* ptr = ScriptGetVarPointer(ctx);
        const struct ScriptMysteryGiftFuncs* pFunc = &sScriptMysteryGiftActionTable[FieldSystem_GetTagOfNextMG(ctx->fieldSystem) - 1];
        *ptr = pFunc->check(ctx->fieldSystem, FieldSystem_GetDataOfNextMG(ctx->fieldSystem));
        break;
    }
    case 4:
        const struct ScriptMysteryGiftFuncs* pFunc = &sScriptMysteryGiftActionTable[FieldSystem_GetTagOfNextMG(ctx->fieldSystem) - 1];
        pFunc->give(ctx->fieldSystem, FieldSystem_GetDataOfNextMG(ctx->fieldSystem));
        FieldSystem_SetQueuedMGReceived(ctx->fieldSystem);
        break;
    case 5:
    {
        struct GetMysteryGiftGmmState gmmState;
        const struct ScriptMysteryGiftFuncs* pFunc = &sScriptMysteryGiftActionTable[FieldSystem_GetTagOfNextMG(ctx->fieldSystem) - 1];
        MessageFormat** pMsgFormat = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MESSAGE_FORMAT);
        u16* pMsgBank = ScriptGetVarPointer(ctx);
        u16* pMsgNum = ScriptGetVarPointer(ctx);
        FieldSystem_InitGetMysteryGiftGmmState(&gmmState, ctx->fieldSystem, *pMsgFormat, FieldSystem_GetDataOfNextMG(ctx->fieldSystem));
        pFunc->messageSuccess(&gmmState, pMsgBank, pMsgNum);
        break;
    }
    case 6:
    {
        struct GetMysteryGiftGmmState gmmState;
        const struct ScriptMysteryGiftFuncs* pFunc = &sScriptMysteryGiftActionTable[FieldSystem_GetTagOfNextMG(ctx->fieldSystem) - 1];
        MessageFormat** pMsgFormat = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MESSAGE_FORMAT);
        u16* pMsgBank = ScriptGetVarPointer(ctx);
        u16* pMsgNum = ScriptGetVarPointer(ctx);
        FieldSystem_InitGetMysteryGiftGmmState(&gmmState, ctx->fieldSystem, *pMsgFormat, FieldSystem_GetDataOfNextMG(ctx->fieldSystem));
        pFunc->messageFailure(&gmmState, pMsgBank, pMsgNum);
        break;
    }
    }
    return FALSE;
}

BOOL MGCheck_PartySpace(FieldSystem* fieldSys, MysteryGiftData* unused) {
    (void)unused;
    return Party_GetCount(SaveArray_Party_Get(fieldSys->saveData)) < PARTY_SIZE;
}

void MGGive_ManaphyEgg(FieldSystem* fieldSys, MysteryGiftData* unused) {
    (void)unused;
    GiveEgg(HEAP_ID_32, fieldSys->saveData, SPECIES_MANAPHY, MAPSEC_TWINLEAF_TOWN, MAPSECTYPE_EXTERNAL, MAPLOC(METLOC_POKEMON_RANGER));
}

void MGMessageSuccess_ManaphyEgg(struct GetMysteryGiftGmmState* gmmState, u16* pMsgBank, u16* pMsgNum) {
    *pMsgBank = NARC_msg_msg_0209_bin;
    *pMsgNum = msg_0209_00013;
    BufferPlayersName(gmmState->msgFormat, 0, Save_PlayerData_GetProfileAddr(gmmState->fieldSys->saveData));
}

void MGGive_Mon(FieldSystem* fieldSys, MysteryGiftData* unused) {
    (void)unused;

    MG_POKEMON_TAG* mgData = &FieldSystem_GetDataOfNextMG(fieldSys)->pokemon;
    PlayerProfile* profile = Save_PlayerData_GetProfileAddr(fieldSys->saveData);
    SaveVarsFlags* vars_flags = Save_VarsFlags_Get(fieldSys->saveData);
    Pokemon* tmpPokemon = NULL;
    Pokemon* pokemon = &mgData->mon;
    u8* srcRibbons = mgData->ribbons;
    int eggMetLocation = GetMonData(pokemon, MON_DATA_EGG_MET_LOCATION, NULL);
    int personality = GetMonData(pokemon, MON_DATA_PERSONALITY, NULL);
    int otid = GetMonData(pokemon, MON_DATA_OTID, NULL);
    int rand = PRandom(OS_GetTick());

    if (personality != 0) {
        if (personality == 1) {
            while (CalcShininessByOtIdAndPersonality(otid, rand)) {
                rand = PRandom(rand);
            }
        } else {
            rand = personality;
        }
    }
    SetMonPersonality(pokemon, rand);

    int gender = GetMonGender(pokemon);
    SetMonData(pokemon, MON_DATA_GENDER, &gender);

    gender = GetMonData(pokemon, MON_DATA_HP_IV, NULL)
        + GetMonData(pokemon, MON_DATA_ATK_IV, NULL)
        + GetMonData(pokemon, MON_DATA_DEF_IV, NULL)
        + GetMonData(pokemon, MON_DATA_SPEED_IV, NULL)
        + GetMonData(pokemon, MON_DATA_SPATK_IV, NULL)
        + GetMonData(pokemon, MON_DATA_SPDEF_IV, NULL);
    if (gender == 0) {
        u16 ivRand = LCRandom();
        rand = ivRand & 0x1Fu;
        SetMonData(pokemon, MON_DATA_HP_IV, &rand);
        rand = (ivRand & 0x3E0u) >> 5;
        SetMonData(pokemon, MON_DATA_ATK_IV, &rand);
        rand = (ivRand & 0x7C00u) >> 10;
        SetMonData(pokemon, MON_DATA_DEF_IV, &rand);
        ivRand = LCRandom();
        rand = ivRand & 0x1Fu;
        SetMonData(pokemon, MON_DATA_SPEED_IV, &rand);
        rand = (ivRand & 0x3E0u) >> 5;
        SetMonData(pokemon, MON_DATA_SPATK_IV, &rand);
        rand = (ivRand & 0x7C00u) >> 10;
        SetMonData(pokemon, MON_DATA_SPDEF_IV, &rand);
    }

    SaveSpecialRibbons* ribbons = Save_SpecialRibbons_Get(fieldSys->saveData);
    if (GetMonData(pokemon, MON_DATA_RED_RIBBON, NULL)) {
        ribbons->ribbons[GetSpecialRibbonNo(RIBBON_RED)] = srcRibbons[0];
    }
    if (GetMonData(pokemon, MON_DATA_GREEN_RIBBON, NULL)) {
        ribbons->ribbons[GetSpecialRibbonNo(RIBBON_GREEN)] = srcRibbons[1];
    }
    if (GetMonData(pokemon, MON_DATA_BLUE_RIBBON, NULL)) {
        ribbons->ribbons[GetSpecialRibbonNo(RIBBON_BLUE)] = srcRibbons[2];
    }
    if (GetMonData(pokemon, MON_DATA_FESTIVAL_RIBBON, NULL)) {
        ribbons->ribbons[GetSpecialRibbonNo(RIBBON_FESTIVAL)] = srcRibbons[3];
    }
    if (GetMonData(pokemon, MON_DATA_CARNIVAL_RIBBON, NULL)) {
        ribbons->ribbons[GetSpecialRibbonNo(RIBBON_CARNIVAL)] = srcRibbons[4];
    }
    if (GetMonData(pokemon, MON_DATA_CLASSIC_RIBBON, NULL)) {
        ribbons->ribbons[GetSpecialRibbonNo(RIBBON_CLASSIC)] = srcRibbons[5];
    }
    if (GetMonData(pokemon, MON_DATA_PREMIER_RIBBON, NULL)) {
        ribbons->ribbons[GetSpecialRibbonNo(RIBBON_PREMIER)] = srcRibbons[6];
    }
    if (GetMonData(pokemon, MON_DATA_HOENN_MARINE_RIBBON, NULL)) {
        ribbons->ribbons[GetSpecialRibbonNo(RIBBON_HOENN_MARINE)] = srcRibbons[7];
    }
    if (GetMonData(pokemon, MON_DATA_HOENN_LAND_RIBBON, NULL)) {
        ribbons->ribbons[GetSpecialRibbonNo(RIBBON_HOENN_LAND)] = srcRibbons[8];
    }
    if (GetMonData(pokemon, MON_DATA_HOENN_SKY_RIBBON, NULL)) {
        ribbons->ribbons[GetSpecialRibbonNo(RIBBON_HOENN_SKY)] = srcRibbons[9];
    }

    if (mgData->fixedOT == OT_ID_PLAYER_ID) {
        String* playerName = PlayerProfile_GetPlayerName_NewString(profile, HEAP_ID_32);
        u32 trainerId = PlayerProfile_GetTrainerID(profile);
        BOOL gender = PlayerProfile_GetTrainerGender(profile);

        tmpPokemon = AllocMonZeroed(HEAP_ID_32);
        #ifdef UBFIX
        GF_ASSERT(pokemon != NULL);
        #endif
        CopyPokemonToPokemon(pokemon, tmpPokemon);
        SetMonData(tmpPokemon, MON_DATA_OT_NAME_2, playerName);
        SetMonData(tmpPokemon, MON_DATA_OTID, &trainerId);
        SetMonData(tmpPokemon, MON_DATA_MET_GENDER, &gender);
        pokemon = tmpPokemon;
        String_Delete(playerName);
    }

    MonSetTrainerMemo(pokemon, profile, 4, sub_02017FE4(MAPSECTYPE_EXTERNAL, eggMetLocation), HEAP_ID_32);
    if (GetMonData(pokemon, MON_DATA_SPECIES, NULL) == SPECIES_ARCEUS && GetMonData(pokemon, MON_DATA_FATEFUL_ENCOUNTER, NULL) == TRUE && !Save_VarsFlags_GetVar404C(vars_flags)) {
        Save_VarsFlags_SetVar404C(vars_flags, TRUE);
    }
    CalcMonLevelAndStats(pokemon);
    if (Party_AddMon(SaveArray_Party_Get(fieldSys->saveData), pokemon)) {
        UpdatePokedexWithReceivedSpecies(fieldSys->saveData, pokemon);
    }
    if (tmpPokemon != NULL) {
        FreeToHeap(tmpPokemon);
    }
}
