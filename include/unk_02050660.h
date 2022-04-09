#ifndef POKEHEARTGOLD_UNK_02050660_H
#define POKEHEARTGOLD_UNK_02050660_H

#include "task.h"

void sub_02051428(TaskManager *taskManager, void *a1, int a2);
void SetupAndStartWildBattle(TaskManager *taskManager, u16 species, u8 level, struct BattleSetupStruct **p_battleSetup, BOOL canRun, BOOL shiny);
void sub_02051090(TaskManager *taskManager, u16 species, u8 level, struct BattleSetupStruct **p_battleSetup, BOOL canRun);
void sub_02051228(TaskManager *taskManager, u16 species, u8 level);
void SetupAndStartTutorialBattle(TaskManager *taskManager);

#endif //POKEHEARTGOLD_UNK_02050660_H
