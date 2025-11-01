#include "unk_02055BF0.h"

#include "constants/sndseq.h"

#include "camera.h"
#include "field_warp_tasks.h"
#include "follow_mon.h"
#include "heap.h"
#include "map_header.h"
#include "map_preview_graphic.h"
#include "metatile_behavior.h"
#include "overlay_01.h"
#include "overlay_01_021E90C0.h"
#include "overlay_01_021F1AFC.h"
#include "overlay_01_021F4704.h"
#include "overlay_01_021FB4C0.h"
#include "overlay_01_022031C0.h"
#include "overlay_01_022053EC.h"
#include "player_avatar.h"
#include "save_follow_mon.h"
#include "script.h"
#include "sound.h"
#include "unk_02005D10.h"
#include "unk_0200FA24.h"
#include "unk_02054648.h"
#include "unk_02054E00.h"
#include "unk_02055244.h"
#include "unk_020552A4.h"
#include "unk_02056680.h"
#include "unk_02062108.h"

typedef void (*FieldSystemFunc)(FieldSystem *);

BOOL sub_02055DBC(TaskManager *man);
BOOL RoutineFieldFade(TaskManager *man);

extern TaskFunc sMapEnterRoutines[9];
extern TaskFunc sMapExitRoutines[9];
extern FieldSystemFunc _020FC76C[9];

void NewFieldFadeEnvironment(TaskManager *man, int pattern, int typeTop, int typeBottom, u16 colour, int duration, int framesPer, enum HeapID heapID) {
    FieldFadeEnvironment *sfenv = Heap_Alloc(heapID, sizeof(FieldFadeEnvironment));
    sfenv->pattern = pattern;
    sfenv->typeTop = typeTop;
    sfenv->typeBottom = typeBottom;
    sfenv->colour = colour;
    sfenv->duration = duration;
    sfenv->framesPer = framesPer;
    sfenv->heapID = heapID;
    sfenv->state = 0;
    TaskManager_Call(man, RoutineFieldFade, sfenv);
}

BOOL RoutineFieldFade(TaskManager *man) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(man);
    FieldFadeEnvironment *fenv = TaskManager_GetEnvironment(man);
    switch (fenv->state) {
    case 0:
        ov01_021FB514(fieldSystem->unk4->unk1c);
        BeginNormalPaletteFade(fenv->pattern, fenv->typeTop, fenv->typeBottom, fenv->colour, fenv->duration, fenv->framesPer, fenv->heapID);
        fenv->state++;
        break;
    case 1:
        if (IsPaletteFadeFinished()) {
            ov01_021FB4F4(fieldSystem->unk4->unk1c);
            Heap_Free(fenv);
            return TRUE;
        }
        break;
    }
    return FALSE;
}

void NewFieldTransitionEnvironment(FieldSystem *fieldSystem, int mapID, int warpID, int x, int y, int dir, u32 transNo) {
    FieldTransitionEnvironment *fenv = Heap_AllocAtEnd(HEAP_ID_FIELD2, sizeof(FieldTransitionEnvironment));
    fenv->state = 0;
    fenv->transitionState = 0;
    fenv->unk1 = 0;
    fenv->location.mapId = mapID;
    fenv->location.warpId = warpID;
    fenv->location.x = x;
    fenv->location.y = y;
    fenv->location.direction = dir;
    fenv->transitionNo = transNo;
    FieldSystem_CreateTask(fieldSystem, sub_02055DBC, fenv);
}

void sub_02055CD8(FieldSystem *fieldSystem, int mapID, int warpID, int x, int y, int dir) {
    FieldTransitionEnvironment *fenv = Heap_AllocAtEnd(HEAP_ID_FIELD2, sizeof(FieldTransitionEnvironment));
    fenv->state = 0;
    fenv->transitionState = 0;
    fenv->unk1 = 0;
    fenv->location.mapId = mapID;
    fenv->location.warpId = warpID;
    fenv->location.x = x;
    fenv->location.y = y;
    fenv->location.direction = dir;
    int var = 0;
    int otherID = fieldSystem->location->mapId;
    if (MapHeader_IsCave(otherID)) {
        if (MapHeader_IsCave(mapID)) {
            var = 6;
        } else {
            if (MapHeader_IsOutdoors(mapID)) {
                var = 5;
            } else if (MapHeader_IsInBuilding(mapID)) {
                var = 6;
            } else {
                GF_ASSERT(FALSE);
            }
        }
    } else {
        if (MapHeader_IsOutdoors(otherID)) {
            if (MapHeader_IsCave(mapID)) {
                var = 4;
            } else if (MapHeader_IsInBuilding(mapID)) {
                var = 6;
            } else {
                GF_ASSERT(FALSE);
            }
        } else if (MapHeader_IsInBuilding(otherID)) {
            if (!MapHeader_IsOutdoors(mapID)) {
                if (MapHeader_IsInBuilding(mapID)) {
                    var = 6;
                } else if (!MapHeader_IsCave(mapID)) {
                    GF_ASSERT(FALSE);
                }
            }
        } else {
            GF_ASSERT(FALSE);
        }
    }
    fenv->transitionNo = var;
    FieldSystem_CreateTask(fieldSystem, sub_02055DBC, fenv);
}

