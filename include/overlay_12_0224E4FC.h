#ifndef POKEHEARTGOLD_OVERLAY_12_0224E4FC_H
#define POKEHEARTGOLD_OVERLAY_12_0224E4FC_H

#include "battle.h"

void ov12_0224ED9C(BATTLECONTEXT *ctx);
int GetBattlerVar(BATTLECONTEXT *ctx, int battlerId, u32 varId, int a3);
void SetBattlerVar(BATTLECONTEXT *ctx, int battlerId, u32 varId, int *data);
void ov12_02250360(BATTLECONTEXT *ctx, int battlerId);
void ov12_02250370(BattleSystem *bsys, BATTLECONTEXT *ctx, int battlerId);
int ov12_022506D4(BattleSystem *bsys, BATTLECONTEXT *ctx, int battlerId, u16 move, int a4, int a5);
void ov12_02250C40(BattleSystem *bsys, BATTLECONTEXT *ctx, int battlerId);
void ov12_02250C70(BattleSystem *bsys, BATTLECONTEXT *ctx, int battlerId);
void ov12_02250CA0(BattleSystem *bsys, BATTLECONTEXT *ctx, int battlerId);
void ov12_022510BC(BattleSystem *bsys, BATTLECONTEXT *ctx, int battlerId);
void ov12_022514C4(BattleSystem *bsys, BATTLECONTEXT *ctx, int battlerId);
BOOL CheckBattlerAbilityIfNotIgnored(BATTLECONTEXT *ctx, int battlerIdAttacker, int battlerIdTarget, u32 ability);
int BattleMon_GetMoveIndex(BATTLEMON *mon, int move);
int ov12_02252260(BattleSystem *bsys, BATTLECONTEXT *ctx, int a2, int battlerId);
int ov12_022522E0(BATTLECONTEXT *ctx, int battlerId);
u16 ov12_022522F0(BATTLECONTEXT *ctx, int battlerId);
int ov12_022525AC(BATTLECONTEXT *ctx, int moveNo);
BOOL ov12_0225260C(BattleSystem *bsys, int a1, u8 *type1, u8 *typeB, u8 *val);
int ov12_02252698(int moveNo);
int ov12_02253178(int numerator, int denominator);
u32 GetBattlerAbility(BATTLECONTEXT *ctx, int battlerId);
u32 GetBattlerHeldItemEffect(BATTLECONTEXT *ctx, int battlerId);
int ov12_02256FF8(BattleSystem *bsys, BATTLECONTEXT *ctx, u32, u32, u32, u16, u8, u8, u8, u8);
int ov12_02257C30(BattleSystem *bsys, BATTLECONTEXT *ctx, int a2);
BOOL CheckLegalMetronomeMove(BattleSystem *bsys, BATTLECONTEXT *ctx, int battlerId, u16 moveNo);
BOOL ov12_02257DFC(BATTLECONTEXT *ctx, u16 move);
void ov12_02258180(BATTLECONTEXT *ctx, int battlerIdA, int battlerIdB);

#endif
