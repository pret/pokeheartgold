#include "field_map_change.h"

#include "global.h"

#include "field_roamer.h"
#include "field_system.h"
#include "field_warp_tasks.h"
#include "follow_mon.h"
#include "map_header.h"
#include "overlay_01.h"
#include "overlay_01_022053EC.h"
#include "overlay_02.h"
#include "party.h"
#include "player_avatar.h"
#include "pokemon.h"
#include "roamer.h"
#include "save_local_field_data.h"
#include "save_vars_flags.h"
#include "script_pokemon_util.h"
#include "sound_chatot.h"
#include "sys_flags.h"
#include "sys_vars.h"
#include "task.h"
#include "unk_02005D10.h"
#include "unk_0203BA5C.h"
#include "unk_02062108.h"

static const MovementScriptCommand sFlyLandingMovement[] = {
    { 73,  1 },
    { 33,  1 },
    { 74,  1 },
    { 254, 0 },
};

struct MapChangeState {
    u8 data[0x24];
};

struct FlyTaskEnv {
    FieldSystem *fieldSystem;
    u16 state;
    u16 flag;
    u16 mapsec;
    s16 cursorX;
    s16 cursorY;
    u16 partySlot;
    Pokemon *pokemon;
    void *flyEffect;
    EventObjectMovementMan *movementMan;
};

MapChangeState *MapChange_AllocState(enum HeapID heapID) {
    MapChangeState *ret = Heap_Alloc(heapID, sizeof(MapChangeState));
    MIi_CpuClearFast(0, (u32 *)ret, sizeof(MapChangeState));
    return ret;
}

void MapChange_FreeState(MapChangeState *state) {
    Heap_Free(state);
}

void FieldSystem_SetTeleportWarpFlag(FieldSystem *fieldSystem, u32 flag) {
    fieldSystem->unkAC = flag;
}

void FieldSystem_HandleEnterMapNonWarp(FieldSystem *fieldSystem) {
    SaveVarsFlags *varsFlags = Save_VarsFlags_Get(fieldSystem->saveData);
    StrengthFlagAction(varsFlags, 0);
    FlypointFlagAction(fieldSystem, fieldSystem->location->mapId);
    RoamerSaveData *roamers = Save_Roamers_Get(fieldSystem->saveData);
    RoamerSave_SetFlute(roamers, 0);
    fieldSystem->unk7E = 0;
    fieldSystem->unk7C = 0;
    varsFlags = Save_VarsFlags_Get(fieldSystem->saveData);
    if (!Save_VarsFlags_CheckSafariSysFlag(varsFlags)) {
        roamers = Save_Roamers_Get(fieldSystem->saveData);
        UpdatePlayerLocationHistoryIfAnyRoamersActive(roamers, fieldSystem->location->mapId);
        Save_UpdateRoamersLocation(roamers);
    }
}

void FieldSystem_HandleEnterMapWarp(FieldSystem *fieldSystem) {
    if (fieldSystem->unkAC == 1) {
        return;
    }
    SaveVarsFlags *varsFlags = Save_VarsFlags_Get(fieldSystem->saveData);
    ClearFlag972(varsFlags);
    varsFlags = Save_VarsFlags_Get(fieldSystem->saveData);
    StrengthFlagAction(varsFlags, 0);
    FlypointFlagAction(fieldSystem, fieldSystem->location->mapId);
    RoamerSaveData *roamers = Save_Roamers_Get(fieldSystem->saveData);
    RoamerSave_SetFlute(roamers, 0);
    fieldSystem->unk7E = 0;
    fieldSystem->unk7C = 0;
    roamers = Save_Roamers_Get(fieldSystem->saveData);
    UpdatePlayerLocationHistoryIfAnyRoamersActive(roamers, fieldSystem->location->mapId);
    if (!MapHeader_IsCave(fieldSystem->location->mapId)) {
        varsFlags = Save_VarsFlags_Get(fieldSystem->saveData);
        SysFlagFlashClear(varsFlags);
        SysFlagDefogClear(varsFlags);
    }
    LocalFieldData *localFieldData = Save_LocalFieldData_Get(fieldSystem->saveData);
    PlayerSaveData *playerSaveData = LocalFieldData_GetPlayer(localFieldData);
    if (playerSaveData->state == 1) {
        if (!MapHeader_IsBikeAllowed(fieldSystem->location->mapId)) {
            playerSaveData->state = 0;
            return;
        }
    }
    if (playerSaveData->state == 2) {
        playerSaveData->state = 0;
    }
}

void FieldSystem_ExitSafariZoneWarp(FieldSystem *fieldSystem) {
    SaveVarsFlags *varsFlags = Save_VarsFlags_Get(fieldSystem->saveData);
    Save_VarsFlags_ClearSafariSysFlag(varsFlags);
    RoamerSaveData *roamers = Save_Roamers_Get(fieldSystem->saveData);
    Save_RandomizeRoamersLocation(roamers);
}

void FieldSystem_ExitSafariZoneNonWarp(FieldSystem *fieldSystem) {
    SaveVarsFlags *varsFlags = Save_VarsFlags_Get(fieldSystem->saveData);
    Save_VarsFlags_ClearSafariSysFlag(varsFlags);
    RoamerSaveData *roamers = Save_Roamers_Get(fieldSystem->saveData);
    Save_RandomizeRoamersLocation(roamers);
}