// this function handles transition routines between maps
BOOL sub_02055DBC(TaskManager *man) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(man);
    FieldTransitionEnvironment *env = TaskManager_GetEnvironment(man);
    switch (env->state) {
    case 0:
        env->transitionState = 0;
        env->unk24 = NULL;
        env->unk1 = 0;
        if (FollowMon_IsActive(fieldSystem) && ov01_022057C4(fieldSystem) && PlayerAvatar_GetState(fieldSystem->playerAvatar) != PLAYER_STATE_CYCLING) {
            env->state = 9;
            break;
        }
    case 1:
        if (FollowMon_IsActive(fieldSystem) && !ov01_022057C4(fieldSystem) && PlayerAvatar_GetState(fieldSystem->playerAvatar) != PLAYER_STATE_CYCLING) {
            LocalMapObject *followMon = FollowMon_GetMapObject(fieldSystem);
            int species = FollowMon_GetSpecies(followMon);
            if (!FollowMon_GetPermissionBySpeciesAndMap(species, env->location.mapId)) {
                env->unk24 = ov01_0220329C(followMon, 1);
            }
        }
        env->state++;
        break;
    case 2:
        if (env->unk24 && sub_02068CCC(env->unk24)) {
            break;
        }
        FieldSystem_BeginFadeOutMusic(fieldSystem, env->location.mapId);
        TaskManager_Call(man, sMapExitRoutines[env->transitionNo], env);
        if (FollowMon_IsActive(fieldSystem) && ov01_022057C4(fieldSystem) && !FollowMon_GetPermission(fieldSystem)) {
            ov01_022057D0(fieldSystem);
        }
        Save_FollowMon_SetMapID(fieldSystem->location->mapId, Save_FollowMon_Get(fieldSystem->saveData));
        env->destinationMapID = fieldSystem->location->mapId;
        env->state++;
        break;
    case 3:
        CallTask_LeaveOverworld(man);
        env->state++;
        break;
    case 4:
        sub_020537A8(man, &env->location);
        env->state++;
        break;
    case 5:
        CallTask_RestoreOverworld(man);
        env->state++;
        break;
    case 6:
        if (_020FC76C[env->transitionNo]) {
            Camera_SetHistoryUnk24(fieldSystem->camera, 0);
            _020FC76C[env->transitionNo](fieldSystem);
        }
        env->state++;
        break;
    case 7:
        if (GF_SndGetFadeTimer() == 0) {
            sub_02055110(fieldSystem, env->location.mapId, 1);
            if (!MapHeader_IsCave(env->destinationMapID)) {                  // this has gotta be for the pre-entering images right?
                int index = MapPreviewGraphic_GetIndex(env->location.mapId); // this gets the index of the location in the list of maps that have map icons
                if (index != 255) {
                    int parity = 0;
                    if (env->transitionNo == 8) {
                        parity = 1;
                    }
                    TIMEOFDAY time = GF_RTC_GetTimeOfDay();
                    MapPreviewGraphic_BeginShowImage(man, index, time, parity); // this should set the specific map icon based on time?
                    env->state++;
                    FieldSystem_DrawMapNameAnimation(fieldSystem);
                    break;
                }
            }
            FieldSystem_DrawMapNameAnimation(fieldSystem);
            env->transitionState = 0;
            TaskManager_Call(man, sMapEnterRoutines[env->transitionNo], env);
            LocalMapObject *followerMon = FollowMon_GetMapObject(fieldSystem);
            if (FollowMon_IsActive(fieldSystem) && !FollowMon_GetPermission(fieldSystem)) {
                sub_02069E84(followerMon, 1);
                ov01_02205790(fieldSystem, (u8)PlayerAvatar_GetFacingDirection(fieldSystem->playerAvatar));
            }
            env->state++;
            break;
        }
        break;
    case 8:
        Camera_SetHistoryUnk24(fieldSystem->camera, 1);
        Heap_Free(env);
        return TRUE;
    case 9:
        env->unk1++;
        if (env->unk1 >= 2) {
            env->state = 1;
        }
        break;
    }
    return FALSE;
}

