#ifndef POKEHEARTGOLD_BATTLE_CONTROLLER_COMMAND_H
#define POKEHEARTGOLD_BATTLE_CONTROLLER_COMMAND_H

#include "battle/battle.h"

void BattleSystem_ExecuteBattlerCommand(BattleSystem *battleSys, OpponentData *OpponentData);
void OpponentData_Delete(BattleSystem *battleSys, OpponentData *opponentData, int renderMode);

#endif
