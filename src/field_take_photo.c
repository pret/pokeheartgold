#include "field_warp_tasks.h"
#include "gf_gfx_loader.h"
#include "global.h"
#include "field_take_photo.h"
#include "follow_mon.h"
#include "launch_application.h"
#include "overlay_01_021F1348.h"
#include "overlay_01_021FB4C0.h"
#include "photo_album.h"
#include "script_pokemon_util.h"
#include "task.h"
#include "unk_02005D10.h"
#include "unk_0200FA24.h"
#include "unk_02055244.h"
#include "unk_020552A4.h"
#include "unk_02067A80.h"
#include "overlay_01_021F944C.h"
#include "overlay_01_021F72DC.h"
#include "overlay_01_021F8D80.h"
#include "overlay_01_022053EC.h"
#include "unk_02054E00.h"
#include "constants/scrcmd.h"

typedef struct FieldTakePhoto3 {
    int unk_0;
    u8 filler_4[4];
    FieldViewPhoto *unk_8;
    u8 placeObjectCounter;
} FieldTakePhoto3;

static BOOL sub_0206A8E4(TaskManager *taskManager);
static int sub_0206A9A0(FieldSystem *fieldSystem, TaskManager *taskManager, FieldViewPhoto *photo);
static int sub_0206A9B4(FieldSystem *fieldSystem, TaskManager *taskManager, FieldViewPhoto *photo);
static int sub_0206A9E8(FieldSystem *fieldSystem, TaskManager *taskManager, FieldViewPhoto *photo);
static int sub_0206AA4C(FieldSystem *fieldSystem, TaskManager *taskManager, FieldViewPhoto *photo);
static int sub_0206AAD4(FieldSystem *fieldSystem, TaskManager *taskManager, FieldViewPhoto *photo);
static int sub_0206AAE4(FieldSystem *fieldSystem, TaskManager *taskManager, FieldViewPhoto *photo);
static int sub_0206AB2C(FieldSystem *fieldSystem, TaskManager *taskManager, FieldViewPhoto *photo);
static int sub_0206AB78(FieldSystem *fieldSystem, TaskManager *taskManager, FieldViewPhoto *photo);
static BOOL sub_0206ABB0(TaskManager *taskManager);
static LocalMapObject *sub_0206AEC0(MapObjectManager *objectMan, u16 species, u16 form, int gender, int direction, int x, int y, BOOL shiny);
static LocalMapObject *sub_0206AF08(MapObjectManager *objectMan, int spriteId, int direction, int x, int y, int localId);
static void sub_0206AF78(FieldSystem *fieldSystem, PHOTO *photo);
static void sub_0206AFA4(FieldTakePhoto *takePhoto);
static void sub_0206AFD0(Camera *camera);
static void sub_0206B014(PHOTO *photo, FieldSystem *fieldSystem, u8 a2, int a3, int a4, int a5, int a6, int a7, u16 a8, u16 a9);
static BOOL sub_0206B270(TaskManager *taskManager);
static void sub_0206B82C(PlayerAvatar *playerAvatar, u8 state, u8 gender);
static void sub_0206B880(FieldSystem *fieldSystem, PHOTO *photo);
static void sub_0206B8AC(BgConfig *bgConfig, HeapID heapId);

typedef struct Coord2U16 {
    u16 x;
    u16 y;
} Coord2U16;

static const Coord2U16 sSoloPhotoMonCoordOffsets = {  1, -1 };
static const Coord2U16 sPhotoMonCoordOffsets[] = {
    {  2,  0 },
    {  1, -1 },
    { -1, -1 },
    {  3, -1 },
    {  0, -2 },
    {  2, -2 },
};

