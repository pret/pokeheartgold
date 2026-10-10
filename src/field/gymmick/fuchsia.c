#include "field/overlay_01_021FB878.h"

#include "field_system.h"
#include "overlay_04.h"
#include "unk_02005D10.h"

typedef struct FuchsiaGymmickWallData {
    int x;
    int z;
    u16 modelId;
    s8 xOffset;
    s8 zOffset;
    s8 neighbors[6];
} FuchsiaGymmickWallData;

typedef struct FuchsiaGymmickWallAnimState {
    BOOL active;
    Field3DModelAnimation anims[4];
    Field3dObject object;
} FuchsiaGymmickWallAnimState;

typedef struct FuchsiaGymmickWallAnimsManager {
    int idx;
    FuchsiaGymmickWallAnimState buffer[3];
} FuchsiaGymmickWallAnimsManager;

typedef struct FuchsiaGymmickWallAnimTask {
    u16 active;
    s16 wallId;
    FuchsiaGymmickWallAnimState *animState;
    SysTask *sysTask;
} FuchsiaGymmickWallAnimTask; // size: 0xC

typedef struct FuchsiaGymmickLocalData {
    NNSFndAllocator allocator;
    Field3dModel models[12];
    int wallAnimTaskPointer;
    FuchsiaGymmickWallAnimsManager wallAnimsManagers[12];
    FuchsiaGymmickWallAnimTask wallAnimTasks[3];
} FuchsiaGymmickLocalData; // size: 0x1DD8

static void SysTask_AnimateFuchsiaWall(SysTask *sysTask, void *data);
static void FuchsiaGymmick_Load3DGraphics(FuchsiaGymmickLocalData *localData, enum HeapID heapID);
static void FuchsiaGymmick_Unload3DGraphics(FuchsiaGymmickLocalData *localData);
static s16 FuchsiaGymmick_GetWallIdAt(int x, int z);
static BOOL FuchsiaGymmick_IsWallAnimationAlreadyPlaying(FuchsiaGymmickWallAnimTask *animtask, s16 wallId);
static void FuchsiaGymmick_StartWallAnimation(FuchsiaGymmickLocalData *localData, FieldSystem *fieldSystem, u8 wallId);
static BOOL FuchsiaGymmick_FrameAdvanceWallAnimations_CheckAllDone(Field3DModelAnimation *anim, u8 num);
static FuchsiaGymmickWallAnimState *FuchsiaGymmick_AllocateWallAnimState(FuchsiaGymmickWallAnimsManager *animsManager);
static void FuchsiaGymmick_KillNeighboringSegmentsAnims(FuchsiaGymmickLocalData *localData, const u8 baseWallId);
static void FuchsiaGymmick_KillWallAnimTask(FuchsiaGymmickWallAnimTask *animTask);

