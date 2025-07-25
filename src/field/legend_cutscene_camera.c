#include "field/legend_cutscene_camera.h"

#include "global.h"

#include "demo/legend.naix"
#include "field/overlay_01_021E66E4.h"
#include "field/overlay_01_021FB878.h"
#include "field/overlay_01_02204004.h"
#include "fielddata/script/scr_seq/event_D17R0110.h"
#include "fielddata/script/scr_seq/event_D40R0107.h"

#include "camera_translation.h"
#include "gf_gfx_loader.h"
#include "map_object.h"
#include "task.h"
#include "unk_02005D10.h"

typedef enum ClearBellAnimationState {
    CLEAR_BELL_ANIM_STATE_NUL,
    CLEAR_BELL_ANIM_STATE_RISE_BEGIN,
    CLEAR_BELL_ANIM_STATE_RISE_WAIT,
    CLEAR_BELL_ANIM_STATE_IDLE_LOOP,
    CLEAR_BELL_ANIM_STATE_SHIMMER_BEGIN,
    CLEAR_BELL_ANIM_STATE_SHIMMER_WAIT,
} ClearBellAnimationState;

typedef enum LugiaEyeGlimmerTaskState {
    LUGIA_EYE_GLIMMER_TASK_STATE_RUN,
    LUGIA_EYE_GLIMMER_TASK_STATE_FINISH,
} LugiaEyeGlimmerTaskState;

typedef enum UnusedHoOhAnimTaskState {
    UNUSED_HO_OH_ANIM_TASK_STATE_0,
    UNUSED_HO_OH_ANIM_TASK_STATE_1,
    UNUSED_HO_OH_ANIM_TASK_STATE_2,
} UnusedHoOhAnimTaskState;

typedef enum BirdFinalApproachTaskState {
    BIRD_FINAL_APPROACH_TASK_STATE_INIT,
    BIRD_FINAL_APPROACH_TASK_STATE_CORRECT_POS,
    BIRD_FINAL_APPROACH_TASK_STATE_FLAP_DOWN,
    BIRD_FINAL_APPROACH_TASK_STATE_DELAY__ALT_ANIM,
    BIRD_FINAL_APPROACH_TASK_STATE_DELAY__CRY,
    BIRD_FINAL_APPROACH_TASK_STATE_EXPANDING_CIRCLE_EFFECT,
    BIRD_FINAL_APPROACH_TASK_STATE_WAIT_AFTER_ANIM,
    BIRD_FINAL_APPROACH_TASK_STATE_FINISH,
} BirdFinalApproachTaskState;

typedef struct ClearBellCutsceneCamera {
    Field3dObjectTaskManager *field3dObjectTaskManager;
    Field3dObjectTask *draw3dTask;
    GFCameraTranslationWrapper *translation;
    VecFx32 lookAtTarget;
    VecFx32 lookAtPos;
    int gameVersion;
} ClearBellCutsceneCamera; // size: 0x28

typedef struct LugiaArrivesCutsceneCamera {
    fx32 distance;
    CameraAngle angle;
    VecFx32 targetDistanceVec;
    u16 perspectiveAngle;
    u16 gameVersion;
    fx32 clippingPlaneNear;
    fx32 clippingPlaneFar;
    GFCameraTranslationWrapper *translation;
} LugiaArrivesCutsceneCamera;

typedef struct ClearBellCutscene3dObjectTaskData_SoulSilver {
    Field3dModel model;
    Field3DModelAnimation anims[2];
    Field3dObject object;
} ClearBellCutscene3dObjectTaskData_SoulSilver;

typedef struct ClearBellCutscene3dObjectTaskData_HeartGold {
    NNSG2dScreenData *bg2ScrnData[6];
    NNSG2dScreenData *bg3ScrnData[6];
    void *bg2ScrnRaw[6];
    void *bg3ScrnRaw[6];
    u8 bg2X;
    u8 bg3X;
    u8 bgY;
    u8 switchTilemapDelayTimer;
    BgConfig *bgConfig;
    int tilemapIndex;
} ClearBellCutscene3dObjectTaskData_HeartGold;

typedef struct ClearBellCutscene3dObjectTaskData {
    NNSFndAllocator allocator;
    u8 state;
    u8 shimmerClearBellOnly;
    u16 gameVersion;
    Field3dModel clearBellRisingModel;
    Field3dModel clearBellShimmerModel;
    Field3dModel cornerBellModel;
    Field3DModelAnimation clearbellRisingAnims[3];
    Field3DModelAnimation clearBellShimmerAnims[2];
    Field3DModelAnimation cornerBellAnims[1];
    Field3dObject clearBellRisingObject;
    Field3dObject clearBellObject;
    Field3dObject cornerBellObjects[4];
    ClearBellCutscene3dObjectTaskData_SoulSilver wavesEffect;
    ClearBellCutscene3dObjectTaskData_HeartGold leavesEffect;
    SysTask *task;
    u32 birdModelNum;
    const CameraParam *cameraParam;
    const VecFx32 *cameraOffset;
} ClearBellCutscene3dObjectTaskData; // size: 0x4B8

typedef struct LegendCutsceneLugiaEyeGlimmerTaskData {
    NNSFndAllocator allocator;
    Field3dModel model;
    Field3DModelAnimation anims[3];
    Field3dObject object;
    int eyeGlimmerDelayTimer;
} LegendCutsceneLugiaEyeGlimmerTaskData;

typedef struct BirdFinalApproachTaskData {
    fx32 yDelta;
    fx32 yEnd;
    u16 delayTimer;
    u16 animTimer;
    NNSFndAllocator allocator;
    Field3dModel model;
    Field3DModelAnimation anims[3];
    Field3dObject object;
    u16 gameVersion;
    u16 betweenFlapsDelayTimer;
} BirdFinalApproachTaskData;

static void startBellShimmer(FieldSystem *fieldSystem);
static BOOL Task_WaitShimmerEffectAndRestart(TaskManager *taskman);
static void ClearBellCutscene_CreateField3dObjectTask(ClearBellCutsceneCamera *cam);
static void Field3dObjectTaskInit_ClearBellCutscene(Field3dObjectTask *task, FieldSystem *fieldSystem, void *taskData);
static void Field3dObjectTaskDestroy_ClearBellCutscene(Field3dObjectTask *task, FieldSystem *fieldSystem, void *taskData);
static void Field3dObjectTaskUpdate_ClearBellCutscene(Field3dObjectTask *task, FieldSystem *fieldSystem, void *taskData);
static void Field3dObjectTaskRender_ClearBellCutscene(Field3dObjectTask *task, FieldSystem *fieldSystem, void *taskData);
static void bellShimmerReplaceGraphics(ClearBellCutscene3dObjectTaskData *taskData);
static void modelAnimListSetFrameIndex(Field3DModelAnimation *animation, u32 num, fx32 frame);
static BOOL modelAnimListAdvanceNoLoop(Field3DModelAnimation *animation, u32 num);
static void modelAnimListAdvanceLooping(Field3DModelAnimation *animation, u32 num);
static void setBellsModelsActiveFlag(ClearBellCutscene3dObjectTaskData *taskData, int active);
static void loadEyeGlimmer3dModel(enum HeapID heapID, FieldSystem *fieldSystem, LegendCutsceneLugiaEyeGlimmerTaskData *taskData);
static void unloadEyeGlimmer3dModel(LegendCutsceneLugiaEyeGlimmerTaskData *taskData);
static BOOL Task_LugiaEyeGlimmer(TaskManager *taskman);
static BOOL ov02_02251320(TaskManager *taskman);
static BOOL Task_WaitCameraPan(TaskManager *taskman);
static BOOL Task_BirdFinalApproach(TaskManager *taskman);
static void beginWavesEffect(FieldSystem *fieldSystem);
static void beginLeavesEffect(FieldSystem *fieldSystem);
static void Task_WavesEffect(SysTask *task, void *taskData);
static void Task_LeavesEffect(SysTask *task, void *taskData);
static void endWavesEffect(ClearBellCutscene3dObjectTaskData *taskData);
static void endLeavesEffect(ClearBellCutscene3dObjectTaskData *taskData);
static BOOL Task_LugiaArrivesEffectCameraPan(TaskManager *taskman);

