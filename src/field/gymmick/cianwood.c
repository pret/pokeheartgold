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

static void CianwoodGymmick_LaunchWinchTask(CianwoodGymmickLocalData *localData);
static BOOL Task_CianwoodGymmick_LiftWinchCutscene(TaskManager *taskman);
static int CianwoodGymmick_RebindAnimationObjectsAndGetCount(FieldSystem *fieldSystem);

void GymmickInit_Cianwood(FieldSystem *fieldSystem) {
    GymmickUnion *gymmickUnion = Save_Gymmick_AssertMagic_GetData(Save_GetGymmickPtr(FieldSystem_GetSaveData(fieldSystem)), GYMMICK_CIANWOOD);
    fieldSystem->unk4->unk24 = Heap_Alloc(HEAP_ID_FIELD1, sizeof(CianwoodGymmickLocalData));
    MI_CpuClear8(fieldSystem->unk4->unk24, sizeof(CianwoodGymmickLocalData));
    CianwoodGymmickLocalData *localData = fieldSystem->unk4->unk24;
    localData->fieldSystem = fieldSystem;

    if (gymmickUnion->cianwood.winch) {
        MapPropAnimationData *animData;
        u32 num = CianwoodGymmick_RebindAnimationObjectsAndGetCount(fieldSystem);
        for (u8 i = 0; i < num; ++i) {
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

BOOL CianwoodGymmick_ActivateWinch(FieldSystem *fieldSystem) {
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
        CianwoodGymmick_LaunchWinchTask(localData);
        return TRUE;
    }
    return FALSE;
}

static void CianwoodGymmick_LaunchWinchTask(CianwoodGymmickLocalData *localData) {
    GymmickUnion *gymmickUnion = Save_Gymmick_AssertMagic_GetData(Save_GetGymmickPtr(FieldSystem_GetSaveData(localData->fieldSystem)), GYMMICK_CIANWOOD);
    CianwoodGymmickWinchTaskData *taskData = Heap_AllocAtEnd(HEAP_ID_FIELD2, sizeof(CianwoodGymmickWinchTaskData));
    taskData->state = 0;
    gymmickUnion->cianwood.winch = TRUE;
    TaskManager_Call(localData->fieldSystem->taskman, Task_CianwoodGymmick_LiftWinchCutscene, taskData);
}

static BOOL Task_CianwoodGymmick_LiftWinchCutscene(TaskManager *taskman) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskman);
    CianwoodGymmickWinchTaskData *taskData = TaskManager_GetEnvironment(taskman);
    LocalMapObject *playerObject = PlayerAvatar_GetMapObject(fieldSystem->playerAvatar);

    switch (taskData->state) {
    case 0: {
        CameraTranslationPathTemplate pathTemplate;
        CameraAngle cameraAngle = Camera_GetAngle(fieldSystem->camera);
        pathTemplate.angleX = cameraAngle.x;
        pathTemplate.perspectiveAngle = Camera_GetPerspectiveAngle(fieldSystem->camera);
        pathTemplate.position = (VecFx32) {
            50 * FX32_ONE,
            0,
            58 * FX32_ONE,
        };
        pathTemplate.distance = Camera_GetDistance(fieldSystem->camera);
        taskData->translationWrapper = CreateCameraTranslationWrapper(HEAP_ID_FIELD1, fieldSystem->camera);
        SetCameraTranslationPath(taskData->translationWrapper, &pathTemplate, 24);
        ++taskData->state;
    } break;
    case 1:
        if (IsCameraTranslationFinished(taskData->translationWrapper)) {
            DeleteCameraTranslationWrapper(taskData->translationWrapper);
            ++taskData->state;
        }
        break;
    case 2: {
        int num = CianwoodGymmick_RebindAnimationObjectsAndGetCount(fieldSystem);
        MapPropAnimationData *animData;
        for (int i = 0; i < num; ++i) {
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
        CameraTranslationPathTemplate pathTemplate;
        VecFx32 centerPos = { 0, 0, 0 };
        CameraAngle angle = Camera_GetAngle(fieldSystem->camera);
        pathTemplate.angleX = angle.x;
        pathTemplate.perspectiveAngle = Camera_GetPerspectiveAngle(fieldSystem->camera);
        pathTemplate.position = centerPos;
        pathTemplate.distance = Camera_GetDistance(fieldSystem->camera);
        taskData->translationWrapper = CreateCameraTranslationWrapper(HEAP_ID_FIELD1, fieldSystem->camera);
        SetCameraTranslationPath(taskData->translationWrapper, &pathTemplate, 24);
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

static int CianwoodGymmick_RebindAnimationObjectsAndGetCount(FieldSystem *fieldSystem) {
    UnkStruct_FieldSysC0_SubC *unkC0subC_173 = Field3dObjectList_GetRenderObjectByID(fieldSystem->unkC0, 173);
    UnkStruct_FieldSysC0_SubC *unkC0subC_174 = Field3dObjectList_GetRenderObjectByID(fieldSystem->unkC0, 174);
    UnkStruct_FieldSysC0_SubC *unkC0subC_175 = Field3dObjectList_GetRenderObjectByID(fieldSystem->unkC0, 175);

    int numPropAnims = MapPropAnimationManager_GetPropAnimationCount(fieldSystem->mapPropAnimationManager, 173);
    for (int i = 0; i < numPropAnims; ++i) {
        MapPropAnimationManager_RemoveAnimationFromRenderObj(fieldSystem->mapPropAnimationManager, &unkC0subC_173->renderObj, 173, i);
    }

    numPropAnims = MapPropAnimationManager_GetPropAnimationCount(fieldSystem->mapPropAnimationManager, 174);
    for (int i = 0; i < numPropAnims; ++i) {
        MapPropAnimationManager_AddAnimationToRenderObj(174, i, TRUE, &unkC0subC_173->renderObj, fieldSystem->mapPropAnimationManager);
    }
    MapPropAnimationManager_AddAnimationToRenderObj(175, 0, TRUE, &unkC0subC_175->renderObj, fieldSystem->mapPropAnimationManager);
    return numPropAnims;
}
