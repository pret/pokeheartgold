#include "field_system.h"
#include "overlay_04.h"

typedef struct VermilionGymmickLocalData {
    FieldSystem *fieldSystem;
} VermilionGymmickLocalData;

typedef struct VermilionGymmickLockActionTaskData {
    int unk_0;
    LocalMapObject *unk_4[3];
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
