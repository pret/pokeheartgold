#include "global.h"
#include "battle/battle_setup.h"
#include "system.h"
#include "msgdata.h"
#include "msgdata/msg/msg_0445.h"
#include "unk_02035900.h"
#include "unk_02055418.h"
#include "save_local_field_data.h"
#include "field_follow_poke.h"
#include "unk_0205BB1C.h"
#include "unk_02088288.h"
#include "unk_0202CA24.h"
#include "sys_flags.h"
#include "save_pokegear.h"
#include "unk_02037C94.h"
#include "unk_02033AE0.h"
#include "unk_0205B3DC.h"
#include "unk_020290B4.h"
#include "unk_020931C4.h"
#include "unk_02092BE8.h"
#include "unk_0206D494.h"
#include "unk_02054648.h"
#include "metatile_behavior.h"
#include "msgdata/msg.naix"
#include "constants/battle.h"

static void BattleSetup_SetParty(BattleSetup* setup, Party* party, int battlerId);
static void BattleSetup_SetProfile(BattleSetup* setup, PlayerProfile* profile, int battlerId);
static void BattleSetup_SetChatotVoiceClip(BattleSetup* setup, SOUND_CHATOT* chatot, int battlerId);
static void sub_0205230C(FieldSystem* fieldSystem, PlayerProfile* profile1, PlayerProfile* profile2);
static u32 sub_02052470(FieldSystem* fieldSystem, u32 battleBg);
static void sub_02052504(BattleSetup* setup, FieldSystem* fieldSystem);

BattleSetup* BattleSetup_New(HeapID heapId, u32 battleTypeFlags) {
    int i;
    BattleSetup* setup = AllocFromHeap(heapId, sizeof(BattleSetup));
    MI_CpuClear8(setup, sizeof(BattleSetup));
    setup->flags = battleTypeFlags;
    setup->unk_18C = 0;
    setup->winFlag = 0;
    setup->battleBg = 0;
    setup->unk_150 = 24;
    setup->mapSection = 0;
    setup->timeOfDay = RTC_TIMEOFDAY_MORN;
    setup->evolutionLocation = 0;
    setup->unk_164 = 1;
    setup->metBill = 1;
    setup->weatherType = 0;
    for (i = 0; i < BATTLER_MAX; ++i) {
        setup->trainerId[i] = 0;
        MI_CpuClear32(&setup->trainer[i], sizeof(TRAINER));
        setup->party[i] = SaveArray_Party_Alloc(heapId);
        setup->profile[i] = PlayerProfile_New(heapId);
        setup->chatot[i] = Chatot_New(heapId);
        setup->unk1CC[i] = 0xFF;
    }
    setup->bag = Save_Bag_New(heapId);
    setup->pokedex = Pokedex_New(heapId);
    setup->options = Options_New(heapId);
    setup->unk_134 = sub_02067A60(heapId);
    setup->unk_10C = NULL;
    setup->unk1B8 = NULL;
    setup->safariBalls = 0;
    setup->unk_12C = NULL;
    setup->gameStats = NULL;
    setup->unk_194 = 0;
    setup->bugContestMon = AllocMonZeroed(heapId);

    {
    RTCDate date;
    RTCTime time;
    GF_RTC_CopyDateTime(&date, &time);
    setup->unk_19C = date.year 
        + date.month * 0x100
        * date.day * 0x10000  // BUG: should this be a +?
        + time.hour * 0x10000
        + (time.minute + time.second) * 0x1000000
        + gSystem.vblankCounter;
    }

    if (sub_02037474() == TRUE) {
        for (i = 0; i < sub_02037454(); ++i) {
            setup->unk_1A0[i] = sub_020378AC(i);
        }
        setup->unk1B0 = sub_0203769C();
    }
    MI_CpuClear8(&setup->unk138, sizeof(setup->unk138));
    return setup;
}

BattleSetup* BattleSetup_New_SafariZone(HeapID heapId, int balls) {
    BattleSetup* setup = BattleSetup_New(heapId, BATTLE_TYPE_SAFARI);
    setup->safariBalls = balls;
    return setup;
}

BattleSetup* BattleSetup_New_BugContest(HeapID heapId, int balls, Pokemon* bugmon) {
    BattleSetup* setup = BattleSetup_New(heapId, BATTLE_TYPE_BUG_CONTEST);
    setup->safariBalls = balls;
    CopyPokemonToPokemon(bugmon, setup->bugContestMon);
    return setup;
}

