#include "script.h"
#include "save_flypoints.h"
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
#include "diamond_dust.h"
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

static void sub_02052F30(FieldSystem *fsys);
static void sub_02052F94(FieldSystem *fsys, Location *location);
static void sub_0205316C(FieldSystem *fsys);
static void sub_02053210(FieldSystem *fsys);
static void sub_0205323C(FieldSystem *fsys);
static void sub_02053284(FieldSystem *fsys);
static void sub_02053324(FieldSystem *fsys);
static void _CopyPlayerPosToLocationWorkFacingSouth(Location *location, FieldSystem *fsys);
static BOOL _IsPlayerStandingInFrontOfUnionRoomReception(FieldSystem *fsys);
static void _SetDynamicWarpToUnionRoomExit(FieldSystem *fsys);
static BOOL sub_02053414(TaskManager *taskManager);
static BOOL sub_0205348C(TaskManager *taskManager);
static BOOL sub_02053550(TaskManager *taskManager);
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

static void sub_02052F30(FieldSystem *fsys) {
    BOOL r2 = FALSE;

    switch (fsys->location->mapId) {
    case MAP_D47R0102:
        fsys->unk70 = 1;
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
    if (fsys->unk70 == 1) {
        fsys->unk70 = 0;
    }
    if (!r2 && fsys->unk70 == 4) {
        fsys->unk70 = 0;
    }
    if (r2) {
        fsys->unk70 = 4;
    }
}

static void sub_02052F94(FieldSystem *fsys, Location *location) {
    FLYPOINTS_SAVE *flypointsSave = Save_FlyPoints_get(fsys->savedata);
    Location *r2 = sub_0203B960(flypointsSave);
    const WARP_EVENT *warp;
    if (location != NULL) {
        *r2 = *fsys->location;
        *fsys->location = *location;
    }
    Field_InitMapEvents(fsys, fsys->location->mapId);
    if (fsys->location->warpId != -1) {
        warp = Field_GetWarpEventI(fsys, fsys->location->warpId);
        fsys->location->x = warp->x;
        fsys->location->y = warp->y;
        if (warp->anchor == 0x100) {
            *FlyPoints_GetDynamicWarp(flypointsSave) = *sub_0203B95C(flypointsSave);
        }
    }
}

void sub_02053018(FieldSystem *fsys) {
    GF_ASSERT(fsys->unk70 < 6);
    gSystem.screensFlipped = fsys->unk74->unk0_0C;
}

void sub_02053038(FieldSystem *fsys, BOOL isConnection) {
    u32 mapId = fsys->location->mapId;
    FLYPOINTS_SAVE *flyPoints = Save_FlyPoints_get(fsys->savedata);
    SCRIPT_STATE *scriptState;
    u16 weather;
    u16 spawnId;

    Fsys_ClearSavedMusicId(fsys);
    if (!fsys->unkAC) {
        ClearTempFieldEventData(fsys);
    }
    if (!isConnection) {
        sub_02067AE4(fsys);
    } else {
        sub_02067A88(fsys);
    }
    if (!fsys->unkAC && !isConnection) {
        FieldSys_StartBugContestTimer(fsys);
    }
    if (!isConnection) {
        SavGymmick_Clear(Sav2_GetGymmickPtr(fsys->savedata));
        SetLakeOfRageWaterLevel(fsys->map_matrix, ShouldUseAlternateLakeOfRage(fsys->savedata, mapId));
    }
    scriptState = SavArray_Flags_get(fsys->savedata);
    weather = Fsys_GetWeather_HandleDiamondDust(fsys, mapId);
    if (sub_02066C74(scriptState, 1) && mapId == MAP_T29) {
        weather = 0;
    }
    if (weather == 9 && SysFlagDefogCheck(scriptState) == TRUE) {
        weather = 0;
    }
    if (weather == 11 && SysFlagFlashCheck(scriptState) == TRUE) {
        weather = 12;
    }
    FlyPoints_SetWeatherType(flyPoints, weather);
    if (isConnection) {
        GF_ASSERT(FlyPoints_GetCameraType(flyPoints) == MapHeader_GetCameraType(mapId));
    } else {
        FlyPoints_SetCameraType(flyPoints, MapHeader_GetCameraType(mapId));
    }
    if (!isConnection) {
        spawnId = MapHeader_GetSpawnIdForDeathWarp(mapId);
        if (spawnId != 0) {
            FlyPoints_SetDeathSpawn(flyPoints, spawnId);
        }
    }
    TryStartMapScriptByType(fsys, 2);
    fsys->unk7E = 0;
    fsys->unk7C = 0;
    fsys->unk78 = 0;
    SavFollowPoke_SetInhibitFlagState(Sav2_FollowPoke_get(fsys->savedata), FALSE);
    ClearFlag99A(SavArray_Flags_get(fsys->savedata));
}

static void sub_0205316C(FieldSystem *fsys) {
    u32 gender;
    struct FlypointsPlayerSub *avatar_sub;
    if (fsys->unkAC) {
        gender = PlayerProfile_GetTrainerGender(Sav2_PlayerData_GetProfileAddr(fsys->savedata));
        avatar_sub = SaveFlyPoints_GetPlayerSub(Save_FlyPoints_get(fsys->savedata));
        fsys->playerAvatar = sub_0205C390(fsys->mapObjectMan, fsys->location->x, fsys->location->y, fsys->location->direction, avatar_sub->unk4, gender, 2, avatar_sub);
    } else {
        fsys->mapObjectMan = sub_0205E0BC(fsys, 64, 5);
        gender = PlayerProfile_GetTrainerGender(Sav2_PlayerData_GetProfileAddr(fsys->savedata));
        avatar_sub = SaveFlyPoints_GetPlayerSub(Save_FlyPoints_get(fsys->savedata));
        fsys->playerAvatar = sub_0205C390(fsys->mapObjectMan, fsys->location->x, fsys->location->y, fsys->location->direction, avatar_sub->unk4, gender, 2, avatar_sub);
        sub_020699F8(fsys->mapObjectMan, fsys->location->x, fsys->location->y, fsys->location->direction, fsys->location->mapId);
        Field_InitMapObjectsFromZoneEventData(fsys);
        sub_0205F55C(fsys->mapObjectMan);
    }
}

static void sub_02053210(FieldSystem *fsys) {
    if (fsys->unkAC) {
        sub_0205C4CC(fsys->playerAvatar);
    } else {
        sub_02056E38();
        sub_0205C4C4(fsys->playerAvatar);
        sub_0205E494(fsys->mapObjectMan);
        sub_0205E0E8(fsys->mapObjectMan);
    }
}

static void sub_0205323C(FieldSystem *fsys) {
    u32 gender;
    struct FlypointsPlayerSub *avatar_sub;

    fsys->mapObjectMan = sub_0205E0BC(fsys, 64, 5);
    Fsys_RestoreMapObjectsFromSave(fsys);
    avatar_sub = SaveFlyPoints_GetPlayerSub(Save_FlyPoints_get(fsys->savedata));
    gender = PlayerProfile_GetTrainerGender(Sav2_PlayerData_GetProfileAddr(fsys->savedata));
    fsys->playerAvatar = sub_0205C408(fsys->mapObjectMan, avatar_sub, gender);
    sub_02069B74(fsys->mapObjectMan, fsys->location->mapId);
    sub_0205F55C(fsys->mapObjectMan);
}

static void sub_02053284(FieldSystem *fsys) {
    SCRIPT_STATE *scriptState;

    sub_02052F30(fsys);
    GF_ASSERT(fsys->unk60 == 0);
    MapMatrix_Load(fsys->location->mapId, fsys->map_matrix);
    scriptState = SavArray_Flags_get(fsys->savedata);
    if (sub_02066C74(scriptState, 0)) {
        RemoveMahoganyTownAntennaTree(fsys->map_matrix);
    }
    SetLakeOfRageWaterLevel(fsys->map_matrix, sub_02066C74(scriptState, 1));
    PlaceSafariZoneAreas(fsys->map_matrix, fsys->savedata);
    GF_ASSERT(fsys->unk70 < 6);
    fsys->unk74 = &_020FC5CC[fsys->unk70];
    fsys->unk64 = fsys->unk74->unk0_04;
    fsys->unk18 = fsys->unk74->unk0_00;
    sub_0205489C(&fsys->unk60, fsys->unk74->unk0_08);
    if (fsys->unk74->unk0_10) {
        sub_02054514(fsys, fsys->unk74->unk0_18);
    }
}

static void sub_02053324(FieldSystem *fsys) {
    GF_ASSERT(fsys->unk60 != 0);
    fsys->unk60 = 0;
    fsys->unk18 = 7;
    if (fsys->unk74->unk0_10) {
        sub_0205453C(fsys);
    }
    fsys->unk74 = NULL;
}

static void _CopyPlayerPosToLocationWorkFacingSouth(Location *location, FieldSystem *fsys) {
    int x, y;

    y = GetPlayerYCoord(fsys->playerAvatar);
    x = GetPlayerXCoord(fsys->playerAvatar);

    InitLocation(location, fsys->location->mapId, -1, x, y, DIR_SOUTH);
}

static BOOL _IsPlayerStandingInFrontOfUnionRoomReception(FieldSystem *fsys) {
    if (MapHeader_MapIsPokemonCenter(fsys->location->mapId)
     && fsys->location->x == 6 && fsys->location->y == 6) {
        return TRUE;
    }

    if (MapHeader_MapIsPokemonLeagueLobby(fsys->location->mapId)
     && fsys->location->x == 3 && fsys->location->y == 15) {
        return TRUE;
    }

    return FALSE;
}

static void _SetDynamicWarpToUnionRoomExit(FieldSystem *fsys) {
    Location *dynamicWarp = FlyPoints_GetDynamicWarp(Save_FlyPoints_get(fsys->savedata));
    SCRIPT_STATE *scriptState = SavArray_Flags_get(fsys->savedata); // unused
    if (MapHeader_MapIsPokemonLeagueLobby(fsys->location->mapId) == TRUE) {
        InitLocation(dynamicWarp, fsys->location->mapId, -1, 4, 11, DIR_SOUTH);
    } else {
        InitLocation(dynamicWarp, fsys->location->mapId, -1, 7, 2, DIR_SOUTH);
    }
}

static BOOL sub_02053414(TaskManager *taskManager) {
    FieldSystem *fsys = TaskManager_GetSys(taskManager);
    u32 *state_p = TaskManager_GetStatePtr(taskManager);

    switch (*state_p) {
    case 0:
        sub_02052F94(fsys, fsys->location);
        sub_02053284(fsys);
        sub_02053038(fsys, FALSE);
        sub_0205316C(fsys);
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

TaskManager *CallFieldTask_NewGame(FieldSystem *fsys) {
    fsys->unk70 = 0;
    RunInitScript(fsys);
    return FieldSys_CreateTask(fsys, sub_02053414, NULL);
}

static BOOL sub_0205348C(TaskManager *taskManager) {
    FieldSystem *fsys = TaskManager_GetSys(taskManager);
    SCRIPT_STATE *scriptState = SavArray_Flags_get(fsys->savedata);
    FLYPOINTS_SAVE *flypointsSave;
    u32 *state_p = TaskManager_GetStatePtr(taskManager);

    switch (*state_p) {
    case 0:
        if (CheckFlag966(scriptState)) {
            flypointsSave = Save_FlyPoints_get(fsys->savedata);
            if (_IsPlayerStandingInFrontOfUnionRoomReception(fsys)) {
                _SetDynamicWarpToUnionRoomExit(fsys);
            }
            ClearFlag966(scriptState);
            sub_02052F94(fsys, FlyPoints_GetDynamicWarp(flypointsSave));
            sub_02053284(fsys);
            sub_02053038(fsys, FALSE);
            sub_0205316C(fsys);
        } else {
            sub_02052F94(fsys, NULL);
            sub_02053284(fsys);
            FieldSys_StartBugContestTimer(fsys);
            sub_0205323C(fsys);
        }
        sub_02067BE8(fsys);
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

TaskManager *CallFieldTask_ContinueGame_Normal(FieldSystem *fsys) {
    fsys->unk70 = 0;
    return FieldSys_CreateTask(fsys, sub_0205348C, NULL);
}

static BOOL sub_02053550(TaskManager *taskManager) {
    FieldSystem *fsys = TaskManager_GetSys(taskManager);
    struct ErrorContinueEnv *env = TaskManager_GetEnv(taskManager);
    SCRIPT_STATE *scriptState = SavArray_Flags_get(fsys->savedata);
    FLYPOINTS_SAVE *flypointsSave;
    u32 *state_p = TaskManager_GetStatePtr(taskManager);

    switch (*state_p) {
    case 0:
        sub_0200FBF4(0, 0);
        sub_0200FBF4(1, 0);
        (*state_p)++;
        break;
    case 1:
        sub_02052F94(fsys, &env->location);
        sub_02053284(fsys);
        sub_02053038(fsys, FALSE);
        sub_0205316C(fsys);
        (*state_p)++;
        break;
    case 2:
        fsys->unk80 = sub_02059DB0(fsys);
        fsys->unk84 = sub_0205AC88(fsys->unk80);
        sub_020552A4(taskManager);
        (*state_p)++;
        break;
    case 3:
        env->state = 0;
        ov01_021F35C4(fsys, 0, &env->state);
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

TaskManager *CallFieldTask_ContinueGame_CommError(FieldSystem *fsys) {
    SCRIPT_STATE *scriptState;
    struct ErrorContinueEnv *env;
    if (!MapHeader_MapIsUnionRoom(fsys->location->mapId)) {
        if (_IsPlayerStandingInFrontOfUnionRoomReception(fsys)) {
            scriptState = SavArray_Flags_get(fsys->savedata);
            _SetDynamicWarpToUnionRoomExit(fsys);
            SetFlag966(scriptState);
        } else {
            return CallFieldTask_ContinueGame_Normal(fsys);
        }
    }
    env = AllocFromHeapAtEnd(11, sizeof(struct ErrorContinueEnv));
    env->state = 0;
    InitLocation(&env->location, MAP_UNION, -1, 8, 14, DIR_NORTH);
    fsys->unk70 = 2;
    return FieldSys_CreateTask(fsys, sub_02053550, env);
}

static BOOL sub_02053688(TaskManager *taskManager) {
    FieldSystem *fsys = TaskManager_GetSys(taskManager);
    struct UnkTaskEnv_02053688 *env = TaskManager_GetEnv(taskManager);

    switch (env->unk0) {
    case 0:
        PlaySE(SEQ_SE_DP_KAIDAN2);
        sub_020550E4(fsys, env->location.mapId);
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
        sub_02055110(fsys, env->location.mapId, 0);
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
    struct UnkTaskEnv_02053688 *env = AllocFromHeapAtEnd(11, sizeof(struct UnkTaskEnv_02053688));
    env->unk0 = 0;
    env->location = *location;
    TaskManager_Call(taskManager, sub_02053688, env);
}

static BOOL sub_02053740(TaskManager *taskManager) {
    FieldSystem *fsys = TaskManager_GetSys(taskManager);
    struct ErrorContinueEnv *env = TaskManager_GetEnv(taskManager);

    switch (env->state) {
    case 0:
        sub_02053210(fsys);
        sub_02053324(fsys);
        env->state++;
        break;
    case 1:
        sub_02052F94(fsys, &env->location);
        sub_02053284(fsys);
        sub_02053038(fsys, FALSE);
        env->state++;
        break;
    case 2:
        sub_0205316C(fsys);
        FreeToHeap(env);
        return TRUE;
    }

    return FALSE;
}

void sub_020537A8(TaskManager *taskManager, Location *location) {
    FieldSystem *fsys = TaskManager_GetSys(taskManager);
    struct ErrorContinueEnv *env = AllocFromHeapAtEnd(11, sizeof(struct ErrorContinueEnv));
    if (sub_0203DF7C(fsys)) {
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
    FieldSystem *fsys = TaskManager_GetSys(taskManager);
    struct ErrorContinueEnv *env = TaskManager_GetEnv(taskManager);

    switch (env->state) {
    case 0:
        sub_020550E4(fsys, env->location.mapId);
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
        sub_02055110(fsys, env->location.mapId, 0);
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
    struct ErrorContinueEnv *env = AllocFromHeapAtEnd(11, sizeof(struct ErrorContinueEnv));
    env->state = 0;
    InitLocation(&env->location, mapId, warpId, x, y, direction);
    TaskManager_Call(taskManager, Task_ScriptWarp, env);
}

TaskManager *sub_020538C0(FieldSystem *fsys, u32 mapId, int warpId, int x, int y, int direction) {
    Location location = {
        mapId,
        warpId,
        x,
        y,
        direction
    };
    struct UnkTaskEnv_02053950 *env = AllocFromHeapAtEnd(11, sizeof(struct UnkTaskEnv_02053950));
    env->unk0 = 0;
    env->unk4 = 0;
    env->location = location;
    return FieldSys_CreateTask(fsys, sub_02053950, env);
}

void sub_02053908(TaskManager *taskManager, u32 mapId, int warpId, int x, int y, int direction) {
    Location location = {
        mapId,
        warpId,
        x,
        y,
        direction
    };
    struct UnkTaskEnv_02053950 *env = AllocFromHeapAtEnd(11, sizeof(struct UnkTaskEnv_02053950));
    env->unk0 = 0;
    env->unk4 = NULL;
    env->location = location;
    TaskManager_Jump(taskManager, sub_02053950, env);
}

static BOOL sub_02053950(TaskManager *taskManager) {
    FieldSystem *fsys = TaskManager_GetSys(taskManager);
    struct UnkTaskEnv_02053950 *env = TaskManager_GetEnv(taskManager);
    Location *location = &env->location;
    switch (env->unk0) {
    case 0:
        sub_020550E4(fsys, location->mapId);
        sub_020539D8(taskManager);
        env->unk0++;
        break;
    case 1:
        PlayerAvatar_SetState(fsys->playerAvatar, PLAYER_STATE_WALKING);
        sub_020537A8(taskManager, &env->location);
        env->unk0++;
        break;
    case 2:
        if (GF_SndGetFadeTimer() != 0) {
            break;
        }
        sub_02067B88(fsys);
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
    FieldSystem *fsys = TaskManager_GetSys(taskManager);
    switch (*state_p) {
    case 0:
        sub_020552A4(taskManager);
        (*state_p)++;
        break;
    case 1:
        sub_0200615C(5, 10);
        GF_SndHandleMoveVolume(0, 128, 15);
        fsys->unkC4 = -1;
        sub_02055110(fsys, fsys->location->mapId, 1);
        ov01_021EFAF8(fsys);
        sub_02053AA0(taskManager);
        (*state_p)++;
        break;
    case 2:
        return TRUE;
    }

    return FALSE;
}

static void sub_02053AA0(TaskManager *taskManager) {
    FieldSystem *fsys = TaskManager_GetSys(taskManager);
    struct UnkTaskEnv_02053950 *env = TaskManager_GetEnv(taskManager);
    if (!sub_0203DF7C(fsys)) {
        GF_ASSERT(0);
        return;
    }
    env->unk4 = ov02_0224B418(fsys, PlayerAvatar_GetGender(fsys->playerAvatar));
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
    struct UnkTaskEnv_02053B3C *env = AllocFromHeapAtEnd(11, sizeof(struct UnkTaskEnv_02053B3C));
    env->unk0 = 0;
    env->unk4 = a2;
    env->unk8 = NULL;
    env->location = *location;
    TaskManager_Jump(taskManager, sub_02053B3C, env);
}

static BOOL sub_02053B3C(TaskManager *taskManager) {
    FieldSystem *fsys = TaskManager_GetSys(taskManager);
    struct UnkTaskEnv_02053B3C *env = TaskManager_GetEnv(taskManager);
    Location *location = &env->location;

    switch (env->unk0) {
    case 0:
        sub_020550E4(fsys, location->mapId);
        sub_02053BE8(taskManager);
        env->unk0++;
        break;
    case 1:
        PlayerAvatar_SetState(fsys->playerAvatar, PLAYER_STATE_WALKING);
        sub_020537A8(taskManager, &env->location);
        env->unk0++;
        break;
    case 2:
        if (GF_SndGetFadeTimer() != 0) {
            break;
        }
        sub_02055110(fsys, location->mapId, 0);
        if (env->unk4 == 2) {
            sub_02067BA4(fsys);
        } else if (env->unk4 == 0 || env->unk4 == 1) {
            sub_02067BC0(fsys);
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
    FieldSystem *fsys = TaskManager_GetSys(taskManager);
    struct UnkTaskEnv_02053B3C *env = TaskManager_GetEnv(taskManager); // unused

    switch (*state_p) {
    case 0:
        sub_020552A4(taskManager);
        (*state_p)++;
        break;
    case 1:
        ov01_021EFAF8(fsys);
        sub_02053C90(taskManager);
        (*state_p)++;
        break;
    case 2:
        return TRUE;
    }

    return FALSE;
}

static void sub_02053C90(TaskManager *taskManager) {
    FieldSystem *fsys = TaskManager_GetSys(taskManager);
    struct UnkTaskEnv_02053B3C *env = TaskManager_GetEnv(taskManager);

    if (!sub_0203DF7C(fsys)) {
        GF_ASSERT(0);
        return;
    }
    TaskManager_Call(taskManager, ov02_0224C1F8, ov02_0224C1D8(fsys, 4, env->unk4));
}

static BOOL sub_02053CCC(TaskManager *taskManager) {
    FieldSystem *fsys = TaskManager_GetSys(taskManager);
    struct UnkTaskEnv_02053CCC *env = TaskManager_GetEnv(taskManager);
    Location *location = &env->location;
    struct LocalMapObject *follow_poke_obj;

    switch (env->unk0) {
    case 0:
        env->unk1C = 0;
        if (FollowingPokemon_IsActive(fsys)
         && !ov01_022057C4(fsys)
         && PlayerAvatar_GetState(fsys->playerAvatar) != 1) {
            env->unk1C = ov01_0220329C(FollowingPokemon_GetMapObject(fsys), 1);
        }
        env->unk0++;
        break;
    case 1:
        if (env->unk1C == 0 || !sub_02068CCC(env->unk1C)) {
            ov01_021F35C4(fsys, 1, &env->unk4);
            env->unk0++;
        }
        break;
    case 2:
        if (env->unk4) {
            sub_020550E4(fsys, location->mapId);
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
        sub_02055110(fsys, location->mapId, 0);
        sub_020552A4(taskManager);
        env->unk0++;
        break;
    case 5:
        env->unk4 = 0;
        ov01_021F35C4(fsys, 0, &env->unk4);
        if (FollowingPokemon_IsActive(fsys)) {
            follow_poke_obj = FollowingPokemon_GetMapObject(fsys);
            if (GetFollowPokePermissionBySpeciesAndMap(FollowPokeObj_GetSpecies(follow_poke_obj), location->mapId)) {
                sub_02069E84(follow_poke_obj, 1);
                ov01_02205790(fsys, 1);
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

TaskManager *sub_02053E08(FieldSystem *fsys, u32 mapId, int warpId) {
    struct UnkTaskEnv_02053CCC *env;
    Location location;
    int direction;

    env = AllocFromHeapAtEnd(11, sizeof(struct UnkTaskEnv_02053CCC));
    MI_CpuClear8(env, sizeof(struct UnkTaskEnv_02053CCC));
    direction = PlayerAvatar_GetFacingDirection(fsys->playerAvatar);
    InitLocation(&location, mapId, warpId, 0, 0, direction);
    env->location = location;
    return FieldSys_CreateTask(fsys, sub_02053CCC, env);
}

static BOOL sub_02053E5C(TaskManager *taskManager) {
    FieldSystem *fsys = TaskManager_GetSys(taskManager);
    struct UnkTaskEnv_02053E5C *env = TaskManager_GetEnv(taskManager);
    u32 *state_p = TaskManager_GetStatePtr(taskManager);
    Location *location = &env->location;

    switch (*state_p) {
    case 0:
        sub_020550E4(fsys, location->mapId);
        ov01_021F35C4(fsys, 1, &env->unk4);
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
        sub_02055110(fsys, location->mapId, 0);
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

void sub_02053F14(FieldSystem *fsys) {
    Location *location = FlyPoints_GetDynamicWarp(Save_FlyPoints_get(fsys->savedata));
    struct UnkTaskEnv_02053E5C *env = AllocFromHeapAtEnd(11, sizeof(struct UnkTaskEnv_02053E5C));
    MI_CpuClear8(env, sizeof(struct UnkTaskEnv_02053E5C));
    env->location = *location;
    sub_02059E04(fsys);
    sub_0205AD3C(fsys->unk84);
    fsys->unk70 = 0;
    FieldSys_CreateTask(fsys, sub_02053E5C, env);
    fsys->unk80 = NULL;
}

static BOOL sub_02053F70(TaskManager *taskManager) {
    FieldSystem *fsys = TaskManager_GetSys(taskManager);
    struct UnkTaskEnv_02053E5C *env = TaskManager_GetEnv(taskManager);
    u32 *state_p = TaskManager_GetStatePtr(taskManager);
    Location *location = &env->location;

    switch (*state_p) {
    case 0:
        sub_020550E4(fsys, location->mapId);
        sub_020552E8(taskManager);
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
        sub_02055110(fsys, location->mapId, 0);
        sub_020552A4(taskManager);
        (*state_p)++;
        break;
    case 4:
        env->unk4 = 0;
        ov01_021F35C4(fsys, 0, &env->unk4);
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
    FieldSystem *fsys = TaskManager_GetSys(taskManager);
    Location *location = FlyPoints_GetDynamicWarp(Save_FlyPoints_get(fsys->savedata));
    struct UnkTaskEnv_02053E5C *env = AllocFromHeapAtEnd(11, sizeof(struct UnkTaskEnv_02053E5C));
    MI_CpuClear8(env, sizeof(struct UnkTaskEnv_02053E5C));
    _CopyPlayerPosToLocationWorkFacingSouth(location, fsys);
    InitLocation(&env->location, MAP_UNION, -1, 8, 14, DIR_NORTH);
    fsys->unk80 = sub_02059DB0(fsys);
    fsys->unk84 = sub_0205AC88(fsys->unk80);
    fsys->unk70 = 2;
    TaskManager_Call(taskManager, sub_02053F70, env);
}

static BOOL sub_020540A4(TaskManager *taskManager) {
    FieldSystem *fsys = TaskManager_GetSys(taskManager);
    struct UnkTaskEnv_02053688 *env = TaskManager_GetEnv(taskManager);

    switch (env->unk0) {
    case 0:
        PlaySE(SEQ_SE_DP_KAIDAN2);
        sub_020550E4(fsys, env->location.mapId);
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
        sub_02055110(fsys, env->location.mapId, 0);
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
    FieldSystem *fsys = TaskManager_GetSys(taskManager);
    _CopyPlayerPosToLocationWorkFacingSouth(FlyPoints_GetDynamicWarp(Save_FlyPoints_get(fsys->savedata)), fsys);
    fsys->unk70 = 3;
    env = AllocFromHeapAtEnd(11, sizeof(struct UnkTaskEnv_02053688));
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
    FieldSystem *fsys = TaskManager_GetSys(taskManager);
    Location *location = FlyPoints_GetDynamicWarp(Save_FlyPoints_get(fsys->savedata));
    fsys->unk70 = 0;
    sub_02053710(fsys->taskman, location);
}
