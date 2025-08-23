#include "global.h"

#include "constants/map_sections.h"

#include "msgdata/msg.naix"
#include "msgdata/msg/msg_0209.h"

#include "bag.h"
#include "fashion_case.h"
#include "field_system.h"
#include "math_util.h"
#include "mystery_gift.h"
#include "pokedex.h"
#include "pokewalker.h"
#include "ribbon.h"
#include "save_link_ruleset.h"
#include "save_vars_flags.h"
#include "scrcmd.h"
#include "script_pokemon_util.h"
#include "sys_vars.h"
#include "trainer_memo.h"

struct GetMysteryGiftGmmState {
    FieldSystem *fieldSys;
    MessageFormat *msgFormat;
    MysteryGiftData *mgData;
};

// clang-format off
struct ScriptMysteryGiftFuncs {
    BOOL (*check)
    (FieldSystem *, MysteryGiftData *);
    void (*give)(FieldSystem *, MysteryGiftData *);
    void (*messageSuccess)(struct GetMysteryGiftGmmState *, u16 *, u16 *);
    void (*messageFailure)(struct GetMysteryGiftGmmState *, u16 *, u16 *);
};
// clang-format on

static void FieldSystem_InitGetMysteryGiftGmmState(struct GetMysteryGiftGmmState *state, FieldSystem *fieldSys, MessageFormat *msgFormat, MysteryGiftData *mgData);
static int FieldSystem_GetTagOfNextMG(FieldSystem *fieldSys);
static MysteryGiftData *FieldSystem_GetDataOfNextMG(FieldSystem *fieldSys);
static void FieldSystem_SetQueuedMGReceived(FieldSystem *fieldSys);
static BOOL MGCheck_PartySpace(FieldSystem *fieldSys, MysteryGiftData *mgData);
static void MGGive_Mon(FieldSystem *fieldSys, MysteryGiftData *mgData);
static void MGMessageSuccess_GiveMon(struct GetMysteryGiftGmmState *gmmState, u16 *pMsgBank, u16 *pMsgNum);
static void MGMessageFailure_GiveMon(struct GetMysteryGiftGmmState *gmmState, u16 *pMsgBank, u16 *pMsgNum);
static void MGGive_Egg(FieldSystem *fieldSys, MysteryGiftData *mgData);
static void MGMessageSuccess_Egg(struct GetMysteryGiftGmmState *gmmState, u16 *pMsgBank, u16 *pMsgNum);
static BOOL MGCheck_Item(FieldSystem *fieldSys, MysteryGiftData *mgData);
static void MGGive_Item(FieldSystem *fieldSys, MysteryGiftData *mgData);
static void MGMessageSuccess_Item(struct GetMysteryGiftGmmState *gmmState, u16 *pMsgBank, u16 *pMsgNum);
static void MGMessageFailure_Item(struct GetMysteryGiftGmmState *gmmState, u16 *pMsgBank, u16 *pMsgNum);
static BOOL MGCheck_BattleRules(FieldSystem *fieldSys, MysteryGiftData *mgData);
static void MGGive_BattleRules(FieldSystem *fieldSys, MysteryGiftData *mgData);
static void MGMessageSuccess_BattleRules(struct GetMysteryGiftGmmState *gmmState, u16 *pMsgBank, u16 *pMsgNum);
static void MGMessageFailure_BattleRules(struct GetMysteryGiftGmmState *gmmState, u16 *pMsgBank, u16 *pMsgNum);
static BOOL MGCheck_Decoration(FieldSystem *fieldSys, MysteryGiftData *mgData);
static void MGGive_Decoration(FieldSystem *fieldSys, MysteryGiftData *mgData);
static void MGMessageSuccess_Decoration(struct GetMysteryGiftGmmState *gmmState, u16 *pMsgBank, u16 *pMsgNum);
static void MGMessageFailure_Decoration(struct GetMysteryGiftGmmState *gmmState, u16 *pMsgBank, u16 *pMsgNum);
static BOOL MGCheck_MonDeco(FieldSystem *fieldSys, MysteryGiftData *mgData);
static void MGGive_MonDeco(FieldSystem *fieldSys, MysteryGiftData *mgData);
static void MGMessageSuccess_MonDeco(struct GetMysteryGiftGmmState *gmmState, u16 *pMsgBank, u16 *pMsgNum);
static void MGMessageFailure_MonDeco(struct GetMysteryGiftGmmState *gmmState, u16 *pMsgBank, u16 *pMsgNum);
static void MGGive_ManaphyEgg(FieldSystem *fieldSys, MysteryGiftData *mgData);
static void MGMessageSuccess_ManaphyEgg(struct GetMysteryGiftGmmState *gmmState, u16 *pMsgBank, u16 *pMsgNum);
static BOOL MGCheck_MemberCard(FieldSystem *fieldSys, MysteryGiftData *mgData);
static void MGGive_MemberCard(FieldSystem *fieldSys, MysteryGiftData *mgData);
static void MGMessageSuccess_MemberCard(struct GetMysteryGiftGmmState *gmmState, u16 *pMsgBank, u16 *pMsgNum);
static void MGMessageFailure_MemberCard(struct GetMysteryGiftGmmState *gmmState, u16 *pMsgBank, u16 *pMsgNum);
static BOOL MGCheck_OaksLetter(FieldSystem *fieldSys, MysteryGiftData *mgData);
static void MGGive_OaksLetter(FieldSystem *fieldSys, MysteryGiftData *mgData);
static void MGMessageSuccess_OaksLetter(struct GetMysteryGiftGmmState *gmmState, u16 *pMsgBank, u16 *pMsgNum);
static void MGMessageFailure_OaksLetter(struct GetMysteryGiftGmmState *gmmState, u16 *pMsgBank, u16 *pMsgNum);
static BOOL MGCheck_AzureFlute(FieldSystem *fieldSys, MysteryGiftData *mgData);
static void MGGive_AzureFlute(FieldSystem *fieldSys, MysteryGiftData *mgData);
static void MGMessageSuccess_AzureFlute(struct GetMysteryGiftGmmState *gmmState, u16 *pMsgBank, u16 *pMsgNum);
static void MGMessageFailure_AzureFlute(struct GetMysteryGiftGmmState *gmmState, u16 *pMsgBank, u16 *pMsgNum);
static BOOL MGCheck_PoketchApp(FieldSystem *fieldSys, MysteryGiftData *mgData);
static void MGGive_PoketchApp(FieldSystem *fieldSys, MysteryGiftData *mgData);
static void MGMessageSuccess_PoketchApp(struct GetMysteryGiftGmmState *gmmState, u16 *pMsgBank, u16 *pMsgNum);
static void MGMessageFailure_PoketchApp(struct GetMysteryGiftGmmState *gmmState, u16 *pMsgBank, u16 *pMsgNum);
static BOOL MGCheck_SecretKey(FieldSystem *fieldSys, MysteryGiftData *mgData);
static void MGGive_SecretKey(FieldSystem *fieldSys, MysteryGiftData *mgData);
static void MGMessageSuccess_SecretKey(struct GetMysteryGiftGmmState *gmmState, u16 *pMsgBank, u16 *pMsgNum);
static void MGMessageFailure_SecretKey(struct GetMysteryGiftGmmState *gmmState, u16 *pMsgBank, u16 *pMsgNum);
static BOOL MGCheck_PokewalkerCourse(FieldSystem *fieldSys, MysteryGiftData *mgData);
static void MGGive_PokewalkerCourse(FieldSystem *fieldSys, MysteryGiftData *mgData);
static void MGMessageSuccess_PokewalkerCourse(struct GetMysteryGiftGmmState *gmmState, u16 *pMsgBank, u16 *pMsgNum);
static void MGMessageFailure_PokewalkerCourse(struct GetMysteryGiftGmmState *gmmState, u16 *pMsgBank, u16 *pMsgNum);
static BOOL MGCheck_MemorialPhoto(FieldSystem *fieldSys, MysteryGiftData *mgData);
static void MGGive_MemorialPhoto(FieldSystem *fieldSys, MysteryGiftData *mgData);
static void MGMessageSuccess_MemorialPhoto(struct GetMysteryGiftGmmState *gmmState, u16 *pMsgBank, u16 *pMsgNum);
static void MGMessageFailure_MemorialPhoto(struct GetMysteryGiftGmmState *gmmState, u16 *pMsgBank, u16 *pMsgNum);