void FieldSystem_ClearSafariFlag(FieldSystem *fieldSystem) {
    SaveVarsFlags *varsFlags = Save_VarsFlags_Get(fieldSystem->saveData);
    Save_VarsFlags_ClearSafariSysFlag(varsFlags);
}

void FieldSystem_ClearFollowingTrainer(FieldSystem *fieldSystem) {
    SaveVarsFlags *varsFlags = Save_VarsFlags_Get(fieldSystem->saveData);
    Save_VarsFlags_ClearHaveFollowerFlag(varsFlags);
    Save_VarsFlags_SetFollowerTrainerNum(varsFlags, 0);
}

void FieldSystem_RandomizeRoamers(FieldSystem *fieldSystem) {
    RoamerSaveData *roamers = Save_Roamers_Get(fieldSystem->saveData);
    Save_RandomizeRoamersLocation(roamers);
}

FlyTaskEnv *FlyTask_CreateEnv(enum HeapID heapID, FieldSystem *fieldSystem, Pokemon *pokemon, u16 partySlot, u16 mapsec, s16 cursorX, s16 cursorY) {
    FlyTaskEnv *env = Heap_AllocAtEnd(heapID, sizeof(FlyTaskEnv));
    u8 *p = (u8 *)env;
    u32 i = sizeof(FlyTaskEnv);
    do {
        *p++ = 0;
        i--;
    } while (i != 0);
    env->fieldSystem = fieldSystem;
    env->pokemon = pokemon;
    env->mapsec = mapsec;
    env->cursorX = cursorX;
    env->cursorY = cursorY;
    env->partySlot = partySlot;
    return env;
}

BOOL Task_Fly(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    FlyTaskEnv *env = TaskManager_GetEnvironment(taskManager);

    switch (env->state) {
    case 0:
        TaskManager_Call(taskManager, ov01_02205A60, NULL);
        env->state++;
        break;
    case 1: {
        s32 avatarState = PlayerAvatar_GetState(fieldSystem->playerAvatar);
        if ((u32)(avatarState - 1) <= 1) {
            env->state = 4;
            env->flag = 0;
            break;
        }
        Party *party = SaveArray_Party_Get(fieldSystem->saveData);
        u8 firstAliveIdx = GetIdxOfFirstAliveMonInParty_CrashIfNone(party);
        if (env->partySlot != firstAliveIdx) {
            ov01_02205D68(env->fieldSystem);
            env->state = 4;
            env->flag = 0;
            break;
        }
        if (FollowMon_IsVisible(fieldSystem)) {
            u8 mood;
            if (ov02_02250780(fieldSystem, 2)) {
                mood = 2;
                FieldSystem_UnkSub108_AddMonMood(fieldSystem->unk108, 1);
            } else {
                mood = 1;
            }
            ov02_022507B4(fieldSystem, mood);
            env->flag = 1;
            env->state = 2;
        } else {
            env->state = 4;
            env->flag = 0;
        }
        break;
    }
    case 2: {
        s32 species = GetMonData(env->pokemon, MON_DATA_SPECIES, NULL);
        s32 form = GetMonData(env->pokemon, MON_DATA_FORM, NULL);
        PlayCry((u16)species, (u8)form);
        env->state++;
        break;
    }
    case 3:
        if (IsCryFinished()) {
            break;
        }
        env->state++;
        break;
    case 4: {
        LocalMapObject *playerObj = PlayerAvatar_GetMapObject(fieldSystem->playerAvatar);
        env->movementMan = EventObjectMovementMan_Create(playerObj, sFlyLandingMovement);
        env->state++;
        break;
    }
    case 5:
        if (!EventObjectMovementMan_IsFinish(env->movementMan)) {
            break;
        }
        EventObjectMovementMan_Delete(env->movementMan);
        if (env->flag == 0) {
            int gender = PlayerAvatar_GetGender(env->fieldSystem->playerAvatar);
            env->flyEffect = ov02_02249458(env->fieldSystem, 1, env->pokemon, gender);
        } else {
            int gender = PlayerAvatar_GetGender(env->fieldSystem->playerAvatar);
            env->flyEffect = ov02_02249458(env->fieldSystem, 2, env->pokemon, gender);
        }
        env->state++;
        break;
    case 6: {
        if (!ov02_0224953C(env->flyEffect)) {
            break;
        }
        ov02_02249548(env->flyEffect);
        LocalFieldData *localFieldData = Save_LocalFieldData_Get(fieldSystem->saveData);
        u16 spawnId = sub_0203BB50(env->mapsec);
        GF_ASSERT(spawnId != 0);
        Location flyWarp;
        GetFlyWarpData(spawnId, &flyWarp);
        Location *specialWarp = LocalFieldData_GetSpecialSpawnWarpPtr(localFieldData);
        GetSpecialSpawnWarpData(spawnId, specialWarp);
        sub_02053908(taskManager, flyWarp.mapId, -1, flyWarp.x, flyWarp.y, 1);
        Heap_Free(env);
        break;
    }
    }
    return FALSE;
}
