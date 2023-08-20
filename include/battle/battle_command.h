#ifndef POKEHEARTGOLD_BATTLE_COMMAND_H
#define POKEHEARTGOLD_BATTLE_COMMAND_H

#include "battle/battle.h"
#include "battle/battle_system.h"

//Realistically these should all be static in battle_command.c, but there's an array in battle_command_data.s that needs these functions so we have to keep them public until that can be decompiled, and at the same time we don't want the compiler to allow for functions without declarations, hence the existance of this header file

BOOL RunBattleScript(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_PlayEncounterAnimation(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_PokemonEncounter(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_PokemonSlideIn(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_PokemonSendOut(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_RecallPokemon(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_DeletePokemon(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_TrainerEncounter(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_ThrowPokeball(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_TrainerSlideOut(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_TrainerSlideIn(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_BackgroundSlideIn(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_HealthbarSlideIn(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_HealthbarSlideInDelay(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_HealthbarSlideOut(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_WaitForMessage(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_DamageCalc(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_DamageCalcRaw(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_PrintAttackMessage(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_PrintMessage(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_PrintMessage2(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_PrintBufferedMessage(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_BufferMessage(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_BufferMessageSide(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_PlayMoveAnimation(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_PlayMoveAnimation2(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_MonFlicker(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_HealthbarDataUpdate(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_HealthbarUpdate(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_TryFaintMon(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_PlayFaintAnimation(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_Wait(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_PlaySE(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_If(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_IfMonStat(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_FadeOutBattle(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_JumpToSubSeq(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_JumpToCurMoveEffectScript(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_JumpToEffectScript(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_CritCalc(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_ShouldGetExp(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_InitGetExp(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_GetExp(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_GetExpLoop(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_ShowParty(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_WaitForMonSelection(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_SwitchInDataUpdate(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_JumpIfCantSwitch(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_InitGetPokemon(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_GetPokemon(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_SetMultiHit(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_ChangeVar(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_BufferStatChangeMsg(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_ChangeMonDataVar(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_53(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_ToggleVanish(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_CheckAbility(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_Random(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_ChangeVar2(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_ChangeMonDataByVar(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_Goto(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_GotoSubscript(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_GotoSubscriptVar(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_SetMoveToMirrorMove(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_ResetAllStatChanges(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_64(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_65(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_SetHealthbarStatus(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_PrintTrainerMessage(BattleSystem *bsys, BattleContext *ctx);
u32 CalcPrizeMoney(BattleSystem *bsys, BattleContext *ctx, int trainerIndex);
BOOL BtlCmd_CalcPrizeMoney(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_SetStatus2Effect(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_CopyStatus2Effect(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_SetStatus2EffectVar(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_ReturnMessage(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_SendOutMessage(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_EncounterMessage(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_FirstSendOutMessage(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_TrainerMessageVar(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_TryConversion(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_Compare(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_IfMonStatVar(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_PayDay(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_TryLightScreen(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_TryReflect(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_TryMist(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_TryOHKO(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_SetDamageDivide(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_SetDamageDivideVar(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_TryMimic(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_Metronome(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_TryDisable(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_Counter(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_MirrorCoat(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_TryEncore(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_TryConversion2(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_TrySketch(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_TrySleepTalk(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_FlailDamageCalc(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_TrySpite(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_HealBell(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_TryThief(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_TryProtect(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_TrySubstitute(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_TryWhirlwind(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_Transform(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_TrySpikes(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_CheckSpikes(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_TryPerishSong(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_SetTurnOrderBySpeed(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_JumpIfValidBattlerVar(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_WeatherDamageCalc(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_RolloutDamageCalc(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_FuryCutterDamageCalc(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_TryAttract(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_TrySafeguard(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_Present(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_MagnitudeDamageCalc(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_TrySwitchMon(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_RapidSpin(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_ChangeWeatherBasedHPRecovery(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_HiddenPowerDamageCalc(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_PsychUp(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_TryFutureSight(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_CheckHitRate(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_TryTeleport(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_BeatUpDamageCalc(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_FollowMe(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_TryHelpingHand(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_TryTrick(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_TryWish(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_TryAssist(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_TrySetMagicCoat(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_MagicCoat(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_RevengeDamageCalc(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_TryBreakScreens(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_TryYawn(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_TryKnockOff(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_EruptionDamageCalc(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_TryImprison(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_TryGrudge(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_TrySnatch(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_LowKickDamageCalc(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_WeatherBallDamageCalc(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_TryPursuit(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_TypeEffectivenessCheck(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_PokemonEncounter44(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_PokemonEncounter45(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_GyroBallDamageCalc(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_MetalBurstDamageCalc(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_PaybackDamageCalc(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_TrumpCardDamageCalc(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_WringOutDamageCalc(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_TryMeFirst(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_TryCopycat(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_PunishmentDamageCalc(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_TrySuckerPunch(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_CheckSideCondition(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_TryFeint(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_TryPyschoShift(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_TryLastResort(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_TryToxicSpikes(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_CheckToxicSpikes(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_CheckMoldBreaker(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_CheckTeammates(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_Pickup(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_TrickRoom(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_CheckMoveFinished(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_CheckItemEffect(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_GetItemHoldEffect(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_GetItemModifier(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_TryCamouflage(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_NaturePower(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_SecretPower(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_TryNaturalGift(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_TryPluck(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_TryFling(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_YesNoBox(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_YesNoBoxWait(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_MonList(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_MonListWait(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_SetBattleResults(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_CheckStealthRock(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_CheckEffectActivation(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_CheckChatterActivation(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_GetMoveParam(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_Mosaic(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_ChangeForm(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_SetBattleBackground(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_RecoverStatus(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_TryRun(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_InitStartBallGauge(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_DeleteStartBallGauge(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_InitBallGauge(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_DeleteBallGauge(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_LoadBallGfx(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_DeleteBallGfx(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_IncrementGameStat(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_196(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_CheckAbilityEffectOnHit(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_198(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_199(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_CheckWhiteout(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_TryAcupressure(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_RemoveItem(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_TryRecycle(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_CheckItemEffectOnHit(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_BattleResultMessage(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_RunAwayMessage(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_ForefitMessage(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_CheckHoldOnWith1HP(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_TryNaturalCure(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_CheckSubstitute(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_CheckCloudNine(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_211(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_CheckItemEffectOnUTurn(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_SwapToSubstituteSprite(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_PlayMoveSE(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_PlaySong(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_CheckSafariEncounterDone(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_WaitWithoutInterrupt(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_CheckCurMoveIsType(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_GetMonDataFromNarc(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_RefreshMonData(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_222(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_223(BattleSystem *bsys, BattleContext *ctx);
BOOL BtlCmd_EndScript(BattleSystem *bsys, BattleContext *ctx);
int BattleScriptReadWord(BattleContext *ctx);
void InitBattleMsgData(BattleContext *ctx, BattleMessageDATA *msgdata);
void InitBattleMsg(BattleSystem *bsys, BattleContext *ctx, BattleMessageDATA *msgdata, BattleMessage *msg);
void UpdateFrienshipFainted(BattleSystem *bsys, BattleContext *ctx, int battlerId);
int GetMoveMessageNo(BattleContext *ctx, int move);

#endif