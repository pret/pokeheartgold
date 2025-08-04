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

typedef struct CelebiTimeTravelCutsceneTaskData {
    u16 unk0;
    u8 unk2;
    u8 isSwirlFinished;
    u32 unk4;
    FieldSystem *fieldSystem; // 0x8
    NNSFndAllocator alloc;    // 0xC
    Field3dModel model;       // 0x1C
    Field3DModelAnimation animations[3];
    Field3dObject object3d;
    s32 unkE0;
    u16 unkE4;
    u16 unkE6;
    u16 unkE8;
    u16 perspective;
    u16 unkEC;
    u16 unkEE;
    u8 unkF0;
    u8 unkF1;
    u8 frameTimer;
    u8 unkF3;
} CelebiTimeTravelCutsceneTaskData;

typedef struct UnkStruct_02253CE0 {
    u32 unk0;
    u32 unk4;
    u16 unk8;
} UnkStruct_02253CE0;

static BOOL Task_CelebiTimeTravelCutscene(TaskManager *taskMan);
static void CelebiCutscene_StartSwirlTask(CelebiTimeTravelCutsceneTaskData *data);
static BOOL ov02_022526EC(CelebiTimeTravelCutsceneTaskData *data);
static void Task_CelebiCutsceneSwirl(SysTask *task, void *data);
static void CelebiCutscene_InitSwirlData(CelebiTimeTravelCutsceneTaskData *a0, UnkStruct_02253CE0 *a1);
static BOOL CelebiCutscene_SwirlEffect(CelebiTimeTravelCutsceneTaskData *data);
static void Task_CelebiCutsceneSwirlEffect(SysTask *task, void *data);
static BOOL CelebiCutscene_IsSwirlFinished(CelebiTimeTravelCutsceneTaskData *data);
static void CelebiCutscene_LoadResources(CelebiTimeTravelCutsceneTaskData *data);
static void CelebiCutscene_UnloadResources(CelebiTimeTravelCutsceneTaskData *data);
static void CelebiCutsceneAnimations_FrameSet(Field3DModelAnimation *animations, u32 frame);
static BOOL CelebiCutsceneAnimations_FrameAdvanceAndCheck(Field3DModelAnimation *animations);

void FieldSystem_BeginCelebiTimeTravelCutsceneTask(FieldSystem *fieldSystem) {
    CelebiTimeTravelCutsceneTaskData *ptr = Heap_AllocAtEnd(HEAP_ID_FIELD2, sizeof(CelebiTimeTravelCutsceneTaskData));
    MI_CpuFill8(ptr, 0, sizeof(CelebiTimeTravelCutsceneTaskData));
    ptr->fieldSystem = fieldSystem;
    TaskManager_Call(fieldSystem->taskman, Task_CelebiTimeTravelCutscene, ptr);
}

typedef enum CelebiTimeTravelState {
    CTT_STATE_BEGIN_PALETTE_FADE,
    CTT_STATE_LOAD_RESOURCES,
    CTT_STATE_2,
    CTT_STATE_SWIRL_EFFECT,
    CTT_STATE_PALETTE_FADE_2,
    CTT_STATE_WAIT_UNLOAD_RESOURCES,
} CelebiTimeTravelState;

static BOOL Task_CelebiTimeTravelCutscene(TaskManager *taskMan) {
    int *state = TaskManager_GetStatePtr(taskMan);
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskMan);
    CelebiTimeTravelCutsceneTaskData *data = TaskManager_GetEnvironment(taskMan);
    switch (*state) {
    case CTT_STATE_BEGIN_PALETTE_FADE:
        BeginNormalPaletteFade(3, 0, 0, RGB_WHITE, 4, 1, HEAP_ID_FIELD1);
        (*state)++;
        break;
    case CTT_STATE_LOAD_RESOURCES:
        if (IsPaletteFadeFinished()) {
            CelebiCutscene_LoadResources(data);
            sub_02069DC8(FollowMon_GetMapObject(data->fieldSystem), 1);
            BeginNormalPaletteFade(3, 1, 0, RGB_WHITE, 4, 1, HEAP_ID_FIELD1);
            (*state)++;
        }
        break;
    case CTT_STATE_2:
        if (IsPaletteFadeFinished()) {
            sub_0205F484(FollowMon_GetMapObject(data->fieldSystem));
            data->unkF0 = 1;
            (*state)++;
        }
        break;
    case CTT_STATE_SWIRL_EFFECT:
        if (++data->frameTimer >= 30) {
            CelebiCutscene_StartSwirlTask(data);
            data->frameTimer = 0;
            (*state)++;
        }
        break;
    case CTT_STATE_PALETTE_FADE_2:
        if (++data->frameTimer >= 80) {
            BeginNormalPaletteFade(0, 0, 0, RGB_WHITE, 30, 1, HEAP_ID_FIELD1);
            (*state)++;
        }
        break;
    case CTT_STATE_WAIT_UNLOAD_RESOURCES:
        if (IsPaletteFadeFinished() && ov02_022526EC(data)) {
            CelebiCutscene_UnloadResources(data);
            ov01_021F46DC(&data->unk4);
            Heap_Free(data);
            return TRUE;
        }
    }
    if (data->unkF0) {
        CelebiCutsceneAnimations_FrameAdvanceAndCheck(&data->animations[0]);
    }
    if (data->unkF1) {
        Field3dObject_Draw(&data->object3d);
    }

    return FALSE;
}

