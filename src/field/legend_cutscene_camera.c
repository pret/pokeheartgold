#include "field_map_object.h"
#include "gf_gfx_loader.h"
#include "global.h"
#include "field/legend_cutscene_camera.h"
#include "camera_translation.h"
#include "field/overlay_01_021E66E4.h"
#include "field/overlay_01_021FB878.h"
#include "field/overlay_01_02204004.h"
#include "task.h"
#include "unk_02005D10.h"
#include "fielddata/script/scr_seq/event_D40R0107.h"
#include "fielddata/script/scr_seq/event_D17R0110.h"

typedef struct KimonoDanceCutsceneCamera {
    UnkStruct_Overlay01_021E66E4 *unk_00;
    UnkStruct_Overlay01_021E66E4_subC *unk_04;
    GFCameraTranslationWrapper *translation;
    VecFx32 unk_0C;
    VecFx32 unk_18;
    int gameVersion;
} KimonoDanceCutsceneCamera;  // size: 0x28

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

typedef struct UnkStruct_ov02_02250BB0_sub38C {
    Field3dModel model;
    Field3DModelAnimation anims[2];
    Field3dObject object;
} UnkStruct_ov02_02250BB0_sub38C;

typedef struct UnkStruct_ov02_02250BB0_sub43C {
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
} UnkStruct_ov02_02250BB0_sub43C;

typedef struct UnkStruct_ov02_02250BB0 {
    NNSFndAllocator unk_000;
    u8 state;
    u8 unk_011;
    u16 gameVersion;
    Field3dModel unk_014;
    Field3dModel unk_024;
    Field3dModel unk_034;
    Field3DModelAnimation unk_044[3];
    Field3DModelAnimation unk_080[2];
    Field3DModelAnimation unk_0A8[1];
    Field3dObject unk_0BC;
    Field3dObject unk_134;
    Field3dObject unk_1AC[4];
    UnkStruct_ov02_02250BB0_sub38C unk_38C;
    UnkStruct_ov02_02250BB0_sub43C unk_43C;
    SysTask *unk_4A8;
    u32 unk_4AC;
    const CameraParam *cameraParam;
    const VecFx32 *cameraOffset;
} UnkStruct_ov02_02250BB0;  // size: 0x4B8

typedef struct UnkStruct_ov02_02250B80 {
    NNSFndAllocator unk_00;
    Field3dModel unk_10;
    Field3DModelAnimation unk_20[3];
    Field3dObject unk_5C;
    int unk_D4;
} UnkStruct_ov02_02250B80;

typedef struct UnkStruct_ov02_022515A4 {
    fx32 unk_00;
    fx32 unk_04;
    u16 unk_08;
    u16 unk_0A;
    NNSFndAllocator unk_0C;
    Field3dModel unk_1C;
    Field3DModelAnimation unk_2C[3];
    Field3dObject unk_68;
    u16 gameVersion;
    u16 unk_E2;
} UnkStruct_ov02_022515A4;

static void ov02_02250B44(FieldSystem *fieldSystem);
static BOOL ov02_02250B58(TaskManager *taskman);
static void ov02_02250BB0(KimonoDanceCutsceneCamera *cam);
static void ov02_02250BC4(UnkStruct_Overlay01_021E66E4_subC *a0, FieldSystem *a1, void *a2);
static void ov02_02250EC0(UnkStruct_Overlay01_021E66E4_subC *a0, FieldSystem *fieldSystem, void *a2);
static void ov02_02250F1C(UnkStruct_Overlay01_021E66E4_subC *a0, struct FieldSystem *a1, void *a2);
static void ov02_02250FE0(UnkStruct_Overlay01_021E66E4_subC *a0, struct FieldSystem *a1, void *a2);
static void ov02_02251018(UnkStruct_ov02_02250BB0 *a0);
static void modelAnimListSetFrameIndex(Field3DModelAnimation *animation, u32 num, fx32 frame);
static BOOL modelAnimListAdvanceNoLoop(Field3DModelAnimation *animation, u32 num);
static void modelAnimListAdvanceLooping(Field3DModelAnimation *animation, u32 num);
static void ov02_02251164(UnkStruct_ov02_02250BB0 *a0, int a1);
static void ov02_022511AC(HeapID heapId, FieldSystem *fieldSystem, UnkStruct_ov02_02250B80 *a2);
static void ov02_02251280(UnkStruct_ov02_02250B80 *a0);
static BOOL ov02_022512AC(TaskManager *taskman);
static BOOL ov02_02251320(TaskManager *taskman);
static BOOL ov02_02251568(TaskManager *taskman);
static BOOL ov02_022515D0(TaskManager *taskman);
static void ov02_022518F8(FieldSystem *fieldSystem);
static void ov02_022519B0(FieldSystem *fieldSystem);
static void ov02_02251BA8(SysTask *task, void *taskData);
static void ov02_02251BC4(SysTask *task, void *taskData);
static void ov02_02251B4C(UnkStruct_ov02_02250BB0 *unk);
static void ov02_02251B70(UnkStruct_ov02_02250BB0 *unk);
static BOOL ov02_02251E44(TaskManager *taskman);

static const UnkStruct_Overlay01_021E67BC_template ov02_02253B4C = {
    3,
    sizeof(UnkStruct_ov02_02250BB0),
    ov02_02250BC4,
    ov02_02250EC0,
    ov02_02250F1C,
    ov02_02250FE0,
};

static const CameraParam sCameraParam_HeartGold[] = {
    {
        .distance = FX32_CONST(666.922119148625),
        .angle = { .x = 0xF562 },
        .perspectiveType = 0,
        .perspective = 0x5C1,
        .setReference = FALSE,
    }, {
        .distance = FX32_CONST(666.922119148625),
        .angle = { .x = 0xF562 },
        .perspectiveType = 0,
        .perspective = 0x5C1,
        .setReference = FALSE,
    }, {
        .distance = FX32_CONST(666.922119148625),
        .angle = { .x = 0xF762 },
        .perspectiveType = 0,
        .perspective = 0xCC1,
        .setReference = FALSE,
    }, {
        .distance = FX32_CONST(666.922119148625),
        .angle = { .x = 0xFBA2 },
        .perspectiveType = 0,
        .perspective = 0xCC1,
        .setReference = FALSE,
    },
};

