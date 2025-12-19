#ifndef POKEHEARTGOLD_BATTLE_CONTROLLER_H
#define POKEHEARTGOLD_BATTLE_CONTROLLER_H

#include "battle/battle.h"

typedef void (*ControllerFunction)(BattleSystem *, BattleContext *ctx);

void BattleController_EmitPlayEncounterAnimation(BattleSystem *battleSystem, BOOL a1);
void BattleController_EmitPokemonEncounter(BattleSystem *battleSystem, int battlerId);
void BattleController_EmitPokemonSlideIn(BattleSystem *battleSystem, int battlerId);
void BattleController_EmitPokemonSendOut(BattleSystem *battleSystem, int battlerId, int a2, int a3);
void BattleController_EmitRecallPokemon(BattleSystem *battleSystem, BattleContext *ctx, int battlerId);
void BattleController_EmitDeletePokemon(BattleSystem *battleSystem, int battlerId);
void BattleController_EmitTrainerEncounter(BattleSystem *battleSystem, int battlerId);
void BattleController_EmitThrowPokeball(BattleSystem *battleSystem, int battlerId, u32 a2);
void BattleController_EmitTrainerSlideOut(BattleSystem *battleSystem, int battlerId);
void BattleController_EmitTrainerSlideIn(BattleSystem *battleSystem, int battlerId, u32 a2);
void BattleController_EmitBackgroundSlideIn(BattleSystem *battleSystem, int battlerId);
void BattleController_EmitHealthbarSlideIn(BattleSystem *battleSystem, BattleContext *ctx, int battlerId, u32 delay);
void BattleController_EmitHealthbarSlideOut(BattleSystem *battleSystem, int battlerId);
void BattleController_EmitShowMonList(BattleSystem *battleSystem, BattleContext *ctx, int battlerId, u32 a3, u32 a4, u32 a5);
void BattleController_EmitDrawYesNoBox(BattleSystem *battleSystem, BattleContext *ctx, int a2, int a3, int a4, int a5, int a6);
void BattleController_EmitShowWaitMessage(BattleSystem *battleSystem, int battlerId);
void BattleController_EmitPrintAttackMessage(BattleSystem *battleSystem, BattleContext *ctx);
void BattleController_EmitPrintMessage(BattleSystem *battleSystem, BattleContext *ctx, BattleMessage *msg);
void BattleController_SetMoveAnimation(BattleSystem *battleSystem, BattleContext *ctx, u16 move);
void ov12_0226343C(BattleSystem *battleSystem, BattleContext *ctx, u16 move, int attacker, int target);
void BattleController_EmitMonFlicker(BattleSystem *battleSystem, int side, int a2);
void BattleController_EmitHealthbarUpdate(BattleSystem *battleSystem, BattleContext *ctx, int side);
void BattleController_EmitPlayFaintAnimation(BattleSystem *battleSystem, BattleContext *ctx, int batlterId);
void BattleController_EmitPlaySE(BattleSystem *battleSystem, BattleContext *ctx, u32 sndSeqNo, int battlerId);
void BattleController_EmitFadeOutBattle(BattleSystem *battleSystem, BattleContext *ctx);
void BattleController_EmitToggleVanish(BattleSystem *battleSystem, int battlerId, int a2);
void BattleController_EmitHealthbarStatus(BattleSystem *battleSystem, int battlerId, int status);
void BattleController_EmitPrintTrainerMessage(BattleSystem *battleSystem, int battlerId, int msg);
void BattleController_EmitSetStatus2Effect(BattleSystem *battleSystem, BattleContext *ctx, int battlerId, int status);
void BattleController_EmitCopyStatus2Effect(BattleSystem *battleSystem, BattleContext *ctx, int battlerIdA, int battlerIdB, int status);
void BattleController_EmitPrintReturnMessage(BattleSystem *battleSystem, BattleContext *ctx, int battlerId, int a3);
void BattleController_EmitPrintSendOutMessage(BattleSystem *battleSystem, BattleContext *ctx, int battlerId, int a3);
void BattleController_EmitPrintEncounterMessage(BattleSystem *battleSystem, BattleContext *ctx, int battlerId);
void BattleController_EmitPrintFirstSendOutMessage(BattleSystem *battleSystem, BattleContext *ctx, int battlerId);
void BattleController_EmitBattleMonToPartyMonCopy(BattleSystem *battleSystem, BattleContext *ctx, int battlerId);
void BattleControl_EmitPartyStatusHeal(BattleSystem *battleSystem, BattleContext *ctx, int battlerId, int moveNo);
void BattleController_EmitSetBattleResults(BattleSystem *battleSystem);
void BattleController_EmitPlayMosaicAnimation(BattleSystem *battleSystem, int battlerId, int a2, int delay);
void BattleController_EmitChangeForm(BattleSystem *battleSystem, int battlerId);
void BattleController_EmitSetBattleBackground(BattleSystem *battleSystem, int a1);
void BattleController_EmitInitStartBallGauge(BattleSystem *battleSystem, int battlerId);
void BattleController_EmitDeleteStartBallGauge(BattleSystem *battleSystem, int battlerId);
void BattleController_EmitInitBallGauge(BattleSystem *battleSystem, int battlerId);
void BattleController_EmitDeleteBallGauge(BattleSystem *battleSystem, int battlerId);
void BattleController_EmitLoadBallGfx(BattleSystem *battleSystem);
void BattleController_EmitDeleteBallGfx(BattleSystem *battleSystem);
void BattleController_EmitIncrementGameStat(BattleSystem *battleSystem, int battlerId, int flag, int id);
void ov12_02263F8C(BattleSystem *battleSystem, BattleContext *ctx, int battlerId);
void ov12_02264038(BattleSystem *battleSystem, int battlerId);
void ov12_02264054(BattleSystem *battleSystem, int battlerId);
void BattleController_EmitPrintResultMessage(BattleSystem *battleSystem);
void BattleController_EmitRunAwayMessage(BattleSystem *battleSystem, BattleContext *ctx);
void BattleController_EmitForefitMessage(BattleSystem *battleSystem);
void BattleController_EmitSwapToSubstituteSprite(BattleSystem *battleSystem, BattleContext *ctx, int battlerId);
void BattleController_EmitPlayMoveSE(BattleSystem *battleSystem, BattleContext *ctx, int battlerId);
void BattleController_EmitPlaySong(BattleSystem *battleSystem, int battlerId, int song);
void BattleSystem_ReloadMonData(BattleSystem *battleSystem, BattleContext *ctx, int battlerId, int monIndex);

void ov12_022645C8(BattleSystem *battleSystem, BattleContext *ctx, u8 a2);
void ov12_02262B80(BattleSystem *battleSystem, BattleContext *ctx, int battlerId, int index);
void ov12_022639B8(BattleSystem *battleSystem, int battlerId, BattleMessage msg);
void ov12_02263CCC(BattleSystem *battleSystem, int battlerId);
void ov12_02262F40(BattleSystem *battleSystem, BattleContext *ctx, int battlerId);
void ov12_02262FFC(BattleSystem *battleSystem, BattleContext *ctx, int a2, int battlerId);
void ov12_02263138(BattleSystem *battleSystem, BattleContext *ctx, int battlerId);
void ov12_02263E18(BattleSystem *battleSystem, int battlerId);
void ov12_02263564(BattleSystem *battleSystem, BattleContext *ctx, int battlerId, u32 a3);
void ov12_0226399C(BattleSystem *battleSystem, int battlerId);
void ov12_02263A1C(BattleSystem *battleSystem, BattleContext *ctx, int battlerId);
void ov12_02263D14(BattleSystem *battleSystem, int battlerId, u32 a2, int slot);
void BattleController_EmitBlankMessage(BattleSystem *battleSystem);

#endif
