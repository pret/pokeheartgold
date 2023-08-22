#include "script.h"
#include "save_local_field_data.h"
#include "map_events.h"
#include "system.h"
#include "event_data.h"
#include "sys_vars.h"
#include "sys_flags.h"
#include "save_follow_poke.h"
#include "unk_02054E00.h"
#include "unk_0206793C.h"
#include "unk_0203BA5C.h"
#include "field_map_object.h"
#include "field_follow_poke.h"
#include "unk_02056D7C.h"
#include "field_system_rtc_weather.h"
#include "task.h"
#include "unk_02055244.h"
#include "sound.h"
#include "sound_02004A44.h"
#include "unk_02005D10.h"
#include "field_warp_tasks.h"
#include "unk_0203DFA4.h"
#include "unk_02054514.h"
#include "unk_02054648.h"
#include "unk_0200FA24.h"
#include "unk_020552A4.h"
#include "unk_02058AEC.h"
#include "unk_0205AC88.h"
#include "overlay_01.h"
#include "overlay_02.h"
#include "constants/maps.h"
#include "unk_0201F79C.h"
#include "unk_02055418.h"

struct UnkTaskEnv_02053688 {
    int unk0;
    Location location;
    int unk18;
};

struct UnkTaskEnv_02053950 {
    int unk0;
    UNK_0201F79C_Sub *unk4;
    Location location;
    u8 padding[4];
};

struct UnkTaskEnv_02053B3C {
    int unk0;
    int unk4;
    UNK_0201F79C_Sub *unk8;
    Location location;
};

struct UnkTaskEnv_02053CCC {
    int unk0;
    int unk4;
    Location location;
    UnkStruct_0206793C *unk1C;
};

struct UnkTaskEnv_02053E5C {
    int unk0;
    int unk4;
    Location location;
};

static void sub_02052F30(FieldSystem *fieldSystem);
static void sub_02052F94(FieldSystem *fieldSystem, Location *location);
static void sub_0205316C(FieldSystem *fieldSystem);
static void sub_02053210(FieldSystem *fieldSystem);
static void sub_0205323C(FieldSystem *fieldSystem);
static void sub_02053284(FieldSystem *fieldSystem);
static void sub_02053324(FieldSystem *fieldSystem);
static void _CopyPlayerPosToLocationWorkFacingSouth(Location *location, FieldSystem *fieldSystem);
static BOOL _IsPlayerStandingInFrontOfUnionRoomReception(FieldSystem *fieldSystem);
static void _SetDynamicWarpToUnionRoomExit(FieldSystem *fieldSystem);
static BOOL FieldTask_NewGame(TaskManager *taskManager);
static BOOL FieldTask_ContinueGame_Normal(TaskManager *taskManager);
static BOOL FieldTask_ContinueGame_CommError(TaskManager *taskManager);
static BOOL sub_02053688(TaskManager *taskManager);
static void sub_02053710(TaskManager *taskManager, Location *location);
static BOOL sub_02053740(TaskManager *taskManager);
static BOOL Task_ScriptWarp(TaskManager *taskManager);
static BOOL sub_02053950(TaskManager *taskManager);
static void sub_020539D8(TaskManager *taskManager);
static BOOL sub_020539E8(TaskManager *taskManager);
static void sub_02053A14(TaskManager *taskManager);
static BOOL sub_02053A2C(TaskManager *taskManager);
static void sub_02053AA0(TaskManager *taskManager);
static BOOL sub_02053AE4(TaskManager *taskManager);
static BOOL sub_02053B3C(TaskManager *taskManager);
static void sub_02053BE8(TaskManager *taskManager);
static BOOL sub_02053BF8(TaskManager *taskManager);
static void sub_02053C24(TaskManager *taskManager);
static BOOL sub_02053C3C(TaskManager *taskManager);
static void sub_02053C90(TaskManager *taskManager);
static BOOL sub_02053CCC(TaskManager *taskManager);
static BOOL sub_02053E5C(TaskManager *taskManager);
static BOOL sub_02053F70(TaskManager *taskManager);
static BOOL sub_020540A4(TaskManager *taskManager);

static const struct UnkStruct_020FC5CC _020FC5CC[] = {
    {1, 0, 0, 0, 0, 1, 0, 0, 64, 12},
    {1, 2, 0, 0, 0, 1,  0, 0, 64, 12},
    {3, 0, 0, 0, 0, 1, 0, 0, 64, 12},
    {1, 1, 1, 0, 1, 1, 1, 0, 64, 12},
    {1, 1, 1, 0, 1, 1, 1, 0, 0, 10},
    {6, 0, 0, 0, 0, 1, 0, 0, 64, 12},
};

