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
#include "msgdata/msg.naix"
#include "constants/battle.h"

void BattleSetup_SetParty(BattleSetup* setup, Party* party, int battlerId);
void BattleSetup_SetProfile(BattleSetup* setup, PlayerProfile* profile, int battlerId);
void BattleSetup_SetChatotVoiceClip(BattleSetup* setup, SOUND_CHATOT* chatot, int battlerId);
void sub_02052504(BattleSetup* setup, FieldSystem* fieldSystem);
void sub_02052580(BattleSetup* setup);

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
    for (i = 0; i < 4; ++i) {
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
    setup->unk_194 = NULL;
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
    PlayerProfile* profile = Save_PlayerData_GetProfileAddr(fieldSystem->savedata);
    OPTIONS* options = Save_PlayerData_GetOptionsAddr(fieldSystem->savedata);
    BattleSetup* setup = BattleSetup_New(heapId, BATTLE_TYPE_TUTORIAL);
    setup->saveData = fieldSystem->savedata;
    {
    MsgData* msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0445_bin, heapId);
    {
    String* name = String_New(PLAYER_NAME_LENGTH + 1, heapId);
    ReadMsgDataIntoString(msgData, PlayerProfile_GetTrainerGender(profile) ^ 1, name);
    Save_Profile_PlayerName_Set(setup->profile[0], String_cstr(name));
    String_Delete(name);
    }
    DestroyMsgData(msgData);
    }
    PlayerProfile_SetTrainerGender(setup->profile[0], PlayerProfile_GetTrainerGender(profile) ^ 1);
    sub_02052504(setup, fieldSystem);
    Options_Copy(options, setup->options);
    setup->timeOfDay = Field_GetTimeOfDay(fieldSystem);
    Bag_AddItem(setup->bag, ITEM_POKE_BALL, 20, heapId);
    {
    Pokemon* pokemon = AllocMonZeroed(heapId);
    CreateMon(pokemon, SPECIES_MARILL, 5, 32, FALSE, 0, OT_ID_RANDOM_NO_SHINY, 0);
    Party_AddMon(setup->party[0], pokemon);
    CreateMon(pokemon, SPECIES_RATTATA, 2, 32, FALSE, 0, OT_ID_RANDOM_NO_SHINY, 0);
    Party_AddMon(setup->party[1], pokemon);
    FreeToHeap(pokemon);
    }
    setup->unk1CC[0] = 0;
    setup->storagePC = GetStoragePCPointer(fieldSystem->savedata);
    setup->unk_10C = fieldSystem->unk94;
    setup->unk1B8 = NULL;
    setup->gameStats = Save_GameStats_Get(fieldSystem->savedata);
    setup->mapNumber = fieldSystem->location->mapId;
    sub_02052580(setup);
    return setup;
}

