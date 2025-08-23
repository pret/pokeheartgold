#include "demo/legend.naix"
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
    Field3dModel unownModels[2];
    Field3DModelAnimation unownAnimations[2][2];
    Field3dObject unownObjects[2];
    Field3dModel model174;
    Field3DModelAnimation animation184[2];
    Field3dObject object1AC;
    u8 unk224;
    u8 unk225;
    u8 drawObjectFlag;
    u8 unk227;
} SinjohCutsceneData;

typedef struct SinjohGetEggCutsceneData {
    FieldSystem *fieldSystem;
    NNSFndAllocator alloc;
    Field3dModel eggModel;
    Field3DModelAnimation animations[4];
    Field3dObject object;
    u8 unkEC;
    u8 unkED;
    u8 unkEE;
    u8 whichLegend;
} SinjohGetEggCutsceneData;

static BOOL Task_SinjohCutscene(TaskManager *taskMan);
static void SinjohCutscene_LoadResources(SinjohCutsceneData *data);
static void SinjohCutscene_FreeResources(SinjohCutsceneData *data);
static void sField3DModelAnimation_Array_SetFrame(Field3DModelAnimation *animation, u32 length, u32 frame);
static BOOL sField3DModelAnimation_Array_FrameAdvanceAndCheck(Field3DModelAnimation *animation, u32 length);
static BOOL Task_SinjohGetEggCutscene(TaskManager *taskMan);
static void SinjohGetEggCutscene_LoadResources(SinjohGetEggCutsceneData *data);
static void SinjohGetEggCutscene_FreeResources(SinjohGetEggCutsceneData *data);

void FieldSystem_BeginSinjohCutsceneTask(FieldSystem *fieldSystem) {
    SinjohCutsceneData *data = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(SinjohCutsceneData));
    MI_CpuFill8(data, 0, sizeof(SinjohCutsceneData));
    data->fieldSystem = fieldSystem;
    TaskManager_Call(fieldSystem->taskman, Task_SinjohCutscene, data);
}

typedef enum SinjohCutsceneState {
    SJC_STATE_BEGIN_PALETTE_FADE,
    SJC_STATE_LOAD_RESOURCES,
    SJC_STATE_2,
    SJC_STATE_3,
    SJC_STATE_4,
    SJC_STATE_WAIT_FREE_RESOURCES
} SinjohCutsceneState;

static BOOL Task_SinjohCutscene(TaskManager *taskMan) {
    int *state = TaskManager_GetStatePtr(taskMan);
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskMan);
    SinjohCutsceneData *data = TaskManager_GetEnvironment(taskMan);
    switch (*state) {
    case SJC_STATE_BEGIN_PALETTE_FADE:
        BeginNormalPaletteFade(3, 0, 0, RGB_WHITE, 2, 1, HEAP_ID_4);
        (*state)++;
        break;
    case SJC_STATE_LOAD_RESOURCES:
        if (IsPaletteFadeFinished()) {
            SinjohCutscene_LoadResources(data);
            BeginNormalPaletteFade(3, 1, 0, RGB_WHITE, 2, 1, HEAP_ID_4);
            (*state)++;
        }
        break;
    case SJC_STATE_2:
        if (IsPaletteFadeFinished()) {
            data->unk224 = 1;
            data->unk227 = 0;
            Field3dObject_SetActiveFlag(&data->object1AC, 1);
            (*state)++;
        }
        break;
    case SJC_STATE_3:
        if (++data->unk227 >= 100) {
            data->unk225 = 1;
            data->unk227 = 0;
            (*state)++;
        }
        break;
    case SJC_STATE_4:
        if (++data->unk227 >= 150) {
            BeginNormalPaletteFade(3, 0, 0, RGB_WHITE, 2, 1, HEAP_ID_4);
            (*state)++;
        }
        break;
    case SJC_STATE_WAIT_FREE_RESOURCES:
        if (IsPaletteFadeFinished()) {
            SinjohCutscene_FreeResources(data);
            Heap_Free(data);
            return TRUE;
        }
        break;
    }
    if (data->unk224) {
        sField3DModelAnimation_Array_FrameAdvanceAndCheck(&data->unownAnimations[0][0], 2);
        sField3DModelAnimation_Array_FrameAdvanceAndCheck(&data->unownAnimations[1][0], 2);
    }
    if (data->unk225) {
        sField3DModelAnimation_Array_FrameAdvanceAndCheck(&data->animation184[0], 2);
    }
    if (data->drawObjectFlag) {
        Field3dObject_Draw(&data->unownObjects[0]);
        Field3dObject_Draw(&data->unownObjects[1]);
        Field3dObject_Draw(&data->object1AC);
    }
    return FALSE;
}

static const u32 sUnownAnimationFiles[2][2] = {
    { NARC_legend_legend_00000080_NSBCA, NARC_legend_legend_00000081_NSBTA },
    { NARC_legend_legend_00000083_NSBCA, NARC_legend_legend_00000084_NSBTA },
};