static const struct ScriptMysteryGiftFuncs sScriptMysteryGiftActionTable[MG_TAG_MAX - 1] = {
    { MGCheck_PartySpace,       MGGive_Mon,              MGMessageSuccess_GiveMon,          MGMessageFailure_GiveMon          },
    { MGCheck_PartySpace,       MGGive_Egg,              MGMessageSuccess_Egg,              MGMessageFailure_GiveMon          },
    { MGCheck_Item,             MGGive_Item,             MGMessageSuccess_Item,             MGMessageFailure_Item             },
    { MGCheck_BattleRules,      MGGive_BattleRules,      MGMessageSuccess_BattleRules,      MGMessageFailure_BattleRules      },
    { MGCheck_Decoration,       MGGive_Decoration,       MGMessageSuccess_Decoration,       MGMessageFailure_Decoration       },
    { MGCheck_MonDeco,          MGGive_MonDeco,          MGMessageSuccess_MonDeco,          MGMessageFailure_MonDeco          },
    { MGCheck_PartySpace,       MGGive_ManaphyEgg,       MGMessageSuccess_ManaphyEgg,       MGMessageFailure_GiveMon          },
    { MGCheck_MemberCard,       MGGive_MemberCard,       MGMessageSuccess_MemberCard,       MGMessageFailure_MemberCard       },
    { MGCheck_OaksLetter,       MGGive_OaksLetter,       MGMessageSuccess_OaksLetter,       MGMessageFailure_OaksLetter       },
    { MGCheck_AzureFlute,       MGGive_AzureFlute,       MGMessageSuccess_AzureFlute,       MGMessageFailure_AzureFlute       },
    { MGCheck_PoketchApp,       MGGive_PoketchApp,       MGMessageSuccess_PoketchApp,       MGMessageFailure_PoketchApp       },
    { MGCheck_SecretKey,        MGGive_SecretKey,        MGMessageSuccess_SecretKey,        MGMessageFailure_SecretKey        },
    { MGCheck_PartySpace,       MGGive_Mon,              MGMessageSuccess_GiveMon,          MGMessageFailure_GiveMon          },
    { MGCheck_PokewalkerCourse, MGGive_PokewalkerCourse, MGMessageSuccess_PokewalkerCourse, MGMessageFailure_PokewalkerCourse },
    { MGCheck_MemorialPhoto,    MGGive_MemorialPhoto,    MGMessageSuccess_MemorialPhoto,    MGMessageFailure_MemorialPhoto    },
};