void BattleSetup_Delete(BattleSetup* setup) {
    int i;

    for (i = 0; i < 4; ++i) {
        GF_ASSERT(setup->party[i] != NULL);
        FreeToHeap(setup->party[i]);
    }
    
    for (i = 0; i < 4; ++i) {
        GF_ASSERT(setup->profile[i] != NULL);
        FreeToHeap(setup->profile[i]);
    }
    
    for (i = 0; i < 4; ++i) {
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
    GF_ASSERT(battlerId < 4);
    GF_ASSERT(Party_AddMon(setup->party[battlerId], mon));
}

void BattleSetup_SetParty(BattleSetup* setup, Party* party, int battlerId) {
    GF_ASSERT(battlerId < 4);
    Party_Copy(party, setup->party[battlerId]);
}

void BattleSetup_SetProfile(BattleSetup* setup, PlayerProfile* profile, int battlerId) {
    GF_ASSERT(battlerId < 4);
    PlayerProfile_Copy(profile, setup->profile[battlerId]);
}

void BattleSetup_SetChatotVoiceClip(BattleSetup* setup, SOUND_CHATOT* chatot, int battlerId) {
    Chatot_Copy(setup->chatot[battlerId], chatot);
}

void sub_02051D18(BattleSetup* setup, FieldSystem* fieldSystem, SaveData* savedata, u32 mapno, void* arg4, void* arg5) {
    PlayerProfile* profile; // sp1C
    Party* party; // sp18
    Bag* bag; // sp14
    Pokedex* pokedex; // sp10
    SOUND_CHATOT* chatot; // spC
    OPTIONS* options; // sp8
    LocalFieldData* local; // sp4
    BOOL forceNite;
    u32 battle_bg;

    profile = Save_PlayerData_GetProfileAddr(savedata);
    party = SaveArray_Party_Get(savedata);
    bag = Save_Bag_Get(savedata);
    pokedex = Save_Pokedex_Get(savedata);
    chatot = Save_Chatot_Get(savedata);
    options = Save_PlayerData_GetOptionsAddr(savedata);
    local = Save_LocalFieldData_Get(savedata);

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
            setup->unk1CC[0] = Save_GetPartyLeadAlive(savedata);
        }
    } else {
        setup->battleBg = MapHeader_GetBattleBg(mapno);
        setup->unk_150 = 9;
        setup->timeOfDay = GF_RTC_GetTimeOfDayByHour(Save_SysInfo_RTC_Get(savedata)->time.hour);
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
    setup->storagePC = GetStoragePCPointer(savedata);
    setup->mapSection = MapHeader_GetMapSec(mapno);
    setup->evolutionLocation = MapHeader_GetMapEvolutionMethod(mapno);
    setup->unk_164 = sub_02088288(savedata);
    setup->metBill = CheckMetBill(Save_VarsFlags_Get(savedata));
    if (MomSavingsBalanceAction(SaveData_GetMomsSavingsAddr(savedata), MOMS_BALANCE_GET, 0) < 999999) {
        setup->momsSavingsActive = Save_VarsFlags_MomsSavingsFlagCheck(Save_VarsFlags_Get(savedata));
    } else {
        setup->momsSavingsActive = FALSE;
    }
    setup->weatherType = LocalFieldData_GetWeatherType(local);
    setup->unk_10C = arg4;
    setup->unk1B8 = arg5;
    setup->unk_12C = sub_0202CA44(savedata);
    setup->gameStats = Save_GameStats_Get(savedata);
    setup->palPad = Save_PalPad_Get(savedata);
    setup->mapNumber = mapno;
    setup->saveData = savedata;
}

void BattleSetup_InitFromFieldSystem(BattleSetup* setup, FieldSystem *fieldSystem) {
    sub_02051D18(setup, fieldSystem, fieldSystem->savedata, fieldSystem->location->mapId, fieldSystem->unk94, fieldSystem->unkB0);
    sub_02052580(setup);
}

void BattleSetup_InitForFixedLevelFacility(BattleSetup* setup, FieldSystem *fieldSystem, int level) {
    PlayerProfile* profile; // r4
    Party* party; // sp14
    Bag* bag; // sp10
    Pokedex* pokedex; // spC
    SOUND_CHATOT* chatot; // sp8
    OPTIONS* options; // sp4

    profile = Save_PlayerData_GetProfileAddr(fieldSystem->savedata);
    party = SaveArray_Party_Get(fieldSystem->savedata);
    bag = Save_Bag_Get(fieldSystem->savedata);
    pokedex = Save_Pokedex_Get(fieldSystem->savedata);
    chatot = Save_Chatot_Get(fieldSystem->savedata);
    options = Save_PlayerData_GetOptionsAddr(fieldSystem->savedata);

    setup->battleBg = 6;
    setup->unk_150 = 9;
    BattleSetup_SetProfile(setup, profile, BATTLER_PLAYER);

    Pokemon* pokemon = AllocMonZeroed(HEAP_ID_FIELD);
    Party_InitWithMaxSize(setup->party[BATTLER_PLAYER], Party_GetCount(party));
    for (int i = 0; i < Party_GetCount(party); ++i) {
        CopyPokemonToPokemon(Party_GetMonByIndex(party, i), pokemon);
        if (level != GetMonData(pokemon, MON_DATA_LEVEL, NULL) && level != 0) {
            int exp = GetMonExpBySpeciesAndLevel(GetMonData(pokemon, MON_DATA_SPECIES, NULL), level);
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
    setup->storagePC = GetStoragePCPointer(fieldSystem->savedata);
    setup->timeOfDay = Field_GetTimeOfDay(fieldSystem);
    setup->unk_10C = fieldSystem->unk94;
    setup->unk1B8 = fieldSystem->unkB0;
    setup->unk_12C = sub_0202CA44(fieldSystem->savedata);
    setup->gameStats = Save_GameStats_Get(fieldSystem->savedata);
    setup->palPad = Save_PalPad_Get(fieldSystem->savedata);
    setup->mapNumber = fieldSystem->location->mapId;
    setup->saveData = fieldSystem->savedata;
    sub_02052580(setup);
}
