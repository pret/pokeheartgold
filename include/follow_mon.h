#ifndef POKEHEARTGOLD_FOLLOW_MON_H
#define POKEHEARTGOLD_FOLLOW_MON_H

#include "heap.h"
#include "map_object.h"
#include "map_object_manager.h"

#define FOLLOW_MON_PARAM_SPECIES 0

LocalMapObject *FollowMon_InitMapObject(MapObjectManager *mapObjectManager, int x, int y, int direction, u32 mapNo);
void FollowMon_ChangeMon(MapObjectManager *mapObjectManager, u32 mapNo);
LocalMapObject *FollowMon_GetMapObject(FieldSystem *fieldSystem);
u32 FollowMon_GetSpriteID(int species, u16 form, u32 gender);
void sub_02069DC8(LocalMapObject *mapObject, BOOL enableBit);
void sub_02069DEC(LocalMapObject *mapObject, BOOL enableBit);
u8 sub_02069E14(LocalMapObject *mapObject);
void sub_02069E28(LocalMapObject *mapObject, u32 a1);
void sub_02069E50(LocalMapObject *mapObject, u8 a1);
void sub_02069E84(LocalMapObject *mapObject, u8 a1);
u8 sub_02069EAC(LocalMapObject *mapObject);
u8 sub_02069EC0(LocalMapObject *mapObject);
u8 sub_02069ED4(LocalMapObject *mapObject);
void FollowMon_SetObjectParams(LocalMapObject *mapObject, int species, u8 form, BOOL shiny);
void sub_02069F0C(LocalMapObject *mapObject, int species, u8 form, BOOL shiny, int a4);
void FieldSystem_SetFollowerPokeParam(FieldSystem *fieldSystem, int species, u8 form, BOOL shiny, u8 gender);
u8 FollowMon_GetSizeParamBySpecies(int species);
int FollowMon_GetSpecies(LocalMapObject *mapObject);
BOOL FollowMon_IsActive(FieldSystem *fieldSystem);
BOOL FollowMon_IsVisible(FieldSystem *fieldSystem);
BOOL FollowMon_GetPermission(FieldSystem *fieldSystem);
BOOL FollowMon_GetPermissionBySpeciesAndMap(int species, u32 mapNo);
void sub_0206A040(LocalMapObject *mapObject, BOOL enableBit);
void sub_0206A054(FieldSystem *fieldSystem);
FieldSystemUnk108 *FieldSystem_UnkSub108_Alloc(HeapID heapId);
void FieldSystem_UnkSub108_AddMonMood(FieldSystemUnk108 *unk, s8 by);
void FieldSystem_UnkSub108_SetMonMood(FieldSystemUnk108 *unk, s8 mood);
s8 FieldSystem_UnkSub108_GetMonMood(FieldSystemUnk108 *unk);
void FieldSystem_UnkSub108_Set(FieldSystemUnk108 *a0, Pokemon *mon, u16 species, u32 personality);
void FieldSystem_UnkSub108_MoveMoodTowardsNeutral(FieldSystemUnk108 *a0);
int SpeciesToOverworldModelIndexOffset(int species);
int OverworldModelLookupFormCount(int species);
BOOL OverworldModelLookupHasFemaleForm(int species);

#endif // POKEHEARTGOLD_FOLLOW_MON_H
