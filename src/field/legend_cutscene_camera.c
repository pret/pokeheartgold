#include "global.h"
#include "field/legend_cutscene_camera.h"
#include "camera_translation.h"
#include "field/overlay_01_021E66E4.h"
#include "task.h"

typedef struct UnkStruct_ov02_02250BB0 {
    u8 filler_000[0x10];
    u8 unk_010;
    u8 unk_011;
    u8 filler_012[0x4A6];
} UnkStruct_ov02_02250BB0;  // size: 0x4B8

void ov02_02250B44(FieldSystem *fieldSystem);
BOOL ov02_02250B58(TaskManager *taskman);
void ov02_02250BB0(LegendCutsceneCamera *cam);
BOOL ov02_02251320(TaskManager *taskman);

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
