#include "field_follow_poke.h"
#include "field_player_avatar.h"
#include "field_warp_tasks.h"
#include "heap.h"
#include "map_header.h"
#include "metatile_behavior.h"
#include "save_follow_poke.h"
#include "script.h"
#include "sound.h"
#include "unk_02055BF0.h"
#include "unk_0200FA24.h"
#include "unk_02056680.h"
#include "unk_02054E00.h"
#include "unk_020552A4.h"
#include "camera.h"
#include "unk_0206A360.h"
#include "unk_02005D10.h"
#include "unk_02062108.h"
#include "unk_02054648.h"
#include "overlay_01.h"
#include "overlay_01_021E90C0.h"
#include "overlay_01_022031C0.h"
#include "overlay_01_021FB4C0.h"
#include "overlay_01_022053EC.h"
#include "overlay_01_021F4704.h"
#include "unk_02055244.h"
#include "constants/sndseq.h"

typedef void (*FieldSystemFunc)(FieldSystem*);

BOOL sub_02055DBC(TaskManager *man);
BOOL RoutineFieldFade(TaskManager *man);

extern TaskFunc sMapEnterRoutines[9];
extern TaskFunc sMapExitRoutines[9];
extern FieldSystemFunc _020FC76C[9];

void NewFieldFadeEnvironment(TaskManager *man, int pattern, int typeTop, int typeBottom, u16 colour, int duration, int framesPer, HeapID heapID) {
    FieldFadeEnvironment *sfenv = AllocFromHeap(heapID, sizeof(FieldFadeEnvironment));
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
    FieldFadeEnvironment *fenv = TaskManager_GetEnv(man);
    switch (fenv->state) {
    case 0:
        ov01_021FB514(fieldSystem->unk4->unk1c);
        BeginNormalPaletteFade(fenv->pattern, fenv->typeTop, fenv->typeBottom, fenv->colour, fenv->duration, fenv->framesPer, fenv->heapID);
        fenv->state++;
        break;
    case 1:
        if (IsPaletteFadeFinished()) {
            ov01_021FB4F4(fieldSystem->unk4->unk1c);
            FreeToHeap(fenv);
            return TRUE;
        }
        break;
    }
    return FALSE;
}

