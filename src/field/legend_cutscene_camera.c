#include "field_map_object.h"
#include "global.h"
#include "field/legend_cutscene_camera.h"
#include "camera_translation.h"
#include "field/overlay_01_021E66E4.h"
#include "field/overlay_01_021FB878.h"
#include "task.h"

typedef struct UnkStruct_ov02_02250BB0 {
    NNSFndAllocator unk_000;
    u8 unk_010;
    u8 unk_011;
    u16 unk_012;
    UnkStruct_ov01_021FBCD8 unk_014;
    UnkStruct_ov01_021FBCD8 unk_024;
    UnkStruct_ov01_021FBCD8 unk_034;
    UnkStruct_ov01_021FBE44 unk_044[3];
    UnkStruct_ov01_021FBE44 unk_080[2];
    UnkStruct_ov01_021FBE44 unk_0A8[1];
    UnkStruct_ov01_021FBF2C unk_0BC;
    UnkStruct_ov01_021FBF2C unk_134;
    UnkStruct_ov01_021FBF2C unk_1AC[4];
    u8 filler_38C[0x120];
    u32 unk_4AC;
    const u16 *unk_4B0;
    const VecFx32 *unk_4B4;
} UnkStruct_ov02_02250BB0;  // size: 0x4B8

typedef struct UnkStruct_ov02_02250B80 {
    NNSFndAllocator unk_00;
    UnkStruct_ov01_021FBCD8 unk_10;
    UnkStruct_ov01_021FBE44 unk_20;
    UnkStruct_ov01_021FBE44 unk_34;
    UnkStruct_ov01_021FBE44 unk_48;
    UnkStruct_ov01_021FBF2C unk_5C;
    int unk_D4;
} UnkStruct_ov02_02250B80;

void ov02_02250B44(FieldSystem *fieldSystem);
BOOL ov02_02250B58(TaskManager *taskman);
void ov02_02250BB0(LegendCutsceneCamera *cam);
void ov02_02250BC4(UnkStruct_Overlay01_021E66E4_subC *a0, FieldSystem *a1, void *a2);
void ov02_02250EC0(UnkStruct_Overlay01_021E66E4_subC *a0, FieldSystem *fieldSystem, void *a2);
void ov02_02250F1C(UnkStruct_Overlay01_021E66E4_subC *a0, struct FieldSystem *a1, void *a2);
void ov02_02250FE0(UnkStruct_Overlay01_021E66E4_subC *a0, struct FieldSystem *a1, void *a2);
void ov02_02251018(UnkStruct_ov02_02250BB0 *a0);
void ov02_022510D4(UnkStruct_ov01_021FBE44 *a0, u32 a1, fx32 a2);
BOOL ov02_022510FC(UnkStruct_ov01_021FBE44 *a0, u32 a1);
void ov02_02251138(UnkStruct_ov01_021FBE44 *a0, u32 a1);
void ov02_02251164(UnkStruct_ov02_02250BB0 *a0, int a1);
void ov02_022511AC(HeapID heapId, FieldSystem *fieldSystem, UnkStruct_ov02_02250B80 *a2);
BOOL ov02_022512AC(TaskManager *taskman);
BOOL ov02_02251320(TaskManager *taskman);

extern const UnkStruct_Overlay01_021E67BC_template ov02_02253B4C;
extern const u16 ov02_02253BD0[];
extern const u16 ov02_02253C20[];
extern const VecFx32 ov02_02253B64[];
extern const VecFx32 ov02_02253B94[];

void ov02_02250A60(FieldSystem *fieldSystem) {
    LegendCutsceneCamera *cam;

    fieldSystem->unk4->legendCutsceneCamera = AllocFromHeapAtEnd(HEAP_ID_4, sizeof(LegendCutsceneCamera));
    cam = fieldSystem->unk4->legendCutsceneCamera;

    cam->unk_08 = CreateCameraTranslationWrapper(HEAP_ID_4, fieldSystem->camera);
    cam->gameVersion = gGameVersion;
    cam->unk_0C = Camera_GetLookAtCamTarget(fieldSystem->camera);
    cam->unk_18 = Camera_GetLookAtCamPos(fieldSystem->camera);
    cam->unk_00 = fieldSystem->unk4->unk4;
    ov02_02250BB0(cam);
}

void ov02_02250AC8(FieldSystem *fieldSystem) {
    DeleteCameraTranslationWrapper(fieldSystem->unk4->legendCutsceneCamera->unk_08);
    FreeToHeap(fieldSystem->unk4->legendCutsceneCamera);
    fieldSystem->unk4->legendCutsceneCamera = NULL;
}

void ov02_02250AE8(FieldSystem *fieldSystem) {
    UnkStruct_ov02_02250BB0 *unk = (UnkStruct_ov02_02250BB0 *)ov01_021E687C(fieldSystem->unk4->legendCutsceneCamera->unk_04);
    unk->unk_010 = 1;
}

