#ifndef POKEHEARTGOLD_OVERLAY_12_0224E4FC_H
#define POKEHEARTGOLD_OVERLAY_12_0224E4FC_H

#include "battle.h"

void BattleSystem_GetBattleMon(BattleSystem *bsys, BATTLECONTEXT *ctx, int battlerId, u8 monIndex);
void BattleSystem_ReloadMonData(BattleSystem *bsys, BATTLECONTEXT *ctx, int battlerId, int monIndex);
void ReadBattleScriptFromNarc(BATTLECONTEXT *ctx, NarcId narcId, int fileId);

//The following functions haven't been decompiled as of now
void ov12_02256F78(BattleSystem *bsys, BATTLECONTEXT *ctx, int battlerId, u8 monIndex);
void Link_CheckTimeout(BATTLECONTEXT *ctx);
int GetBattlerVar(BATTLECONTEXT *ctx, int battlerId, u32 varId, int a3);
void SetBattlerVar(BATTLECONTEXT *ctx, int battlerId, u32 varId, int *data);
void BattleSystem_ClearExperienceEarnFlags(BATTLECONTEXT *ctx, int battlerId);
void BattleSystem_SetExperienceEarnFlags(BattleSystem *bsys, BATTLECONTEXT *ctx, int battlerId);
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
int GetNaturalGiftPower(BATTLECONTEXT *ctx, int battlerId);
int GetNaturalGiftType(BATTLECONTEXT *ctx, int battlerId);
BOOL CanEatOpponentBerry(BattleSystem *bsys, BATTLECONTEXT *ctx, int battlerId);
BOOL CanFling(BattleSystem *bsys, BATTLECONTEXT *ctx, int battlerId);
BOOL CheckLegalMetronomeMove(BattleSystem *bsys, BATTLECONTEXT *ctx, int battlerId, u16 moveNo);
BOOL CheckLegalMeFirstMove(BATTLECONTEXT *ctx, u16 move);
BOOL CheckLegalMimicMove(u16 move);
BOOL IsMoveEncored(BATTLECONTEXT *ctx, u16 move);
void CheckIgnorePressure(BATTLECONTEXT *ctx, int battlerIdA, int battlerIdB);
u8 ov12_0225682C(BATTLECONTEXT *ctx, int a1);
int CalculateTypeEffectiveness(int typeAttack, u8 typeDef1, u8 typeDef2);
BOOL BattleTryRun(BattleSystem *bsys, BATTLECONTEXT *ctx, int battlerId);
BOOL CheckAbilityEffectOnHit(BattleSystem *bsys, BATTLECONTEXT *ctx, int *work);
BOOL CheckItemEffectOnHit(BattleSystem *bsys, BATTLECONTEXT *ctx, int *itemWork);
int BattleSystem_GetHeldItemDamageBoost(BATTLECONTEXT *ctx, int battlerId, int a2);
BOOL CheckNaturalCureOnSwitch(BATTLECONTEXT *ctx, int ability, int status);
int ov12_02253DA0(BattleSystem *bsys, BATTLECONTEXT *ctx, int battlerId);
BOOL CheckItemEffectOnUTurn(BattleSystem *bsys, BATTLECONTEXT *ctx, int *work);
BOOL ov12_0224EC74(BATTLECONTEXT *ctx);
void ov12_0224EBDC(BATTLECONTEXT *ctx, int a1, int adrs);
void ov12_02250A18(BattleSystem *bsys, BATTLECONTEXT *ctx, int battlerId, u16 a3);
u32 BattleSys_GetBattleType(BattleSystem *bsys);
u32 BattleSys_GetBattleFlags(BattleSystem *bsys);
u32 ov12_02257C5C(BattleSystem *bsys, BATTLECONTEXT *ctx, int battlerIdAttacker, int battlerIdTarget, int critCnt, u32 a5);
u32 ov12_022581D4(BattleSystem *bsys, BATTLECONTEXT *ctx, u32 a2, int battlerId);
u32 GetItemHoldEffect(BATTLECONTEXT *ctx, int item, u32 a3);
u32 ov12_0223C24C(PARTY *party, u32 *a1);
BOOL CheckStatusEffectsSubstitute(BATTLECONTEXT *ctx, int battlerId, u32 status);
u32 StruggleCheck(BattleSystem *bsys, BATTLECONTEXT *ctx, int battlerId, u32 nonSelectableMoves, u32 a4);
BOOL ov12_02252700(BattleSystem *bsys, BATTLECONTEXT *ctx, int battlerId);
BOOL WhirlwindCheck(BattleSystem *bsys, BATTLECONTEXT *ctx);
BOOL ov12_0225275C(BATTLECONTEXT *ctx, int battlerId);
int ov12_0223AB0C(BattleSystem *bsys, int battlerId);
int ov12_02251D28(BattleSystem *bsys, BATTLECONTEXT *ctx, int moveNo, int moveType, int battlerIdAttacker, int battlerIdTarget, int dmg, u32 *statusFlag);
BOOL ov12_02252C40(BATTLECONTEXT *ctx, int battlerId);
void ov12_02252D14(BattleSystem *bsys, BATTLECONTEXT *ctx);

#endif