static const FuchsiaGymmickWallData sWallData[] = {
    {
     .x = 4,
     .z = 4,
     .modelId = 0,
     .xOffset = 0,
     .zOffset = 0,
     .neighbors = { 1, 2, -1, -1, -1, -1 },
     },
    {
     .x = 5,
     .z = 4,
     .modelId = 1,
     .xOffset = 0,
     .zOffset = 0,
     .neighbors = { 0, 2, 3, -1, -1, -1 },
     },
    {
     .x = 6,
     .z = 4,
     .modelId = 1,
     .xOffset = 0,
     .zOffset = 0,
     .neighbors = { 1, 3, -1, -1, -1, -1 },
     },
    {
     .x = 7,
     .z = 4,
     .modelId = 9,
     .xOffset = 0,
     .zOffset = 0,
     .neighbors = { 1, 2, 5, -1, -1, -1 },
     },
    {
     .x = 11,
     .z = 4,
     .modelId = 2,
     .xOffset = 0,
     .zOffset = 0,
     .neighbors = { 7, -1, -1, -1, -1, -1 },
     },
    {
     .x = 7,
     .z = 5,
     .modelId = 6,
     .xOffset = 0,
     .zOffset = 0,
     .neighbors = { 3, 6, 8, -1, -1, -1 },
     },
    {
     .x = 8,
     .z = 5,
     .modelId = 0,
     .xOffset = -1,
     .zOffset = 0,
     .neighbors = { 3, 5, 8, -1, -1, -1 },
     },
    {
     .x = 11,
     .z = 5,
     .modelId = 3,
     .xOffset = 0,
     .zOffset = 0,
     .neighbors = { 4, 9, -1, -1, -1, -1 },
     },
    {
     .x = 7,
     .z = 6,
     .modelId = 3,
     .xOffset = 0,
     .zOffset = 0,
     .neighbors = { 3, 5, 6, 13, 15, -1 },
     },
    {
     .x = 11,
     .z = 6,
     .modelId = 3,
     .xOffset = 0,
     .zOffset = 0,
     .neighbors = { 4, 7, 14, 16, -1, -1 },
     },
    {
     .x = 1,
     .z = 7,
     .modelId = 0,
     .xOffset = 0,
     .zOffset = 0,
     .neighbors = { 11, 12, -1, -1, -1, -1 },
     },
    {
     .x = 2,
     .z = 7,
     .modelId = 1,
     .xOffset = 0,
     .zOffset = 0,
     .neighbors = { 10, 11, -1, -1, -1, -1 },
     },
    {
     .x = 3,
     .z = 7,
     .modelId = 0,
     .xOffset = -1,
     .zOffset = 0,
     .neighbors = { 10, 11, -1, -1, -1, -1 },
     },
    {
     .x = 7,
     .z = 7,
     .modelId = 3,
     .xOffset = 0,
     .zOffset = 0,
     .neighbors = { 5, 13, 15, 17, -1, -1 },
     },
    {
     .x = 11,
     .z = 7,
     .modelId = 3,
     .xOffset = 0,
     .zOffset = 0,
     .neighbors = { 7, 16, -1, -1, -1, -1 },
     },
    {
     .x = 7,
     .z = 8,
     .modelId = 3,
     .xOffset = 0,
     .zOffset = 0,
     .neighbors = { 8, 13, 17, 18, -1, -1 },
     },
    {
     .x = 11,
     .z = 8,
     .modelId = 2,
     .xOffset = 0,
     .zOffset = -1,
     .neighbors = { 9, 14, -1, -1, -1, -1 },
     },
    {
     .x = 7,
     .z = 9,
     .modelId = 10,
     .xOffset = 0,
     .zOffset = 0,
     .neighbors = { 13, 18, 19, -1, -1, -1 },
     },
    {
     .x = 8,
     .z = 9,
     .modelId = 1,
     .xOffset = 0,
     .zOffset = 0,
     .neighbors = { 15, 17, 19, 20, -1, -1 },
     },
    {
     .x = 9,
     .z = 9,
     .modelId = 1,
     .xOffset = 0,
     .zOffset = 0,
     .neighbors = { 17, 18, 20, 25, -1, -1 },
     },
    {
     .x = 10,
     .z = 9,
     .modelId = 9,
     .xOffset = 0,
     .zOffset = 0,
     .neighbors = { 18, 19, 25, 27, -1, -1 },
     },
    {
     .x = 1,
     .z = 10,
     .modelId = 2,
     .xOffset = 0,
     .zOffset = 0,
     .neighbors = { 26, -1, -1, -1, -1, -1 },
     },
    {
     .x = 4,
     .z = 10,
     .modelId = 0,
     .xOffset = 0,
     .zOffset = 0,
     .neighbors = { 23, 24, -1, -1, -1, -1 },
     },
    {
     .x = 5,
     .z = 10,
     .modelId = 1,
     .xOffset = 0,
     .zOffset = 0,
     .neighbors = { 22, 24, -1, -1, -1, -1 },
     },
    {
     .x = 6,
     .z = 10,
     .modelId = 0,
     .xOffset = -1,
     .zOffset = 0,
     .neighbors = { 22, 23, -1, -1, -1, -1 },
     },
    {
     .x = 10,
     .z = 10,
     .modelId = 3,
     .xOffset = 0,
     .zOffset = 0,
     .neighbors = { 19, 20, 27, 28, -1, -1 },
     },
    {
     .x = 1,
     .z = 11,
     .modelId = 2,
     .xOffset = 0,
     .zOffset = -1,
     .neighbors = { 21, -1, -1, -1, -1, -1 },
     },
    {
     .x = 10,
     .z = 11,
     .modelId = 3,
     .xOffset = 0,
     .zOffset = 0,
     .neighbors = { 20, 25, 28, 35, -1, -1 },
     },
    {
     .x = 10,
     .z = 12,
     .modelId = 3,
     .xOffset = 0,
     .zOffset = 0,
     .neighbors = { 25, 27, 35, 37, 34, -1 },
     },
    {
     .x = 4,
     .z = 13,
     .modelId = 8,
     .xOffset = 0,
     .zOffset = 0,
     .neighbors = { 26, 30, 31, -1, -1, -1 },
     },
    {
     .x = 5,
     .z = 13,
     .modelId = 1,
     .xOffset = 0,
     .zOffset = 0,
     .neighbors = { 36, 29, 31, 32, 32, -1 },
     },
    {
     .x = 6,
     .z = 13,
     .modelId = 1,
     .xOffset = 0,
     .zOffset = 0,
     .neighbors = { 29, 30, 32, 33, -1, -1 },
     },
    {
     .x = 7,
     .z = 13,
     .modelId = 1,
     .xOffset = 0,
     .zOffset = 0,
     .neighbors = { 30, 31, 33, 34, -1, -1 },
     },
    {
     .x = 8,
     .z = 13,
     .modelId = 1,
     .xOffset = 0,
     .zOffset = 0,
     .neighbors = { 31, 32, 34, 35, -1, -1 },
     },
    {
     .x = 9,
     .z = 13,
     .modelId = 1,
     .xOffset = 0,
     .zOffset = 0,
     .neighbors = { 32, 33, 35, 28, 37, -1 },
     },
    {
     .x = 10,
     .z = 13,
     .modelId = 7,
     .xOffset = 0,
     .zOffset = 0,
     .neighbors = { 27, 28, 37, 34, -1, -1 },
     },
    {
     .x = 4,
     .z = 14,
     .modelId = 2,
     .xOffset = 0,
     .zOffset = -1,
     .neighbors = { 29, 30, -1, -1, -1, -1 },
     },
    {
     .x = 10,
     .z = 14,
     .modelId = 2,
     .xOffset = 0,
     .zOffset = -1,
     .neighbors = { 28, 34, 35, 37, -1, -1 },
     },
    {
     .x = 11,
     .z = 15,
     .modelId = 2,
     .xOffset = 0,
     .zOffset = 0,
     .neighbors = { 39, 44, -1, -1, -1, -1 },
     },
    {
     .x = 11,
     .z = 16,
     .modelId = 3,
     .xOffset = 0,
     .zOffset = 0,
     .neighbors = { 38, 44, 46, -1, -1, -1 },
     },
    {
     .x = 2,
     .z = 17,
     .modelId = 0,
     .xOffset = 0,
     .zOffset = 0,
     .neighbors = { 41, 42, -1, -1, -1, -1 },
     },
    {
     .x = 3,
     .z = 17,
     .modelId = 1,
     .xOffset = 0,
     .zOffset = 0,
     .neighbors = { 40, 42, 43, 45, -1, -1 },
     },
    {
     .x = 4,
     .z = 17,
     .modelId = 4,
     .xOffset = 0,
     .zOffset = 0,
     .neighbors = { 40, 41, 43, 45, -1, -1 },
     },
    {
     .x = 5,
     .z = 17,
     .modelId = 0,
     .xOffset = -1,
     .zOffset = 0,
     .neighbors = { 41, 45, -1, -1, -1, -1 },
     },
    {
     .x = 11,
     .z = 17,
     .modelId = 3,
     .xOffset = 0,
     .zOffset = 0,
     .neighbors = { 38, 39, 46, 48, -1, -1 },
     },
    {
     .x = 4,
     .z = 18,
     .modelId = 3,
     .xOffset = 0,
     .zOffset = 0,
     .neighbors = { 41, 43, 42, 47, 52, -1 },
     },
    {
     .x = 11,
     .z = 18,
     .modelId = 3,
     .xOffset = 0,
     .zOffset = 0,
     .neighbors = { 39, 44, 48, 59, -1, -1 },
     },
    {
     .x = 4,
     .z = 19,
     .modelId = 3,
     .xOffset = 0,
     .zOffset = 0,
     .neighbors = { 42, 45, 51, 52, 53, -1 },
     },
    {
     .x = 11,
     .z = 19,
     .modelId = 3,
     .xOffset = 0,
     .zOffset = 0,
     .neighbors = { 44, 46, 59, 58, -1, -1 },
     },
    {
     .x = 1,
     .z = 20,
     .modelId = 0,
     .xOffset = 0,
     .zOffset = 0,
     .neighbors = { 50, 51, -1, -1, -1, -1 },
     },
    {
     .x = 2,
     .z = 20,
     .modelId = 1,
     .xOffset = 0,
     .zOffset = 0,
     .neighbors = { 49, 51, 52, -1, -1, -1 },
     },
    {
     .x = 3,
     .z = 20,
     .modelId = 1,
     .xOffset = 0,
     .zOffset = 0,
     .neighbors = { 49, 50, 52, 53, 47, -1 },
     },
    {
     .x = 4,
     .z = 20,
     .modelId = 5,
     .xOffset = 0,
     .zOffset = 0,
     .neighbors = { 50, 51, 45, 47, 53, 54 },
     },
    {
     .x = 5,
     .z = 20,
     .modelId = 1,
     .xOffset = 0,
     .zOffset = 0,
     .neighbors = { 47, 51, 52, 54, 55, -1 },
     },
    {
     .x = 6,
     .z = 20,
     .modelId = 1,
     .xOffset = 0,
     .zOffset = 0,
     .neighbors = { 52, 53, 55, 56, -1, -1 },
     },
    {
     .x = 7,
     .z = 20,
     .modelId = 1,
     .xOffset = 0,
     .zOffset = 0,
     .neighbors = { 53, 54, 56, 57, -1, -1 },
     },
    {
     .x = 8,
     .z = 20,
     .modelId = 1,
     .xOffset = 0,
     .zOffset = 0,
     .neighbors = { 54, 55, 57, 58, 59, -1 },
     },
    {
     .x = 9,
     .z = 20,
     .modelId = 1,
     .xOffset = 0,
     .zOffset = 0,
     .neighbors = { 55, 56, 58, 59, -1, -1 },
     },
    {
     .x = 10,
     .z = 20,
     .modelId = 1,
     .xOffset = 0,
     .zOffset = 0,
     .neighbors = { 56, 57, 59, 48, -1, -1 },
     },
    {
     .x = 11,
     .z = 20,
     .modelId = 11,
     .xOffset = 0,
     .zOffset = 0,
     .neighbors = { 58, 48, 57, 46, -1, -1 },
     },
};

