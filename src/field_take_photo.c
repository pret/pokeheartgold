#include "field_take_photo.h"

#include "global.h"

#include "constants/scrcmd.h"

#include "graphic/camera_viewfinder.naix"

#include "field_warp_tasks.h"
#include "follow_mon.h"
#include "gf_gfx_loader.h"
#include "launch_application.h"
#include "overlay_01_021F1348.h"
#include "overlay_01_021F72DC.h"
#include "overlay_01_021F8D80.h"
#include "overlay_01_021F944C.h"
#include "overlay_01_021FB4C0.h"
#include "overlay_01_022053EC.h"
#include "photo_album.h"
#include "script_pokemon_util.h"
#include "task.h"
#include "unk_02005D10.h"
#include "unk_0200FA24.h"
#include "unk_02054E00.h"
#include "unk_02055244.h"
#include "unk_020552A4.h"
#include "unk_02067A80.h"

typedef enum FieldViewPhotoTaskState {
    VIEW_PHOTO_STATE_INIT,
    VIEW_PHOTO_STATE_SELECT,
    VIEW_PHOTO_STATE_LOAD,
    VIEW_PHOTO_STATE_FADE_IN,
    VIEW_PHOTO_STATE_WAIT_PLAYER,
    VIEW_PHOTO_STATE_FADE_OUT,
    VIEW_PHOTO_STATE_HANDLE_NEXT,
    VIEW_PHOTO_STATE_QUIT,
    VIEW_PHOTO_STATE_QUIT2,
} FieldViewPhotoTaskState;

typedef enum FieldTakePhotoTaskState {
    TAKE_PHOTO_STATE_DUMMY_INIT,
    TAKE_PHOTO_STATE_INIT_LEAVE_OVERWORLD,
    TAKE_PHOTO_STATE_SAVE_PLAYER_STATE,
    TAKE_PHOTO_STATE_INIT_RESTORE_OVERWORLD,
    TAKE_PHOTO_STATE_POSITION_CAMERA,
    TAKE_PHOTO_STATE_05,
    TAKE_PHOTO_STATE_ADJUST_PLAYER_FACING_VEC,
    TAKE_PHOTO_STATE_PARTY_PHOTO_PLACE_MON_ITER,
    TAKE_PHOTO_STATE_PARTY_PHOTO_ADJUST_MON_OBJ_ITER,
    TAKE_PHOTO_STATE_NPC_PHOTO_PLACE_NPC,
    TAKE_PHOTO_STATE_NPC_PHOTO_ADJUST_NPC,
    TAKE_PHOTO_STATE_NPC_PHOTO_PLACE_MON,
    TAKE_PHOTO_STATE_NPC_PHOTO_ADJUST_MON,
    TAKE_PHOTO_STATE_13,
    TAKE_PHOTO_STATE_DRAW_CAMERA_GFX,
    TAKE_PHOTO_STATE_SHUTTER,
    TAKE_PHOTO_STATE_UNLOAD,
    TAKE_PHOTO_STATE_RESTORE_PLAYER,
    TAKE_PHOTO_STATE_RESUME_OVERWORLD_AFTER,
    TAKE_PHOTO_STATE_ADJUST_FOLLOW_MON,
    TAKE_PHOTO_STATE_EXIT,
} FieldTakePhotoTaskState;

typedef enum FieldTakePhotoShutterState {
    TAKE_PHOTO_SHUTTER_STATE_INIT,
    TAKE_PHOTO_SHUTTER_STATE_DELAY_BEFORE,
    TAKE_PHOTO_SHUTTER_STATE_FADE_OUT,
    TAKE_PHOTO_SHUTTER_STATE_EXPOSURE,
    TAKE_PHOTO_SHUTTER_STATE_FADE_IN,
    TAKE_PHOTO_SHUTTER_STATE_WAIT_FADE_IN,
    TAKE_PHOTO_SHUTTER_STATE_6,
    TAKE_PHOTO_SHUTTER_STATE_DELAY_AFTER,
} FieldTakePhotoShutterState;

typedef enum FieldPhotoDoViewState {
    FIELD_PHOTO_DO_VIEW_STATE_0,
    FIELD_PHOTO_DO_VIEW_STATE_1,
    FIELD_PHOTO_DO_VIEW_STATE_2,
    FIELD_PHOTO_DO_VIEW_STATE_3,
    FIELD_PHOTO_DO_VIEW_STATE_4,
    FIELD_PHOTO_DO_VIEW_STATE_5,
    FIELD_PHOTO_DO_VIEW_STATE_6,
    FIELD_PHOTO_DO_VIEW_STATE_7,
    FIELD_PHOTO_DO_VIEW_STATE_8,
    FIELD_PHOTO_DO_VIEW_STATE_9,
} FieldPhotoDoViewStat;

typedef struct FieldTakePhoto3 {
    int state;
    u8 filler_4[4];
    FieldViewPhoto *parent;
    u8 placeObjectCounter;
} FieldTakePhoto3;