static const u32 sSinjohEggModelFiles[3] = { NARC_legend_legend_00000088_NSBMD, NARC_legend_legend_00000092_NSBMD, NARC_legend_legend_00000096_NSBMD };

static const u32 sUnownModelFiles[2] = { NARC_legend_legend_00000079_NSBMD, NARC_legend_legend_00000082_NSBMD };
static const u32 ov02_02253CF8_0[2] = { NARC_legend_legend_00000086_NSBCA, NARC_legend_legend_00000087_NSBMA };

static void SinjohCutscene_LoadResources(SinjohCutsceneData *data) {
    u8 i, j;

    u32 unownAnimationFiles[2][2];
    unownAnimationFiles = sUnownAnimationFiles;
    VecFx32 arceusPos;
    u32 unkData2[2];
    u32 unownModelFiles[2];
    unkData2 = ov02_02253CF8_0;
    unownModelFiles = sUnownModelFiles;

    GF_ExpHeap_FndInitAllocator(&data->alloc, HEAP_ID_4, 32);

    for (i = 0; i < NELEMS(data->unownObjects); i++) {
        Field3dModel_LoadFromFilesystem(&data->unownModels[i], NARC_demo_legend, unownModelFiles[i], HEAP_ID_4);
    }

    Field3dModel_LoadFromFilesystem(&data->model174, NARC_demo_legend, 85, HEAP_ID_4);

    for (j = 0; j < NELEMS(data->unownAnimations[0]); j++) {
        for (i = 0; i < NELEMS(data->unownObjects); i++) {
            Field3dModelAnimation_LoadFromFilesystem(&data->unownAnimations[j][i], &data->unownModels[j], NARC_demo_legend, unownAnimationFiles[j][i], HEAP_ID_4, &data->alloc);
        }
    }

    for (i = 0; i < NELEMS(data->animation184); i++) {
        Field3dModelAnimation_LoadFromFilesystem(&data->animation184[i], &data->model174, NARC_demo_legend, unkData2[i], HEAP_ID_4, &data->alloc);
    }

    for (i = 0; i < NELEMS(data->unownObjects); i++) {
        Field3dObject_InitFromModel(&data->unownObjects[i], &data->unownModels[i]);
    }

    Field3dObject_InitFromModel(&data->object1AC, &data->model174);

    for (j = 0; j < NELEMS(data->unownAnimations[0]); j++) {
        for (i = 0; i < NELEMS(data->unownObjects); i++) {
            Field3dObject_AddAnimation(&data->unownObjects[j], &data->unownAnimations[j][i]);
        }
    }

    for (i = 0; i < NELEMS(data->animation184); i++) {
        Field3dObject_AddAnimation(&data->object1AC, &data->animation184[i]);
    }

    for (i = 0; i < NELEMS(data->unownObjects); i++) {
        Field3dObject_SetActiveFlag(&data->unownObjects[i], 1);
        sField3DModelAnimation_Array_SetFrame(&data->unownAnimations[i][0], NELEMS(data->unownAnimations[i]), 0);
    }

    Field3dObject_SetActiveFlag(&data->object1AC, 0);
    sField3DModelAnimation_Array_SetFrame(&data->animation184[0], NELEMS(data->unownAnimations[i]), 0);

    MapObject_CopyPositionVector(FollowMon_GetMapObject(data->fieldSystem), &arceusPos);

    for (i = 0; i < NELEMS(data->unownObjects); i++) {
        Field3dObject_SetPosEx(&data->unownObjects[i], arceusPos.x, arceusPos.y, arceusPos.z);
    }

    Field3dObject_SetPosEx(&data->object1AC, arceusPos.x, arceusPos.y, arceusPos.z);

    data->drawObjectFlag = 1;
}

static void SinjohCutscene_FreeResources(SinjohCutsceneData *data) {
    for (u8 i = 0; i < NELEMS(data->unownAnimations); i++) {
        for (u8 j = 0; j < NELEMS(data->unownAnimations[i]); j++) {
            Field3dModelAnimation_Unload(&data->unownAnimations[i][j], &data->alloc);
        }
        Field3dModel_Unload(&data->unownModels[i]);
    }

    for (u8 i = 0; i < NELEMS(data->animation184); i++) {
        Field3dModelAnimation_Unload(&data->animation184[i], &data->alloc);
    }

    Field3dModel_Unload(&data->model174);
}

static void sField3DModelAnimation_Array_SetFrame(Field3DModelAnimation *animation, u32 length, u32 frame) {
    for (u8 i = 0; i < length; i++) {
        Field3dModelAnimation_FrameSet(&animation[i], frame);
    }
}

static BOOL sField3DModelAnimation_Array_FrameAdvanceAndCheck(Field3DModelAnimation *animation, u32 length) {
    u8 i;
    u8 cnt = 0;
    for (i = 0; i < length; i++) {
        if (Field3dModelAnimation_FrameAdvanceAndCheck(&animation[i], 0x1000)) {
            cnt++;
        }
    }
    return cnt == length;
}