void NewFieldTransitionEnvironment(FieldSystem *fieldSystem, int mapID, int warpID, int x, int y, int dir, u32 transNo) {
    FieldTransitionEnvironment *fenv = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(FieldTransitionEnvironment));
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
    FieldTransitionEnvironment *fenv = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(FieldTransitionEnvironment));
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
        }
        else {
            if (sub_0203B5AC(mapID)) {
                var = 5;
            } else if (sub_0203B58C(mapID)) {
                var = 6;
            } else {
                GF_ASSERT(FALSE);
            }
        }
    } else {
        if (sub_0203B5AC(otherID)) {
            if (MapHeader_IsCave(mapID)) {
                var = 4;
            } else if (sub_0203B58C(mapID)) {
                var = 6;
            } else {
                GF_ASSERT(FALSE);
            }
        } else if (sub_0203B58C(otherID)) {
            if (!sub_0203B5AC(mapID)) {
                if (sub_0203B58C(mapID)) {
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

//this function handles transition routines between maps
BOOL sub_02055DBC(TaskManager *man) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(man);
    FieldTransitionEnvironment *env = TaskManager_GetEnv(man);
    switch (env->state) {
    case 0:
        env->transitionState = 0;
        env->unk24 = NULL;
        env->unk1 = 0;
        if (FollowingPokemon_IsActive(fieldSystem) && ov01_022057C4(fieldSystem) && PlayerAvatar_GetState(fieldSystem->playerAvatar) != PLAYER_STATE_CYCLING) {
            env->state = 9;
            break;
        }
    case 1:
        if (FollowingPokemon_IsActive(fieldSystem) && !ov01_022057C4(fieldSystem) && PlayerAvatar_GetState(fieldSystem->playerAvatar) != PLAYER_STATE_CYCLING) {
            LocalMapObject *followMon = FollowingPokemon_GetMapObject(fieldSystem);
            int species = FollowPokeObj_GetSpecies(followMon);
            if(!GetFollowPokePermissionBySpeciesAndMap(species, env->location.mapId)) {
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
        if (FollowingPokemon_IsActive(fieldSystem) && ov01_022057C4(fieldSystem) && !GetFollowPokePermission(fieldSystem)) {
            ov01_022057D0(fieldSystem);
        }
        SavFollowPoke_SetMapId(fieldSystem->location->mapId, Save_FollowPoke_Get(fieldSystem->saveData));
        env->destinationMapID = fieldSystem->location->mapId;
        env->state++;
        break;
    case 3:
        sub_0205525C(man);
        env->state++;
        break;
    case 4:
        sub_020537A8(man, &env->location);
        env->state++;
        break;
    case 5:
        sub_020552A4(man);
        env->state++;
        break;
    case 6:
        if(_020FC76C[env->transitionNo]) {
            Camera_SetHistoryUnk24(fieldSystem->camera, 0);
            _020FC76C[env->transitionNo](fieldSystem);
        }
        env->state++;
        break;
    case 7:
        if(GF_SndGetFadeTimer() == 0) {
            sub_02055110(fieldSystem, env->location.mapId, 1);
            if(!MapHeader_IsCave(env->destinationMapID)) { //this has gotta be for the pre-entering images right?
                int index = sub_0206A360(env->location.mapId); //this gets the index of the location in the list of maps that have map icons
                if (index != 255) {
                    int parity = 0;
                    if (env->transitionNo == 8) {
                        parity = 1;
                    }
                    TIMEOFDAY time = GF_RTC_GetTimeOfDay();
                    sub_0206A388(man, index, time, parity); //this should set the specific map icon based on time?
                    env->state++;
                    ov01_021EFAF8(fieldSystem); //<= this func specifically gets and displays the area's icon and text
                    break;
                }
            }
            ov01_021EFAF8(fieldSystem);
            env->transitionState = 0;
            TaskManager_Call(man, sMapEnterRoutines[env->transitionNo], env);
            LocalMapObject *followerMon = FollowingPokemon_GetMapObject(fieldSystem);
            if(FollowingPokemon_IsActive(fieldSystem) && !GetFollowPokePermission(fieldSystem)) {
                sub_02069E84(followerMon, 1);
                ov01_02205790(fieldSystem, (u8) PlayerAvatar_GetFacingDirection(fieldSystem->playerAvatar));
            }
            env->state++;
            break;
        }
        break;
    case 8:
        Camera_SetHistoryUnk24(fieldSystem->camera, 1);
        FreeToHeap(env);
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
    FieldTransitionEnvironment *fenv = TaskManager_GetEnv(man);
    switch (fenv->transitionState) {
    case 0:
        PlaySE(SEQ_SE_DP_KAIDAN2);
        PalleteFadeUntilFinished(man);
        fenv->transitionState++;
        break;
    case 1:
        return TRUE;
    }
    return FALSE;
}

BOOL sub_02056040(TaskManager *man) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(man);
    FieldTransitionEnvironment *fenv = TaskManager_GetEnv(man);
    switch (fenv->transitionState) {
    case 0:
        fenv->unk18 = ov01_021E90C0();
        ov01_021E90DC(GetPlayerXCoord(fieldSystem->playerAvatar), GetPlayerYCoord(fieldSystem->playerAvatar), fenv->unk18);
        fenv->transitionState++;
        break;
    case 1:
        if (ov01_021E90E4(fieldSystem, fenv->unk18)) {
            ov01_021E90D4(fenv->unk18);
            fenv->transitionState++;
        }
        break;
    case 2:
        PalleteFadeUntilFinished(man);
        fenv->transitionState++;
        break;
    case 3:
        return TRUE;
    }
    return FALSE;
}

BOOL sub_020560C4(TaskManager *man) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(man);
    FieldTransitionEnvironment *fenv = TaskManager_GetEnv(man);
    switch (fenv->transitionState) {
    case 0:
        fenv->unk18 = ov01_021E90C0();
        ov01_021E90DC(GetPlayerXCoord(fieldSystem->playerAvatar), GetPlayerYCoord(fieldSystem->playerAvatar), fenv->unk18);
        fenv->transitionState++;
        break;
    case 1:
        FieldEnvSubUnk18 *info = fenv->unk18;
        if (ov01_021E98F0(fieldSystem, info, PlayerAvatar_GetFacingDirection(fieldSystem->playerAvatar))) {
            ov01_021E90D4(fenv->unk18);
            fenv->transitionState++;
        }
        break;
    case 2:
        return TRUE;
    }
    return FALSE;
}

BOOL sub_0205613C(TaskManager *man) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(man);
    FieldTransitionEnvironment *fenv = TaskManager_GetEnv(man);
    LocalMapObject *obj;
    switch (fenv->transitionState) {
    case 0:
        if (FollowingPokemon_IsActive(fieldSystem) && sub_02069FB0(fieldSystem)) {
            if (MapObject_IsMovementPaused(FollowingPokemon_GetMapObject(fieldSystem))) {
                sub_0205FC94(FollowingPokemon_GetMapObject(fieldSystem), 55);
                fenv->transitionState++;
            }
        } else {
            fenv->transitionState++;
        }
        break;
    case 1:
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
    case 2:
        obj = PlayerAvatar_GetMapObject(fieldSystem->playerAvatar);
        if (MapObject_IsMovementPaused(obj) == TRUE) {
            MapObject_ClearHeldMovementIfActive(obj);
            fenv->transitionState++;
        }
        break;
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
    FieldTransitionEnvironment *fenv = TaskManager_GetEnv(man);
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
    FieldTransitionEnvironment *fenv = TaskManager_GetEnv(man);
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
    FieldTransitionEnvironment *fenv = TaskManager_GetEnv(man);
    LocalMapObject *obj;
    FieldEnvSubUnk18 *fenv18;
    switch (fenv->transitionState) {
    case 0:
        obj = PlayerAvatar_GetMapObject(fieldSystem->playerAvatar);
        MapObject_ClearHeldMovementIfActive(obj);
        Field_PlayerAvatar_OrrTransitionFlags(fieldSystem->playerAvatar, 512);
        Field_PlayerAvatar_ApplyTransitionFlags(fieldSystem->playerAvatar);
        sub_0205F328(obj, FALSE);
        fenv->unk18 =  AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(FieldEnvSubUnk18));
        fenv18 = fenv->unk18;
        fenv18->state = 0;
        fenv18->direction = PlayerAvatar_GetFacingDirection(fieldSystem->playerAvatar);
        PlayerAvatar_ToggleAutomaticHeightUpdating(fieldSystem->playerAvatar, FALSE);
        ov01_021F6304(fieldSystem->unk2C);
        if (FollowingPokemon_IsActive(fieldSystem)) {
            BOOL flag = TRUE;
            int var;
            switch (MapObject_GetFacingDirection(FollowingPokemon_GetMapObject(fieldSystem))) {
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
                ov01_02205990(var, MapObject_GetPrevX(obj), MapObject_GetPrevY(obj), &fieldSystem->followMon);
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
        MapObject_GetPositionVec(obj, &pos);
        if (fenv18->direction == DIR_SOUTH) { //Ladders
            pos.y += 2048;
            pos.z -= 6144;
        } else {
            pos.y += 8192;
        }
        MapObject_SetPositionVec(obj, &pos);
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
            PlayerAvatar_ToggleAutomaticHeightUpdating_NowApply(fieldSystem->playerAvatar, TRUE);
            FreeToHeap(fenv->unk18);
            return TRUE;
        }
    }
    return FALSE;
}

BOOL sub_02056424(TaskManager *man) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(man);
    FieldTransitionEnvironment *fenv = TaskManager_GetEnv(man);
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
            fenv->unk18 = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(FieldEnvSubUnk18));
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
        MapObject_GetPositionVec(obj, &pos);
        pos.y -= 8192;
        MapObject_SetPositionVec(obj, &pos);
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
            PlayerAvatar_ToggleAutomaticHeightUpdating_NowApply(fieldSystem->playerAvatar, TRUE);
            FreeToHeap(fenv->unk18);
            return TRUE;
        }
    }
    return FALSE;
}

