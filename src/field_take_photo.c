#include "field_warp_tasks.h"
#include "global.h"
#include "field_take_photo.h"
#include "follow_mon.h"
#include "launch_application.h"
#include "photo_album.h"
#include "script_pokemon_util.h"
#include "task.h"
#include "unk_0200FA24.h"
#include "unk_02055244.h"
#include "unk_020552A4.h"
#include "unk_02067A80.h"
#include "overlay_01_021F944C.h"
#include "overlay_01_021F72DC.h"
#include "overlay_01_021F8D80.h"
#include "overlay_01_022053EC.h"

typedef struct FieldTakePhoto3 {
    int unk_0;
    u8 filler_4[4];
    FieldTakePhoto2 *unk_8;
    u8 unk_C;
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
LocalMapObject *sub_0206AEC0(MapObjectManager *objectMan, u16 species, u16 form, int gender, int direction, int x, int z, BOOL shiny);
LocalMapObject *sub_0206AF08(MapObjectManager *objectMan, int spriteId, int direction, int x, int z, int localId);
void sub_0206AF78(FieldSystem *fieldSystem, PHOTO *photo);
void sub_0206AFA4(FieldTakePhoto *a0);
void sub_0206AFD0(Camera *camera);
void sub_0206B014(PHOTO *photo, FieldSystem *fieldSystem, u8 a2, int a3, int a4, int a5, int a6, int a7, u16 a8, u16 a9);
BOOL sub_0206B270(TaskManager *taskManager);
void sub_0206B82C(PlayerAvatar *playerAvatar, u8 a1, u8 gender);
void sub_0206B880(FieldSystem *fieldSystem, PHOTO *photo);

typedef struct Coord2U16 {
    u16 x;
    u16 y;
} Coord2U16;

const Coord2U16 sLugiaPhotoMonCoordOffsets = {  1, -1 };
const Coord2U16 sPhotoMonCoordOffsets[] = {
    {  2,  0 },
    {  1, -1 },
    { -1, -1 },
    {  3, -1 },
    {  0, -2 },
    {  2, -2 },
};

PhotoCameraParam sCameraParam = {
    .distance = FX32_CONST(666.922119140625),
    .angle.x = 0xEE00,
    .perspectiveType = 0,
    .perspective = 0x230,
    .unk_10 = {
        0x96,
        0x384,
    },
    .lookAt = {
        FX32_CONST(16.3125),
        0,
        FX32_CONST(-47),
    },
};

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
    photo->unk_0B = photo->unk_0C.unk_44 ? 2 : photo->unk_0C.numMons;
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

BOOL sub_0206ABB0(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    FieldTakePhoto3 *taskData = (FieldTakePhoto3 *)TaskManager_GetEnvironment(taskManager);
    PHOTO *photo = &taskData->unk_8->unk_0C;

    switch (taskData->unk_0) {
    case 0:
        sub_02067A80(fieldSystem, 1);
        sub_02014904(photo->hour, photo->min);
        {
        Location location;
        InitLocation(&location, photo->unk_32, -1, photo->unk_34, photo->unk_36, DIR_SOUTH);
        sub_020537A8(taskManager, &location);
        }
        ++taskData->unk_0;
        break;
    case 1:
        CallTask_RestoreOverworld(taskManager);
        ++taskData->unk_0;
        break;
    case 2:
        sub_0206AFD0(fieldSystem->camera);
        sub_0206AF78(fieldSystem, photo);
        sub_0206B880(fieldSystem, photo);
        NNS_G3dGlbSetViewPort(4, 3, 252, 188);
        {
        u8 profileGender = PlayerProfile_GetTrainerGender(Save_PlayerData_GetProfileAddr(FieldSystem_GetSaveData(fieldSystem)));
        sub_0206B82C(fieldSystem->playerAvatar, photo->unk_30, profileGender);
        }
        {
        VecFx32 facingVec;
        MapObject_GetFacingVec(PlayerAvatar_GetMapObject(fieldSystem->playerAvatar), &facingVec);
        facingVec.y -= FX32_CONST(2);
        MapObject_SetFacingVec(PlayerAvatar_GetMapObject(fieldSystem->playerAvatar), &facingVec);
        }
        ++taskData->unk_0;
        break;
    case 3:
        ov01_021F9FB0(fieldSystem->mapObjectManager, sub_0205F1A0(fieldSystem->mapObjectManager));
        ov01_022043D8(fieldSystem->unk_C8);
        ov01_02204424(fieldSystem->unk_C8);
        ov01_021EB1E8(fieldSystem->unk4->unk10);
        if (photo->unk_44) {
            taskData->unk_0 = 6;
        } else {
            taskData->unk_0 = 4;
        }
        break;
    case 4:
    {
        PHOTO_MON *mon = &photo->party[taskData->unk_C];
        if (mon->species != SPECIES_NONE) {
            taskData->unk_8->unk_9C[taskData->unk_C] = sub_0206AEC0(fieldSystem->mapObjectManager, mon->species, mon->form, mon->gender, 1, photo->unk_34 + sPhotoMonCoordOffsets[taskData->unk_C].x, photo->unk_36 + sPhotoMonCoordOffsets[taskData->unk_C].y, mon->shiny);
            sub_0205F47C(taskData->unk_8->unk_9C[taskData->unk_C], ov01_021F7918);
        } else {
            taskData->unk_8->unk_9C[taskData->unk_C] = NULL;
        }
        taskData->unk_0 = 5;
        break;
    }
    case 5:
    {
        LocalMapObject *mapObject = taskData->unk_8->unk_9C[taskData->unk_C];
        if (mapObject != NULL) {
            if (ov01_0220553C(mapObject)) {
                ov01_021F902C(1, mapObject);
            }
            VecFx32 facingVec;
            MapObject_GetFacingVec(mapObject, &facingVec);
            facingVec.y -= FX32_CONST(2);
            MapObject_SetFacingVec(mapObject, &facingVec);
            sub_0205F484(mapObject);
        }
        ++taskData->unk_C;
        if (taskData->unk_C >= photo->numMons) {
            FreeToHeap(taskData);
            return TRUE;
        }
        taskData->unk_0 = 4;
        break;
    }
    case 6:
        taskData->unk_8->unk_9C[0] = sub_0206AF08(fieldSystem->mapObjectManager, photo->unk_44, 1, photo->unk_34 + 2, photo->unk_36, 249);
        taskData->unk_0 = 7;
        break;
    case 7:
    {
        VecFx32 facingVec;
        MapObject_GetFacingVec(taskData->unk_8->unk_9C[0], &facingVec);
        facingVec.y -= FX32_CONST(2);
        MapObject_SetFacingVec(taskData->unk_8->unk_9C[0], &facingVec);
        sub_0205F484(taskData->unk_8->unk_9C[0]);
        taskData->unk_0 = 8;
        break;
    }
    case 8:
    {
        PHOTO_MON *mon = &photo->party[0];
        if (mon->species != SPECIES_NONE) {
            taskData->unk_8->unk_9C[1] = sub_0206AEC0(fieldSystem->mapObjectManager, mon->species, mon->form, mon->gender, 1, photo->unk_34 + sLugiaPhotoMonCoordOffsets.x, photo->unk_36 + sLugiaPhotoMonCoordOffsets.y, mon->shiny);
            sub_0205F47C(taskData->unk_8->unk_9C[1], ov01_021F7918);
        } else {
            taskData->unk_8->unk_9C[1] = NULL;
        }
        taskData->unk_0 = 9;
        break;
    }
    case 9:
        if (taskData->unk_8->unk_9C[1] != NULL) {
            VecFx32 facingVec;
            MapObject_GetFacingVec(taskData->unk_8->unk_9C[1], &facingVec);
            facingVec.y -= FX32_CONST(2);
            MapObject_SetFacingVec(taskData->unk_8->unk_9C[1], &facingVec);
            sub_0205F484(taskData->unk_8->unk_9C[1]);
            LocalMapObject *mapObject = taskData->unk_8->unk_9C[1];
            if (ov01_0220553C(mapObject)) {
                ov01_021F902C(1, mapObject);
            }
        }
        FreeToHeap(taskData);
        return TRUE;
    }

    return FALSE;
}

LocalMapObject *sub_0206AEC0(MapObjectManager *objectMan, u16 species, u16 form, int gender, int direction, int x, int z, BOOL shiny) {
    LocalMapObject *ret = sub_0206AF08(objectMan, FollowMon_GetSpriteID(species, form, gender), direction, x, z, 253);
    MapObject_SetParam(ret, 0, 2);
    FollowMon_SetObjectParams(ret, species, form, shiny);
    return ret;
}

LocalMapObject *sub_0206AF08(MapObjectManager *objectMan, int spriteId, int direction, int x, int z, int localId) {
    LocalMapObject *ret = CreateSpecialFieldObject(objectMan, x, z, direction, spriteId, 0, 1);
    GF_ASSERT(ret != NULL);
    MapObject_SetID(ret, localId);
    MapObject_SetType(ret, 0);
    MapObject_SetFlagID(ret, 0);
    MapObject_SetXRange(ret, -1);
    MapObject_SetYRange(ret, -1);
    MapObject_SetFlagsBits(ret, MAPOBJECTFLAG_UNK10 | MAPOBJECTFLAG_UNK13);
    MapObject_ClearFlagsBits(ret, MAPOBJECTFLAG_UNK7 | MAPOBJECTFLAG_UNK8);
    MapObject_SetFlag29(ret, TRUE);
    return ret;
}

void sub_0206AF78(FieldSystem *fieldSystem, PHOTO *photo) {
    int sp4 = 0;
    LocalMapObject *sp0;
    PlayerAvatar_GetMapObject(fieldSystem->playerAvatar);
    while (sub_0205EEF4(fieldSystem->mapObjectManager, &sp0, &sp4, 1)) {}
}

void sub_0206AFA4(FieldTakePhoto *a0) {
    for (int i = 0; i < a0->unk_CB; ++i) {
        if (a0->unk_18[i] != NULL) {
            MapObject_Remove(a0->unk_18[i]);
        }
    }
}

void sub_0206AFD0(Camera *camera) {
    Camera_SetDistance(sCameraParam.distance, camera);
    Camera_SetAnglePos(&sCameraParam.angle, camera);
    Camera_SetPerspectiveAngle(sCameraParam.perspective, camera);
    Camera_ApplyPerspectiveType(sCameraParam.perspectiveType, camera);
    Camera_OffsetLookAtPosAndTarget(&sCameraParam.lookAt, camera);
}

void sub_0206B014(PHOTO *photo, FieldSystem *fieldSystem, u8 a2, int a3, int a4, int a5, int a6, int a7, u16 a8, u16 a9) {
    int partySize;
    SaveData *saveData = FieldSystem_GetSaveData(fieldSystem);
    PlayerProfile *profile = Save_PlayerData_GetProfileAddr(saveData);
    Party *party = SaveArray_Party_Get(saveData);
    int i;

    Photo_Init(photo);

    RTCDate date;
    GF_RTC_CopyDate(&date);
    photo->date = ((date.year & 0xFF) << 24) | ((date.month & 0xFF) << 16) | ((date.day & 0xFF) << 8) | date.week;

    partySize = Party_GetCount(party);
    CopyU16StringArray(photo->playerName, PlayerProfile_GetNamePtr(profile));
    photo->gender = PlayerProfile_GetTrainerGender(profile);
    photo->unk_30 = PlayerAvatar_GetState(fieldSystem->playerAvatar);
    photo->unk_34 = a4;
    photo->unk_36 = a5;
    photo->unk_32 = a3;
    photo->unk_4_1 = a2;

    RTCTime time;
    GF_RTC_CopyTime(&time);
    photo->hour = time.hour;
    photo->min = time.minute;
    MI_CpuCopy8(&sCameraParam, &photo->unk_48, sizeof(PhotoCameraParam));
    photo->unk_40 = a6;
    photo->unk_42 = a7;
    photo->unk_46 = a8;
    photo->unk_44 = a9;
    photo->numMons = photo->unk_44 ? 1 : partySize;

    Pokemon *leadMon = GetFirstAliveMonInParty_CrashIfNone(party);
    GetMonData(leadMon, MON_DATA_NICKNAME, photo->leadMonNick);
    if (!photo->unk_44) {
        for (i = 0; i < partySize; ++i) {
            Pokemon *mon = Party_GetMonByIndex(party, i);
            if (GetMonData(mon, MON_DATA_IS_EGG, NULL)) {
                photo->party[i].species = SPECIES_NONE;
                photo->party[i].form = 0;
                photo->party[i].shiny = FALSE;
                photo->party[i].gender = 0;
            } else {
                photo->party[i].species = GetMonData(mon, MON_DATA_SPECIES, NULL);
                photo->party[i].form = GetMonData(mon, MON_DATA_FORM, NULL);
                photo->party[i].shiny = MonIsShiny(mon);
                photo->party[i].gender = GetMonData(mon, MON_DATA_GENDER, NULL);
            }
        }
    } else {
        photo->party[0].species = GetMonData(leadMon, MON_DATA_SPECIES, NULL);
        photo->party[0].form = GetMonData(leadMon, MON_DATA_FORM, NULL);
        photo->party[0].shiny = MonIsShiny(leadMon);
        photo->party[0].gender = GetMonData(leadMon, MON_DATA_GENDER, NULL);
        for (i = 1; i < PARTY_SIZE; ++i) {
            photo->party[i].species = SPECIES_NONE;
            photo->party[i].form = 0;
            photo->party[i].shiny = FALSE;
            photo->party[i].gender = 0;
        }
    }
}
