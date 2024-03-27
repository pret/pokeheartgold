#ifndef POKEHEARTGOLD_OVERLAY_80_022340E8
#define POKEHEARTGOLD_OVERLAY_80_022340E8

#include "save.h"

typedef struct ArcadeScriptData {
    u32 unk0[2];
    u32 unk8;
    BattleSetup *battleSetup;
    u8 unk10;
    u8 unk11;
    u8 unk12;
    u8 unk13;
    u32 unk14;
    u32 unk18;
    u8 unk1C;
    u8 unk1D;
    u16 unk1F;
    u32 unk20;
    u32 unk24;
    BOOL unk28;
    u8 unk2C[0x44];
    Party *party;
    u8 unk74[0x20];
    u32 unk94[4];
    u32 unkA4[4];
    u32 unkB4[4];
    u32 unkC4[4];
    u32 unkD4[4];
    u32 unkE4[4];
} ArcadeScriptData;

u32 BattleArcadeData_Alloc(SaveData *saveData, u32 a1, u8 a2, u32 a3, u32 a4, u32 a5, u32 a6);
void BattleArcadeData_Init(void *a0, u32 a1);
void BattleArcadeData_Free(void *a0);
u8 BattleArcade_GetWonBattlePoints(ArcadeScriptData *a0, Party *a1, Party *a2, int a3);
void ov80_02235364(Party *a0, Party *a1, int a2, int a3);
int ov80_02237D8C(u8 a0);

#endif