static void FieldSystem_InitGetMysteryGiftGmmState(struct GetMysteryGiftGmmState *state, FieldSystem *fieldSys, MessageFormat *msgFormat, MysteryGiftData *mgData) {
    state->fieldSys = fieldSys;
    state->msgFormat = msgFormat;
    state->mgData = mgData;
}

static int FieldSystem_GetTagOfNextMG(FieldSystem *fieldSys) {
    return SaveMGDataPtr_GetTagByIndex(SaveMGDataPtr_GetFirstGiftIndex());
}

MysteryGiftData *FieldSystem_GetDataOfNextMG(FieldSystem *fieldSys) {
    return SaveMGDataPtr_GetDataByIndex(SaveMGDataPtr_GetFirstGiftIndex());
}

static void FieldSystem_SetQueuedMGReceived(FieldSystem *fieldSys) {
    SaveMGDataPtr_SetReceivedByIndex(SaveMGDataPtr_GetFirstGiftIndex());
}

BOOL ScrCmd_MysteryGift(ScriptContext *ctx) {
    switch (ScriptReadHalfword(ctx)) {
    case SCR_MG_BEGIN:
        SaveMGDataPtr_Begin(ctx->fieldSystem->saveData, HEAP_ID_FIELD3);
        break;
    case SCR_MG_END:
        SaveMGDataPtr_End(ctx->fieldSystem->saveData, FALSE);
        break;
    case SCR_MG_END2:
        SaveMGDataPtr_End(ctx->fieldSystem->saveData, TRUE);
        break;
    case SCR_MG_HAS_GIFT: {
        u16 *ptr = ScriptGetVarPointer(ctx);
        if (FieldSystem_GetTagOfNextMG(ctx->fieldSystem) != MG_TAG_INVALID) {
            *ptr = TRUE;
        } else {
            *ptr = FALSE;
        }
        break;
    }
    case SCR_MG_GET_TYPE: {
        u16 *ptr = ScriptGetVarPointer(ctx);
        *ptr = FieldSystem_GetTagOfNextMG(ctx->fieldSystem);
        break;
    }
    case SCR_MG_CAN_RECEIVE: {
        u16 *ptr = ScriptGetVarPointer(ctx);
        const struct ScriptMysteryGiftFuncs *pFunc = &sScriptMysteryGiftActionTable[FieldSystem_GetTagOfNextMG(ctx->fieldSystem) - 1];
        *ptr = pFunc->check(ctx->fieldSystem, FieldSystem_GetDataOfNextMG(ctx->fieldSystem));
        break;
    }
    case SCR_MG_RECEIVE: {
        const struct ScriptMysteryGiftFuncs *pFunc = &sScriptMysteryGiftActionTable[FieldSystem_GetTagOfNextMG(ctx->fieldSystem) - 1];
        pFunc->give(ctx->fieldSystem, FieldSystem_GetDataOfNextMG(ctx->fieldSystem));
        FieldSystem_SetQueuedMGReceived(ctx->fieldSystem);
        break;
    }
    case SCR_MG_MESSAGE_RECEIVED: {
        struct GetMysteryGiftGmmState gmmState;
        const struct ScriptMysteryGiftFuncs *pFunc = &sScriptMysteryGiftActionTable[FieldSystem_GetTagOfNextMG(ctx->fieldSystem) - 1];
        MessageFormat **pMsgFormat = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MESSAGE_FORMAT);
        u16 *pMsgBank = ScriptGetVarPointer(ctx);
        u16 *pMsgNum = ScriptGetVarPointer(ctx);
        FieldSystem_InitGetMysteryGiftGmmState(&gmmState, ctx->fieldSystem, *pMsgFormat, FieldSystem_GetDataOfNextMG(ctx->fieldSystem));
        pFunc->messageSuccess(&gmmState, pMsgBank, pMsgNum);
        break;
    }
    case SCR_MG_MESSAGE_FAILED: {
        struct GetMysteryGiftGmmState gmmState;
        const struct ScriptMysteryGiftFuncs *pFunc = &sScriptMysteryGiftActionTable[FieldSystem_GetTagOfNextMG(ctx->fieldSystem) - 1];
        MessageFormat **pMsgFormat = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MESSAGE_FORMAT);
        u16 *pMsgBank = ScriptGetVarPointer(ctx);
        u16 *pMsgNum = ScriptGetVarPointer(ctx);
        FieldSystem_InitGetMysteryGiftGmmState(&gmmState, ctx->fieldSystem, *pMsgFormat, FieldSystem_GetDataOfNextMG(ctx->fieldSystem));
        pFunc->messageFailure(&gmmState, pMsgBank, pMsgNum);
        break;
    }
    }
    return FALSE;
}

