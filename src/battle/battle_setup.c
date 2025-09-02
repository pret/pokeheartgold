#include "battle/battle_setup.h"

#include "global.h"

#include "constants/battle.h"

#include "msgdata/msg.naix"
#include "msgdata/msg/msg_0445.h"

#include "follow_mon.h"
#include "metatile_behavior.h"
#include "msgdata.h"
#include "save_link_ruleset.h"
#include "save_local_field_data.h"
#include "save_pokegear.h"
#include "save_wifi_history.h"
#include "sys_flags.h"
#include "system.h"
#include "unk_02033AE0.h"
#include "unk_02035900.h"
#include "unk_02037C94.h"
#include "unk_02054648.h"
#include "unk_02055418.h"
#include "unk_0205B3DC.h"
#include "unk_0205BB1C.h"
#include "unk_02067A60.h"
#include "unk_0206D494.h"
#include "unk_02088288.h"
#include "unk_02092BE8.h"
#include "unk_020931C4.h"

static void BattleSetup_SetParty(BattleSetup *setup, Party *party, int battlerId);
static void BattleSetup_SetProfile(BattleSetup *setup, PlayerProfile *profile, int battlerId);
static void BattleSetup_SetChatotVoiceClip(BattleSetup *setup, SOUND_CHATOT *chatot, int battlerId);
static void sub_0205230C(FieldSystem *fieldSystem, PlayerProfile *profile1, PlayerProfile *profile2);
static Terrain FieldSystem_GetTerrainFromStandingTile(FieldSystem *fieldSystem, BattleBg battleBg);
static void sub_02052504(BattleSetup *setup, FieldSystem *fieldSystem);

BattleSetup *BattleSetup_New(enum HeapID heapID, u32 battleTypeFlags) {
    int i;
    BattleSetup *setup = Heap_Alloc(heapID, sizeof(BattleSetup));
    MI_CpuClear8(setup, sizeof(BattleSetup));
    setup->battleType = battleTypeFlags;
    setup->battleSpecial = 0;
    setup->winFlag = 0;
    setup->battleBg = BATTLE_BG_GENERAL;
    setup->terrain = TERRAIN_MAX;
    setup->mapSection = 0;
    setup->timeOfDay = RTC_TIMEOFDAY_MORN;
    setup->evolutionLocation = 0;
    setup->unk_164 = 1;
    setup->metBill = TRUE;
    setup->weatherType = 0;
    for (i = 0; i < BATTLER_MAX; ++i) {
        setup->trainerId[i] = 0;
        MI_CpuClear32(&setup->trainer[i], sizeof(Trainer));
        setup->party[i] = SaveArray_Party_Alloc(heapID);
        setup->profile[i] = PlayerProfile_New(heapID);
        setup->chatot[i] = Chatot_New(heapID);
        setup->unk1CC[i] = 0xFF;
    }
    setup->bag = Save_Bag_New(heapID);
    setup->pokedex = Pokedex_New(heapID);
    setup->options = Options_New(heapID);
    setup->unk_134 = sub_02067A60(heapID);
    setup->bagCursor = NULL;
    setup->unk1B8 = NULL;
    setup->safariBalls = 0;
    setup->wifiHistory = NULL;
    setup->gameStats = NULL;
    setup->fixedDamaageMovesBanned = FALSE;
    setup->bugContestMon = AllocMonZeroed(heapID);

    setup->unk_19C = RngSeedFromRTC();

    if (sub_02037474() == TRUE) {
        for (i = 0; i < sub_02037454(); ++i) {
            setup->unk_1A0[i] = sub_020378AC(i);
        }
        setup->unk1B0 = sub_0203769C();
    }
    MI_CpuClear8(&setup->unk138, sizeof(setup->unk138));
    return setup;
}

BattleSetup *BattleSetup_New_SafariZone(enum HeapID heapID, int balls) {
    BattleSetup *setup = BattleSetup_New(heapID, BATTLE_TYPE_SAFARI);
    setup->safariBalls = balls;
    return setup;
}

