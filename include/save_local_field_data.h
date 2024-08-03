#ifndef POKEHEARTGOLD_SAVE_LOCAL_FIELD_DATA_H
#define POKEHEARTGOLD_SAVE_LOCAL_FIELD_DATA_H

#include "save.h"
#include "script.h"

typedef struct LocalFieldData LocalFieldData;
struct SavedMapObjectList;

u32 Save_LocalFieldData_sizeof(void);
u32 Save_MapObjects_sizeof(void);
void Save_MapObjects_Init(struct SavedMapObjectList *unk);
void Save_LocalFieldData_Init(LocalFieldData *localFieldData);
Location *LocalFieldData_GetCurrentPosition(LocalFieldData *localFieldData);
Location *LocalFieldData_GetEntrancePosition(LocalFieldData *localFieldData);
Location *LocalFieldData_GetPreviousPosition(LocalFieldData *localFieldData);
Location *LocalFieldData_GetSpecialSpawnWarpPtr(LocalFieldData *localFieldData);
Location *LocalFieldData_GetDynamicWarp(LocalFieldData *localFieldData);
void LocalFieldData_SetDynamicWarp(LocalFieldData *localFieldData, const Location *location);
u16 *LocalFieldData_GetMusicIdAddr(LocalFieldData *localFieldData);
u16 LocalFieldData_GetWeatherType(LocalFieldData *localFieldData);
void LocalFieldData_SetWeatherType(LocalFieldData *localFieldData, const u16 weather);
u16 LocalFieldData_GetBlackoutSpawn(LocalFieldData *localFieldData);
void LocalFieldData_SetBlackoutSpawn(LocalFieldData *localFieldData, const u16 spawn);
u32 LocalFieldData_GetCameraType(LocalFieldData *localFieldData);
void LocalFieldData_SetCameraType(LocalFieldData *localFieldData, const u32 cameraType);
struct PlayerSaveData *LocalFieldData_GetPlayer(LocalFieldData *localFieldData);
u16 *LocalFieldData_GetSafariBallsCounter(LocalFieldData *localFieldData);
u16 *LocalFieldData_GetSafariStepsCounter(LocalFieldData *localFieldData);
u16 *LocalFieldData_GetPoisonStepCounter(LocalFieldData *localFieldData);
LocalFieldData *Save_LocalFieldData_Get(SaveData *saveData);
struct SavedMapObjectList *Save_MapObjects_Get(SaveData *saveData);
void FieldSystem_SyncMapObjectsToSave(FieldSystem *fieldSystem);
void FieldSystem_RestoreMapObjectsFromSave(FieldSystem *fieldSystem);

#endif // POKEHEARTGOLD_SAVE_LOCAL_FIELD_DATA_H