void GymmickInit_Fuchsia(FieldSystem *fieldSystem) {
    GymmickUnion *gymmickUnion = Save_Gymmick_AssertMagic_GetData(Save_GetGymmickPtr(FieldSystem_GetSaveData(fieldSystem)), GYMMICK_FUCHSIA);
    fieldSystem->unk4->unk24 = Heap_Alloc(HEAP_ID_FIELD1, sizeof(FuchsiaGymmickLocalData));
    MI_CpuClear8(fieldSystem->unk4->unk24, sizeof(FuchsiaGymmickLocalData));
    FuchsiaGymmickLocalData *localData = fieldSystem->unk4->unk24;
    FuchsiaGymmick_Load3DGraphics(localData, HEAP_ID_FIELD1);
    for (int i = 0; i < 3; ++i) {
        localData->wallAnimTasks[i].wallId = -1;
    }
}

void GymmickFree_Fuchsia(FieldSystem *fieldSystem) {
    u8 i; // declaration here is required to match
    FuchsiaGymmickLocalData *localData = fieldSystem->unk4->unk24;

    FuchsiaGymmick_Unload3DGraphics(localData);
    for (i = 0; i < 3; ++i) {
        if (localData->wallAnimTasks[i].active != 0) {
            SysTask_Destroy(localData->wallAnimTasks[i].sysTask);
        }
    }
    Heap_Free(localData);
    fieldSystem->unk4->unk24 = NULL;
}