static void sub_02052F30(FieldSystem *fieldSystem) {
    BOOL r2 = FALSE;

    switch (fieldSystem->location->mapId) {
    case MAP_D47R0102:
        fieldSystem->unk70 = 1;
        return;
    case MAP_D31R0201:
    case MAP_D31R0202:
    case MAP_D31R0203:
    case MAP_D31R0204:
    case MAP_D31R0205:
    case MAP_D31R0206:
    case MAP_D31R0207:
        r2 = TRUE;
        break;
    }
    if (fieldSystem->unk70 == 1) {
        fieldSystem->unk70 = 0;
    }
    if (!r2 && fieldSystem->unk70 == 4) {
        fieldSystem->unk70 = 0;
    }
    if (r2) {
        fieldSystem->unk70 = 4;
    }
}

static void sub_02052F94(FieldSystem *fieldSystem, Location *location) {
    LocalFieldData *localFieldData = Save_LocalFieldData_Get(fieldSystem->saveData);
    Location *r2 = LocalFieldData_GetPreviousPosition(localFieldData);
    const WARP_EVENT *warp;
    if (location != NULL) {
        *r2 = *fieldSystem->location;
        *fieldSystem->location = *location;
    }
    Field_InitMapEvents(fieldSystem, fieldSystem->location->mapId);
    if (fieldSystem->location->warpId != -1) {
        warp = Field_GetWarpEventI(fieldSystem, fieldSystem->location->warpId);
        fieldSystem->location->x = warp->x;
        fieldSystem->location->y = warp->y;
        if (warp->anchor == 0x100) {
            *LocalFieldData_GetDynamicWarp(localFieldData) = *LocalFieldData_GetEntrancePosition(localFieldData);
        }
    }
}

void sub_02053018(FieldSystem *fieldSystem) {
    GF_ASSERT(fieldSystem->unk70 < 6);
    gSystem.screensFlipped = fieldSystem->unk74->unk0_0C;
}

void sub_02053038(FieldSystem *fieldSystem, BOOL isConnection) {
    u32 mapId = fieldSystem->location->mapId;
    LocalFieldData *localFieldData = Save_LocalFieldData_Get(fieldSystem->saveData);
    SaveVarsFlags *varsFlags;
    u16 weather;
    u16 spawnId;

    FieldSystem_ClearSavedMusicId(fieldSystem);
    if (!fieldSystem->unkAC) {
        ClearTempFieldEventData(fieldSystem);
    }
    if (!isConnection) {
        sub_02067AE4(fieldSystem);
    } else {
        sub_02067A88(fieldSystem);
    }
    if (!fieldSystem->unkAC && !isConnection) {
        FieldSystem_StartBugContestTimer(fieldSystem);
    }
    if (!isConnection) {
        Save_Gymmick_Clear(Save_GetGymmickPtr(fieldSystem->saveData));
        SetLakeOfRageWaterLevel(fieldSystem->mapMatrix, ShouldUseAlternateLakeOfRage(fieldSystem->saveData, mapId));
    }
    varsFlags = Save_VarsFlags_Get(fieldSystem->saveData);
    weather = FieldSystem_GetWeather_HandleDiamondDust(fieldSystem, mapId);
    if (sub_02066C74(varsFlags, 1) && mapId == MAP_T29) {
        weather = 0;
    }
    if (weather == 9 && SysFlagDefogCheck(varsFlags) == TRUE) {
        weather = 0;
    }
    if (weather == 11 && SysFlagFlashCheck(varsFlags) == TRUE) {
        weather = 12;
    }
    LocalFieldData_SetWeatherType(localFieldData, weather);
    if (isConnection) {
        GF_ASSERT(LocalFieldData_GetCameraType(localFieldData) == MapHeader_GetCameraType(mapId));
    } else {
        LocalFieldData_SetCameraType(localFieldData, MapHeader_GetCameraType(mapId));
    }
    if (!isConnection) {
        spawnId = MapHeader_GetSpawnIdForDeathWarp(mapId);
        if (spawnId != 0) {
            LocalFieldData_SetBlackoutSpawn(localFieldData, spawnId);
        }
    }
    TryStartMapScriptByType(fieldSystem, 2);
    fieldSystem->unk7E = 0;
    fieldSystem->unk7C = 0;
    fieldSystem->unk78 = 0;
    SavFollowPoke_SetInhibitFlagState(Save_FollowPoke_Get(fieldSystem->saveData), FALSE);
    ClearFlag99A(Save_VarsFlags_Get(fieldSystem->saveData));
}