static BOOL FieldTask_ViewPhoto(TaskManager *taskManager);
static int ViewPhotoFieldTask_Init(FieldSystem *fieldSystem, TaskManager *taskManager, FieldViewPhoto *photo);
static int ViewPhotoFieldTask_HandleAlbumSelection(FieldSystem *fieldSystem, TaskManager *taskManager, FieldViewPhoto *photo);
static int ViewPhotoFieldTask_LoadPhotoAndBeginRender(FieldSystem *fieldSystem, TaskManager *taskManager, FieldViewPhoto *photo);
static int ViewPhotoFieldTask_Cleanup(FieldSystem *fieldSystem, TaskManager *taskManager, FieldViewPhoto *photo);
static int ViewPhotoFieldTask_WaitInput(FieldSystem *fieldSystem, TaskManager *taskManager, FieldViewPhoto *photo);
static int ViewPhotoFieldTask_FadeInToPhoto(FieldSystem *fieldSystem, TaskManager *taskManager, FieldViewPhoto *photo);
static int ViewPhotoFieldTask_FadeOutFromPhoto(FieldSystem *fieldSystem, TaskManager *taskManager, FieldViewPhoto *photo);
static int ViewPhotoFieldTask_RestorePlayerOverworldPosition(FieldSystem *fieldSystem, TaskManager *taskManager, FieldViewPhoto *photo);
static BOOL FieldTask_DoViewPhoto(TaskManager *taskManager);
static LocalMapObject *createPartymonMapObject(MapObjectManager *objectMan, u16 species, u16 form, int gender, int direction, int x, int y, BOOL shiny);
static LocalMapObject *createSpecialMapObject(MapObjectManager *objectMan, int spriteId, int direction, int x, int y, int localId);
static void sub_0206AF78(FieldSystem *fieldSystem, Photo *photo);
static void FieldTakePhoto_RemoveAllMapObjects(FieldTakePhoto *takePhoto);
static void setCameraParam(Camera *camera);
static void Photo_InitFromArcData(Photo *photo, FieldSystem *fieldSystem, u8 iconId, int mapId, int x, int y, int a6, int a7, u16 a8, u16 subjectObjId);
static BOOL FieldTask_TakePhoto(TaskManager *taskManager);
static void sub_0206B82C(PlayerAvatar *playerAvatar, u8 state, u8 gender);
static void sub_0206B880(FieldSystem *fieldSystem, Photo *photo);
static void drawCameraGfx(BgConfig *bgConfig, enum HeapID heapID);

typedef struct Coord2U16 {
    u16 x;
    u16 y;
} Coord2U16;

static const Coord2U16 sSoloPhotoMonCoordOffsets = { 1, -1 };
static const Coord2U16 sPhotoMonCoordOffsets[] = {
    { 2,  0  },
    { 1,  -1 },
    { -1, -1 },
    { 3,  -1 },
    { 0,  -2 },
    { 2,  -2 },
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
    FieldTakePhoto *takePhoto = Heap_AllocAtEnd(HEAP_ID_FIELD2, sizeof(FieldTakePhoto));
    MI_CpuFill8(takePhoto, 0, sizeof(FieldTakePhoto));
    takePhoto->state = 0;
    takePhoto->positionMonDelayCounter = 0;
    takePhoto->curMon = 0;
    takePhoto->savedX = PlayerAvatar_GetXCoord(fieldSystem->playerAvatar);
    takePhoto->savedZ = PlayerAvatar_GetZCoord(fieldSystem->playerAvatar);
    takePhoto->savedDirection = PlayerAvatar_GetFacingDirection(fieldSystem->playerAvatar);
    takePhoto->savedMapId = fieldSystem->location->mapId;
    if (FollowMon_IsActive(fieldSystem)) {
        LocalMapObject *followMonObj = FollowMon_GetMapObject(fieldSystem);
        MapObject_CopyPositionVector(followMonObj, &takePhoto->followMonPositionVecBak);
        takePhoto->followMonFacingDirectionBak = MapObject_GetFacingDirection(followMonObj);
    }
    if (PhotoAlbum_GetIndexOfFirstEmptySlot(Save_PhotoAlbum_Get(FieldSystem_GetSaveData(fieldSystem))) != 0xFF) {
        PhotoData photoDat;
        ReadWholeNarcMemberByIdPair(&photoDat, NARC_data_photo_data, photo_id);
        Photo_InitFromArcData(&takePhoto->photoBuf, fieldSystem, photoDat.iconId, photoDat.mapId, photoDat.x, photoDat.y, photoDat.param[0], photoDat.param[1], photoDat.unk9, photoDat.subjectObjId);
        takePhoto->pPhoto = &takePhoto->photoBuf;
        TaskManager_Call(fieldSystem->taskman, FieldTask_TakePhoto, takePhoto);
    }
}

void FieldSystem_ViewSavedPhotos(FieldSystem *fieldSystem) {
    FieldViewPhoto *photo = Heap_AllocAtEnd(HEAP_ID_FIELD2, sizeof(FieldViewPhoto));
    MI_CpuFill8(photo, 0, sizeof(FieldViewPhoto));
    photo->x = PlayerAvatar_GetXCoord(fieldSystem->playerAvatar);
    photo->z = PlayerAvatar_GetZCoord(fieldSystem->playerAvatar);
    photo->savedDirection = PlayerAvatar_GetFacingDirection(fieldSystem->playerAvatar);
    photo->savedMapId = fieldSystem->location->mapId;
    photo->photoAlbum = Save_PhotoAlbum_Get(fieldSystem->saveData);
    TaskManager_Call(fieldSystem->taskman, FieldTask_ViewPhoto, photo);
}

void FieldViewPhoto_GetAlbumScrollParam(FieldViewPhoto *viewPhoto, PhotoAlbumScroll *scrollData) {
    scrollData->photo = &viewPhoto->pPhoto;
    scrollData->curPhoto = viewPhoto->whichPhoto;
    scrollData->numPhotos = PhotoAlbum_GetNumSaved(viewPhoto->photoAlbum);
}

void FieldViewPhoto_SetPlayerInput(FieldViewPhoto *viewPhoto, ViewPhotoInputResponse exitRequested) {
    viewPhoto->input = exitRequested;
}

