#ifndef POKEHEARTGOLD_TASK_H
#define POKEHEARTGOLD_TASK_H

#include "fieldmap.h"
#include "overlay_manager.h"

typedef struct TaskManager TaskManager;
typedef BOOL (*TaskFunc)(TaskManager *taskman);

typedef struct TaskManagerUnkSub1C {
    u32 unk0;
} TaskManagerUnkSub1C;

struct UnkTaskEnv {
    int state;
    const OVY_MGR_TEMPLATE *template;
    void *work;
};

struct TaskManager {
    TaskManager *prev;
    TaskFunc func;
    u32 state;
    void *env;
    u32 unk10;
    void *unk14;
    FieldSystem *fsys;
    TaskManagerUnkSub1C *unk1C; // size=4
};

TaskManager *FieldSys_CreateTask(FieldSystem *fsys, TaskFunc taskFunc, void *env);
void TaskManager_Jump(TaskManager *taskman, TaskFunc taskFunc, void *env);
void TaskManager_Call(TaskManager *taskman, TaskFunc taskFunc, void *env);
BOOL Fsys_RunTaskFrame(FieldSystem *fsys);
BOOL Fsys_TaskIsRunning(FieldSystem *fsys);
BOOL FieldSys_ApplicationIsRunning(FieldSystem *fsys);
void sub_020505C0(FieldSystem *fsys);
BOOL sub_020505C8(FieldSystem *fsys);
void CallApplicationAsTask(TaskManager *taskManager, const OVY_MGR_TEMPLATE *template, void *work);
FieldSystem *TaskManager_GetSys(TaskManager *taskManager);
void *TaskManager_GetEnv(TaskManager *taskManager);
u32 *TaskManager_GetStatePtr(TaskManager *taskManager);
u32 sub_02050658(TaskManager *taskManager);

#endif //POKEHEARTGOLD_TASK_H