BattleSetup *BattleSetup_New_BugContest(enum HeapID heapID, int balls, Pokemon *bugmon) {
    BattleSetup *setup = BattleSetup_New(heapID, BATTLE_TYPE_BUG_CONTEST);
    setup->safariBalls = balls;
    CopyPokemonToPokemon(bugmon, setup->bugContestMon);
    return setup;
}

BattleSetup *BattleSetup_New_PalPark(enum HeapID heapID, int balls) {
    BattleSetup *setup = BattleSetup_New(heapID, BATTLE_TYPE_PAL_PARK);
    setup->safariBalls = balls;
    return setup;
}

BattleSetup *BattleSetup_New_Tutorial(enum HeapID heapID, FieldSystem *fieldSystem) {
    PlayerProfile *profile = Save_PlayerData_GetProfile(fieldSystem->saveData);
    Options *options = Save_PlayerData_GetOptionsAddr(fieldSystem->saveData);
    BattleSetup *setup = BattleSetup_New(heapID, BATTLE_TYPE_TUTORIAL);
    setup->saveData = fieldSystem->saveData;
    {
        MsgData *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0445_bin, heapID);
        {
            String *name = String_New(PLAYER_NAME_LENGTH + 1, heapID);
            ReadMsgDataIntoString(msgData, PlayerProfile_GetTrainerGender(profile) ^ 1, name);
            Save_Profile_PlayerName_Set(setup->profile[BATTLER_PLAYER], String_cstr(name));
            String_Delete(name);
        }
        DestroyMsgData(msgData);
    }
    PlayerProfile_SetTrainerGender(setup->profile[BATTLER_PLAYER], PlayerProfile_GetTrainerGender(profile) ^ 1);
    sub_02052504(setup, fieldSystem);
    Options_Copy(options, setup->options);
    setup->timeOfDay = Field_GetTimeOfDay(fieldSystem);
    Bag_AddItem(setup->bag, ITEM_POKE_BALL, 20, heapID);
    {
        Pokemon *pokemon = AllocMonZeroed(heapID);
        CreateMon(pokemon, SPECIES_MARILL, 5, 32, FALSE, 0, OT_ID_RANDOM_NO_SHINY, 0);
        Party_AddMon(setup->party[BATTLER_PLAYER], pokemon);
        CreateMon(pokemon, SPECIES_RATTATA, 2, 32, FALSE, 0, OT_ID_RANDOM_NO_SHINY, 0);
        Party_AddMon(setup->party[BATTLER_ENEMY], pokemon);
        Heap_Free(pokemon);
    }
    setup->unk1CC[BATTLER_PLAYER] = 0;
    setup->storagePC = SaveArray_PCStorage_Get(fieldSystem->saveData);
    setup->bagCursor = fieldSystem->bagCursor;
    setup->unk1B8 = NULL;
    setup->gameStats = Save_GameStats_Get(fieldSystem->saveData);
    setup->mapNumber = fieldSystem->location->mapId;
    BattleSetup_SetAllySideBattlersToPlayer(setup);
    return setup;
}

void BattleSetup_Delete(BattleSetup *setup) {
    int i;

    for (i = 0; i < BATTLER_MAX; ++i) {
        GF_ASSERT(setup->party[i] != NULL);
        Heap_Free(setup->party[i]);
    }

    for (i = 0; i < BATTLER_MAX; ++i) {
        GF_ASSERT(setup->profile[i] != NULL);
        Heap_Free(setup->profile[i]);
    }

    for (i = 0; i < BATTLER_MAX; ++i) {
        GF_ASSERT(setup->chatot[i] != NULL);
        Heap_Free(setup->chatot[i]);
    }

    Heap_Free(setup->bag);
    Heap_Free(setup->pokedex);
    Heap_Free(setup->options);
    sub_02067A78(setup->unk_134);
    Heap_Free(setup->bugContestMon);
    Heap_Free(setup);
}

void BattleSetup_AddMonToParty(BattleSetup *setup, Pokemon *mon, int battlerId) {
    GF_ASSERT(battlerId < BATTLER_MAX);
    GF_ASSERT(Party_AddMon(setup->party[battlerId], mon));
}

static void BattleSetup_SetParty(BattleSetup *setup, Party *party, int battlerId) {
    GF_ASSERT(battlerId < BATTLER_MAX);
    Party_Copy(party, setup->party[battlerId]);
}