static BOOL FieldTask_ViewPhoto(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    FieldViewPhoto *viewPhoto = (FieldViewPhoto *)TaskManager_GetEnvironment(taskManager);

    switch (viewPhoto->state) {
    case VIEW_PHOTO_STATE_INIT:
        viewPhoto->state = ViewPhotoFieldTask_Init(fieldSystem, taskManager, viewPhoto);
        break;
    case VIEW_PHOTO_STATE_SELECT:
        viewPhoto->state = ViewPhotoFieldTask_HandleAlbumSelection(fieldSystem, taskManager, viewPhoto);
        break;
    case VIEW_PHOTO_STATE_LOAD:
        viewPhoto->state = ViewPhotoFieldTask_LoadPhotoAndBeginRender(fieldSystem, taskManager, viewPhoto);
        break;
    case VIEW_PHOTO_STATE_FADE_IN:
        viewPhoto->state = ViewPhotoFieldTask_FadeInToPhoto(fieldSystem, taskManager, viewPhoto);
        break;
    case VIEW_PHOTO_STATE_WAIT_PLAYER:
        viewPhoto->state = ViewPhotoFieldTask_WaitInput(fieldSystem, taskManager, viewPhoto);
        break;
    case VIEW_PHOTO_STATE_FADE_OUT:
        viewPhoto->state = ViewPhotoFieldTask_FadeOutFromPhoto(fieldSystem, taskManager, viewPhoto);
        break;
    case VIEW_PHOTO_STATE_HANDLE_NEXT:
        viewPhoto->state = ViewPhotoFieldTask_Cleanup(fieldSystem, taskManager, viewPhoto);
        break;
    case VIEW_PHOTO_STATE_QUIT:
        viewPhoto->state = ViewPhotoFieldTask_RestorePlayerOverworldPosition(fieldSystem, taskManager, viewPhoto);
        break;
    case VIEW_PHOTO_STATE_QUIT2:
        sub_02067A80(fieldSystem, 0);
        Heap_Free(viewPhoto);
        return TRUE;
    }

    return FALSE;
}

static int ViewPhotoFieldTask_Init(FieldSystem *fieldSystem, TaskManager *taskManager, FieldViewPhoto *photo) {
    photo->selectionFromAlbumApp = PhotoAlbum_LaunchApp(fieldSystem, 0, photo->whichPhoto);
    return VIEW_PHOTO_STATE_SELECT;
}

static int ViewPhotoFieldTask_HandleAlbumSelection(FieldSystem *fieldSystem, TaskManager *taskManager, FieldViewPhoto *photo) {
    if (FieldSystem_ApplicationIsRunning(fieldSystem)) {
        return VIEW_PHOTO_STATE_SELECT;
    }
    BOOL photoWasSelected;
    PhotoAlbumArgs *args = photo->selectionFromAlbumApp;
    photo->photoWasSelected = photoWasSelected = args->photoWasSelected;
    photo->whichPhoto = args->cursorPos;
    Heap_Free(photo->selectionFromAlbumApp);
    if (photoWasSelected == TRUE) {
        return VIEW_PHOTO_STATE_LOAD;
    } else {
        return VIEW_PHOTO_STATE_QUIT;
    }
}

static int ViewPhotoFieldTask_LoadPhotoAndBeginRender(FieldSystem *fieldSystem, TaskManager *taskManager, FieldViewPhoto *viewPhoto) {
    FieldTakePhoto3 *taskData = Heap_AllocAtEnd(HEAP_ID_FIELD2, sizeof(FieldTakePhoto3));
    MI_CpuClear8(taskData, sizeof(FieldTakePhoto3));
    PhotoAlbum_GetPhotoByIndex(viewPhoto->photoAlbum, &viewPhoto->pPhoto, viewPhoto->whichPhoto);
    viewPhoto->numMons = viewPhoto->pPhoto.subjectSpriteId != 0 ? 2 : viewPhoto->pPhoto.numMons;
    viewPhoto->input = VIEW_PHOTO_INPUT_NOTHING;
    taskData->parent = viewPhoto;
    viewPhoto->fieldSystemUnk70Bak = fieldSystem->unk70;
    fieldSystem->unk70 = 5;
    fieldSystem->viewPhotoTask = viewPhoto;
    TaskManager_Call(fieldSystem->taskman, FieldTask_DoViewPhoto, taskData);
    return VIEW_PHOTO_STATE_FADE_IN;
}

static int ViewPhotoFieldTask_Cleanup(FieldSystem *fieldSystem, TaskManager *taskManager, FieldViewPhoto *viewPhoto) {
    switch (viewPhoto->substate) {
    case 0:
        GF_RTC_UnfreezeTime();
        for (int i = 0; i < viewPhoto->numMons; ++i) {
            if (viewPhoto->mapObjects[i] != 0) {
                MapObject_Remove(viewPhoto->mapObjects[i]);
                viewPhoto->mapObjects[i] = NULL;
            }
        }
        CallTask_LeaveOverworld(taskManager);
        ++viewPhoto->substate;
        break;
    case 1:
        fieldSystem->unk70 = viewPhoto->fieldSystemUnk70Bak;
        fieldSystem->viewPhotoTask = NULL;
        viewPhoto->substate = 0;
        switch (viewPhoto->input) {
        case 2:
            --viewPhoto->whichPhoto;
            return VIEW_PHOTO_STATE_LOAD;
        case 3:
            ++viewPhoto->whichPhoto;
            return VIEW_PHOTO_STATE_LOAD;
        default:
            return VIEW_PHOTO_STATE_INIT;
        }
    }

    return VIEW_PHOTO_STATE_HANDLE_NEXT;
}

static int ViewPhotoFieldTask_WaitInput(FieldSystem *fieldSystem, TaskManager *taskManager, FieldViewPhoto *photo) {
    if (photo->input == VIEW_PHOTO_INPUT_NOTHING) {
        return VIEW_PHOTO_STATE_WAIT_PLAYER;
    } else {
        return VIEW_PHOTO_STATE_FADE_OUT;
    }
}

