#ifndef POKEHEARTGOLD_BATTLE_SETUP_H
#define POKEHEARTGOLD_BATTLE_SETUP_H

#include "field_system.h"
#include "party.h"
#include "player_data.h"
#include "trainer_data.h"
#include "bag.h"
#include "pokedex.h"
#include "save_arrays.h"
#include "pokemon_storage_system.h"
#include "unk_02067A60.h"
#include "game_stats.h"
#include "gf_rtc.h"
#include "map_header.h"
#include "save_palpad.h"
#include "constants/battle.h"

struct BattleSetupSub_138 {
    int unk_0;
    int unk_4;
    int unk_8;
};

struct BattleSetup { //declared in trainer_data.h
    u32 flags; // 0
    Party* party[BATTLER_MAX]; // 4
    int winFlag; // 14
    int trainerId[BATTLER_MAX]; // 18
    TRAINER trainer[BATTLER_MAX]; // 28
    PlayerProfile *profile[BATTLER_MAX]; // f8
    Bag* bag; // 108
    void* unk_10C;
    Pokedex* pokedex; // 110
    PC_STORAGE* storagePC; // 114
    SOUND_CHATOT* chatot[BATTLER_MAX]; // 118
    void* unk_128;
    void* unk_12C;
    OPTIONS* options; // 130
    struct UnkStruct_02067A60* unk_134;
    struct BattleSetupSub_138 unk138;
    GAME_STATS* gameStats; // 144
    SavePalPad* palPad; // 148
    u32 battleBg; // 14C
    u32 unk_150;
    u32 mapSection; // 154
    u32 mapNumber; // 158
    TIMEOFDAY timeOfDay; // 15C
    u32 evolutionLocation; // 160
    u32 unk_164;
    u32 metBill; // 168
    int momsSavingsActive; // 16C
    u32 unk_170;
    u32 weatherType; // 174
    int levelUpFlag; // 178
    u8 filler_17C[0x10];
    u32 unk_18C;
    int safariBalls; // 190
    int unk_194;
    u8 filler_198[4];
    int unk_19C;
    int unk_1A0[4];
    u16 unk1B0;
    u8 unk1B2;
    u8 unk1B3;
    int unk1B4;
    void* unk1B8;
    int unk1BC;
    SaveData* saveData; // 1c0
    int unk1C4;
    Pokemon* bugContestMon; // 1c8
    u8 unk1CC[BATTLER_MAX];
    BOOL unk_1D0;
};

BattleSetup* BattleSetup_New(HeapID heapId, u32 battleFlags);
BattleSetup* BattleSetup_New_SafariZone(HeapID heapId, int balls);
BattleSetup* BattleSetup_New_BugContest(HeapID heapId, int balls, Pokemon* bugmon);
BattleSetup* BattleSetup_New_PalPark(HeapID heapId, int balls);
BattleSetup* BattleSetup_New_Tutorial(HeapID heapId, FieldSystem *fieldSystem);
void BattleSetup_Delete(BattleSetup* setup);
void BattleSetup_AddMonToParty(BattleSetup* setup, Pokemon* mon, int battler);
void sub_02051D18(BattleSetup* setup, FieldSystem* fieldSystem, SaveData* savedata, u32 mapno, void* arg4, void* arg5);
void BattleSetup_InitFromFieldSystem(BattleSetup* setup, FieldSystem *fieldSystem);
void BattleSetup_InitForFixedLevelFacility(BattleSetup* setup, FieldSystem *fieldSystem, int level);
void sub_020520B0(BattleSetup* setup, FieldSystem *fieldSystem, Party *party, u8 *a4);
void sub_020522F0(BattleSetup* setup, FieldSystem *fieldSystem, void *a1);
void sub_0205239C(BattleSetup* setup, FieldSystem* fieldSystem);
void sub_02052444(BattleSetup* setup, FieldSystem* fieldSystem);
void sub_02052544(BattleSetup* setup);
BOOL IsBattleResultWin(u32 a0);
BOOL IsBattleResultStaticWildWin(u32 a0);
BOOL IsBattleResultLatiCaught(u32 a0);
void BattleSetup_SetAllySideBattlersToPlayer(BattleSetup* setup);

#endif //POKEHEARTGOLD_BATTLE_SETUP_H
