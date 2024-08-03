#ifndef POKEHEARTGOLD_FIELD_WARP_TASKS_H
#define POKEHEARTGOLD_FIELD_WARP_TASKS_H

#include "task.h"

void sub_02053018(FieldSystem *fieldSystem);
void sub_02053038(FieldSystem *fieldSystem, BOOL isConnection);
TaskManager *CallFieldTask_NewGame(FieldSystem *fieldSystem);
TaskManager *CallFieldTask_ContinueGame_Normal(FieldSystem *fieldSystem);
TaskManager *CallFieldTask_ContinueGame_CommError(FieldSystem *fieldSystem);
void sub_020537A8(TaskManager *taskManager, const Location *location);
void sub_020537F0(TaskManager *taskManager, u32 mapId, int warpId, int x, int y, int direction);
void CallTask_ScriptWarp(TaskManager *taskManager, u32 mapId, int warpId, int x, int y, int direction);
TaskManager *sub_020538C0(FieldSystem *fieldSystem, u32 mapId, int warpId, int x, int y, int direction);
void sub_02053908(TaskManager *taskManager, u32 mapId, int warpId, int x, int y, int direction);
void sub_02053B04(TaskManager *taskManager, Location *location, int a2);
TaskManager *sub_02053E08(FieldSystem *fieldSystem, u32 mapId, int warpId);
void sub_02053F14(FieldSystem *fieldSystem);
void sub_02054030(TaskManager *taskManager);
void sub_0205412C(TaskManager *taskManager, u32 mapId, int warpId, int x, int y, int direction);
void sub_02054190(TaskManager *taskManager);

#endif // POKEHEARTGOLD_FIELD_WARP_TASKS_H
