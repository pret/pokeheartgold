#ifndef POKEHEARTGOLD_BATTLE_CONTROLLER_OPPONENT_H
#define POKEHEARTGOLD_BATTLE_CONTROLLER_OPPONENT_H

#include "battle/battle.h"

u8 OpponentData_GetBattlerType(OpponentData *opponentData);
void *OpponentData_GetPokepic(OpponentData *opponentData);
u32 ov12_02261264(OpponentData *opponentData);
BattleHpBar *OpponentData_GetHpBar(OpponentData *opponentData);
BattleCursorPosition *OpponentData_GetBattleCursorPosition(OpponentData *opponentData);
void OpponentData_SetTrainerVisibility(OpponentData *opponentData, s32);

#endif