static const Field3dObjectTaskTemplate sField3dObjectTaskTemplate_ClearBellCutscene = {
    .taskPriority = 3,
    .dataSize = sizeof(ClearBellCutscene3dObjectTaskData),
    .initFunc = Field3dObjectTaskInit_ClearBellCutscene,
    .destroyFunc = Field3dObjectTaskDestroy_ClearBellCutscene,
    .updateFunc = Field3dObjectTaskUpdate_ClearBellCutscene,
    .renderFunc = Field3dObjectTaskRender_ClearBellCutscene,
};

static const CameraParam sCameraParam_HeartGold[] = {
    {
     .distance = FX32_CONST(666.922119148625),
     .angle = { .x = 0xF562 },
     .perspectiveType = 0,
     .perspective = 0x5C1,
     },
    {
     .distance = FX32_CONST(666.922119148625),
     .angle = { .x = 0xF562 },
     .perspectiveType = 0,
     .perspective = 0x5C1,
     },
    {
     .distance = FX32_CONST(666.922119148625),
     .angle = { .x = 0xF762 },
     .perspectiveType = 0,
     .perspective = 0xCC1,
     },
    {
     .distance = FX32_CONST(666.922119148625),
     .angle = { .x = 0xFBA2 },
     .perspectiveType = 0,
     .perspective = 0xCC1,
     },
};

static const CameraParam sCameraParam_SoulSilver[] = {
    {
     .distance = FX32_CONST(666.922119148625),
     .angle = { .x = 0xDFE2 },
     .perspectiveType = 0,
     .perspective = 0x5C1,
     },
    {
     .distance = FX32_CONST(666.922119148625),
     .angle = { .x = 0xDFE2 },
     .perspectiveType = 0,
     .perspective = 0x5C1,
     },
    {
     .distance = FX32_CONST(666.922119148625),
     .angle = { .x = 0xDEF2 },
     .perspectiveType = 0,
     .perspective = 0x5C1,
     },
    {
     .distance = FX32_CONST(666.922119148625),
     .angle = { .x = 0xDEF2 },
     .perspectiveType = 0,
     .perspective = 0x5C1,
     },
    {
     .distance = FX32_CONST(666.922119148625),
     .angle = { .x = 0xDEF2 },
     .perspectiveType = 0,
     .perspective = 0x5C1,
     },
};

static const VecFx32 sCameraOffset_HeartGold[] = {
    { -FX32_CONST(195), -FX32_CONST(148.605),         -FX32_CONST(45.19165) },
    { FX32_CONST(198),  -FX32_CONST(148.605),         -FX32_CONST(45.19165) },
    { 0,                -FX32_CONST(35.751708984375), -FX32_CONST(23.0476)  },
    { 0,                FX32_CONST(495.6323),         FX32_CONST(28.73)     },
};

static const VecFx32 sCameraOffset_SoulSilver[] = {
    { -FX32_CONST(127), 0, -FX32_CONST(208) },
    { FX32_CONST(63),   0, -FX32_CONST(208) },
    { 0,                0, -FX32_CONST(82)  },
    { 0,                0, -FX32_CONST(433) },
    { 0,                0, -FX32_CONST(225) },
};

static const u8 sBg3TilemapFileIDs[] = {
    47,
    48,
    49,
    50,
    51,
    52,
};

static const u8 sBg2TilemapFileIDs[] = {
    41,
    42,
    43,
    44,
    45,
    46,
};

void LegendCutscene_BeginClearBellAnim(FieldSystem *fieldSystem) {
    ClearBellCutsceneCamera *cam;

    fieldSystem->unk4->legendCutsceneCamera = Heap_AllocAtEnd(HEAP_ID_FIELD1, sizeof(ClearBellCutsceneCamera));
    cam = fieldSystem->unk4->legendCutsceneCamera;

    cam->translation = CreateCameraTranslationWrapper(HEAP_ID_FIELD1, fieldSystem->camera);
    cam->gameVersion = gGameVersion;
    cam->lookAtTarget = Camera_GetLookAtCamTarget(fieldSystem->camera);
    cam->lookAtPos = Camera_GetLookAtCamPos(fieldSystem->camera);
    cam->field3dObjectTaskManager = fieldSystem->unk4->field3dObjectTaskManager;
    ClearBellCutscene_CreateField3dObjectTask(cam);
}

void LegendCutscene_EndClearBellAnim(FieldSystem *fieldSystem) {
    ClearBellCutsceneCamera *cam = fieldSystem->unk4->legendCutsceneCamera;
    DeleteCameraTranslationWrapper(cam->translation);
    Heap_Free(fieldSystem->unk4->legendCutsceneCamera);
    fieldSystem->unk4->legendCutsceneCamera = NULL;
}

void LegendCutscene_ClearBellRiseFromBag(FieldSystem *fieldSystem) {
    ClearBellCutsceneCamera *cam = fieldSystem->unk4->legendCutsceneCamera;
    ClearBellCutscene3dObjectTaskData *draw3dTaskData = (ClearBellCutscene3dObjectTaskData *)Field3dObjectTask_GetData(cam->draw3dTask);
    draw3dTaskData->state = CLEAR_BELL_ANIM_STATE_RISE_BEGIN;
}

void LegendCutscene_ClearBellShimmer(FieldSystem *fieldSystem, u8 shimmerClearBellOnly) {
    ClearBellCutsceneCamera *cam = fieldSystem->unk4->legendCutsceneCamera;
    ClearBellCutscene3dObjectTaskData *draw3dTaskData = (ClearBellCutscene3dObjectTaskData *)Field3dObjectTask_GetData(cam->draw3dTask);
    if (draw3dTaskData->state != CLEAR_BELL_ANIM_STATE_IDLE_LOOP) {
        GF_ASSERT(FALSE);
        TaskManager_Call(fieldSystem->taskman, Task_WaitShimmerEffectAndRestart, NULL);
        return;
    }
    draw3dTaskData->shimmerClearBellOnly = shimmerClearBellOnly;
    startBellShimmer(fieldSystem);
}

// Part of an unreferenced code path
void ov02_02250B30(FieldSystem *fieldSystem) {
    TaskManager_Call(fieldSystem->taskman, ov02_02251320, NULL);
}

static void startBellShimmer(FieldSystem *fieldSystem) {
    ClearBellCutsceneCamera *cam = fieldSystem->unk4->legendCutsceneCamera;
    ClearBellCutscene3dObjectTaskData *taskData = (ClearBellCutscene3dObjectTaskData *)Field3dObjectTask_GetData(cam->draw3dTask);
    taskData->state = CLEAR_BELL_ANIM_STATE_SHIMMER_BEGIN;
}

static BOOL Task_WaitShimmerEffectAndRestart(TaskManager *taskman) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskman);
    ClearBellCutsceneCamera *cam = fieldSystem->unk4->legendCutsceneCamera;
    ClearBellCutscene3dObjectTaskData *taskData = (ClearBellCutscene3dObjectTaskData *)Field3dObjectTask_GetData(cam->draw3dTask);
    if (taskData->state == CLEAR_BELL_ANIM_STATE_IDLE_LOOP) {
        startBellShimmer(fieldSystem);
        return TRUE;
    }

    return FALSE;
}