static PhotoCameraParam sCameraParam = {
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
    photo->savedX = GetPlayerXCoord(fieldSystem->playerAvatar);
    photo->savedZ = GetPlayerYCoord(fieldSystem->playerAvatar);
    photo->savedDirection = PlayerAvatar_GetFacingDirection(fieldSystem->playerAvatar);
    photo->savedMapId = fieldSystem->location->mapId;
    if (FollowMon_IsActive(fieldSystem)) {
        LocalMapObject *followMonObj = FollowMon_GetMapObject(fieldSystem);
        MapObject_GetPositionVec(followMonObj, &photo->unk_CC);
        photo->unk_D8 = MapObject_GetFacingDirection(followMonObj);
    }
    if (PhotoAlbum_GetIndexOfFirstEmptySlot(Save_PhotoAlbum_Get(FieldSystem_GetSaveData(fieldSystem))) != 0xFF) {
        PHOTO_DAT sp18;
        ReadWholeNarcMemberByIdPair(&sp18, NARC_a_2_5_4, photo_id);
        sub_0206B014(&photo->photoBuf, fieldSystem, sp18.unk2, sp18.unk0, sp18.unk4, sp18.unk6, sp18.unkC, sp18.unkE, sp18.unk9, sp18.unkA);
        photo->pPhoto = &photo->photoBuf;
        TaskManager_Call(fieldSystem->taskman, sub_0206B270, photo);
    }
}

void sub_0206A860(FieldSystem *fieldSystem) {
    FieldViewPhoto *photo = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(FieldViewPhoto));
    MI_CpuFill8(photo, 0, sizeof(FieldViewPhoto));
    photo->x = GetPlayerXCoord(fieldSystem->playerAvatar);
    photo->y = GetPlayerYCoord(fieldSystem->playerAvatar);
    photo->unk_98 = PlayerAvatar_GetFacingDirection(fieldSystem->playerAvatar);
    photo->unk_9A = fieldSystem->location->mapId;
    photo->unk_B8 = Save_PhotoAlbum_Get(fieldSystem->saveData);
    TaskManager_Call(fieldSystem->taskman, sub_0206A8E4, photo);
}

void sub_0206A8C0(FieldViewPhoto *a0, PhotoAlbumScroll *a1) {
    a1->photo = &a0->pPhoto;
    a1->curPhoto = a0->unk_0A;
    a1->numPhotos = PhotoAlbum_GetNumSaved(a0->unk_B8);
}

void sub_0206A8DC(FieldViewPhoto *a0, int a1) {
    a0->unk_90 = a1;
}

