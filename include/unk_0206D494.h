#ifndef POKEHEARTGOLD_UNK_0206D494_H
#define POKEHEARTGOLD_UNK_0206D494_H

#include "npc_trade.h"
#include "pokemon_types_def.h"
#include "script.h"
#include "task.h"

BOOL sub_0206D494(FieldSystem *fieldSystem);
BOOL MonIsInGameTradePoke(Pokemon *mon, NpcTradeNum tradeNum);
BOOL MonIsFromTogepiEgg(Pokemon *mon, SaveData *saveData);
BugContest *FieldSystem_BugContest_Get(FieldSystem *fieldSystem);
u16 *BugContest_GetSportBallsAddr(BugContest *contest);
void FieldSystem_IncrementBugContestTimer(FieldSystem *fieldSystem, int duration);
void FieldSystem_InitMystriStageGymmick(FieldSystem *fieldSystem);
void BugContest_WarpToJudging(TaskManager *taskman, FieldSystem *fieldSystem);
void BugContest_PromptSwapPokemon(TaskManager *man, Pokemon *mon);

#endif // POKEHEARTGOLD_UNK_0206D494_H
