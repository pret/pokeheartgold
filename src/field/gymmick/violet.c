#include "field_system.h"
#include "overlay_01.h"
#include "overlay_01_021F3610.h"
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

BOOL Task_VioletGymmick_ElevatorUp(TaskManager *taskman);
BOOL Task_VioletGymmick_ElevatorDown(TaskManager *taskman);
void ov04_02253FF0(SysTask *sysTask, void *taskData);
void ov04_022540C0(SysTask *sysTask, void *taskData);

static const GXRgb ov04_02257334[] = {
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
    ov01_021F3C0C(fieldSystem->unk9C, 111, &sp18, 0, fieldSystem->unk54);
    ov01_021FB3E4(0, 14, 19, 3, 3, 0x20000, fieldSystem->unk98);
    u32 r4 = GymmickInit_Violet_sub(gymmick->violet.liftState);
    MapPropManager *r6 = ov01_021F3B4C(fieldSystem->unk9C, 111);
    VecFx32 spC;
    ov01_021F3B0C(&spC, r6);
    spC.y = r4;
    ov01_021F3B1C(r6, &spC);
    ov01_021FB4A0(0, r4, fieldSystem->unk98);
    G3X_SetEdgeColorTable(ov04_02257334);
}

void VioletGymmick_ElevatorAction(FieldSystem *fieldSystem) {
    VecFx32 sp0;
    VioletGymElevatorTaskData *taskData = Heap_AllocAtEnd(HEAP_ID_FIELD2, sizeof(VioletGymElevatorTaskData));
    taskData->state = 0;
    taskData->fieldSystem = fieldSystem;

    GymmickUnion *gymmick = Save_Gymmick_AssertMagic_GetData(Save_GetGymmickPtr(FieldSystem_GetSaveData(fieldSystem)), GYMMICK_VIOLET);
    PlayerAvatar_CopyPositionVector(fieldSystem->playerAvatar, &sp0);
    if (sp0.y == ELEVATOR_Y_DOWN) {
        TaskManager_Call(fieldSystem->taskman, Task_VioletGymmick_ElevatorUp, taskData);
        gymmick->violet.liftState = 1;
    } else {
        TaskManager_Call(fieldSystem->taskman, Task_VioletGymmick_ElevatorDown, taskData);
        gymmick->violet.liftState = 0;
    }
}

BOOL Task_VioletGymmick_ElevatorUp(TaskManager *taskman) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskman);
    VioletGymElevatorTaskData *taskData = TaskManager_GetEnvironment(taskman);

    switch (taskData->state) {
    case 0:
        // decomper's note: taskman == fieldSystem->taskman
        TaskManager_Call(fieldSystem->taskman, ov01_02205A60, NULL);
        ++taskData->state;
        break;
    case 1:
        SysTask_CreateOnMainQueue(ov04_02253FF0, taskData, 0);
        ++taskData->state;
        break;
    case 5:
        Heap_Free(taskData);
        return TRUE;
    }

    return FALSE;
}

BOOL Task_VioletGymmick_ElevatorDown(TaskManager *taskman) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskman);
    VioletGymElevatorTaskData *taskData = TaskManager_GetEnvironment(taskman);

    switch (taskData->state) {
    case 0:
        // decomper's note: taskman == fieldSystem->taskman
        TaskManager_Call(fieldSystem->taskman, ov01_02205A60, NULL);
        ++taskData->state;
        break;
    case 1:
        SysTask_CreateOnMainQueue(ov04_022540C0, taskData, 0);
        ++taskData->state;
        break;
    case 5:
        Heap_Free(taskData);
        return TRUE;
    }

    return FALSE;
}

void ov04_02253FF0(SysTask *sysTask, void *taskData) {
    VioletGymElevatorTaskData *violetTaskData = taskData;
    FieldSystem *fieldSystem = violetTaskData->fieldSystem;

    switch (violetTaskData->state) {
    case 2:
        PlayerAvatar_ToggleAutomaticHeightUpdating(fieldSystem->playerAvatar, FALSE);
        PlaySE(SEQ_SE_DP_ELEBETA);
        ++violetTaskData->state;
        break;
    case 3: {
        MapPropManager *mapProp = ov01_021F3B4C(fieldSystem->unk9C, 111);
        VecFx32 spC;
        ov01_021F3B0C(&spC, mapProp);
        spC.y += ELEVATOR_Y_SPEED;
        if (spC.y >= ELEVATOR_Y_UP) {
            spC.y = ELEVATOR_Y_UP;
            StopSE(SEQ_SE_DP_ELEBETA, 0);
            ++violetTaskData->state;
        }
        VecFx32 sp0;
        PlayerAvatar_CopyPositionVector(fieldSystem->playerAvatar, &sp0);
        sp0.y += ELEVATOR_Y_SPEED;
        PlayerAvatar_SetMapObjectYPosition(fieldSystem->playerAvatar, sp0.y);
        ov01_02205A34(fieldSystem, sp0.y);
        ov01_021F3B1C(mapProp, &spC);
    } break;
    case 4:
        ov01_021FB4A0(0, ELEVATOR_Y_UP, fieldSystem->unk98);
        PlayerAvatar_ToggleAutomaticHeightUpdatingImmediate(fieldSystem->playerAvatar, TRUE);
        PlaySE(SEQ_SE_DP_KI_GASYAN);
        SysTask_Destroy(sysTask);
        ++violetTaskData->state;
        break;
    }
}

void ov04_022540C0(SysTask *sysTask, void *taskData) {
    VioletGymElevatorTaskData *violetTaskData = taskData;
    FieldSystem *fieldSystem = violetTaskData->fieldSystem;

    switch (violetTaskData->state) {
    case 2:
        PlayerAvatar_ToggleAutomaticHeightUpdating(fieldSystem->playerAvatar, FALSE);
        PlaySE(SEQ_SE_DP_ELEBETA);
        ++violetTaskData->state;
        break;
    case 3: {
        MapPropManager *mapProp = ov01_021F3B4C(fieldSystem->unk9C, 111);
        VecFx32 spC;
        ov01_021F3B0C(&spC, mapProp);
        spC.y -= ELEVATOR_Y_SPEED;
        if (spC.y <= ELEVATOR_Y_DOWN) {
            spC.y = ELEVATOR_Y_DOWN;
            StopSE(SEQ_SE_DP_ELEBETA, 0);
            ++violetTaskData->state;
        }
        VecFx32 sp0;
        PlayerAvatar_CopyPositionVector(fieldSystem->playerAvatar, &sp0);
        sp0.y -= ELEVATOR_Y_SPEED;
        PlayerAvatar_SetMapObjectYPosition(fieldSystem->playerAvatar, sp0.y);
        ov01_02205A34(fieldSystem, sp0.y);
        ov01_021F3B1C(mapProp, &spC);
    } break;
    case 4:
        ov01_021FB4A0(0, ELEVATOR_Y_DOWN, fieldSystem->unk98);
        PlayerAvatar_ToggleAutomaticHeightUpdatingImmediate(fieldSystem->playerAvatar, TRUE);
        PlaySE(SEQ_SE_DP_KI_GASYAN);
        SysTask_Destroy(sysTask);
        ++violetTaskData->state;
        break;
    }
}