BOOL sub_02056004(TaskManager *man) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(man);
    FieldTransitionEnvironment *fenv = TaskManager_GetEnvironment(man);
    switch (fenv->transitionState) {
    case 0:
        PlaySE(SEQ_SE_DP_KAIDAN2);
        PaletteFadeUntilFinished(man);
        fenv->transitionState++;
        break;
    case 1:
        return TRUE;
    }
    return FALSE;
}

BOOL sub_02056040(TaskManager *man) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(man);
    FieldTransitionEnvironment *fenv = TaskManager_GetEnvironment(man);
    switch (fenv->transitionState) {
    case 0:
        fenv->unk18 = ov01_021E90C0();
        ov01_021E90DC(PlayerAvatar_GetXCoord(fieldSystem->playerAvatar), PlayerAvatar_GetZCoord(fieldSystem->playerAvatar), fenv->unk18);
        fenv->transitionState++;
        break;
    case 1:
        if (ov01_021E90E4(fieldSystem, fenv->unk18)) {
            ov01_021E90D4(fenv->unk18);
            fenv->transitionState++;
        }
        break;
    case 2:
        PaletteFadeUntilFinished(man);
        fenv->transitionState++;
        break;
    case 3:
        return TRUE;
    }
    return FALSE;
}

BOOL sub_020560C4(TaskManager *man) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(man);
    FieldTransitionEnvironment *fenv = TaskManager_GetEnvironment(man);
    switch (fenv->transitionState) {
    case 0:
        fenv->unk18 = ov01_021E90C0();
        ov01_021E90DC(PlayerAvatar_GetXCoord(fieldSystem->playerAvatar), PlayerAvatar_GetZCoord(fieldSystem->playerAvatar), fenv->unk18);
        fenv->transitionState++;
        break;
    case 1: {
        FieldEnvSubUnk18 *info = fenv->unk18;
        if (ov01_021E98F0(fieldSystem, info, PlayerAvatar_GetFacingDirection(fieldSystem->playerAvatar))) {
            ov01_021E90D4(fenv->unk18);
            fenv->transitionState++;
        }
        break;
    }
    case 2:
        return TRUE;
    }
    return FALSE;
}

BOOL sub_0205613C(TaskManager *man) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(man);
    FieldTransitionEnvironment *fenv = TaskManager_GetEnvironment(man);
    LocalMapObject *obj;
    switch (fenv->transitionState) {
    case 0:
        if (FollowMon_IsActive(fieldSystem) && FollowMon_IsVisible(fieldSystem)) {
            if (MapObject_IsMovementPaused(FollowMon_GetMapObject(fieldSystem))) {
                sub_0205FC94(FollowMon_GetMapObject(fieldSystem), 55);
                fenv->transitionState++;
            }
        } else {
            fenv->transitionState++;
        }
        break;
    case 1: {
        int dir = PlayerAvatar_GetFacingDirection(fieldSystem->playerAvatar);
        obj = PlayerAvatar_GetMapObject(fieldSystem->playerAvatar);
        if (dir == DIR_WEST) {
            MapObject_SetHeldMovement(obj, 10);
        } else if (dir == DIR_EAST) {
            MapObject_SetHeldMovement(obj, 11);
        } else {
            GF_ASSERT(FALSE);
        }
        fenv->transitionState++;
        break;
    }
    case 2: {
        obj = PlayerAvatar_GetMapObject(fieldSystem->playerAvatar);
        if (MapObject_IsMovementPaused(obj) == TRUE) {
            MapObject_ClearHeldMovementIfActive(obj);
            fenv->transitionState++;
        }
        break;
    }
    case 3:
        PlaySE(SEQ_SE_DP_KAIDAN2);
        ov01_021E636C(FALSE);
        fenv->transitionState++;
        break;
    case 4:
        if (IsPaletteFadeFinished()) {
            return TRUE;
        }
    }
    return FALSE;
}