static BOOL MGCheck_PartySpace(FieldSystem *fieldSys, MysteryGiftData *unused) {
    return Party_GetCount(SaveArray_Party_Get(fieldSys->saveData)) < PARTY_SIZE;
}

static void MGGive_ManaphyEgg(FieldSystem *fieldSys, MysteryGiftData *unused) {
    GiveEgg(HEAP_ID_FIELD3, fieldSys->saveData, SPECIES_MANAPHY, MAPSEC_TWINLEAF_TOWN, MAPSECTYPE_EXTERNAL, MAPLOC(METLOC_POKEMON_RANGER));
}

static void MGMessageSuccess_ManaphyEgg(struct GetMysteryGiftGmmState *gmmState, u16 *pMsgBank, u16 *pMsgNum) {
    *pMsgBank = NARC_msg_msg_0209_bin;
    *pMsgNum = msg_0209_00013;
    BufferPlayersName(gmmState->msgFormat, 0, Save_PlayerData_GetProfile(gmmState->fieldSys->saveData));
}

static void MGGive_Mon(FieldSystem *fieldSys, MysteryGiftData *unused) {
    MysteryGiftPokemonTag *mgData = &FieldSystem_GetDataOfNextMG(fieldSys)->pokemon;
    PlayerProfile *profile = Save_PlayerData_GetProfile(fieldSys->saveData);
    SaveVarsFlags *vars_flags = Save_VarsFlags_Get(fieldSys->saveData);
    Pokemon *tmpPokemon = NULL;
    Pokemon *pokemon = &mgData->mon;
    u8 *srcRibbons = mgData->ribbons;
    int eggMetLocation = GetMonData(pokemon, MON_DATA_EGG_LOCATION, NULL);
    int personality = GetMonData(pokemon, MON_DATA_PERSONALITY, NULL);
    int otid = GetMonData(pokemon, MON_DATA_OT_ID, NULL);
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

    gender = GetMonData(pokemon, MON_DATA_HP_IV, NULL) + GetMonData(pokemon, MON_DATA_ATK_IV, NULL) + GetMonData(pokemon, MON_DATA_DEF_IV, NULL) + GetMonData(pokemon, MON_DATA_SPEED_IV, NULL) + GetMonData(pokemon, MON_DATA_SPATK_IV, NULL) + GetMonData(pokemon, MON_DATA_SPDEF_IV, NULL);
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

    SaveSpecialRibbons *ribbons = Save_SpecialRibbons_Get(fieldSys->saveData);
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
    if (GetMonData(pokemon, MON_DATA_MARINE_RIBBON, NULL)) {
        ribbons->ribbons[GetSpecialRibbonNo(RIBBON_HOENN_MARINE)] = srcRibbons[7];
    }
    if (GetMonData(pokemon, MON_DATA_LAND_RIBBON, NULL)) {
        ribbons->ribbons[GetSpecialRibbonNo(RIBBON_HOENN_LAND)] = srcRibbons[8];
    }
    if (GetMonData(pokemon, MON_DATA_SKY_RIBBON, NULL)) {
        ribbons->ribbons[GetSpecialRibbonNo(RIBBON_HOENN_SKY)] = srcRibbons[9];
    }

    if (mgData->fixedOT == OT_ID_PLAYER_ID) {
        String *playerName = PlayerProfile_GetPlayerName_NewString(profile, HEAP_ID_FIELD3);
        u32 trainerId = PlayerProfile_GetTrainerID(profile);
        BOOL gender = PlayerProfile_GetTrainerGender(profile);

        tmpPokemon = AllocMonZeroed(HEAP_ID_FIELD3);
#ifdef UBFIX
        GF_ASSERT(tmpPokemon != NULL);
#endif
        CopyPokemonToPokemon(pokemon, tmpPokemon);
        SetMonData(tmpPokemon, MON_DATA_OT_NAME_STRING, playerName);
        SetMonData(tmpPokemon, MON_DATA_OT_ID, &trainerId);
        SetMonData(tmpPokemon, MON_DATA_OT_GENDER, &gender);
        pokemon = tmpPokemon;
        String_Delete(playerName);
    }

    MonSetTrainerMemo(pokemon, profile, 4, sub_02017FE4(MAPSECTYPE_EXTERNAL, eggMetLocation), HEAP_ID_FIELD3);
    if (GetMonData(pokemon, MON_DATA_SPECIES, NULL) == SPECIES_ARCEUS && GetMonData(pokemon, MON_DATA_FATEFUL_ENCOUNTER, NULL) == TRUE && !Save_VarsFlags_GetVar404C(vars_flags)) {
        Save_VarsFlags_SetVar404C(vars_flags, TRUE);
    }
    CalcMonLevelAndStats(pokemon);
    if (Party_AddMon(SaveArray_Party_Get(fieldSys->saveData), pokemon)) {
        UpdatePokedexWithReceivedSpecies(fieldSys->saveData, pokemon);
    }
    if (tmpPokemon != NULL) {
        Heap_Free(tmpPokemon);
    }
}