void LegendCutscene_LugiaEyeGlimmerEffect(FieldSystem *fieldSystem) {
    LegendCutsceneLugiaEyeGlimmerTaskData *eyeGlimmer = Heap_AllocAtEnd(HEAP_ID_FIELD1, sizeof(LegendCutsceneLugiaEyeGlimmerTaskData));
    eyeGlimmer->eyeGlimmerDelayTimer = 0;
    loadEyeGlimmer3dModel(HEAP_ID_FIELD1, fieldSystem, eyeGlimmer);
    TaskManager_Call(fieldSystem->taskman, Task_LugiaEyeGlimmer, eyeGlimmer);
}

static void ClearBellCutscene_CreateField3dObjectTask(ClearBellCutsceneCamera *cam) {
    cam->draw3dTask = Field3dObjectTaskManager_CreateTask(cam->field3dObjectTaskManager, &sField3dObjectTaskTemplate_ClearBellCutscene);
}

static void Field3dObjectTaskInit_ClearBellCutscene(Field3dObjectTask *task, FieldSystem *fieldSystem, void *taskData) {
    ClearBellCutscene3dObjectTaskData *kimonoDanceObjData = (ClearBellCutscene3dObjectTaskData *)taskData;
    ClearBellCutsceneCamera *cam = fieldSystem->unk4->legendCutsceneCamera;
    kimonoDanceObjData->gameVersion = cam->gameVersion;
    HeapExp_FndInitAllocator(&kimonoDanceObjData->allocator, HEAP_ID_FIELD1, 0x20);
    Field3dModel_LoadFromFilesystem(&kimonoDanceObjData->clearBellRisingModel, NARC_demo_legend, NARC_legend_legend_00000018_NSBMD, HEAP_ID_FIELD1);
    Field3dModel_LoadFromFilesystem(&kimonoDanceObjData->clearBellShimmerModel, NARC_demo_legend, NARC_legend_legend_00000025_NSBMD, HEAP_ID_FIELD1);
    Field3dModel_LoadFromFilesystem(&kimonoDanceObjData->cornerBellModel, NARC_demo_legend, NARC_legend_legend_00000032_NSBMD, HEAP_ID_FIELD1);
    Field3dModelAnimation_LoadFromFilesystem(&kimonoDanceObjData->clearbellRisingAnims[0], &kimonoDanceObjData->clearBellRisingModel, NARC_demo_legend, NARC_legend_legend_00000019_NSBCA, HEAP_ID_FIELD1, &kimonoDanceObjData->allocator);
    Field3dModelAnimation_LoadFromFilesystem(&kimonoDanceObjData->clearbellRisingAnims[1], &kimonoDanceObjData->clearBellRisingModel, NARC_demo_legend, NARC_legend_legend_00000020_NSBTP, HEAP_ID_FIELD1, &kimonoDanceObjData->allocator);
    Field3dModelAnimation_LoadFromFilesystem(&kimonoDanceObjData->clearbellRisingAnims[2], &kimonoDanceObjData->clearBellRisingModel, NARC_demo_legend, NARC_legend_legend_00000021_NSBTA, HEAP_ID_FIELD1, &kimonoDanceObjData->allocator);
    Field3dModelAnimation_LoadFromFilesystem(&kimonoDanceObjData->clearBellShimmerAnims[0], &kimonoDanceObjData->clearBellShimmerModel, NARC_demo_legend, NARC_legend_legend_00000026_NSBCA, HEAP_ID_FIELD1, &kimonoDanceObjData->allocator);
    Field3dModelAnimation_LoadFromFilesystem(&kimonoDanceObjData->clearBellShimmerAnims[1], &kimonoDanceObjData->clearBellShimmerModel, NARC_demo_legend, NARC_legend_legend_00000027_NSBTA, HEAP_ID_FIELD1, &kimonoDanceObjData->allocator);
    Field3dModelAnimation_LoadFromFilesystem(&kimonoDanceObjData->cornerBellAnims[0], &kimonoDanceObjData->cornerBellModel, NARC_demo_legend, NARC_legend_legend_00000033_NSBTA, HEAP_ID_FIELD1, &kimonoDanceObjData->allocator);
    Field3dObject_InitFromModel(&kimonoDanceObjData->clearBellRisingObject, &kimonoDanceObjData->clearBellRisingModel);
    Field3dObject_InitFromModel(&kimonoDanceObjData->clearBellObject, &kimonoDanceObjData->clearBellShimmerModel);
    Field3dObject_AddAnimation(&kimonoDanceObjData->clearBellRisingObject, &kimonoDanceObjData->clearbellRisingAnims[0]);
    Field3dObject_AddAnimation(&kimonoDanceObjData->clearBellRisingObject, &kimonoDanceObjData->clearbellRisingAnims[1]);
    Field3dObject_AddAnimation(&kimonoDanceObjData->clearBellRisingObject, &kimonoDanceObjData->clearbellRisingAnims[2]);
    Field3dObject_AddAnimation(&kimonoDanceObjData->clearBellObject, &kimonoDanceObjData->clearBellShimmerAnims[0]);
    Field3dObject_AddAnimation(&kimonoDanceObjData->clearBellObject, &kimonoDanceObjData->clearBellShimmerAnims[1]);
    Field3dObject_SetActiveFlag(&kimonoDanceObjData->clearBellRisingObject, FALSE);
    Field3dObject_SetActiveFlag(&kimonoDanceObjData->clearBellObject, FALSE);
    for (u8 i = 0; i < 4; ++i) {
        Field3dObject_InitFromModel(&kimonoDanceObjData->cornerBellObjects[i], &kimonoDanceObjData->cornerBellModel);
        Field3dObject_AddAnimation(&kimonoDanceObjData->cornerBellObjects[i], &kimonoDanceObjData->cornerBellAnims[0]);
        Field3dObject_SetActiveFlag(&kimonoDanceObjData->cornerBellObjects[i], FALSE);
    }
    modelAnimListSetFrameIndex(kimonoDanceObjData->clearbellRisingAnims, 3, 0);
    modelAnimListSetFrameIndex(kimonoDanceObjData->clearBellShimmerAnims, 2, 0);
    modelAnimListSetFrameIndex(kimonoDanceObjData->cornerBellAnims, 1, 0);

    VecFx32 pos;
    MapObject_CopyPositionVector(PlayerAvatar_GetMapObject(fieldSystem->playerAvatar), &pos);
    Field3dObject_SetPosEx(&kimonoDanceObjData->clearBellRisingObject, pos.x, pos.y, pos.z);
    Field3dObject_SetPosEx(&kimonoDanceObjData->clearBellObject, pos.x, pos.y, pos.z);
    if (kimonoDanceObjData->gameVersion == VERSION_SOULSILVER) {
        Field3dObject_SetPosEx(&kimonoDanceObjData->cornerBellObjects[0], pos.x + FX32_CONST(128), pos.y + FX32_CONST(32), pos.z - FX32_CONST(180));
        Field3dObject_SetPosEx(&kimonoDanceObjData->cornerBellObjects[1], pos.x - FX32_CONST(128), pos.y + FX32_CONST(32), pos.z - FX32_CONST(180));
        Field3dObject_SetPosEx(&kimonoDanceObjData->cornerBellObjects[2], 0, 0, 0);
        Field3dObject_SetPosEx(&kimonoDanceObjData->cornerBellObjects[3], 0, 0, 0);
        kimonoDanceObjData->birdModelNum = 0x131;
        kimonoDanceObjData->cameraParam = sCameraParam_SoulSilver;
        kimonoDanceObjData->cameraOffset = sCameraOffset_SoulSilver;
    } else {
        Field3dObject_SetPosEx(&kimonoDanceObjData->cornerBellObjects[0], pos.x + FX32_CONST(200), pos.y - FX32_CONST(73), pos.z + FX32_CONST(144));
        Field3dObject_SetPosEx(&kimonoDanceObjData->cornerBellObjects[1], pos.x - FX32_CONST(198), pos.y - FX32_CONST(73), pos.z + FX32_CONST(144));
        Field3dObject_SetPosEx(&kimonoDanceObjData->cornerBellObjects[2], pos.x + FX32_CONST(200), pos.y - FX32_CONST(73), pos.z - FX32_CONST(270));
        Field3dObject_SetPosEx(&kimonoDanceObjData->cornerBellObjects[3], pos.x - FX32_CONST(198), pos.y - FX32_CONST(73), pos.z - FX32_CONST(270));
        kimonoDanceObjData->birdModelNum = 0x130;
        kimonoDanceObjData->cameraParam = sCameraParam_HeartGold;
        kimonoDanceObjData->cameraOffset = sCameraOffset_HeartGold;
    }
    kimonoDanceObjData->state = CLEAR_BELL_ANIM_STATE_NUL;
}

