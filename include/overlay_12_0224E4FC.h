#ifndef POKEHEARTGOLD_OVERLAY_12_0224E4FC_H
#define POKEHEARTGOLD_OVERLAY_12_0224E4FC_H

#include "battle.h"

void BattleSystem_GetBattleMon(BattleSystem *bsys, BATTLECONTEXT *ctx, s32 battlerId, u8 monIndex);
void ov12_02256F78(BattleSystem *bsys, BATTLECONTEXT *ctx, s32 battlerId, u8 monIndex);
void Link_CheckTimeout(BATTLECONTEXT *ctx);
s32 GetBattlerVar(BATTLECONTEXT *ctx, s32 battlerId, u32 varId, s32 a3);
void SetBattlerVar(BATTLECONTEXT *ctx, s32 battlerId, u32 varId, s32 *data);
void BattleSystem_ClearExperienceEarnFlags(BATTLECONTEXT *ctx, s32 battlerId);
void BattleSystem_SetExperienceEarnFlags(BattleSystem *bsys, BATTLECONTEXT *ctx, s32 battlerId);
s32 ov12_022506D4(BattleSystem *bsys, BATTLECONTEXT *ctx, s32 battlerId, u16 move, s32 a4, s32 a5);
void CopyBattleMonToPartyMon(BattleSystem *bsys, BATTLECONTEXT *ctx, s32 battlerId);
void LockBattlerIntoCurrentMove(BattleSystem *bsys, BATTLECONTEXT *ctx, s32 battlerId);
void UnlockBattlerOutOfCurrentMove(BattleSystem *bsys, BATTLECONTEXT *ctx, s32 battlerId);
void InitSwitchWork(BattleSystem *bsys, BATTLECONTEXT *ctx, s32 battlerId);
void InitFaintedWork(BattleSystem *bsys, BATTLECONTEXT *ctx, s32 battlerId);
BOOL CheckBattlerAbilityIfNotIgnored(BATTLECONTEXT *ctx, s32 battlerIdAttacker, s32 battlerIdTarget, u32 ability);
s32 BattleMon_GetMoveIndex(BATTLEMON *mon, s32 move);
s32 GetMonsHitCount(BattleSystem *bsys, BATTLECONTEXT *ctx, s32 a2, s32 battlerId);
s32 CreateNicknameTag(BATTLECONTEXT *ctx, s32 battlerId);
BOOL CheckAbilityActive(BattleSystem *bsys, BATTLECONTEXT *ctx, s32 a2, s32 a3, s32 ability);
u16 GetBattlerSelectedMove(BATTLECONTEXT *ctx, s32 battlerId);
s32 BattleCtx_IsIdenticalToCurrentMove(BATTLECONTEXT *ctx, s32 moveNo);
BOOL ov12_0225260C(BattleSystem *bsys, s32 a1, u8 *type1, u8 *typeB, u8 *val);
BOOL ov12_02252698(u16 moveNo);
BOOL CanSwitchMon(BattleSystem *bsys, BATTLECONTEXT *ctx, s32 battlerId);
BOOL CanEscape(BattleSystem *bsys, BATTLECONTEXT *ctx, s32 battlerId, s32 a3);
s32 DamageDivide(s32 numerator, s32 denominator);
u32 GetBattlerAbility(BATTLECONTEXT *ctx, s32 battlerId);
u32 GetBattlerHeldItemEffect(BATTLECONTEXT *ctx, s32 battlerId);
s32 GetBattlerLearnedMoveCount(BattleSystem *bsys, BATTLECONTEXT *ctx, s32 battlerId);
s32 CalcMoveDamage(BattleSystem *bsys, BATTLECONTEXT *ctx, u32, u32, u32, u16, u8, u8, u8, u8);
u16 GetBattlerHeldItem(BATTLECONTEXT *ctx, s32 battlerId);
BOOL ov12_0225561C(BATTLECONTEXT *ctx, s32 battlerId);
s32 ov12_02257C30(BattleSystem *bsys, BATTLECONTEXT *ctx, s32 a2);
s32 GetNaturalGiftPower(BATTLECONTEXT *ctx, s32 battlerId);
s32 GetNaturalGiftType(BATTLECONTEXT *ctx, s32 battlerId);
BOOL CanEatOpponentBerry(BattleSystem *bsys, BATTLECONTEXT *ctx, s32 battlerId);
BOOL CanFling(BattleSystem *bsys, BATTLECONTEXT *ctx, s32 battlerId);
BOOL CheckLegalMetronomeMove(BattleSystem *bsys, BATTLECONTEXT *ctx, s32 battlerId, u16 moveNo);
BOOL CheckLegalMeFirstMove(BATTLECONTEXT *ctx, u16 move);
BOOL CheckLegalMimicMove(u16 move);
BOOL IsMoveEncored(BATTLECONTEXT *ctx, u16 move);
void CheckIgnorePressure(BATTLECONTEXT *ctx, s32 battlerIdA, s32 battlerIdB);
u8 ov12_0225682C(BATTLECONTEXT *ctx, s32 a1);
s32 CalculateTypeEffectiveness(s32 typeAttack, u8 typeDef1, u8 typeDef2);
BOOL BattleTryRun(BattleSystem *bsys, BATTLECONTEXT *ctx, s32 battlerId);
BOOL CheckAbilityEffectOnHit(BattleSystem *bsys, BATTLECONTEXT *ctx, s32 *work);
BOOL CheckItemEffectOnHit(BattleSystem *bsys, BATTLECONTEXT *ctx, s32 *itemWork);
s32 BattleSystem_GetHeldItemDamageBoost(BATTLECONTEXT *ctx, s32 battlerId, s32 a2);
BOOL CheckNaturalCureOnSwitch(BATTLECONTEXT *ctx, s32 ability, s32 status);
s32 ov12_02253DA0(BattleSystem *bsys, BATTLECONTEXT *ctx, s32 battlerId);
BOOL CheckItemEffectOnUTurn(BattleSystem *bsys, BATTLECONTEXT *ctx, s32 *work);
BOOL ov12_0224EC74(BATTLECONTEXT *ctx);
void ReadBattleScriptFromNarc(BATTLECONTEXT *ctx, s32 a1, s32 adrs);
void ov12_0224EBDC(BATTLECONTEXT *ctx, s32 a1, s32 adrs);
void ov12_02250A18(BattleSystem *bsys, BATTLECONTEXT *ctx, s32 battlerId, u16 a3);
u32 BattleSys_GetBattleType(BattleSystem *bsys);
u32 BattleSys_GetBattleFlags(BattleSystem *bsys);
u32 ov12_02257C5C(BattleSystem *bsys, BATTLECONTEXT *ctx, s32 battlerIdAttacker, s32 battlerIdTarget, s32 critCnt, u32 a5);
u32 ov12_022581D4(BattleSystem *bsys, BATTLECONTEXT *ctx, u32 a2, s32 battlerId);
u32 GetItemHoldEffect(BATTLECONTEXT *ctx, s32 item, u32 a3);
u32 ov12_0223C24C(PARTY *party, u32 *a1);
BOOL CheckStatusEffectsSubstitute(BATTLECONTEXT *ctx, s32 battlerId, u32 status);
u32 StruggleCheck(BattleSystem *bsys, BATTLECONTEXT *ctx, s32 battlerId, u32 nonSelectableMoves, u32 a4);
BOOL ov12_02252700(BattleSystem *bsys, BATTLECONTEXT *ctx, s32 battlerId);
BOOL WhirlwindCheck(BattleSystem *bsys, BATTLECONTEXT *ctx);
BOOL ov12_0225275C(BATTLECONTEXT *ctx, s32 battlerId);
s32 ov12_0223AB0C(BattleSystem *bsys, s32 battlerId);
s32 ov12_02251D28(BattleSystem *bsys, BATTLECONTEXT *ctx, s32 moveNo, s32 moveType, s32 battlerIdAttacker, s32 battlerIdTarget, s32 dmg, u32 *statusFlag);
BOOL ov12_02252C40(BATTLECONTEXT *ctx, s32 battlerId);
void ov12_02252D14(BattleSystem *bsys, BATTLECONTEXT *ctx);

#endif
