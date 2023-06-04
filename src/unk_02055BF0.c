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
#include "unk_02022D74.h"
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

typedef void (*FsysFunc)(FieldSystem*);

BOOL sub_02055DBC(TaskManager *man);
BOOL RoutineFieldFade(TaskManager *man);

extern TaskFunc sMapEnterRoutines[9];
extern TaskFunc sMapExitRoutines[9];
extern FsysFunc _020FC76C[9];

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
    FieldSystem *fsys = TaskManager_GetSys(man);
    FieldFadeEnvironment *fenv = TaskManager_GetEnv(man);
    switch (fenv->state) {
    case 0:
        ov01_021FB514(fsys->unk4->unk1c);
        BeginNormalPaletteFade(fenv->pattern, fenv->typeTop, fenv->typeBottom, fenv->colour, fenv->duration, fenv->framesPer, fenv->heapID);
        fenv->state++;
        break;
    case 1:
        if (IsPaletteFadeFinished()) {
            ov01_021FB4F4(fsys->unk4->unk1c);
            FreeToHeap(fenv);
            return TRUE;
        }
        break;
    }
    return FALSE;
}

void NewFieldTransitionEnvironment(FieldSystem *fsys, int mapID, int warpID, int x, int y, int dir, u32 transNo) {
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
    FieldSys_CreateTask(fsys, sub_02055DBC, fenv);
}

void sub_02055CD8(FieldSystem *fsys, int mapID, int warpID, int x, int y, int dir) {
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
    int otherID = fsys->location->mapId;
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
    FieldSys_CreateTask(fsys, sub_02055DBC, fenv);
}