static void Field3dObjectTaskDestroy_ClearBellCutscene(Field3dObjectTask *task, FieldSystem *fieldSystem, void *taskData) {
    ClearBellCutscene3dObjectTaskData *cutsceneData = (ClearBellCutscene3dObjectTaskData *)taskData;
    Field3dModelAnimation_Unload(&cutsceneData->clearbellRisingAnims[2], &cutsceneData->allocator);
    Field3dModelAnimation_Unload(&cutsceneData->clearbellRisingAnims[1], &cutsceneData->allocator);
    Field3dModelAnimation_Unload(&cutsceneData->clearbellRisingAnims[0], &cutsceneData->allocator);
    Field3dModelAnimation_Unload(&cutsceneData->clearBellShimmerAnims[1], &cutsceneData->allocator);
    Field3dModelAnimation_Unload(&cutsceneData->clearBellShimmerAnims[0], &cutsceneData->allocator);
    Field3dModelAnimation_Unload(&cutsceneData->cornerBellAnims[0], &cutsceneData->allocator);
    Field3dModel_Unload(&cutsceneData->clearBellRisingModel);
    Field3dModel_Unload(&cutsceneData->clearBellShimmerModel);
    Field3dModel_Unload(&cutsceneData->cornerBellModel);
}

static void Field3dObjectTaskUpdate_ClearBellCutscene(Field3dObjectTask *task, struct FieldSystem *fieldSystem, void *taskData) {
    ClearBellCutscene3dObjectTaskData *cutsceneData = (ClearBellCutscene3dObjectTaskData *)taskData;

    switch (cutsceneData->state) {
    case CLEAR_BELL_ANIM_STATE_NUL:
        break;
    case CLEAR_BELL_ANIM_STATE_RISE_BEGIN:
        Field3dObject_SetActiveFlag(&cutsceneData->clearBellRisingObject, TRUE);
        cutsceneData->state = CLEAR_BELL_ANIM_STATE_RISE_WAIT;
        break;
    case CLEAR_BELL_ANIM_STATE_RISE_WAIT:
        if (modelAnimListAdvanceNoLoop(cutsceneData->clearbellRisingAnims, 3)) {
            bellShimmerReplaceGraphics(cutsceneData);
            cutsceneData->state = CLEAR_BELL_ANIM_STATE_IDLE_LOOP;
        }
        break;
    case CLEAR_BELL_ANIM_STATE_IDLE_LOOP:
        modelAnimListAdvanceLooping(cutsceneData->clearbellRisingAnims, 3);
        break;
    case CLEAR_BELL_ANIM_STATE_SHIMMER_BEGIN:
        Field3dObject_SetActiveFlag(&cutsceneData->clearBellRisingObject, FALSE);
        setBellsModelsActiveFlag(cutsceneData, TRUE);
        modelAnimListSetFrameIndex(cutsceneData->clearBellShimmerAnims, 2, 0);
        modelAnimListSetFrameIndex(cutsceneData->cornerBellAnims, 1, 0);
        cutsceneData->state = CLEAR_BELL_ANIM_STATE_SHIMMER_WAIT;
        break;
    case CLEAR_BELL_ANIM_STATE_SHIMMER_WAIT:
        modelAnimListAdvanceLooping(cutsceneData->clearbellRisingAnims, 3);
        modelAnimListAdvanceNoLoop(cutsceneData->cornerBellAnims, 1);
        if (modelAnimListAdvanceNoLoop(cutsceneData->clearBellShimmerAnims, 2)) {
            setBellsModelsActiveFlag(cutsceneData, FALSE);
            Field3dObject_SetActiveFlag(&cutsceneData->clearBellRisingObject, TRUE);
            cutsceneData->state = CLEAR_BELL_ANIM_STATE_IDLE_LOOP;
        }
        break;
    }
}

static void Field3dObjectTaskRender_ClearBellCutscene(Field3dObjectTask *task, struct FieldSystem *fieldSystem, void *taskData) {
    ClearBellCutscene3dObjectTaskData *clearBell = (ClearBellCutscene3dObjectTaskData *)taskData;

    Field3dObject_Draw(&clearBell->clearBellRisingObject);
    Field3dObject_Draw(&clearBell->clearBellObject);
    for (u8 i = 0; i < 4; ++i) {
        Field3dObject_Draw(&clearBell->cornerBellObjects[i]);
    }
}

static void bellShimmerReplaceGraphics(ClearBellCutscene3dObjectTaskData *taskData) {
    Field3dObject_RemoveAnimation(&taskData->clearBellRisingObject, &taskData->clearbellRisingAnims[0]);
    Field3dObject_RemoveAnimation(&taskData->clearBellRisingObject, &taskData->clearbellRisingAnims[1]);
    Field3dObject_RemoveAnimation(&taskData->clearBellRisingObject, &taskData->clearbellRisingAnims[2]);
    Field3dModelAnimation_Unload(&taskData->clearbellRisingAnims[2], &taskData->allocator);
    Field3dModelAnimation_Unload(&taskData->clearbellRisingAnims[1], &taskData->allocator);
    Field3dModelAnimation_Unload(&taskData->clearbellRisingAnims[0], &taskData->allocator);
    Field3dModelAnimation_LoadFromFilesystem(&taskData->clearbellRisingAnims[0], &taskData->clearBellRisingModel, NARC_demo_legend, NARC_legend_legend_00000022_NSBCA, HEAP_ID_FIELD1, &taskData->allocator);
    Field3dModelAnimation_LoadFromFilesystem(&taskData->clearbellRisingAnims[1], &taskData->clearBellRisingModel, NARC_demo_legend, NARC_legend_legend_00000023_NSBTP, HEAP_ID_FIELD1, &taskData->allocator);
    Field3dModelAnimation_LoadFromFilesystem(&taskData->clearbellRisingAnims[2], &taskData->clearBellRisingModel, NARC_demo_legend, NARC_legend_legend_00000024_NSBTA, HEAP_ID_FIELD1, &taskData->allocator);
    Field3dObject_AddAnimation(&taskData->clearBellRisingObject, &taskData->clearbellRisingAnims[0]);
    Field3dObject_AddAnimation(&taskData->clearBellRisingObject, &taskData->clearbellRisingAnims[1]);
    Field3dObject_AddAnimation(&taskData->clearBellRisingObject, &taskData->clearbellRisingAnims[2]);
    modelAnimListSetFrameIndex(taskData->clearbellRisingAnims, 3, 0);
}

static void modelAnimListSetFrameIndex(Field3DModelAnimation *animation, u32 num, fx32 frame) {
    for (u8 i = 0; i < num; ++i) {
        Field3dModelAnimation_FrameSet(&animation[i], frame);
    }
}