static const CameraParam sCameraParam_SoulSilver[] = {
    {
        .distance = FX32_CONST(666.922119148625),
        .angle = { .x = 0xDFE2 },
        .perspectiveType = 0,
        .perspective = 0x5C1,
        .setReference = FALSE,
    }, {
        .distance = FX32_CONST(666.922119148625),
        .angle = { .x = 0xDFE2 },
        .perspectiveType = 0,
        .perspective = 0x5C1,
        .setReference = FALSE,
    }, {
        .distance = FX32_CONST(666.922119148625),
        .angle = { .x = 0xDEF2 },
        .perspectiveType = 0,
        .perspective = 0x5C1,
        .setReference = FALSE,
    }, {
        .distance = FX32_CONST(666.922119148625),
        .angle = { .x = 0xDEF2 },
        .perspectiveType = 0,
        .perspective = 0x5C1,
        .setReference = FALSE,
    }, {
        .distance = FX32_CONST(666.922119148625),
        .angle = { .x = 0xDEF2 },
        .perspectiveType = 0,
        .perspective = 0x5C1,
        .setReference = FALSE,
    },
};

static const VecFx32 sCameraOffset_HeartGold[] = {
    { -FX32_CONST(195), -FX32_CONST(148.605), -FX32_CONST(45.19165) },
    { FX32_CONST(198), -FX32_CONST(148.605), -FX32_CONST(45.19165) },
    { 0, -FX32_CONST(35.751708984375), -FX32_CONST(23.0476) },
    { 0, FX32_CONST(495.6323), FX32_CONST(28.73) },
};

static const VecFx32 sCameraOffset_SoulSilver[] = {
    { -FX32_CONST(127), 0, -FX32_CONST(208) },
    { FX32_CONST(63), 0, -FX32_CONST(208) },
    { 0, 0, -FX32_CONST(82) },
    { 0, 0, -FX32_CONST(433) },
    { 0, 0, -FX32_CONST(225) },
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

void ov02_02250A60(FieldSystem *fieldSystem) {
    KimonoDanceCutsceneCamera *cam;

    fieldSystem->unk4->legendCutsceneCamera = AllocFromHeapAtEnd(HEAP_ID_4, sizeof(KimonoDanceCutsceneCamera));
    cam = fieldSystem->unk4->legendCutsceneCamera;

    cam->translation = CreateCameraTranslationWrapper(HEAP_ID_4, fieldSystem->camera);
    cam->gameVersion = gGameVersion;
    cam->unk_0C = Camera_GetLookAtCamTarget(fieldSystem->camera);
    cam->unk_18 = Camera_GetLookAtCamPos(fieldSystem->camera);
    cam->unk_00 = fieldSystem->unk4->unk4;
    ov02_02250BB0(cam);
}

void ov02_02250AC8(FieldSystem *fieldSystem) {
    KimonoDanceCutsceneCamera *cam = fieldSystem->unk4->legendCutsceneCamera;
    DeleteCameraTranslationWrapper(cam->translation);
    FreeToHeap(fieldSystem->unk4->legendCutsceneCamera);
    fieldSystem->unk4->legendCutsceneCamera = NULL;
}

void ov02_02250AE8(FieldSystem *fieldSystem) {
    KimonoDanceCutsceneCamera *cam = fieldSystem->unk4->legendCutsceneCamera;
    UnkStruct_ov02_02250BB0 *unk = (UnkStruct_ov02_02250BB0 *)ov01_021E687C(cam->unk_04);
    unk->state = 1;
}

void ov02_02250AFC(FieldSystem *fieldSystem, u8 a1) {
    KimonoDanceCutsceneCamera *cam = fieldSystem->unk4->legendCutsceneCamera;
    UnkStruct_ov02_02250BB0 *unk = (UnkStruct_ov02_02250BB0 *)ov01_021E687C(cam->unk_04);
    if (unk->state != 3) {
        GF_ASSERT(FALSE);
        TaskManager_Call(fieldSystem->taskman, ov02_02250B58, NULL);
        return;
    }
    unk->unk_011 = a1;
    ov02_02250B44(fieldSystem);
}

void ov02_02250B30(FieldSystem *fieldSystem) {
    TaskManager_Call(fieldSystem->taskman, ov02_02251320, NULL);
}

static void ov02_02250B44(FieldSystem *fieldSystem) {
    KimonoDanceCutsceneCamera *cam = fieldSystem->unk4->legendCutsceneCamera;
    UnkStruct_ov02_02250BB0 *unk = (UnkStruct_ov02_02250BB0 *)ov01_021E687C(cam->unk_04);
    unk->state = 4;
}

static BOOL ov02_02250B58(TaskManager *taskman) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskman);
    KimonoDanceCutsceneCamera *cam = fieldSystem->unk4->legendCutsceneCamera;
    UnkStruct_ov02_02250BB0 *unk = (UnkStruct_ov02_02250BB0 *)ov01_021E687C(cam->unk_04);
    if (unk->state == 3) {
        ov02_02250B44(fieldSystem);
        return TRUE;
    }

    return FALSE;
}

void ov02_02250B80(FieldSystem *fieldSystem) {
    UnkStruct_ov02_02250B80 *unk = AllocFromHeapAtEnd(HEAP_ID_4, sizeof(UnkStruct_ov02_02250B80));
    unk->unk_D4 = 0;
    ov02_022511AC(HEAP_ID_4, fieldSystem, unk);
    TaskManager_Call(fieldSystem->taskman, ov02_022512AC, unk);
}

