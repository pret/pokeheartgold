#include "unk_02097D3C.h"

#include "field_system.h"
#include "heap.h"
#include "launch_application.h"
#include "task.h"
#include "unk_0200FA24.h"

static BOOL Task_ViewRankingsApp(TaskManager *taskManager);

void FieldSystem_LaunchTask_ViewRankingsApp(FieldSystem *fieldSystem, u8 pageScrollParam, u8 cursorPos) {
    UnkStruct_02097D48 *taskData = Heap_AllocAtEnd(HEAP_ID_FIELD2, sizeof(UnkStruct_02097D48));
    taskData->state = 0;
    taskData->args = Heap_AllocAtEnd(HEAP_ID_FIELD2, sizeof(ViewRankingsArgs));
    taskData->args->saveData = FieldSystem_GetSaveData(fieldSystem);
    taskData->args->page_scroll = pageScrollParam;
    taskData->args->cursorPos = cursorPos;
    TaskManager_Call(fieldSystem->taskman, Task_ViewRankingsApp, taskData);
}

static BOOL Task_ViewRankingsApp(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    UnkStruct_02097D48 *taskData = TaskManager_GetEnvironment(taskManager);

    switch (taskData->state) {
    case 0:
        BeginNormalPaletteFade(0, 0, 0, RGB_BLACK, 6, 1, HEAP_ID_FIELD1);
        taskData->state++;

        break;
    case 1:
        if (!IsPaletteFadeFinished()) {
            break;
        }

        LaunchApp_ViewRankings(fieldSystem, taskData->args);
        sub_0203E30C();
        taskData->state++;
        break;
    case 2:
        if (FieldSystem_ApplicationIsRunning(fieldSystem)) {
            break;
        }

        taskData->state++;
        FieldSystem_LoadFieldOverlay(fieldSystem);
        break;
    case 3:
        if (sub_020505C8(fieldSystem)) {
            BeginNormalPaletteFade(0, 1, 1, RGB_BLACK, 6, 1, HEAP_ID_FIELD1);
            taskData->state++;
        }

        break;
    case 4:
        if (!IsPaletteFadeFinished()) {
            break;
        }

        Heap_Free(taskData->args);
        Heap_Free(taskData);
        return TRUE;
    }

    return FALSE;
}
