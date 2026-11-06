#include "unk_02092B04.h"

#include "field/fieldmap.h"

#include "bag_view.h"
#include "overlay_03.h"
#include "screen_fade.h"

static u8 Task_Bag_SellMenu_WaitBagView(FieldSystem *fieldSystem, MartData *martData);
static void Task_Bag_SellMenu_Return(TaskManager *taskman);

BOOL Task_Bag_SellMenu(TaskManager *taskman) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskman);
    MartData *martData = TaskManager_GetEnvironment(taskman);

    switch (martData->state) {
    case TASK_MART_SELLMENU_RUN:
        martData->state = Task_Bag_SellMenu_WaitBagView(fieldSystem, martData);
        break;
    case TASK_MART_SELLMENU_FINISH:
        Task_Bag_SellMenu_Return(taskman);
        break;
    }

    return FALSE;
}

static u8 Task_Bag_SellMenu_WaitBagView(FieldSystem *fieldSystem, MartData *martData) {
    if (FieldSystem_ApplicationIsRunning(fieldSystem)) {
        return TASK_MART_SELLMENU_RUN;
    }

    if (martData->unk2A0 != NULL) {
        martData->unk2A0[1] = sub_0207791C(martData->bagView);
    }
    Heap_Free(martData->bagView);
    FieldSystem_LoadFieldOverlay(fieldSystem);
    return TASK_MART_SELLMENU_FINISH;
}

static void Task_Bag_SellMenu_Return(TaskManager *taskman) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskman);
    MartData *martData = TaskManager_GetEnvironment(taskman);

    if (sub_020505C8(fieldSystem)) {
        FieldMap_FadeScreen(FADE_TYPE_BRIGHTNESS_IN);
        TaskManager_Jump(taskman, Task_Mart, martData);
        martData->state = TASK_MART_SELLMENU_RETURN;
    }
}