static void BattleSetup_SetProfile(BattleSetup *setup, PlayerProfile *profile, int battlerId) {
    GF_ASSERT(battlerId < BATTLER_MAX);
    PlayerProfile_Copy(profile, setup->profile[battlerId]);
}

static void BattleSetup_SetChatotVoiceClip(BattleSetup *setup, SOUND_CHATOT *chatot, int battlerId) {
    Chatot_Copy(setup->chatot[battlerId], chatot);
}

void sub_02051D18(BattleSetup *setup, FieldSystem *fieldSystem, SaveData *saveData, u32 mapno, BagCursor *bagCursor, void *arg5) {
    PlayerProfile *profile;
    Party *party;
    Bag *bag;
    Pokedex *pokedex;
    SOUND_CHATOT *chatot;
    Options *options;
    LocalFieldData *local;
    BOOL forceNite;
    BattleBg battle_bg;

    profile = Save_PlayerData_GetProfile(saveData);
    party = SaveArray_Party_Get(saveData);
    bag = Save_Bag_Get(saveData);
    pokedex = Save_Pokedex_Get(saveData);
    chatot = Save_Chatot_Get(saveData);
    options = Save_PlayerData_GetOptionsAddr(saveData);
    local = Save_LocalFieldData_Get(saveData);

    if (fieldSystem != NULL) {
        forceNite = FALSE;
        battle_bg = MapHeader_GetBattleBg(fieldSystem->location->mapId);
        if (battle_bg == BATTLE_BG_CAVE_1 || battle_bg == BATTLE_BG_CAVE_2 || battle_bg == BATTLE_BG_CAVE_3) {
            forceNite = TRUE;
        }
        sub_02052504(setup, fieldSystem);
        setup->timeOfDay = Field_GetTimeOfDay(fieldSystem);
        if (forceNite) {
            setup->timeOfDay = RTC_TIMEOFDAY_NITE;
        }
        if (FollowMon_IsActive(fieldSystem) && FollowMon_IsVisible(fieldSystem)) {
            setup->unk1CC[BATTLER_PLAYER] = Save_GetPartyLeadAlive(saveData);
        }
    } else {
        setup->battleBg = MapHeader_GetBattleBg(mapno);
        setup->terrain = TERRAIN_BUILDING;
        setup->timeOfDay = GF_RTC_GetTimeOfDayByHour(Save_SysInfo_RTC_Get(saveData)->time.hour);
    }
    BattleSetup_SetProfile(setup, profile, BATTLER_PLAYER);
    if (setup->battleType & BATTLE_TYPE_BUG_CONTEST) {
        Party_InitWithMaxSize(setup->party[BATTLER_PLAYER], 1);
        BattleSetup_AddMonToParty(setup, Party_GetMonByIndex(party, 0), BATTLER_PLAYER);
    } else {
        BattleSetup_SetParty(setup, party, BATTLER_PLAYER);
    }
    Save_Bag_Copy(bag, setup->bag);
    Pokedex_Copy(pokedex, setup->pokedex);
    Options_Copy(options, setup->options);
    BattleSetup_SetChatotVoiceClip(setup, chatot, BATTLER_PLAYER);
    setup->storagePC = SaveArray_PCStorage_Get(saveData);
    setup->mapSection = MapHeader_GetMapSec(mapno);
    setup->evolutionLocation = MapHeader_GetMapEvolutionMethod(mapno);
    setup->unk_164 = sub_02088288(saveData);
    setup->metBill = CheckMetBill(Save_VarsFlags_Get(saveData));
    if (PhoneCallPersistentState_MomSavings_BalanceAction(SaveData_GetPhoneCallPersistentState(saveData), MOMS_BALANCE_GET, 0) < 999999) {
        setup->momsSavingsActive = Save_VarsFlags_MomsSavingsFlagCheck(Save_VarsFlags_Get(saveData));
    } else {
        setup->momsSavingsActive = FALSE;
    }
    setup->weatherType = LocalFieldData_GetWeatherType(local);
    setup->bagCursor = bagCursor;
    setup->unk1B8 = arg5;
    setup->wifiHistory = Save_WiFiHistory_Get(saveData);
    setup->gameStats = Save_GameStats_Get(saveData);
    setup->palPad = Save_PalPad_Get(saveData);
    setup->mapNumber = mapno;
    setup->saveData = saveData;
}