static void sub_0205316C(FieldSystem *fieldSystem) {
    u32 gender;
    struct PlayerSaveData *playerSaveData;
    if (fieldSystem->unkAC) {
        gender = PlayerProfile_GetTrainerGender(Save_PlayerData_GetProfileAddr(fieldSystem->saveData));
        playerSaveData = LocalFieldData_GetPlayer(Save_LocalFieldData_Get(fieldSystem->saveData));
        fieldSystem->playerAvatar = sub_0205C390(fieldSystem->mapObjectMan, fieldSystem->location->x, fieldSystem->location->y, fieldSystem->location->direction, playerSaveData->unk4, gender, 2, playerSaveData);
    } else {
        fieldSystem->mapObjectMan = sub_0205E0BC(fieldSystem, 64, HEAP_ID_BATTLE);
        gender = PlayerProfile_GetTrainerGender(Save_PlayerData_GetProfileAddr(fieldSystem->saveData));
        playerSaveData = LocalFieldData_GetPlayer(Save_LocalFieldData_Get(fieldSystem->saveData));
        fieldSystem->playerAvatar = sub_0205C390(fieldSystem->mapObjectMan, fieldSystem->location->x, fieldSystem->location->y, fieldSystem->location->direction, playerSaveData->unk4, gender, 2, playerSaveData);
        sub_020699F8(fieldSystem->mapObjectMan, fieldSystem->location->x, fieldSystem->location->y, fieldSystem->location->direction, fieldSystem->location->mapId);
        Field_InitMapObjectsFromZoneEventData(fieldSystem);
        sub_0205F55C(fieldSystem->mapObjectMan);
    }
}

static void sub_02053210(FieldSystem *fieldSystem) {
    if (fieldSystem->unkAC) {
        PlayerAvatar_DeleteFromMap(fieldSystem->playerAvatar);
    } else {
        sub_02056E38();
        PlayerAvatar_FreeToHeap(fieldSystem->playerAvatar);
        MapObjectManager_RemoveAllActiveObjects(fieldSystem->mapObjectMan);
        MapObjectManager_Delete(fieldSystem->mapObjectMan);
    }
}

static void sub_0205323C(FieldSystem *fieldSystem) {
    u32 gender;
    struct PlayerSaveData *playerSaveData;

    fieldSystem->mapObjectMan = sub_0205E0BC(fieldSystem, 64, HEAP_ID_BATTLE);
    FieldSystem_RestoreMapObjectsFromSave(fieldSystem);
    playerSaveData = LocalFieldData_GetPlayer(Save_LocalFieldData_Get(fieldSystem->saveData));
    gender = PlayerProfile_GetTrainerGender(Save_PlayerData_GetProfileAddr(fieldSystem->saveData));
    fieldSystem->playerAvatar = sub_0205C408(fieldSystem->mapObjectMan, playerSaveData, gender);
    sub_02069B74(fieldSystem->mapObjectMan, fieldSystem->location->mapId);
    sub_0205F55C(fieldSystem->mapObjectMan);
}

static void sub_02053284(FieldSystem *fieldSystem) {
    SaveVarsFlags *varsFlags;

    sub_02052F30(fieldSystem);
    GF_ASSERT(fieldSystem->unk60 == 0);
    MapMatrix_Load(fieldSystem->location->mapId, fieldSystem->mapMatrix);
    varsFlags = Save_VarsFlags_Get(fieldSystem->saveData);
    if (sub_02066C74(varsFlags, 0)) {
        RemoveMahoganyTownAntennaTree(fieldSystem->mapMatrix);
    }
    SetLakeOfRageWaterLevel(fieldSystem->mapMatrix, sub_02066C74(varsFlags, 1));
    PlaceSafariZoneAreas(fieldSystem->mapMatrix, fieldSystem->saveData);
    GF_ASSERT(fieldSystem->unk70 < 6);
    fieldSystem->unk74 = &_020FC5CC[fieldSystem->unk70];
    fieldSystem->unk64 = fieldSystem->unk74->unk0_04;
    fieldSystem->unk18 = fieldSystem->unk74->unk0_00;
    sub_0205489C(&fieldSystem->unk60, fieldSystem->unk74->unk0_08);
    if (fieldSystem->unk74->unk0_10) {
        sub_02054514(fieldSystem, fieldSystem->unk74->unk0_18);
    }
}

static void sub_02053324(FieldSystem *fieldSystem) {
    GF_ASSERT(fieldSystem->unk60 != 0);
    fieldSystem->unk60 = 0;
    fieldSystem->unk18 = 7;
    if (fieldSystem->unk74->unk0_10) {
        sub_0205453C(fieldSystem);
    }
    fieldSystem->unk74 = NULL;
}

static void _CopyPlayerPosToLocationWorkFacingSouth(Location *location, FieldSystem *fieldSystem) {
    int x, y;

    y = GetPlayerYCoord(fieldSystem->playerAvatar);
    x = GetPlayerXCoord(fieldSystem->playerAvatar);

    InitLocation(location, fieldSystem->location->mapId, -1, x, y, DIR_SOUTH);
}

static BOOL _IsPlayerStandingInFrontOfUnionRoomReception(FieldSystem *fieldSystem) {
    if (MapHeader_MapIsPokemonCenter(fieldSystem->location->mapId)
     && fieldSystem->location->x == 6 && fieldSystem->location->y == 6) {
        return TRUE;
    }

    if (MapHeader_MapIsPokemonLeagueLobby(fieldSystem->location->mapId)
     && fieldSystem->location->x == 3 && fieldSystem->location->y == 15) {
        return TRUE;
    }

    return FALSE;
}

