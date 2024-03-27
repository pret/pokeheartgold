#ifndef POKEHEARTGOLD_OVERLAY_80_022340E8
#define POKEHEARTGOLD_OVERLAY_80_022340E8

#include "save.h"

typedef struct ArcadeContext {
    u32 unk0[2];
    u32 unk8;
    BattleSetup *battleSetup;
    u8 unk10;
    u8 unk11;
    u8 randomFlag;
    u8 unk13;
    u32 weather;
    u16 winstreak;
    u16 unk1A;
    u8 cursorSpeed;
    u8 bpGain;
    u8 unk1E;
    u8 unk1F;
    u16 unk20;
    u16 unk22;
    u32 unk24;
    BOOL isBattleWin;
    u8 unk2C[0x44];
    Party *playerParty;
    Party *opponentParty;
    u8 unk74[0x1C];
    u32 savedHp[4];
    u32 savedAtk[4];
    u32 savedDef[4];
    u32 savedSpd[4];
    u32 savedSpAtk[4];
    u32 savedSpDef[4];
    u8 unkF4[0x984];
    u16 multiWinstreak;
} ArcadeContext;

u32 BattleArcadeData_Alloc(SaveData *saveData, u32 a1, u8 a2, u32 a3, u32 a4, u32 a5, u32 a6);
void BattleArcadeData_Init(void *a0, u32 a1);
void BattleArcadeData_Free(void *a0);
u8 BattleArcade_GetWonBattlePoints(ArcadeContext *a0, Party *a1, Party *a2, int a3);
void ov80_02235364(Party *a0, Party *a1, int a2, int a3);
int ov80_02237D8C(u8 a0);

#endif