static void MGMessageSuccess_GiveMon(struct GetMysteryGiftGmmState *gmmState, u16 *pMsgBank, u16 *pMsgNum) {
    MysteryGiftPokemonTag *mgData = &FieldSystem_GetDataOfNextMG(gmmState->fieldSys)->pokemon;
    *pMsgBank = NARC_msg_msg_0209_bin;
    *pMsgNum = msg_0209_00007;
    BufferPlayersName(gmmState->msgFormat, 0, Save_PlayerData_GetProfile(gmmState->fieldSys->saveData));
    BufferBoxMonSpeciesNameWithArticle(gmmState->msgFormat, 1, Mon_GetBoxMon(&mgData->mon));
}

static void MGMessageFailure_GiveMon(struct GetMysteryGiftGmmState *gmmState, u16 *pMsgBank, u16 *pMsgNum) {
    *pMsgBank = NARC_msg_msg_0209_bin;
    *pMsgNum = msg_0209_00004;
}

static void MGGive_Egg(FieldSystem *fieldSys, MysteryGiftData *mgData) {
    MGGive_Mon(fieldSys, mgData);
}

static void MGMessageSuccess_Egg(struct GetMysteryGiftGmmState *gmmState, u16 *pMsgBank, u16 *pMsgNum) {
    MysteryGiftPokemonTag *mgData = &FieldSystem_GetDataOfNextMG(gmmState->fieldSys)->pokemon;
    *pMsgBank = NARC_msg_msg_0209_bin;
    *pMsgNum = msg_0209_00008;
    BufferPlayersName(gmmState->msgFormat, 0, Save_PlayerData_GetProfile(gmmState->fieldSys->saveData));
    BufferBoxMonSpeciesName(gmmState->msgFormat, 1, Mon_GetBoxMon(&mgData->mon));
}

static BOOL MGCheck_Item(FieldSystem *fieldSys, MysteryGiftData *unused) {
    Bag *bag = Save_Bag_Get(fieldSys->saveData);
    u32 *pItem = &FieldSystem_GetDataOfNextMG(fieldSys)->item;
    return Bag_HasSpaceForItem(bag, *pItem, 1, HEAP_ID_FIELD3);
}

static void MGGive_Item(FieldSystem *fieldSys, MysteryGiftData *unused) {
    Bag *bag = Save_Bag_Get(fieldSys->saveData);
    u16 item = FieldSystem_GetDataOfNextMG(fieldSys)->item;
    if (item == ITEM_ENIGMA_STONE) {
        sub_02066B9C(Save_VarsFlags_Get(fieldSys->saveData), 0);
    }
    Bag_AddItem(bag, item, 1, HEAP_ID_FIELD3);
}

static void MGMessageSuccess_Item(struct GetMysteryGiftGmmState *gmmState, u16 *pMsgBank, u16 *pMsgNum) {
    u16 item = FieldSystem_GetDataOfNextMG(gmmState->fieldSys)->item;
    *pMsgBank = NARC_msg_msg_0209_bin;
    *pMsgNum = msg_0209_00009;
    BufferPlayersName(gmmState->msgFormat, 0, Save_PlayerData_GetProfile(gmmState->fieldSys->saveData));
    BufferItemName(gmmState->msgFormat, 1, item);
}

