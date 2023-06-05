#ifndef POKEHEARTGOLD_BATTLE_CONTROLLER_H
#define POKEHEARTGOLD_BATTLE_CONTROLLER_H

#include "battle.h"

void BattleController_EmitPlayEncounterAnimation(BattleSystem *bsys, BOOL a1);
void BattleController_EmitPokemonEncounter(BattleSystem *bsys, s32 battlerId);
void BattleController_EmitPokemonSlideIn(BattleSystem *bsys, s32 battlerId);
void BattleController_EmitPokemonSendOut(BattleSystem *bsys, s32 battlerId, s32 a2, s32 a3);
void BattleController_EmitRecallPokemon(BattleSystem *bsys, BATTLECONTEXT *ctx, s32 battlerId);
void BattleController_EmitDeletePokemon(BattleSystem *bsys, s32 battlerId);
void BattleController_EmitTrainerEncounter(BattleSystem *bsys, s32 battlerId);
void BattleController_EmitThrowPokeball(BattleSystem *bsys, s32 battlerId, u32 a2);
void BattleController_EmitTrainerSlideOut(BattleSystem *bsys, s32 battlerId);
void BattleController_EmitTrainerSlideIn(BattleSystem *bsys, s32 battlerId, u32 a2);
void BattleController_EmitBackgroundSlideIn(BattleSystem *bsys, s32 battlerId);
void BattleController_EmitHealthbarSlideIn(BattleSystem *bsys, BATTLECONTEXT *ctx, s32 battlerId, u32 delay);
void BattleController_EmitHealthbarSlideOut(BattleSystem *bsys, s32 battlerId);
void BattleController_EmitShowMonList(BattleSystem *bsys, BATTLECONTEXT *ctx, s32 battlerId, u32 a3, u32 a4, u32 a5);
void BattleController_EmitDrawYesNoBox(BattleSystem *bsys, BATTLECONTEXT *ctx, s32 a2, s32 a3, s32 a4, s32 a5, s32 a6);
void BattleController_EmitShowWaitMessage(BattleSystem *bsys, s32 battlerId);
void BattleController_EmitPrintAttackMessage(BattleSystem *bsys, BATTLECONTEXT *ctx);
void BattleController_EmitPrintMessage(BattleSystem *bsys, BATTLECONTEXT *ctx, BATTLEMSG *msg);
void BattleController_SetMoveEffect(BattleSystem *bsys, BATTLECONTEXT *ctx, u16 move);
void ov12_0226343C(BattleSystem *bsys, BATTLECONTEXT *ctx, u16 move, s32 attacker, s32 target);
void BattleController_EmitMonFlicker(BattleSystem *bsys, s32 side, s32 a2);
void BattleController_EmitHealthbarUpdate(BattleSystem *bsys, BATTLECONTEXT *ctx, s32 side);
void BattleController_EmitPlayFaintAnimation(BattleSystem *bsys, BATTLECONTEXT *ctx, s32 batlterId);
void BattleController_EmitPlaySE(BattleSystem *bsys, BATTLECONTEXT *ctx, u32 sndSeqNo, s32 battlerId);
void BattleController_EmitFadeOutBattle(BattleSystem *bsys, BATTLECONTEXT *ctx);
void BattleController_EmitToggleVanish(BattleSystem *bsys, s32 battlerId, s32 a2);
void BattleController_EmitHealthbarStatus(BattleSystem *bsys, s32 battlerId, s32 status);
void BattleController_EmitPrintTrainerMessage(BattleSystem *bsys, s32 battlerId, s32 msg);
void BattleController_EmitSetStatus2Effect(BattleSystem *bsys, BATTLECONTEXT *ctx, s32 battlerId, s32 status);
void BattleController_EmitCopyStatus2Effect(BattleSystem *bsys, BATTLECONTEXT *ctx, s32 battlerIdA, s32 battlerIdB, s32 status);
void BattleController_EmitPrintReturnMessage(BattleSystem *bsys, BATTLECONTEXT *ctx, s32 battlerId, s32 a3);
void BattleController_EmitPrintSendOutMessage(BattleSystem *bsys, BATTLECONTEXT *ctx, s32 battlerId, s32 a3);
void BattleController_EmitPrintEncounterMessage(BattleSystem *bsys, BATTLECONTEXT *ctx, s32 battlerId);
void BattleController_EmitPrintFirstSendOutMessage(BattleSystem *bsys, BATTLECONTEXT *ctx, s32 battlerId);
void BattleController_EmitBattleMonToPartyMonCopy(BattleSystem *bsys, BATTLECONTEXT *ctx, s32 battlerId);
void BattleControl_EmitPartyStatusHeal(BattleSystem *bsys, BATTLECONTEXT *ctx, s32 battlerId, s32 moveNo);
void BattleController_EmitSetBattleResults(BattleSystem *bsys);
void BattleController_EmitPlayMosaicAnimation(BattleSystem *bsys, s32 battlerId, s32 a2, s32 delay);
void BattleController_EmitChangeForme(BattleSystem *bsys, s32 battlerId);
void BattleController_EmitSetBattleBackground(BattleSystem *bsys, s32 a1);
void BattleController_EmitInitStartBallGauge(BattleSystem *bsys, s32 battlerId);
void BattleController_EmitDeleteStartBallGauge(BattleSystem *bsys, s32 battlerId);
void BattleController_EmitInitBallGauge(BattleSystem *bsys, s32 battlerId);
void BattleController_EmitDeleteBallGauge(BattleSystem *bsys, s32 battlerId);
void BattleController_EmitLoadBallGfx(BattleSystem *bsys);
void BattleController_EmitDeleteBallGfx(BattleSystem *bsys);
void BattleController_EmitIncrementGameStat(BattleSystem *bsys, s32 battlerId, s32 flag, s32 id);
void ov12_02263F8C(BattleSystem *bsys, BATTLECONTEXT *ctx, s32 battlerId);
void ov12_02264038(BattleSystem *bsys, s32 battlerId);
void ov12_02264054(BattleSystem *bsys, s32 battlerId);
void BattleController_EmitPrintResultMessage(BattleSystem *bsys);
void BattleController_EmitRunAwayMessage(BattleSystem *bsys, BATTLECONTEXT *ctx);
void BattleController_EmitForefitMessage(BattleSystem *bsys);
void BattleController_EmitSwapToSubstituteSprite(BattleSystem *bsys, BATTLECONTEXT *ctx, s32 battlerId);
void BattleController_EmitPlayMoveSE(BattleSystem *bsys, BATTLECONTEXT *ctx, s32 battlerId);
void BattleController_EmitPlaySong(BattleSystem *bsys, s32 battlerId, s32 song);
void BattleController_EmitRefreshMonData(BattleSystem *bsys, BATTLECONTEXT *ctx, s32 battlerId, s32 monIndex);

void ov12_022645C8(BattleSystem *bsys, BATTLECONTEXT *ctx, u8 a2);

#endif
