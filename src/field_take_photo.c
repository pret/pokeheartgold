#include "global.h"
#include "field_take_photo.h"
#include "follow_mon.h"
#include "photo_album.h"
#include "task.h"

BOOL sub_0206A8E4(TaskManager *taskManager);
void sub_0206B014(FieldTakePhoto_Sub44 *photo, FieldSystem *fieldSystem, u8 a2, u16 a3, u16 a4, u16 a5, u16 a6, u16 a7, u8 a8, u16 a9);
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
        PhotoArcData sp18;
        ReadWholeNarcMemberByIdPair(&sp18, NARC_a_2_5_4, photo_id);
        sub_0206B014(&photo->unk_44, fieldSystem, sp18.unk_2, sp18.unk_0, sp18.unk_4, sp18.unk_6, sp18.unk_C, sp18.unk_E, sp18.unk_9, sp18.unk_A);
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