static BOOL modelAnimListAdvanceNoLoop(Field3DModelAnimation *animation, u32 num) {
    u8 i, n = 0;
    for (i = 0; i < num; ++i) {
        if (Field3dModelAnimation_FrameAdvanceAndCheck(&animation[i], FX32_ONE)) {
            ++n;
        }
    }
    return n == num;
}

static void modelAnimListAdvanceLooping(Field3DModelAnimation *animation, u32 num) {
    for (u8 i = 0; i < num; ++i) {
        Field3dModelAnimation_FrameAdvanceAndLoop(&animation[i], FX32_ONE);
    }
}

static void setBellsModelsActiveFlag(ClearBellCutscene3dObjectTaskData *taskData, BOOL active) {
    u32 numCornerBells = taskData->gameVersion == VERSION_SOULSILVER ? 2 : 4;
    Field3dObject_SetActiveFlag(&taskData->clearBellObject, active);
    if (!taskData->shimmerClearBellOnly) {
        for (u8 i = 0; i < numCornerBells; ++i) {
            Field3dObject_SetActiveFlag(&taskData->cornerBellObjects[i], active);
        }
    }
}

static void loadEyeGlimmer3dModel(enum HeapID heapID, FieldSystem *fieldSystem, LegendCutsceneLugiaEyeGlimmerTaskData *taskData) {
    HeapExp_FndInitAllocator(&taskData->allocator, heapID, 0x20);
    Field3dModel_LoadFromFilesystem(&taskData->model, NARC_demo_legend, NARC_legend_legend_00000028_NSBMD, heapID);
    Field3dModelAnimation_LoadFromFilesystem(&taskData->anims[0], &taskData->model, NARC_demo_legend, NARC_legend_legend_00000029_NSBMA, heapID, &taskData->allocator);
    Field3dModelAnimation_LoadFromFilesystem(&taskData->anims[1], &taskData->model, NARC_demo_legend, NARC_legend_legend_00000030_NSBTP, heapID, &taskData->allocator);
    Field3dModelAnimation_LoadFromFilesystem(&taskData->anims[2], &taskData->model, NARC_demo_legend, NARC_legend_legend_00000031_NSBCA, heapID, &taskData->allocator);
    Field3dObject_InitFromModel(&taskData->object, &taskData->model);
    Field3dObject_AddAnimation(&taskData->object, &taskData->anims[0]);
    Field3dObject_AddAnimation(&taskData->object, &taskData->anims[1]);
    Field3dObject_AddAnimation(&taskData->object, &taskData->anims[2]);
    modelAnimListSetFrameIndex(taskData->anims, 3, 0);

    VecFx32 pos;
    MapObject_CopyPositionVector(PlayerAvatar_GetMapObject(fieldSystem->playerAvatar), &pos);
    pos.y += FX32_CONST(100);
    pos.z -= FX32_CONST(350);
    Field3dObject_SetPosEx(&taskData->object, pos.x, pos.y, pos.z);
    Field3dObject_SetActiveFlag(&taskData->object, TRUE);
}

static void unloadEyeGlimmer3dModel(LegendCutsceneLugiaEyeGlimmerTaskData *taskData) {
    Field3dModelAnimation_Unload(&taskData->anims[2], &taskData->allocator);
    Field3dModelAnimation_Unload(&taskData->anims[1], &taskData->allocator);
    Field3dModelAnimation_Unload(&taskData->anims[0], &taskData->allocator);
    Field3dModel_Unload(&taskData->model);
}

static BOOL Task_LugiaEyeGlimmer(TaskManager *taskman) {
    LegendCutsceneLugiaEyeGlimmerTaskData *unk = (LegendCutsceneLugiaEyeGlimmerTaskData *)TaskManager_GetEnvironment(taskman);
    u32 *pState = TaskManager_GetStatePtr(taskman);

    switch (*pState) {
    case LUGIA_EYE_GLIMMER_TASK_STATE_RUN:
        ++unk->eyeGlimmerDelayTimer;
        if (unk->eyeGlimmerDelayTimer == 2) {
            PlaySE(SEQ_SE_GS_RUGIA_MENOHIKARI);
        }
        if (modelAnimListAdvanceNoLoop(unk->anims, 3)) {
            ++(*pState);
        }
        Field3dObject_Draw(&unk->object);
        break;
    case LUGIA_EYE_GLIMMER_TASK_STATE_FINISH:
        unloadEyeGlimmer3dModel(unk);
        Heap_Free(unk);
        return TRUE;
    }

    return FALSE;
}

// TODO: Document based on overlay_01_02204004.s, overlay_01_021E8744.s
// Part of an unreferenced code path
static BOOL ov02_02251320(TaskManager *taskman) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskman);
    u32 *pState = TaskManager_GetStatePtr(taskman);
    UnkStruct_FieldSysC0_SubC *renderObj;
    u8 i;
    ClearBellCutsceneCamera *cam = fieldSystem->unk4->legendCutsceneCamera;
    ClearBellCutscene3dObjectTaskData *taskData = Field3dObjectTask_GetData(cam->draw3dTask);

    switch (*pState) {
    case UNUSED_HO_OH_ANIM_TASK_STATE_0:
        renderObj = Field3dObjectList_GetRenderObjectByID(fieldSystem->unkC0, taskData->birdModelNum);
        for (i = 0; i < 2; ++i) {
            ov01_021E8970(taskData->birdModelNum, i, 1, renderObj, fieldSystem->unk54);
        }
        for (i = 0; i < 2; ++i) {
            UnkStruct_ov01_021E8B04 *anim = ov01_021E8B04(taskData->birdModelNum, i, fieldSystem->unk54);
            ov01_021E8B84(anim, 1);
            ov01_021E8B6C(anim);
        }
        *pState = UNUSED_HO_OH_ANIM_TASK_STATE_1;
        break;
    case UNUSED_HO_OH_ANIM_TASK_STATE_1:
        renderObj = Field3dObjectList_GetRenderObjectByID(fieldSystem->unkC0, taskData->birdModelNum);
        if (ov01_021E8B90(ov01_021E8B04(taskData->birdModelNum, 0, fieldSystem->unk54))) {
            for (i = 0; i < 2; ++i) {
                ov01_021E8A8C(fieldSystem->unk54, renderObj, taskData->birdModelNum, i);
            }
            for (i = 0; i < 2; ++i) {
                ov01_021E8970(taskData->birdModelNum, i + 2, 1, renderObj, fieldSystem->unk54);
            }
            *pState = UNUSED_HO_OH_ANIM_TASK_STATE_2;
        }
        break;
    case UNUSED_HO_OH_ANIM_TASK_STATE_2:
        return TRUE;
    }

    return FALSE;
}

void LegendCutscene_MoveCamera(FieldSystem *fieldSystem, u8 scene) {
    ClearBellCutsceneCamera *cam = fieldSystem->unk4->legendCutsceneCamera;
    ClearBellCutscene3dObjectTaskData *taskData = (ClearBellCutscene3dObjectTaskData *)Field3dObjectTask_GetData(cam->draw3dTask);

    GF_ASSERT(scene < 3);

    Camera_SetLookAtCamTarget(&cam->lookAtTarget, fieldSystem->camera);
    Camera_SetLookAtCamPos(&cam->lookAtPos, fieldSystem->camera);
    Camera_SetDistance(taskData->cameraParam[scene].distance, fieldSystem->camera);
    Camera_SetAnglePos(&taskData->cameraParam[scene].angle, fieldSystem->camera);
    Camera_SetPerspectiveAngle(taskData->cameraParam[scene].perspective, fieldSystem->camera);
    Camera_OffsetLookAtPosAndTarget(&taskData->cameraOffset[scene], fieldSystem->camera);
    Camera_SetPerspectiveClippingPlane(FX32_CONST(150), FX32_CONST(1700), fieldSystem->camera);

    Camera_GetLookAtCamTarget(fieldSystem->camera);
    Camera_GetCurrentTarget(fieldSystem->camera);
    Camera_GetAngle(fieldSystem->camera);
}

