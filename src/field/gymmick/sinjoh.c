#include "field/overlay_01_021FB878.h"

#include "field_system.h"
#include "overlay_04.h"

typedef struct SinjohGymmickLocalData_Sub014 {
    Field3dModel model;
    Field3DModelAnimation anims[2];
    Field3dObject object;
    int animId;
} SinjohGymmickModelState;

typedef struct SinjohGymmickLocalData {
    FieldSystem *fieldSystem;
    NNSFndAllocator allocator;
    SinjohGymmickModelState modelStates[3];
    BOOL active;
    SysTask *sysTask;
} SinjohGymmickLocalData; // size: 0x238

static void SinjohGymmick_Load3dGraphics(SinjohGymmickLocalData *localData);
static void SinjohGymmick_Unload3dGraphics(SinjohGymmickLocalData *localData);
static void SysTask_SinjohGymmick(SysTask *sysTask, void *taskData);
static BOOL SinjohGymmick_AdvanceAnimAndSetAnimIdIfCurrentAnimFinished(SinjohGymmickModelState *modelState, const u8 numAnims, const u8 animId);
static void SinjohGymmick_SetAnimsFrames(Field3DModelAnimation *anims, const u8 num, const fx32 frame);
static BOOL Task_SinjohGymmick_WaitAnimFinished(TaskManager *taskman);

void GymmickInit_Sinjoh(FieldSystem *fieldSystem) {
    GymmickUnion *gymmickUnion = Save_Gymmick_AssertMagic_GetData(Save_GetGymmickPtr(FieldSystem_GetSaveData(fieldSystem)), GYMMICK_SINJOH);
    fieldSystem->unk4->unk24 = Heap_Alloc(HEAP_ID_FIELD1, sizeof(SinjohGymmickLocalData));
    MI_CpuClear8(fieldSystem->unk4->unk24, sizeof(SinjohGymmickLocalData));
    SinjohGymmickLocalData *localData = fieldSystem->unk4->unk24;
    localData->fieldSystem = fieldSystem;
    SinjohGymmick_Load3dGraphics(localData);
    localData->sysTask = SysTask_CreateOnMainQueue(SysTask_SinjohGymmick, localData, 1);
}

void GymmickFree_Sinjoh(FieldSystem *fieldSystem) {
    SinjohGymmickLocalData *localData = fieldSystem->unk4->unk24;
    SysTask_Destroy(localData->sysTask);
    SinjohGymmick_Unload3dGraphics(localData);
    Heap_Free(localData);
    fieldSystem->unk4->unk24 = NULL;
}

void SinjohGymmick_FreezeAllModels(FieldSystem *fieldSystem) {
    SinjohGymmickLocalData *localData = fieldSystem->unk4->unk24;
    for (u8 i = 0; i < 3; ++i) {
        Field3dObject_SetActiveFlag(&localData->modelStates[i].object, FALSE);
    }
}

void SinjohGymmick_SetChosenLegend(FieldSystem *fieldSystem, u8 choice) {
    SinjohGymmickLocalData *localData = fieldSystem->unk4->unk24;
    if (choice > 3) {
        GF_ASSERT(FALSE);
        return;
    }
    GF_ASSERT(Field3dObject_GetActiveFlag(&localData->modelStates[0].object));
    GymmickUnion *gymmickUnion = Save_Gymmick_AssertMagic_GetData(Save_GetGymmickPtr(FieldSystem_GetSaveData(fieldSystem)), GYMMICK_SINJOH);
    gymmickUnion->sinjoh.choice = choice;
    localData->active = TRUE;
    TaskManager_Call(fieldSystem->taskman, Task_SinjohGymmick_WaitAnimFinished, localData);
}

static void SinjohGymmick_Load3dGraphics(SinjohGymmickLocalData *localData) {
    u8 i;
    u8 j;
    enum HeapID heapID = HEAP_ID_FIELD1;

    const int animIds[3][2] = {
        { 102, 103 },
        { 105, 106 },
        { 108, 109 },
    };
    const int modelIds[3] = {
        101,
        104,
        107,
    };

    HeapExp_FndInitAllocator(&localData->allocator, heapID, 0x20);

    for (i = 0; i < 3; ++i) {
        Field3dModel_LoadFromFilesystem(&localData->modelStates[i].model, NARC_demo_legend, modelIds[i], heapID);
    }

    for (j = 0; j < 3; ++j) {
        for (i = 0; i < 2; ++i) {
            Field3dModelAnimation_LoadFromFilesystem(&localData->modelStates[j].anims[i], &localData->modelStates[j].model, NARC_demo_legend, animIds[j][i], heapID, &localData->allocator);
        }
    }

    for (i = 0; i < 3; ++i) {
        Field3dObject_InitFromModel(&localData->modelStates[i].object, &localData->modelStates[i].model);
    }

    for (j = 0; j < 3; ++j) {
        for (i = 0; i < 2; ++i) {
            Field3dObject_AddAnimation(&localData->modelStates[j].object, &localData->modelStates[j].anims[i]);
        }
    }

    for (i = 0; i < 3; ++i) {
        Field3dObject_SetActiveFlag(&localData->modelStates[i].object, TRUE);
        SinjohGymmick_SetAnimsFrames(localData->modelStates[i].anims, 2, 0);
    }

    const VecFx32 positions[3] = {
        { FX32_CONST(200), FX32_CONST(16), FX32_CONST(248) },
        { FX32_CONST(328), FX32_CONST(16), FX32_CONST(248) },
        { FX32_CONST(264), FX32_CONST(16), FX32_CONST(136) },
    };

    for (i = 0; i < 3; ++i) {
        Field3dObject_SetPosEx(&localData->modelStates[i].object, positions[i].x, positions[i].y, positions[i].z);
    }
}

