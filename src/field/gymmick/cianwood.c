#include "field_system.h"
#include "overlay_04.h"

typedef struct CianwoodGymmickLocalData {
    FieldSystem *fieldSystem;
} CianwoodGymmickLocalData;

typedef struct CianwoodGymmickWinchTaskData {
    int state;
    int unused;
    GFCameraTranslationWrapper *translationWrapper;
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
    taskData->state = 0;
    gymmickUnion->cianwood.winch = TRUE;
    TaskManager_Call(localData->fieldSystem->taskman, ov04_022560D4, taskData);
}

BOOL ov04_022560D4(TaskManager *taskman) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskman);
    CianwoodGymmickWinchTaskData *taskData = TaskManager_GetEnvironment(taskman);
    LocalMapObject *playerObject = PlayerAvatar_GetMapObject(fieldSystem->playerAvatar);

    switch (taskData->state) {
    case 0: {
        CameraTranslationPathTemplate sp44;
        CameraAngle cameraAngle = Camera_GetAngle(fieldSystem->camera);
        sp44.angleX = cameraAngle.x;
        sp44.perspectiveAngle = Camera_GetPerspectiveAngle(fieldSystem->camera);
        sp44.position = (VecFx32) {
            50 * FX32_ONE,
            0,
            58 * FX32_ONE,
        };
        sp44.distance = Camera_GetDistance(fieldSystem->camera);
        taskData->translationWrapper = CreateCameraTranslationWrapper(HEAP_ID_FIELD1, fieldSystem->camera);
        SetCameraTranslationPath(taskData->translationWrapper, &sp44, 24);
        ++taskData->state;
    } break;
    case 1:
        if (IsCameraTranslationFinished(taskData->translationWrapper)) {
            DeleteCameraTranslationWrapper(taskData->translationWrapper);
            ++taskData->state;
        }
        break;
    case 2: {
        int sp0 = ov04_02256278(fieldSystem);
        MapPropAnimationData *animData;
        for (int i = 0; i < sp0; ++i) {
            animData = MapPropAnimationManager_GetAnimationData(174, i, fieldSystem->mapPropAnimationManager);
            MapPropAnimationData_SetAnimationLoopCount(animData, 1);
            MapPropAnimationData_GoToFirstAnimationFrame(animData);
        }
        animData = MapPropAnimationManager_GetAnimationData(175, 0, fieldSystem->mapPropAnimationManager);
        MapPropAnimationData_SetAnimationLoopCount(animData, 1);
        MapPropAnimationData_GoToFirstAnimationFrame(animData);
        ++taskData->state;
    } break;
    case 3:
        if (MapPropAnimationData_IsAnimationLoopFinished(MapPropAnimationManager_GetAnimationData(175, 0, fieldSystem->mapPropAnimationManager))) {
            ++taskData->state;
        }
        break;
    case 4: {
        CameraTranslationPathTemplate sp30;
        VecFx32 sp24 = { 0, 0, 0 };
        CameraAngle angle = Camera_GetAngle(fieldSystem->camera);
        sp30.angleX = angle.x;
        sp30.perspectiveAngle = Camera_GetPerspectiveAngle(fieldSystem->camera);
        sp30.position = sp24;
        sp30.distance = Camera_GetDistance(fieldSystem->camera);
        taskData->translationWrapper = CreateCameraTranslationWrapper(HEAP_ID_FIELD1, fieldSystem->camera);
        SetCameraTranslationPath(taskData->translationWrapper, &sp30, 24);
        ++taskData->state;
    } break;
    case 5:
        if (IsCameraTranslationFinished(taskData->translationWrapper)) {
            DeleteCameraTranslationWrapper(taskData->translationWrapper);
            ++taskData->state;
        }
        break;
    case 6:
        Heap_Free(taskData);
        return TRUE;
    }

    return FALSE;
}