void BattleSetup_InitFromFieldSystem(BattleSetup *setup, FieldSystem *fieldSystem) {
    sub_02051D18(setup, fieldSystem, fieldSystem->saveData, fieldSystem->location->mapId, fieldSystem->bagCursor, fieldSystem->unkB0);
    BattleSetup_SetAllySideBattlersToPlayer(setup);
}

void BattleSetup_InitForFixedLevelFacility(BattleSetup *setup, FieldSystem *fieldSystem, int level) {
    PlayerProfile *profile;
    Party *party;
    Bag *bag;
    Pokedex *pokedex;
    SOUND_CHATOT *chatot;
    Options *options;

    profile = Save_PlayerData_GetProfile(fieldSystem->saveData);
    party = SaveArray_Party_Get(fieldSystem->saveData);
    bag = Save_Bag_Get(fieldSystem->saveData);
    pokedex = Save_Pokedex_Get(fieldSystem->saveData);
    chatot = Save_Chatot_Get(fieldSystem->saveData);
    options = Save_PlayerData_GetOptionsAddr(fieldSystem->saveData);

    setup->battleBg = BATTLE_BG_BUILDING_1;
    setup->terrain = TERRAIN_BUILDING;
    BattleSetup_SetProfile(setup, profile, BATTLER_PLAYER);

    Pokemon *pokemon = AllocMonZeroed(HEAP_ID_FIELD2);
    Party_InitWithMaxSize(setup->party[BATTLER_PLAYER], Party_GetCount(party));
    for (int i = 0; i < Party_GetCount(party); ++i) {
        CopyPokemonToPokemon(Party_GetMonByIndex(party, i), pokemon);
        if (level != GetMonData(pokemon, MON_DATA_LEVEL, NULL) && level != 0) {
            u32 exp = GetMonExpBySpeciesAndLevel(GetMonData(pokemon, MON_DATA_SPECIES, NULL), level);
            SetMonData(pokemon, MON_DATA_EXPERIENCE, &exp);
            CalcMonLevelAndStats(pokemon);
        }
        BattleSetup_AddMonToParty(setup, pokemon, BATTLER_PLAYER);
    }
    Heap_Free(pokemon);

    Save_Bag_Copy(bag, setup->bag);
    Pokedex_Copy(pokedex, setup->pokedex);
    Options_Copy(options, setup->options);
    BattleSetup_SetChatotVoiceClip(setup, chatot, BATTLER_PLAYER);
    setup->storagePC = SaveArray_PCStorage_Get(fieldSystem->saveData);
    setup->timeOfDay = Field_GetTimeOfDay(fieldSystem);
    setup->bagCursor = fieldSystem->bagCursor;
    setup->unk1B8 = fieldSystem->unkB0;
    setup->wifiHistory = Save_WiFiHistory_Get(fieldSystem->saveData);
    setup->gameStats = Save_GameStats_Get(fieldSystem->saveData);
    setup->palPad = Save_PalPad_Get(fieldSystem->saveData);
    setup->mapNumber = fieldSystem->location->mapId;
    setup->saveData = fieldSystem->saveData;
    BattleSetup_SetAllySideBattlersToPlayer(setup);
}

