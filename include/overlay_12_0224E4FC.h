#ifndef POKEHEARTGOLD_OVERLAY_12_0224E4FC_H
#define POKEHEARTGOLD_OVERLAY_12_0224E4FC_H

#include "battle.h"

void Link_CheckTimeout(BATTLECONTEXT *ctx);
int GetBattlerVar(BATTLECONTEXT *ctx, int battlerId, u32 varId, int a3);
void SetBattlerVar(BATTLECONTEXT *ctx, int battlerId, u32 varId, int *data);
void ov12_02250360(BATTLECONTEXT *ctx, int battlerId);
void ov12_02250370(BattleSystem *bsys, BATTLECONTEXT *ctx, int battlerId);
int ov12_022506D4(BattleSystem *bsys, BATTLECONTEXT *ctx, int battlerId, u16 move, int a4, int a5);
void CopyBattleMonToPartyMon(BattleSystem *bsys, BATTLECONTEXT *ctx, int battlerId);
void LockBattlerIntoCurrentMove(BattleSystem *bsys, BATTLECONTEXT *ctx, int battlerId);
void UnlockBattlerOutOfCurrentMove(BattleSystem *bsys, BATTLECONTEXT *ctx, int battlerId);
void InitSwitchWork(BattleSystem *bsys, BATTLECONTEXT *ctx, int battlerId);
void InitFaintedWork(BattleSystem *bsys, BATTLECONTEXT *ctx, int battlerId);
BOOL CheckBattlerAbilityIfNotIgnored(BATTLECONTEXT *ctx, int battlerIdAttacker, int battlerIdTarget, u32 ability);
int BattleMon_GetMoveIndex(BATTLEMON *mon, int move);
int GetMonsHitCount(BattleSystem *bsys, BATTLECONTEXT *ctx, int a2, int battlerId);
int CreateNicknameTag(BATTLECONTEXT *ctx, int battlerId);
BOOL CheckAbilityActive(BattleSystem *bsys, BATTLECONTEXT *ctx, int a2, int a3, int ability);
u16 GetBattlerSelectedMove(BATTLECONTEXT *ctx, int battlerId);
int BattleCtx_IsIdenticalToCurrentMove(BATTLECONTEXT *ctx, int moveNo);
BOOL ov12_0225260C(BattleSystem *bsys, int a1, u8 *type1, u8 *typeB, u8 *val);
BOOL ov12_02252698(u16 moveNo);
BOOL CanSwitchMon(BattleSystem *bsys, BATTLECONTEXT *ctx, int battlerId);
BOOL CanEscape(BattleSystem *bsys, BATTLECONTEXT *ctx, int battlerId, int a3);
int DamageDivide(int numerator, int denominator);
u32 GetBattlerAbility(BATTLECONTEXT *ctx, int battlerId);
u32 GetBattlerHeldItemEffect(BATTLECONTEXT *ctx, int battlerId);
int GetBattlerLearnedMoveCount(BattleSystem *bsys, BATTLECONTEXT *ctx, int battlerId);
int CalcMoveDamage(BattleSystem *bsys, BATTLECONTEXT *ctx, u32, u32, u32, u16, u8, u8, u8, u8);
u16 GetBattlerHeldItem(BATTLECONTEXT *ctx, int battlerId);
BOOL ov12_0225561C(BATTLECONTEXT *ctx, int battlerId);
int ov12_02257C30(BattleSystem *bsys, BATTLECONTEXT *ctx, int a2);
BOOL CheckLegalMetronomeMove(BattleSystem *bsys, BATTLECONTEXT *ctx, int battlerId, u16 moveNo);
BOOL CheckLegalMeFirstMove(BATTLECONTEXT *ctx, u16 move);
BOOL CheckLegalMimicMove(u16 move);
BOOL IsMoveEncored(BATTLECONTEXT *ctx, u16 move);
void CheckIgnorePressure(BATTLECONTEXT *ctx, int battlerIdA, int battlerIdB);

#endif