static void _SetDynamicWarpToUnionRoomExit(FieldSystem *fieldSystem) {
    Location *dynamicWarp = LocalFieldData_GetDynamicWarp(Save_LocalFieldData_Get(fieldSystem->saveData));
    SaveVarsFlags *varsFlags = Save_VarsFlags_Get(fieldSystem->saveData); // unused
    if (MapHeader_MapIsPokemonLeagueLobby(fieldSystem->location->mapId) == TRUE) {
        InitLocation(dynamicWarp, fieldSystem->location->mapId, -1, 4, 11, DIR_SOUTH);
    } else {
        InitLocation(dynamicWarp, fieldSystem->location->mapId, -1, 7, 2, DIR_SOUTH);
    }
}

static BOOL FieldTask_NewGame(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    u32 *state_p = TaskManager_GetStatePtr(taskManager);

    switch (*state_p) {
    case 0:
        sub_02052F94(fieldSystem, fieldSystem->location);
        sub_02053284(fieldSystem);
        sub_02053038(fieldSystem, FALSE);
        sub_0205316C(fieldSystem);
        (*state_p)++;
        break;
    case 1:
        sub_02055408(taskManager);
        (*state_p)++;
        break;
    case 2:
        return TRUE;
    }

    return FALSE;
}

TaskManager *CallFieldTask_NewGame(FieldSystem *fieldSystem) {
    fieldSystem->unk70 = 0;
    RunInitScript(fieldSystem);
    return FieldSystem_CreateTask(fieldSystem, FieldTask_NewGame, NULL);
}

static BOOL FieldTask_ContinueGame_Normal(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    SaveVarsFlags *varsFlags = Save_VarsFlags_Get(fieldSystem->saveData);
    LocalFieldData *localFieldData;
    u32 *state_p = TaskManager_GetStatePtr(taskManager);

    switch (*state_p) {
    case 0:
        if (CheckFlag966(varsFlags)) {
            localFieldData = Save_LocalFieldData_Get(fieldSystem->saveData);
            if (_IsPlayerStandingInFrontOfUnionRoomReception(fieldSystem)) {
                _SetDynamicWarpToUnionRoomExit(fieldSystem);
            }
            ClearFlag966(varsFlags);
            sub_02052F94(fieldSystem, LocalFieldData_GetDynamicWarp(localFieldData));
            sub_02053284(fieldSystem);
            sub_02053038(fieldSystem, FALSE);
            sub_0205316C(fieldSystem);
        } else {
            sub_02052F94(fieldSystem, NULL);
            sub_02053284(fieldSystem);
            FieldSystem_StartBugContestTimer(fieldSystem);
            sub_0205323C(fieldSystem);
        }
        sub_02067BE8(fieldSystem);
        *state_p = 2;
        break;
    case 2:
        sub_02055408(taskManager);
        *state_p = 3;
        break;
    case 3:
        return TRUE;
    }

    return FALSE;
}

TaskManager *CallFieldTask_ContinueGame_Normal(FieldSystem *fieldSystem) {
    fieldSystem->unk70 = 0;
    return FieldSystem_CreateTask(fieldSystem, FieldTask_ContinueGame_Normal, NULL);
}

static BOOL FieldTask_ContinueGame_CommError(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    struct ErrorContinueEnv *env = TaskManager_GetEnv(taskManager);
    SaveVarsFlags *varsFlags = Save_VarsFlags_Get(fieldSystem->saveData);
    u32 *state_p = TaskManager_GetStatePtr(taskManager);

    switch (*state_p) {
    case 0:
        sub_0200FBF4(0, 0);
        sub_0200FBF4(1, 0);
        (*state_p)++;
        break;
    case 1:
        sub_02052F94(fieldSystem, &env->location);
        sub_02053284(fieldSystem);
        sub_02053038(fieldSystem, FALSE);
        sub_0205316C(fieldSystem);
        (*state_p)++;
        break;
    case 2:
        fieldSystem->unk80 = sub_02059DB0(fieldSystem);
        fieldSystem->unk84 = sub_0205AC88(fieldSystem->unk80);
        sub_020552A4(taskManager);
        (*state_p)++;
        break;
    case 3:
        env->state = 0;
        ov01_021F35C4(fieldSystem, 0, &env->state);
        (*state_p)++;
        break;
    case 4:
        if (env->state) {
            (*state_p)++;
        }
        break;
    case 5:
        FreeToHeap(env);
        return TRUE;
    }

    return FALSE;
}