void LegendCutscene_StartPanCameraTo(FieldSystem *fieldSystem, u8 destination) {
    int duration;
    ClearBellCutsceneCamera *cam = fieldSystem->unk4->legendCutsceneCamera;
    ClearBellCutscene3dObjectTaskData *taskData = (ClearBellCutscene3dObjectTaskData *)Field3dObjectTask_GetData(cam->draw3dTask);

    CameraTranslationPathTemplate template;
    int point = destination == 0 ? 0 : 3;

    template.angleX = taskData->cameraParam[point].angle.x;
    template.perspectiveAngle = taskData->cameraParam[point].perspective;
    template.position = taskData->cameraOffset[point];
    template.distance = taskData->cameraParam[point].distance;
    if (cam->gameVersion == VERSION_HEARTGOLD) {
        if (destination == 0) {
            duration = 200;
        } else {
            duration = 20;
        }
    } else {
        if (destination == 0) {
            duration = 160;
        } else {
            duration = 200;
        }
    }
    SetCameraTranslationPath(cam->translation, &template, duration);
}

void LegendCutscene_WaitCameraPan(FieldSystem *fieldSystem) {
    TaskManager_Call(fieldSystem->taskman, Task_WaitCameraPan, NULL);
}

static BOOL Task_WaitCameraPan(TaskManager *taskman) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskman);
    ClearBellCutsceneCamera *cam = fieldSystem->unk4->legendCutsceneCamera;
    if (IsCameraTranslationFinished(cam->translation)) {
        Camera_GetLookAtCamTarget(fieldSystem->camera);
        Camera_GetCurrentTarget(fieldSystem->camera);
        Camera_GetAngle(fieldSystem->camera);
        return TRUE;
    }

    return FALSE;
}

void LegendCutscene_BirdFinalApproach(FieldSystem *fieldSystem) {
    BirdFinalApproachTaskData *taskData = Heap_AllocAtEnd(HEAP_ID_FIELD1, sizeof(BirdFinalApproachTaskData));
    taskData->gameVersion = gGameVersion;
    TaskManager_Call(fieldSystem->taskman, Task_BirdFinalApproach, taskData);
}

static BOOL Task_BirdFinalApproach(TaskManager *taskman) {
    int species;
    int firstFlapDelay;
    int flapSfx;
    int mapObjectId;
    LocalMapObject *mapObject;
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskman);
    BirdFinalApproachTaskData *taskData = (BirdFinalApproachTaskData *)TaskManager_GetEnvironment(taskman);
    u32 *pState = TaskManager_GetStatePtr(taskman);

    if (taskData->gameVersion == VERSION_SOULSILVER) {
        species = SPECIES_LUGIA;
        mapObjectId = obj_D40R0107_lug_obj01;
        firstFlapDelay = 18;
        flapSfx = SEQ_SE_GS_RUGIA_HABATAKI;
    } else {
        species = SPECIES_HO_OH;
        mapObjectId = obj_D17R0110_hou_obj01;
        firstFlapDelay = 0;
        flapSfx = SEQ_SE_GS_HOUOU_HABATAKI;
    }

    mapObject = MapObjectManager_GetFirstActiveObjectByID(fieldSystem->mapObjectManager, mapObjectId);
    GF_ASSERT(mapObject != NULL);

    switch (*pState) {
    case BIRD_FINAL_APPROACH_TASK_STATE_INIT:
        HeapExp_FndInitAllocator(&taskData->allocator, HEAP_ID_FIELD1, 0x20);
        Field3dModel_LoadFromFilesystem(&taskData->model, NARC_demo_legend, NARC_legend_legend_00000034_NSBMD, HEAP_ID_FIELD1);
        Field3dModelAnimation_LoadFromFilesystem(&taskData->anims[0], &taskData->model, NARC_demo_legend, NARC_legend_legend_00000035_NSBCA, HEAP_ID_FIELD1, &taskData->allocator);
        Field3dModelAnimation_LoadFromFilesystem(&taskData->anims[1], &taskData->model, NARC_demo_legend, NARC_legend_legend_00000036_NSBMA, HEAP_ID_FIELD1, &taskData->allocator);
        Field3dModelAnimation_LoadFromFilesystem(&taskData->anims[2], &taskData->model, NARC_demo_legend, NARC_legend_legend_00000037_NSBTP, HEAP_ID_FIELD1, &taskData->allocator);
        Field3dObject_InitFromModel(&taskData->object, &taskData->model);
        Field3dObject_AddAnimation(&taskData->object, &taskData->anims[0]);
        Field3dObject_AddAnimation(&taskData->object, &taskData->anims[1]);
        Field3dObject_AddAnimation(&taskData->object, &taskData->anims[2]);
        Field3dObject_SetActiveFlag(&taskData->object, FALSE);
        modelAnimListSetFrameIndex(taskData->anims, 3, 0);
        {
            VecFx32 pos;
            MapObject_CopyPositionVector(PlayerAvatar_GetMapObject(fieldSystem->playerAvatar), &pos);
            if (taskData->gameVersion == VERSION_HEARTGOLD) {
                pos.y += FX32_CONST(40);
                pos.z -= FX32_CONST(16);
            } else {
                pos.z -= FX32_CONST(280);
            }
            Field3dObject_SetPosEx(&taskData->object, pos.x, pos.y, pos.z);
        }
        ++(*pState);
        break;
    case BIRD_FINAL_APPROACH_TASK_STATE_CORRECT_POS: {
        VecFx32 pos;
        MapObject_CopyPositionVector(mapObject, &pos);
        taskData->yEnd = pos.y;
        if (taskData->gameVersion == VERSION_HEARTGOLD) {
            taskData->yDelta = FX32_CONST(120);
        } else {
            taskData->yDelta = FX32_CONST(160);
        }
        pos.y += taskData->yDelta;
        MapObject_SetPositionVector(mapObject, &pos);
    }
        MapObject_SetVisible(mapObject, FALSE);
        taskData->delayTimer = 0;
        taskData->betweenFlapsDelayTimer = 0;
        ++(*pState);
        break;
    case BIRD_FINAL_APPROACH_TASK_STATE_FLAP_DOWN:
        ++taskData->delayTimer;
        if (taskData->delayTimer >= firstFlapDelay) {
            if (taskData->betweenFlapsDelayTimer == 0) {
                PlaySE(flapSfx);
                taskData->betweenFlapsDelayTimer = 24;
            }
            --taskData->betweenFlapsDelayTimer;
        }
        {
            VecFx32 pos;
            BOOL snapped = FALSE;
            MapObject_CopyPositionVector(mapObject, &pos);
            taskData->yDelta -= FX32_ONE;
            if (taskData->yDelta <= 0) {
                taskData->yDelta = 0;
                snapped = TRUE;
            }
            pos.y = taskData->yEnd + taskData->yDelta;
            MapObject_SetPositionVector(mapObject, &pos);
            if (snapped) {
                taskData->delayTimer = 0;
                ++(*pState);
            }
        }
        break;
    case BIRD_FINAL_APPROACH_TASK_STATE_DELAY__ALT_ANIM:
        ++taskData->delayTimer;
        if (taskData->delayTimer >= 60) {
            sub_0205F328(mapObject, 1);
            taskData->delayTimer = 0;
            ++(*pState);
        }
        break;
    case BIRD_FINAL_APPROACH_TASK_STATE_DELAY__CRY:
        ++taskData->delayTimer;
        if (taskData->delayTimer >= 50) {
            Field3dObject_SetActiveFlag(&taskData->object, TRUE);
            PlayCry(species, 0);
            taskData->animTimer = 0;
            taskData->delayTimer = 0;
            ++(*pState);
        }
        break;
    case BIRD_FINAL_APPROACH_TASK_STATE_EXPANDING_CIRCLE_EFFECT: {
        BOOL animDone = modelAnimListAdvanceNoLoop(taskData->anims, 3);
        ++taskData->animTimer;
        if (animDone && taskData->animTimer >= 65) {
            sub_0205F328(mapObject, 0);
            taskData->delayTimer = 0;
            ++(*pState);
        }
    }
        Field3dObject_Draw(&taskData->object);
        break;
    case BIRD_FINAL_APPROACH_TASK_STATE_WAIT_AFTER_ANIM:
        ++taskData->delayTimer;
        if (taskData->delayTimer >= 30) {
            ++(*pState);
        }
        break;
    case BIRD_FINAL_APPROACH_TASK_STATE_FINISH:
        Field3dModelAnimation_Unload(&taskData->anims[2], &taskData->allocator);
        Field3dModelAnimation_Unload(&taskData->anims[1], &taskData->allocator);
        Field3dModelAnimation_Unload(&taskData->anims[0], &taskData->allocator);
        Field3dModel_Unload(&taskData->model);
        Heap_Free(taskData);
        return TRUE;
    }

    return FALSE;
}