BOOL sub_02056220(TaskManager *man) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(man);
    FieldTransitionEnvironment *fenv = TaskManager_GetEnvironment(man);
    PlayerAvatar_GetMapObject(fieldSystem->playerAvatar);
    switch (fenv->transitionState) {
    case 0:
        TaskManager_Call(man, ov01_021E9F78, ov01_021E9C30());
        fenv->transitionState++;
        break;
    case 1:
        return TRUE;
    }
    return FALSE;
}

BOOL sub_02056268(TaskManager *man) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(man);
    FieldTransitionEnvironment *fenv = TaskManager_GetEnvironment(man);
    PlayerAvatar_GetMapObject(fieldSystem->playerAvatar);
    switch (fenv->transitionState) {
    case 0:
        TaskManager_Call(man, ov01_021E9EEC, ov01_021E9C30());
        fenv->transitionState++;
        break;
    case 1:
        return TRUE;
    }
    return FALSE;
}

BOOL sub_020562B0(TaskManager *man) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(man);
    FieldTransitionEnvironment *fenv = TaskManager_GetEnvironment(man);
    LocalMapObject *obj;
    FieldEnvSubUnk18 *fenv18;
    switch (fenv->transitionState) {
    case 0:
        obj = PlayerAvatar_GetMapObject(fieldSystem->playerAvatar);
        MapObject_ClearHeldMovementIfActive(obj);
        Field_PlayerAvatar_OrrTransitionFlags(fieldSystem->playerAvatar, 512);
        Field_PlayerAvatar_ApplyTransitionFlags(fieldSystem->playerAvatar);
        sub_0205F328(obj, 0);
        fenv->unk18 = Heap_AllocAtEnd(HEAP_ID_FIELD2, sizeof(FieldEnvSubUnk18));
        fenv18 = fenv->unk18;
        fenv18->state = 0;
        fenv18->direction = PlayerAvatar_GetFacingDirection(fieldSystem->playerAvatar);
        PlayerAvatar_ToggleAutomaticHeightUpdating(fieldSystem->playerAvatar, FALSE);
        ov01_021F6304(fieldSystem->unk2C);
        if (FollowMon_IsActive(fieldSystem)) {
            BOOL flag = TRUE;
            int var;
            switch (MapObject_GetFacingDirection(FollowMon_GetMapObject(fieldSystem))) {
            case DIR_NORTH:
                var = 12;
                break;
            case DIR_SOUTH:
                var = 13;
                break;
            case DIR_WEST:
                var = 14;
                break;
            case DIR_EAST:
                var = 15;
                break;
            default:
                GF_ASSERT(FALSE);
                flag = FALSE;
                break;
            }
            if (flag) {
                ov01_02205990(var, MapObject_GetPreviousXCoord(obj), MapObject_GetPreviousZCoord(obj), &fieldSystem->followMon);
            }
        }
        fenv->transitionState++;
        break;
    case 1:
        obj = PlayerAvatar_GetMapObject(fieldSystem->playerAvatar);
        VecFx32 pos;
        fenv18 = fenv->unk18;
        u32 state = fenv18->state;
        fenv18->state++;
        MapObject_CopyPositionVector(obj, &pos);
        if (fenv18->direction == DIR_SOUTH) { // Ladders
            pos.y += 2048;
            pos.z -= 6144;
        } else {
            pos.y += 8192;
        }
        MapObject_SetPositionVector(obj, &pos);
        if (fenv18->state >= 16) {
            fenv->transitionState++;
        }
        break;
    case 2:
        PlaySE(SEQ_SE_DP_KAIDAN2);
        ov01_021E636C(0);
        fenv->transitionState++;
        break;
    case 3:
        if (IsPaletteFadeFinished()) {
            PlayerAvatar_ToggleAutomaticHeightUpdatingImmediate(fieldSystem->playerAvatar, TRUE);
            Heap_Free(fenv->unk18);
            return TRUE;
        }
    }
    return FALSE;
}