void FieldSystem_BeginSinjohGetEggCutsceneTask(FieldSystem *fieldSystem, u8 whichLegend) {
    SinjohGetEggCutsceneData *data = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(SinjohGetEggCutsceneData));
    MI_CpuFill8(data, 0, sizeof(SinjohGetEggCutsceneData));
    data->fieldSystem = fieldSystem;
    data->whichLegend = whichLegend;
    TaskManager_Call(fieldSystem->taskman, Task_SinjohGetEggCutscene, data);
}

typedef enum SinjohGetEggCutsceneState {
    SGEC_STATE_BEGIN_PALETTE_FADE,
    SGEC_STATE_LOAD_RESOURCES,
    SGEC_STATE_START_WAIT,
    SGEC_STATE_WAIT,
    SGEC_STATE_FREE_RESOURCES
} SinjohGetEggCutsceneState;

static BOOL Task_SinjohGetEggCutscene(TaskManager *taskMan) {
    int *state = TaskManager_GetStatePtr(taskMan);
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskMan);
    SinjohGetEggCutsceneData *data = TaskManager_GetEnvironment(taskMan);

    switch (*state) {
    case SGEC_STATE_BEGIN_PALETTE_FADE:
        BeginNormalPaletteFade(3, 0, 0, RGB_WHITE, 2, 1, HEAP_ID_4);
        (*state)++;
        break;
    case SGEC_STATE_LOAD_RESOURCES:
        if (IsPaletteFadeFinished()) {
            SinjohGetEggCutscene_LoadResources(data);
            BeginNormalPaletteFade(3, 1, 0, RGB_WHITE, 2, 1, HEAP_ID_4);
            (*state)++;
        }
        break;
    case SGEC_STATE_START_WAIT:
        if (IsPaletteFadeFinished()) {
            data->unkEC = 1;
            data->unkED = 0;
            (*state)++;
        }
        break;
    case SGEC_STATE_WAIT:
        if (data->unkED) {
            (*state)++;
        }
        break;
    case SGEC_STATE_FREE_RESOURCES:
        SinjohGetEggCutscene_FreeResources(data);
        Heap_Free(data);
        return TRUE;
    }

    if (data->unkEC) {
        data->unkED = sField3DModelAnimation_Array_FrameAdvanceAndCheck(&data->animations[0], 4);
    }

    if (data->unkEE) {
        Field3dObject_Draw(&data->object);
    }
    return FALSE;
}

static const u32 sSinjohEggAnimationFiles[3][4] = {
    { NARC_legend_legend_00000100_NSBCA, NARC_legend_legend_00000090_NSBTA, NARC_legend_legend_00000091_NSBMA, NARC_legend_legend_00000089_NSBTP },
    { NARC_legend_legend_00000100_NSBCA, NARC_legend_legend_00000094_NSBTA, NARC_legend_legend_00000095_NSBMA, NARC_legend_legend_00000093_NSBTP },
    { NARC_legend_legend_00000100_NSBCA, NARC_legend_legend_00000098_NSBTA, NARC_legend_legend_00000099_NSBMA, NARC_legend_legend_00000097_NSBTP },
};

static void SinjohGetEggCutscene_LoadResources(SinjohGetEggCutsceneData *data) {
    u32 eggAnimationFiles[3][4];
    eggAnimationFiles = sSinjohEggAnimationFiles;

    u32 modelFiles[3];
    modelFiles = sSinjohEggModelFiles;

    VecFx32 arceusPos;

    GF_ExpHeap_FndInitAllocator(&data->alloc, HEAP_ID_4, 32);
    Field3dModel_LoadFromFilesystem(&data->eggModel, NARC_demo_legend, modelFiles[data->whichLegend], HEAP_ID_4);

    for (u8 i = 0; i < NELEMS(data->animations); i++) {
        Field3dModelAnimation_LoadFromFilesystem(&data->animations[i], &data->eggModel, NARC_demo_legend, eggAnimationFiles[data->whichLegend][i], HEAP_ID_4, &data->alloc);
    }

    Field3dObject_InitFromModel(&data->object, &data->eggModel);

    for (u8 i = 0; i < NELEMS(data->animations); i++) {
        Field3dObject_AddAnimation(&data->object, &data->animations[i]);
    }

    Field3dObject_SetActiveFlag(&data->object, 1);
    sField3DModelAnimation_Array_SetFrame(&data->animations[0], 4, 0);

    MapObject_CopyPositionVector(FollowMon_GetMapObject(data->fieldSystem), &arceusPos);

    Field3dObject_SetPosEx(&data->object, arceusPos.x, arceusPos.y, arceusPos.z);

    data->unkEE = 1;
}

static void SinjohGetEggCutscene_FreeResources(SinjohGetEggCutsceneData *data) {
    for (u8 i = 0; i < NELEMS(data->animations); i++) {
        Field3dModelAnimation_Unload(&data->animations[i], &data->alloc);
    }
    Field3dModel_Unload(&data->eggModel);
}