void FuchsiaGymmick_CheckCollision(FieldSystem *fieldSystem, int x, int z) {
    FuchsiaGymmickLocalData *localData = fieldSystem->unk4->unk24;

    s16 wallId = FuchsiaGymmick_GetWallIdAt(x, z);
    if (wallId < 0) {
        PlaySE(SEQ_SE_DP_WALL_HIT);
        return;
    }
    if (!FuchsiaGymmick_IsWallAnimationAlreadyPlaying(localData->wallAnimTasks, wallId)) {
        FuchsiaGymmick_StartWallAnimation(localData, fieldSystem, wallId);
        PlaySE(SEQ_SE_GS_TOUMEINAKABEHIT);
    }
}

static void SysTask_AnimateFuchsiaWall(SysTask *sysTask, void *data) {
    FuchsiaGymmickWallAnimTask *animtask = data;
    FuchsiaGymmickWallAnimState *animState = animtask->animState;
    if (FuchsiaGymmick_FrameAdvanceWallAnimations_CheckAllDone(animState->anims, 4)) {
        FuchsiaGymmick_KillWallAnimTask(animtask);
    } else {
        Field3dObject_Draw(&animState->object);
    }
}

static void FuchsiaGymmick_Load3DGraphics(FuchsiaGymmickLocalData *localData, enum HeapID heapID) {
    u8 i;

    HeapExp_FndInitAllocator(&localData->allocator, heapID, 0x20);

    for (i = 0; i < 12; ++i) {
        FuchsiaGymmickWallAnimState *animState20;
        u8 j;

        localData->wallAnimsManagers[i].idx = 0;
        Field3dModel_LoadFromFilesystem(&localData->models[i], NARC_a_2_4_6, i, heapID);
        for (j = 0; j < 3; ++j) {
            u8 k;

            animState20 = &localData->wallAnimsManagers[i].buffer[j];
            animState20->active = FALSE;
            for (k = 0; k < 4; ++k) {
                Field3dModelAnimation_LoadFromFilesystem(&animState20->anims[k], &localData->models[i], NARC_a_2_4_6, 12 + k * 12 + i, heapID, &localData->allocator);
            }
            Field3dObject_InitFromModel(&animState20->object, &localData->models[i]);
            for (k = 0; k < 4; ++k) {
                Field3dObject_AddAnimation(&animState20->object, &animState20->anims[k]);
                Field3dModelAnimation_FrameSet(&animState20->anims[k], 0);
            }
            VecFx32 pos = { 0, 0, 0 };
            Field3dObject_SetPosEx(&animState20->object, pos.x, pos.y, pos.z);
            Field3dObject_SetActiveFlag(&animState20->object, FALSE);
        }
    }
}

