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
void ov12_02249190(BattleSystem *bsys, BATTLECONTEXT *ctx);
void ov12_0224930C(BattleSystem *bsys, BATTLECONTEXT *ctx);
void ov12_02249460(BattleSystem *bsys, BATTLECONTEXT *ctx);
void BattleControllerPlayer_UpdateFieldCondition(BattleSystem *bsys, BATTLECONTEXT *ctx);
void BattleControllerPlayer_UpdateMonCondition(BattleSystem *bsys, BATTLECONTEXT *ctx);
void ov12_0224A70C(BattleSystem *bsys, BATTLECONTEXT *ctx);
void BattleControllerPlayer_TurnEnd(BattleSystem *bsys, BATTLECONTEXT *ctx);
void BattleControllerPlayer_FightInput(BattleSystem *bsys, BATTLECONTEXT *ctx);
void BattleControllerPlayer_ItemInput(BattleSystem *bsys, BATTLECONTEXT *ctx);
void BattleControllerPlayer_PokemonInput(BattleSystem *bsys, BATTLECONTEXT *ctx);
void BattleControllerPlayer_RunInput(BattleSystem *bsys, BATTLECONTEXT *ctx);

//The following functions haven't been decompiled yet
void ov12_0224E384(BattleSystem *bsys, BATTLECONTEXT *ctx);
void BattleSystem_CheckMoveHit(BattleSystem *bsys, BATTLECONTEXT *ctx, int battlerIdAttacker, int battlerIdTarget, int moveNo);
void BattleSystem_CheckMoveEffect(BattleSystem *bsys, BATTLECONTEXT *ctx, int battlerIdAttacker, int battlerIdTarget, int moveNo);
BOOL ov12_0224DC74(BATTLECONTEXT *ctx, ControllerCommand a1, ControllerCommand a2, int a3);
BOOL ov12_0224DD18(BATTLECONTEXT *ctx, ControllerCommand a1, ControllerCommand a2);
BOOL ov12_0224D7EC(BattleSystem *bsys, BATTLECONTEXT *ctx);
BOOL ov12_0224D540(BattleSystem *bsys, BATTLECONTEXT *ctx);

#endif