TaskManager *CallFieldTask_ContinueGame_CommError(FieldSystem *fieldSystem) {
    SaveVarsFlags *varsFlags;
    struct ErrorContinueEnv *env;
    if (!MapHeader_MapIsUnionRoom(fieldSystem->location->mapId)) {
        if (_IsPlayerStandingInFrontOfUnionRoomReception(fieldSystem)) {
            varsFlags = Save_VarsFlags_Get(fieldSystem->saveData);
            _SetDynamicWarpToUnionRoomExit(fieldSystem);
            SetFlag966(varsFlags);
        } else {
            return CallFieldTask_ContinueGame_Normal(fieldSystem);
        }
    }
    env = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(struct ErrorContinueEnv));
    env->state = 0;
    InitLocation(&env->location, MAP_UNION, -1, 8, 14, DIR_NORTH);
    fieldSystem->unk70 = 2;
    return FieldSystem_CreateTask(fieldSystem, FieldTask_ContinueGame_CommError, env);
}

static BOOL sub_02053688(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    struct UnkTaskEnv_02053688 *env = TaskManager_GetEnv(taskManager);

    switch (env->unk0) {
    case 0:
        PlaySE(SEQ_SE_DP_KAIDAN2);
        FieldSystem_BeginFadeOutMusic(fieldSystem, env->location.mapId);
        sub_020553B0(taskManager);
        env->unk0++;
        break;
    case 1:
        sub_020537A8(taskManager, &env->location);
        env->unk0++;
        break;
    case 2:
        if (GF_SndGetFadeTimer() != 0) {
            break;
        }
        sub_02055110(fieldSystem, env->location.mapId, 0);
        sub_02055408(taskManager);
        env->unk0++;
        break;
    case 3:
        FreeToHeap(env);
        return TRUE;
    }

    return FALSE;
}

static void sub_02053710(TaskManager *taskManager, Location *location) {
    struct UnkTaskEnv_02053688 *env = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(struct UnkTaskEnv_02053688));
    env->unk0 = 0;
    env->location = *location;
    TaskManager_Call(taskManager, sub_02053688, env);
}

static BOOL sub_02053740(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    struct ErrorContinueEnv *env = TaskManager_GetEnv(taskManager);

    switch (env->state) {
    case 0:
        sub_02053210(fieldSystem);
        sub_02053324(fieldSystem);
        env->state++;
        break;
    case 1:
        sub_02052F94(fieldSystem, &env->location);
        sub_02053284(fieldSystem);
        sub_02053038(fieldSystem, FALSE);
        env->state++;
        break;
    case 2:
        sub_0205316C(fieldSystem);
        FreeToHeap(env);
        return TRUE;
    }

    return FALSE;
}

void sub_020537A8(TaskManager *taskManager, Location *location) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    struct ErrorContinueEnv *env = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(struct ErrorContinueEnv));
    if (sub_0203DF7C(fieldSystem)) {
        GF_ASSERT(0);
        return;
    }
    env->state = 0;
    env->location = *location;
    TaskManager_Call(taskManager, sub_02053740, env);
}

void sub_020537F0(TaskManager *taskManager, u32 mapId, int warpId, int x, int y, int direction) {
    Location location = {
        mapId,
        warpId,
        x,
        y,
        direction
    };

    sub_020537A8(taskManager, &location);
}

static BOOL Task_ScriptWarp(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    struct ErrorContinueEnv *env = TaskManager_GetEnv(taskManager);

    switch (env->state) {
    case 0:
        FieldSystem_BeginFadeOutMusic(fieldSystem, env->location.mapId);
        sub_0205525C(taskManager);
        env->state++;
        break;
    case 1:
        sub_020537A8(taskManager, &env->location);
        env->state++;
        break;
    case 2:
        if (GF_SndGetFadeTimer() != 0) {
            break;
        }
        sub_02055110(fieldSystem, env->location.mapId, 0);
        sub_020552A4(taskManager);
        env->state++;
        break;
    case 3:
        FreeToHeap(env);
        return TRUE;
    }

    return FALSE;
}

void CallTask_ScriptWarp(TaskManager *taskManager, u32 mapId, int warpId, int x, int y, int direction) {
    struct ErrorContinueEnv *env = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(struct ErrorContinueEnv));
    env->state = 0;
    InitLocation(&env->location, mapId, warpId, x, y, direction);
    TaskManager_Call(taskManager, Task_ScriptWarp, env);
}

TaskManager *sub_020538C0(FieldSystem *fieldSystem, u32 mapId, int warpId, int x, int y, int direction) {
    Location location = {
        mapId,
        warpId,
        x,
        y,
        direction
    };
    struct UnkTaskEnv_02053950 *env = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(struct UnkTaskEnv_02053950));
    env->unk0 = 0;
    env->unk4 = 0;
    env->location = location;
    return FieldSystem_CreateTask(fieldSystem, sub_02053950, env);
}

