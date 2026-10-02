#ifndef POKEHEARTGOLD_BATTLE_CONTROLLER_H
#define POKEHEARTGOLD_BATTLE_CONTROLLER_H

#include "battle/battle.h"
#include "battle/battle_message_structs.h"

typedef void (*ControllerFunction)(BattleSystem *, BattleContext *ctx);

void BattleSystem_TryRecvMessage(BattleSystem *battleSys, int recipient);

void BattleController_EmitSetupBattleUI(BattleSystem *battleSystem, BOOL a1);
void BattleController_EmitSetEncounter(BattleSystem *battleSystem, int battlerId);
void BattleController_EmitShowEncounter(BattleSystem *battleSystem, int battlerId);
void BattleController_EmitShowPokemon(BattleSystem *battleSystem, int battlerId, int a2, int a3);
void BattleController_EmitReturnPokemon(BattleSystem *battleSystem, BattleContext *ctx, int battlerId);
void BattleController_EmitDeletePokemon(BattleSystem *battleSystem, int battlerId);
void BattleController_EmitSetTrainerEncounter(BattleSystem *battleSystem, int battlerId);
void BattleController_EmitTrainerThrowBall(BattleSystem *battleSys, int battler, int ballTypeIn);
void BattleController_EmitTrainerSlideOut(BattleSystem *battleSystem, int battlerId);
void BattleController_EmitTrainerSlideIn(BattleSystem *battleSystem, int battlerId, int posIn);
void BattleController_EmitSlideInBackground(BattleSystem *battleSystem, int battlerId);
void BattleController_EmitSlideHealthBoxIn(BattleSystem *battleSystem, BattleContext *ctx, int battlerId, int delay);
void BattleController_EmitSlideHealthBoxOut(BattleSystem *battleSystem, int battlerId);
void BattleController_EmitShowPartyMenu(BattleSystem *battleSystem, BattleContext *ctx, int battlerId, int a3, int a4, int a5);
void BattleController_EmitShowYesNoMenu(BattleSystem *battleSystem, BattleContext *ctx, int a2, int a3, int a4, int a5, int a6);
void BattleController_EmitPrintLinkWaitMessage(BattleSystem *battleSystem, int battlerId);
void BattleController_EmitPrintAttackMessage(BattleSystem *battleSystem, BattleContext *ctx);
void BattleController_EmitPrintMessage(BattleSystem *battleSystem, BattleContext *ctx, BattleMessage *msg);
void BattleController_EmitPlayMoveAnimation(BattleSystem *battleSystem, BattleContext *ctx, u16 move);
void BattleController_SetMoveAnimationAttackerToDefender(BattleSystem *battleSystem, BattleContext *ctx, u16 move, int attacker, int target);
void BattleController_EmitFlickerBattlerSprite(BattleSystem *battleSystem, int side, u32 a2);
void BattleController_EmitUpdateHPGauge(BattleSystem *battleSystem, BattleContext *ctx, int side);
void BattleController_EmitPlayFaintingSequence(BattleSystem *battleSystem, BattleContext *ctx, int batlterId);
void BattleController_EmitPlaySound(BattleSystem *battleSystem, BattleContext *ctx, int sndSeqNo, int battlerId);
void BattleController_EmitFadeOut(BattleSystem *battleSystem, BattleContext *ctx);
void BattleController_EmitToggleVanishMessage(BattleSystem *battleSystem, int battlerId, int a2);
void BattleController_EmitSetStatusIcon(BattleSystem *battleSystem, int battlerId, int status);
void BattleController_EmitPrintTrainerMessage(BattleSystem *battleSystem, int battlerId, int msg);
void BattleController_EmitPlayStatusEffect(BattleSystem *battleSystem, BattleContext *ctx, int battlerId, int status);
void BattleController_EmitPlayStatusEffectAttackerToDefender(BattleSystem *battleSystem, BattleContext *ctx, int battlerIdA, int battlerIdB, int status);
void BattleController_EmitPrintReturnMessage(BattleSystem *battleSystem, BattleContext *ctx, int battlerId, int a3);
void BattleController_EmitPrintSendOutMessage(BattleSystem *battleSystem, BattleContext *ctx, int battlerId, int a3);
void BattleController_EmitPrintEncounterMessage(BattleSystem *battleSystem, BattleContext *ctx, int battlerId);
void BattleController_EmitPrintLeadMonMessage(BattleSystem *battleSystem, BattleContext *ctx, int battlerId);
void BattleController_EmitUpdatePartyMon(BattleSystem *battleSystem, BattleContext *ctx, int battlerId);
void BattleController_EmitRefreshPartyStatus(BattleSystem *battleSystem, BattleContext *ctx, int battlerId, int moveNo);
void BattleController_EmitSetBattleResults(BattleSystem *battleSystem);
void BattleController_EmitPlayMosaicAnimation(BattleSystem *battleSystem, int battlerId, int a2, int delay);
void BattleController_EmitChangeForm(BattleSystem *battleSystem, int battlerId);
void BattleController_EmitUpdateBackground(BattleSystem *battleSystem, int a1);
void BattleController_EmitShowInitialPartyGauge(BattleSystem *battleSystem, int battlerId);
void BattleController_EmitHideInitialPartyGauge(BattleSystem *battleSystem, int battlerId);
void BattleController_EmitShowPartyGauge(BattleSystem *battleSystem, int battlerId);
void BattleController_EmitHidePartyGauge(BattleSystem *battleSystem, int battlerId);
void BattleController_EmitLoadPartyGaugeGraphics(BattleSystem *battleSystem);
void BattleController_EmitFreePartyGaugeGraphics(BattleSystem *battleSystem);
void BattleController_EmitIncrementGameStat(BattleSystem *battleSystem, int battlerId, int flag, int id);
void BattleController_EmitRestoreSprite(BattleSystem *battleSystem, BattleContext *ctx, int battlerId);
void BattleController_EmitSpriteToOAM(BattleSystem *battleSystem, int battlerId);
void BattleController_EmitOAMToSprite(BattleSystem *battleSystem, int battlerId);
void BattleController_EmitPrintResultMessage(BattleSystem *battleSystem);
void BattleController_EmitPrintEscapeMessage(BattleSystem *battleSystem, BattleContext *ctx);
void BattleController_EmitPrintForefitMessage(BattleSystem *battleSystem);
void BattleController_EmitRefreshSprite(BattleSystem *battleSystem, BattleContext *ctx, int battlerId);
void BattleController_EmitPlayMoveHitSoundEffect(BattleSystem *battleSystem, BattleContext *ctx, int battlerId);
void BattleController_EmitPlayMusic(BattleSystem *battleSystem, int battlerId, int song);
void BattleSystem_ReloadMonData(BattleSystem *battleSystem, BattleContext *ctx, int battlerId, int monIndex);