//this function handles transition routines between maps
BOOL sub_02055DBC(TaskManager *man) {
    FieldSystem *fsys = TaskManager_GetSys(man);
    FieldTransitionEnvironment *env = TaskManager_GetEnv(man);
    switch (env->state) {
    case 0:
        env->transitionState = 0;
        env->unk24 = NULL;
        env->unk1 = 0;
        if (FollowingPokemon_IsActive(fsys) && ov01_022057C4(fsys) && PlayerAvatar_GetState(fsys->playerAvatar) != PLAYER_STATE_CYCLING) {
            env->state = 9;
            break;
        }
    case 1:
        if (FollowingPokemon_IsActive(fsys) && !ov01_022057C4(fsys) && PlayerAvatar_GetState(fsys->playerAvatar) != PLAYER_STATE_CYCLING) {
            LocalMapObject *followMon = FollowingPokemon_GetMapObject(fsys);
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
        Fsys_BeginFadeOutMusic(fsys, env->location.mapId);
        TaskManager_Call(man, sMapExitRoutines[env->transitionNo], env);
        if (FollowingPokemon_IsActive(fsys) && ov01_022057C4(fsys) && !GetFollowPokePermission(fsys)) {
            ov01_022057D0(fsys);
        }
        SavFollowPoke_SetMapId(fsys->location->mapId, Save_FollowPoke_Get(fsys->savedata));
        env->destinationMapID = fsys->location->mapId;
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
            sub_0202367C(fsys->camera, 0);
            _020FC76C[env->transitionNo](fsys);
        }
        env->state++;
        break;
    case 7:
        if(GF_SndGetFadeTimer() == 0) {
            sub_02055110(fsys, env->location.mapId, 1);
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
                    ov01_021EFAF8(fsys); //<= this func specifically gets and displays the area's icon and text
                    break;
                }
            }
            ov01_021EFAF8(fsys);
            env->transitionState = 0;
            TaskManager_Call(man, sMapEnterRoutines[env->transitionNo], env);
            LocalMapObject *followerMon = FollowingPokemon_GetMapObject(fsys);
            if(FollowingPokemon_IsActive(fsys) && !GetFollowPokePermission(fsys)) {
                sub_02069E84(followerMon, 1);
                ov01_02205790(fsys, (u8) PlayerAvatar_GetFacingDirection(fsys->playerAvatar));
            }
            env->state++;
            break;
        }
        break;
    case 8:
        sub_0202367C(fsys->camera, 1);
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
    FieldSystem *fsys = TaskManager_GetSys(man);
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
    FieldSystem *fsys = TaskManager_GetSys(man);
    FieldTransitionEnvironment *fenv = TaskManager_GetEnv(man);
    switch (fenv->transitionState) {
    case 0:
        fenv->unk18 = ov01_021E90C0();
        ov01_021E90DC(GetPlayerXCoord(fsys->playerAvatar), GetPlayerYCoord(fsys->playerAvatar), fenv->unk18);
        fenv->transitionState++;
        break;
    case 1:
        if (ov01_021E90E4(fsys, fenv->unk18)) {
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
    FieldSystem *fsys = TaskManager_GetSys(man);
    FieldTransitionEnvironment *fenv = TaskManager_GetEnv(man);
    switch (fenv->transitionState) {
    case 0:
        fenv->unk18 = ov01_021E90C0();
        ov01_021E90DC(GetPlayerXCoord(fsys->playerAvatar), GetPlayerYCoord(fsys->playerAvatar), fenv->unk18);
        fenv->transitionState++;
        break;
    case 1:
        FieldEnvSubUnk18 *info = fenv->unk18;
        if (ov01_021E98F0(fsys, info, PlayerAvatar_GetFacingDirection(fsys->playerAvatar))) {
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
    FieldSystem *fsys = TaskManager_GetSys(man);
    FieldTransitionEnvironment *fenv = TaskManager_GetEnv(man);
    LocalMapObject *obj;
    switch (fenv->transitionState) {
    case 0:
        if (FollowingPokemon_IsActive(fsys) && sub_02069FB0(fsys)) {
            if (MapObject_IsMovementPaused(FollowingPokemon_GetMapObject(fsys))) {
                sub_0205FC94(FollowingPokemon_GetMapObject(fsys), 55);
                fenv->transitionState++;
            }
        } else {
            fenv->transitionState++;
        }
        break;
    case 1:
        int dir = PlayerAvatar_GetFacingDirection(fsys->playerAvatar);
        obj = PlayerAvatar_GetMapObject(fsys->playerAvatar);
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
        obj = PlayerAvatar_GetMapObject(fsys->playerAvatar);
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
    FieldSystem *fsys = TaskManager_GetSys(man);
    FieldTransitionEnvironment *fenv = TaskManager_GetEnv(man);
    PlayerAvatar_GetMapObject(fsys->playerAvatar);
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
    FieldSystem *fsys = TaskManager_GetSys(man);
    FieldTransitionEnvironment *fenv = TaskManager_GetEnv(man);
    PlayerAvatar_GetMapObject(fsys->playerAvatar);
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
    FieldSystem *fsys = TaskManager_GetSys(man);
    FieldTransitionEnvironment *fenv = TaskManager_GetEnv(man);
    LocalMapObject *obj;
    FieldEnvSubUnk18 *fenv18;
    switch (fenv->transitionState) {
    case 0:
        obj = PlayerAvatar_GetMapObject(fsys->playerAvatar);
        MapObject_ClearHeldMovementIfActive(obj);
        ov01_PlayerAvatar_OrrTransitionFlags(fsys->playerAvatar, 512);
        ov01_PlayerAvatar_ApplyTransitionFlags(fsys->playerAvatar);
        sub_0205F328(obj, FALSE);
        fenv->unk18 =  AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(FieldEnvSubUnk18));
        fenv18 = fenv->unk18;
        fenv18->state = 0;
        fenv18->direction = PlayerAvatar_GetFacingDirection(fsys->playerAvatar);
        PlayerAvatar_ToggleAutomaticHeightUpdating(fsys->playerAvatar, FALSE);
        ov01_021F6304(fsys->unk2C);
        if (FollowingPokemon_IsActive(fsys)) {
            BOOL flag = TRUE;
            int var;
            switch (MapObject_GetFacingDirection(FollowingPokemon_GetMapObject(fsys))) {
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
                ov01_02205990(var, MapObject_GetPrevX(obj), MapObject_GetPrevY(obj), &fsys->followMon);
            }
        }
        fenv->transitionState++;
        break;
    case 1:
        obj = PlayerAvatar_GetMapObject(fsys->playerAvatar);
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
            PlayerAvatar_ToggleAutomaticHeightUpdating_NowApply(fsys->playerAvatar, TRUE);
            FreeToHeap(fenv->unk18);
            return TRUE;
        }
    }
    return FALSE;
}

BOOL sub_02056424(TaskManager *man) {
    FieldSystem *fsys = TaskManager_GetSys(man);
    FieldTransitionEnvironment *fenv = TaskManager_GetEnv(man);
    LocalMapObject *obj;
    FieldEnvSubUnk18 *fenv18;
    switch (fenv->transitionState) {
    case 0:
        obj = PlayerAvatar_GetMapObject(fsys->playerAvatar);
        if (MapObject_AreBitsSetForMovementScriptInit(obj)) {
            MapObject_SetHeldMovement(obj, 0);
            fenv->transitionState++;
        }
        break;
    case 1:
        obj = PlayerAvatar_GetMapObject(fsys->playerAvatar);
        if (MapObject_AreBitsSetForMovementScriptInit(obj)) {
            MapObject_ClearHeldMovementIfActive(obj);
            ov01_PlayerAvatar_OrrTransitionFlags(fsys->playerAvatar, 512);
            ov01_PlayerAvatar_ApplyTransitionFlags(fsys->playerAvatar);
            sub_0205F328(obj, 0);
            fenv->unk18 = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(FieldEnvSubUnk18));
            fenv->unk18->state = 0;
            PlayerAvatar_ToggleAutomaticHeightUpdating(fsys->playerAvatar, FALSE);
            fenv->transitionState++;
        }
        break;
    case 2:
        obj = PlayerAvatar_GetMapObject(fsys->playerAvatar);
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
            PlayerAvatar_ToggleAutomaticHeightUpdating_NowApply(fsys->playerAvatar, TRUE);
            FreeToHeap(fenv->unk18);
            return TRUE;
        }
    }
    return FALSE;
}