void sub_020520B0(BattleSetup *setup, FieldSystem *fieldSystem, Party *party, u8 *partySlots) {
    PlayerProfile *profile;
    Bag *bag;
    Pokedex *pokedex;
    SOUND_CHATOT *chatot;
    Options *options;
    void *ruleset;

    profile = Save_PlayerData_GetProfile(fieldSystem->saveData);
    bag = Save_Bag_Get(fieldSystem->saveData);
    pokedex = Save_Pokedex_Get(fieldSystem->saveData);
    chatot = Save_Chatot_Get(fieldSystem->saveData);
    options = Save_PlayerData_GetOptionsAddr(fieldSystem->saveData);
    ruleset = fieldSystem->linkBattleRuleset;

    setup->battleBg = BATTLE_BG_BUILDING_1;
    setup->terrain = TERRAIN_BUILDING;
    BattleSetup_SetProfile(setup, profile, BATTLER_PLAYER);

    if (partySlots == NULL) {
        BattleSetup_SetParty(setup, party, BATTLER_PLAYER);
    } else {
        int cnt;
        int i;
        u8 partySlots_cpy[PARTY_SIZE];
        MI_CpuCopy8(partySlots, partySlots_cpy, 6);
        cnt = 0;
        for (i = 0; i < PARTY_SIZE; ++i) {
            if (partySlots_cpy[i] != 0) {
                ++cnt;
            }
        }
        if (cnt == 0) {
            for (i = 0; i < PARTY_SIZE; ++i) {
                partySlots_cpy[i] = i + 1;
            }
            cnt = Party_GetCount(party);
        }
        Pokemon *pokemon = AllocMonZeroed(HEAP_ID_FIELD2);
        Party_InitWithMaxSize(setup->party[BATTLER_PLAYER], cnt);
        for (i = 0; i < cnt; ++i) {
            CopyPokemonToPokemon(Party_GetMonByIndex(party, partySlots_cpy[i] - 1), pokemon);
            if (GetMonData(pokemon, MON_DATA_LEVEL, NULL) > 50 && (sub_0203993C() == 37 || sub_0203993C() == 38)) {
                u32 exp = GetMonExpBySpeciesAndLevel(GetMonData(pokemon, MON_DATA_SPECIES, NULL), 50);
                SetMonData(pokemon, MON_DATA_EXPERIENCE, &exp);
                CalcMonLevelAndStats(pokemon);
            }
            BattleSetup_AddMonToParty(setup, pokemon, BATTLER_PLAYER);
        }
        Heap_Free(pokemon);
    }

    if (ruleset != NULL && LinkBattleRuleset_GetRuleValue(ruleset, LINKBATTLERULE_DRAGON_RAGE_CLAUSE)) {
        setup->fixedDamaageMovesBanned = TRUE;
    }
    Save_Bag_Copy(bag, setup->bag);
    Pokedex_Copy(pokedex, setup->pokedex);
    Options_Copy(options, setup->options);
    BattleSetup_SetChatotVoiceClip(setup, chatot, BATTLER_PLAYER);
    setup->storagePC = SaveArray_PCStorage_Get(fieldSystem->saveData);
    setup->timeOfDay = Field_GetTimeOfDay(fieldSystem);
    setup->bagCursor = fieldSystem->bagCursor;
    setup->unk1B8 = fieldSystem->unkB0;
    setup->wifiHistory = Save_WiFiHistory_Get(fieldSystem->saveData);
    setup->gameStats = Save_GameStats_Get(fieldSystem->saveData);
    setup->mapNumber = fieldSystem->location->mapId;
    setup->palPad = Save_PalPad_Get(fieldSystem->saveData);
    setup->saveData = fieldSystem->saveData;

    if (sub_0203401C(sub_0203993C())) {
        int avatar = PlayerProfile_GetAvatar(profile);
        int gender = PlayerProfile_GetTrainerGender(profile);
        setup->trainer[BATTLER_PLAYER].data.trainerClass = GetUnionRoomAvatarAttrBySprite(gender, avatar, 1);
        CopyU16StringArray(setup->trainer[BATTLER_PLAYER].name, PlayerProfile_GetNamePtr(setup->profile[BATTLER_PLAYER]));
        setup->trainer[BATTLER_PLAYER2] = setup->trainer[BATTLER_PLAYER];
    } else {
        BattleSetup_SetAllySideBattlersToPlayer(setup);
    }
}

void sub_020522F0(BattleSetup *setup, FieldSystem *fieldSystem, void *partySlots) {
    sub_020520B0(setup, fieldSystem, SaveArray_Party_Get(fieldSystem->saveData), partySlots);
}