static void ov02_02250BB0(KimonoDanceCutsceneCamera *cam) {
    cam->unk_04 = ov01_021E67BC(cam->unk_00, &ov02_02253B4C);
}

static void ov02_02250BC4(UnkStruct_Overlay01_021E66E4_subC *a0, FieldSystem *fieldSystem, void *a2) {
    UnkStruct_ov02_02250BB0 *r5 = (UnkStruct_ov02_02250BB0 *)a2;
    KimonoDanceCutsceneCamera *cam = fieldSystem->unk4->legendCutsceneCamera;
    r5->gameVersion = cam->gameVersion;
    GF_ExpHeap_FndInitAllocator(&r5->unk_000, HEAP_ID_4, 0x20);
    Field3dModel_LoadFromFilesystem(&r5->unk_014, NARC_a_1_7_4, 18, HEAP_ID_4);
    Field3dModel_LoadFromFilesystem(&r5->unk_024, NARC_a_1_7_4, 25, HEAP_ID_4);
    Field3dModel_LoadFromFilesystem(&r5->unk_034, NARC_a_1_7_4, 32, HEAP_ID_4);
    Field3dModelAnimation_LoadFromFilesystem(&r5->unk_044[0], &r5->unk_014, NARC_a_1_7_4, 19, HEAP_ID_4, &r5->unk_000);
    Field3dModelAnimation_LoadFromFilesystem(&r5->unk_044[1], &r5->unk_014, NARC_a_1_7_4, 20, HEAP_ID_4, &r5->unk_000);
    Field3dModelAnimation_LoadFromFilesystem(&r5->unk_044[2], &r5->unk_014, NARC_a_1_7_4, 21, HEAP_ID_4, &r5->unk_000);
    Field3dModelAnimation_LoadFromFilesystem(&r5->unk_080[0], &r5->unk_024, NARC_a_1_7_4, 26, HEAP_ID_4, &r5->unk_000);
    Field3dModelAnimation_LoadFromFilesystem(&r5->unk_080[1], &r5->unk_024, NARC_a_1_7_4, 27, HEAP_ID_4, &r5->unk_000);
    Field3dModelAnimation_LoadFromFilesystem(&r5->unk_0A8[0], &r5->unk_034, NARC_a_1_7_4, 33, HEAP_ID_4, &r5->unk_000);
    ov01_021FBF2C(&r5->unk_0BC, &r5->unk_014);
    ov01_021FBF2C(&r5->unk_134, &r5->unk_024);
    ov01_021FBF50(&r5->unk_0BC, &r5->unk_044[0]);
    ov01_021FBF50(&r5->unk_0BC, &r5->unk_044[1]);
    ov01_021FBF50(&r5->unk_0BC, &r5->unk_044[2]);
    ov01_021FBF50(&r5->unk_134, &r5->unk_080[0]);
    ov01_021FBF50(&r5->unk_134, &r5->unk_080[1]);
    ov01_021FC004(&r5->unk_0BC, 0);
    ov01_021FC004(&r5->unk_134, 0);
    for (u8 i = 0; i < 4; ++i) {
        ov01_021FBF2C(&r5->unk_1AC[i], &r5->unk_034);
        ov01_021FBF50(&r5->unk_1AC[i], &r5->unk_0A8[0]);
        ov01_021FC004(&r5->unk_1AC[i], 0);
    }
    modelAnimListSetFrameIndex(r5->unk_044, 3, 0);
    modelAnimListSetFrameIndex(r5->unk_080, 2, 0);
    modelAnimListSetFrameIndex(r5->unk_0A8, 1, 0);

    VecFx32 pos;
    MapObject_GetPositionVec(PlayerAvatar_GetMapObject(fieldSystem->playerAvatar), &pos);
    Field3dObject_SetPos(&r5->unk_0BC, pos.x, pos.y, pos.z);
    Field3dObject_SetPos(&r5->unk_134, pos.x, pos.y, pos.z);
    if (r5->gameVersion == VERSION_SOULSILVER) {
        Field3dObject_SetPos(&r5->unk_1AC[0], pos.x + FX32_CONST(128), pos.y + FX32_CONST(32), pos.z - FX32_CONST(180));
        Field3dObject_SetPos(&r5->unk_1AC[1], pos.x - FX32_CONST(128), pos.y + FX32_CONST(32), pos.z - FX32_CONST(180));
        Field3dObject_SetPos(&r5->unk_1AC[2], 0, 0, 0);
        Field3dObject_SetPos(&r5->unk_1AC[3], 0, 0, 0);
        r5->unk_4AC = 0x131;
        r5->cameraParam = sCameraParam_SoulSilver;
        r5->cameraOffset = sCameraOffset_SoulSilver;
    } else {
        Field3dObject_SetPos(&r5->unk_1AC[0], pos.x + FX32_CONST(200), pos.y - FX32_CONST(73), pos.z + FX32_CONST(144));
        Field3dObject_SetPos(&r5->unk_1AC[1], pos.x - FX32_CONST(198), pos.y - FX32_CONST(73), pos.z + FX32_CONST(144));
        Field3dObject_SetPos(&r5->unk_1AC[2], pos.x + FX32_CONST(200), pos.y - FX32_CONST(73), pos.z - FX32_CONST(270));
        Field3dObject_SetPos(&r5->unk_1AC[3], pos.x - FX32_CONST(198), pos.y - FX32_CONST(73), pos.z - FX32_CONST(270));
        r5->unk_4AC = 0x130;
        r5->cameraParam = sCameraParam_HeartGold;
        r5->cameraOffset = sCameraOffset_HeartGold;
    }
    r5->state = 0;
}

