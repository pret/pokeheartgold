#ifndef POKEHEARTGOLD_BATTLE_CONTROLLER_PLAYER_H
#define POKEHEARTGOLD_BATTLE_CONTROLLER_PLAYER_H

#include "battle/battle.h"

BattleContext *BattleContext_New(BattleSystem *battleSystem);
BOOL BattleContext_Main(BattleSystem *battleSystem, BattleContext *ctx);
void BattleContext_Delete(BattleContext *ctx);
void BattleSystem_CheckMoveHitEffect(BattleSystem *battleSystem, BattleContext *ctx, int battlerIdAttacker, int battlerIdTarget, int moveNo);

#endif
