#ifndef POKEHEARTGOLD_OVERLAY_12_0224E4FC_H
#define POKEHEARTGOLD_OVERLAY_12_0224E4FC_H

#include "constants/battle.h"

#include "battle/battle.h"

void BattleSystem_GetBattleMon(BattleSystem *bsys, BattleContext *ctx, int battlerId, u8 monIndex);
void BattleSystem_ReloadMonData(BattleSystem *bsys, BattleContext *ctx, int battlerId, int monIndex);
void ReadBattleScriptFromNarc(BattleContext *ctx, NarcId narcId, int fileId);
void ov12_0224EBDC(BattleContext *ctx, NarcId narcId, int fileId);
BOOL ov12_0224EC74(BattleContext *ctx);
void ov12_0224ECC4(BattleContext *ctx, int id, int battlerId, int index);
void ov12_0224ED00(BattleContext *ctx, int id, int battlerId, int index);
BOOL Link_QueueNotEmpty(BattleContext *ctx);
void BattleBuffer_Clear(BattleContext *ctx, int battlerId);
int GetBattlerVar(BattleContext *ctx, int battlerId, u32 varId, void *data);
void SetBattlerVar(BattleContext *ctx, int battlerId, u32 varId, void *data);
void AddBattlerVar(BattleContext *ctx, int battlerId, u32 varId, int data);
void BattleMon_AddVar(BattleMon *mon, u32 varId, int data);
u8 CheckSortSpeed(BattleSystem *bsys, BattleContext *ctx, int battlerId1, int battlerId2, int flag);
void BattleSystem_ClearExperienceEarnFlags(BattleContext *ctx, int battlerId);
void BattleSystem_SetExperienceEarnFlags(BattleSystem *bsys, BattleContext *ctx, int battlerId);
BOOL ov12_022503EC(BattleSystem *bsys, BattleContext *ctx, int *out);
BOOL ov12_02250490(BattleSystem *bsys, BattleContext *ctx, int *out);
int ov12_022506D4(BattleSystem *bsys, BattleContext *ctx, int battlerId, u16 move, int a4, int a5);
void ov12_02250A18(BattleSystem *bsys, BattleContext *ctx, int battlerId, u16 a3);
BOOL ov12_02250BBC(BattleSystem *bsys, BattleContext *ctx);
void CopyBattleMonToPartyMon(BattleSystem *bsys, BattleContext *ctx, int battlerId);
void LockBattlerIntoCurrentMove(BattleSystem *bsys, BattleContext *ctx, int battlerId);
void UnlockBattlerOutOfCurrentMove(BattleSystem *bsys, BattleContext *ctx, int battlerId);
int GetBattlerStatusCondition(BattleContext *ctx, int battlerId);
BOOL CheckTrainerMessage(BattleSystem *bsys, BattleContext *ctx);
void BattleContext_Init(BattleContext *ctx);
void ov12_02251038(BattleSystem *bsys, BattleContext *ctx);
void InitSwitchWork(BattleSystem *bsys, BattleContext *ctx, int battlerId);
void InitFaintedWork(BattleSystem *bsys, BattleContext *ctx, int battlerId);
void ov12_02251710(BattleSystem *bsys, BattleContext *ctx);
u32 StruggleCheck(BattleSystem *bsys, BattleContext *ctx, int battlerId, u32 nonSelectableMoves, u32 a4);
BOOL ov12_02251A28(BattleSystem *bsys, BattleContext *ctx, int battlerId, int movePos, BattleMessage *msg);
int BattleMon_GetMoveIndex(BattleMon *mon, u16 move);
int ov12_02251D28(BattleSystem *bsys, BattleContext *ctx, int moveNo, int moveTypeDefault, int battlerIdAttacker, int battlerIdTarget, int damage, u32 *moveStatusFlag);
void ov12_02252054(BattleContext *ctx, int moveNo, int moveTypeDefault, int abilityAttacker, int abilityTarget, int item, int type1, int type2, u32 *moveStatusFlag);
BOOL ov12_02252218(BattleContext *ctx, int battlerId);
u8 GetMonsHitCount(BattleSystem *bsys, BattleContext *ctx, u32 flag, int battlerId);
int CreateNicknameTag(BattleContext *ctx, int battlerId);
u16 GetBattlerSelectedMove(BattleContext *ctx, int battlerId);
int CheckAbilityActive(BattleSystem *bsys, BattleContext *ctx, int flag, int battlerId, int ability);
BOOL BattleCtx_IsIdenticalToCurrentMove(BattleContext *ctx, int moveNo);
BOOL GetTypeEffectivnessData(BattleSystem *bsys, int index, u8 *typeMove, u8 *typeMon, u8 *eff);
int CalculateTypeEffectiveness(u8 typeMove, u8 typeMon1, u8 typeMon2);
BOOL CheckMoveCallsOtherMove(u16 moveNo);
BOOL CurseUserIsGhost(BattleContext *ctx, u16 moveNo, int battlerId);
BOOL CanStealHeldItem(BattleSystem *bsys, BattleContext *ctx, int battlerId);
BOOL CanTrickHeldItem(BattleContext *ctx, int battlerId);
BOOL WhirlwindCheck(BattleSystem *bsys, BattleContext *ctx);
u8 GetBattlerAbility(BattleContext *ctx, int battlerId);
BOOL CheckBattlerAbilityIfNotIgnored(BattleContext *ctx, int battlerIdAttacker, int battlerIdTarget, int ability);
BOOL CanSwitchMon(BattleSystem *bsys, BattleContext *ctx, int battlerId);
BOOL CantEscape(BattleSystem *bsys, BattleContext *ctx, int battlerId, BattleMessage *msg);
BOOL BattleTryRun(BattleSystem *bsys, BattleContext *ctx, int battlerId);
BOOL CheckTruant(BattleContext *ctx, int battlerId);
BOOL BattleContext_CheckMoveImprisoned(BattleSystem *bsys, BattleContext *ctx, int battlerId, int moveNo);
BOOL CheckMoveEffectOnField(BattleSystem *bsys, BattleContext *ctx, int moveEffect);
void ov12_02252D14(BattleSystem *bsys, BattleContext *ctx);
void SortMonsBySpeed(BattleSystem *bsys, BattleContext *ctx);
BOOL BattleContext_CheckMoveUnuseableInGravity(BattleSystem *bsys, BattleContext *ctx, int battlerId, int moveNo);
BOOL BattleContext_CheckMoveHealBlocked(BattleSystem *bsys, BattleContext *ctx, int battlerId, int moveNo);
void ov12_02252E30(BattleSystem *bsys, BattleContext *ctx);
int GetBattlerLearnedMoveCount(BattleSystem *bsys, BattleContext *ctx, int battlerId);
int BattleContext_CheckMoveImmunityFromAbility(BattleContext *ctx, int battlerIdAttacker, int battlerIdTarget);
BOOL ov12_02253068(BattleSystem *bsys, BattleContext *ctx, int battlerId);
int DamageDivide(int num, int denom);
int TryAbilityOnEntry(BattleSystem *bsys, BattleContext *ctx);
int Battler_GetRandomOpposingBattlerId(BattleSystem *bsys, BattleContext *ctx, int battlerId);
BOOL CheckAbilityEffectOnHit(BattleSystem *bsys, BattleContext *ctx, int *script);
BOOL CheckStatusHealAbility(BattleSystem *bsys, BattleContext *ctx, int battlerId, int flag);
BOOL CheckStatusHealSwitch(BattleContext *ctx, int ability, int status);
BOOL TrySyncronizeStatus(BattleSystem *bsys, BattleContext *ctx, ControllerCommand command);
BOOL TryUseHeldItem(BattleSystem *bsys, BattleContext *ctx, int battlerId);
BOOL CheckItemGradualHPRestore(BattleSystem *bsys, BattleContext *ctx, int battlerId);
BOOL CheckUseHeldItem(BattleSystem *bsys, BattleContext *ctx, int battlerId, u32 *scriptOut);
BOOL TryHeldItemNegativeEffect(BattleSystem *bsys, BattleContext *ctx, int battlerId);
u16 GetBattlerHeldItem(BattleContext *ctx, int battlerId);
BOOL ov12_0225561C(BattleContext *ctx, int battlerId);
BOOL CheckItemEffectOnHit(BattleSystem *bsys, BattleContext *ctx, int *script);
int GetBattlerHeldItemEffect(BattleContext *ctx, int battlerId);
int GetHeldItemModifier(BattleContext *ctx, int battlerId, int flag);
int GetNaturalGiftPower(BattleContext *ctx, int battlerId);
int GetNaturalGiftType(BattleContext *ctx, int battlerId);
int GetHeldItemStealBerryEffect(BattleContext *ctx, int battlerId);
int GetHeldItemFlingEffect(BattleContext *ctx, int battlerId);
int GetHeldItemFlingPower(BattleContext *ctx, int battlerId);
BOOL BattlerCanSwitch(BattleSystem *bsys, BattleContext *ctx, int battlerId);
BOOL TryEatOpponentBerry(BattleSystem *bsys, BattleContext *ctx, int battlerId);
BOOL TryFling(BattleSystem *bsys, BattleContext *ctx, int battlerId);
void ov12_022565E0(BattleSystem *bsys, BattleContext *ctx);
void ov12_02256694(BattleSystem *bsys, BattleContext *ctx);
int ov12_02256748(BattleContext *ctx, int battlerId, int battlerType, BOOL encounter);
BOOL Battler_CanSelectAction(BattleContext *ctx, int battlerId);
void ov12_022567D4(BattleSystem *bsys, BattleContext *ctx, Pokemon *mon);
u8 BattleBuffer_GetNext(BattleContext *ctx, int battlerId);
BOOL BattlerCheckSubstitute(BattleContext *ctx, int battlerId);
BOOL ov12_02256854(BattleSystem *bsys, BattleContext *ctx);
BOOL ov12_022568B0(BattleSystem *bsys, Pokemon *mon);
BOOL Battler_CheckWeatherFormChange(BattleSystem *bsys, BattleContext *ctx, int *script);
void ov12_02256F28(BattleSystem *bsys, BattleContext *ctx);
void ov12_02256F78(BattleSystem *bsys, BattleContext *ctx, int battlerId, u8 selectedMonIndex);
int CalcMoveDamage(BattleSystem *bsys, BattleContext *ctx, u32 moveNo, u32 sideCondition, u32 fieldCondition, u16 power, u8 type, u8 battlerIdAttacker, u8 battlerIdTarget, u8 crit);
int ApplyDamageRange(BattleSystem *bsys, BattleContext *ctx, int damage);
u32 TryCriticalHit(BattleSystem *bsys, BattleContext *ctx, int battlerIdAttacker, int battlerIdTarget, int critCnt, u32 sideCondition);
BOOL CheckLegalMimicMove(u16 moveNo);
BOOL CheckLegalMetronomeMove(BattleSystem *bsys, BattleContext *ctx, int battlerId, u16 moveNo);
BOOL IsMoveEncored(BattleContext *ctx, u16 moveNo);
s32 GetItemVar(BattleContext *ctx, u16 itemNo, u16 var);
int ov12_02257E98(BattleSystem *bsys, BattleContext *ctx, int side);
void SortExecutionOrderBySpeed(BattleSystem *bsys, BattleContext *ctx);
BOOL CheckStatusEffectsSubstitute(BattleContext *bsys, int battlerId, int status);
BOOL CheckItemEffectOnUTurn(BattleSystem *bsys, BattleContext *ctx, int *script);
void CheckIgnorePressure(BattleContext *ctx, int battlerIdAttacker, int battlerIdTarget);
BOOL BattleController_TryEmitExitRecording(BattleSystem *bsys, BattleContext *ctx);
int ov12_022581D4(BattleSystem *bsys, BattleContext *ctx, int var, int battlerId);
void ov12_022582B8(BattleSystem *bsys, BattleContext *ctx, int var, int battlerId, int data);

// The following functions are static, but the rest of the file is still being worked on
BOOL ov12_02251C74(BattleContext *ctx, int battlerIdAttacker, int battlerIdTarget, int index);

// The following functions haven't been decompiled as of now, and are in fact in different files
void Link_CheckTimeout(BattleContext *ctx);
BOOL CheckLegalMeFirstMove(BattleContext *ctx, u16 move);
int Battler_GetRandomOpposingBattlerId(BattleSystem *bsys, BattleContext *ctx, int battlerId);
u32 CalcMoneyLoss(Party *party, PlayerProfile *profile);
int ov12_02251D28(BattleSystem *bsys, BattleContext *ctx, int moveNo, int moveType, int battlerIdAttacker, int battlerIdTarget, int dmg, u32 *statusFlag);
void ov12_02252D14(BattleSystem *bsys, BattleContext *ctx);

#endif
