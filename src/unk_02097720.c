#include "unk_02097720.h"
#include "unk_0203E348.h"
#include "unk_020552A4.h"

static BOOL sub_02097754(TaskManager *taskManager);

void sub_02097720(TaskManager *taskManager, u16* unknownPtr) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    UnkStruct_02097720 *data = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(UnkStruct_02097720));
    MI_CpuClear8(data, sizeof(UnkStruct_02097720));
    data->unknown_0 = 0;
    data->unknown_4 = unknownPtr;
    TaskManager_Call(taskManager, sub_02097754, data);
}

BOOL sub_02097754(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    UnkStruct_02097720* env = TaskManager_GetEnv(taskManager);

    switch (env->unknown_0) {
    case 0:
        env->unknown_8 = sub_0203EB64(fieldSystem);
        env->unknown_0++;
        break;
    case 1:
        if (FieldSystem_ApplicationIsRunning(fieldSystem) == FALSE) {
            *env->unknown_4 = env->unknown_8->unk1C;
            FreeToHeap(env->unknown_8);
            env->unknown_0++;
        }
        break;
    case 2:
        sub_020552A4(taskManager);
        env->unknown_0++;
        break;
    case 3:
        FreeToHeap(env);
        return TRUE;
    }

    return FALSE;
}
