#include "field/overlay_01_021FB368.h"

#include "field_system.h"
#include "overlay_01.h"
#include "overlay_01_022053EC.h"
#include "overlay_04.h"
#include "task.h"
#include "unk_02005D10.h"

#define ELEVATOR_Y_DOWN  (FX32_CONST(32))
#define ELEVATOR_Y_UP    (FX32_CONST(496))
#define ELEVATOR_Y_SPEED (FX32_CONST(16))

typedef struct VioletGymElevatorTaskData {
    int state;
    FieldSystem *fieldSystem;
} VioletGymElevatorTaskData;

static BOOL Task_VioletGymmick_ElevatorUp(TaskManager *taskman);
static BOOL Task_VioletGymmick_ElevatorDown(TaskManager *taskman);
static void SysTask_ElevatorUp(SysTask *sysTask, void *taskData);
static void SysTask_ElevatorDown(SysTask *sysTask, void *taskData);

static const GXRgb sEdgeColorTable[] = {
    GX_RGB(0, 0, 0),
    GX_RGB(9, 9, 9),
    GX_RGB(16, 11, 4),
    GX_RGB(20, 28, 31),
    GX_RGB(4, 4, 4),
    GX_RGB(4, 4, 4),
    GX_RGB(4, 4, 4),
    GX_RGB(4, 4, 4),
};

static inline fx32 GymmickInit_Violet_sub(u8 state) {
    switch (state) {
    case 0:
        return ELEVATOR_Y_DOWN;
    case 1:
        return ELEVATOR_Y_UP;
    default:
        GF_ASSERT(FALSE);
        return ELEVATOR_Y_DOWN;
    }
}

void GymmickInit_Violet(FieldSystem *fieldSystem) {
    GymmickUnion *gymmick = Save_Gymmick_AssertMagic_GetData(Save_GetGymmickPtr(FieldSystem_GetSaveData(fieldSystem)), GYMMICK_VIOLET);
    VecFx32 sp18 = {
        FX32_CONST(0xF8),
        0,
        FX32_CONST(0x148),
    };
    MapPropManager_LoadOne(fieldSystem->mapPropManager, 111, &sp18, 0, fieldSystem->mapPropAnimationManager);
    ov01_021FB3E4(0, 14, 19, 3, 3, FX32_CONST(32), fieldSystem->dynamicTerrainHeightManager);
    fx32 y = GymmickInit_Violet_sub(gymmick->violet.liftState);
    MapProp *mapProp = MapPropManager_FindMapPropByBuildModel(fieldSystem->mapPropManager, 111);
    VecFx32 translation;
    MapProp_GetTranslation(&translation, mapProp);
    translation.y = y;
    MapProp_SetTranslation(mapProp, &translation);
    ov01_021FB4A0(0, y, fieldSystem->dynamicTerrainHeightManager);
    G3X_SetEdgeColorTable(sEdgeColorTable);
}

void VioletGymmick_ElevatorAction(FieldSystem *fieldSystem) {
    VecFx32 playerPosition;
    VioletGymElevatorTaskData *taskData = Heap_AllocAtEnd(HEAP_ID_FIELD2, sizeof(VioletGymElevatorTaskData));
    taskData->state = 0;
    taskData->fieldSystem = fieldSystem;

    GymmickUnion *gymmick = Save_Gymmick_AssertMagic_GetData(Save_GetGymmickPtr(FieldSystem_GetSaveData(fieldSystem)), GYMMICK_VIOLET);
    PlayerAvatar_CopyPositionVector(fieldSystem->playerAvatar, &playerPosition);
    if (playerPosition.y == ELEVATOR_Y_DOWN) {
        TaskManager_Call(fieldSystem->taskman, Task_VioletGymmick_ElevatorUp, taskData);
        gymmick->violet.liftState = 1;
    } else {
        TaskManager_Call(fieldSystem->taskman, Task_VioletGymmick_ElevatorDown, taskData);
        gymmick->violet.liftState = 0;
    }
}

static BOOL Task_VioletGymmick_ElevatorUp(TaskManager *taskman) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskman);
    VioletGymElevatorTaskData *taskData = TaskManager_GetEnvironment(taskman);

    switch (taskData->state) {
    case 0:
        // decomper's note: taskman == fieldSystem->taskman
        TaskManager_Call(fieldSystem->taskman, ov01_02205A60, NULL);
        ++taskData->state;
        break;
    case 1:
        SysTask_CreateOnMainQueue(SysTask_ElevatorUp, taskData, 0);
        ++taskData->state;
        break;
    case 5:
        Heap_Free(taskData);
        return TRUE;
    }

    return FALSE;
}