static BOOL sub_0206A8E4(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    FieldViewPhoto *photo = (FieldViewPhoto *)TaskManager_GetEnvironment(taskManager);

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

static int sub_0206A9A0(FieldSystem *fieldSystem, TaskManager *taskManager, FieldViewPhoto *photo) {
    photo->unk_B4 = PhotoAlbum_LaunchApp(fieldSystem, 0, photo->unk_0A);
    return 1;
}

static int sub_0206A9B4(FieldSystem *fieldSystem, TaskManager *taskManager, FieldViewPhoto *photo) {
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

static int sub_0206A9E8(FieldSystem *fieldSystem, TaskManager *taskManager, FieldViewPhoto *photo) {
    FieldTakePhoto3 *taskData = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(FieldTakePhoto3));
    MI_CpuClear8(taskData, sizeof(FieldTakePhoto3));
    PhotoAlbum_GetPhotoByIndex(photo->unk_B8, &photo->pPhoto, photo->unk_0A);
    photo->unk_0B = photo->pPhoto.subjectSpriteId ? 2 : photo->pPhoto.numMons;
    photo->unk_90 = 0;
    taskData->unk_8 = photo;
    photo->unk_09 = fieldSystem->unk70;
    fieldSystem->unk70 = 5;
    fieldSystem->unk_DC = photo;
    TaskManager_Call(fieldSystem->taskman, sub_0206ABB0, taskData);
    return 3;
}

static int sub_0206AA4C(FieldSystem *fieldSystem, TaskManager *taskManager, FieldViewPhoto *photo) {
    switch (photo->unk_04) {
    case 0:
        sub_020148F4();
        for (int i = 0; i < photo->unk_0B; ++i) {
            if (photo->mapObjects[i] != 0) {
                MapObject_Remove(photo->mapObjects[i]);
                photo->mapObjects[i] = NULL;
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

static int sub_0206AAD4(FieldSystem *fieldSystem, TaskManager *taskManager, FieldViewPhoto *photo) {
    if (photo->unk_90 == 0) {
        return 4;
    } else {
        return 5;
    }
}

static int sub_0206AAE4(FieldSystem *fieldSystem, TaskManager *taskManager, FieldViewPhoto *photo) {
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

static int sub_0206AB2C(FieldSystem *fieldSystem, TaskManager *taskManager, FieldViewPhoto *photo) {
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

static int sub_0206AB78(FieldSystem *fieldSystem, TaskManager *taskManager, FieldViewPhoto *photo) {
    Location location;

    InitLocation(&location, photo->unk_9A, -1, photo->x, photo->y, photo->unk_98);
    sub_020537A8(taskManager, &location);
    return 8;
}

static BOOL sub_0206ABB0(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    FieldTakePhoto3 *taskData = (FieldTakePhoto3 *)TaskManager_GetEnvironment(taskManager);
    PHOTO *photo = &taskData->unk_8->pPhoto;

    switch (taskData->unk_0) {
    case 0:
        sub_02067A80(fieldSystem, 1);
        sub_02014904(photo->hour, photo->min);
        {
        Location location;
        InitLocation(&location, photo->mapId, -1, photo->x, photo->y, DIR_SOUTH);
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
        sub_0206B82C(fieldSystem->playerAvatar, photo->avatarStateBak, profileGender);
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
        if (photo->subjectSpriteId) {
            taskData->unk_0 = 6;
        } else {
            taskData->unk_0 = 4;
        }
        break;
    case 4:
    {
        PHOTO_MON *mon = &photo->party[taskData->placeObjectCounter];
        if (mon->species != SPECIES_NONE) {
            taskData->unk_8->mapObjects[taskData->placeObjectCounter] = sub_0206AEC0(fieldSystem->mapObjectManager, mon->species, mon->form, mon->gender, DIR_SOUTH, photo->x + sPhotoMonCoordOffsets[taskData->placeObjectCounter].x, photo->y + sPhotoMonCoordOffsets[taskData->placeObjectCounter].y, mon->shiny);
            sub_0205F47C(taskData->unk_8->mapObjects[taskData->placeObjectCounter], ov01_021F7918);
        } else {
            taskData->unk_8->mapObjects[taskData->placeObjectCounter] = NULL;
        }
        taskData->unk_0 = 5;
        break;
    }
    case 5:
    {
        LocalMapObject *mapObject = taskData->unk_8->mapObjects[taskData->placeObjectCounter];
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
        ++taskData->placeObjectCounter;
        if (taskData->placeObjectCounter >= photo->numMons) {
            FreeToHeap(taskData);
            return TRUE;
        }
        taskData->unk_0 = 4;
        break;
    }
    case 6:
        taskData->unk_8->mapObjects[0] = sub_0206AF08(fieldSystem->mapObjectManager, photo->subjectSpriteId, DIR_SOUTH, photo->x + 2, photo->y, obj_photo_subject);
        taskData->unk_0 = 7;
        break;
    case 7:
    {
        VecFx32 facingVec;
        MapObject_GetFacingVec(taskData->unk_8->mapObjects[0], &facingVec);
        facingVec.y -= FX32_CONST(2);
        MapObject_SetFacingVec(taskData->unk_8->mapObjects[0], &facingVec);
        sub_0205F484(taskData->unk_8->mapObjects[0]);
        taskData->unk_0 = 8;
        break;
    }
    case 8:
    {
        PHOTO_MON *mon = &photo->party[0];
        if (mon->species != SPECIES_NONE) {
            taskData->unk_8->mapObjects[1] = sub_0206AEC0(fieldSystem->mapObjectManager, mon->species, mon->form, mon->gender, DIR_SOUTH, photo->x + sSoloPhotoMonCoordOffsets.x, photo->y + sSoloPhotoMonCoordOffsets.y, mon->shiny);
            sub_0205F47C(taskData->unk_8->mapObjects[1], ov01_021F7918);
        } else {
            taskData->unk_8->mapObjects[1] = NULL;
        }
        taskData->unk_0 = 9;
        break;
    }
    case 9:
        if (taskData->unk_8->mapObjects[1] != NULL) {
            VecFx32 facingVec;
            MapObject_GetFacingVec(taskData->unk_8->mapObjects[1], &facingVec);
            facingVec.y -= FX32_CONST(2);
            MapObject_SetFacingVec(taskData->unk_8->mapObjects[1], &facingVec);
            sub_0205F484(taskData->unk_8->mapObjects[1]);
            LocalMapObject *mapObject = taskData->unk_8->mapObjects[1];
            if (ov01_0220553C(mapObject)) {
                ov01_021F902C(1, mapObject);
            }
        }
        FreeToHeap(taskData);
        return TRUE;
    }

    return FALSE;
}

static LocalMapObject *sub_0206AEC0(MapObjectManager *objectMan, u16 species, u16 form, int gender, int direction, int x, int y, BOOL shiny) {
    LocalMapObject *ret = sub_0206AF08(objectMan, FollowMon_GetSpriteID(species, form, gender), direction, x, y, 253);
    MapObject_SetParam(ret, 0, 2);
    FollowMon_SetObjectParams(ret, species, form, shiny);
    return ret;
}

static LocalMapObject *sub_0206AF08(MapObjectManager *objectMan, int spriteId, int direction, int x, int y, int localId) {
    LocalMapObject *ret = CreateSpecialFieldObject(objectMan, x, y, direction, spriteId, 0, 1);
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

static void sub_0206AF78(FieldSystem *fieldSystem, PHOTO *photo) {
    int sp4 = 0;
    LocalMapObject *sp0;
    PlayerAvatar_GetMapObject(fieldSystem->playerAvatar);
    while (sub_0205EEF4(fieldSystem->mapObjectManager, &sp0, &sp4, 1)) {}
}

static void sub_0206AFA4(FieldTakePhoto *takePhoto) {
    for (int i = 0; i < takePhoto->numObjects; ++i) {
        if (takePhoto->mapObjects[i] != NULL) {
            MapObject_Remove(takePhoto->mapObjects[i]);
        }
    }
}

static void sub_0206AFD0(Camera *camera) {
    Camera_SetDistance(sCameraParam.distance, camera);
    Camera_SetAnglePos(&sCameraParam.angle, camera);
    Camera_SetPerspectiveAngle(sCameraParam.perspective, camera);
    Camera_ApplyPerspectiveType(sCameraParam.perspectiveType, camera);
    Camera_OffsetLookAtPosAndTarget(&sCameraParam.lookAt, camera);
}

static void sub_0206B014(PHOTO *photo, FieldSystem *fieldSystem, u8 a2, int mapId, int x, int y, int a6, int a7, u16 a8, u16 isSoloPhoto) {
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
    photo->avatarStateBak = PlayerAvatar_GetState(fieldSystem->playerAvatar);
    photo->x = x;
    photo->y = y;
    photo->mapId = mapId;
    photo->iconId = a2;

    RTCTime time;
    GF_RTC_CopyTime(&time);
    photo->hour = time.hour;
    photo->min = time.minute;
    MI_CpuCopy8(&sCameraParam, &photo->unk_48, sizeof(PhotoCameraParam));
    photo->unk_40[0] = a6;
    photo->unk_40[1] = a7;
    photo->unk_46 = a8;
    photo->subjectSpriteId = isSoloPhoto;
    photo->numMons = photo->subjectSpriteId ? 1 : partySize;

    Pokemon *leadMon = GetFirstAliveMonInParty_CrashIfNone(party);
    GetMonData(leadMon, MON_DATA_NICKNAME, photo->leadMonNick);
    if (!photo->subjectSpriteId) {
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

static inline void FieldTakePhoto_SetLocationBuf(
    FieldTakePhoto *takePhoto,
    int direction,
    int y,
    int x,
    int mapId
) {
    InitLocation(&takePhoto->locationBuf, mapId, -1, x, y, direction);
}

static BOOL sub_0206B270(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    FieldTakePhoto *takePhoto = (FieldTakePhoto *)TaskManager_GetEnvironment(taskManager);

    switch (takePhoto->unk_14) {
    case 0:
        takePhoto->unk_14 = 1;
        break;
    case 1:
        sub_0203E33C(fieldSystem, 3);
        sub_0205525C(taskManager);
        takePhoto->unk_14 = 2;
        break;
    case 2:
        sub_02067A80(fieldSystem, 1);
        FieldTakePhoto_SetLocationBuf(takePhoto, DIR_SOUTH, takePhoto->pPhoto->y, takePhoto->pPhoto->x, takePhoto->pPhoto->mapId);
        sub_020537A8(taskManager, &takePhoto->locationBuf);
        takePhoto->unk_14 = 3;
        break;
    case 3:
        CallTask_RestoreOverworld(taskManager);
        takePhoto->unk_14 = 4;
        break;
    case 4:
        sub_0206AFD0(fieldSystem->camera);
        sub_0206AF78(fieldSystem, takePhoto->pPhoto);
        sub_0206B880(fieldSystem, takePhoto->pPhoto);
        takePhoto->unk_14 = 5;
        break;
    case 5:
        ov01_021F9FB0(fieldSystem->mapObjectManager, sub_0205F1A0(fieldSystem->mapObjectManager));
        takePhoto->unk_14 = 6;
        break;
    case 6:
        u8 profileGender = PlayerProfile_GetTrainerGender(Save_PlayerData_GetProfileAddr(FieldSystem_GetSaveData(fieldSystem)));
        sub_0206B82C(fieldSystem->playerAvatar, takePhoto->pPhoto->avatarStateBak, profileGender);
        {
        VecFx32 facingVec;
        MapObject_GetFacingVec(PlayerAvatar_GetMapObject(fieldSystem->playerAvatar), &facingVec);
        facingVec.y -= FX32_CONST(2);
        MapObject_SetFacingVec(PlayerAvatar_GetMapObject(fieldSystem->playerAvatar), &facingVec);
        }
        if (takePhoto->pPhoto->subjectSpriteId) {
            takePhoto->unk_14 = 9;
            takePhoto->numObjects = 2;
        } else {
            takePhoto->unk_14 = 7;
            takePhoto->numObjects = takePhoto->pPhoto->numMons;
        }
        break;
    case 7:
    {
        PHOTO_MON *mon = &takePhoto->pPhoto->party[takePhoto->unk_17];
        if (mon->species != SPECIES_NONE) {
            takePhoto->mapObjects[takePhoto->unk_17] = sub_0206AEC0(fieldSystem->mapObjectManager, mon->species, mon->form, mon->gender, DIR_SOUTH, takePhoto->pPhoto->x + sPhotoMonCoordOffsets[takePhoto->unk_17].x, takePhoto->pPhoto->y + sPhotoMonCoordOffsets[takePhoto->unk_17].y, mon->shiny);
            sub_0205F47C(takePhoto->mapObjects[takePhoto->unk_17], ov01_021F7918);
        } else {
            takePhoto->mapObjects[takePhoto->unk_17] = NULL;
        }
        ++takePhoto->unk_17;
        takePhoto->unk_14 = 8;
        break;
    }
    case 8:
        if (takePhoto->unk_15++ > 4) {
            LocalMapObject *mapObject = takePhoto->mapObjects[takePhoto->unk_17 - 1];
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
            takePhoto->unk_15 = 0;
            if (takePhoto->unk_17 >= takePhoto->pPhoto->numMons) {
                takePhoto->unk_C8 = 0;
                takePhoto->unk_14 = 13;
            } else {
                takePhoto->unk_14 = 7;
            }
        }
        break;
    case 9:
        takePhoto->mapObjects[0] = sub_0206AF08(fieldSystem->mapObjectManager, takePhoto->pPhoto->subjectSpriteId, DIR_SOUTH, takePhoto->pPhoto->x + 2, takePhoto->pPhoto->y, obj_photo_subject);
        takePhoto->unk_14 = 10;
        break;
    case 10:
        if (takePhoto->unk_15++ > 4) {
            VecFx32 facingVec;
            MapObject_GetFacingVec(takePhoto->mapObjects[0], &facingVec);
            facingVec.y -= FX32_CONST(2);
            MapObject_SetFacingVec(takePhoto->mapObjects[0], &facingVec);
            sub_0205F484(takePhoto->mapObjects[0]);
            takePhoto->unk_15 = 0;
            takePhoto->unk_14 = 11;
        }
        break;
    case 11: {
        PHOTO_MON *mon = &takePhoto->pPhoto->party[takePhoto->unk_17];
        if (mon->species != SPECIES_NONE) {
            takePhoto->mapObjects[1] = sub_0206AEC0(fieldSystem->mapObjectManager, mon->species, mon->form, mon->gender, DIR_SOUTH, takePhoto->pPhoto->x + sSoloPhotoMonCoordOffsets.x, takePhoto->pPhoto->y + sSoloPhotoMonCoordOffsets.y, mon->shiny);
            sub_0205F47C(takePhoto->mapObjects[1], ov01_021F7918);
        } else {
            GF_ASSERT(FALSE);
            takePhoto->mapObjects[1] = NULL;
        }
        takePhoto->unk_14 = 12;
        break;
    }
    case 12:
        if (takePhoto->unk_15++ > 4) {
            LocalMapObject *mapObject = takePhoto->mapObjects[1];
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
            takePhoto->unk_15 = 0;
            takePhoto->unk_C8 = 0;
            takePhoto->unk_14 = 13;
        }
        break;
    case 13:
        ov01_022043D8(fieldSystem->unk_C8);
        ov01_02204424(fieldSystem->unk_C8);
        ov01_021EB1E8(fieldSystem->unk4->unk10);
        takePhoto->unk_14 = 14;
        break;
    case 14:
        sub_0206B8AC(fieldSystem->bgConfig, HEAP_ID_4);
        CallTask_FadeFromBlack(taskManager);
        takePhoto->unk_CA = 0;
        takePhoto->unk_14 = 15;
        break;
    case 15:
        switch (takePhoto->unk_CA) {
        case 0:
            ov01_021FB514(fieldSystem->unk4->unk1c);
            ++takePhoto->unk_CA;
            // fallthrough
        case 1:
            if (takePhoto->unk_C8++ >= 30) {
                ++takePhoto->unk_CA;
                takePhoto->unk_C8 = 0;
            }
            break;
        case 2:
            PlaySE(SEQ_SE_GS_SHUTTER);
            BeginNormalPaletteFade(3, 8, 0, RGB_BLACK, 6, 1, HEAP_ID_4);
            ++takePhoto->unk_CA;
            break;
        case 3:
            if (IsPaletteFadeFinished()) {
                PHOTO_ALBUM *photoAlbum = Save_PhotoAlbum_Get(FieldSystem_GetSaveData(fieldSystem));
                u8 photoIndex = PhotoAlbum_GetIndexOfFirstEmptySlot(photoAlbum);
                RTCDate date;
                GF_RTC_CopyDate(&date);
                takePhoto->pPhoto->date = ((date.year & 0xFF) << 24) | ((date.month & 0xFF) << 16) | ((date.day & 0xFF) << 8) | date.week;
                RTCTime time;
                GF_RTC_CopyTime(&time);
                takePhoto->pPhoto->hour = time.hour;
                takePhoto->pPhoto->min = time.minute;
                PhotoAlbum_SetPhotoAtIndex(photoAlbum, &takePhoto->photoBuf, photoIndex);
                ++takePhoto->unk_CA;
            }
            break;
        case 4:
            BeginNormalPaletteFade(3, 9, 0, RGB_BLACK, 6, 1, HEAP_ID_4);
            ++takePhoto->unk_CA;
            break;
        case 5:
            if (IsPaletteFadeFinished()) {
                ++takePhoto->unk_CA;
            }
            break;
        case 6:
            ov01_021FB4F4(fieldSystem->unk4->unk1c);
            ++takePhoto->unk_CA;
            break;
        case 7:
            if (takePhoto->unk_C8++ >= 30) {
                PaletteFadeUntilFinished(taskManager);
                takePhoto->unk_14 = 16;
            }
            break;
        }
        break;
    case 16:
        sub_020148F4();
        sub_0206AFA4(takePhoto);
        sub_0203E33C(fieldSystem, 0);
        sub_0205525C(taskManager);
        takePhoto->unk_14 = 17;
        break;
    case 17:
        sub_02067A80(fieldSystem, 0);
        FieldTakePhoto_SetLocationBuf(takePhoto, takePhoto->savedDirection, takePhoto->savedZ, takePhoto->savedX, takePhoto->savedMapId);
        sub_020537A8(taskManager, &takePhoto->locationBuf);
        takePhoto->unk_14 = 18;
        break;
    case 18:
        CallTask_RestoreOverworld(taskManager);
        takePhoto->unk_14 = 19;
        break;
    case 19:
        if (FollowMon_IsActive(fieldSystem) && PlayerAvatar_GetState(fieldSystem->playerAvatar) != PLAYER_STATE_CYCLING) {
            LocalMapObject *followMon = FollowMon_GetMapObject(fieldSystem);
            LocalMapObject *playerObj = PlayerAvatar_GetMapObject(fieldSystem->playerAvatar);
            sub_0205FBC0(followMon, &takePhoto->unk_CC, takePhoto->unk_D8);

            int playerX = MapObject_GetCurrentX(playerObj);
            int playerZ = MapObject_GetCurrentY(playerObj);
            int followX = MapObject_GetCurrentX(followMon);
            int followZ = MapObject_GetCurrentY(followMon);

            if (playerX == followX && playerZ == followZ) {
                sub_02069DC8(followMon, TRUE);
            } else {
                sub_02069DC8(followMon, FALSE);
            }
            sub_0205F484(followMon);
        }
        takePhoto->unk_14 = 20;
        break;
    case 20:
        FreeToHeap(takePhoto);
        return TRUE;
    }

    return FALSE;
}

static void sub_0206B82C(PlayerAvatar *playerAvatar, u8 state, u8 gender) {
    int spriteId = PlayerAvatar_GetSpriteByStateAndGender(state, gender);
    LocalMapObject *mapObject = PlayerAvatar_GetMapObject(playerAvatar);
    MapObjectManager *mapObjectManager = MapObject_GetManager(mapObject);
    int gfxId = MapObject_GetGfxID(mapObject);
    sub_0205E420(mapObject);
    ov01_021FA108(mapObjectManager, gfxId, mapObject);
    sub_0205E38C(mapObject, spriteId);
    int r0 = sub_0205C790(playerAvatar);
    if (r0 != 0) {
        ov01_021F1640(r0);
    }
    sub_0205C78C(playerAvatar, 0);
}

static void sub_0206B880(FieldSystem *fieldSystem, PHOTO *photo) {
    for (u8 i = 0; i < 2; ++i) {
        if (photo->unk_40[i] != 0) {
            sub_02054EB0(fieldSystem, photo->unk_40[i], TRUE);
        }
    }
}

static void sub_0206B8AC(BgConfig *bgConfig, HeapID heapId) {
    GfGfxLoader_GXLoadPal(NARC_a_2_6_1, 0, GF_PAL_LOCATION_MAIN_BG, (enum GFPalSlotOffset)0, 0, heapId);
    GfGfxLoader_LoadCharData(NARC_a_2_6_1, 1, bgConfig, GF_BG_LYR_MAIN_2, 0, 0, TRUE, heapId);
    GfGfxLoader_LoadScrnData(NARC_a_2_6_1, 2, bgConfig, GF_BG_LYR_MAIN_2, 0, 0x600, TRUE, heapId);
    BgCommitTilemapBufferToVram(bgConfig, GF_BG_LYR_MAIN_2);
    SetBgPriority(GF_BG_LYR_MAIN_2, 0);
}