void sub_02053908(TaskManager *taskManager, u32 mapId, int warpId, int x, int y, int direction) {
    Location location = {
        mapId,
        warpId,
        x,
        y,
        direction
    };
    struct UnkTaskEnv_02053950 *env = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(struct UnkTaskEnv_02053950));
    env->unk0 = 0;
    env->unk4 = NULL;
    env->location = location;
    TaskManager_Jump(taskManager, sub_02053950, env);
}

static BOOL sub_02053950(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    struct UnkTaskEnv_02053950 *env = TaskManager_GetEnv(taskManager);
    Location *location = &env->location;
    switch (env->unk0) {
    case 0:
        FieldSystem_BeginFadeOutMusic(fieldSystem, location->mapId);
        sub_020539D8(taskManager);
        env->unk0++;
        break;
    case 1:
        PlayerAvatar_SetState(fieldSystem->playerAvatar, PLAYER_STATE_WALKING);
        sub_020537A8(taskManager, &env->location);
        env->unk0++;
        break;
    case 2:
        if (GF_SndGetFadeTimer() != 0) {
            break;
        }
        sub_02067B88(fieldSystem);
        sub_02053A14(taskManager);
        env->unk0++;
        break;
    case 3:
        FreeToHeap(env);
        return TRUE;
    }

    return FALSE;
}

static void sub_020539D8(TaskManager *taskManager) {
    TaskManager_Call(taskManager, sub_020539E8, NULL);
}

static BOOL sub_020539E8(TaskManager *taskManager) {
    u32 *state_p = TaskManager_GetStatePtr(taskManager);

    switch (*state_p) {
    case 0:
        sub_0205525C(taskManager);
        (*state_p)++;
        break;
    case 1:
        return TRUE;
    }

    return FALSE;
}

static void sub_02053A14(TaskManager *taskManager) {
    TaskManager_Call(taskManager, sub_02053A2C, TaskManager_GetEnv(taskManager));
}

static BOOL sub_02053A2C(TaskManager *taskManager) {
    u32 *state_p = TaskManager_GetStatePtr(taskManager);
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    switch (*state_p) {
    case 0:
        sub_020552A4(taskManager);
        (*state_p)++;
        break;
    case 1:
        sub_0200615C(5, 10);
        GF_SndHandleMoveVolume(0, 128, 15);
        fieldSystem->unkC4 = -1;
        sub_02055110(fieldSystem, fieldSystem->location->mapId, 1);
        ov01_021EFAF8(fieldSystem);
        sub_02053AA0(taskManager);
        (*state_p)++;
        break;
    case 2:
        return TRUE;
    }

    return FALSE;
}

static void sub_02053AA0(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    struct UnkTaskEnv_02053950 *env = TaskManager_GetEnv(taskManager);
    if (!sub_0203DF7C(fieldSystem)) {
        GF_ASSERT(0);
        return;
    }
    env->unk4 = ov02_0224B418(fieldSystem, PlayerAvatar_GetGender(fieldSystem->playerAvatar));
    TaskManager_Call(taskManager, sub_02053AE4, env);
}

static BOOL sub_02053AE4(TaskManager *taskManager) {
    struct UnkTaskEnv_02053950 *env = TaskManager_GetEnv(taskManager);
    if (ov02_0224B43C(env->unk4) == TRUE) {
        ov02_0224B448(env->unk4);
        return TRUE;
    }

    return FALSE;
}

void sub_02053B04(TaskManager *taskManager, Location *location, int a2) {
    struct UnkTaskEnv_02053B3C *env = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(struct UnkTaskEnv_02053B3C));
    env->unk0 = 0;
    env->unk4 = a2;
    env->unk8 = NULL;
    env->location = *location;
    TaskManager_Jump(taskManager, sub_02053B3C, env);
}

static BOOL sub_02053B3C(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    struct UnkTaskEnv_02053B3C *env = TaskManager_GetEnv(taskManager);
    Location *location = &env->location;

    switch (env->unk0) {
    case 0:
        FieldSystem_BeginFadeOutMusic(fieldSystem, location->mapId);
        sub_02053BE8(taskManager);
        env->unk0++;
        break;
    case 1:
        PlayerAvatar_SetState(fieldSystem->playerAvatar, PLAYER_STATE_WALKING);
        sub_020537A8(taskManager, &env->location);
        env->unk0++;
        break;
    case 2:
        if (GF_SndGetFadeTimer() != 0) {
            break;
        }
        sub_02055110(fieldSystem, location->mapId, 0);
        if (env->unk4 == 2) {
            sub_02067BA4(fieldSystem);
        } else if (env->unk4 == 0 || env->unk4 == 1) {
            sub_02067BC0(fieldSystem);
        } else {
            GF_ASSERT(0);
        }
        sub_02053C24(taskManager);
        env->unk0++;
        break;
    case 3:
        FreeToHeap(env);
        return TRUE;
    }

    return FALSE;
}

static void sub_02053BE8(TaskManager *taskManager) {
    TaskManager_Call(taskManager, sub_02053BF8, NULL);
}

