#include "field/overlay_01_021FB878.h"

#include "field_system.h"
#include "overlay_04.h"

typedef struct ViridianGymmickAnimState {
    Field3DModelAnimation anim;
    Field3dObject object;
} ViridianGymmickAnimState;

typedef struct ViridianGymmickAnimManager {
    BOOL active;
    int stateId;
    ViridianGymmickAnimState animStates[4];
    SysTask *sysTask;
} ViridianGymmickAnimManager; // size: 0x23C

typedef struct ViridianGymmickLocalData {
    NNSFndAllocator allocator;
    Field3dModel models[4];
    int animMgrIdx;
    ViridianGymmickAnimManager animMgrs[3];
} ViridianGymmickLocalData; // size: 0x708

static void ViridianGymmick_Load3dGraphics(ViridianGymmickLocalData *localData, enum HeapID heapID);
static void ViridianGymmick_Unload3dGraphics(ViridianGymmickLocalData *localData);
static void ViridianGymmick_StartTileAnimTask(ViridianGymmickAnimManager *animMgr, FieldSystem *fieldSystem, u8 tile);
static void SysTask_ViridianGymmick_PlayTileAnim(SysTask *sysTask, void *taskData);
static BOOL ViridianGymmick_PlayTileAnimAndCheck(ViridianGymmickAnimState *animState);

void GymmickInit_Viridian(FieldSystem *fieldSystem) {
    GymmickUnion *gymmickUnion = Save_Gymmick_AssertMagic_GetData(Save_GetGymmickPtr(FieldSystem_GetSaveData(fieldSystem)), GYMMICK_VIRIDIAN);
    fieldSystem->unk4->unk24 = Heap_Alloc(HEAP_ID_FIELD1, sizeof(ViridianGymmickLocalData));
    MI_CpuClear8(fieldSystem->unk4->unk24, sizeof(ViridianGymmickLocalData));
    ViridianGymmickLocalData *localData = fieldSystem->unk4->unk24;
    ViridianGymmick_Load3dGraphics(localData, HEAP_ID_FIELD1);
}

void GymmickFree_Viridian(FieldSystem *fieldSystem) {
    u8 i;
    ViridianGymmickLocalData *localData = fieldSystem->unk4->unk24;
    ViridianGymmick_Unload3dGraphics(localData);
    for (i = 0; i < 3; ++i) {
        if (localData->animMgrs[i].active) {
            SysTask_Destroy(localData->animMgrs[i].sysTask);
        }
    }
    Heap_Free(localData);
    fieldSystem->unk4->unk24 = NULL;
}

void ViridianGymmick_HandleTileAction(FieldSystem *fieldSystem, u8 tile) {
    ViridianGymmickLocalData *localData = fieldSystem->unk4->unk24;
    if (!localData->animMgrs[localData->animMgrIdx].active) {
        ViridianGymmick_StartTileAnimTask(&localData->animMgrs[localData->animMgrIdx], fieldSystem, tile);
        localData->animMgrIdx = (localData->animMgrIdx + 1) % 3;
    } else {
        GF_ASSERT(FALSE);
    }
}

static void ViridianGymmick_Load3dGraphics(ViridianGymmickLocalData *localData, enum HeapID heapID) {
    u8 i;
    u8 j;
    u8 k;

    HeapExp_FndInitAllocator(&localData->allocator, heapID, 0x20);

    for (i = 0; i < 4; ++i) {
        Field3dModel_LoadFromFilesystem(&localData->models[i], NARC_a_2_5_5, i + 4, heapID);
    }

    for (j = 0; j < 3; ++j) {
        ViridianGymmickAnimManager *animMgr;

        localData->animMgrIdx = 0;
        animMgr = &localData->animMgrs[j];
        animMgr->active = FALSE;
        animMgr->stateId = 0;
        for (k = 0; k < 4; ++k) {
            Field3dModelAnimation_LoadFromFilesystem(&animMgr->animStates[k].anim, &localData->models[k], NARC_a_2_5_5, k, heapID, &localData->allocator);
            Field3dObject_InitFromModel(&animMgr->animStates[k].object, &localData->models[k]);
            Field3dObject_AddAnimation(&animMgr->animStates[k].object, &animMgr->animStates[k].anim);
            Field3dModelAnimation_FrameSet(&animMgr->animStates[k].anim, 0);
            VecFx32 position = { 0, 0, 0 };
            Field3dObject_SetPosEx(&animMgr->animStates[j].object, position.x, position.y, position.z); // bug: wrong index
            Field3dObject_SetActiveFlag(&animMgr->animStates[k].object, FALSE);
        }
    }
}

static void ViridianGymmick_Unload3dGraphics(ViridianGymmickLocalData *localData) {
    u8 i;
    u8 j;
    u8 k;

    for (i = 0; i < 4; ++i) {
        Field3dModel_Unload(&localData->models[i]);
    }

    for (j = 0; j < 3; ++j) {
        ViridianGymmickAnimManager *r4 = &localData->animMgrs[j];
        for (k = 0; k < 4; ++k) {
            Field3dModelAnimation_Unload(&r4->animStates[k].anim, &localData->allocator);
        }
    }
}

static void ViridianGymmick_StartTileAnimTask(ViridianGymmickAnimManager *animMgr, FieldSystem *fieldSystem, u8 tile) {
    int idx = 1;
    animMgr->active = TRUE;
    switch (tile) {
    case 64:
        idx = 2;
        break;
    case 65:
        idx = 0;
        break;
    case 66:
        idx = 3;
        break;
    case 67:
        idx = 1;
        break;
    default:
        GF_ASSERT(FALSE);
        return;
    }
    animMgr->stateId = idx;
    animMgr->sysTask = SysTask_CreateOnMainQueue(SysTask_ViridianGymmick_PlayTileAnim, animMgr, 0);
    Field3dObject_SetActiveFlag(&animMgr->animStates[idx].object, TRUE);
    VecFx32 position = { 0, 0, 0 };
    MapObject_CopyPositionVector(PlayerAvatar_GetMapObject(fieldSystem->playerAvatar), &position);
    Field3dObject_SetPosEx(&animMgr->animStates[idx].object, position.x, position.y, position.z);
    Field3dModelAnimation_FrameSet(&animMgr->animStates[idx].anim, 0);
}

static void SysTask_ViridianGymmick_PlayTileAnim(SysTask *sysTask, void *taskData) {
    ViridianGymmickAnimManager *animMgr = taskData;
    u8 index = animMgr->stateId;
    if (ViridianGymmick_PlayTileAnimAndCheck(&animMgr->animStates[index])) {
        Field3dObject_SetActiveFlag(&animMgr->animStates[index].object, FALSE);
        animMgr->active = FALSE;
        SysTask_Destroy(animMgr->sysTask);
        animMgr->sysTask = NULL;
    } else {
        Field3dObject_Draw(&animMgr->animStates[index].object);
    }
}

static BOOL ViridianGymmick_PlayTileAnimAndCheck(ViridianGymmickAnimState *animState) {
    if (Field3dModelAnimation_FrameAdvanceAndCheck(&animState->anim, FX32_ONE)) {
        return TRUE;
    } else {
        return FALSE;
    }
}
