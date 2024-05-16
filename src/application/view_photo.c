#include "global.h"
#include "application/view_photo.h"
#include "unk_020183F0.h"
#include "field_take_photo.h"

typedef struct ViewPhotoSysTaskData {
    HeapID unk_000;
    int unk_004;
    int unk_008;
    int unk_00C;
    SaveData *unk_010;
    FieldSystem *unk_014;
    BgConfig *unk_018;
    FieldTakePhoto2 *unk_01C;
    u8 filler_020[0x3C];
    SpriteList *unk_05C;
    u8 filler_060[0x170];
    UnkStruct_0206A8C0 unk_1D0;
} ViewPhotoSysTaskData;

void ov19_02259950(SysTask *task, void *taskData);
void ov19_022599AC(ViewPhotoSysTaskData *viewPhoto);
void ov19_022599D4(ViewPhotoSysTaskData *viewPhoto);
BOOL ov19_022599F8(ViewPhotoSysTaskData *viewPhoto);
void ov19_02259AD8(ViewPhotoSysTaskData *viewPhoto);
void ov19_02259B90(ViewPhotoSysTaskData *viewPhoto);
void ov19_02259BC0(ViewPhotoSysTaskData *viewPhoto);
void ov19_02259C64(ViewPhotoSysTaskData *viewPhoto);
void ov19_02259C68(ViewPhotoSysTaskData *viewPhoto);
void ov19_02259CBC(ViewPhotoSysTaskData *viewPhoto);
void ov19_02259CF4(ViewPhotoSysTaskData *viewPhoto);
void ov19_02259D24(ViewPhotoSysTaskData *viewPhoto);
void ov19_02259D44(ViewPhotoSysTaskData *viewPhoto);
void ov19_02259DF4(ViewPhotoSysTaskData *viewPhoto);
BOOL ov19_02259E44(ViewPhotoSysTaskData *viewPhoto);
void ov19_02259F64(ViewPhotoSysTaskData *viewPhoto);

SysTask *ov19_022598C0(FieldSystem *fieldSystem) {
    ViewPhotoSysTaskData *viewPhoto = AllocFromHeap(HEAP_ID_FIELD, sizeof(ViewPhotoSysTaskData));
    MI_CpuClear8(viewPhoto, sizeof(ViewPhotoSysTaskData));
    viewPhoto->unk_000 = HEAP_ID_FIELD;
    viewPhoto->unk_014 = fieldSystem;
    viewPhoto->unk_018 = fieldSystem->bgConfig;
    viewPhoto->unk_010 = fieldSystem->saveData;
    viewPhoto->unk_01C = fieldSystem->unk_DC;
    viewPhoto->unk_008 = sub_020183F0(&fieldSystem->unk_10C);
    sub_0206A8C0(viewPhoto->unk_01C, &viewPhoto->unk_1D0);
    return SysTask_CreateOnMainQueue(ov19_02259950, viewPhoto, 1);
}

void ov19_02259918(FieldSystem *fieldSystem) {
    ViewPhotoSysTaskData *viewPhoto = (ViewPhotoSysTaskData *)SysTask_GetData(fieldSystem->unk_D8);

    sub_02018410(&fieldSystem->unk_10C, viewPhoto->unk_008);
    ov19_022599D4(viewPhoto);
    FreeToHeap(viewPhoto);
    SysTask_Destroy(fieldSystem->unk_D8);
    fieldSystem->unk_D8 = NULL;
}

void ov19_02259950(SysTask *task, void *taskData) {
    ViewPhotoSysTaskData *viewPhoto = (ViewPhotoSysTaskData *)taskData;
    switch (viewPhoto->unk_004) {
    case 0:
        ov19_022599AC(viewPhoto);
        ++viewPhoto->unk_004;
        return;
    case 1:
        if (GX_GetMasterBrightness() == 0 && ov19_022599F8(viewPhoto)) {
            ++viewPhoto->unk_004;
        }
        break;
    case 2:
        if (ov19_02259E44(viewPhoto)) {
            sub_0206A8DC(viewPhoto->unk_01C, viewPhoto->unk_00C);
        }
        break;
    }
    sub_0202457C(viewPhoto->unk_05C);
}

void ov19_022599AC(ViewPhotoSysTaskData *viewPhoto) {
    ov19_02259AD8(viewPhoto);
    ov19_02259BC0(viewPhoto);
    ov19_02259C68(viewPhoto);
    ov19_02259CF4(viewPhoto);
    ov19_02259D44(viewPhoto);
    ov19_02259F64(viewPhoto);
}

void ov19_022599D4(ViewPhotoSysTaskData *viewPhoto) {
    ov19_02259DF4(viewPhoto);
    ov19_02259D24(viewPhoto);
    ov19_02259CBC(viewPhoto);
    ov19_02259C64(viewPhoto);
    ov19_02259B90(viewPhoto);
}
