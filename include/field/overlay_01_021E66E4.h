#ifndef POKEHEARTGOLD_FIELD_OVERLAY_01_021E66E4_H
#define POKEHEARTGOLD_FIELD_OVERLAY_01_021E66E4_H

#include "heap.h"
#include "sys_task.h"

struct FieldSystem;

typedef struct Field3dObjectTask Field3dObjectTask;

typedef void (*Field3dObjectTaskFunc)(Field3dObjectTask *task, struct FieldSystem *fieldSystem, void *data);

typedef struct Field3dObjectTaskTemplate {
    int taskPriority;
    u16 dataSize;
    Field3dObjectTaskFunc initFunc;
    Field3dObjectTaskFunc destroyFunc;
    Field3dObjectTaskFunc updateFunc;
    Field3dObjectTaskFunc renderFunc;
} Field3dObjectTaskTemplate;

struct Field3dObjectTask {
    struct Field3dObjectTaskManager *manager;
    SysTask *mainTask;
    SysTask *g3dRenderTask;
    const Field3dObjectTaskTemplate *param;
    void *data;
};

typedef struct Field3dObjectTaskManager {
    struct FieldSystem *fieldSystem;
    HeapID heapId;
    int max;
    Field3dObjectTask *tasks;
    SysTaskQueue *taskQueue;
} Field3dObjectTaskManager;

// @red031000: struct keyword is necessary because cannot double-typedef and cannot circular include
Field3dObjectTaskManager *Field3dObjectTaskManager_Create(struct FieldSystem *fieldSystem, HeapID heapId, int num);
void Field3dObjectTaskManager_Delete(Field3dObjectTaskManager *manager);
void Field3dObjectTaskManager_RunDrawTasks(Field3dObjectTaskManager *manager);
Field3dObjectTask *Field3dObjectTaskManager_CreateTask(Field3dObjectTaskManager *manager, const Field3dObjectTaskTemplate *template);
void Field3dObjectTask_Delete(Field3dObjectTask *task);
void *Field3dObjectTask_GetData(Field3dObjectTask *task);

#endif // POKEHEARTGOLD_FIELD_OVERLAY_01_021E66E4_H