static void ov02_02250EC0(UnkStruct_Overlay01_021E66E4_subC *a0, FieldSystem *fieldSystem, void *a2) {
    UnkStruct_ov02_02250BB0 *r4 = (UnkStruct_ov02_02250BB0 *)a2;
    Field3dModelAnimation_Unload(&r4->unk_044[2], &r4->unk_000);
    Field3dModelAnimation_Unload(&r4->unk_044[1], &r4->unk_000);
    Field3dModelAnimation_Unload(&r4->unk_044[0], &r4->unk_000);
    Field3dModelAnimation_Unload(&r4->unk_080[1], &r4->unk_000);
    Field3dModelAnimation_Unload(&r4->unk_080[0], &r4->unk_000);
    Field3dModelAnimation_Unload(&r4->unk_0A8[0], &r4->unk_000);
    Field3dModel_Unload(&r4->unk_014);
    Field3dModel_Unload(&r4->unk_024);
    Field3dModel_Unload(&r4->unk_034);
}

static void ov02_02250F1C(UnkStruct_Overlay01_021E66E4_subC *a0, struct FieldSystem *a1, void *a2) {
    UnkStruct_ov02_02250BB0 *r4 = (UnkStruct_ov02_02250BB0 *)a2;

    switch (r4->state) {
    case 0:
        break;
    case 1:
        ov01_021FC004(&r4->unk_0BC, 1);
        r4->state = 2;
        break;
    case 2:
        if (modelAnimListAdvanceNoLoop(r4->unk_044, 3)) {
            ov02_02251018(r4);
            r4->state = 3;
        }
        break;
    case 3:
        modelAnimListAdvanceLooping(r4->unk_044, 3);
        break;
    case 4:
        ov01_021FC004(&r4->unk_0BC, 0);
        ov02_02251164(r4, 1);
        modelAnimListSetFrameIndex(r4->unk_080, 2, 0);
        modelAnimListSetFrameIndex(r4->unk_0A8, 1, 0);
        r4->state = 5;
        break;
    case 5:
        modelAnimListAdvanceLooping(r4->unk_044, 3);
        modelAnimListAdvanceNoLoop(r4->unk_0A8, 1);
        if (modelAnimListAdvanceNoLoop(r4->unk_080, 2)) {
            ov02_02251164(r4, 0);
            ov01_021FC004(&r4->unk_0BC, 1);
            r4->state = 3;
        }
        break;
    }
}

static void ov02_02250FE0(UnkStruct_Overlay01_021E66E4_subC *a0, struct FieldSystem *a1, void *a2) {
    UnkStruct_ov02_02250BB0 *r4 = (UnkStruct_ov02_02250BB0 *)a2;

    ov01_021FBF68(&r4->unk_0BC);
    ov01_021FBF68(&r4->unk_134);
    for (u8 i = 0; i < 4; ++i) {
        ov01_021FBF68(&r4->unk_1AC[i]);
    }
}

static void ov02_02251018(UnkStruct_ov02_02250BB0 *a0) {
    ov01_021FBF5C(&a0->unk_0BC, &a0->unk_044[0]);
    ov01_021FBF5C(&a0->unk_0BC, &a0->unk_044[1]);
    ov01_021FBF5C(&a0->unk_0BC, &a0->unk_044[2]);
    Field3dModelAnimation_Unload(&a0->unk_044[2], &a0->unk_000);
    Field3dModelAnimation_Unload(&a0->unk_044[1], &a0->unk_000);
    Field3dModelAnimation_Unload(&a0->unk_044[0], &a0->unk_000);
    Field3dModelAnimation_LoadFromFilesystem(&a0->unk_044[0], &a0->unk_014, NARC_a_1_7_4, 22, HEAP_ID_4, &a0->unk_000);
    Field3dModelAnimation_LoadFromFilesystem(&a0->unk_044[1], &a0->unk_014, NARC_a_1_7_4, 23, HEAP_ID_4, &a0->unk_000);
    Field3dModelAnimation_LoadFromFilesystem(&a0->unk_044[2], &a0->unk_014, NARC_a_1_7_4, 24, HEAP_ID_4, &a0->unk_000);
    ov01_021FBF50(&a0->unk_0BC, &a0->unk_044[0]);
    ov01_021FBF50(&a0->unk_0BC, &a0->unk_044[1]);
    ov01_021FBF50(&a0->unk_0BC, &a0->unk_044[2]);
    modelAnimListSetFrameIndex(a0->unk_044, 3, 0);
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

static void ov02_02251164(UnkStruct_ov02_02250BB0 *a0, int a1) {
    u32 r5 = a0->gameVersion == VERSION_SOULSILVER ? 2 : 4;
    ov01_021FC004(&a0->unk_134, a1);
    if (!a0->unk_011) {
        for (u8 i = 0; i < r5; ++i) {
            ov01_021FC004(&a0->unk_1AC[i], a1);
        }
    }
}

static void ov02_022511AC(HeapID heapId, FieldSystem *fieldSystem, UnkStruct_ov02_02250B80 *a2) {
    GF_ExpHeap_FndInitAllocator(&a2->unk_00, heapId, 0x20);
    Field3dModel_LoadFromFilesystem(&a2->unk_10, NARC_a_1_7_4, 28, heapId);
    Field3dModelAnimation_LoadFromFilesystem(&a2->unk_20[0], &a2->unk_10, NARC_a_1_7_4, 29, heapId, &a2->unk_00);
    Field3dModelAnimation_LoadFromFilesystem(&a2->unk_20[1], &a2->unk_10, NARC_a_1_7_4, 30, heapId, &a2->unk_00);
    Field3dModelAnimation_LoadFromFilesystem(&a2->unk_20[2], &a2->unk_10, NARC_a_1_7_4, 31, heapId, &a2->unk_00);
    ov01_021FBF2C(&a2->unk_5C, &a2->unk_10);
    ov01_021FBF50(&a2->unk_5C, &a2->unk_20[0]);
    ov01_021FBF50(&a2->unk_5C, &a2->unk_20[1]);
    ov01_021FBF50(&a2->unk_5C, &a2->unk_20[2]);
    modelAnimListSetFrameIndex(a2->unk_20, 3, 0);

    VecFx32 pos;
    MapObject_GetPositionVec(PlayerAvatar_GetMapObject(fieldSystem->playerAvatar), &pos);
    pos.y += FX32_CONST(100);
    pos.z -= FX32_CONST(350);
    Field3dObject_SetPos(&a2->unk_5C, pos.x, pos.y, pos.z);
    ov01_021FC004(&a2->unk_5C, 1);
}

static void ov02_02251280(UnkStruct_ov02_02250B80 *a0) {
    Field3dModelAnimation_Unload(&a0->unk_20[2], &a0->unk_00);
    Field3dModelAnimation_Unload(&a0->unk_20[1], &a0->unk_00);
    Field3dModelAnimation_Unload(&a0->unk_20[0], &a0->unk_00);
    Field3dModel_Unload(&a0->unk_10);
}

static BOOL ov02_022512AC(TaskManager *taskman) {
    UnkStruct_ov02_02250B80 *unk = (UnkStruct_ov02_02250B80 *)TaskManager_GetEnvironment(taskman);
    u32 *pState = TaskManager_GetStatePtr(taskman);

    switch (*pState) {
    case 0:
        ++unk->unk_D4;
        if (unk->unk_D4 == 2) {
            PlaySE(SEQ_SE_GS_RUGIA_MENOHIKARI);
        }
        if (modelAnimListAdvanceNoLoop(unk->unk_20, 3)) {
            ++(*pState);
        }
        ov01_021FBF68(&unk->unk_5C);
        break;
    case 1:
        ov02_02251280(unk);
        FreeToHeap(unk);
        return TRUE;
    }

    return FALSE;
}

static BOOL ov02_02251320(TaskManager *taskman) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskman);
    u32 *pState = TaskManager_GetStatePtr(taskman);
    NNSG3dRenderObj *r7;
    u8 i;
    KimonoDanceCutsceneCamera *cam = fieldSystem->unk4->legendCutsceneCamera;
    UnkStruct_ov02_02250BB0 *r5 = ov01_021E687C(cam->unk_04);

    switch (*pState) {
    case 0:
        r7 = ov01_022040D0(fieldSystem->unkC0, r5->unk_4AC);
        for (i = 0; i < 2; ++i) {
            ov01_021E8970(r5->unk_4AC, i, 1, r7, fieldSystem->unk54);;
        }
        for (i = 0; i < 2; ++i) {
            void *r7_2 = ov01_021E8B04(r5->unk_4AC, i, fieldSystem->unk54);
            ov01_021E8B84(r7_2, 1);
            ov01_021E8B6C(r7_2);
        }
        *pState = 1;
        break;
    case 1:
        r7 = ov01_022040D0(fieldSystem->unkC0, r5->unk_4AC);
        if (ov01_021E8B90(ov01_021E8B04(r5->unk_4AC, 0, fieldSystem->unk54))) {
            for (i = 0; i < 2; ++i) {
                ov01_021E8A8C(fieldSystem->unk54, r7, r5->unk_4AC, i);
            }
            for (i = 0; i < 2; ++i) {
                ov01_021E8970(r5->unk_4AC, i + 2, 1, r7, fieldSystem->unk54);
            }
            *pState = 2;
        }
        break;
    case 2:
        return TRUE;
    }

    return FALSE;
}

