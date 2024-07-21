#include "field_system.h"
#include "heap.h"
#include "launch_application.h"
#include "task.h"
#include "unk_0200FA24.h"
#include "unk_02097D3C.h"

static BOOL sub_02097D80(TaskManager *taskManager);

void sub_02097D3C(FieldSystem *fieldSystem, u8 a1, u8 a2) {
    UnkStruct_02097D48 *taskData = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(UnkStruct_02097D48));
    taskData->state = 0;
    taskData->args = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(UnkStruct_02097D56));
    taskData->args->saveData = FieldSystem_GetSaveData(fieldSystem);
    taskData->args->unk_0 = a1;
    taskData->args->unk_2 = a2;
    TaskManager_Call(fieldSystem->taskman, sub_02097D80, taskData);
}

static BOOL sub_02097D80(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    UnkStruct_02097D48 *taskData = TaskManager_GetEnvironment(taskManager);

    switch (taskData->state) {
    case 0:
        BeginNormalPaletteFade(0, 0, 0, RGB_BLACK, 6, 1, HEAP_ID_4);
        taskData->state++;

        break;
    case 1:
        if (!IsPaletteFadeFinished()) {
            break;
        }

        sub_0203FD08(fieldSystem, taskData->args);
        sub_0203E30C();
        taskData->state++;
        break;
    case 2:
        if (FieldSystem_ApplicationIsRunning(fieldSystem)) {
            break;
        }

        taskData->state++;
        sub_020505C0(fieldSystem);
        break;
    case 3:
        if (sub_020505C8(fieldSystem)) {
            BeginNormalPaletteFade(0, 1, 1, RGB_BLACK, 6, 1, HEAP_ID_4);
            taskData->state++;
        }

        break;
    case 4:
        if (!IsPaletteFadeFinished()) {
            break;
        }

        FreeToHeap(taskData->args);
        FreeToHeap(taskData);
        return TRUE;
    }

    return FALSE;
}