BOOL sub_02056424(TaskManager *man) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(man);
    FieldTransitionEnvironment *fenv = TaskManager_GetEnvironment(man);
    LocalMapObject *obj;
    FieldEnvSubUnk18 *fenv18;
    switch (fenv->transitionState) {
    case 0:
        obj = PlayerAvatar_GetMapObject(fieldSystem->playerAvatar);
        if (MapObject_AreBitsSetForMovementScriptInit(obj)) {
            MapObject_SetHeldMovement(obj, 0);
            fenv->transitionState++;
        }
        break;
    case 1:
        obj = PlayerAvatar_GetMapObject(fieldSystem->playerAvatar);
        if (MapObject_AreBitsSetForMovementScriptInit(obj)) {
            MapObject_ClearHeldMovementIfActive(obj);
            Field_PlayerAvatar_OrrTransitionFlags(fieldSystem->playerAvatar, 512);
            Field_PlayerAvatar_ApplyTransitionFlags(fieldSystem->playerAvatar);
            sub_0205F328(obj, 0);
            fenv->unk18 = Heap_AllocAtEnd(HEAP_ID_FIELD2, sizeof(FieldEnvSubUnk18));
            fenv->unk18->state = 0;
            PlayerAvatar_ToggleAutomaticHeightUpdating(fieldSystem->playerAvatar, FALSE);
            fenv->transitionState++;
        }
        break;
    case 2:
        obj = PlayerAvatar_GetMapObject(fieldSystem->playerAvatar);
        fenv18 = fenv->unk18;
        fenv18->state++;
        VecFx32 pos;
        MapObject_CopyPositionVector(obj, &pos);
        pos.y -= 8192;
        MapObject_SetPositionVector(obj, &pos);
        if (fenv18->state >= 16) {
            fenv->transitionState++;
        }
        break;
    case 3:
        PlaySE(SEQ_SE_DP_KAIDAN2);
        ov01_021E636C(0);
        fenv->transitionState++;
        break;
    case 4:
        if (IsPaletteFadeFinished()) {
            PlayerAvatar_ToggleAutomaticHeightUpdatingImmediate(fieldSystem->playerAvatar, TRUE);
            Heap_Free(fenv->unk18);
            return TRUE;
        }
    }
    return FALSE;
}

BOOL sub_02056530(TaskManager *man) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(man);
    FieldTransitionEnvironment *fenv = TaskManager_GetEnvironment(man);
    LocalMapObject *obj;
    switch (fenv->transitionState) {
    case 0:
        obj = PlayerAvatar_GetMapObject(fieldSystem->playerAvatar);
        if (sub_0205B70C(GetMetatileBehavior(fieldSystem, PlayerAvatar_GetXCoord(fieldSystem->playerAvatar), PlayerAvatar_GetZCoord(fieldSystem->playerAvatar)))) {
            MapObject_SetVisible(obj, TRUE);
            fenv->transitionState = 1;
            break;
        }
        TaskManager_Call(man, ov01_021E9FF8, ov01_021E9C30());
        fenv->transitionState = 3;
        break;
    case 1:
        fenv->unk18 = ov01_021E90C0();
        ov01_021E90DC(PlayerAvatar_GetXCoord(fieldSystem->playerAvatar), PlayerAvatar_GetZCoord(fieldSystem->playerAvatar), fenv->unk18);
        fenv->transitionState++;
        break;
    case 2: {
        FieldEnvSubUnk18 *unk = fenv->unk18;
        if (ov01_021E9374(fieldSystem, unk)) {
            ov01_021E90D4(unk);
            MapObject_SetVisible(PlayerAvatar_GetMapObject(fieldSystem->playerAvatar), FALSE);
            return TRUE;
        }
        break;
    }
    case 3:
        return TRUE;
    }
    return FALSE;
}

BOOL sub_020565FC(TaskManager *man) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(man);
    FieldTransitionEnvironment *fenv = TaskManager_GetEnvironment(man);
    switch (fenv->transitionState) {
    case 0: {
        LocalMapObject *mapObj = PlayerAvatar_GetMapObject(fieldSystem->playerAvatar);
        if (sub_0205B70C(GetMetatileBehavior(fieldSystem, PlayerAvatar_GetXCoord(fieldSystem->playerAvatar), PlayerAvatar_GetZCoord(fieldSystem->playerAvatar)))) {
            MapObject_SetVisible(mapObj, TRUE);
            fenv->transitionState = 1;
            TaskManager_Jump(man, sub_02056530, fenv);
            break;
        } else {
            TaskManager_Call(man, ov01_021EA128, ov01_021E9C30());
            fenv->transitionState++;
            break;
        }
    }
    case 1:
        return TRUE;
    }
    return FALSE;
}
