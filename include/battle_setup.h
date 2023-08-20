#ifndef POKEHEARTGOLD_BATTLE_SETUP_H
#define POKEHEARTGOLD_BATTLE_SETUP_H

#include "field_system.h"
#include "party.h"
#include "player_data.h"
#include "trainer_data.h"

struct BATTLE_SETUP { //declared in trainer_data.h
    u32 flags;
    Party *party[4];
    u32 winFlag;
    int trainerId[4];
    TRAINER trainer[4];
    PlayerProfile *profile[4];
    void *unk48;
    void *unk4C;
    void *unk50;
    void *unk54;
    void *unk58[4];
    void *unk68;
    void *unk6C;
    void *unk70;
    void *unk74;
    void *unk78;
    void *unk7C;
    int unk80;
    int unk84;
    int unk88;
    int unk8C;
    int unk90;
    int unk94;
    int unk98;
    int unk9C;
    int evolutionLocation;
    int unkA4;
    int unkA8;
    u32 unkAC[3];
    int levelUpFlag;
    u32 unkBC;
    int unkC0;
    u32 unkC4;
    void *unkC8;
    u32 unkCC;
    int unkD0[4];
    u16 unkE0;
    u8 unkE2;
    u8 unkE3;
    int unkE4;
    void *unkE8;
    u8 unkEC[4];
    u16 unk1B0;
    u8 unk1B2;
    u8 unk1B3;
    u32 unk1B4;
    int unk1B8;
    int unk1BC;
    int unk1C0;
    int unk1C4;
    int unk1C8;
    u8 unk1CC;
    u8 unk1CD;
    u8 unk1CE;
    u8 unk1CF;
};

BOOL IsBattleResultWin(u32 a0);
int sub_02052564(u32 a0);
int sub_02052574(u32 a0);
void BattleSetup_Delete(BATTLE_SETUP *setup);
BATTLE_SETUP *sub_02051AAC(HeapID heapId, FieldSystem *fsys);
void sub_02052444(BATTLE_SETUP *setup, FieldSystem *fsys);
void BattleSetup_InitFromFsys(BATTLE_SETUP *setup, FieldSystem *fsys);
BATTLE_SETUP *BattleSetup_New(HeapID heapId, u32 battleFlags);
void sub_020522F0(BATTLE_SETUP *setup, FieldSystem *fsys, void *a1);
void sub_02051F2C(BATTLE_SETUP *setup, FieldSystem *fsys, int level);
void sub_020520B0(BATTLE_SETUP *setup, FieldSystem *fsys, Party *party, void *a4);
BATTLE_SETUP* BattleSetup_New_PalPark(HeapID heapId, int monsRemaining);
void BattleSetup_AddMonToParty(BATTLE_SETUP* setup, Pokemon* mon, int battler);

#endif //POKEHEARTGOLD_BATTLE_SETUP_H