static void CelebiCutscene_StartSwirlTask(CelebiTimeTravelCutsceneTaskData *data) {
    data->unk4 = ov01_021F467C(3, 13);
    SysTask_CreateOnMainQueue(Task_CelebiCutsceneSwirl, data, 0);
    data->unk2 = 0;
}

static BOOL ov02_022526EC(CelebiTimeTravelCutsceneTaskData *data) {
    return data->unk2 != 0;
}

static void Task_CelebiCutsceneSwirl(SysTask *task, void *_data) {
    CelebiTimeTravelCutsceneTaskData *data = _data;
    switch (data->unkEE) {
    case 0:
        UnkStruct_02253CE0 unk = { 0xFFFF0000, 0xB4, 0x500 };
        unk.unk8 = Camera_GetPerspectiveAngle(data->fieldSystem->camera);
        CelebiCutscene_InitSwirlData(data, &unk);
        data->unkEE++;
        break;
    case 1:
        if (CelebiCutscene_IsSwirlFinished(data)) {
            data->unk2 = 1;
            SysTask_Destroy(task);
        }
    }
}

static void CelebiCutscene_InitSwirlData(CelebiTimeTravelCutsceneTaskData *data, UnkStruct_02253CE0 *a1) {
    data->isSwirlFinished = FALSE;
    data->unkE6 = 0;
    data->unkE0 = a1->unk0;
    data->unkE4 = data->unk0;
    data->perspective = Camera_GetPerspectiveAngle(data->fieldSystem->camera);
    data->unkEC = a1->unk8;
    data->unkE8 = a1->unk4;
    SysTask_CreateOnMainQueue(Task_CelebiCutsceneSwirlEffect, data, 1);
}

static BOOL CelebiCutscene_SwirlEffect(CelebiTimeTravelCutsceneTaskData *data) {
    VecFx32 vec;
    MtxFx33 rotMatrix;
    const VecFx32 vec2 = { 0, 0x1000, 0 };
    Camera *camera = data->fieldSystem->camera;

    data->unkE6++;
    int e6 = data->unkE6;
    int e8 = data->unkE8;

    int angle = data->unkEC - data->perspective;
    angle *= e6;
    angle /= e8;
    angle += data->perspective;
    u16 index = ((data->unkE0 * e6) / e8) + data->unkE4;
    MTX_RotZ33(&rotMatrix, FX_SinIdx(index), FX_CosIdx(index));
    MTX_MultVec33(&vec2, &rotMatrix, &vec);
    Camera_SetLookAtCamUp(&vec, camera);
    Camera_SetPerspectiveAngle(angle, camera);
    return data->unkE6 >= data->unkE8;
}

static void Task_CelebiCutsceneSwirlEffect(SysTask *task, void *_data) {
    CelebiTimeTravelCutsceneTaskData *data = _data;
    if (CelebiCutscene_SwirlEffect(data)) {
        data->isSwirlFinished = TRUE;
        SysTask_Destroy(task);
    }
}

static BOOL CelebiCutscene_IsSwirlFinished(CelebiTimeTravelCutsceneTaskData *data) {
    return data->isSwirlFinished != FALSE;
}

static void CelebiCutscene_LoadResources(CelebiTimeTravelCutsceneTaskData *data) {
    const u32 files[3] = { NARC_legend_legend_00000076_NSBCA, NARC_legend_legend_00000078_NSBTP, NARC_legend_legend_00000077_NSBTA };
    HeapExp_FndInitAllocator(&data->alloc, HEAP_ID_FIELD1, 32);
    Field3dModel_LoadFromFilesystem(&data->model, NARC_demo_legend, NARC_legend_legend_00000075_NSBMD, HEAP_ID_FIELD1);
    for (u8 i = 0; i < NELEMS(data->animations); i++) {
        Field3dModelAnimation_LoadFromFilesystem(&data->animations[i], &data->model, NARC_demo_legend, files[i], HEAP_ID_FIELD1, &data->alloc);
    }
    Field3dObject_InitFromModel(&data->object3d, &data->model);
    for (u8 i = 0; i < NELEMS(data->animations); i++) {
        Field3dObject_AddAnimation(&data->object3d, &data->animations[i]);
    }
    Field3dObject_SetActiveFlag(&data->object3d, 1);
    CelebiCutsceneAnimations_FrameSet(&data->animations[0], 0);
    LocalMapObject *followMonObj = FollowMon_GetMapObject(data->fieldSystem);
    VecFx32 pos;
    MapObject_CopyPositionVector(followMonObj, &pos);
    Field3dObject_SetPosEx(&data->object3d, pos.x, pos.y, pos.z);
    data->unkF1 = 1;
}

static void CelebiCutscene_UnloadResources(CelebiTimeTravelCutsceneTaskData *data) {
    for (u8 i = 0; i < NELEMS(data->animations); i++) {
        Field3dModelAnimation_Unload(&data->animations[i], &data->alloc);
    }
    Field3dModel_Unload(&data->model);
}

static void CelebiCutsceneAnimations_FrameSet(Field3DModelAnimation *animations, u32 frame) {
    for (u8 i = 0; i < 3; i++) {
        Field3dModelAnimation_FrameSet(&animations[i], frame);
    }
}

static BOOL CelebiCutsceneAnimations_FrameAdvanceAndCheck(Field3DModelAnimation *animations) {
    u8 i;
    u8 cnt = 0;
    for (i = 0; i < 3; i++) {
        if (Field3dModelAnimation_FrameAdvanceAndCheck(&animations[i], 0x1000) != 0) {
            cnt++;
        }
    }

    return cnt == 3;
}
