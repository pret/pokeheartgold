#ifndef POKEHEARTGOLD_OVERLAY_80_022340E8
#define POKEHEARTGOLD_OVERLAY_80_022340E8

#include "frontier/frontier_map.h"
#include "frontier/overlay_80_02229EE0.h"

#include "battle_arcade_game_board.h"
#include "save.h"

typedef struct ArcadeContext {
    u32 unk0[2];
    u32 unk8;
    BattleSetup *battleSetup;
    u8 type;
    u8 unk11;
    u8 randomFlag;
    u8 unk13;
    u32 weather;
    u16 winStreak;
    u16 unk1A;
    u8 cursorSpeed;
    u8 bpGain;
    u8 unk1E;
    u8 unk1F;
    u16 unk20;
    u16 unk22;
    u32 unk24;
    BOOL battleWon;
    u8 unk2C[0x3];
    u8 unkF;
    ManagedSprite *unk30[4];
    ManagedSprite *unk40[4];
    ManagedSprite *unk50[4];
    ManagedSprite *unk60[4];
    Party *playerParty;
    Party *opponentParty;
    u16 unk74[14];
    u32 savedHp[4];
    u32 savedAtk[4];
    u32 savedDef[4];
    u32 savedSpd[4];
    u32 savedSpAtk[4];
    u32 savedSpDef[4];
    FrontierTrainerData unkF4[2];
    u16 unk314[4];
    u8 unk31C[4];
    u32 unk320[4];
    void *unk330[1];
    u8 unk334[0xDE];
    u16 unk412[0x3];
    u16 unk418[0x32D];
    u8 unkA72;
    u8 unkA73;
    u8 unkA74;
    u8 unkA75;
    u8 unkA76;
    u8 unkA77;
    u16 multiWinStreak;
    u8 unkA7A;
    u8 unkA7B;
    u8 unkA7C;
} ArcadeContext;

u32 BattleArcadeData_Alloc(SaveData *saveData, u32 a1, u8 a2, u32 a3, u32 a4, u32 a5, u16 *a6);
void BattleArcadeData_Init(void *a0, u32 a1);
void BattleArcadeData_Free(void *a0);
u8 BattleArcade_GetWonBattlePoints(ArcadeContext *ctx, Party *playerParty, Party *opponentParty, int a3);
void ov80_02235364(Party *party, Party *playerParty, int a2, int a3);
int ov80_02237D8C(u8 a0);
void ov80_02234550(void *a0, GAME_BOARD_ARGS *args);
void BattleArcade_SetPartyBeforeBattle(ArcadeContext *ctx);
void BattleArcade_SetPartyAfterBattle(ArcadeContext *ctx);
void ov80_02234588(ArcadeContext *ctx, u32 a1);
u32 ov80_02234764(ArcadeContext *ctx);
u32 ov80_02234774(ArcadeContext *ctx, u8 a0);
void ov80_022347B8(ArcadeContext *ctx);
void ov80_022347C4(ArcadeContext *ctx);
u32 ov80_02234770(ArcadeContext *ctx);
void ov80_02234A74(ArcadeContext *ctx, FrontierMap *map, u32 a2);
void ov80_02234B24(ArcadeContext *ctx, FrontierMap *map, u32 a2);
void ov80_02234BEC(ArcadeContext *ctx, FrontierMap *map, u32 a2);
void ov80_02234CB0(ArcadeContext *ctx, FrontierMap *map, u32 a2);
void ov80_02234968(ArcadeContext *ctx, FrontierMap *map);
void ov80_02234A38(ArcadeContext *ctx, FrontierMap *map);
u32 ov80_022347A8(ArcadeContext *ctx, u32 a1);
void ov80_02234B7C(ArcadeContext *ctx, FrontierMap *map, u32 a2, u32 a3);
void ov80_02234BB4(ArcadeContext *ctx, FrontierMap *map, u32 a2, u32 a3);
void ov80_02234DC4(u32 a0, u32 a1);
u32 ov80_02235324(ArcadeContext *ctx);
u16 ov80_02234E50(ArcadeContext *ctx, u32 a1, u32 a2);
void ov80_02234E98(ArcadeContext *ctx, u8 a1);
void ov80_02234D04(ArcadeContext *ctx, FrontierMap *map, u32 a0, u32 a1, u32 a2);

#endif
