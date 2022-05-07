#ifndef POKEHEARTGOLD_UNK_02050660_H
#define POKEHEARTGOLD_UNK_02050660_H

#include "field_player_avatar.h"
#include "task.h"

void sub_02051428(TaskManager *taskManager, void *a1, int a2);
void SetupAndStartWildBattle(TaskManager *taskManager, u16 species, u8 level, struct BattleSetupStruct **p_battleSetup, BOOL canRun, BOOL shiny);
void sub_02051090(TaskManager *taskManager, u16 species, u8 level, struct BattleSetupStruct **p_battleSetup, BOOL canRun);
void sub_02051228(TaskManager *taskManager, u16 species, u8 level);
void SetupAndStartTutorialBattle(TaskManager *taskManager);
void SetupAndStartTrainerBattle(TaskManager *taskManager, u16 a1, u16 a2, u16 followerTrainerNum, u8 a4, u8 a5, int a6, u32 *scriptUnk0C);
void sub_02050B90(FieldSystem *fsys, TaskManager *taskManager, int a2);

#endif //POKEHEARTGOLD_UNK_02050660_H
