#ifndef POKEHEARTGOLD_SYS_TASK_H
#define POKEHEARTGOLD_SYS_TASK_H

#include "global.h"

typedef struct SysTask SysTask;
typedef struct SysTaskQueue SysTaskQueue;
typedef void (*SysTaskFunc)(SysTask *task, void *data);

struct SysTask {
    SysTaskQueue *queue;
    SysTask *prev;
    SysTask *next;
    u32 priority;
    void *data;
    SysTaskFunc func;
    u32 runNow;
};

struct SysTaskQueue {
    u16 limit;
    u16 activeCount;
    SysTask headSentinel;
    SysTask **taskStack;
    SysTask *taskList;
    BOOL isInsertingTask;
    SysTask *runningTask;
    SysTask *nextTask;
};

void SysTaskQueue_RunTasks(SysTaskQueue *a0);
u32 SysTaskQueue_GetArenaSize(u32 num);
SysTaskQueue *SysTaskQueue_PlacementNew(u32 num, void *p_mem);
void *SysTask_GetData(SysTask *task);
SysTask *SysTaskQueue_InsertTask(SysTaskQueue *queue, SysTaskFunc func, void *arg, u32 priority);
void SysTask_SetFunc(SysTask *task, SysTaskFunc func);
BOOL SysTask_Unlink(SysTask *task);
u32 SysTask_GetPriority(SysTask *task);

#endif // POKEHEARTGOLD_SYS_TASK_H
