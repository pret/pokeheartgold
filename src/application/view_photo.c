#include "global.h"
#include "application/view_photo.h"
#include "system.h"
#include "touchscreen.h"
#include "unk_02005D10.h"
#include "unk_020183F0.h"
#include "field_take_photo.h"

typedef enum ViewPhotoInputResponse {
    INPUT_NOTHING,
    INPUT_END,
    INPUT_PREV,
    INPUT_NEXT,
} ViewPhotoInputResponse;

typedef struct ViewPhotoSysTaskData {
    HeapID unk_000;
    int unk_004;
    int unk_008;
    ViewPhotoInputResponse unk_00C;
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
ViewPhotoInputResponse ov19_022599F8(ViewPhotoSysTaskData *viewPhoto);
ViewPhotoInputResponse ov19_02259A94(ViewPhotoSysTaskData *viewPhoto);
ViewPhotoInputResponse ov19_02259ABC(ViewPhotoSysTaskData *viewPhoto);
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
void ov19_02259E20(ViewPhotoSysTaskData *viewPhoto, int command);
BOOL ov19_02259E44(ViewPhotoSysTaskData *viewPhoto);
void ov19_02259F64(ViewPhotoSysTaskData *viewPhoto);

extern const TouchscreenHitbox ov19_0225A05E[3];

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
        if (GX_GetMasterBrightness() == 0 && ov19_022599F8(viewPhoto) != INPUT_NOTHING) {
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

ViewPhotoInputResponse ov19_022599F8(ViewPhotoSysTaskData *viewPhoto) {
    ViewPhotoInputResponse response = ov19_02259ABC(viewPhoto);
    if (response == INPUT_NOTHING) {
        response = ov19_02259A94(viewPhoto);
        if (response == INPUT_NOTHING) {
            viewPhoto->unk_008 = FALSE;
        }
    } else {
        viewPhoto->unk_008 = TRUE;
    }
    switch (response) {
    case INPUT_END:
        ov19_02259E20(viewPhoto, 0);
        PlaySE(SEQ_SE_DP_DECIDE);
        viewPhoto->unk_00C = INPUT_END;
        break;
    case INPUT_PREV:
        if (viewPhoto->unk_1D0.unk_4 == 0) {
            return INPUT_NOTHING;
        }
        ov19_02259E20(viewPhoto, 1);
        PlaySE(SEQ_SE_DP_SELECT);
        viewPhoto->unk_00C = INPUT_PREV;
        break;
    case INPUT_NEXT:
        if (viewPhoto->unk_1D0.unk_4 >= viewPhoto->unk_1D0.unk_5 - 1) {
            return INPUT_NOTHING;
        }
        ov19_02259E20(viewPhoto, 2);
        PlaySE(SEQ_SE_DP_SELECT);
        viewPhoto->unk_00C = INPUT_NEXT;
        break;
    default:
        return INPUT_NOTHING;
    }

    return response;
}

ViewPhotoInputResponse ov19_02259A94(ViewPhotoSysTaskData *viewPhoto) {
    if (gSystem.newKeys & (PAD_BUTTON_A | PAD_BUTTON_B)) {
        return INPUT_END;
    } else if (gSystem.newKeys & PAD_KEY_LEFT) {
        return INPUT_PREV;
    } else if (gSystem.newKeys & PAD_KEY_RIGHT) {
        return INPUT_NEXT;
    } else {
        return INPUT_NOTHING;
    }
}

ViewPhotoInputResponse ov19_02259ABC(ViewPhotoSysTaskData *viewPhoto) {
    int hitbox = TouchscreenHitbox_FindRectAtTouchNew(ov19_0225A05E);
    if (hitbox == -1) {
        return INPUT_NOTHING;
    }

    return (ViewPhotoInputResponse)(hitbox + 1);
}
