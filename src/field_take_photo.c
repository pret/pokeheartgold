#include "field_warp_tasks.h"
#include "global.h"
#include "field_take_photo.h"
#include "follow_mon.h"
#include "launch_application.h"
#include "photo_album.h"
#include "task.h"
#include "unk_0200FA24.h"
#include "unk_02055244.h"
#include "unk_02067A80.h"

typedef struct FieldTakePhoto3 {
    u8 filler_0[8];
    FieldTakePhoto2 *unk_8;
    u8 filler_C[4];
} FieldTakePhoto3;

BOOL sub_0206A8E4(TaskManager *taskManager);
int sub_0206A9A0(FieldSystem *fieldSystem, TaskManager *taskManager, FieldTakePhoto2 *photo);
int sub_0206A9B4(FieldSystem *fieldSystem, TaskManager *taskManager, FieldTakePhoto2 *photo);
int sub_0206A9E8(FieldSystem *fieldSystem, TaskManager *taskManager, FieldTakePhoto2 *photo);
int sub_0206AA4C(FieldSystem *fieldSystem, TaskManager *taskManager, FieldTakePhoto2 *photo);
int sub_0206AAD4(FieldSystem *fieldSystem, TaskManager *taskManager, FieldTakePhoto2 *photo);
int sub_0206AAE4(FieldSystem *fieldSystem, TaskManager *taskManager, FieldTakePhoto2 *photo);
int sub_0206AB2C(FieldSystem *fieldSystem, TaskManager *taskManager, FieldTakePhoto2 *photo);
int sub_0206AB78(FieldSystem *fieldSystem, TaskManager *taskManager, FieldTakePhoto2 *photo);
BOOL sub_0206ABB0(TaskManager *taskManager);
void sub_0206B014(PHOTO *photo, FieldSystem *fieldSystem, u8 a2, u16 a3, u16 a4, u16 a5, u16 a6, u16 a7, u8 a8, u16 a9);
BOOL sub_0206B270(TaskManager *taskManager);

void FieldSystem_TakePhoto(FieldSystem *fieldSystem, u16 photo_id) {
    FieldTakePhoto *photo = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(FieldTakePhoto));
    MI_CpuFill8(photo, 0, sizeof(FieldTakePhoto));
    photo->unk_14 = 0;
    photo->unk_15 = 0;
    photo->unk_17 = 0;
    photo->unk_30 = GetPlayerXCoord(fieldSystem->playerAvatar);
    photo->unk_32 = GetPlayerYCoord(fieldSystem->playerAvatar);
    photo->unk_34 = PlayerAvatar_GetFacingDirection(fieldSystem->playerAvatar);
    photo->unk_36 = fieldSystem->location->mapId;
    if (FollowMon_IsActive(fieldSystem)) {
        LocalMapObject *followMonObj = FollowMon_GetMapObject(fieldSystem);
        MapObject_GetPositionVec(followMonObj, &photo->unk_CC);
        photo->unk_D8 = MapObject_GetFacingDirection(followMonObj);
    }
    if (PhotoAlbum_GetIndexOfFirstEmptySlot(Save_PhotoAlbum_Get(FieldSystem_GetSaveData(fieldSystem))) != 0xFF) {
        PHOTO_DAT sp18;
        ReadWholeNarcMemberByIdPair(&sp18, NARC_a_2_5_4, photo_id);
        sub_0206B014(&photo->unk_44, fieldSystem, sp18.unk2, sp18.unk0, sp18.unk4, sp18.unk6, sp18.unkC, sp18.unkE, sp18.unk9, sp18.unkA);
        photo->unk_40 = &photo->unk_44;
        TaskManager_Call(fieldSystem->taskman, sub_0206B270, photo);
    }
}

void sub_0206A860(FieldSystem *fieldSystem) {
    FieldTakePhoto2 *photo = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(FieldTakePhoto2));
    MI_CpuFill8(photo, 0, sizeof(FieldTakePhoto2));
    photo->unk_94 = GetPlayerXCoord(fieldSystem->playerAvatar);
    photo->unk_96 = GetPlayerYCoord(fieldSystem->playerAvatar);
    photo->unk_98 = PlayerAvatar_GetFacingDirection(fieldSystem->playerAvatar);
    photo->unk_9A = fieldSystem->location->mapId;
    photo->unk_B8 = Save_PhotoAlbum_Get(fieldSystem->saveData);
    TaskManager_Call(fieldSystem->taskman, sub_0206A8E4, photo);
}

void sub_0206A8C0(FieldTakePhoto2 *a0, UnkStruct_0206A8C0 *a1) {
    a1->unk_0 = &a0->unk_0C;
    a1->unk_4 = a0->unk_0A;
    a1->unk_5 = PhotoAlbum_GetNumSaved(a0->unk_B8);
}

void sub_0206A8DC(FieldTakePhoto2 *a0, int a1) {
    a0->unk_90 = a1;
}

