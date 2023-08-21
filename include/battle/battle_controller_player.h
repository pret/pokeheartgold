#ifndef POKEHEARTGOLD_BATTLE_CONTROLLER_PLAYER_H
#define POKEHEARTGOLD_BATTLE_CONTROLLER_PLAYER_H

#include "battle/battle.h"

BattleContext *BattleContext_New(BattleSystem *bsys);
BOOL BattleMain(BattleSystem *bsys, BattleContext *ctx);
void BattleContext_Delete(BattleContext *ctx);
void BattleSystem_CheckMoveHitEffect(BattleSystem *bsys, BattleContext *ctx, int battlerIdAttacker, int battlerIdTarget, int moveNo);

//The following functions are static, but still refrenced in asm code
void BattleControllerPlayer_GetBattleMon(BattleSystem *bsys, BattleContext *ctx);
void BattleControllerPlayer_StartEncounter(BattleSystem *bsys, BattleContext *ctx);
void BattleControllerPlayer_TrainerMessage(BattleSystem *bsys, BattleContext *ctx);
void BattleControllerPlayer_PokemonAppear(BattleSystem *bsys, BattleContext *ctx);
void BattleControllerPlayer_SelectionScreenInit(BattleSystem *bsys, BattleContext *ctx);
void BattleControllerPlayer_SelectionScreenInput(BattleSystem *bsys, BattleContext *ctx);
void ov12_02249190(BattleSystem *bsys, BattleContext *ctx);
void ov12_0224930C(BattleSystem *bsys, BattleContext *ctx);
void ov12_02249460(BattleSystem *bsys, BattleContext *ctx);
void BattleControllerPlayer_UpdateFieldCondition(BattleSystem *bsys, BattleContext *ctx);
void BattleControllerPlayer_UpdateMonCondition(BattleSystem *bsys, BattleContext *ctx);
void BattleControllerPlayer_UpdateFieldConditionExtra(BattleSystem *bsys, BattleContext *ctx);
void BattleControllerPlayer_TurnEnd(BattleSystem *bsys, BattleContext *ctx);
void BattleControllerPlayer_FightInput(BattleSystem *bsys, BattleContext *ctx);
void BattleControllerPlayer_ItemInput(BattleSystem *bsys, BattleContext *ctx);
void BattleControllerPlayer_PokemonInput(BattleSystem *bsys, BattleContext *ctx);
void BattleControllerPlayer_RunInput(BattleSystem *bsys, BattleContext *ctx);
void BattleControllerPlayer_SafariBallInput(BattleSystem *bsys, BattleContext *ctx);

//The following functions haven't been decompiled yet
void ov12_0224E384(BattleSystem *bsys, BattleContext *ctx);
void BattleSystem_CheckMoveHit(BattleSystem *bsys, BattleContext *ctx, int battlerIdAttacker, int battlerIdTarget, int moveNo);
void BattleSystem_CheckMoveEffect(BattleSystem *bsys, BattleContext *ctx, int battlerIdAttacker, int battlerIdTarget, int moveNo);
BOOL ov12_0224DC74(BattleContext *ctx, ControllerCommand a1, ControllerCommand a2, int a3);
BOOL ov12_0224DD18(BattleContext *ctx, ControllerCommand a1, ControllerCommand a2);
BOOL ov12_0224D7EC(BattleSystem *bsys, BattleContext *ctx);
BOOL ov12_0224D540(BattleSystem *bsys, BattleContext *ctx);

#endif
