#ifndef POKEHEARTGOLD_BATTLE_CONTROLLER_PLAYER_H
#define POKEHEARTGOLD_BATTLE_CONTROLLER_PLAYER_H

#include "battle.h"

BATTLECONTEXT *BattleContext_New(BattleSystem *bsys);
BOOL BattleMain(BattleSystem *bsys, BATTLECONTEXT *ctx);

//The following functions haven't been decompiled yet
void BattleSystem_CheckMoveHitEffect(BattleSystem *bsys, BATTLECONTEXT *ctx, int battlerIdA, int battlerIdB, int moveMsgNo);
void ov12_0224E384(BattleSystem *bsys, BATTLECONTEXT *ctx);

#endif
