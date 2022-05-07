#ifndef POKEHEARTGOLD_FIELD_FOLLOW_POKE_H
#define POKEHEARTGOLD_FIELD_FOLLOW_POKE_H

#include "field_map_object.h"
#include "heap.h"
#include "map_object_manager.h"

LocalMapObject *sub_020699F8(MapObjectMan *mapObjectMan, int x, int y, int direction, u32 mapno);
void sub_02069B74(MapObjectMan *mapObjectMan, u32 mapno);
LocalMapObject *FollowingPokemon_GetMapObject(FieldSystem *fsys);
u32 FollowingPokemon_GetSpriteID(int species, u16 forme, u32 gender);
void sub_02069DC8(LocalMapObject *mapObject, BOOL enable_bit);
void sub_02069DEC(LocalMapObject *mapObject, BOOL enable_bit);
u8 sub_02069E14(LocalMapObject *mapObject);
void sub_02069E28(LocalMapObject *mapObject, u32 a1);
void sub_02069E50(LocalMapObject *mapObject, u8 a1);
void sub_02069E84(LocalMapObject *mapObject, u8 a1);
u8 sub_02069EAC(LocalMapObject *mapObject);
u8 sub_02069EC0(LocalMapObject *mapObject);
u8 sub_02069ED4(LocalMapObject *mapObject);
void FollowPokeMapObjectSetParams(LocalMapObject *mapObject, int species, u8 forme, BOOL shiny);
void sub_02069F0C(LocalMapObject *mapObject, int species, u8 forme, BOOL shiny, int a4);
void FollowPokeFsysParamSet(FieldSystem *fsys, int species, u8 forme, BOOL shiny, u8 gender);
u8 GetFollowPokeSizeParamBySpecies(int species);
int FollowPokeObj_GetSpecies(LocalMapObject *mapObject);
BOOL FollowingPokemon_IsActive(FieldSystem *fsys);
BOOL sub_02069FB0(FieldSystem *fsys);
BOOL sub_02069FD4(FieldSystem *fsys);
BOOL GetFollowPokePermissionBySpeciesAndMap(int species, u32 mapno);
void sub_0206A040(LocalMapObject *mapObject, BOOL enable_bit);
void sub_0206A054(FieldSystem *fsys);
struct FieldSystemUnk108 *FsysUnkSub108_Alloc(HeapID heapId);
void FsysUnkSub108_AddMonMood(struct FieldSystemUnk108 *unk, s8 by);
void FsysUnkSub108_SetMonMood(struct FieldSystemUnk108 *unk, s8 mood);
s8 FsysUnkSub108_GetMonMood(struct FieldSystemUnk108 *unk);
void FsysUnkSub108_Set(struct FieldSystemUnk108 *a0, POKEMON *pokemon, u16 species, u32 personality);
void FsysUnkSub108_MoveMoodTowardsNeutral(struct FieldSystemUnk108 *a0);
int SpeciesToOverworldModelIndexOffset(int species);
int OverworldModelLookupFormeCount(int species);
BOOL OverworldModelLookupHasFemaleForme(int species);

#endif //POKEHEARTGOLD_FIELD_FOLLOW_POKE_H