BOOL sub_02056530(TaskManager *man) {
    FieldSystem *fsys = TaskManager_GetSys(man);
    FieldTransitionEnvironment *fenv = TaskManager_GetEnv(man);
    LocalMapObject *obj;
    switch (fenv->transitionState) {
    case 0:
        obj = PlayerAvatar_GetMapObject(fsys->playerAvatar);
        if (sub_0205B70C(GetMetatileBehaviorAt(fsys, GetPlayerXCoord(fsys->playerAvatar), GetPlayerYCoord(fsys->playerAvatar)))) {
            MapObject_SetFlag9(obj, TRUE);
            fenv->transitionState = 1;
            break;
        }
        TaskManager_Call(man, ov01_021E9FF8, ov01_021E9C30());
        fenv->transitionState = 3;
        break;
    case 1:
        fenv->unk18 = ov01_021E90C0();
        ov01_021E90DC(GetPlayerXCoord(fsys->playerAvatar), GetPlayerYCoord(fsys->playerAvatar), fenv->unk18);
        fenv->transitionState++;
        break;
    case 2:
        FieldEnvSubUnk18 *unk = fenv->unk18;
        if (ov01_021E9374(fsys, unk)) {
            ov01_021E90D4(unk);
            MapObject_SetFlag9(PlayerAvatar_GetMapObject(fsys->playerAvatar), FALSE);
            return TRUE;
        }
        break;
    case 3:
        return TRUE;
    }
    return FALSE;
}

BOOL sub_020565FC(TaskManager *man) {
    FieldSystem *fsys = TaskManager_GetSys(man);
    FieldTransitionEnvironment *fenv = TaskManager_GetEnv(man);
    switch (fenv->transitionState) {
    case 0:
        LocalMapObject *mapObj = PlayerAvatar_GetMapObject(fsys->playerAvatar);
        if (sub_0205B70C(GetMetatileBehaviorAt(fsys, GetPlayerXCoord(fsys->playerAvatar), GetPlayerYCoord(fsys->playerAvatar)))) {
            MapObject_SetFlag9(mapObj, TRUE);
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