static void MGMessageFailure_Item(struct GetMysteryGiftGmmState *gmmState, u16 *pMsgBank, u16 *pMsgNum) {
    Bag *bag = Save_Bag_Get(gmmState->fieldSys->saveData);
    u16 item = FieldSystem_GetDataOfNextMG(gmmState->fieldSys)->item;
    *pMsgBank = NARC_msg_msg_0209_bin;
    *pMsgNum = msg_0209_00005;
    BufferItemName(gmmState->msgFormat, 0, item);
}

static BOOL MGCheck_BattleRules(FieldSystem *fieldSys, MysteryGiftData *mgData) {
    return TRUE;
}

static void MGGive_BattleRules(FieldSystem *fieldSys, MysteryGiftData *mgData) {
    Save_LinkBattleRuleset_Set(fieldSys->saveData, &FieldSystem_GetDataOfNextMG(fieldSys)->ruleset);
}

static void MGMessageSuccess_BattleRules(struct GetMysteryGiftGmmState *gmmState, u16 *pMsgBank, u16 *pMsgNum) {
    LinkBattleRuleset *mgData = &FieldSystem_GetDataOfNextMG(gmmState->fieldSys)->ruleset;
    *pMsgBank = NARC_msg_msg_0209_bin;
    *pMsgNum = msg_0209_00010;
    BufferPlayersName(gmmState->msgFormat, 0, Save_PlayerData_GetProfile(gmmState->fieldSys->saveData));
    String *rulesetName = LinkBattleRuleset_CreateStringFromName(mgData, HEAP_ID_FIELD3);
    BufferString(gmmState->msgFormat, 1, rulesetName, 0, 1, 2);
    String_Delete(rulesetName);
}

// Unreachable
static void MGMessageFailure_BattleRules(struct GetMysteryGiftGmmState *gmmState, u16 *pMsgBank, u16 *pMsgNum) {
    *pMsgBank = NARC_msg_msg_0209_bin;
    *pMsgNum = msg_0209_00006;
}

static BOOL MGCheck_Decoration(FieldSystem *fieldSys, MysteryGiftData *mgData) {
    return FALSE;
}

static void MGGive_Decoration(FieldSystem *fieldSys, MysteryGiftData *mgData) {
}

// Unreachable
static void MGMessageSuccess_Decoration(struct GetMysteryGiftGmmState *gmmState, u16 *pMsgBank, u16 *pMsgNum) {
    int decoration = FieldSystem_GetDataOfNextMG(gmmState->fieldSys)->baseDecoration;
    *pMsgBank = NARC_msg_msg_0209_bin;
    *pMsgNum = msg_0209_00011;
    BufferPlayersName(gmmState->msgFormat, 0, Save_PlayerData_GetProfile(gmmState->fieldSys->saveData));
    BufferDecorationName(gmmState->msgFormat, 1, decoration);
}

static void MGMessageFailure_Decoration(struct GetMysteryGiftGmmState *gmmState, u16 *pMsgBank, u16 *pMsgNum) {
    *pMsgBank = NARC_msg_msg_0209_bin;
    *pMsgNum = msg_0209_00031;
}

static BOOL MGCheck_MonDeco(FieldSystem *fieldSys, MysteryGiftData *unused) {
    MysteryGiftMonDecorationTag *mgData = &FieldSystem_GetDataOfNextMG(fieldSys)->monDecoration;
    int id = mgData->id;
    switch (mgData->kind) {
    case MGMONDECOTYPE_SEAL:
        return SealCase_CheckSealQuantity(Save_SealCase_Get(fieldSys->saveData), id, 1);
    case MGMONDECOTYPE_FASHION:
        return TRUE;
    case MGMONDECOTYPE_BACKGROUND:
        return TRUE;
    default:
        return FALSE;
    }
}

static void MGGive_MonDeco(FieldSystem *fieldSys, MysteryGiftData *unused) {
    MysteryGiftMonDecorationTag *mgData = &FieldSystem_GetDataOfNextMG(fieldSys)->monDecoration;
    int id = mgData->id;
    switch (mgData->kind) {
    case MGMONDECOTYPE_SEAL:
        GiveOrTakeSeal(Save_SealCase_Get(fieldSys->saveData), id, 1);
        break;
    case MGMONDECOTYPE_FASHION:
        FashionCase_GiveFashionItem(Save_FashionData_GetFashionCase(Save_FashionData_Get(fieldSys->saveData)), id, 1);
        break;
    case MGMONDECOTYPE_BACKGROUND:
        FashionCase_GiveContestBackground(Save_FashionData_GetFashionCase(Save_FashionData_Get(fieldSys->saveData)), id);
        break;
    default:
        break;
    }
}

