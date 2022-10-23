#include "save_flypoints.h"
#include "field_player_avatar.h"
#include "field_map_object.h"
#include "script_pokemon_util.h"
#include "unk_0203BA5C.h"
#include "constants/scrcmd.h"

struct FLYPOINTS_SAVE {
    Location position;
    Location unk14;
    Location unk28;
    Location dynamicWarp;
    Location specialSpawn;
    u16 musicId;
    u16 weather;
    u16 lastSpawn;
    u8 cameraType;
    struct FlypointsPlayerSub player;
    u16 poisonStepCounter;
    u16 safariStepCounter;
    u16 safariBallCounter;
    u8 filler7A[6];
};

struct SavedMapObjectList {
    struct SavedMapObject subs[64];
};

u32 Save_FlyPoints_sizeof(void) {
    return sizeof(FLYPOINTS_SAVE);
}

u32 Save_MapObjects_sizeof(void) {
    return sizeof(struct SavedMapObjectList);
}

void Save_MapObjects_init(struct SavedMapObjectList *unk) {
    MI_CpuClear32(unk, sizeof(struct SavedMapObjectList));
}

void Save_FlyPoints_init(FLYPOINTS_SAVE *flypointsSave) {
    memset(flypointsSave, 0, sizeof(FLYPOINTS_SAVE));
    FlypointsPlayerSub_init(&flypointsSave->player);
    flypointsSave->lastSpawn = GetMomSpawnId();
}

Location *FlyPoints_GetPosition(FLYPOINTS_SAVE *flypointsSave) {
    return &flypointsSave->position;
}

Location *sub_0203B95C(FLYPOINTS_SAVE *flypointsSave) {
    return &flypointsSave->unk14;
}

Location *sub_0203B960(FLYPOINTS_SAVE *flypointsSave) {
    return &flypointsSave->unk28;
}

Location *FlyPoints_GetSpecialSpawnWarpPtr(FLYPOINTS_SAVE *flypointsSave) {
    return &flypointsSave->specialSpawn;
}

Location *FlyPoints_GetDynamicWarp(FLYPOINTS_SAVE *flypointsSave) {
    return &flypointsSave->dynamicWarp;
}

void FlyPoints_SetDynamicWarp(FLYPOINTS_SAVE *flypointsSave, const Location *location) {
    flypointsSave->dynamicWarp = *location;
}

u16 *FlyPoints_GetMusicIdAddr(FLYPOINTS_SAVE *flypointsSave) {
    return &flypointsSave->musicId;
}

u16 FlyPoints_GetWeatherType(FLYPOINTS_SAVE *flypointsSave) {
    return flypointsSave->weather;
}

void FlyPoints_SetWeatherType(FLYPOINTS_SAVE *flypointsSave, const u16 a1) {
    flypointsSave->weather = a1;
}

u16 FlyPoints_GetDeathSpawn(FLYPOINTS_SAVE *flypointsSave) {
    return flypointsSave->lastSpawn;
}

void FlyPoints_SetDeathSpawn(FLYPOINTS_SAVE *flypointsSave, const u16 spawn) {
    flypointsSave->lastSpawn = spawn;
}

u32 FlyPoints_GetCameraType(FLYPOINTS_SAVE *flypointsSave) {
    return flypointsSave->cameraType;
}

void FlyPoints_SetCameraType(FLYPOINTS_SAVE *flypointsSave, const u32 cameraType) {
    flypointsSave->cameraType = cameraType;
}

struct FlypointsPlayerSub *SaveFlyPoints_GetPlayerSub(FLYPOINTS_SAVE *flypointsSave) {
    return &flypointsSave->player;
}

u16 *FlyPoints_GetSafariBallsCounter(FLYPOINTS_SAVE *flypointsSave) {
    return &flypointsSave->safariBallCounter;
}

u16 *FlyPoints_GetSafariStepsCounter(FLYPOINTS_SAVE *flypointsSave) {
    return &flypointsSave->safariStepCounter;
}

u16 *FlyPoints_GetPoisonStepCounter(FLYPOINTS_SAVE *flypointsSave) {
    return &flypointsSave->poisonStepCounter;
}

FLYPOINTS_SAVE *Save_FlyPoints_get(SAVEDATA *saveData) {
    return SavArray_get(saveData, SAVE_FLYPOINTS);
}

struct SavedMapObjectList *Save_MapObjects_get(SAVEDATA *saveData) {
    return SavArray_get(saveData, SAVE_MAP_OBJECTS);
}

void Fsys_SyncMapObjectsToSave(FieldSystem *fsys) {
    struct SavedMapObjectList *unk = Save_MapObjects_get(fsys->savedata);
    Fsys_SyncMapObjectsToSaveEx(fsys, fsys->mapObjectMan, unk->subs, 64);
}

void Fsys_RestoreMapObjectsFromSave(FieldSystem *fsys) {
    struct SavedMapObjectList *unk = Save_MapObjects_get(fsys->savedata);
    struct SavedMapObject *follower = SaveMapObjects_SearchSpriteId(unk->subs, 64, SPRITE_TSURE_POKE_SHAYMIN_SKY);
    POKEMON *pokemon;
    int species;
    int forme;

    if (follower != NULL && follower->objId == obj_partner_poke) {
        pokemon = GetFirstAliveMonInParty_CrashIfNone(SavArray_PlayerParty_get(fsys->savedata));
        species = GetMonData(pokemon, MON_DATA_SPECIES, NULL);
        forme = GetMonData(pokemon, MON_DATA_FORME, NULL);
        if (species != SPECIES_SHAYMIN) {
            GF_ASSERT(0);
        } else if (forme == SHAYMIN_LAND) {
            follower->gfxId = SPRITE_TSURE_POKE_SHAYMIN;
        }
    }
    MapObjectMan_RestoreFromSave(fsys->mapObjectMan, unk->subs, 64);
}