static BOOL sub_02053BF8(TaskManager *taskManager) {
    u32 *state_p = TaskManager_GetStatePtr(taskManager);

    switch (*state_p) {
    case 0:
        sub_0205525C(taskManager);
        (*state_p)++;
        break;
    case 1:
        return TRUE;
    }

    return FALSE;
}

static void sub_02053C24(TaskManager *taskManager) {
    struct UnkTaskEnv_02053B3C *env = TaskManager_GetEnv(taskManager);
    TaskManager_Call(taskManager, sub_02053C3C, env);
}

static BOOL sub_02053C3C(TaskManager *taskManager) {
    u32 *state_p = TaskManager_GetStatePtr(taskManager);
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    struct UnkTaskEnv_02053B3C *env = TaskManager_GetEnv(taskManager); // unused

    switch (*state_p) {
    case 0:
        sub_020552A4(taskManager);
        (*state_p)++;
        break;
    case 1:
        ov01_021EFAF8(fieldSystem);
        sub_02053C90(taskManager);
        (*state_p)++;
        break;
    case 2:
        return TRUE;
    }

    return FALSE;
}

static void sub_02053C90(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    struct UnkTaskEnv_02053B3C *env = TaskManager_GetEnv(taskManager);

    if (!sub_0203DF7C(fieldSystem)) {
        GF_ASSERT(0);
        return;
    }
    TaskManager_Call(taskManager, ov02_0224C1F8, ov02_0224C1D8(fieldSystem, 4, env->unk4));
}

static BOOL sub_02053CCC(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    struct UnkTaskEnv_02053CCC *env = TaskManager_GetEnv(taskManager);
    Location *location = &env->location;
    struct LocalMapObject *follow_poke_obj;

    switch (env->unk0) {
    case 0:
        env->unk1C = 0;
        if (FollowingPokemon_IsActive(fieldSystem)
         && !ov01_022057C4(fieldSystem)
         && PlayerAvatar_GetState(fieldSystem->playerAvatar) != 1) {
            env->unk1C = ov01_0220329C(FollowingPokemon_GetMapObject(fieldSystem), 1);
        }
        env->unk0++;
        break;
    case 1:
        if (env->unk1C == 0 || !sub_02068CCC(env->unk1C)) {
            ov01_021F35C4(fieldSystem, 1, &env->unk4);
            env->unk0++;
        }
        break;
    case 2:
        if (env->unk4) {
            FieldSystem_BeginFadeOutMusic(fieldSystem, location->mapId);
            sub_0205525C(taskManager);
            env->unk0++;
        }
        break;
    case 3:
        sub_020537A8(taskManager, location);
        env->unk0++;
        break;
    case 4:
        if (GF_SndGetFadeTimer() != 0) {
            break;
        }
        sub_02055110(fieldSystem, location->mapId, 0);
        sub_020552A4(taskManager);
        env->unk0++;
        break;
    case 5:
        env->unk4 = 0;
        ov01_021F35C4(fieldSystem, 0, &env->unk4);
        if (FollowingPokemon_IsActive(fieldSystem)) {
            follow_poke_obj = FollowingPokemon_GetMapObject(fieldSystem);
            if (GetFollowPokePermissionBySpeciesAndMap(FollowPokeObj_GetSpecies(follow_poke_obj), location->mapId)) {
                sub_02069E84(follow_poke_obj, 1);
                ov01_02205790(fieldSystem, 1);
            }
        }
        env->unk0++;
        break;
    case 6:
        if (env->unk4) {
            env->unk0++;
        }
        break;
    case 7:
        FreeToHeap(env);
        return TRUE;
    }

    return FALSE;
}

TaskManager *sub_02053E08(FieldSystem *fieldSystem, u32 mapId, int warpId) {
    struct UnkTaskEnv_02053CCC *env;
    Location location;
    int direction;

    env = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(struct UnkTaskEnv_02053CCC));
    MI_CpuClear8(env, sizeof(struct UnkTaskEnv_02053CCC));
    direction = PlayerAvatar_GetFacingDirection(fieldSystem->playerAvatar);
    InitLocation(&location, mapId, warpId, 0, 0, direction);
    env->location = location;
    return FieldSystem_CreateTask(fieldSystem, sub_02053CCC, env);
}

static BOOL sub_02053E5C(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    struct UnkTaskEnv_02053E5C *env = TaskManager_GetEnv(taskManager);
    u32 *state_p = TaskManager_GetStatePtr(taskManager);
    Location *location = &env->location;

    switch (*state_p) {
    case 0:
        FieldSystem_BeginFadeOutMusic(fieldSystem, location->mapId);
        ov01_021F35C4(fieldSystem, 1, &env->unk4);
        (*state_p)++;
        break;
    case 1:
        if (env->unk4) {
            sub_0205525C(taskManager);
            (*state_p)++;
        }
        break;
    case 2:
        sub_020537A8(taskManager, location);
        (*state_p)++;
        break;
    case 3:
        if (GF_SndGetFadeTimer() != 0) {
            break;
        }
        sub_02055110(fieldSystem, location->mapId, 0);
        sub_020552A4(taskManager);
        (*state_p)++;
        break;
    case 4:
        sub_0205532C(taskManager);
        (*state_p)++;
        break;
    case 5:
        FreeToHeap(env);
        return TRUE;
    }

    return FALSE;
}

