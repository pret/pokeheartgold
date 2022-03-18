#ifndef POKEHEARTGOLD_SAVE_FLYPOINTS_H
#define POKEHEARTGOLD_SAVE_FLYPOINTS_H

#include "save.h"
#include "script.h"

typedef struct FLYPOINTS_SAVE FLYPOINTS_SAVE;
struct SavStructUnk10;

u32 Save_FlyPoints_sizeof(void);
u32 sub_0203B920(void);
void sub_0203B928(struct SavStructUnk10 *unk);
void Save_FlyPoints_init(FLYPOINTS_SAVE *flypointsSave);
Location *FlyPoints_GetPosition(FLYPOINTS_SAVE *flypointsSave);
Location *sub_0203B95C(FLYPOINTS_SAVE *flypointsSave);
Location *sub_0203B960(FLYPOINTS_SAVE *flypointsSave);
Location *FlyPoints_GetSpecialSpawnWarpPtr(FLYPOINTS_SAVE *flypointsSave);
Location *FlyPoints_GetDynamicWarp(FLYPOINTS_SAVE *flypointsSave);
void FlyPoints_SetDynamicWarp(FLYPOINTS_SAVE *flypointsSave, const Location *location);
u16 *sub_0203B980(FLYPOINTS_SAVE *flypointsSave);
u16 FlyPoints_GetWeatherType(FLYPOINTS_SAVE *flypointsSave);
void FlyPoints_SetWeatherType(FLYPOINTS_SAVE *flypointsSave, const u16 a1);
u16 FlyPoints_GetDeathSpawn(FLYPOINTS_SAVE *flypointsSave);
void FlyPoints_SetDeathSpawn(FLYPOINTS_SAVE *flypointsSave, const u16 spawn);
u32 FlyPoints_GetCameraType(FLYPOINTS_SAVE *flypointsSave);
void FlyPoints_SetCameraType(FLYPOINTS_SAVE *flypointsSave, const u32 cameraType);
struct FlypointsPlayerSub *sub_0203B9B4(FLYPOINTS_SAVE *flypointsSave);
u16 *FlyPoints_GetSafariBallsCounter(FLYPOINTS_SAVE *flypointsSave);
u16 *FlyPoints_GetSafariStepsCounter(FLYPOINTS_SAVE *flypointsSave);
u16 *FlyPoints_GetPoisonStepCounter(FLYPOINTS_SAVE *flypointsSave);
FLYPOINTS_SAVE *Save_FlyPoints_get(SAVEDATA *saveData);
struct SavStructUnk10 *sub_0203B9D0(SAVEDATA *saveData);
void sub_0203B9DC(FieldSystem *fsys);
void sub_0203B9F4(FieldSystem *fsys);

#endif //POKEHEARTGOLD_SAVE_FLYPOINTS_H
