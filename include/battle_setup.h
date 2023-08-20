#ifndef POKEHEARTGOLD_BATTLE_SETUP_H
#define POKEHEARTGOLD_BATTLE_SETUP_H

#include "field_system.h"
#include "party.h"
#include "player_data.h"
#include "trainer_data.h"
#include "bag.h"
#include "pokedex.h"

struct BattleSetupSub_138 {
    int unk_0;
    int unk_4;
    int unk_8;
};

struct BATTLE_SETUP { //declared in trainer_data.h
    u32 flags;
    PARTY *party[4]; // 4
    int winFlag; // 14
    int trainerId[4]; // 18
    TRAINER trainer[4]; // 28
    PlayerProfile *profile[4]; // f8
    Bag* bag; // 108
    void* unk_10C;
    Pokedex* pokedex; // 110
    void* unk_114;
    SOUND_CHATOT* chatot[4]; // 118
    void* unk_128;
    void* unk_12C;
    OPTIONS* options;
    void* unk_134;
    struct BattleSetupSub_138 unk138;
    void* unk_144;
    int unk_148;
    u32 unk_14C;
    u32 unk_150;
    u32 unk_154;
    u32 unk_158;
    u32 unk_15C;
    u32 evolutionLocation;
    u32 unk_164;
    u32 unk_168;
    int unk_16C;
    u32 unk_170;
    u32 unk_174;
    int levelUpFlag;
    u8 filler_17C[0x10];
    u32 unk_18C;
    int unk_190;
    void* unk_194;
    u8 filler_198[4];
    int unk_19C;
    int unk_1A0[4];
    u16 unk1B0;
    u8 unk1B2;
    u8 unk1B3;
    int unk1B4;
    void* unk1B8;
    int unk1BC;
    int unk1C0;
    int unk1C4;
    Pokemon* unk1C8;
    u8 unk1CC[4];
    u8 filler_1D0[4];
};

BOOL IsBattleResultWin(u32 a0);
int sub_02052564(u32 a0);
int sub_02052574(u32 a0);
void BattleSetup_Delete(BATTLE_SETUP *setup);
BATTLE_SETUP *BattleSetup_New_Tutorial(HeapID heapId, FieldSystem *fsys);
void sub_02052444(BATTLE_SETUP *setup, FieldSystem *fsys);
void BattleSetup_InitFromFsys(BATTLE_SETUP *setup, FieldSystem *fsys);
BATTLE_SETUP *BattleSetup_New(HeapID heapId, u32 battleFlags);
void sub_020522F0(BATTLE_SETUP *setup, FieldSystem *fsys, void *a1);
void sub_02051F2C(BATTLE_SETUP *setup, FieldSystem *fsys, int level);
void sub_020520B0(BATTLE_SETUP *setup, FieldSystem *fsys, PARTY *party, void *a4);
BATTLE_SETUP* BattleSetup_New_PalPark(HeapID heapId, int monsRemaining);
void BattleSetup_AddMonToParty(BATTLE_SETUP* setup, Pokemon* mon, int battler);

#endif //POKEHEARTGOLD_BATTLE_SETUP_H