void ov02_02251424(FieldSystem *fieldSystem, u8 a1) {
    KimonoDanceCutsceneCamera *cam = fieldSystem->unk4->legendCutsceneCamera;
    UnkStruct_ov02_02250BB0 *r4 = (UnkStruct_ov02_02250BB0 *)ov01_021E687C(cam->unk_04);

    GF_ASSERT(a1 < 3);

    Camera_SetLookAtCamTarget(&cam->unk_0C, fieldSystem->camera);
    Camera_SetLookAtCamPos(&cam->unk_18, fieldSystem->camera);
    Camera_SetDistance(r4->cameraParam[a1].distance, fieldSystem->camera);
    Camera_SetAnglePos(&r4->cameraParam[a1].angle, fieldSystem->camera);
    Camera_SetPerspectiveAngle(r4->cameraParam[a1].perspective, fieldSystem->camera);
    Camera_OffsetLookAtPosAndTarget(&r4->cameraOffset[a1], fieldSystem->camera);
    Camera_SetPerspectiveClippingPlane(FX32_CONST(150), FX32_CONST(1700), fieldSystem->camera);

    Camera_GetLookAtCamTarget(fieldSystem->camera);
    Camera_GetCurrentTarget(fieldSystem->camera);
    Camera_GetAngle(fieldSystem->camera);
}

void ov02_022514C8(FieldSystem *fieldSystem, u8 a1) {
    int duration;
    KimonoDanceCutsceneCamera *cam = fieldSystem->unk4->legendCutsceneCamera;
    UnkStruct_ov02_02250BB0 *r6 = (UnkStruct_ov02_02250BB0 *)ov01_021E687C(cam->unk_04);

    CameraTranslationPathTemplate template;
    int whichPoint = a1 == 0 ? 0 : 3;

    template.angleX = r6->cameraParam[whichPoint].angle.x;
    template.perspectiveAngle = r6->cameraParam[whichPoint].perspective;
    template.position = r6->cameraOffset[whichPoint];
    template.distance = r6->cameraParam[whichPoint].distance;
    if (cam->gameVersion == VERSION_HEARTGOLD) {
        if (a1 == 0) {
            duration = 200;
        } else {
            duration = 20;
        }
    } else {
        if (a1 == 0) {
            duration = 160;
        } else {
            duration = 200;
        }
    }
    SetCameraTranslationPath(cam->translation, &template, duration);
}

void ov02_02251554(FieldSystem *fieldSystem) {
    TaskManager_Call(fieldSystem->taskman, ov02_02251568, NULL);
}