static void MGMessageSuccess_MonDeco(struct GetMysteryGiftGmmState *gmmState, u16 *pMsgBank, u16 *pMsgNum) {
    MysteryGiftMonDecorationTag *mgData = &FieldSystem_GetDataOfNextMG(gmmState->fieldSys)->monDecoration;
    int id = mgData->id;
    switch (mgData->kind) {
    case MGMONDECOTYPE_SEAL:
        BufferSealName(gmmState->msgFormat, 1, id);
        break;
    case MGMONDECOTYPE_FASHION:
        BufferFashionName(gmmState->msgFormat, 1, id);
        break;
    case MGMONDECOTYPE_BACKGROUND:
        BufferContestBackgroundName(gmmState->msgFormat, 1, id);
        break;
    default:
        break;
    }
    *pMsgBank = NARC_msg_msg_0209_bin;
    *pMsgNum = msg_0209_00012;
    BufferPlayersName(gmmState->msgFormat, 0, Save_PlayerData_GetProfile(gmmState->fieldSys->saveData));
}

static void MGMessageFailure_MonDeco(struct GetMysteryGiftGmmState *gmmState, u16 *pMsgBank, u16 *pMsgNum) {
    *pMsgBank = NARC_msg_msg_0209_bin;
    *pMsgNum = msg_0209_00006;
}

static BOOL MGCheck_MemberCard(FieldSystem *fieldSys, MysteryGiftData *mgData) {
    return FALSE;
}

static void MGGive_MemberCard(FieldSystem *fieldSys, MysteryGiftData *mgData) {
}

// Unreachable
static void MGMessageSuccess_MemberCard(struct GetMysteryGiftGmmState *gmmState, u16 *pMsgBank, u16 *pMsgNum) {
}

static void MGMessageFailure_MemberCard(struct GetMysteryGiftGmmState *gmmState, u16 *pMsgBank, u16 *pMsgNum) {
    *pMsgBank = NARC_msg_msg_0209_bin;
    *pMsgNum = msg_0209_00031;
}

static BOOL MGCheck_OaksLetter(FieldSystem *fieldSys, MysteryGiftData *mgData) {
    return FALSE;
}

static void MGGive_OaksLetter(FieldSystem *fieldSys, MysteryGiftData *mgData) {
}

// Unreachable
static void MGMessageSuccess_OaksLetter(struct GetMysteryGiftGmmState *gmmState, u16 *pMsgBank, u16 *pMsgNum) {
}

static void MGMessageFailure_OaksLetter(struct GetMysteryGiftGmmState *gmmState, u16 *pMsgBank, u16 *pMsgNum) {
    *pMsgBank = NARC_msg_msg_0209_bin;
    *pMsgNum = msg_0209_00031;
}

static BOOL MGCheck_SecretKey(FieldSystem *fieldSys, MysteryGiftData *mgData) {
    return FALSE;
}

static void MGGive_SecretKey(FieldSystem *fieldSys, MysteryGiftData *mgData) {
}

// Unreachable
static void MGMessageSuccess_SecretKey(struct GetMysteryGiftGmmState *gmmState, u16 *pMsgBank, u16 *pMsgNum) {
}

static void MGMessageFailure_SecretKey(struct GetMysteryGiftGmmState *gmmState, u16 *pMsgBank, u16 *pMsgNum) {
    *pMsgBank = NARC_msg_msg_0209_bin;
    *pMsgNum = msg_0209_00031;
}

static BOOL MGCheck_AzureFlute(FieldSystem *fieldSys, MysteryGiftData *mgData) {
    return FALSE;
}

static void MGGive_AzureFlute(FieldSystem *fieldSys, MysteryGiftData *mgData) {
}

// Unreachable
static void MGMessageSuccess_AzureFlute(struct GetMysteryGiftGmmState *gmmState, u16 *pMsgBank, u16 *pMsgNum) {
}

static void MGMessageFailure_AzureFlute(struct GetMysteryGiftGmmState *gmmState, u16 *pMsgBank, u16 *pMsgNum) {
    *pMsgBank = NARC_msg_msg_0209_bin;
    *pMsgNum = msg_0209_00031;
}

static BOOL MGCheck_PoketchApp(FieldSystem *fieldSys, MysteryGiftData *mgData) {
    return FALSE;
}

static void MGGive_PoketchApp(FieldSystem *fieldSys, MysteryGiftData *mgData) {
}

// Unreachable
static void MGMessageSuccess_PoketchApp(struct GetMysteryGiftGmmState *gmmState, u16 *pMsgBank, u16 *pMsgNum) {
}

static void MGMessageFailure_PoketchApp(struct GetMysteryGiftGmmState *gmmState, u16 *pMsgBank, u16 *pMsgNum) {
    *pMsgBank = NARC_msg_msg_0209_bin;
    *pMsgNum = msg_0209_00031;
}

