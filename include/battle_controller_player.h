#ifndef POKEHEARTGOLD_BATTLE_CONTROLLER_PLAYER_H
#define POKEHEARTGOLD_BATTLE_CONTROLLER_PLAYER_H

#include "battle.h"

BATTLECONTEXT *BattleContext_New(BattleSystem *bsys);
BOOL BattleMain(BattleSystem *bsys, BATTLECONTEXT *ctx);
void BattleContext_Delete(BATTLECONTEXT *ctx);
void BattleSystem_CheckMoveHitEffect(BattleSystem *bsys, BATTLECONTEXT *ctx, int battlerIdAttacker, int battlerIdTarget, int moveNo);

//The following functions are static, but still refrenced in asm code
void BattleControllerPlayer_GetBattleMon(BattleSystem *bsys, BATTLECONTEXT *ctx);
void BattleControllerPlayer_StartEncounter(BattleSystem *bsys, BATTLECONTEXT *ctx);
void BattleControllerPlayer_TrainerMessage(BattleSystem *bsys, BATTLECONTEXT *ctx);
void BattleControllerPlayer_PokemonAppear(BattleSystem *bsys, BATTLECONTEXT *ctx);
void BattleControllerPlayer_SelectionScreenInit(BattleSystem *bsys, BATTLECONTEXT *ctx);
void BattleControllerPlayer_SelectionScreenInput(BattleSystem *bsys, BATTLECONTEXT *ctx);

//The following functions haven't been decompiled yet
void ov12_0224E384(BattleSystem *bsys, BATTLECONTEXT *ctx);
void BattleSystem_CheckMoveHit(BattleSystem *bsys, BATTLECONTEXT *ctx, int battlerIdAttacker, int battlerIdTarget, int moveNo);
void BattleSystem_CheckMoveEffect(BattleSystem *bsys, BATTLECONTEXT *ctx, int battlerIdAttacker, int battlerIdTarget, int moveNo);

#endif
