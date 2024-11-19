#include "field/overlay_01_021FB878.h"
#include "overlay_2/event_cutscene.h"

#include "fieldmap.h"
#include "follow_mon.h"
#include "math_util.h"
#include "overlay_01_021F467C.h"
#include "overlay_01_021F944C.h"
#include "overlay_01_022053EC.h"
#include "script_pokemon_util.h"
#include "task.h"
#include "unk_0200FA24.h"
#include "unk_02062108.h"
#include "unk_020689C8.h"

typedef struct SinjohCutsceneData {
    FieldSystem *fieldSystem;
    struct NNSFndAllocator alloc;
    Field3dModel model[2];
    Field3DModelAnimation animations[2][2];
    Field3dObject object84[2];
    Field3dModel model174;
    Field3DModelAnimation animation184[2];
    Field3dObject object1AC;
    u8 unk224;
    u8 unk225;
    u8 unk226;
    u8 unk227;
} SinjohCutsceneData;

typedef struct SinjohGetEggCutsceneData {
    FieldSystem *fieldSystem;
    NNSFndAllocator alloc;
    Field3dModel model;
    Field3DModelAnimation animations[4];
    Field3dObject object;
    u8 unkEC;
    u8 unkED;
    u8 unkEE;
    u8 unkEF;
} SinjohGetEggCutsceneData;

static BOOL Task_SinjohCutscene(TaskManager *taskMan);
static void SinjohCutscene_LoadResources(SinjohCutsceneData *data);
static void SinjohCutscene_FreeResources(SinjohCutsceneData *data);
static void ov02_02252E80(Field3DModelAnimation *animation, u32 a1, u32 a2);
static BOOL ov02_02252EA8(Field3DModelAnimation *animation, u32 a1);
static BOOL Task_SinjohGetEggCutscene(TaskManager *taskMan);
static void SinjohGetEggCutscene_LoadResources(SinjohGetEggCutsceneData *data);
static void SinjohGetEggCutscene_FreeResources(SinjohGetEggCutsceneData *data);

void FieldSystem_BeginSinjohCutsceneTask(FieldSystem *fieldSystem) {
    SinjohCutsceneData *data = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(SinjohCutsceneData));
    MI_CpuFill8(data, 0, sizeof(SinjohCutsceneData));
    data->fieldSystem = fieldSystem;
    TaskManager_Call(fieldSystem->taskman, Task_SinjohCutscene, data);
}

static BOOL Task_SinjohCutscene(TaskManager *taskMan) {
    int *state               = TaskManager_GetStatePtr(taskMan);
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskMan);
    SinjohCutsceneData *data = TaskManager_GetEnvironment(taskMan);
    switch (*state) {
    case 0:
        BeginNormalPaletteFade(3, 0, 0, RGB_WHITE, 2, 1, HEAP_ID_4);
        (*state)++;
        break;
    case 1:
        if (IsPaletteFadeFinished()) {
            SinjohCutscene_LoadResources(data);
            BeginNormalPaletteFade(3, 1, 0, RGB_WHITE, 2, 1, HEAP_ID_4);
            (*state)++;
        }
        break;
    case 2:
        if (IsPaletteFadeFinished()) {
            data->unk224 = 1;
            data->unk227 = 0;
            Field3dObject_SetActiveFlag(&data->object1AC, 1);
            (*state)++;
        }
        break;
    case 3:
        if (++data->unk227 >= 100) {
            data->unk225 = 1;
            data->unk227 = 0;
            (*state)++;
        }
        break;
    case 4:
        if (++data->unk227 >= 150) {
            BeginNormalPaletteFade(3, 0, 0, RGB_WHITE, 2, 1, HEAP_ID_4);
            (*state)++;
        }
        break;
    case 5:
        if (IsPaletteFadeFinished()) {
            SinjohCutscene_FreeResources(data);
            FreeToHeap(data);
            return TRUE;
        }
        break;
    }
    if (data->unk224) {
        ov02_02252EA8(&data->animations[0][0], 2);
        ov02_02252EA8(&data->animations[1][0], 2);
    }
    if (data->unk225) {
        ov02_02252EA8(&data->animation184[0], 2);
    }
    if (data->unk226) {
        Field3dObject_Draw(&data->object84[0]);
        Field3dObject_Draw(&data->object84[1]);
        Field3dObject_Draw(&data->object1AC);
    }
    return FALSE;
}