static void SinjohGymmick_Unload3dGraphics(SinjohGymmickLocalData *localData) {
    u8 i;
    u8 j;

    for (j = 0; j < 3; ++j) {
        for (i = 0; i < 2; ++i) {
            Field3dModelAnimation_Unload(&localData->modelStates[j].anims[i], &localData->allocator);
        }
        Field3dModel_Unload(&localData->modelStates[j].model);
    }
}

static void SysTask_SinjohGymmick(SysTask *sysTask, void *taskData) {
    u8 i;
    SinjohGymmickLocalData *localData = taskData;
    int currentFrames[3];
    u8 choiceFlag[3] = { 0, 0, 0 };
    BOOL isFinished;
    FieldSystem *fieldSystem = localData->fieldSystem;
    GymmickUnion *gymmickUnion = Save_Gymmick_AssertMagic_GetData(Save_GetGymmickPtr(FieldSystem_GetSaveData(fieldSystem)), GYMMICK_SINJOH);

    switch (gymmickUnion->sinjoh.choice) {
    case 0:
        break;
    case 1:
        choiceFlag[0] = 1;
        break;
    case 2:
        choiceFlag[1] = 1;
        break;
    case 3:
        choiceFlag[2] = 1;
        break;
    default:
        GF_ASSERT(FALSE);
    }
    for (i = 0; i < 3; ++i) {
        isFinished = SinjohGymmick_AdvanceAnimAndSetAnimIdIfCurrentAnimFinished(&localData->modelStates[i], 2, choiceFlag[i]); // bug: only the result of the last call matters
    }
    for (i = 0; i < 3; ++i) {
        Field3dObject_Draw(&localData->modelStates[i].object);
    }

    if (isFinished) {
        localData->active = 0;
    }

    // Require all anims be synchronized
    for (i = 0; i < 3; ++i) {
        SinjohGymmickModelState *modelState = &localData->modelStates[i];
        currentFrames[i] = Field3dModelAnimation_FrameGet(&modelState->anims[0]) / FX32_ONE;
        currentFrames[i] %= 30;
    }
    GF_ASSERT(currentFrames[0] == currentFrames[1]);
    GF_ASSERT(currentFrames[1] == currentFrames[2]);
    GF_ASSERT(currentFrames[2] == currentFrames[0]);
}

static BOOL SinjohGymmick_AdvanceAnimAndSetAnimIdIfCurrentAnimFinished(SinjohGymmickModelState *modelState, const u8 numAnims, const u8 animId) {
    u8 i;
    fx32 currentFrame;
    fx32 endFrame;
    fx32 startFrame;
    u8 animEnded = FALSE;
    if (modelState->animId) {
        endFrame = FX32_CONST(60);
    } else {
        endFrame = FX32_CONST(30);
    }
    for (i = 0; i < numAnims; ++i) {
        currentFrame = Field3dModelAnimation_FrameGet(&modelState->anims[i]);
        if (currentFrame + FX32_ONE >= endFrame) {
            if (i != 0) {
                GF_ASSERT(animEnded);
            }
            animEnded = TRUE;
        }
        Field3dModelAnimation_FrameAdvanceAndLoop(&modelState->anims[i], FX32_ONE);
        if (animEnded) {
            modelState->animId = animId;
            if (modelState->animId) {
                startFrame = FX32_CONST(30);
            } else {
                startFrame = 0;
            }
            Field3dModelAnimation_FrameSet(&modelState->anims[i], startFrame);
        }
    }
    if (animEnded) {
        return TRUE;
    } else {
        return FALSE;
    }
}

static void SinjohGymmick_SetAnimsFrames(Field3DModelAnimation *anims, const u8 num, const fx32 frame) {
    u8 i;

    for (i = 0; i < num; ++i) {
        Field3dModelAnimation_FrameSet(&anims[i], frame);
    }
}

static BOOL Task_SinjohGymmick_WaitAnimFinished(TaskManager *taskman) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskman);
    SinjohGymmickLocalData *localData = TaskManager_GetEnvironment(taskman);

    return !localData->active;
}
