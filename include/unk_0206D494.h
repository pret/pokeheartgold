#ifndef POKEHEARTGOLD_UNK_0206D494_H
#define POKEHEARTGOLD_UNK_0206D494_H

#include "pokemon_types_def.h"
#include "script.h"
#include "task.h"

BOOL MonIsInGameTradePoke(Pokemon *mon, u8 tradeno);
BOOL sub_0206D8D0(Pokemon *mon, SaveData *saveData);
BUGCONTEST *FieldSystem_BugContest_Get(FieldSystem *fieldSystem);
u16 *BugContest_GetSportBallsAddr(BUGCONTEST *contest);
void FieldSystem_IncrementBugContestTimer(FieldSystem *fieldSystem, int a1);
void FieldSystem_InitMystriStageGymmick(FieldSystem *fieldSystem);
void sub_0206DB58(TaskManager *taskman, FieldSystem *fieldSystem);
void sub_0206DB94(TaskManager *man, Pokemon* a1);

#endif //POKEHEARTGOLD_UNK_0206D494_H