BOOL sub_0206A8E4(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    FieldTakePhoto2 *photo = (FieldTakePhoto2 *)TaskManager_GetEnvironment(taskManager);

    switch (photo->unk_00) {
    case 0:
        photo->unk_00 = sub_0206A9A0(fieldSystem, taskManager, photo);
        break;
    case 1:
        photo->unk_00 = sub_0206A9B4(fieldSystem, taskManager, photo);
        break;
    case 2:
        photo->unk_00 = sub_0206A9E8(fieldSystem, taskManager, photo);
        break;
    case 3:
        photo->unk_00 = sub_0206AAE4(fieldSystem, taskManager, photo);
        break;
    case 4:
        photo->unk_00 = sub_0206AAD4(fieldSystem, taskManager, photo);
        break;
    case 5:
        photo->unk_00 = sub_0206AB2C(fieldSystem, taskManager, photo);
        break;
    case 6:
        photo->unk_00 = sub_0206AA4C(fieldSystem, taskManager, photo);
        break;
    case 7:
        photo->unk_00 = sub_0206AB78(fieldSystem, taskManager, photo);
        break;
    case 8:
        sub_02067A80(fieldSystem, 0);
        FreeToHeap(photo);
        return TRUE;
    }

    return FALSE;
}

int sub_0206A9A0(FieldSystem *fieldSystem, TaskManager *taskManager, FieldTakePhoto2 *photo) {
    photo->unk_B4 = PhotoAlbum_LaunchApp(fieldSystem, 0, photo->unk_0A);
    return 1;
}

int sub_0206A9B4(FieldSystem *fieldSystem, TaskManager *taskManager, FieldTakePhoto2 *photo) {
    if (FieldSystem_ApplicationIsRunning(fieldSystem)) {
        return 1;
    }
    int r4;
    PhotoAlbumArgs *unk_B4 = photo->unk_B4;
    photo->unk_08 = r4 = unk_B4->unk1;
    photo->unk_0A = unk_B4->unk2;
    FreeToHeap(photo->unk_B4);
    if (r4 == 1) {
        return 2;
    } else {
        return 7;
    }
}

int sub_0206A9E8(FieldSystem *fieldSystem, TaskManager *taskManager, FieldTakePhoto2 *photo) {
    FieldTakePhoto3 *taskData = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(FieldTakePhoto3));
    MI_CpuClear8(taskData, sizeof(FieldTakePhoto3));
    PhotoAlbum_GetPhotoByIndex(photo->unk_B8, &photo->unk_0C, photo->unk_0A);
    photo->unk_0B = photo->unk_0C.unk_44 ? 2 : photo->unk_0C.is_init;
    photo->unk_90 = 0;
    taskData->unk_8 = photo;
    photo->unk_09 = fieldSystem->unk70;
    fieldSystem->unk70 = 5;
    fieldSystem->unk_DC = photo;
    TaskManager_Call(fieldSystem->taskman, sub_0206ABB0, taskData);
    return 3;
}

int sub_0206AA4C(FieldSystem *fieldSystem, TaskManager *taskManager, FieldTakePhoto2 *photo) {
    switch (photo->unk_04) {
    case 0:
        sub_020148F4();
        for (int i = 0; i < photo->unk_0B; ++i) {
            if (photo->unk_9C[i] != 0) {
                MapObject_Remove(photo->unk_9C[i]);
                photo->unk_9C[i] = NULL;
            }
        }
        sub_0205525C(taskManager);
        ++photo->unk_04;
        break;
    case 1:
        fieldSystem->unk70 = photo->unk_09;
        fieldSystem->unk_DC = NULL;
        photo->unk_04 = 0;
        switch (photo->unk_90) {
        case 2:
            --photo->unk_0A;
            return 2;
        case 3:
            ++photo->unk_0A;
            return 2;
        default:
            return 0;
        }
    }

    return 6;
}

int sub_0206AAD4(FieldSystem *fieldSystem, TaskManager *taskManager, FieldTakePhoto2 *photo) {
    if (photo->unk_90 == 0) {
        return 4;
    } else {
        return 5;
    }
}

int sub_0206AAE4(FieldSystem *fieldSystem, TaskManager *taskManager, FieldTakePhoto2 *photo) {
    switch (photo->unk_04) {
    case 0:
        BeginNormalPaletteFade(0, 1, 1, RGB_BLACK, 6, 1, HEAP_ID_FIELD);
        ++photo->unk_04;
        break;
    case 1:
        if (IsPaletteFadeFinished()) {
            photo->unk_04 = 0;
            return 4;
        }
        break;
    }

    return 3;
}

int sub_0206AB2C(FieldSystem *fieldSystem, TaskManager *taskManager, FieldTakePhoto2 *photo) {
    switch (photo->unk_04) {
    case 0:
        BeginNormalPaletteFade(0, 0, 0, RGB_BLACK, 6, 1, HEAP_ID_FIELD);
        ++photo->unk_04;
        break;
    case 1:
        if (IsPaletteFadeFinished()) {
            photo->unk_04 = 0;
            return 6;
        }
        break;
    }

    return 5;
}

int sub_0206AB78(FieldSystem *fieldSystem, TaskManager *taskManager, FieldTakePhoto2 *photo) {
    Location location;

    InitLocation(&location, photo->unk_9A, -1, photo->unk_94, photo->unk_96, photo->unk_98);
    sub_020537A8(taskManager, &location);
    return 8;
}
