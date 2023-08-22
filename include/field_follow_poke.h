#ifndef POKEHEARTGOLD_FIELD_FOLLOW_POKE_H
#define POKEHEARTGOLD_FIELD_FOLLOW_POKE_H

#include "field_map_object.h"
#include "heap.h"
#include "map_object_manager.h"

LocalMapObject *sub_020699F8(MapObjectManager *mapObjectMan, int x, int y, int direction, u32 mapno);
void sub_02069B74(MapObjectManager *mapObjectMan, u32 mapno);
LocalMapObject *FollowingPokemon_GetMapObject(FieldSystem *fieldSystem);
u32 FollowingPokemon_GetSpriteID(int species, u16 form, u32 gender);
void sub_02069DC8(LocalMapObject *mapObject, BOOL enable_bit);
void sub_02069DEC(LocalMapObject *mapObject, BOOL enable_bit);
u8 sub_02069E14(LocalMapObject *mapObject);
void sub_02069E28(LocalMapObject *mapObject, u32 a1);
void sub_02069E50(LocalMapObject *mapObject, u8 a1);
void sub_02069E84(LocalMapObject *mapObject, u8 a1);
u8 sub_02069EAC(LocalMapObject *mapObject);
u8 sub_02069EC0(LocalMapObject *mapObject);
u8 sub_02069ED4(LocalMapObject *mapObject);
void FollowPokeMapObjectSetParams(LocalMapObject *mapObject, int species, u8 form, BOOL shiny);
void sub_02069F0C(LocalMapObject *mapObject, int species, u8 form, BOOL shiny, int a4);
void FieldSystem_SetFollowPokeParam(FieldSystem *fieldSystem, int species, u8 form, BOOL shiny, u8 gender);
u8 GetFollowPokeSizeParamBySpecies(int species);
int FollowPokeObj_GetSpecies(LocalMapObject *mapObject);
BOOL FollowingPokemon_IsActive(FieldSystem *fieldSystem);
BOOL sub_02069FB0(FieldSystem *fieldSystem);
BOOL GetFollowPokePermission(FieldSystem *fieldSystem);
BOOL GetFollowPokePermissionBySpeciesAndMap(int species, u32 mapno);
void sub_0206A040(LocalMapObject *mapObject, BOOL enable_bit);
void sub_0206A054(FieldSystem *fieldSystem);
struct FieldSystemUnk108 *FieldSystemUnkSub108_Alloc(HeapID heapId);
void FieldSystemUnkSub108_AddMonMood(struct FieldSystemUnk108 *unk, s8 by);
void FieldSystemUnkSub108_SetMonMood(struct FieldSystemUnk108 *unk, s8 mood);
s8 FieldSystemUnkSub108_GetMonMood(struct FieldSystemUnk108 *unk);
void FieldSystemUnkSub108_Set(struct FieldSystemUnk108 *a0, Pokemon *mon, u16 species, u32 personality);
void FieldSystemUnkSub108_MoveMoodTowardsNeutral(struct FieldSystemUnk108 *a0);
int SpeciesToOverworldModelIndexOffset(int species);
int OverworldModelLookupFormCount(int species);
BOOL OverworldModelLookupHasFemaleForm(int species);

#endif //POKEHEARTGOLD_FIELD_FOLLOW_POKE_H