void sub_02053F14(FieldSystem *fieldSystem) {
    Location *location = LocalFieldData_GetDynamicWarp(Save_LocalFieldData_Get(fieldSystem->saveData));
    struct UnkTaskEnv_02053E5C *env = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(struct UnkTaskEnv_02053E5C));
    MI_CpuClear8(env, sizeof(struct UnkTaskEnv_02053E5C));
    env->location = *location;
    sub_02059E04(fieldSystem);
    sub_0205AD3C(fieldSystem->unk84);
    fieldSystem->unk70 = 0;
    FieldSystem_CreateTask(fieldSystem, sub_02053E5C, env);
    fieldSystem->unk80 = NULL;
}

static BOOL sub_02053F70(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    struct UnkTaskEnv_02053E5C *env = TaskManager_GetEnv(taskManager);
    u32 *state_p = TaskManager_GetStatePtr(taskManager);
    Location *location = &env->location;

    switch (*state_p) {
    case 0:
        FieldSystem_BeginFadeOutMusic(fieldSystem, location->mapId);
        PalleteFadeUntilFinished(taskManager);
        (*state_p)++;
        break;
    case 1:
        sub_0205525C(taskManager);
        (*state_p)++;
        break;
    case 2:
        sub_020537A8(taskManager, location);
        (*state_p)++;
        break;
    case 3:
        if (GF_SndGetFadeTimer() != 0) {
            break;
        }
        sub_02055110(fieldSystem, location->mapId, 0);
        sub_020552A4(taskManager);
        (*state_p)++;
        break;
    case 4:
        env->unk4 = 0;
        ov01_021F35C4(fieldSystem, 0, &env->unk4);
        (*state_p)++;
        break;
    case 5:
        if (env->unk4) {
            (*state_p)++;
        }
        break;
    case 6:
        FreeToHeap(env);
        return TRUE;
    }

    return FALSE;
}

void sub_02054030(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    Location *location = LocalFieldData_GetDynamicWarp(Save_LocalFieldData_Get(fieldSystem->saveData));
    struct UnkTaskEnv_02053E5C *env = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(struct UnkTaskEnv_02053E5C));
    MI_CpuClear8(env, sizeof(struct UnkTaskEnv_02053E5C));
    _CopyPlayerPosToLocationWorkFacingSouth(location, fieldSystem);
    InitLocation(&env->location, MAP_UNION, -1, 8, 14, DIR_NORTH);
    fieldSystem->unk80 = sub_02059DB0(fieldSystem);
    fieldSystem->unk84 = sub_0205AC88(fieldSystem->unk80);
    fieldSystem->unk70 = 2;
    TaskManager_Call(taskManager, sub_02053F70, env);
}

static BOOL sub_020540A4(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    struct UnkTaskEnv_02053688 *env = TaskManager_GetEnv(taskManager);

    switch (env->unk0) {
    case 0:
        PlaySE(SEQ_SE_DP_KAIDAN2);
        FieldSystem_BeginFadeOutMusic(fieldSystem, env->location.mapId);
        sub_020553B0(taskManager);
        env->unk0++;
        break;
    case 1:
        sub_020537A8(taskManager, &env->location);
        env->unk0++;
        break;
    case 2:
        if (GF_SndGetFadeTimer() != 0) {
            break;
        }
        sub_02055110(fieldSystem, env->location.mapId, 0);
        sub_020552A4(taskManager);
        env->unk0++;
        break;
    case 3:
        FreeToHeap(env);
        return TRUE;
    }

    return FALSE;
}

void sub_0205412C(TaskManager *taskManager, u32 mapId, int warpId, int x, int y, int direction) {
    struct UnkTaskEnv_02053688 *env;
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    _CopyPlayerPosToLocationWorkFacingSouth(LocalFieldData_GetDynamicWarp(Save_LocalFieldData_Get(fieldSystem->saveData)), fieldSystem);
    fieldSystem->unk70 = 3;
    env = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(struct UnkTaskEnv_02053688));
    {
        Location location = {
            mapId,
            warpId,
            x,
            y,
            direction
        };
        env->unk0 = 0;
        env->location = location;
    }
    TaskManager_Call(taskManager, sub_020540A4, env);
}

void sub_02054190(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    Location *location = LocalFieldData_GetDynamicWarp(Save_LocalFieldData_Get(fieldSystem->saveData));
    fieldSystem->unk70 = 0;
    sub_02053710(fieldSystem->taskman, location);
}
