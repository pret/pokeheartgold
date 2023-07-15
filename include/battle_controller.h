#ifndef POKEHEARTGOLD_BATTLE_CONTROLLER_H
#define POKEHEARTGOLD_BATTLE_CONTROLLER_H

#include "battle.h"

typedef void (*ControllerFunction)(BattleSystem *, BATTLECONTEXT *ctx);

void BattleController_EmitPlayEncounterAnimation(BattleSystem *bsys, BOOL a1);
void BattleController_EmitPokemonEncounter(BattleSystem *bsys, int battlerId);
void BattleController_EmitPokemonSlideIn(BattleSystem *bsys, int battlerId);
void BattleController_EmitPokemonSendOut(BattleSystem *bsys, int battlerId, int a2, int a3);
void BattleController_EmitRecallPokemon(BattleSystem *bsys, BATTLECONTEXT *ctx, int battlerId);
void BattleController_EmitDeletePokemon(BattleSystem *bsys, int battlerId);
void BattleController_EmitTrainerEncounter(BattleSystem *bsys, int battlerId);
void BattleController_EmitThrowPokeball(BattleSystem *bsys, int battlerId, u32 a2);
void BattleController_EmitTrainerSlideOut(BattleSystem *bsys, int battlerId);
void BattleController_EmitTrainerSlideIn(BattleSystem *bsys, int battlerId, u32 a2);
void BattleController_EmitBackgroundSlideIn(BattleSystem *bsys, int battlerId);
void BattleController_EmitHealthbarSlideIn(BattleSystem *bsys, BATTLECONTEXT *ctx, int battlerId, u32 delay);
void BattleController_EmitHealthbarSlideOut(BattleSystem *bsys, int battlerId);
void BattleController_EmitShowMonList(BattleSystem *bsys, BATTLECONTEXT *ctx, int battlerId, u32 a3, u32 a4, u32 a5);
void BattleController_EmitDrawYesNoBox(BattleSystem *bsys, BATTLECONTEXT *ctx, int a2, int a3, int a4, int a5, int a6);
void BattleController_EmitShowWaitMessage(BattleSystem *bsys, int battlerId);
void BattleController_EmitPrintAttackMessage(BattleSystem *bsys, BATTLECONTEXT *ctx);
void BattleController_EmitPrintMessage(BattleSystem *bsys, BATTLECONTEXT *ctx, BATTLEMSG *msg);
void BattleController_SetMoveAnimation(BattleSystem *bsys, BATTLECONTEXT *ctx, u16 move);
void ov12_0226343C(BattleSystem *bsys, BATTLECONTEXT *ctx, u16 move, int attacker, int target);
void BattleController_EmitMonFlicker(BattleSystem *bsys, int side, int a2);
void BattleController_EmitHealthbarUpdate(BattleSystem *bsys, BATTLECONTEXT *ctx, int side);
void BattleController_EmitPlayFaintAnimation(BattleSystem *bsys, BATTLECONTEXT *ctx, int batlterId);
void BattleController_EmitPlaySE(BattleSystem *bsys, BATTLECONTEXT *ctx, u32 sndSeqNo, int battlerId);
void BattleController_EmitFadeOutBattle(BattleSystem *bsys, BATTLECONTEXT *ctx);
void BattleController_EmitToggleVanish(BattleSystem *bsys, int battlerId, int a2);
void BattleController_EmitHealthbarStatus(BattleSystem *bsys, int battlerId, int status);
void BattleController_EmitPrintTrainerMessage(BattleSystem *bsys, int battlerId, int msg);
void BattleController_EmitSetStatus2Effect(BattleSystem *bsys, BATTLECONTEXT *ctx, int battlerId, int status);
void BattleController_EmitCopyStatus2Effect(BattleSystem *bsys, BATTLECONTEXT *ctx, int battlerIdA, int battlerIdB, int status);
void BattleController_EmitPrintReturnMessage(BattleSystem *bsys, BATTLECONTEXT *ctx, int battlerId, int a3);
void BattleController_EmitPrintSendOutMessage(BattleSystem *bsys, BATTLECONTEXT *ctx, int battlerId, int a3);
void BattleController_EmitPrintEncounterMessage(BattleSystem *bsys, BATTLECONTEXT *ctx, int battlerId);
void BattleController_EmitPrintFirstSendOutMessage(BattleSystem *bsys, BATTLECONTEXT *ctx, int battlerId);
void BattleController_EmitBattleMonToPartyMonCopy(BattleSystem *bsys, BATTLECONTEXT *ctx, int battlerId);
void BattleControl_EmitPartyStatusHeal(BattleSystem *bsys, BATTLECONTEXT *ctx, int battlerId, int moveNo);
void BattleController_EmitSetBattleResults(BattleSystem *bsys);
void BattleController_EmitPlayMosaicAnimation(BattleSystem *bsys, int battlerId, int a2, int delay);
void BattleController_EmitChangeForm(BattleSystem *bsys, int battlerId);
void BattleController_EmitSetBattleBackground(BattleSystem *bsys, int a1);
void BattleController_EmitInitStartBallGauge(BattleSystem *bsys, int battlerId);
void BattleController_EmitDeleteStartBallGauge(BattleSystem *bsys, int battlerId);
void BattleController_EmitInitBallGauge(BattleSystem *bsys, int battlerId);
void BattleController_EmitDeleteBallGauge(BattleSystem *bsys, int battlerId);
void BattleController_EmitLoadBallGfx(BattleSystem *bsys);
void BattleController_EmitDeleteBallGfx(BattleSystem *bsys);
void BattleController_EmitIncrementGameStat(BattleSystem *bsys, int battlerId, int flag, int id);
void ov12_02263F8C(BattleSystem *bsys, BATTLECONTEXT *ctx, int battlerId);
void ov12_02264038(BattleSystem *bsys, int battlerId);
void ov12_02264054(BattleSystem *bsys, int battlerId);
void BattleController_EmitPrintResultMessage(BattleSystem *bsys);
void BattleController_EmitRunAwayMessage(BattleSystem *bsys, BATTLECONTEXT *ctx);
void BattleController_EmitForefitMessage(BattleSystem *bsys);
void BattleController_EmitSwapToSubstituteSprite(BattleSystem *bsys, BATTLECONTEXT *ctx, int battlerId);
void BattleController_EmitPlayMoveSE(BattleSystem *bsys, BATTLECONTEXT *ctx, int battlerId);
void BattleController_EmitPlaySong(BattleSystem *bsys, int battlerId, int song);
void BattleSystem_ReloadMonData(BattleSystem *bsys, BATTLECONTEXT *ctx, int battlerId, int monIndex);

void ov12_022645C8(BattleSystem *bsys, BATTLECONTEXT *ctx, u8 a2);
void ov12_02262B80(BattleSystem *bsys, BATTLECONTEXT *ctx, int battlerId, int index);
void ov12_022639B8(BattleSystem *bsys, int battlerId, BATTLEMSG msg);
void ov12_02263CCC(BattleSystem *bsys, int battlerId);
void ov12_02262F40(BattleSystem *bsys, BATTLECONTEXT *ctx, int battlerId);
BOOL ov12_0224DB64(BattleSystem *bsys, BATTLECONTEXT *ctx, u8 battlerId, u32 battleType, int *out, int movePos, u32 *a6);
void ov12_02262FFC(BattleSystem *bsys, BATTLECONTEXT *ctx, int a2, int battlerId);
void ov12_02263138(BattleSystem *bsys, BATTLECONTEXT *ctx, int battlerId);
void ov12_02263E18(BattleSystem *bsys, int battlerId);
void ov12_0224E414(BattleSystem *bsys, BATTLECONTEXT *ctx);

#endif