static int ViewPhotoFieldTask_FadeInToPhoto(FieldSystem *fieldSystem, TaskManager *taskManager, FieldViewPhoto *photo) {
    switch (photo->substate) {
    case 0:
        BeginNormalPaletteFade(0, 1, 1, RGB_BLACK, 6, 1, HEAP_ID_FIELD2);
        ++photo->substate;
        break;
    case 1:
        if (IsPaletteFadeFinished()) {
            photo->substate = 0;
            return VIEW_PHOTO_STATE_WAIT_PLAYER;
        }
        break;
    }

    return VIEW_PHOTO_STATE_FADE_IN;
}

static int ViewPhotoFieldTask_FadeOutFromPhoto(FieldSystem *fieldSystem, TaskManager *taskManager, FieldViewPhoto *photo) {
    switch (photo->substate) {
    case 0:
        BeginNormalPaletteFade(0, 0, 0, RGB_BLACK, 6, 1, HEAP_ID_FIELD2);
        ++photo->substate;
        break;
    case 1:
        if (IsPaletteFadeFinished()) {
            photo->substate = 0;
            return VIEW_PHOTO_STATE_HANDLE_NEXT;
        }
        break;
    }

    return VIEW_PHOTO_STATE_FADE_OUT;
}

static int ViewPhotoFieldTask_RestorePlayerOverworldPosition(FieldSystem *fieldSystem, TaskManager *taskManager, FieldViewPhoto *viewPhoto) {
    Location location;

    InitLocation(&location, viewPhoto->savedMapId, -1, viewPhoto->x, viewPhoto->z, viewPhoto->savedDirection);
    sub_020537A8(taskManager, &location);
    return VIEW_PHOTO_STATE_QUIT2;
}

static BOOL FieldTask_DoViewPhoto(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    FieldTakePhoto3 *taskData = (FieldTakePhoto3 *)TaskManager_GetEnvironment(taskManager);
    Photo *photo = &taskData->parent->pPhoto;

    switch (taskData->state) {
    case FIELD_PHOTO_DO_VIEW_STATE_0:
        sub_02067A80(fieldSystem, 1);
        GF_RTC_SetAndFreezeTime(photo->hour, photo->min);
        {
            Location location;
            InitLocation(&location, photo->mapId, -1, photo->x, photo->y, DIR_SOUTH);
            sub_020537A8(taskManager, &location);
        }
        ++taskData->state;
        break;
    case FIELD_PHOTO_DO_VIEW_STATE_1:
        CallTask_RestoreOverworld(taskManager);
        ++taskData->state;
        break;
    case FIELD_PHOTO_DO_VIEW_STATE_2:
        setCameraParam(fieldSystem->camera);
        sub_0206AF78(fieldSystem, photo);
        sub_0206B880(fieldSystem, photo);
        NNS_G3dGlbSetViewPort(4, 3, 252, 188);
        {
            u8 profileGender = PlayerProfile_GetTrainerGender(Save_PlayerData_GetProfile(FieldSystem_GetSaveData(fieldSystem)));
            sub_0206B82C(fieldSystem->playerAvatar, photo->avatarStateBak, profileGender);
        }
        {
            VecFx32 facingVec;
            MapObject_CopyFacingVector(PlayerAvatar_GetMapObject(fieldSystem->playerAvatar), &facingVec);
            facingVec.y -= FX32_CONST(2);
            MapObject_SetFacingVector(PlayerAvatar_GetMapObject(fieldSystem->playerAvatar), &facingVec);
        }
        ++taskData->state;
        break;
    case FIELD_PHOTO_DO_VIEW_STATE_3:
        ov01_021F9FB0(fieldSystem->mapObjectManager, sub_0205F1A0(fieldSystem->mapObjectManager));
        ov01_022043D8(fieldSystem->unk_C8);
        ov01_02204424(fieldSystem->unk_C8);
        ov01_021EB1E8(fieldSystem->unk4->unk10);
        if (photo->subjectSpriteId) {
            taskData->state = FIELD_PHOTO_DO_VIEW_STATE_6;
        } else {
            taskData->state = FIELD_PHOTO_DO_VIEW_STATE_4;
        }
        break;
    case FIELD_PHOTO_DO_VIEW_STATE_4: {
        PhotoMon *mon = &photo->party[taskData->placeObjectCounter];
        if (mon->species != SPECIES_NONE) {
            taskData->parent->mapObjects[taskData->placeObjectCounter] = createPartymonMapObject(fieldSystem->mapObjectManager, mon->species, mon->form, mon->gender, DIR_SOUTH, photo->x + sPhotoMonCoordOffsets[taskData->placeObjectCounter].x, photo->y + sPhotoMonCoordOffsets[taskData->placeObjectCounter].y, mon->shiny);
            sub_0205F47C(taskData->parent->mapObjects[taskData->placeObjectCounter], ov01_021F7918);
        } else {
            taskData->parent->mapObjects[taskData->placeObjectCounter] = NULL;
        }
        taskData->state = FIELD_PHOTO_DO_VIEW_STATE_5;
        break;
    }
    case FIELD_PHOTO_DO_VIEW_STATE_5: {
        LocalMapObject *mapObject = taskData->parent->mapObjects[taskData->placeObjectCounter];
        if (mapObject != NULL) {
            if (ov01_0220553C(mapObject)) {
                ov01_021F902C(1, mapObject);
            }
            VecFx32 facingVec;
            MapObject_CopyFacingVector(mapObject, &facingVec);
            facingVec.y -= FX32_CONST(2);
            MapObject_SetFacingVector(mapObject, &facingVec);
            sub_0205F484(mapObject);
        }
        ++taskData->placeObjectCounter;
        if (taskData->placeObjectCounter >= photo->numMons) {
            Heap_Free(taskData);
            return TRUE;
        }
        taskData->state = FIELD_PHOTO_DO_VIEW_STATE_4;
        break;
    }
    case FIELD_PHOTO_DO_VIEW_STATE_6:
        taskData->parent->mapObjects[0] = createSpecialMapObject(fieldSystem->mapObjectManager, photo->subjectSpriteId, DIR_SOUTH, photo->x + 2, photo->y, obj_photo_subject);
        taskData->state = FIELD_PHOTO_DO_VIEW_STATE_7;
        break;
    case FIELD_PHOTO_DO_VIEW_STATE_7: {
        VecFx32 facingVec;
        MapObject_CopyFacingVector(taskData->parent->mapObjects[0], &facingVec);
        facingVec.y -= FX32_CONST(2);
        MapObject_SetFacingVector(taskData->parent->mapObjects[0], &facingVec);
        sub_0205F484(taskData->parent->mapObjects[0]);
        taskData->state = FIELD_PHOTO_DO_VIEW_STATE_8;
        break;
    }
    case FIELD_PHOTO_DO_VIEW_STATE_8: {
        PhotoMon *mon = &photo->party[0];
        if (mon->species != SPECIES_NONE) {
            taskData->parent->mapObjects[1] = createPartymonMapObject(fieldSystem->mapObjectManager, mon->species, mon->form, mon->gender, DIR_SOUTH, photo->x + sSoloPhotoMonCoordOffsets.x, photo->y + sSoloPhotoMonCoordOffsets.y, mon->shiny);
            sub_0205F47C(taskData->parent->mapObjects[1], ov01_021F7918);
        } else {
            taskData->parent->mapObjects[1] = NULL;
        }
        taskData->state = FIELD_PHOTO_DO_VIEW_STATE_9;
        break;
    }
    case FIELD_PHOTO_DO_VIEW_STATE_9:
        if (taskData->parent->mapObjects[1] != NULL) {
            VecFx32 facingVec;
            MapObject_CopyFacingVector(taskData->parent->mapObjects[1], &facingVec);
            facingVec.y -= FX32_CONST(2);
            MapObject_SetFacingVector(taskData->parent->mapObjects[1], &facingVec);
            sub_0205F484(taskData->parent->mapObjects[1]);
            LocalMapObject *mapObject = taskData->parent->mapObjects[1];
            if (ov01_0220553C(mapObject)) {
                ov01_021F902C(1, mapObject);
            }
        }
        Heap_Free(taskData);
        return TRUE;
    }

    return FALSE;
}

