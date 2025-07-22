#include "unk_02097720.h"

#include "launch_application.h"
#include "unk_020552A4.h"

static BOOL sub_02097754(TaskManager *taskManager);

void sub_02097720(TaskManager *taskManager, u16 *unknownPtr) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    UnkStruct_02097720 *data = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(UnkStruct_02097720));
    MI_CpuClear8(data, sizeof(UnkStruct_02097720));
    data->state = 0;
    data->unknown_4 = unknownPtr;
    TaskManager_Call(taskManager, sub_02097754, data);
}

static BOOL sub_02097754(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    UnkStruct_02097720 *env = TaskManager_GetEnvironment(taskManager);

    switch (env->state) {
    case 0:
        env->safariDecorationArgs = SafariDecoration_LaunchApp(fieldSystem);
        env->state++;
        break;
    case 1:
        if (FieldSystem_ApplicationIsRunning(fieldSystem) == FALSE) {
            *env->unknown_4 = env->safariDecorationArgs->unk1C;
            Heap_Free(env->safariDecorationArgs);
            env->state++;
        }
        break;
    case 2:
        CallTask_RestoreOverworld(taskManager);
        env->state++;
        break;
    case 3:
        Heap_Free(env);
        return TRUE;
    }

    return FALSE;
}
