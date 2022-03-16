#include "script.h"
#include "save_flypoints.h"
#include "map_events.h"
#include "system.h"
#include "bug_contest.h"
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
#include "constants/maps.h"

void sub_02052F30(FieldSystem *fsys) {
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

void sub_02052F94(FieldSystem *fsys, Location *location) {
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
        fsys->location->z = warp->y;
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

    sub_02054F4C(fsys);
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
    if (weather == 9 && CheckFlag974(scriptState) == TRUE) {
        weather = 0;
    }
    if (weather == 11 && CheckFlag973(scriptState) == TRUE) {
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

void sub_0205316C(FieldSystem *fsys) {
    u32 gender;
    struct FlypointsPlayerSub *avatar_sub;
    if (fsys->unkAC) {
        gender = PlayerProfile_GetTrainerGender(Sav2_PlayerData_GetProfileAddr(fsys->savedata));
        avatar_sub = sub_0203B9B4(Save_FlyPoints_get(fsys->savedata));
        fsys->playerAvatar = sub_0205C390(fsys->unk3C, fsys->location->x, fsys->location->z, fsys->location->direction, avatar_sub->unk4, gender, 2, avatar_sub);
    } else {
        fsys->unk3C = sub_0205E0BC(fsys, 64, 5);
        gender = PlayerProfile_GetTrainerGender(Sav2_PlayerData_GetProfileAddr(fsys->savedata));
        avatar_sub = sub_0203B9B4(Save_FlyPoints_get(fsys->savedata));
        fsys->playerAvatar = sub_0205C390(fsys->unk3C, fsys->location->x, fsys->location->z, fsys->location->direction, avatar_sub->unk4, gender, 2, avatar_sub);
        sub_020699F8(fsys->unk3C, fsys->location->x, fsys->location->z, fsys->location->direction, fsys->location->mapId);
        Field_InitMapObjectsFromZoneEventData(fsys);
        sub_0205F55C(fsys->unk3C);
    }
}

void sub_02053210(FieldSystem *fsys) {
    if (fsys->unkAC) {
        sub_0205C4CC(fsys->playerAvatar);
    } else {
        sub_02056E38();
        sub_0205C4C4(fsys->playerAvatar);
        sub_0205E494(fsys->unk3C);
        sub_0205E0E8(fsys->unk3C);
    }
}

void sub_0205323C(FieldSystem *fsys) {
    u32 gender;
    struct FlypointsPlayerSub *avatar_sub;

    fsys->unk3C = sub_0205E0BC(fsys, 64, 5);
    sub_0203B9F4(fsys);
    avatar_sub = sub_0203B9B4(Save_FlyPoints_get(fsys->savedata));    
    gender = PlayerProfile_GetTrainerGender(Sav2_PlayerData_GetProfileAddr(fsys->savedata));
    fsys->playerAvatar = sub_0205C408(fsys->unk3C, avatar_sub, gender);
    sub_02069B74(fsys->unk3C, fsys->location->mapId);
    sub_0205F55C(fsys->unk3C);
}
