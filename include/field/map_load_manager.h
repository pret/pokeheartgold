#ifndef POKEHEARTGOLD_FIELD_MAP_LOAD_MANAGER_H
#define POKEHEARTGOLD_FIELD_MAP_LOAD_MANAGER_H

#include "field/map_prop_animation.h"

#include "field_system.h"

#define MAP_PROP_MAX 32

void MapLoadManager_Tick(MapLoadManager *mapLoadManager);
MapLoadManager *MapLoadManager_New(MapMatrix *mapMatrix, void *unk34, void *unkC0, MapPropAnimationManager *mapPropAnimationManager, void *unkCC, int unk64, SaveData *saveData);
void MapLoadManager_InitialLoad(MapLoadManager *mapLoadManager, int x, int z);
void MapLoadManager_RenderLoadedMaps(MapLoadManager *mapLoadManager, ModelAttributes *modelAttributes);
void MapLoadManager_End(MapLoadManager *mapLoadManager);
void MapLoadManager_FreeNARCAndLoadedMapBuffers(MapLoadManager *mapLoadManager);
BOOL MapLoadManager_HasEnded(MapLoadManager *mapLoadManager);
void MapLoadManager_TrackTarget(VecFx32 *vec, MapLoadManager *mapLoadManager);
void MapLoadManager_ForgetTrackedTarget(MapLoadManager *mapLoadManager);
void ov01_021F630C(int arg0, MapLoadManager *mapLoadManager, MapPropManager **mapPropManager);
u8 ov01_021F6320(MapLoadManager *mapLoadManager);
u16 *ov01_021F65E4(MapLoadManager *mapLoadManager, u8 arg1);
u8 *ov01_021F65F0(MapLoadManager *mapLoadManager, u8 arg1);

#endif // POKEHEARTGOLD_FIELD_MAP_LOAD_MANAGER_H
