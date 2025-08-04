#include "field/overlay_01_021E66E4.h"

#include "global.h"

#include "field_system.h"

static void Task_Field3dObject_Update(SysTask *task, void *taskdata);
static void Task_Field3dObject_Render(SysTask *task, void *taskData);

Field3dObjectTaskManager *Field3dObjectTaskManager_Create(struct FieldSystem *fieldSystem, enum HeapID heapID, int num) {
    Field3dObjectTaskManager *ret = Heap_Alloc(heapID, sizeof(Field3dObjectTaskManager));
    ret->fieldSystem = fieldSystem;
    ret->heapID = heapID;
    ret->max = num;
    ret->tasks = Heap_Alloc(heapID, num * sizeof(Field3dObjectTask));
    MI_CpuClear32(ret->tasks, num * sizeof(Field3dObjectTask));
    ret->taskQueue = (SysTaskQueue *)Heap_Alloc(heapID, SysTaskQueue_GetArenaSize(num));
    ret->taskQueue = SysTaskQueue_PlacementNew(num, ret->taskQueue);
    return ret;
}

void Field3dObjectTaskManager_Delete(Field3dObjectTaskManager *manager) {
    for (int i = 0; i < manager->max; ++i) {
        Field3dObjectTask_Delete(&manager->tasks[i]);
    }
    Heap_Free(manager->tasks);
    Heap_Free(manager->taskQueue);
    Heap_Free(manager);
}

void Field3dObjectTaskManager_RunDrawTasks(Field3dObjectTaskManager *manager) {
    SysTaskQueue_RunTasks(manager->taskQueue);
}

static void Task_Field3dObject_Update(SysTask *task, void *taskData) {
    Field3dObjectTask *objTask = (Field3dObjectTask *)taskData;
    if (sub_0203DF8C(objTask->manager->fieldSystem)) {
        if (objTask->param->updateFunc != NULL) {
            objTask->param->updateFunc(objTask, objTask->manager->fieldSystem, objTask->data);
        }
    }
}

static void Task_Field3dObject_Render(SysTask *task, void *taskData) {
    Field3dObjectTask *objTask = (Field3dObjectTask *)taskData;
    if (sub_0203DF8C(objTask->manager->fieldSystem)) {
        if (objTask->param->renderFunc != NULL) {
            objTask->param->renderFunc(objTask, objTask->manager->fieldSystem, objTask->data);
        }
    }
}

Field3dObjectTask *Field3dObjectTaskManager_CreateTask(Field3dObjectTaskManager *manager, const Field3dObjectTaskTemplate *template) {
    int i;
    Field3dObjectTask *ret;
    for (ret = manager->tasks, i = 0; i < manager->max; ++ret, ++i) {
        if (ret->mainTask == NULL) {
            ret->mainTask = SysTask_CreateOnMainQueue(Task_Field3dObject_Update, ret, template->taskPriority);
            ret->g3dRenderTask = SysTaskQueue_InsertTask(manager->taskQueue, Task_Field3dObject_Render, ret, template->taskPriority);
            ret->manager = manager;
            ret->param = template;
            GF_ASSERT(ret->mainTask != NULL);
            GF_ASSERT(ret->g3dRenderTask != NULL);
            if (template->dataSize != 0) {
                ret->data = Heap_Alloc(manager->heapID, template->dataSize);
            }
            if (template->initFunc != NULL) {
                template->initFunc(ret, manager->fieldSystem, ret->data);
            }
            return ret;
        }
    }

    GF_ASSERT(FALSE);
    return NULL;
}

void Field3dObjectTask_Delete(Field3dObjectTask *task) {
    if (task->mainTask != NULL) {
        if (task->param->destroyFunc != NULL) {
            task->param->destroyFunc(task, task->manager->fieldSystem, task->data);
        }
        if (task->param->dataSize != 0) {
            Heap_Free(task->data);
        }
        SysTask_Destroy(task->mainTask);
        SysTask_Destroy(task->g3dRenderTask);
        MI_CpuClear32(task, sizeof(Field3dObjectTask));
    }
}

void *Field3dObjectTask_GetData(Field3dObjectTask *task) {
    return task->data;
}