static void sub_0205230C(FieldSystem *fieldSystem, PlayerProfile *profile1, PlayerProfile *profile2) {
    SaveVarsFlags *vars_flags = Save_VarsFlags_Get(fieldSystem->saveData);
    PhoneCallPersistentState *savings = SaveData_GetPhoneCallPersistentState(fieldSystem->saveData);

    if (Save_VarsFlags_MomsSavingsFlagCheck(vars_flags)) {
        u32 money2 = PlayerProfile_GetMoney(profile2);
        int delta = (int)(money2 - PlayerProfile_GetMoney(profile1)) / 4;
        u32 savingsBalance = PhoneCallPersistentState_MomSavings_BalanceAction(savings, MOMS_BALANCE_GET, 0);
        u32 balanceResult;
        if (delta > 0) {
            if (savingsBalance + delta >= 999999) {
                delta = 999999 - savingsBalance;
            }
            PlayerProfile_SetMoney(profile2, money2 - delta);
            balanceResult = PhoneCallPersistentState_MomSavings_BalanceAction(savings, MOMS_BALANCE_ADD, delta);
        } else {
            balanceResult = savingsBalance;
        }
        if (sub_0209322C(savings, balanceResult, savingsBalance)) {
            sub_02092E14(FieldSystem_GetGearPhoneRingManager(fieldSystem), 12, TRUE);
        }
    }
}

void sub_0205239C(BattleSetup *setup, FieldSystem *fieldSystem) {
    PlayerProfile *profile;
    Party *party;
    Bag *bag;
    Pokedex *pokedex;
    SaveVarsFlags *vars_flags;
    u16 *balls_ptr;

    profile = Save_PlayerData_GetProfile(fieldSystem->saveData);
    party = SaveArray_Party_Get(fieldSystem->saveData);
    bag = Save_Bag_Get(fieldSystem->saveData);
    pokedex = Save_Pokedex_Get(fieldSystem->saveData);

    sub_0205230C(fieldSystem, profile, setup->profile[BATTLER_PLAYER]);
    PlayerProfile_Copy(setup->profile[BATTLER_PLAYER], profile);
    Party_Copy(setup->party[BATTLER_PLAYER], party);
    Save_Bag_Copy(setup->bag, bag);
    Pokedex_Copy(setup->pokedex, pokedex);

    balls_ptr = NULL;
    vars_flags = Save_VarsFlags_Get(fieldSystem->saveData);
    if (Save_VarsFlags_CheckSafariSysFlag(vars_flags)) {
        balls_ptr = LocalFieldData_GetSafariBallsCounter(Save_LocalFieldData_Get(fieldSystem->saveData));
    } else if (Save_VarsFlags_CheckBugContestFlag(vars_flags)) {
        balls_ptr = BugContest_GetSportBallsAddr(FieldSystem_BugContest_Get(fieldSystem));
    }
    if (balls_ptr != NULL) {
        *balls_ptr = setup->safariBalls;
    }
}

void sub_02052444(BattleSetup *setup, FieldSystem *fieldSystem) {
    PlayerProfile *profile;
    Party *party;
    Bag *bag;
    Pokedex *pokedex;

    profile = Save_PlayerData_GetProfile(fieldSystem->saveData);
    party = SaveArray_Party_Get(fieldSystem->saveData);
    bag = Save_Bag_Get(fieldSystem->saveData);
    pokedex = Save_Pokedex_Get(fieldSystem->saveData);

    Pokedex_Copy(setup->pokedex, pokedex);
}

static const Terrain _020FC4C0[] = {
    [BATTLE_BG_GENERAL] = TERRAIN_PLAIN,
    [BATTLE_BG_OCEAN] = TERRAIN_WATER,
    [BATTLE_BG_CITY] = TERRAIN_BUILDING,
    [BATTLE_BG_FOREST] = TERRAIN_GRASS,
    [BATTLE_BG_MOUNTAIN] = TERRAIN_MOUNTAIN,
    [BATTLE_BG_SNOW] = TERRAIN_SNOW,
    [BATTLE_BG_BUILDING_1] = TERRAIN_BUILDING,
    [BATTLE_BG_BUILDING_2] = TERRAIN_BUILDING,
    [BATTLE_BG_BUILDING_3] = TERRAIN_BUILDING,
    [BATTLE_BG_CAVE_1] = TERRAIN_CAVE,
    [BATTLE_BG_CAVE_2] = TERRAIN_CAVE,
    [BATTLE_BG_CAVE_3] = TERRAIN_CAVE,
    [BATTLE_BG_WILL] = TERRAIN_WILL,
    [BATTLE_BG_KOGA] = TERRAIN_KOGA,
    [BATTLE_BG_BRUNO] = TERRAIN_BRUNO,
    [BATTLE_BG_KAREN] = TERRAIN_KAREN,
    [BATTLE_BG_LANCE] = TERRAIN_LANCE,
    [BATTLE_BG_DISTORTION_WORLD] = TERRAIN_DISTORTION_WORLD,
    [BATTLE_BG_BATTLE_TOWER] = TERRAIN_BATTLE_TOWER,
    [BATTLE_BG_BATTLE_FACTORY] = TERRAIN_BATTLE_FACTORY,
    [BATTLE_BG_BATTLE_ARCADE] = TERRAIN_BATTLE_ARCADE,
    [BATTLE_BG_BATTLE_CASTLE] = TERRAIN_BATTLE_CASTLE,
    [BATTLE_BG_BATTLE_HALL] = TERRAIN_BATTLE_HALL,
};

