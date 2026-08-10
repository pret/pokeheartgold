#ifndef POKEHEARTGOLD_TRAINER_AI_H
#define POKEHEARTGOLD_TRAINER_AI_H

#include "battle.h"

void TrainerAI_Init(BattleSystem *battleSystem, BattleContext *ctx, u8 battlerID, u8 initScore);
u8 TrainerAI_Main(BattleSystem *battleSystem, u8 battlerID);

// static?
void TrainerAI_RecordLastMove(BattleSystem *battleSystem, BattleContext *ctx);
void TrainerAI_EvaluateMoves(BattleSystem *battleSystem, BattleContext *ctx);

#endif
