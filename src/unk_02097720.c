#include "unk_02097720.h"
#include "unk_0203E348.h"

static BOOL sub_02097754(TaskManager *taskManager);

void sub_02097720(TaskManager *taskManager, u16* unknownPtr) {
    FieldSystem *fsys = TaskManager_GetSys(taskManager);
    UnkStruct_02097720 *data = AllocFromHeapAtEnd(0xb, sizeof(UnkStruct_02097720));
    MI_CpuClear8(data, sizeof(UnkStruct_02097720));
    data->unknown_0 = 0;
    data->unknown_4 = unknownPtr;
    TaskManager_Call(taskManager, sub_02097754, data);
}

BOOL sub_02097754(TaskManager *taskManager) {
    FieldSystem *fsys = TaskManager_GetSys(taskManager);
    UnkStruct_02097720* env = TaskManager_GetEnv(taskManager);

    switch (env->unknown_0) {
    case 0:
        env->unknown_8 = sub_0203EB64(fsys);
        env->unknown_0++;
        break;
    case 1:
        if (FieldSys_ApplicationIsRunning(fsys) == FALSE) {
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