static Terrain FieldSystem_GetTerrainFromStandingTile(FieldSystem *fieldSystem, BattleBg battleBg) {
    u8 behavior = GetMetatileBehavior(fieldSystem, fieldSystem->location->x, fieldSystem->location->y);

    if (sub_0205B828(behavior)) {
        return TERRAIN_ICE;
    }
    if (MetatileBehavior_IsEncounterGrass(behavior) || sub_0205B6F4(behavior)) {
        return TERRAIN_GRASS;
    }
    if (sub_0205B798(behavior)) {
        return TERRAIN_SAND;
    }
    if (sub_0205B8B8(behavior)) {
        return TERRAIN_SNOW;
    }
    if (sub_0205B8AC(behavior)) {
        return TERRAIN_GREAT_MARSH;
    }
    if (sub_0205B8D0(behavior)) {
        return TERRAIN_CAVE;
    }
    if (MetatileBehavior_IsSurfableWater(behavior)) {
        return TERRAIN_WATER;
    }
    if (battleBg < NELEMS(_020FC4C0)) {
        return _020FC4C0[battleBg];
    }

    GF_ASSERT(FALSE);
    return TERRAIN_MAX;
}

static void sub_02052504(BattleSetup *setup, FieldSystem *fieldSystem) {
    PlayerSaveData *player = LocalFieldData_GetPlayer(Save_LocalFieldData_Get(fieldSystem->saveData));
    setup->battleBg = MapHeader_GetBattleBg(fieldSystem->location->mapId);

    if (player->state == PLAYER_STATE_SURFING) {
        setup->battleBg = BATTLE_BG_OCEAN;
    }

    setup->terrain = FieldSystem_GetTerrainFromStandingTile(fieldSystem, setup->battleBg);
}

void sub_02052544(BattleSetup *setup) {
    setup->terrain = TERRAIN_WATER;
    setup->unk_1D0 = TRUE;
}

BOOL IsBattleResultWin(u32 result) {
    switch (result) {
    case BATTLE_OUTCOME_LOSE:
    case BATTLE_OUTCOME_DRAW:
        return FALSE;
    default:
        return TRUE;
    }
}

BOOL IsBattleResultStaticWildWin(u32 result) {
    switch (result) {
    case BATTLE_OUTCOME_WIN:
    case BATTLE_OUTCOME_MON_CAUGHT:
        return FALSE;
    default:
        return TRUE;
    }
}

BOOL IsBattleResultLatiCaught(u32 result) {
    switch (result) {
    case BATTLE_OUTCOME_MON_CAUGHT:
        return FALSE;
    default:
        return TRUE;
    }
}

void BattleSetup_SetAllySideBattlersToPlayer(BattleSetup *setup) {
    setup->trainer[BATTLER_PLAYER].data.trainerClass = PlayerProfile_GetTrainerGender(setup->profile[BATTLER_PLAYER]);
    CopyU16StringArray(setup->trainer[BATTLER_PLAYER].name, PlayerProfile_GetNamePtr(setup->profile[BATTLER_PLAYER]));
    setup->trainer[BATTLER_PLAYER2] = setup->trainer[BATTLER_PLAYER];
}
