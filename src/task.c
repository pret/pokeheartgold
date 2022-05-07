#include "task.h"
#include "unk_0203DFA4.h"

static TaskManager *Task_new(FieldSystem *fsys, TaskFunc taskFunc, void *env) {
    TaskManager *taskman;

    taskman = AllocFromHeapAtEnd((HeapID)32, sizeof(TaskManager));
    taskman->prev = NULL;
    taskman->func = taskFunc;
    taskman->state = 0;
    taskman->env = env;
    taskman->unk10 = 0;
    taskman->unk14 = NULL;
    taskman->fsys = fsys;
    taskman->unk1C = AllocFromHeapAtEnd((HeapID)32, sizeof(TaskManagerUnkSub1C));
    return taskman;
}

TaskManager *FieldSys_CreateTask(FieldSystem *fsys, TaskFunc taskFunc, void *env) {
    TaskManager *ret;
    GF_ASSERT(fsys->taskman == NULL);
    ret = Task_new(fsys, taskFunc, env);
    fsys->taskman = ret;
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

    newman = Task_new(taskman->fsys, taskFunc, env);
    newman->prev = taskman;
    taskman->fsys->taskman = newman;
}

BOOL Fsys_RunTaskFrame(FieldSystem *fsys) {
    TaskManager *prevTask;

    if (fsys->taskman == 0) {
        return FALSE;
    }
    while (fsys->taskman->func(fsys->taskman) == TRUE) {
        prevTask = fsys->taskman->prev;
        if (fsys->taskman->unk14 != NULL) {
            FreeToHeap(fsys->taskman->unk14);
        }
        FreeToHeap(fsys->taskman->unk1C);
        FreeToHeap(fsys->taskman);
        fsys->taskman = prevTask;
        if (prevTask == NULL) {
            return TRUE;
        }
    }
    return FALSE;
}

BOOL Fsys_TaskIsRunning(FieldSystem *fsys) {
    return fsys->taskman != NULL;
}

BOOL FieldSys_ApplicationIsRunning(FieldSystem *fsys) {
    return sub_0203DF7C(fsys) || sub_0203DFA4(fsys);
}

void sub_020505C0(FieldSystem *fsys) {
    sub_0203DEF0(fsys);
}

BOOL sub_020505C8(FieldSystem *fsys) {
    return sub_0203DF8C(fsys) != FALSE;
}

static BOOL Task_RunApplicationUntilComplete(TaskManager *taskManager) {
    FieldSystem *fsys;
    struct UnkTaskEnv *env;

    fsys = TaskManager_GetSys(taskManager);
    env = TaskManager_GetEnv(taskManager);

    switch (env->state) {
    case 0:
        Fsys_LaunchApplication(fsys, env->template, env->work);
        env->state++;
        break;
    case 1:
        if (!FieldSys_ApplicationIsRunning(fsys)) {
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

FieldSystem *TaskManager_GetSys(TaskManager *taskManager) {
    return taskManager->fsys;
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