static const u32 ov02_02253D14[2][2] = {
    { 80, 81 },
    { 83, 84 },
};

static const u32 sSinjohEggModelFiles[3] = { 88, 92, 96 };

static const u32 ov02_02253CF8_1[2] = { 79, 82 };
static const u32 ov02_02253CF8_0[2] = { 86, 87 };

static void SinjohCutscene_LoadResources(SinjohCutsceneData *data) {
    u8 i, j;

    u32 unkData[2][2];
    unkData = ov02_02253D14;
    VecFx32 arceusPos;
    u32 unkData2[2];
    u32 unkData3[2];
    unkData2 = ov02_02253CF8_0;
    unkData3 = ov02_02253CF8_1;

    GF_ExpHeap_FndInitAllocator(&data->alloc, HEAP_ID_4, 32);

    for (i = 0; i < 2; i++) {
        Field3dModel_LoadFromFilesystem(&data->model[i], NARC_demo_legend, unkData3[i], HEAP_ID_4);
    }

    Field3dModel_LoadFromFilesystem(&data->model174, NARC_demo_legend, 85, HEAP_ID_4);

    for (j = 0; j < 2; j++) {
        for (i = 0; i < 2; i++) {
            Field3dModelAnimation_LoadFromFilesystem(&data->animations[j][i], &data->model[j], NARC_demo_legend, unkData[j][i], HEAP_ID_4, &data->alloc);
        }
    }

    for (i = 0; i < 2; i++) {
        Field3dModelAnimation_LoadFromFilesystem(&data->animation184[i], &data->model174, NARC_demo_legend, unkData2[i], HEAP_ID_4, &data->alloc);
    }

    for (i = 0; i < 2; i++) {
        Field3dObject_InitFromModel(&data->object84[i], &data->model[i]);
    }

    Field3dObject_InitFromModel(&data->object1AC, &data->model174);

    for (j = 0; j < 2; j++) {
        for (i = 0; i < 2; i++) {
            Field3dObject_AddAnimation(&data->object84[j], &data->animations[j][i]);
        }
    }

    for (i = 0; i < 2; i++) {
        Field3dObject_AddAnimation(&data->object1AC, &data->animation184[i]);
    }

    for (i = 0; i < 2; i++) {
        Field3dObject_SetActiveFlag(&data->object84[i], 1);
        ov02_02252E80(&data->animations[i][0], 2, 0);
    }

    Field3dObject_SetActiveFlag(&data->object1AC, 0);
    ov02_02252E80(&data->animation184[0], 2, 0);

    MapObject_GetPositionVec(FollowMon_GetMapObject(data->fieldSystem), &arceusPos);

    for (i = 0; i < 2; i++) {
        Field3dObject_SetPosEx(&data->object84[i], arceusPos.x, arceusPos.y, arceusPos.z);
    }

    Field3dObject_SetPosEx(&data->object1AC, arceusPos.x, arceusPos.y, arceusPos.z);

    data->unk226 = 1;
}

static void SinjohCutscene_FreeResources(SinjohCutsceneData *data) {
    for (u8 i = 0; i < 2; i++) {
        for (u8 j = 0; j < 2; j++) {
            Field3dModelAnimation_Unload(&data->animations[i][j], &data->alloc);
        }
        Field3dModel_Unload(&data->model[i]);
    }

    for (u8 i = 0; i < 2; i++) {
        Field3dModelAnimation_Unload(&data->animation184[i], &data->alloc);
    }

    Field3dModel_Unload(&data->model174);
}

static void ov02_02252E80(Field3DModelAnimation *animation, u32 a1, u32 a2) {
    for (u8 i = 0; i < a1; i++) {
        Field3dModelAnimation_FrameSet(&animation[i], a2);
    }
}

