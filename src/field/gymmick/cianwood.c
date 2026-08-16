#include "field_system.h"
#include "overlay_04.h"

typedef struct CianwoodGymmickLocalData {
    FieldSystem *fieldSystem;
} CianwoodGymmickLocalData;

typedef struct CianwoodGymmickWinchTaskData {
    int unk_0;
    int unk_4;
    int unk_8;
} CianwoodGymmickWinchTaskData;

void ov04_0225609C(CianwoodGymmickLocalData *localData);
BOOL ov04_022560D4(TaskManager *taskman);
u32 ov04_02256278(FieldSystem *fieldSystem);

void GymmickInit_Cianwood(FieldSystem *fieldSystem) {
    GymmickUnion *gymmickUnion = Save_Gymmick_AssertMagic_GetData(Save_GetGymmickPtr(FieldSystem_GetSaveData(fieldSystem)), GYMMICK_CIANWOOD);
    fieldSystem->unk4->unk24 = Heap_Alloc(HEAP_ID_FIELD1, sizeof(CianwoodGymmickLocalData));
    MI_CpuClear8(fieldSystem->unk4->unk24, sizeof(CianwoodGymmickLocalData));
    CianwoodGymmickLocalData *localData = fieldSystem->unk4->unk24;
    localData->fieldSystem = fieldSystem;

    if (gymmickUnion->cianwood.winch) {
        MapPropAnimationData *animData;
        u32 r7 = ov04_02256278(fieldSystem);
        for (u8 i = 0; i < r7; ++i) {
            animData = MapPropAnimationManager_GetAnimationData(174, i, fieldSystem->mapPropAnimationManager);
            MapPropAnimationData_SetAnimationPaused(animData, TRUE);
            MapPropAnimationData_GoToLastAnimationFrame(animData);
        }
        animData = MapPropAnimationManager_GetAnimationData(175, 0, fieldSystem->mapPropAnimationManager);
        MapPropAnimationData_SetAnimationPaused(animData, TRUE);
        MapPropAnimationData_GoToLastAnimationFrame(animData);
    }
}

void GymmickFree_Cianwood(FieldSystem *fieldSystem) {
    Heap_Free(fieldSystem->unk4->unk24);
    fieldSystem->unk4->unk24 = NULL;
}

BOOL ov04_02256058(FieldSystem *fieldSystem) {
    Gymmick *gymmick = Save_GetGymmickPtr(FieldSystem_GetSaveData(fieldSystem));
    if (Save_Gymmick_GetType(gymmick) != GYMMICK_CIANWOOD) {
        return FALSE;
    }
    GymmickUnion *gymmickUnion = Save_Gymmick_AssertMagic_GetData(gymmick, GYMMICK_CIANWOOD);
    CianwoodGymmickLocalData *localData = fieldSystem->unk4->unk24;
    if (localData == NULL) {
        return FALSE;
    }
    if (!gymmickUnion->cianwood.winch) {
        ov04_0225609C(localData);
        return TRUE;
    }
    return FALSE;
}

void ov04_0225609C(CianwoodGymmickLocalData *localData) {
    GymmickUnion *gymmickUnion = Save_Gymmick_AssertMagic_GetData(Save_GetGymmickPtr(FieldSystem_GetSaveData(localData->fieldSystem)), GYMMICK_CIANWOOD);
    CianwoodGymmickWinchTaskData *taskData = Heap_AllocAtEnd(HEAP_ID_FIELD2, sizeof(CianwoodGymmickWinchTaskData));
    taskData->unk_0 = 0;
    gymmickUnion->cianwood.winch = TRUE;
    TaskManager_Call(localData->fieldSystem->taskman, ov04_022560D4, taskData);
}