static BOOL MGCheck_PokewalkerCourse(FieldSystem *fieldSys, MysteryGiftData *unused) {
    u8 *mgData = &FieldSystem_GetDataOfNextMG(fieldSys)->pokewalkerCourse;
    POKEWALKER *pokeWalker = Save_Pokewalker_Get(fieldSys->saveData);
    u8 courseNo = WALKER_COURSE_REFRESHING_FIELD;
    if (*mgData < WALKER_COURSE_MAX) {
        courseNo = *mgData;
    }
    return !Pokewalker_CourseIsUnlocked(pokeWalker, courseNo);
}

static void MGGive_PokewalkerCourse(FieldSystem *fieldSys, MysteryGiftData *unused) {
    POKEWALKER *pokeWalker = Save_Pokewalker_Get(fieldSys->saveData);
    u8 courseNo = FieldSystem_GetDataOfNextMG(fieldSys)->pokewalkerCourse;
    if (courseNo < WALKER_COURSE_MAX) {
        Pokewalker_UnlockCourse(pokeWalker, courseNo);
    }
}

static void MGMessageSuccess_PokewalkerCourse(struct GetMysteryGiftGmmState *gmmState, u16 *pMsgBank, u16 *pMsgNum) {
    u8 *mgData = &FieldSystem_GetDataOfNextMG(gmmState->fieldSys)->pokewalkerCourse;
    *pMsgBank = NARC_msg_msg_0209_bin;
    *pMsgNum = msg_0209_00019;
    BufferPlayersName(gmmState->msgFormat, 0, Save_PlayerData_GetProfile(gmmState->fieldSys->saveData));
    BufferPokewalkerCourseName(gmmState->msgFormat, 1, *mgData);
}

static void MGMessageFailure_PokewalkerCourse(struct GetMysteryGiftGmmState *gmmState, u16 *pMsgBank, u16 *pMsgNum) {
    u8 *mgData = &FieldSystem_GetDataOfNextMG(gmmState->fieldSys)->pokewalkerCourse;
    POKEWALKER *pokeWalker = Save_Pokewalker_Get(gmmState->fieldSys->saveData);
    *pMsgBank = NARC_msg_msg_0209_bin;
    *pMsgNum = msg_0209_00026;
    BufferPlayersName(gmmState->msgFormat, 0, Save_PlayerData_GetProfile(gmmState->fieldSys->saveData));
    BufferPokewalkerCourseName(gmmState->msgFormat, 1, *mgData);
}

static BOOL MGCheck_MemorialPhoto(FieldSystem *fieldSys, MysteryGiftData *mgData) {
    Bag *bag = Save_Bag_Get(fieldSys->saveData);
    PhotoAlbum *album = Save_PhotoAlbum_Get(fieldSys->saveData);
    return PhotoAlbum_GetNumSaved(album) < PHOTO_ALBUM_MAX;
}

static void MGGive_MemorialPhoto(FieldSystem *fieldSys, MysteryGiftData *unused) {
    Photo *mgData = &FieldSystem_GetDataOfNextMG(fieldSys)->photo;
    PhotoAlbum *album = Save_PhotoAlbum_Get(FieldSystem_GetSaveData(fieldSys));
    u8 slot = PhotoAlbum_GetIndexOfFirstEmptySlot(album);
    if (slot == 0xFF) {
        GF_ASSERT(FALSE);
    } else {
        PhotoAlbum_SetPhotoAtIndex(album, mgData, slot);
    }
}

static void MGMessageSuccess_MemorialPhoto(struct GetMysteryGiftGmmState *gmmState, u16 *pMsgBank, u16 *pMsgNum) {
    Photo *photo = &FieldSystem_GetDataOfNextMG(gmmState->fieldSys)->photo;
    *pMsgBank = NARC_msg_msg_0209_bin;
    *pMsgNum = msg_0209_00018;
    BufferPlayersName(gmmState->msgFormat, 0, Save_PlayerData_GetProfile(gmmState->fieldSys->saveData));
}

static void MGMessageFailure_MemorialPhoto(struct GetMysteryGiftGmmState *gmmState, u16 *pMsgBank, u16 *pMsgNum) {
    Photo *photo = &FieldSystem_GetDataOfNextMG(gmmState->fieldSys)->photo;
    Bag *bag = Save_Bag_Get(gmmState->fieldSys->saveData);
    *pMsgBank = NARC_msg_msg_0209_bin;
    if (!Bag_HasItem(bag, ITEM_PHOTO_ALBUM, 1, HEAP_ID_FIELD2)) {
        *pMsgNum = msg_0209_00024;
    } else {
        *pMsgNum = msg_0209_00025;
    }
    BufferPlayersName(gmmState->msgFormat, 0, Save_PlayerData_GetProfile(gmmState->fieldSys->saveData));
}