static LocalMapObject *createPartymonMapObject(MapObjectManager *objectMan, u16 species, u16 form, int gender, int direction, int x, int y, BOOL shiny) {
    LocalMapObject *ret = createSpecialMapObject(objectMan, FollowMon_GetSpriteID(species, form, gender), direction, x, y, 253);
    MapObject_SetParam(ret, 0, 2);
    FollowMon_SetObjectParams(ret, species, form, shiny);
    return ret;
}

static LocalMapObject *createSpecialMapObject(MapObjectManager *objectMan, int spriteId, int direction, int x, int y, int localId) {
    LocalMapObject *ret = MapObject_Create(objectMan, x, y, direction, spriteId, 0, 1);
    GF_ASSERT(ret != NULL);
    MapObject_SetID(ret, localId);
    MapObject_SetType(ret, 0);
    MapObject_SetEventFlag(ret, 0);
    MapObject_SetXRange(ret, -1);
    MapObject_SetYRange(ret, -1);
    MapObject_SetFlagsBits(ret, (MapObjectFlagBits)(MAPOBJECTFLAG_KEEP | MAPOBJECTFLAG_UNK13));
    MapObject_ClearFlagsBits(ret, (MapObjectFlagBits)(MAPOBJECTFLAG_UNK7 | MAPOBJECTFLAG_UNK8));
    MapObject_SetFlag29(ret, TRUE);
    return ret;
}

// this function was partially stubbed, or called a static inline child routine that was subbed
static void sub_0206AF78(FieldSystem *fieldSystem, Photo *photo) {
    s32 index = 0;
    LocalMapObject *curObj;
    PlayerAvatar_GetMapObject(fieldSystem->playerAvatar);
    while (MapObjectManager_GetNextObjectWithFlagFromIndex(fieldSystem->mapObjectManager, &curObj, &index, MAPOBJECTFLAG_ACTIVE)) {
    }
}

static void FieldTakePhoto_RemoveAllMapObjects(FieldTakePhoto *takePhoto) {
    for (int i = 0; i < takePhoto->numObjects; ++i) {
        if (takePhoto->mapObjects[i] != NULL) {
            MapObject_Remove(takePhoto->mapObjects[i]);
        }
    }
}

static void setCameraParam(Camera *camera) {
    Camera_SetDistance(sCameraParam.distance, camera);
    Camera_SetAnglePos(&sCameraParam.angle, camera);
    Camera_SetPerspectiveAngle(sCameraParam.perspective, camera);
    Camera_ApplyPerspectiveType(sCameraParam.perspectiveType, camera);
    Camera_OffsetLookAtPosAndTarget(&sCameraParam.lookAt, camera);
}

