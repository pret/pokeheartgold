#include "fielddata/script/scr_seq/event_T06GYM0101.h"

#include "field_system.h"
#include "overlay_04.h"
#include "unk_02005D10.h"
#include "unk_02062108.h"

typedef struct VermilionGymmickLocalData {
    FieldSystem *fieldSystem;
} VermilionGymmickLocalData;

typedef struct VermilionGymmickLockActionTaskData {
    int unk_00;
    LocalMapObject *unk_04[3];
    int unk_10;
    u16 unk_14;
    u8 unk_16;
    u8 unk_17;
} VermilionGymmickLockActionTaskData;

BOOL ov04_022564A0(TaskManager *taskman);

void GymmickInit_Vermilion(FieldSystem *fieldSystem) {
    GymmickUnion *gymmickUnion = Save_Gymmick_AssertMagic_GetData(Save_GetGymmickPtr(FieldSystem_GetSaveData(fieldSystem)), GYMMICK_VERMILION);
    fieldSystem->unk4->unk24 = Heap_Alloc(HEAP_ID_FIELD1, sizeof(VermilionGymmickLocalData));
    MI_CpuClear8(fieldSystem->unk4->unk24, sizeof(VermilionGymmickLocalData));
    VermilionGymmickLocalData *localData = fieldSystem->unk4->unk24;
    localData->fieldSystem = fieldSystem;

    if (gymmickUnion->vermilion.gates[0]) {
        UnkStruct_FieldSysC0_SubC *gate1Render = Field3dObjectList_GetRenderObjectByID(fieldSystem->unkC0, 199);
        u32 num = MapPropAnimationManager_GetPropAnimationCount(fieldSystem->mapPropAnimationManager, 199);
        for (u8 i = 0; i < num; ++i) {
            MapPropAnimationManager_RemoveAnimationFromRenderObj(fieldSystem->mapPropAnimationManager, &gate1Render->renderObj, 199, i);
        }
    }

    if (gymmickUnion->vermilion.gates[1]) {
        UnkStruct_FieldSysC0_SubC *gate1Render = Field3dObjectList_GetRenderObjectByID(fieldSystem->unkC0, 200);
        u32 num = MapPropAnimationManager_GetPropAnimationCount(fieldSystem->mapPropAnimationManager, 200);
        for (u8 i = 0; i < num; ++i) {
            MapPropAnimationManager_RemoveAnimationFromRenderObj(fieldSystem->mapPropAnimationManager, &gate1Render->renderObj, 200, i);
        }
    }
}

void GymmickFree_Vermilion(FieldSystem *fieldSystem) {
    Heap_Free(fieldSystem->unk4->unk24);
    fieldSystem->unk4->unk24 = NULL;
}

u8 ov04_022563C4(FieldSystem *fieldSystem, u8 canId) {
    GymmickUnion *gymmickUnion = Save_Gymmick_AssertMagic_GetData(Save_GetGymmickPtr(FieldSystem_GetSaveData(fieldSystem)), GYMMICK_VERMILION);

    if (gymmickUnion->vermilion.gates[0] && gymmickUnion->vermilion.gates[1]) {
        return 4;
    }

    if (gymmickUnion->vermilion.gates[0]) {
        if (canId == gymmickUnion->vermilion.switches[1]) {
            return 2;
        } else {
            return 3;
        }
    }

    return canId == gymmickUnion->vermilion.switches[0];
}

void ov04_0225640C(FieldSystem *fieldSystem, u8 lockno, u8 relock) {
    GymmickUnion *gymmickUnion = Save_Gymmick_AssertMagic_GetData(Save_GetGymmickPtr(FieldSystem_GetSaveData(fieldSystem)), GYMMICK_VERMILION);
    VermilionGymmickLockActionTaskData *taskData = Heap_AllocAtEnd(HEAP_ID_FIELD2, sizeof(VermilionGymmickLockActionTaskData));

    switch (lockno) {
    case 0:
        taskData->unk_10 = 199;
        if (relock) {
            taskData->unk_16 = 2;
            TaskManager_Call(fieldSystem->taskman, ov04_022564A0, taskData);
            gymmickUnion->vermilion.gates[0] = FALSE;
        } else {
            taskData->unk_16 = 1;
            TaskManager_Call(fieldSystem->taskman, ov04_022564A0, taskData);
            gymmickUnion->vermilion.gates[0] = TRUE;
        }
        break;
    case 1:
        taskData->unk_10 = 200;
        if (relock) {
            GF_ASSERT(FALSE);
            Heap_Free(taskData);
        } else {
            taskData->unk_16 = 1;
            TaskManager_Call(fieldSystem->taskman, ov04_022564A0, taskData);
            gymmickUnion->vermilion.gates[1] = TRUE;
        }
        break;
    default:
        GF_ASSERT(FALSE);
    }
}