BattleSetup* BattleSetup_New_PalPark(HeapID heapId, int balls) {
    BattleSetup* setup = BattleSetup_New(heapId, BATTLE_TYPE_PAL_PARK);
    setup->safariBalls = balls;
    return setup;
}

BattleSetup* BattleSetup_New_Tutorial(HeapID heapId, FieldSystem* fieldSystem) {
    PlayerProfile* profile = Save_PlayerData_GetProfileAddr(fieldSystem->saveData);
    OPTIONS* options = Save_PlayerData_GetOptionsAddr(fieldSystem->saveData);
    BattleSetup* setup = BattleSetup_New(heapId, BATTLE_TYPE_TUTORIAL);
    setup->saveData = fieldSystem->saveData;
    {
    MsgData* msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0445_bin, heapId);
    {
    String* name = String_New(PLAYER_NAME_LENGTH + 1, heapId);
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
    Bag_AddItem(setup->bag, ITEM_POKE_BALL, 20, heapId);
    {
    Pokemon* pokemon = AllocMonZeroed(heapId);
    CreateMon(pokemon, SPECIES_MARILL, 5, 32, FALSE, 0, OT_ID_RANDOM_NO_SHINY, 0);
    Party_AddMon(setup->party[BATTLER_PLAYER], pokemon);
    CreateMon(pokemon, SPECIES_RATTATA, 2, 32, FALSE, 0, OT_ID_RANDOM_NO_SHINY, 0);
    Party_AddMon(setup->party[BATTLER_ENEMY], pokemon);
    FreeToHeap(pokemon);
    }
    setup->unk1CC[BATTLER_PLAYER] = 0;
    setup->storagePC = SaveArray_PCStorage_Get(fieldSystem->saveData);
    setup->unk_10C = fieldSystem->unk94;
    setup->unk1B8 = NULL;
    setup->gameStats = Save_GameStats_Get(fieldSystem->saveData);
    setup->mapNumber = fieldSystem->location->mapId;
    BattleSetup_SetAllySideBattlersToPlayer(setup);
    return setup;
}

void BattleSetup_Delete(BattleSetup* setup) {
    int i;

    for (i = 0; i < BATTLER_MAX; ++i) {
        GF_ASSERT(setup->party[i] != NULL);
        FreeToHeap(setup->party[i]);
    }
    
    for (i = 0; i < BATTLER_MAX; ++i) {
        GF_ASSERT(setup->profile[i] != NULL);
        FreeToHeap(setup->profile[i]);
    }
    
    for (i = 0; i < BATTLER_MAX; ++i) {
        GF_ASSERT(setup->chatot[i] != NULL);
        FreeToHeap(setup->chatot[i]);
    }
    
    FreeToHeap(setup->bag);
    FreeToHeap(setup->pokedex);
    FreeToHeap(setup->options);
    sub_02067A78(setup->unk_134);
    FreeToHeap(setup->bugContestMon);
    FreeToHeap(setup);
}

void BattleSetup_AddMonToParty(BattleSetup* setup, Pokemon* mon, int battlerId) {
    GF_ASSERT(battlerId < BATTLER_MAX);
    GF_ASSERT(Party_AddMon(setup->party[battlerId], mon));
}

static void BattleSetup_SetParty(BattleSetup* setup, Party* party, int battlerId) {
    GF_ASSERT(battlerId < BATTLER_MAX);
    Party_Copy(party, setup->party[battlerId]);
}

static void BattleSetup_SetProfile(BattleSetup* setup, PlayerProfile* profile, int battlerId) {
    GF_ASSERT(battlerId < BATTLER_MAX);
    PlayerProfile_Copy(profile, setup->profile[battlerId]);
}

static void BattleSetup_SetChatotVoiceClip(BattleSetup* setup, SOUND_CHATOT* chatot, int battlerId) {
    Chatot_Copy(setup->chatot[battlerId], chatot);
}

void sub_02051D18(BattleSetup* setup, FieldSystem* fieldSystem, SaveData* saveData, u32 mapno, void* arg4, void* arg5) {
    PlayerProfile* profile;
    Party* party;
    Bag* bag;
    Pokedex* pokedex;
    SOUND_CHATOT* chatot;
    OPTIONS* options;
    LocalFieldData* local;
    BOOL forceNite;
    u32 battle_bg;

    profile = Save_PlayerData_GetProfileAddr(saveData);
    party = SaveArray_Party_Get(saveData);
    bag = Save_Bag_Get(saveData);
    pokedex = Save_Pokedex_Get(saveData);
    chatot = Save_Chatot_Get(saveData);
    options = Save_PlayerData_GetOptionsAddr(saveData);
    local = Save_LocalFieldData_Get(saveData);

    if (fieldSystem != NULL) {
        forceNite = FALSE;
        battle_bg = MapHeader_GetBattleBg(fieldSystem->location->mapId);
        if (battle_bg == 9 || battle_bg == 10 || battle_bg == 11) {
            forceNite = TRUE;
        }
        sub_02052504(setup, fieldSystem);
        setup->timeOfDay = Field_GetTimeOfDay(fieldSystem);
        if (forceNite) {
            setup->timeOfDay = RTC_TIMEOFDAY_NITE;
        }
        if (FollowingPokemon_IsActive(fieldSystem) && sub_02069FB0(fieldSystem)) {
            setup->unk1CC[BATTLER_PLAYER] = Save_GetPartyLeadAlive(saveData);
        }
    } else {
        setup->battleBg = MapHeader_GetBattleBg(mapno);
        setup->unk_150 = 9;
        setup->timeOfDay = GF_RTC_GetTimeOfDayByHour(Save_SysInfo_RTC_Get(saveData)->time.hour);
    }
    BattleSetup_SetProfile(setup, profile, BATTLER_PLAYER);
    if (setup->flags & BATTLE_TYPE_BUG_CONTEST) {
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
    if (MomSavingsBalanceAction(SaveData_GetMomsSavingsAddr(saveData), MOMS_BALANCE_GET, 0) < 999999) {
        setup->momsSavingsActive = Save_VarsFlags_MomsSavingsFlagCheck(Save_VarsFlags_Get(saveData));
    } else {
        setup->momsSavingsActive = FALSE;
    }
    setup->weatherType = LocalFieldData_GetWeatherType(local);
    setup->unk_10C = arg4;
    setup->unk1B8 = arg5;
    setup->unk_12C = sub_0202CA44(saveData);
    setup->gameStats = Save_GameStats_Get(saveData);
    setup->palPad = Save_PalPad_Get(saveData);
    setup->mapNumber = mapno;
    setup->saveData = saveData;
}

void BattleSetup_InitFromFieldSystem(BattleSetup* setup, FieldSystem *fieldSystem) {
    sub_02051D18(setup, fieldSystem, fieldSystem->saveData, fieldSystem->location->mapId, fieldSystem->unk94, fieldSystem->unkB0);
    BattleSetup_SetAllySideBattlersToPlayer(setup);
}

void BattleSetup_InitForFixedLevelFacility(BattleSetup* setup, FieldSystem *fieldSystem, int level) {
    PlayerProfile* profile;
    Party* party;
    Bag* bag;
    Pokedex* pokedex;
    SOUND_CHATOT* chatot;
    OPTIONS* options;

    profile = Save_PlayerData_GetProfileAddr(fieldSystem->saveData);
    party = SaveArray_Party_Get(fieldSystem->saveData);
    bag = Save_Bag_Get(fieldSystem->saveData);
    pokedex = Save_Pokedex_Get(fieldSystem->saveData);
    chatot = Save_Chatot_Get(fieldSystem->saveData);
    options = Save_PlayerData_GetOptionsAddr(fieldSystem->saveData);

    setup->battleBg = 6;
    setup->unk_150 = 9;
    BattleSetup_SetProfile(setup, profile, BATTLER_PLAYER);

    Pokemon* pokemon = AllocMonZeroed(HEAP_ID_FIELD);
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
    FreeToHeap(pokemon);

    Save_Bag_Copy(bag, setup->bag);
    Pokedex_Copy(pokedex, setup->pokedex);
    Options_Copy(options, setup->options);
    BattleSetup_SetChatotVoiceClip(setup, chatot, BATTLER_PLAYER);
    setup->storagePC = SaveArray_PCStorage_Get(fieldSystem->saveData);
    setup->timeOfDay = Field_GetTimeOfDay(fieldSystem);
    setup->unk_10C = fieldSystem->unk94;
    setup->unk1B8 = fieldSystem->unkB0;
    setup->unk_12C = sub_0202CA44(fieldSystem->saveData);
    setup->gameStats = Save_GameStats_Get(fieldSystem->saveData);
    setup->palPad = Save_PalPad_Get(fieldSystem->saveData);
    setup->mapNumber = fieldSystem->location->mapId;
    setup->saveData = fieldSystem->saveData;
    BattleSetup_SetAllySideBattlersToPlayer(setup);
}

void sub_020520B0(BattleSetup* setup, FieldSystem *fieldSystem, Party *party, u8 *a4) {
    PlayerProfile* profile;
    Bag* bag;
    Pokedex* pokedex;
    SOUND_CHATOT* chatot;
    OPTIONS* options;
    void* fieldSystem_unkA4;

    profile = Save_PlayerData_GetProfileAddr(fieldSystem->saveData);
    bag = Save_Bag_Get(fieldSystem->saveData);
    pokedex = Save_Pokedex_Get(fieldSystem->saveData);
    chatot = Save_Chatot_Get(fieldSystem->saveData);
    options = Save_PlayerData_GetOptionsAddr(fieldSystem->saveData);
    fieldSystem_unkA4 = fieldSystem->unkA4;

    setup->battleBg = 6;
    setup->unk_150 = 9;
    BattleSetup_SetProfile(setup, profile, BATTLER_PLAYER);

    if (a4 == NULL) {
        BattleSetup_SetParty(setup, party, BATTLER_PLAYER);
    } else {
        int r6;
        int i;
        u8 sp28[6];
        MI_CpuCopy8(a4, sp28, 6);
        r6 = 0;
        for (i = 0; i < 6; ++i) {
            if (sp28[i] != 0) {
                ++r6;
            }
        }
        if (r6 == 0) {
            for (i = 0; i < 6; ++i) {
                sp28[i] = i + 1;
            }
            r6 = Party_GetCount(party);
        }
        Pokemon* pokemon = AllocMonZeroed(HEAP_ID_FIELD);
        Party_InitWithMaxSize(setup->party[BATTLER_PLAYER], r6);
        for (i = 0; i < r6; ++i) {
            CopyPokemonToPokemon(Party_GetMonByIndex(party, sp28[i] - 1), pokemon);
            if (GetMonData(pokemon, MON_DATA_LEVEL, NULL) > 50 && (sub_0203993C() == 37 || sub_0203993C() == 38)) {
                u32 exp = GetMonExpBySpeciesAndLevel(GetMonData(pokemon, MON_DATA_SPECIES, NULL), 50);
                SetMonData(pokemon, MON_DATA_EXPERIENCE, &exp);
                CalcMonLevelAndStats(pokemon);
            }
            BattleSetup_AddMonToParty(setup, pokemon, BATTLER_PLAYER);
        }
        FreeToHeap(pokemon);
    }

    if (fieldSystem_unkA4 != NULL && sub_020290FC(fieldSystem_unkA4, 12)) {
        setup->unk_194 = 1;
    }
    Save_Bag_Copy(bag, setup->bag);
    Pokedex_Copy(pokedex, setup->pokedex);
    Options_Copy(options, setup->options);
    BattleSetup_SetChatotVoiceClip(setup, chatot, BATTLER_PLAYER);
    setup->storagePC = SaveArray_PCStorage_Get(fieldSystem->saveData);
    setup->timeOfDay = Field_GetTimeOfDay(fieldSystem);
    setup->unk_10C = fieldSystem->unk94;
    setup->unk1B8 = fieldSystem->unkB0;
    setup->unk_12C = sub_0202CA44(fieldSystem->saveData);
    setup->gameStats = Save_GameStats_Get(fieldSystem->saveData);
    setup->mapNumber = fieldSystem->location->mapId;
    setup->palPad = Save_PalPad_Get(fieldSystem->saveData);
    setup->saveData = fieldSystem->saveData;

    if (sub_0203401C(sub_0203993C())) {
        int avatar = PlayerProfile_GetAvatar(profile);
        int gender = PlayerProfile_GetTrainerGender(profile);
        setup->trainer[BATTLER_PLAYER].trainerClass = GetUnionRoomAvatarAttrBySprite(gender, avatar, 1);
        CopyU16StringArray(setup->trainer[BATTLER_PLAYER].name, PlayerProfile_GetNamePtr(setup->profile[BATTLER_PLAYER]));
        setup->trainer[BATTLER_PLAYER2] = setup->trainer[BATTLER_PLAYER];
    } else {
        BattleSetup_SetAllySideBattlersToPlayer(setup);
    }
}

void sub_020522F0(BattleSetup* setup, FieldSystem *fieldSystem, void *a1) {
    sub_020520B0(setup, fieldSystem, SaveArray_Party_Get(fieldSystem->saveData), a1);
}

static void sub_0205230C(FieldSystem* fieldSystem, PlayerProfile* profile1, PlayerProfile* profile2) {
    SaveVarsFlags* vars_flags = Save_VarsFlags_Get(fieldSystem->saveData);
    MomsSavings* savings = SaveData_GetMomsSavingsAddr(fieldSystem->saveData);

    if (Save_VarsFlags_MomsSavingsFlagCheck(vars_flags)) {
        u32 money2 = PlayerProfile_GetMoney(profile2);
        int delta = (int)(money2 - PlayerProfile_GetMoney(profile1)) / 4;
        u32 savingsBalance = MomSavingsBalanceAction(savings, MOMS_BALANCE_GET, 0);
        u32 r1;
        if (delta > 0) {
            if (savingsBalance + delta >= 999999) {
                delta = 999999 - savingsBalance;
            }
            PlayerProfile_SetMoney(profile2, money2 - delta);
            r1 = MomSavingsBalanceAction(savings, MOMS_BALANCE_ADD, delta);
        } else {
            r1 = savingsBalance;
        }
        if (sub_0209322C(savings, r1, savingsBalance)) {
            sub_02092E14(FieldSystem_GetGearPhoneRingManager(fieldSystem), 12, TRUE);
        }
    }
}

void sub_0205239C(BattleSetup* setup, FieldSystem* fieldSystem) {
    PlayerProfile* profile;
    Party* party;
    Bag* bag;
    Pokedex* pokedex;
    SaveVarsFlags* vars_flags;
    u16* balls_ptr;

    profile = Save_PlayerData_GetProfileAddr(fieldSystem->saveData);
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
    } else if (CheckFlag996(vars_flags)) {
        balls_ptr = BugContest_GetSportBallsAddr(FieldSystem_BugContest_Get(fieldSystem));
    }
    if (balls_ptr != NULL) {
        *balls_ptr = setup->safariBalls;
    }
}

void sub_02052444(BattleSetup* setup, FieldSystem* fieldSystem) {
    PlayerProfile* profile;
    Party* party;
    Bag* bag;
    Pokedex* pokedex;

    profile = Save_PlayerData_GetProfileAddr(fieldSystem->saveData);
    party = SaveArray_Party_Get(fieldSystem->saveData);
    bag = Save_Bag_Get(fieldSystem->saveData);
    pokedex = Save_Pokedex_Get(fieldSystem->saveData);

    Pokedex_Copy(setup->pokedex, pokedex);
}

static const u32 _020FC4C0[] = {
    0,
    7,
    9,
    2,
    4,
    6,
    9,
    9,
    9,
    5,
    5,
    5,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
};

static u32 sub_02052470(FieldSystem* fieldSystem, u32 battleBg) {
    u8 behavior = GetMetatileBehaviorAt(fieldSystem, fieldSystem->location->x, fieldSystem->location->y);

    if (sub_0205B828(behavior)) {
        return 8;
    }
    if (MetatileBehavior_IsEncounterGrass(behavior) || sub_0205B6F4(behavior)) {
        return 2;
    }
    if (sub_0205B798(behavior)) {
        return 1;
    }
    if (sub_0205B8B8(behavior)) {
        return 6;
    }
    if (sub_0205B8AC(behavior)) {
        return 10;
    }
    if (sub_0205B8D0(behavior)) {
        return 5;
    }
    if (MetatileBehavior_IsSurfableWater(behavior)) {
        return 7;
    }
    if (battleBg < NELEMS(_020FC4C0)) {
        return _020FC4C0[battleBg];
    }

    GF_ASSERT(0);
    return NELEMS(_020FC4C0) + 1;
}

static void sub_02052504(BattleSetup* setup, FieldSystem* fieldSystem) {
    PlayerSaveData* player = LocalFieldData_GetPlayer(Save_LocalFieldData_Get(fieldSystem->saveData));
    setup->battleBg = MapHeader_GetBattleBg(fieldSystem->location->mapId);

    if (player->unk4 == 2) {
        setup->battleBg = 1;
    }

    setup->unk_150 = sub_02052470(fieldSystem, setup->battleBg);
}

void sub_02052544(BattleSetup* setup) {
    setup->unk_150 = 7;
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

void BattleSetup_SetAllySideBattlersToPlayer(BattleSetup* setup) {
    setup->trainer[BATTLER_PLAYER].trainerClass = PlayerProfile_GetTrainerGender(setup->profile[BATTLER_PLAYER]);
    CopyU16StringArray(setup->trainer[BATTLER_PLAYER].name, PlayerProfile_GetNamePtr(setup->profile[BATTLER_PLAYER]));
    setup->trainer[BATTLER_PLAYER2] = setup->trainer[BATTLER_PLAYER];
}