void LegendCutscene_BeginWavesOrLeavesEffect(FieldSystem *fieldSystem) {
    ClearBellCutsceneCamera *cam = fieldSystem->unk4->legendCutsceneCamera;
    if (cam->gameVersion == VERSION_SOULSILVER) {
        beginWavesEffect(fieldSystem);
    } else {
        beginLeavesEffect(fieldSystem);
    }
}

static void beginWavesEffect(FieldSystem *fieldSystem) {
    ClearBellCutsceneCamera *cam = fieldSystem->unk4->legendCutsceneCamera;
    ClearBellCutscene3dObjectTaskData *taskData = (ClearBellCutscene3dObjectTaskData *)Field3dObjectTask_GetData(cam->draw3dTask);
    ClearBellCutscene3dObjectTaskData_SoulSilver *wavesEffectData = &taskData->wavesEffect;

    Field3dModel_LoadFromFilesystem(&wavesEffectData->model, NARC_demo_legend, NARC_legend_legend_00000038_NSBMD, HEAP_ID_FIELD1);
    Field3dModelAnimation_LoadFromFilesystem(&wavesEffectData->anims[0], &wavesEffectData->model, NARC_demo_legend, NARC_legend_legend_00000039_NSBCA, HEAP_ID_FIELD1, &taskData->allocator);
    Field3dModelAnimation_LoadFromFilesystem(&wavesEffectData->anims[1], &wavesEffectData->model, NARC_demo_legend, NARC_legend_legend_00000040_NSBTA, HEAP_ID_FIELD1, &taskData->allocator);
    Field3dObject_InitFromModel(&wavesEffectData->object, &wavesEffectData->model);
    Field3dObject_AddAnimation(&wavesEffectData->object, &wavesEffectData->anims[0]);
    Field3dObject_AddAnimation(&wavesEffectData->object, &wavesEffectData->anims[1]);
    Field3dObject_SetActiveFlag(&wavesEffectData->object, TRUE);
    modelAnimListSetFrameIndex(wavesEffectData->anims, 2, 0);

    VecFx32 pos;
    MapObject_CopyPositionVector(PlayerAvatar_GetMapObject(fieldSystem->playerAvatar), &pos);
    Field3dObject_SetPosEx(&wavesEffectData->object, pos.x, pos.y, pos.z);
    taskData->task = SysTask_CreateOnMainQueue(Task_WavesEffect, taskData, 0);
}

static void beginLeavesEffect(FieldSystem *fieldSystem) {
    ClearBellCutsceneCamera *cam = fieldSystem->unk4->legendCutsceneCamera;
    ClearBellCutscene3dObjectTaskData *taskData = (ClearBellCutscene3dObjectTaskData *)Field3dObjectTask_GetData(cam->draw3dTask);
    ClearBellCutscene3dObjectTaskData_HeartGold *leavesEffectData = &taskData->leavesEffect;

    leavesEffectData->bgConfig = fieldSystem->bgConfig;

    for (u8 i = 0; i < 6; ++i) {
        leavesEffectData->bg2ScrnRaw[i] = GfGfxLoader_GetScrnData(NARC_demo_legend, sBg2TilemapFileIDs[i], FALSE, &leavesEffectData->bg2ScrnData[i], HEAP_ID_FIELD1);
        leavesEffectData->bg3ScrnRaw[i] = GfGfxLoader_GetScrnData(NARC_demo_legend, sBg3TilemapFileIDs[i], FALSE, &leavesEffectData->bg3ScrnData[i], HEAP_ID_FIELD1);
    }

    BG_LoadScreenTilemapData(leavesEffectData->bgConfig, GF_BG_LYR_MAIN_2, leavesEffectData->bg2ScrnData[0]->rawData, leavesEffectData->bg2ScrnData[0]->szByte);
    BG_LoadScreenTilemapData(leavesEffectData->bgConfig, GF_BG_LYR_MAIN_3, leavesEffectData->bg3ScrnData[0]->rawData, leavesEffectData->bg3ScrnData[0]->szByte);
    BgTilemapRectChangePalette(leavesEffectData->bgConfig, GF_BG_LYR_MAIN_2, 0, 0, 32, 32, 6);
    BgTilemapRectChangePalette(leavesEffectData->bgConfig, GF_BG_LYR_MAIN_3, 0, 0, 32, 32, 6);
    GfGfxLoader_LoadCharData(NARC_demo_legend, NARC_legend_legend_00000053_NCGR, leavesEffectData->bgConfig, GF_BG_LYR_MAIN_2, 0, 0, FALSE, HEAP_ID_FIELD1);
    GfGfxLoader_LoadCharData(NARC_demo_legend, NARC_legend_legend_00000053_NCGR, leavesEffectData->bgConfig, GF_BG_LYR_MAIN_3, 0, 0, FALSE, HEAP_ID_FIELD1);
    GfGfxLoader_GXLoadPal(NARC_demo_legend, NARC_legend_legend_00000054_NCLR, GF_PAL_LOCATION_MAIN_BG, (enum GFPalSlotOffset)0xC0, 0x20, HEAP_ID_FIELD1);
    taskData->task = SysTask_CreateOnMainQueue(Task_LeavesEffect, taskData, 0);
    ScheduleBgTilemapBufferTransfer(leavesEffectData->bgConfig, GF_BG_LYR_MAIN_2);
    ScheduleBgTilemapBufferTransfer(leavesEffectData->bgConfig, GF_BG_LYR_MAIN_3);
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG2, GF_PLANE_TOGGLE_ON);
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG3, GF_PLANE_TOGGLE_ON);
    leavesEffectData->switchTilemapDelayTimer = 0;
    leavesEffectData->tilemapIndex = 0;
    G2_SetBG2Priority(0);
    G2_SetBG3Priority(1);
    G2_SetBG0Priority(2);
}

void LegendCutscene_EndWavesOrLeavesEffect(FieldSystem *fieldSystem) {
    ClearBellCutsceneCamera *cam = fieldSystem->unk4->legendCutsceneCamera;
    ClearBellCutscene3dObjectTaskData *taskData = (ClearBellCutscene3dObjectTaskData *)Field3dObjectTask_GetData(cam->draw3dTask);
    SysTask_Destroy(taskData->task);
    taskData->task = NULL;
    if (cam->gameVersion == VERSION_SOULSILVER) {
        endWavesEffect(taskData);
    } else {
        endLeavesEffect(taskData);
    }
}