void ov12_022645C8(BattleSystem *battleSystem, BattleContext *ctx, u8 a2);
void BattleController_EmitSetCommandSelectionMenu(BattleSystem *battleSystem, BattleContext *ctx, int battlerId, int index);
void BattleController_EmitOpenCaptureBall(BattleSystem *battleSys, int battler, int ball);
void BattleController_EmitSetAlertMessage(BattleSystem *battleSystem, int battlerId, BattleMessage msg);
void BattleController_EmitStopGaugeAnimation(BattleSystem *battleSystem, int battlerId);
void BattleController_EmitShowMoveSelectMenu(BattleSystem *battleSystem, BattleContext *ctx, int battlerId);
void BattleCommand_EmitShowTargetSelectMenu(BattleSystem *battleSystem, BattleContext *ctx, int a2, int battlerId);
void BattleController_EmitShowBagMenu(BattleSystem *battleSystem, BattleContext *ctx, int battlerId);
void BattleController_EmitClearTouchScreen(BattleSystem *battleSystem, int battlerId);
void BattleController_EmitUpdateExpGauge(BattleSystem *battleSystem, BattleContext *ctx, int battlerId, int a3);
void BattleController_EmitPlayLevelUpAnimation(BattleSystem *battleSystem, int battlerId);
void BattleController_EmitRefreshHPGauge(BattleSystem *battleSystem, BattleContext *ctx, int battlerId);
void BattleController_EmitForgetMove(BattleSystem *battleSystem, int battlerId, int a2, int slot);
void BattleController_EmitClearMessageBox(BattleSystem *battleSystem);
void BattleController_SetMoveAnimation(BattleSystem *battleSys, BattleContext *ctx, MoveAnimation *animation, int animMode, int secondaryAnimID, int attacker, int defender, u16 move);

#endif
