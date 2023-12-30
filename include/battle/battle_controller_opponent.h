#ifndef POKEHEARTGOLD_BATTLE_CONTROLLER_OPPONENT_H
#define POKEHEARTGOLD_BATTLE_CONTROLLER_OPPONENT_H

#include "battle/battle.h"

u8 ov12_02261258(OpponentData *opponentData);
void *ov12_02261270(OpponentData *opponentData);
u32 ov12_02261264(OpponentData *opponentData);
BattleHpBar *OpponentData_GetHpBar(OpponentData *opponentData);

#endif