BOOL ov04_022564A0(TaskManager *taskman) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskman);
    VermilionGymmickLockActionTaskData *taskData = TaskManager_GetEnvironment(taskman);
    u32 *pState = TaskManager_GetStatePtr(taskman);

    switch (*pState) {
    case 0:
        if (taskData->unk_10 == 199) {
            taskData->unk_04[0] = MapObjectManager_GetFirstActiveObjectByID(fieldSystem->mapObjectManager, obj_T06GYM0101_stop_4);
            taskData->unk_04[1] = MapObjectManager_GetFirstActiveObjectByID(fieldSystem->mapObjectManager, obj_T06GYM0101_stop_5);
            taskData->unk_04[2] = MapObjectManager_GetFirstActiveObjectByID(fieldSystem->mapObjectManager, obj_T06GYM0101_stop_6);
        } else {
            taskData->unk_04[0] = MapObjectManager_GetFirstActiveObjectByID(fieldSystem->mapObjectManager, obj_T06GYM0101_stop);
            taskData->unk_04[1] = MapObjectManager_GetFirstActiveObjectByID(fieldSystem->mapObjectManager, obj_T06GYM0101_stop_2);
            taskData->unk_04[2] = MapObjectManager_GetFirstActiveObjectByID(fieldSystem->mapObjectManager, obj_T06GYM0101_stop_3);
        }
        taskData->unk_14 = 0;
        *pState = taskData->unk_16;
        break;
    case 1:
        MapObject_SetHeldMovement(taskData->unk_04[0], MOVEMENT_UNK_22);
        MapObject_SetHeldMovement(taskData->unk_04[1], MOVEMENT_UNK_22);
        MapObject_SetHeldMovement(taskData->unk_04[2], MOVEMENT_UNK_23);
        *pState = 3;
        break;
    case 2:
        MapObject_SetHeldMovement(taskData->unk_04[0], MOVEMENT_UNK_23);
        MapObject_SetHeldMovement(taskData->unk_04[1], MOVEMENT_UNK_23);
        MapObject_SetHeldMovement(taskData->unk_04[2], MOVEMENT_UNK_22);
        *pState = 3;
        break;
    case 3: {
        u8 i;
        for (i = 0; i < 3; ++i) {
            if (!MapObject_AreBitsSetForMovementScriptInit(taskData->unk_04[i])) {
                break;
            }
        }
        if (i == 3) {
            ++taskData->unk_14;
            if (taskData->unk_14 >= 2) {
                if (taskData->unk_16 == 1) {
                    *pState = 4;
                } else {
                    *pState = 5;
                }
            } else {
                *pState = taskData->unk_16;
            }
        }
    } break;
    case 4: {
        UnkStruct_FieldSysC0_SubC *gateRender = Field3dObjectList_GetRenderObjectByID(fieldSystem->unkC0, taskData->unk_10);
        u32 num = MapPropAnimationManager_GetPropAnimationCount(fieldSystem->mapPropAnimationManager, taskData->unk_10);
        for (u8 i = 0; i < num; ++i) {
            MapPropAnimationManager_RemoveAnimationFromRenderObj(fieldSystem->mapPropAnimationManager, &gateRender->renderObj, taskData->unk_10, i);
        }
        PlaySE(SEQ_SE_DP_UG_020);
        *pState = 6;
    } break;
    case 5: {
        UnkStruct_FieldSysC0_SubC *gateRender = Field3dObjectList_GetRenderObjectByID(fieldSystem->unkC0, taskData->unk_10);
        u32 num = MapPropAnimationManager_GetPropAnimationCount(fieldSystem->mapPropAnimationManager, taskData->unk_10);
        for (u8 i = 0; i < num; ++i) {
            MapPropAnimationManager_AddAnimationToRenderObj(taskData->unk_10, i, FALSE, &gateRender->renderObj, fieldSystem->mapPropAnimationManager);
        }
        PlaySE(SEQ_SE_DP_UG_020);
        *pState = 6;
    } break;
    case 6:
        Heap_Free(taskData);
        return TRUE;
    }

    return FALSE;
}
