#ifndef POKEHEARTGOLD_TRAINER_AI_H
#define POKEHEARTGOLD_TRAINER_AI_H

#include "battle.h"

void TrainerAI_Init(BattleSystem *battleSystem, BattleContext *ctx, u8 battlerID, u8 initScore);
u8 TrainerAI_Main(BattleSystem *battleSystem, u8 battlerID);
int TrainerAI_PickCommand(BattleSystem *battleSystem, int battler);

#endif
