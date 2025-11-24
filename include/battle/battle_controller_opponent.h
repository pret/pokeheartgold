#ifndef POKEHEARTGOLD_BATTLE_CONTROLLER_OPPONENT_H
#define POKEHEARTGOLD_BATTLE_CONTROLLER_OPPONENT_H

#include "battle/battle.h"

u8 BattleController_GetOpponentFlags(OpponentData *opponentData);
void *ov12_02261270(OpponentData *opponentData);
u32 ov12_02261264(OpponentData *opponentData);
BattlerInfoBox *OpponentData_GetBattlerInfoBox(OpponentData *opponentData);
BattleCursorPosition *ov12_02261280(OpponentData *opponentData);

#endif