BOOL sub_02056530(TaskManager *man) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(man);
    FieldTransitionEnvironment *fenv = TaskManager_GetEnv(man);
    LocalMapObject *obj;
    switch (fenv->transitionState) {
    case 0:
        obj = PlayerAvatar_GetMapObject(fieldSystem->playerAvatar);
        if (sub_0205B70C(GetMetatileBehaviorAt(fieldSystem, GetPlayerXCoord(fieldSystem->playerAvatar), GetPlayerYCoord(fieldSystem->playerAvatar)))) {
            MapObject_SetVisible(obj, TRUE);
            fenv->transitionState = 1;
            break;
        }
        TaskManager_Call(man, ov01_021E9FF8, ov01_021E9C30());
        fenv->transitionState = 3;
        break;
    case 1:
        fenv->unk18 = ov01_021E90C0();
        ov01_021E90DC(GetPlayerXCoord(fieldSystem->playerAvatar), GetPlayerYCoord(fieldSystem->playerAvatar), fenv->unk18);
        fenv->transitionState++;
        break;
    case 2:
        FieldEnvSubUnk18 *unk = fenv->unk18;
        if (ov01_021E9374(fieldSystem, unk)) {
            ov01_021E90D4(unk);
            MapObject_SetVisible(PlayerAvatar_GetMapObject(fieldSystem->playerAvatar), FALSE);
            return TRUE;
        }
        break;
    case 3:
        return TRUE;
    }
    return FALSE;
}

BOOL sub_020565FC(TaskManager *man) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(man);
    FieldTransitionEnvironment *fenv = TaskManager_GetEnv(man);
    switch (fenv->transitionState) {
    case 0:
        LocalMapObject *mapObj = PlayerAvatar_GetMapObject(fieldSystem->playerAvatar);
        if (sub_0205B70C(GetMetatileBehaviorAt(fieldSystem, GetPlayerXCoord(fieldSystem->playerAvatar), GetPlayerYCoord(fieldSystem->playerAvatar)))) {
            MapObject_SetVisible(mapObj, TRUE);
            fenv->transitionState = 1;
            TaskManager_Jump(man, sub_02056530, fenv);
            break;
        } else {
            TaskManager_Call(man, ov01_021EA128, ov01_021E9C30());
            fenv->transitionState++;
            break;
        }
    case 1:
        return TRUE;
    }
    return FALSE;
}