static void Photo_InitFromArcData(Photo *photo, FieldSystem *fieldSystem, u8 iconId, int mapId, int x, int y, int a6, int a7, u16 a8, u16 subjectObjId) {
    int partySize;
    SaveData *saveData = FieldSystem_GetSaveData(fieldSystem);
    PlayerProfile *profile = Save_PlayerData_GetProfile(saveData);
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
    photo->iconId = iconId;

    RTCTime time;
    GF_RTC_CopyTime(&time);
    photo->hour = time.hour;
    photo->min = time.minute;
    MI_CpuCopy8(&sCameraParam, &photo->unk_48, sizeof(PhotoCameraParam));
    photo->unk_40[0] = a6;
    photo->unk_40[1] = a7;
    photo->unk_46 = a8;
    photo->subjectSpriteId = subjectObjId;
    photo->numMons = photo->subjectSpriteId != 0 ? 1 : partySize;

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

static inline void FieldTakePhoto_SetLocationBuf(FieldTakePhoto *takePhoto, int direction, int z, int x, int mapId) {
    InitLocation(&takePhoto->locationBuf, mapId, -1, x, z, direction);
}

static BOOL FieldTask_TakePhoto(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    FieldTakePhoto *takePhoto = (FieldTakePhoto *)TaskManager_GetEnvironment(taskManager);

    switch (takePhoto->state) {
    case TAKE_PHOTO_STATE_DUMMY_INIT:
        takePhoto->state = TAKE_PHOTO_STATE_INIT_LEAVE_OVERWORLD;
        break;
    case TAKE_PHOTO_STATE_INIT_LEAVE_OVERWORLD:
        sub_0203E33C(fieldSystem, 3);
        CallTask_LeaveOverworld(taskManager);
        takePhoto->state = TAKE_PHOTO_STATE_SAVE_PLAYER_STATE;
        break;
    case TAKE_PHOTO_STATE_SAVE_PLAYER_STATE:
        sub_02067A80(fieldSystem, 1);
        FieldTakePhoto_SetLocationBuf(takePhoto, DIR_SOUTH, takePhoto->pPhoto->y, takePhoto->pPhoto->x, takePhoto->pPhoto->mapId);
        sub_020537A8(taskManager, &takePhoto->locationBuf);
        takePhoto->state = TAKE_PHOTO_STATE_INIT_RESTORE_OVERWORLD;
        break;
    case TAKE_PHOTO_STATE_INIT_RESTORE_OVERWORLD:
        CallTask_RestoreOverworld(taskManager);
        takePhoto->state = TAKE_PHOTO_STATE_POSITION_CAMERA;
        break;
    case TAKE_PHOTO_STATE_POSITION_CAMERA:
        setCameraParam(fieldSystem->camera);
        sub_0206AF78(fieldSystem, takePhoto->pPhoto);
        sub_0206B880(fieldSystem, takePhoto->pPhoto);
        takePhoto->state = TAKE_PHOTO_STATE_05;
        break;
    case TAKE_PHOTO_STATE_05:
        ov01_021F9FB0(fieldSystem->mapObjectManager, sub_0205F1A0(fieldSystem->mapObjectManager));
        takePhoto->state = TAKE_PHOTO_STATE_ADJUST_PLAYER_FACING_VEC;
        break;
    case TAKE_PHOTO_STATE_ADJUST_PLAYER_FACING_VEC:
        u8 profileGender = PlayerProfile_GetTrainerGender(Save_PlayerData_GetProfile(FieldSystem_GetSaveData(fieldSystem)));
        sub_0206B82C(fieldSystem->playerAvatar, takePhoto->pPhoto->avatarStateBak, profileGender);
        {
            VecFx32 facingVec;
            MapObject_CopyFacingVector(PlayerAvatar_GetMapObject(fieldSystem->playerAvatar), &facingVec);
            facingVec.y -= FX32_CONST(2);
            MapObject_SetFacingVector(PlayerAvatar_GetMapObject(fieldSystem->playerAvatar), &facingVec);
        }
        if (takePhoto->pPhoto->subjectSpriteId) {
            takePhoto->state = TAKE_PHOTO_STATE_NPC_PHOTO_PLACE_NPC;
            takePhoto->numObjects = 2;
        } else {
            takePhoto->state = TAKE_PHOTO_STATE_PARTY_PHOTO_PLACE_MON_ITER;
            takePhoto->numObjects = takePhoto->pPhoto->numMons;
        }
        break;
    case TAKE_PHOTO_STATE_PARTY_PHOTO_PLACE_MON_ITER: {
        PhotoMon *mon = &takePhoto->pPhoto->party[takePhoto->curMon];
        if (mon->species != SPECIES_NONE) {
            takePhoto->mapObjects[takePhoto->curMon] = createPartymonMapObject(fieldSystem->mapObjectManager, mon->species, mon->form, mon->gender, DIR_SOUTH, takePhoto->pPhoto->x + sPhotoMonCoordOffsets[takePhoto->curMon].x, takePhoto->pPhoto->y + sPhotoMonCoordOffsets[takePhoto->curMon].y, mon->shiny);
            sub_0205F47C(takePhoto->mapObjects[takePhoto->curMon], ov01_021F7918);
        } else {
            takePhoto->mapObjects[takePhoto->curMon] = NULL;
        }
        ++takePhoto->curMon;
        takePhoto->state = TAKE_PHOTO_STATE_PARTY_PHOTO_ADJUST_MON_OBJ_ITER;
        break;
    }
    case TAKE_PHOTO_STATE_PARTY_PHOTO_ADJUST_MON_OBJ_ITER:
        if (takePhoto->positionMonDelayCounter++ > 4) {
            LocalMapObject *mapObject = takePhoto->mapObjects[takePhoto->curMon - 1];
            if (mapObject != NULL) {
                if (ov01_0220553C(mapObject)) {
                    ov01_021F902C(1, mapObject);
                }
                VecFx32 facingVec;
                MapObject_CopyFacingVector(mapObject, &facingVec);
                facingVec.y -= FX32_CONST(2);
                MapObject_SetFacingVector(mapObject, &facingVec);
                sub_0205F484(mapObject);
            }
            takePhoto->positionMonDelayCounter = 0;
            if (takePhoto->curMon >= takePhoto->pPhoto->numMons) {
                takePhoto->shutterDelayCounter = 0;
                takePhoto->state = TAKE_PHOTO_STATE_13;
            } else {
                takePhoto->state = TAKE_PHOTO_STATE_PARTY_PHOTO_PLACE_MON_ITER;
            }
        }
        break;
    case TAKE_PHOTO_STATE_NPC_PHOTO_PLACE_NPC:
        takePhoto->mapObjects[0] = createSpecialMapObject(fieldSystem->mapObjectManager, takePhoto->pPhoto->subjectSpriteId, DIR_SOUTH, takePhoto->pPhoto->x + 2, takePhoto->pPhoto->y, obj_photo_subject);
        takePhoto->state = TAKE_PHOTO_STATE_NPC_PHOTO_ADJUST_NPC;
        break;
    case TAKE_PHOTO_STATE_NPC_PHOTO_ADJUST_NPC:
        if (takePhoto->positionMonDelayCounter++ > 4) {
            VecFx32 facingVec;
            MapObject_CopyFacingVector(takePhoto->mapObjects[0], &facingVec);
            facingVec.y -= FX32_CONST(2);
            MapObject_SetFacingVector(takePhoto->mapObjects[0], &facingVec);
            sub_0205F484(takePhoto->mapObjects[0]);
            takePhoto->positionMonDelayCounter = 0;
            takePhoto->state = TAKE_PHOTO_STATE_NPC_PHOTO_PLACE_MON;
        }
        break;
    case TAKE_PHOTO_STATE_NPC_PHOTO_PLACE_MON: {
        PhotoMon *mon = &takePhoto->pPhoto->party[takePhoto->curMon];
        if (mon->species != SPECIES_NONE) {
            takePhoto->mapObjects[1] = createPartymonMapObject(fieldSystem->mapObjectManager, mon->species, mon->form, mon->gender, DIR_SOUTH, takePhoto->pPhoto->x + sSoloPhotoMonCoordOffsets.x, takePhoto->pPhoto->y + sSoloPhotoMonCoordOffsets.y, mon->shiny);
            sub_0205F47C(takePhoto->mapObjects[1], ov01_021F7918);
        } else {
            GF_ASSERT(FALSE);
            takePhoto->mapObjects[1] = NULL;
        }
        takePhoto->state = TAKE_PHOTO_STATE_NPC_PHOTO_ADJUST_MON;
        break;
    }
    case TAKE_PHOTO_STATE_NPC_PHOTO_ADJUST_MON:
        if (takePhoto->positionMonDelayCounter++ > 4) {
            LocalMapObject *mapObject = takePhoto->mapObjects[1];
            if (mapObject != NULL) {
                if (ov01_0220553C(mapObject)) {
                    ov01_021F902C(1, mapObject);
                }
                VecFx32 facingVec;
                MapObject_CopyFacingVector(mapObject, &facingVec);
                facingVec.y -= FX32_CONST(2);
                MapObject_SetFacingVector(mapObject, &facingVec);
                sub_0205F484(mapObject);
            }
            takePhoto->positionMonDelayCounter = 0;
            takePhoto->shutterDelayCounter = 0;
            takePhoto->state = TAKE_PHOTO_STATE_13;
        }
        break;
    case TAKE_PHOTO_STATE_13:
        ov01_022043D8(fieldSystem->unk_C8);
        ov01_02204424(fieldSystem->unk_C8);
        ov01_021EB1E8(fieldSystem->unk4->unk10);
        takePhoto->state = TAKE_PHOTO_STATE_DRAW_CAMERA_GFX;
        break;
    case TAKE_PHOTO_STATE_DRAW_CAMERA_GFX:
        drawCameraGfx(fieldSystem->bgConfig, HEAP_ID_FIELD1);
        CallTask_FadeFromBlack(taskManager);
        takePhoto->shutterState = 0;
        takePhoto->state = TAKE_PHOTO_STATE_SHUTTER;
        break;
    case TAKE_PHOTO_STATE_SHUTTER:
        switch (takePhoto->shutterState) {
        case TAKE_PHOTO_SHUTTER_STATE_INIT:
            ov01_021FB514(fieldSystem->unk4->unk1c);
            ++takePhoto->shutterState;
            // fallthrough
        case TAKE_PHOTO_SHUTTER_STATE_DELAY_BEFORE:
            if (takePhoto->shutterDelayCounter++ >= 30) {
                ++takePhoto->shutterState;
                takePhoto->shutterDelayCounter = 0;
            }
            break;
        case TAKE_PHOTO_SHUTTER_STATE_FADE_OUT:
            PlaySE(SEQ_SE_GS_SHUTTER);
            BeginNormalPaletteFade(3, 8, 0, RGB_BLACK, 6, 1, HEAP_ID_FIELD1);
            ++takePhoto->shutterState;
            break;
        case TAKE_PHOTO_SHUTTER_STATE_EXPOSURE:
            if (IsPaletteFadeFinished()) {
                PhotoAlbum *photoAlbum = Save_PhotoAlbum_Get(FieldSystem_GetSaveData(fieldSystem));
                u8 photoIndex = PhotoAlbum_GetIndexOfFirstEmptySlot(photoAlbum);
                RTCDate date;
                GF_RTC_CopyDate(&date);
                takePhoto->pPhoto->date = ((date.year & 0xFF) << 24) | ((date.month & 0xFF) << 16) | ((date.day & 0xFF) << 8) | date.week;
                RTCTime time;
                GF_RTC_CopyTime(&time);
                takePhoto->pPhoto->hour = time.hour;
                takePhoto->pPhoto->min = time.minute;
                PhotoAlbum_SetPhotoAtIndex(photoAlbum, &takePhoto->photoBuf, photoIndex);
                ++takePhoto->shutterState;
            }
            break;
        case TAKE_PHOTO_SHUTTER_STATE_FADE_IN:
            BeginNormalPaletteFade(3, 9, 0, RGB_BLACK, 6, 1, HEAP_ID_FIELD1);
            ++takePhoto->shutterState;
            break;
        case TAKE_PHOTO_SHUTTER_STATE_WAIT_FADE_IN:
            if (IsPaletteFadeFinished()) {
                ++takePhoto->shutterState;
            }
            break;
        case TAKE_PHOTO_SHUTTER_STATE_6:
            ov01_021FB4F4(fieldSystem->unk4->unk1c);
            ++takePhoto->shutterState;
            break;
        case TAKE_PHOTO_SHUTTER_STATE_DELAY_AFTER:
            if (takePhoto->shutterDelayCounter++ >= 30) {
                PaletteFadeUntilFinished(taskManager);
                takePhoto->state = TAKE_PHOTO_STATE_UNLOAD;
            }
            break;
        }
        break;
    case TAKE_PHOTO_STATE_UNLOAD:
        GF_RTC_UnfreezeTime();
        FieldTakePhoto_RemoveAllMapObjects(takePhoto);
        sub_0203E33C(fieldSystem, 0);
        CallTask_LeaveOverworld(taskManager);
        takePhoto->state = TAKE_PHOTO_STATE_RESTORE_PLAYER;
        break;
    case TAKE_PHOTO_STATE_RESTORE_PLAYER:
        sub_02067A80(fieldSystem, 0);
        FieldTakePhoto_SetLocationBuf(takePhoto, takePhoto->savedDirection, takePhoto->savedZ, takePhoto->savedX, takePhoto->savedMapId);
        sub_020537A8(taskManager, &takePhoto->locationBuf);
        takePhoto->state = TAKE_PHOTO_STATE_RESUME_OVERWORLD_AFTER;
        break;
    case TAKE_PHOTO_STATE_RESUME_OVERWORLD_AFTER:
        CallTask_RestoreOverworld(taskManager);
        takePhoto->state = TAKE_PHOTO_STATE_ADJUST_FOLLOW_MON;
        break;
    case TAKE_PHOTO_STATE_ADJUST_FOLLOW_MON:
        if (FollowMon_IsActive(fieldSystem) && PlayerAvatar_GetState(fieldSystem->playerAvatar) != PLAYER_STATE_CYCLING) {
            LocalMapObject *followMon = FollowMon_GetMapObject(fieldSystem);
            LocalMapObject *playerObj = PlayerAvatar_GetMapObject(fieldSystem->playerAvatar);
            MapObject_SetPositionFromVectorAndDirection(followMon, &takePhoto->followMonPositionVecBak, takePhoto->followMonFacingDirectionBak);

            int playerX = MapObject_GetXCoord(playerObj);
            int playerZ = MapObject_GetZCoord(playerObj);
            int followX = MapObject_GetXCoord(followMon);
            int followZ = MapObject_GetZCoord(followMon);

            if (playerX == followX && playerZ == followZ) {
                sub_02069DC8(followMon, TRUE);
            } else {
                sub_02069DC8(followMon, FALSE);
            }
            sub_0205F484(followMon);
        }
        takePhoto->state = TAKE_PHOTO_STATE_EXIT;
        break;
    case TAKE_PHOTO_STATE_EXIT:
        Heap_Free(takePhoto);
        return TRUE;
    }

    return FALSE;
}

static void sub_0206B82C(PlayerAvatar *playerAvatar, u8 state, u8 gender) {
    int spriteId = PlayerAvatar_GetSpriteByStateAndGender(state, gender);
    LocalMapObject *mapObject = PlayerAvatar_GetMapObject(playerAvatar);
    MapObjectManager *mapObjectManager = MapObject_GetManager(mapObject);
    int gfxId = MapObject_GetSpriteID(mapObject);
    sub_0205E420(mapObject);
    ov01_021FA108(mapObjectManager, gfxId, mapObject);
    sub_0205E38C(mapObject, spriteId);
    int r0 = PlayerAvatar_GetUnk34(playerAvatar);
    if (r0 != 0) {
        ov01_021F1640(r0);
    }
    PlayerAvatar_SetUnk34(playerAvatar, 0);
}

static void sub_0206B880(FieldSystem *fieldSystem, Photo *photo) {
    for (u8 i = 0; i < 2; ++i) {
        if (photo->unk_40[i] != 0) {
            sub_02054EB0(fieldSystem, photo->unk_40[i], TRUE);
        }
    }
}

static void drawCameraGfx(BgConfig *bgConfig, enum HeapID heapID) {
    GfGfxLoader_GXLoadPal(NARC_graphic_camera_viewfinder, NARC_camera_viewfinder_camera_viewfinder_NCLR, GF_PAL_LOCATION_MAIN_BG, (enum GFPalSlotOffset)0, 0, heapID);
    GfGfxLoader_LoadCharData(NARC_graphic_camera_viewfinder, NARC_camera_viewfinder_camera_viewfinder_NCGR_lz, bgConfig, GF_BG_LYR_MAIN_2, 0, 0, TRUE, heapID);
    GfGfxLoader_LoadScrnData(NARC_graphic_camera_viewfinder, NARC_camera_viewfinder_camera_viewfinder_NSCR_lz, bgConfig, GF_BG_LYR_MAIN_2, 0, 0x600, TRUE, heapID);
    BgCommitTilemapBufferToVram(bgConfig, GF_BG_LYR_MAIN_2);
    SetBgPriority(GF_BG_LYR_MAIN_2, 0);
}
