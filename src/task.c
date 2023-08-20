#include "task.h"
#include "unk_0203DFA4.h"

static TaskManager *Task_New(FieldSystem *fieldSystem, TaskFunc taskFunc, void *env) {
    TaskManager *taskman;

    taskman = AllocFromHeapAtEnd((HeapID)32, sizeof(TaskManager));
    taskman->prev = NULL;
    taskman->func = taskFunc;
    taskman->state = 0;
    taskman->env = env;
    taskman->unk10 = 0;
    taskman->unk14 = NULL;
    taskman->fieldSystem = fieldSystem;
    taskman->unk1C = AllocFromHeapAtEnd((HeapID)32, sizeof(TaskManagerUnkSub1C));
    return taskman;
}

TaskManager *FieldSystem_CreateTask(FieldSystem *fieldSystem, TaskFunc taskFunc, void *env) {
    TaskManager *ret;
    GF_ASSERT(fieldSystem->taskman == NULL);
    ret = Task_New(fieldSystem, taskFunc, env);
    fieldSystem->taskman = ret;
    return ret;
}

void TaskManager_Jump(TaskManager *taskman, TaskFunc taskFunc, void *env) {
    taskman->func = taskFunc;
    taskman->state = 0;
    taskman->env = env;
    if (taskman->unk14 != NULL || taskman->unk14 != NULL) {
        FreeToHeap(taskman->unk14);
        taskman->unk10 = 0;
        taskman->unk14 = NULL;
    }
}

// Synchronously executes a new task, returning to the current task `taskman`
// once finished.
void TaskManager_Call(TaskManager *taskman, TaskFunc taskFunc, void *env) {
    TaskManager *newman;

    newman = Task_New(taskman->fieldSystem, taskFunc, env);
    newman->prev = taskman;
    taskman->fieldSystem->taskman = newman;
}

BOOL FieldSystem_RunTaskFrame(FieldSystem *fieldSystem) {
    TaskManager *prevTask;

    if (fieldSystem->taskman == 0) {
        return FALSE;
    }
    while (fieldSystem->taskman->func(fieldSystem->taskman) == TRUE) {
        prevTask = fieldSystem->taskman->prev;
        if (fieldSystem->taskman->unk14 != NULL) {
            FreeToHeap(fieldSystem->taskman->unk14);
        }
        FreeToHeap(fieldSystem->taskman->unk1C);
        FreeToHeap(fieldSystem->taskman);
        fieldSystem->taskman = prevTask;
        if (prevTask == NULL) {
            return TRUE;
        }
    }
    return FALSE;
}

BOOL FieldSystem_TaskIsRunning(FieldSystem *fieldSystem) {
    return fieldSystem->taskman != NULL;
}

BOOL FieldSystem_ApplicationIsRunning(FieldSystem *fieldSystem) {
    return sub_0203DF7C(fieldSystem) || sub_0203DFA4(fieldSystem);
}

void sub_020505C0(FieldSystem *fieldSystem) {
    sub_0203DEF0(fieldSystem);
}

BOOL sub_020505C8(FieldSystem *fieldSystem) {
    return sub_0203DF8C(fieldSystem) != FALSE;
}

static BOOL Task_RunApplicationUntilComplete(TaskManager *taskManager) {
    FieldSystem *fieldSystem;
    struct UnkTaskEnv *env;

    fieldSystem = TaskManager_GetFieldSystem(taskManager);
    env = TaskManager_GetEnv(taskManager);

    switch (env->state) {
    case 0:
        FieldSystem_LaunchApplication(fieldSystem, env->template, env->work);
        env->state++;
        break;
    case 1:
        if (!FieldSystem_ApplicationIsRunning(fieldSystem)) {
            FreeToHeap(env);
            return TRUE;
        }
        break;
    }
    return FALSE;
}

void CallApplicationAsTask(TaskManager *taskManager, const OVY_MGR_TEMPLATE *template, void *work) {
    struct UnkTaskEnv *env;

    env = AllocFromHeapAtEnd((HeapID)32, sizeof(struct UnkTaskEnv));
    env->state = 0;
    env->template = template;
    env->work = work;
    TaskManager_Call(taskManager, Task_RunApplicationUntilComplete, env);
}

FieldSystem *TaskManager_GetFieldSystem(TaskManager *taskManager) {
    return taskManager->fieldSystem;
}

void *TaskManager_GetEnv(TaskManager *taskManager) {
    return taskManager->env;
}

u32 *TaskManager_GetStatePtr(TaskManager *taskManager) {
    return &taskManager->state;
}

u32 sub_02050658(TaskManager *taskManager) {
    return taskManager->unk1C->unk0;
}