static BOOL Task_VioletGymmick_ElevatorDown(TaskManager *taskman) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskman);
    VioletGymElevatorTaskData *taskData = TaskManager_GetEnvironment(taskman);

    switch (taskData->state) {
    case 0:
        // decomper's note: taskman == fieldSystem->taskman
        TaskManager_Call(fieldSystem->taskman, ov01_02205A60, NULL);
        ++taskData->state;
        break;
    case 1:
        SysTask_CreateOnMainQueue(SysTask_ElevatorDown, taskData, 0);
        ++taskData->state;
        break;
    case 5:
        Heap_Free(taskData);
        return TRUE;
    }

    return FALSE;
}

static void SysTask_ElevatorUp(SysTask *sysTask, void *taskData) {
    VioletGymElevatorTaskData *violetTaskData = taskData;
    FieldSystem *fieldSystem = violetTaskData->fieldSystem;

    switch (violetTaskData->state) {
    case 2:
        PlayerAvatar_ToggleAutomaticHeightUpdating(fieldSystem->playerAvatar, FALSE);
        PlaySE(SEQ_SE_DP_ELEBETA);
        ++violetTaskData->state;
        break;
    case 3: {
        MapProp *mapProp = MapPropManager_FindMapPropByBuildModel(fieldSystem->mapPropManager, 111);
        VecFx32 elevatorTranslation;
        MapProp_GetTranslation(&elevatorTranslation, mapProp);
        elevatorTranslation.y += ELEVATOR_Y_SPEED;
        if (elevatorTranslation.y >= ELEVATOR_Y_UP) {
            elevatorTranslation.y = ELEVATOR_Y_UP;
            StopSE(SEQ_SE_DP_ELEBETA, 0);
            ++violetTaskData->state;
        }
        VecFx32 playerPosition;
        PlayerAvatar_CopyPositionVector(fieldSystem->playerAvatar, &playerPosition);
        playerPosition.y += ELEVATOR_Y_SPEED;
        PlayerAvatar_SetMapObjectYPosition(fieldSystem->playerAvatar, playerPosition.y);
        ov01_02205A34(fieldSystem, playerPosition.y);
        MapProp_SetTranslation(mapProp, &elevatorTranslation);
    } break;
    case 4:
        ov01_021FB4A0(0, ELEVATOR_Y_UP, fieldSystem->dynamicTerrainHeightManager);
        PlayerAvatar_ToggleAutomaticHeightUpdatingImmediate(fieldSystem->playerAvatar, TRUE);
        PlaySE(SEQ_SE_DP_KI_GASYAN);
        SysTask_Destroy(sysTask);
        ++violetTaskData->state;
        break;
    }
}

static void SysTask_ElevatorDown(SysTask *sysTask, void *taskData) {
    VioletGymElevatorTaskData *violetTaskData = taskData;
    FieldSystem *fieldSystem = violetTaskData->fieldSystem;

    switch (violetTaskData->state) {
    case 2:
        PlayerAvatar_ToggleAutomaticHeightUpdating(fieldSystem->playerAvatar, FALSE);
        PlaySE(SEQ_SE_DP_ELEBETA);
        ++violetTaskData->state;
        break;
    case 3: {
        MapProp *mapProp = MapPropManager_FindMapPropByBuildModel(fieldSystem->mapPropManager, 111);
        VecFx32 elevatorTranslation;
        MapProp_GetTranslation(&elevatorTranslation, mapProp);
        elevatorTranslation.y -= ELEVATOR_Y_SPEED;
        if (elevatorTranslation.y <= ELEVATOR_Y_DOWN) {
            elevatorTranslation.y = ELEVATOR_Y_DOWN;
            StopSE(SEQ_SE_DP_ELEBETA, 0);
            ++violetTaskData->state;
        }
        VecFx32 playerPosition;
        PlayerAvatar_CopyPositionVector(fieldSystem->playerAvatar, &playerPosition);
        playerPosition.y -= ELEVATOR_Y_SPEED;
        PlayerAvatar_SetMapObjectYPosition(fieldSystem->playerAvatar, playerPosition.y);
        ov01_02205A34(fieldSystem, playerPosition.y);
        MapProp_SetTranslation(mapProp, &elevatorTranslation);
    } break;
    case 4:
        ov01_021FB4A0(0, ELEVATOR_Y_DOWN, fieldSystem->dynamicTerrainHeightManager);
        PlayerAvatar_ToggleAutomaticHeightUpdatingImmediate(fieldSystem->playerAvatar, TRUE);
        PlaySE(SEQ_SE_DP_KI_GASYAN);
        SysTask_Destroy(sysTask);
        ++violetTaskData->state;
        break;
    }
}
