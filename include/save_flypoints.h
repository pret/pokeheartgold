#ifndef POKEHEARTGOLD_SAVE_FLYPOINTS_H
#define POKEHEARTGOLD_SAVE_FLYPOINTS_H

#include "save.h"
#include "script.h"

typedef struct FLYPOINTS_SAVE FLYPOINTS_SAVE;
struct SavedMapObjectList;

u32 Save_FlyPoints_sizeof(void);
u32 Save_MapObjects_sizeof(void);
void Save_MapObjects_init(struct SavedMapObjectList *unk);
void Save_FlyPoints_init(FLYPOINTS_SAVE *flypointsSave);
Location *FlyPoints_GetPosition(FLYPOINTS_SAVE *flypointsSave);
Location *sub_0203B95C(FLYPOINTS_SAVE *flypointsSave);
Location *sub_0203B960(FLYPOINTS_SAVE *flypointsSave);
Location *FlyPoints_GetSpecialSpawnWarpPtr(FLYPOINTS_SAVE *flypointsSave);
Location *FlyPoints_GetDynamicWarp(FLYPOINTS_SAVE *flypointsSave);
void FlyPoints_SetDynamicWarp(FLYPOINTS_SAVE *flypointsSave, const Location *location);
u16 *FlyPoints_GetMusicIdAddr(FLYPOINTS_SAVE *flypointsSave);
u16 FlyPoints_GetWeatherType(FLYPOINTS_SAVE *flypointsSave);
void FlyPoints_SetWeatherType(FLYPOINTS_SAVE *flypointsSave, const u16 a1);
u16 FlyPoints_GetDeathSpawn(FLYPOINTS_SAVE *flypointsSave);
void FlyPoints_SetDeathSpawn(FLYPOINTS_SAVE *flypointsSave, const u16 spawn);
u32 FlyPoints_GetCameraType(FLYPOINTS_SAVE *flypointsSave);
void FlyPoints_SetCameraType(FLYPOINTS_SAVE *flypointsSave, const u32 cameraType);
struct FlypointsPlayerSub *SaveFlyPoints_GetPlayerSub(FLYPOINTS_SAVE *flypointsSave);
u16 *FlyPoints_GetSafariBallsCounter(FLYPOINTS_SAVE *flypointsSave);
u16 *FlyPoints_GetSafariStepsCounter(FLYPOINTS_SAVE *flypointsSave);
u16 *FlyPoints_GetPoisonStepCounter(FLYPOINTS_SAVE *flypointsSave);
FLYPOINTS_SAVE *Save_FlyPoints_get(SAVEDATA *saveData);
struct SavedMapObjectList *Save_MapObjects_get(SAVEDATA *saveData);
void Fsys_SyncMapObjectsToSave(FieldSystem *fsys);
void Fsys_RestoreMapObjectsFromSave(FieldSystem *fsys);

#endif //POKEHEARTGOLD_SAVE_FLYPOINTS_H