static void FuchsiaGymmick_Unload3DGraphics(FuchsiaGymmickLocalData *localData) {
    u8 i;
    for (i = 0; i < 12; ++i) {
        u8 j;
        FuchsiaGymmickWallAnimState *animState;
        Field3dModel_Unload(&localData->models[i]);
        for (j = 0; j < 3; ++j) {
            u8 k;
            animState = &localData->wallAnimsManagers[i].buffer[j];
            for (k = 0; k < 4; ++k) {
                Field3dModelAnimation_Unload(&animState->anims[k], &localData->allocator);
            }
        }
    }
}

static s16 FuchsiaGymmick_GetWallIdAt(int x, int z) {
    for (s16 i = 0; i < 60; ++i) {
        if (x == sWallData[i].x && z == sWallData[i].z) {
            return i;
        }
    }

    return -1;
}

static BOOL FuchsiaGymmick_IsWallAnimationAlreadyPlaying(FuchsiaGymmickWallAnimTask *animTask, s16 wallId) {
    for (u8 i = 0; i < 3; ++i) {
        if (animTask[i].active && animTask[i].wallId == wallId) {
            return TRUE;
        }
    }

    return FALSE;
}

static void FuchsiaGymmick_StartWallAnimation(FuchsiaGymmickLocalData *localData, FieldSystem *fieldSystem, u8 wallId) {
    u8 i;
    u8 animManagerIdx;
    FuchsiaGymmickWallAnimTask *animTask = &localData->wallAnimTasks[localData->wallAnimTaskPointer];

    if (animTask->active) {
        GF_ASSERT(FALSE);
        return;
    }
    FuchsiaGymmick_KillNeighboringSegmentsAnims(localData, wallId);
    animTask->active = TRUE;
    animTask->wallId = wallId;
    animManagerIdx = sWallData[wallId].modelId;
    animTask->animState = FuchsiaGymmick_AllocateWallAnimState(&localData->wallAnimsManagers[animManagerIdx]);
    animTask->sysTask = SysTask_CreateOnMainQueue(SysTask_AnimateFuchsiaWall, animTask, 0);
    Field3dObject_SetActiveFlag(&animTask->animState->object, TRUE);
    VecFx32 position = { 0, 0, 0 };
    MapObject_CopyPositionVector(PlayerAvatar_GetMapObject(fieldSystem->playerAvatar), &position);
    position.x = FX32_ONE * ((8 + 16 * sWallData[wallId].x) + 16 * sWallData[wallId].xOffset);
    position.z = FX32_ONE * ((8 + 16 * sWallData[wallId].z) + 16 * sWallData[wallId].zOffset);
    Field3dObject_SetPosEx(&animTask->animState->object, position.x, position.y, position.z);
    for (i = 0; i < 4; ++i) {
        Field3dModelAnimation_FrameSet(&animTask->animState->anims[i], 0);
    }
    localData->wallAnimTaskPointer = (localData->wallAnimTaskPointer + 1) % 3;
}