static BOOL ov02_02251568(TaskManager *taskman) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskman);
    KimonoDanceCutsceneCamera *cam = fieldSystem->unk4->legendCutsceneCamera;
    if (IsCameraTranslationFinished(cam->translation)) {
        Camera_GetLookAtCamTarget(fieldSystem->camera);
        Camera_GetCurrentTarget(fieldSystem->camera);
        Camera_GetAngle(fieldSystem->camera);
        return TRUE;
    }

    return FALSE;
}

void ov02_022515A4(FieldSystem *fieldSystem) {
    UnkStruct_ov02_022515A4 *unk = AllocFromHeapAtEnd(HEAP_ID_4, sizeof(UnkStruct_ov02_022515A4));
    unk->gameVersion = gGameVersion;
    TaskManager_Call(fieldSystem->taskman, ov02_022515D0, unk);
}

static BOOL ov02_022515D0(TaskManager *taskman) {
    int species;
    int spC;
    int flapSfx;
    int mapObjectId;
    LocalMapObject *mapObject;
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskman);
    UnkStruct_ov02_022515A4 *unk = (UnkStruct_ov02_022515A4 *)TaskManager_GetEnvironment(taskman);
    u32 *pState = TaskManager_GetStatePtr(taskman);

    if (unk->gameVersion == VERSION_SOULSILVER) {
        species = SPECIES_LUGIA;
        mapObjectId = obj_D40R0107_lug_obj01;
        spC = 18;
        flapSfx = SEQ_SE_GS_RUGIA_HABATAKI;
    } else {
        species = SPECIES_HO_OH;
        mapObjectId = obj_D17R0110_hou_obj01;
        spC = 0;
        flapSfx = SEQ_SE_GS_HOUOU_HABATAKI;
    }

    mapObject = GetMapObjectByID(fieldSystem->mapObjectManager, mapObjectId);
    GF_ASSERT(mapObject != NULL);

    switch (*pState) {
    case 0:
        GF_ExpHeap_FndInitAllocator(&unk->unk_0C, HEAP_ID_4, 0x20);
        Field3dModel_LoadFromFilesystem(&unk->unk_1C, NARC_a_1_7_4, 34, HEAP_ID_4);
        Field3dModelAnimation_LoadFromFilesystem(&unk->unk_2C[0], &unk->unk_1C, NARC_a_1_7_4, 35, HEAP_ID_4, &unk->unk_0C);
        Field3dModelAnimation_LoadFromFilesystem(&unk->unk_2C[1], &unk->unk_1C, NARC_a_1_7_4, 36, HEAP_ID_4, &unk->unk_0C);
        Field3dModelAnimation_LoadFromFilesystem(&unk->unk_2C[2], &unk->unk_1C, NARC_a_1_7_4, 37, HEAP_ID_4, &unk->unk_0C);
        ov01_021FBF2C(&unk->unk_68, &unk->unk_1C);
        ov01_021FBF50(&unk->unk_68, &unk->unk_2C[0]);
        ov01_021FBF50(&unk->unk_68, &unk->unk_2C[1]);
        ov01_021FBF50(&unk->unk_68, &unk->unk_2C[2]);
        ov01_021FC004(&unk->unk_68, 0);
        modelAnimListSetFrameIndex(unk->unk_2C,3, 0);
    {
        VecFx32 sp2C;
        MapObject_GetPositionVec(PlayerAvatar_GetMapObject(fieldSystem->playerAvatar), &sp2C);
        if (unk->gameVersion == VERSION_HEARTGOLD) {
            sp2C.y += FX32_CONST(40);
            sp2C.z -= FX32_CONST(16);
        } else {
            sp2C.z -= FX32_CONST(280);
        }
        Field3dObject_SetPos(&unk->unk_68, sp2C.x, sp2C.y, sp2C.z);
    }
        ++(*pState);
        break;
    case 1:
    {
        VecFx32 sp20;
        MapObject_GetPositionVec(mapObject, &sp20);
        unk->unk_04 = sp20.y;
        if (unk->gameVersion == VERSION_HEARTGOLD) {
            unk->unk_00 = FX32_CONST(120);
        } else {
            unk->unk_00 = FX32_CONST(160);
        }
        sp20.y += unk->unk_00;
        MapObject_SetPositionVec(mapObject, &sp20);
    }
        MapObject_SetVisible(mapObject, FALSE);
        unk->unk_08 = 0;
        unk->unk_E2 = 0;
        ++(*pState);
        break;
    case 2:
        ++unk->unk_08;
        if (unk->unk_08 >= spC) {
            if (unk->unk_E2 == 0) {
                PlaySE(flapSfx);
                unk->unk_E2 = 24;
            }
            --unk->unk_E2;
        }
    {
        VecFx32 sp14;
        BOOL snapped = FALSE;
        MapObject_GetPositionVec(mapObject, &sp14);
        unk->unk_00 -= FX32_ONE;
        if (unk->unk_00 <= 0) {
            unk->unk_00 = 0;
            snapped = TRUE;
        }
        sp14.y = unk->unk_04 + unk->unk_00;
        MapObject_SetPositionVec(mapObject, &sp14);
        if (snapped) {
            unk->unk_08 = 0;
            ++(*pState);
        }
    }
        break;
    case 3:
        ++unk->unk_08;
        if (unk->unk_08 >= 60) {
            sub_0205F328(mapObject, 1);
            unk->unk_08 = 0;
            ++(*pState);
        }
        break;
    case 4:
        ++unk->unk_08;
        if (unk->unk_08 >= 50) {
            ov01_021FC004(&unk->unk_68, 1);
            PlayCry(species, 0);
            unk->unk_0A = 0;
            unk->unk_08 = 0;
            ++(*pState);
        }
        break;
    case 5:
    {
        BOOL animDone = modelAnimListAdvanceNoLoop(unk->unk_2C, 3);
        ++unk->unk_0A;
        if (animDone && unk->unk_0A >= 65) {
            sub_0205F328(mapObject, 0);
            unk->unk_08 = 0;
            ++(*pState);
        }
    }
        ov01_021FBF68(&unk->unk_68);
        break;
    case 6:
        ++unk->unk_08;
        if (unk->unk_08 >= 30) {
            ++(*pState);
        }
        break;
    case 7:
        Field3dModelAnimation_Unload(&unk->unk_2C[2], &unk->unk_0C);
        Field3dModelAnimation_Unload(&unk->unk_2C[1], &unk->unk_0C);
        Field3dModelAnimation_Unload(&unk->unk_2C[0], &unk->unk_0C);
        Field3dModel_Unload(&unk->unk_1C);
        FreeToHeap(unk);
        return TRUE;
    }

    return FALSE;
}

