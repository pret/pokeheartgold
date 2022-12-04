#ifndef POKEHEARTGOLD_BATTLE_CONTROLLER_H
#define POKEHEARTGOLD_BATTLE_CONTROLLER_H

#include "battle.h"

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
void ov12_022632DC(BattleSystem *bsys, BATTLECONTEXT *ctx, int battlerId, u32 a3, u32 a4, u32 a5);
void BattleController_EmitShowWaitMessage(BattleSystem *bsys, int battlerId);
void BattleController_EmitPrintAttackMessage(BattleSystem *bsys, BATTLECONTEXT *ctx);
void BattleController_EmitPrintMessage(BattleSystem *bsys, BATTLECONTEXT *ctx, BATTLEMSG *msg);
void ov12_0226340C(BattleSystem *bsys, BATTLECONTEXT *ctx, u16 move);
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

#endif