static BOOL FuchsiaGymmick_FrameAdvanceWallAnimations_CheckAllDone(Field3DModelAnimation *anim, u8 num) {
    u8 i;
    u8 count = 0;

    for (i = 0; i < num; ++i) {
        if (Field3dModelAnimation_FrameAdvanceAndCheck(&anim[i], FX32_ONE)) {
            ++count;
        }
    }

    return count == num;
}

static FuchsiaGymmickWallAnimState *FuchsiaGymmick_AllocateWallAnimState(FuchsiaGymmickWallAnimsManager *animManagers) {
    GF_ASSERT(!animManagers->buffer[animManagers->idx].active);
    FuchsiaGymmickWallAnimState *ret = &animManagers->buffer[animManagers->idx];
    ret->active = TRUE;
    animManagers->idx = (animManagers->idx + 1) % 3;
    return ret;
}

static void FuchsiaGymmick_KillNeighboringSegmentsAnims(FuchsiaGymmickLocalData *localData, const u8 baseWallId) {
    u8 i;
    u8 j;
    for (i = 0; i < 6; ++i) {
        if (sWallData[baseWallId].neighbors[i] < 0) {
            break;
        }
        for (j = 0; j < 3; ++j) {
            s16 wallId;
            if (!localData->wallAnimTasks[j].active) {
                continue;
            }
            wallId = localData->wallAnimTasks[j].wallId;
            if (sWallData[baseWallId].neighbors[i] == wallId) {
                FuchsiaGymmick_KillWallAnimTask(&localData->wallAnimTasks[j]);
                break;
            }
        }
    }
}

static void FuchsiaGymmick_KillWallAnimTask(FuchsiaGymmickWallAnimTask *a0) {
    Field3dObject_SetActiveFlag(&a0->animState->object, FALSE);
    a0->animState->active = FALSE;
    a0->active = FALSE;
    a0->wallId = -1;
    a0->animState = NULL;
    SysTask_Destroy(a0->sysTask);
    a0->sysTask = NULL;
}