void ov02_022518E0(FieldSystem *fieldSystem) {
    KimonoDanceCutsceneCamera *cam = fieldSystem->unk4->legendCutsceneCamera;
    if (cam->gameVersion == VERSION_SOULSILVER) {
        ov02_022518F8(fieldSystem);
    } else {
        ov02_022519B0(fieldSystem);
    }
}

static void ov02_022518F8(FieldSystem *fieldSystem) {
    KimonoDanceCutsceneCamera *cam = fieldSystem->unk4->legendCutsceneCamera;
    UnkStruct_ov02_02250BB0 *r5 = (UnkStruct_ov02_02250BB0 *)ov01_021E687C(cam->unk_04);
    UnkStruct_ov02_02250BB0_sub38C *sub_38C = &r5->unk_38C;

    Field3dModel_LoadFromFilesystem(&sub_38C->model, NARC_a_1_7_4, 38, HEAP_ID_4);
    Field3dModelAnimation_LoadFromFilesystem(&sub_38C->anims[0], &sub_38C->model, NARC_a_1_7_4, 39, HEAP_ID_4, &r5->unk_000);
    Field3dModelAnimation_LoadFromFilesystem(&sub_38C->anims[1], &sub_38C->model, NARC_a_1_7_4, 40, HEAP_ID_4, &r5->unk_000);
    ov01_021FBF2C(&sub_38C->object, &sub_38C->model);
    ov01_021FBF50(&sub_38C->object, &sub_38C->anims[0]);
    ov01_021FBF50(&sub_38C->object, &sub_38C->anims[1]);
    ov01_021FC004(&sub_38C->object, 1);
    modelAnimListSetFrameIndex(sub_38C->anims, 2, 0);

    VecFx32 sp8;
    MapObject_GetPositionVec(PlayerAvatar_GetMapObject(fieldSystem->playerAvatar), &sp8);
    Field3dObject_SetPos(&sub_38C->object, sp8.x, sp8.y, sp8.z);
    r5->unk_4A8 = SysTask_CreateOnMainQueue(ov02_02251BA8, r5, 0);
}

static void ov02_022519B0(FieldSystem *fieldSystem) {
    KimonoDanceCutsceneCamera *cam = fieldSystem->unk4->legendCutsceneCamera;
    UnkStruct_ov02_02250BB0 *sp10 = (UnkStruct_ov02_02250BB0 *)ov01_021E687C(cam->unk_04);
    UnkStruct_ov02_02250BB0_sub43C *sub_43C = &sp10->unk_43C;

    sub_43C->bgConfig = fieldSystem->bgConfig;

    for (u8 i = 0; i < 6; ++i) {
        sub_43C->bg2ScrnRaw[i] = GfGfxLoader_GetScrnData(NARC_a_1_7_4, sBg2TilemapFileIDs[i], FALSE, &sub_43C->bg2ScrnData[i], HEAP_ID_4);
        sub_43C->bg3ScrnRaw[i] = GfGfxLoader_GetScrnData(NARC_a_1_7_4, sBg3TilemapFileIDs[i], FALSE, &sub_43C->bg3ScrnData[i], HEAP_ID_4);
    }

    BG_LoadScreenTilemapData(sub_43C->bgConfig, GF_BG_LYR_MAIN_2, sub_43C->bg2ScrnData[0]->rawData, sub_43C->bg2ScrnData[0]->szByte);
    BG_LoadScreenTilemapData(sub_43C->bgConfig, GF_BG_LYR_MAIN_3, sub_43C->bg3ScrnData[0]->rawData, sub_43C->bg3ScrnData[0]->szByte);
    BgTilemapRectChangePalette(sub_43C->bgConfig, GF_BG_LYR_MAIN_2, 0, 0, 32, 32, 6);
    BgTilemapRectChangePalette(sub_43C->bgConfig, GF_BG_LYR_MAIN_3, 0, 0, 32, 32, 6);
    GfGfxLoader_LoadCharData(NARC_a_1_7_4, 53, sub_43C->bgConfig, GF_BG_LYR_MAIN_2, 0, 0, FALSE, HEAP_ID_4);
    GfGfxLoader_LoadCharData(NARC_a_1_7_4, 53, sub_43C->bgConfig, GF_BG_LYR_MAIN_3, 0, 0, FALSE, HEAP_ID_4);
    GfGfxLoader_GXLoadPal(NARC_a_1_7_4, 54, GF_PAL_LOCATION_MAIN_BG, (enum GFPalSlotOffset)0xC0, 0x20, HEAP_ID_4);
    sp10->unk_4A8 = SysTask_CreateOnMainQueue(ov02_02251BC4, sp10, 0);
    ScheduleBgTilemapBufferTransfer(sub_43C->bgConfig, GF_BG_LYR_MAIN_2);
    ScheduleBgTilemapBufferTransfer(sub_43C->bgConfig, GF_BG_LYR_MAIN_3);
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG2, GF_PLANE_TOGGLE_ON);
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG3, GF_PLANE_TOGGLE_ON);
    sub_43C->switchTilemapDelayTimer = 0;
    sub_43C->tilemapIndex = 0;
    G2_SetBG2Priority(0);
    G2_SetBG3Priority(1);
    G2_SetBG0Priority(2);
}