static void endWavesEffect(ClearBellCutscene3dObjectTaskData *taskData) {
    ClearBellCutscene3dObjectTaskData_SoulSilver *wavesEffectData = &taskData->wavesEffect;
    Field3dModelAnimation_Unload(&wavesEffectData->anims[1], &taskData->allocator);
    Field3dModelAnimation_Unload(&wavesEffectData->anims[0], &taskData->allocator);
    Field3dModel_Unload(&wavesEffectData->model);
}

static void endLeavesEffect(ClearBellCutscene3dObjectTaskData *taskData) {
    ClearBellCutscene3dObjectTaskData_HeartGold *leavesEffectData = &taskData->leavesEffect;
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG2, GF_PLANE_TOGGLE_OFF);
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG3, GF_PLANE_TOGGLE_OFF);
    for (u8 i = 0; i < 6; ++i) {
        Heap_Free(leavesEffectData->bg2ScrnRaw[i]);
        Heap_Free(leavesEffectData->bg3ScrnRaw[i]);
    }
}

static void Task_WavesEffect(SysTask *task, void *taskData) {
    ClearBellCutscene3dObjectTaskData *cutsceneData = (ClearBellCutscene3dObjectTaskData *)taskData;
    ClearBellCutscene3dObjectTaskData_SoulSilver *wavesEffectData = &cutsceneData->wavesEffect;
    modelAnimListAdvanceLooping(wavesEffectData->anims, 2);
    Field3dObject_Draw(&wavesEffectData->object);
}

static void Task_LeavesEffect(SysTask *task, void *taskData) {
    ClearBellCutscene3dObjectTaskData *cutsceneData = (ClearBellCutscene3dObjectTaskData *)taskData;
    ClearBellCutscene3dObjectTaskData_HeartGold *leavesEffectData = &cutsceneData->leavesEffect;

    ++leavesEffectData->switchTilemapDelayTimer;
    if (leavesEffectData->switchTilemapDelayTimer >= 6) {
        leavesEffectData->switchTilemapDelayTimer = 0;
        ++leavesEffectData->tilemapIndex;
        if (leavesEffectData->tilemapIndex >= 6) {
            leavesEffectData->tilemapIndex = 0;
        }
        CopyRectToBgTilemapRect(leavesEffectData->bgConfig, GF_BG_LYR_MAIN_2, 0, 0, 32, 32, leavesEffectData->bg2ScrnData[leavesEffectData->tilemapIndex]->rawData, 0, 0, 32, 32);
        CopyRectToBgTilemapRect(leavesEffectData->bgConfig, GF_BG_LYR_MAIN_3, 0, 0, 32, 32, leavesEffectData->bg3ScrnData[leavesEffectData->tilemapIndex]->rawData, 0, 0, 32, 32);
        BgTilemapRectChangePalette(leavesEffectData->bgConfig, GF_BG_LYR_MAIN_2, 0, 0, 32, 32, 6);
        BgTilemapRectChangePalette(leavesEffectData->bgConfig, GF_BG_LYR_MAIN_3, 0, 0, 32, 32, 6);
        ScheduleBgTilemapBufferTransfer(leavesEffectData->bgConfig, GF_BG_LYR_MAIN_2);
        ScheduleBgTilemapBufferTransfer(leavesEffectData->bgConfig, GF_BG_LYR_MAIN_3);
    }
    --leavesEffectData->bg2X;
    ++leavesEffectData->bg3X;
    --leavesEffectData->bgY;
    ScheduleSetBgPosText(leavesEffectData->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_SET_X, leavesEffectData->bg2X);
    ScheduleSetBgPosText(leavesEffectData->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_SET_Y, leavesEffectData->bgY);
    ScheduleSetBgPosText(leavesEffectData->bgConfig, GF_BG_LYR_MAIN_3, BG_POS_OP_SET_X, leavesEffectData->bg3X);
    ScheduleSetBgPosText(leavesEffectData->bgConfig, GF_BG_LYR_MAIN_3, BG_POS_OP_SET_Y, leavesEffectData->bgY);
}

void LegendCutscene_BeginLugiaArrivesEffect(FieldSystem *fieldSystem) {
    LugiaArrivesCutsceneCamera *cam;

    fieldSystem->unk4->legendCutsceneCamera = Heap_AllocAtEnd(HEAP_ID_FIELD1, sizeof(LugiaArrivesCutsceneCamera));
    cam = fieldSystem->unk4->legendCutsceneCamera;

    cam->gameVersion = gGameVersion;
    if (cam->gameVersion == VERSION_HEARTGOLD) {
        GF_ASSERT(FALSE);
        return;
    }
    cam->distance = Camera_GetDistance(fieldSystem->camera);
    cam->angle = Camera_GetAngle(fieldSystem->camera);
    VecFx32 lookAtTarget = Camera_GetLookAtCamTarget(fieldSystem->camera);
    VEC_Subtract(&lookAtTarget, Camera_GetCurrentTarget(fieldSystem->camera), &cam->targetDistanceVec);
    cam->perspectiveAngle = Camera_GetPerspectiveAngle(fieldSystem->camera);
    cam->clippingPlaneNear = Camera_GetPerspectiveClippingPlaneNear(fieldSystem->camera);
    cam->clippingPlaneFar = Camera_GetPerspectiveClippingPlaneFar(fieldSystem->camera);

    Camera_SetDistance(sCameraParam_SoulSilver[4].distance, fieldSystem->camera);
    Camera_SetAnglePos(&sCameraParam_SoulSilver[4].angle, fieldSystem->camera);
    Camera_SetPerspectiveAngle(sCameraParam_SoulSilver[4].perspective, fieldSystem->camera);
    Camera_OffsetLookAtPosAndTarget(&sCameraOffset_SoulSilver[4], fieldSystem->camera);
    Camera_SetPerspectiveClippingPlane(FX32_CONST(150), FX32_CONST(1700), fieldSystem->camera);
}

void LegendCutscene_EndLugiaArrivesEffect(FieldSystem *fieldSystem) {
    LugiaArrivesCutsceneCamera *cam = fieldSystem->unk4->legendCutsceneCamera;
    GF_ASSERT(cam->gameVersion != VERSION_HEARTGOLD);
    Heap_Free(fieldSystem->unk4->legendCutsceneCamera);
    fieldSystem->unk4->legendCutsceneCamera = NULL;
}

void LegendCutscene_LugiaArrivesEffectCameraPan(FieldSystem *fieldSystem) {
    CameraTranslationPathTemplate template;
    LugiaArrivesCutsceneCamera *cam = fieldSystem->unk4->legendCutsceneCamera;
    if (cam->gameVersion == VERSION_HEARTGOLD) {
        GF_ASSERT(FALSE);
        return;
    }

    cam->translation = CreateCameraTranslationWrapper(HEAP_ID_FIELD1, fieldSystem->camera);
    template.angleX = cam->angle.x;
    template.perspectiveAngle = cam->perspectiveAngle;
    template.position = cam->targetDistanceVec;
    template.distance = cam->distance;
    SetCameraTranslationPath(cam->translation, &template, 30);
    TaskManager_Call(fieldSystem->taskman, Task_LugiaArrivesEffectCameraPan, fieldSystem);
}

static BOOL Task_LugiaArrivesEffectCameraPan(TaskManager *taskman) {
    FieldSystem *fieldSystem = (FieldSystem *)TaskManager_GetEnvironment(taskman);
    LugiaArrivesCutsceneCamera *cam = fieldSystem->unk4->legendCutsceneCamera;
    GFCameraTranslationWrapper *trans = cam->translation;

    if (IsCameraTranslationFinished(trans)) {
        DeleteCameraTranslationWrapper(trans);
        Camera_SetPerspectiveClippingPlane(cam->clippingPlaneNear, cam->clippingPlaneFar, fieldSystem->camera);
        return TRUE;
    }

    return FALSE;
}