static BOOL ov02_02252EA8(Field3DModelAnimation *animation, u32 a1) {
    u8 i;
    u8 cnt = 0;
    for (i = 0; i < a1; i++) {
        if (Field3dModelAnimation_FrameAdvanceAndCheck(&animation[i], (1 << 12))) {
            cnt++;
        }
    }
    return cnt == a1;
}

void FieldSystem_BeginSinjohGetEggCutsceneTask(FieldSystem *fieldSystem, u8 a1) {
    SinjohGetEggCutsceneData *data = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(SinjohGetEggCutsceneData));
    MI_CpuFill8(data, 0, sizeof(SinjohGetEggCutsceneData));
    data->fieldSystem = fieldSystem;
    data->unkEF       = a1;
    TaskManager_Call(fieldSystem->taskman, Task_SinjohGetEggCutscene, data);
}

static BOOL Task_SinjohGetEggCutscene(TaskManager *taskMan) {
    int *state                     = TaskManager_GetStatePtr(taskMan);
    FieldSystem *fieldSystem       = TaskManager_GetFieldSystem(taskMan);
    SinjohGetEggCutsceneData *data = TaskManager_GetEnvironment(taskMan);

    switch (*state) {
    case 0:
        BeginNormalPaletteFade(3, 0, 0, RGB_WHITE, 2, 1, HEAP_ID_4);
        (*state)++;
        break;
    case 1:
        if (IsPaletteFadeFinished()) {
            SinjohGetEggCutscene_LoadResources(data);
            BeginNormalPaletteFade(3, 1, 0, RGB_WHITE, 2, 1, HEAP_ID_4);
            (*state)++;
        }
        break;
    case 2:
        if (IsPaletteFadeFinished()) {
            data->unkEC = 1;
            data->unkED = 0;
            (*state)++;
        }
        break;
    case 3:
        if (data->unkED) {
            (*state)++;
        }
        break;
    case 4:
        SinjohGetEggCutscene_FreeResources(data);
        FreeToHeap(data);
        return TRUE;
    }

    if (data->unkEC) {
        data->unkED = ov02_02252EA8(&data->animations[0], 4);
    }

    if (data->unkEE) {
        Field3dObject_Draw(&data->object);
    }
    return FALSE;
}

static const u32 ov02_02253D24[3][4] = {
    { 100, 90, 91, 89 },
    { 100, 94, 95, 93 },
    { 100, 98, 99, 97 },
};

static void SinjohGetEggCutscene_LoadResources(SinjohGetEggCutsceneData *data) {
    u32 animFiles[3][4];
    animFiles = ov02_02253D24;

    u32 modelFiles[3];
    modelFiles = sSinjohEggModelFiles;

    VecFx32 arceusPos;

    GF_ExpHeap_FndInitAllocator(&data->alloc, HEAP_ID_4, 32);
    Field3dModel_LoadFromFilesystem(&data->model, NARC_demo_legend, modelFiles[data->unkEF], HEAP_ID_4);

    for (u8 i = 0; i < 4; i++) {
        Field3dModelAnimation_LoadFromFilesystem(&data->animations[i], &data->model, NARC_demo_legend, animFiles[data->unkEF][i], HEAP_ID_4, &data->alloc);
    }

    Field3dObject_InitFromModel(&data->object, &data->model);

    for (u8 i = 0; i < 4; i++) {
        Field3dObject_AddAnimation(&data->object, &data->animations[i]);
    }

    Field3dObject_SetActiveFlag(&data->object, 1);
    ov02_02252E80(&data->animations[0], 4, 0);

    MapObject_GetPositionVec(FollowMon_GetMapObject(data->fieldSystem), &arceusPos);

    Field3dObject_SetPosEx(&data->object, arceusPos.x, arceusPos.y, arceusPos.z);

    data->unkEE = 1;
}

static void SinjohGetEggCutscene_FreeResources(SinjohGetEggCutsceneData *data) {
    for (u8 i = 0; i < 4; i++) {
        Field3dModelAnimation_Unload(&data->animations[i], &data->alloc);
    }
    Field3dModel_Unload(&data->model);
}