void ov02_02250AFC(FieldSystem *fieldSystem, u8 a1) {
    UnkStruct_ov02_02250BB0 *unk = (UnkStruct_ov02_02250BB0 *)ov01_021E687C(fieldSystem->unk4->legendCutsceneCamera->unk_04);
    if (unk->unk_010 != 3) {
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

void ov02_02250B44(FieldSystem *fieldSystem) {
    UnkStruct_ov02_02250BB0 *unk = (UnkStruct_ov02_02250BB0 *)ov01_021E687C(fieldSystem->unk4->legendCutsceneCamera->unk_04);
    unk->unk_010 = 4;
}

BOOL ov02_02250B58(TaskManager *taskman) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskman);
    UnkStruct_ov02_02250BB0 *unk = (UnkStruct_ov02_02250BB0 *)ov01_021E687C(fieldSystem->unk4->legendCutsceneCamera->unk_04);
    if (unk->unk_010 == 3) {
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

void ov02_02250BB0(LegendCutsceneCamera *cam) {
    cam->unk_04 = ov01_021E67BC(cam->unk_00, &ov02_02253B4C);
}

void ov02_02250BC4(UnkStruct_Overlay01_021E66E4_subC *a0, FieldSystem *fieldSystem, void *a2) {
    UnkStruct_ov02_02250BB0 *r5 = (UnkStruct_ov02_02250BB0 *)a2;
    r5->unk_012 = fieldSystem->unk4->legendCutsceneCamera->gameVersion;
    GF_ExpHeap_FndInitAllocator(&r5->unk_000, HEAP_ID_4, 0x20);
    ov01_021FBCD8(&r5->unk_014, NARC_a_1_7_4, 18, HEAP_ID_4);
    ov01_021FBCD8(&r5->unk_024, NARC_a_1_7_4, 25, HEAP_ID_4);
    ov01_021FBCD8(&r5->unk_034, NARC_a_1_7_4, 32, HEAP_ID_4);
    ov01_021FBE44(&r5->unk_044[0], &r5->unk_014, NARC_a_1_7_4, 19, HEAP_ID_4, &r5->unk_000);
    ov01_021FBE44(&r5->unk_044[1], &r5->unk_014, NARC_a_1_7_4, 20, HEAP_ID_4, &r5->unk_000);
    ov01_021FBE44(&r5->unk_044[2], &r5->unk_014, NARC_a_1_7_4, 21, HEAP_ID_4, &r5->unk_000);
    ov01_021FBE44(&r5->unk_080[0], &r5->unk_024, NARC_a_1_7_4, 26, HEAP_ID_4, &r5->unk_000);
    ov01_021FBE44(&r5->unk_080[1], &r5->unk_024, NARC_a_1_7_4, 27, HEAP_ID_4, &r5->unk_000);
    ov01_021FBE44(&r5->unk_0A8[0], &r5->unk_034, NARC_a_1_7_4, 33, HEAP_ID_4, &r5->unk_000);
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
    ov02_022510D4(r5->unk_044, 3, 0);
    ov02_022510D4(r5->unk_080, 2, 0);
    ov02_022510D4(r5->unk_0A8, 1, 0);

    VecFx32 pos;
    MapObject_GetPositionVec(PlayerAvatar_GetMapObject(fieldSystem->playerAvatar), &pos);
    ov01_021FC00C(&r5->unk_0BC, pos.x, pos.y, pos.z);
    ov01_021FC00C(&r5->unk_134, pos.x, pos.y, pos.z);
    if (r5->unk_012 == 8) {
        ov01_021FC00C(&r5->unk_1AC[0], pos.x + FX32_CONST(128), pos.y + FX32_CONST(32), pos.z - FX32_CONST(180));
        ov01_021FC00C(&r5->unk_1AC[1], pos.x - FX32_CONST(128), pos.y + FX32_CONST(32), pos.z - FX32_CONST(180));
        ov01_021FC00C(&r5->unk_1AC[2], 0, 0, 0);
        ov01_021FC00C(&r5->unk_1AC[3], 0, 0, 0);
        r5->unk_4AC = 0x131;
        r5->unk_4B0 = ov02_02253C20;
        r5->unk_4B4 = ov02_02253B94;
    } else {
        ov01_021FC00C(&r5->unk_1AC[0], pos.x + FX32_CONST(200), pos.y - FX32_CONST(73), pos.z + FX32_CONST(144));
        ov01_021FC00C(&r5->unk_1AC[1], pos.x - FX32_CONST(198), pos.y - FX32_CONST(73), pos.z + FX32_CONST(144));
        ov01_021FC00C(&r5->unk_1AC[2], pos.x + FX32_CONST(200), pos.y - FX32_CONST(73), pos.z - FX32_CONST(270));
        ov01_021FC00C(&r5->unk_1AC[3], pos.x - FX32_CONST(198), pos.y - FX32_CONST(73), pos.z - FX32_CONST(270));
        r5->unk_4AC = 0x130;
        r5->unk_4B0 = ov02_02253BD0;
        r5->unk_4B4 = ov02_02253B64;
    }
    r5->unk_010 = 0;
}

void ov02_02250EC0(UnkStruct_Overlay01_021E66E4_subC *a0, FieldSystem *fieldSystem, void *a2) {
    UnkStruct_ov02_02250BB0 *r4 = (UnkStruct_ov02_02250BB0 *)a2;
    ov01_021FBE80(&r4->unk_044[2], &r4->unk_000);
    ov01_021FBE80(&r4->unk_044[1], &r4->unk_000);
    ov01_021FBE80(&r4->unk_044[0], &r4->unk_000);
    ov01_021FBE80(&r4->unk_080[1], &r4->unk_000);
    ov01_021FBE80(&r4->unk_080[0], &r4->unk_000);
    ov01_021FBE80(&r4->unk_0A8[0], &r4->unk_000);
    ov01_021FBDA8(&r4->unk_014);
    ov01_021FBDA8(&r4->unk_024);
    ov01_021FBDA8(&r4->unk_034);
}

void ov02_02250F1C(UnkStruct_Overlay01_021E66E4_subC *a0, struct FieldSystem *a1, void *a2) {
    UnkStruct_ov02_02250BB0 *r4 = (UnkStruct_ov02_02250BB0 *)a2;

    switch (r4->unk_010) {
    case 0:
        break;
    case 1:
        ov01_021FC004(&r4->unk_0BC, 1);
        r4->unk_010 = 2;
        break;
    case 2:
        if (ov02_022510FC(r4->unk_044, 3)) {
            ov02_02251018(r4);
            r4->unk_010 = 3;
        }
        break;
    case 3:
        ov02_02251138(r4->unk_044, 3);
        break;
    case 4:
        ov01_021FC004(&r4->unk_0BC, 0);
        ov02_02251164(r4, 1);
        ov02_022510D4(r4->unk_080, 2, 0);
        ov02_022510D4(r4->unk_0A8, 1, 0);
        r4->unk_010 = 5;
        break;
    case 5:
        ov02_02251138(r4->unk_044, 3);
        ov02_022510FC(r4->unk_0A8, 1);
        if (ov02_022510FC(r4->unk_080, 2)) {
            ov02_02251164(r4, 0);
            ov01_021FC004(&r4->unk_0BC, 1);
            r4->unk_010 = 3;
        }
        break;
    }
}

void ov02_02250FE0(UnkStruct_Overlay01_021E66E4_subC *a0, struct FieldSystem *a1, void *a2) {
    UnkStruct_ov02_02250BB0 *r4 = (UnkStruct_ov02_02250BB0 *)a2;

    ov01_021FBF68(&r4->unk_0BC);
    ov01_021FBF68(&r4->unk_134);
    for (u8 i = 0; i < 4; ++i) {
        ov01_021FBF68(&r4->unk_1AC[i]);
    }
}

void ov02_02251018(UnkStruct_ov02_02250BB0 *a0) {
    ov01_021FBF5C(&a0->unk_0BC, &a0->unk_044[0]);
    ov01_021FBF5C(&a0->unk_0BC, &a0->unk_044[1]);
    ov01_021FBF5C(&a0->unk_0BC, &a0->unk_044[2]);
    ov01_021FBE80(&a0->unk_044[2], &a0->unk_000);
    ov01_021FBE80(&a0->unk_044[1], &a0->unk_000);
    ov01_021FBE80(&a0->unk_044[0], &a0->unk_000);
    ov01_021FBE44(&a0->unk_044[0], &a0->unk_014, NARC_a_1_7_4, 22, HEAP_ID_4, &a0->unk_000);
    ov01_021FBE44(&a0->unk_044[1], &a0->unk_014, NARC_a_1_7_4, 23, HEAP_ID_4, &a0->unk_000);
    ov01_021FBE44(&a0->unk_044[2], &a0->unk_014, NARC_a_1_7_4, 24, HEAP_ID_4, &a0->unk_000);
    ov01_021FBF50(&a0->unk_0BC, &a0->unk_044[0]);
    ov01_021FBF50(&a0->unk_0BC, &a0->unk_044[1]);
    ov01_021FBF50(&a0->unk_0BC, &a0->unk_044[2]);
    ov02_022510D4(a0->unk_044, 3, 0);
}

void ov02_022510D4(UnkStruct_ov01_021FBE44 *a0, u32 a1, fx32 a2) {
    for (u8 i = 0; i < a1; ++i) {
        ov01_021FBF20(&a0[i], a2);
    }
}

BOOL ov02_022510FC(UnkStruct_ov01_021FBE44 *a0, u32 a1) {
    u8 i, n = 0;
    for (i = 0; i < a1; ++i) {
        if (ov01_021FBEE4(&a0[i], FX32_ONE)) {
            ++n;
        }
    }
    return n == a1;
}

void ov02_02251138(UnkStruct_ov01_021FBE44 *a0, u32 a1) {
    for (u8 i = 0; i < a1; ++i) {
        ov01_021FBEAC(&a0[i], FX32_ONE);
    }
}

void ov02_02251164(UnkStruct_ov02_02250BB0 *a0, int a1) {
    u32 r5 = a0->unk_012 == 8 ? 2 : 4;
    ov01_021FC004(&a0->unk_134, a1);
    if (!a0->unk_011) {
        for (u8 i = 0; i < r5; ++i) {
            ov01_021FC004(&a0->unk_1AC[i], a1);
        }
    }
}
