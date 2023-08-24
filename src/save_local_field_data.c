#include "global.h"
#include "save_local_field_data.h"
#include "field_player_avatar.h"
#include "field_map_object.h"
#include "script_pokemon_util.h"
#include "unk_0203BA5C.h"
#include "constants/scrcmd.h"

struct LocalFieldData {
    Location currentPosition;
    Location entrancePosition;
    Location previousPosition;
    Location dynamicWarp;
    Location specialSpawn;
    u16 musicId;
    u16 weather;
    u16 lastSpawn;
    u8 cameraType;
    struct PlayerSaveData player;
    u16 poisonStepCounter;
    u16 safariStepCounter;
    u16 safariBallCounter;
    u8 filler7A[6];
};

struct SavedMapObjectList {
    struct SavedMapObject subs[64];
};

u32 Save_LocalFieldData_sizeof(void) {
    return sizeof(LocalFieldData);
}

u32 Save_MapObjects_sizeof(void) {
    return sizeof(struct SavedMapObjectList);
}

void Save_MapObjects_Init(struct SavedMapObjectList *unk) {
    MI_CpuClear32(unk, sizeof(struct SavedMapObjectList));
}

void Save_LocalFieldData_Init(LocalFieldData *localFieldData) {
    memset(localFieldData, 0, sizeof(LocalFieldData));
    PlayerSaveData_Init(&localFieldData->player);
    localFieldData->lastSpawn = GetMomSpawnId();
}

Location *LocalFieldData_GetCurrentPosition(LocalFieldData *localFieldData) {
    return &localFieldData->currentPosition;
}

Location *LocalFieldData_GetEntrancePosition(LocalFieldData *localFieldData) {
    return &localFieldData->entrancePosition;
}

Location *LocalFieldData_GetPreviousPosition(LocalFieldData *localFieldData) {
    return &localFieldData->previousPosition;
}

Location *LocalFieldData_GetSpecialSpawnWarpPtr(LocalFieldData *localFieldData) {
    return &localFieldData->specialSpawn;
}

Location *LocalFieldData_GetDynamicWarp(LocalFieldData *localFieldData) {
    return &localFieldData->dynamicWarp;
}

void LocalFieldData_SetDynamicWarp(LocalFieldData *localFieldData, const Location *location) {
    localFieldData->dynamicWarp = *location;
}

u16 *LocalFieldData_GetMusicIdAddr(LocalFieldData *localFieldData) {
    return &localFieldData->musicId;
}

u16 LocalFieldData_GetWeatherType(LocalFieldData *localFieldData) {
    return localFieldData->weather;
}

void LocalFieldData_SetWeatherType(LocalFieldData *localFieldData, const u16 weather) {
    localFieldData->weather = weather;
}

u16 LocalFieldData_GetBlackoutSpawn(LocalFieldData *localFieldData) {
    return localFieldData->lastSpawn;
}

void LocalFieldData_SetBlackoutSpawn(LocalFieldData *localFieldData, const u16 spawn) {
    localFieldData->lastSpawn = spawn;
}

u32 LocalFieldData_GetCameraType(LocalFieldData *localFieldData) {
    return localFieldData->cameraType;
}

void LocalFieldData_SetCameraType(LocalFieldData *localFieldData, const u32 cameraType) {
    localFieldData->cameraType = cameraType;
}

struct PlayerSaveData *LocalFieldData_GetPlayer(LocalFieldData *localFieldData) {
    return &localFieldData->player;
}

u16 *LocalFieldData_GetSafariBallsCounter(LocalFieldData *localFieldData) {
    return &localFieldData->safariBallCounter;
}

u16 *LocalFieldData_GetSafariStepsCounter(LocalFieldData *localFieldData) {
    return &localFieldData->safariStepCounter;
}

u16 *LocalFieldData_GetPoisonStepCounter(LocalFieldData *localFieldData) {
    return &localFieldData->poisonStepCounter;
}

LocalFieldData *Save_LocalFieldData_Get(SaveData *saveData) {
    return SaveArray_Get(saveData, SAVE_LOCAL_FIELD_DATA);
}

struct SavedMapObjectList *Save_MapObjects_Get(SaveData *saveData) {
    return SaveArray_Get(saveData, SAVE_MAP_OBJECTS);
}

void FieldSystem_SyncMapObjectsToSave(FieldSystem *fieldSystem) {
    struct SavedMapObjectList *unk = Save_MapObjects_Get(fieldSystem->saveData);
    FieldSystem_SyncMapObjectsToSaveEx(fieldSystem, fieldSystem->mapObjectMan, unk->subs, 64);
}

void FieldSystem_RestoreMapObjectsFromSave(FieldSystem *fieldSystem) {
    struct SavedMapObjectList *unk = Save_MapObjects_Get(fieldSystem->saveData);
    struct SavedMapObject *follower = SaveMapObjects_SearchSpriteId(unk->subs, 64, SPRITE_FOLLOWER_MON_SHAYMIN_SKY);
    Pokemon *mon;
    int species;
    int form;

    if (follower != NULL && follower->objId == obj_partner_poke) {
        mon = GetFirstAliveMonInParty_CrashIfNone(SaveArray_Party_Get(fieldSystem->saveData));
        species = GetMonData(mon, MON_DATA_SPECIES, NULL);
        form = GetMonData(mon, MON_DATA_FORM, NULL);
        if (species != SPECIES_SHAYMIN) {
            GF_ASSERT(FALSE);
        } else if (form == SHAYMIN_LAND) {
            follower->gfxId = SPRITE_FOLLOWER_MON_SHAYMIN;
        }
    }
    MapObjectManager_RestoreFromSave(fieldSystem->mapObjectMan, unk->subs, 64);
}
