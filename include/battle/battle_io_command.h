#ifndef POKEHEARTGOLD_BATTLE_BATTLE_IO_COMMAND_H
#define POKEHEARTGOLD_BATTLE_BATTLE_IO_COMMAND_H

#include "battle/battle.h"

void BattleSystem_ExecuteBattlerCommand(BattleSystem *battleSystem, OpponentData *OpponentData);
void OpponentData_Delete(BattleSystem *battleSystem, OpponentData *opponentData, int renderMode);

#endif