void ov02_02251B14(FieldSystem *fieldSystem) {
    KimonoDanceCutsceneCamera *cam = fieldSystem->unk4->legendCutsceneCamera;
    UnkStruct_ov02_02250BB0 *unk = (UnkStruct_ov02_02250BB0 *)ov01_021E687C(cam->unk_04);
    SysTask_Destroy(unk->unk_4A8);
    unk->unk_4A8 = NULL;
    if (cam->gameVersion == VERSION_SOULSILVER) {
        ov02_02251B4C(unk);
    } else {
        ov02_02251B70(unk);
    }
}

static void ov02_02251B4C(UnkStruct_ov02_02250BB0 *unk) {
    UnkStruct_ov02_02250BB0_sub38C *sub_38C = &unk->unk_38C;
    Field3dModelAnimation_Unload(&sub_38C->anims[1], &unk->unk_000);
    Field3dModelAnimation_Unload(&sub_38C->anims[0], &unk->unk_000);
    Field3dModel_Unload(&sub_38C->model);
}

static void ov02_02251B70(UnkStruct_ov02_02250BB0 *unk) {
    UnkStruct_ov02_02250BB0_sub43C *sub_43C = &unk->unk_43C;
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG2, GF_PLANE_TOGGLE_OFF);
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG3, GF_PLANE_TOGGLE_OFF);
    for (u8 i = 0; i < 6; ++i) {
        FreeToHeap(sub_43C->bg2ScrnRaw[i]);
        FreeToHeap(sub_43C->bg3ScrnRaw[i]);
    }
}

static void ov02_02251BA8(SysTask *task, void *taskData) {
    UnkStruct_ov02_02250BB0 *unk = (UnkStruct_ov02_02250BB0 *)taskData;
    UnkStruct_ov02_02250BB0_sub38C *sub_38C = &unk->unk_38C;
    modelAnimListAdvanceLooping(sub_38C->anims, 2);
    ov01_021FBF68(&sub_38C->object);
}

static void ov02_02251BC4(SysTask *task, void *taskData) {
    UnkStruct_ov02_02250BB0 *unk = (UnkStruct_ov02_02250BB0 *)taskData;
    UnkStruct_ov02_02250BB0_sub43C *sub_43C = &unk->unk_43C;

    ++sub_43C->switchTilemapDelayTimer;
    if (sub_43C->switchTilemapDelayTimer >= 6) {
        sub_43C->switchTilemapDelayTimer = 0;
        ++sub_43C->tilemapIndex;
        if (sub_43C->tilemapIndex >= 6) {
            sub_43C->tilemapIndex = 0;
        }
        CopyRectToBgTilemapRect(sub_43C->bgConfig, GF_BG_LYR_MAIN_2, 0, 0, 32, 32, sub_43C->bg2ScrnData[sub_43C->tilemapIndex]->rawData, 0, 0, 32, 32);
        CopyRectToBgTilemapRect(sub_43C->bgConfig, GF_BG_LYR_MAIN_3, 0, 0, 32, 32, sub_43C->bg3ScrnData[sub_43C->tilemapIndex]->rawData, 0, 0, 32, 32);
        BgTilemapRectChangePalette(sub_43C->bgConfig, GF_BG_LYR_MAIN_2, 0, 0, 32, 32, 6);
        BgTilemapRectChangePalette(sub_43C->bgConfig, GF_BG_LYR_MAIN_3, 0, 0, 32, 32, 6);
        ScheduleBgTilemapBufferTransfer(sub_43C->bgConfig, GF_BG_LYR_MAIN_2);
        ScheduleBgTilemapBufferTransfer(sub_43C->bgConfig, GF_BG_LYR_MAIN_3);
    }
    --sub_43C->bg2X;
    ++sub_43C->bg3X;
    --sub_43C->bgY;
    ScheduleSetBgPosText(sub_43C->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_SET_X, sub_43C->bg2X);
    ScheduleSetBgPosText(sub_43C->bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_SET_Y, sub_43C->bgY);
    ScheduleSetBgPosText(sub_43C->bgConfig, GF_BG_LYR_MAIN_3, BG_POS_OP_SET_X, sub_43C->bg3X);
    ScheduleSetBgPosText(sub_43C->bgConfig, GF_BG_LYR_MAIN_3, BG_POS_OP_SET_Y, sub_43C->bgY);
}

void ov02_02251CF0(FieldSystem *fieldSystem) {
    LugiaArrivesCutsceneCamera *cam;

    fieldSystem->unk4->legendCutsceneCamera = AllocFromHeapAtEnd(HEAP_ID_4, sizeof(LugiaArrivesCutsceneCamera));
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

void ov02_02251DC4(FieldSystem *fieldSystem) {
    LugiaArrivesCutsceneCamera *cam = fieldSystem->unk4->legendCutsceneCamera;
    GF_ASSERT(cam->gameVersion != VERSION_HEARTGOLD);
    FreeToHeap(fieldSystem->unk4->legendCutsceneCamera);
    fieldSystem->unk4->legendCutsceneCamera = NULL;
}

void ov02_02251DE8(FieldSystem *fieldSystem) {
    CameraTranslationPathTemplate template;
    LugiaArrivesCutsceneCamera *cam = fieldSystem->unk4->legendCutsceneCamera;
    if (cam->gameVersion == VERSION_HEARTGOLD) {
        GF_ASSERT(FALSE);
        return;
    }

    cam->translation = CreateCameraTranslationWrapper(HEAP_ID_4, fieldSystem->camera);
    template.angleX = cam->angle.x;
    template.perspectiveAngle = cam->perspectiveAngle;
    template.position = cam->targetDistanceVec;
    template.distance = cam->distance;
    SetCameraTranslationPath(cam->translation, &template, 30);
    TaskManager_Call(fieldSystem->taskman, ov02_02251E44, fieldSystem);
}

static BOOL ov02_02251E44(TaskManager *taskman) {
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
