#include "global.h"
#include "battle/battle_setup.h"
#include "system.h"
#include "gf_rtc.h"
#include "msgdata.h"
#include "msgdata/msg/msg_0445.h"
#include "unk_02035900.h"
#include "unk_02055418.h"
#include "constants/battle.h"

void BattleSetup_SetParty(BattleSetup* setup, Party* party, int battlerId);
void BattleSetup_SetProfile(BattleSetup* setup, PlayerProfile* profile, int battlerId);
void BattleSetup_SetChatotVoiceClip(BattleSetup* setup, SOUND_CHATOT* chatot, int battlerId);
void sub_02052504(BattleSetup* setup, FieldSystem* fsys);
void sub_02052580(BattleSetup* setup);

BattleSetup* BattleSetup_New(HeapID heapId, u32 battleTypeFlags) {
    int i;
    BattleSetup* setup = AllocFromHeap(heapId, sizeof(BattleSetup));
    MI_CpuClear8(setup, sizeof(BattleSetup));
    setup->flags = battleTypeFlags;
    setup->unk_18C = 0;
    setup->winFlag = 0;
    setup->unk_14C = 0;
    setup->unk_150 = 24;
    setup->unk_154 = 0;
    setup->unk_15C = 0;
    setup->evolutionLocation = 0;
    setup->unk_164 = 1;
    setup->unk_168 = 1;
    setup->unk_174 = 0;
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

BattleSetup* BattleSetup_New_Tutorial(HeapID heapId, FieldSystem* fsys) {
    PlayerProfile* profile = Save_PlayerData_GetProfileAddr(fsys->savedata);
    OPTIONS* options = Save_PlayerData_GetOptionsAddr(fsys->savedata);
    BattleSetup* setup = BattleSetup_New(heapId, BATTLE_TYPE_TUTORIAL);
    setup->saveData = fsys->savedata;
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
    sub_02052504(setup, fsys);
    Options_Copy(options, setup->options);
    setup->unk_15C = Field_GetTimeOfDay(fsys);
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
    setup->unk_114 = GetStoragePCPointer(fsys->savedata);
    setup->unk_10C = fsys->unk94;
    setup->unk1B8 = NULL;
    setup->gameStats = Save_GameStats_Get(fsys->savedata);
    setup->unk_158 = fsys->location->mapId;
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
