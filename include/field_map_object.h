#ifndef POKEHEARTGOLD_FIELD_MAP_OBJECT_H
#define POKEHEARTGOLD_FIELD_MAP_OBJECT_H

typedef struct LocalMapObject LocalMapObject;

LocalMapObject *CreateSpecialFieldObject(MapObjectMan *objectMan, u32 x, u32 y, u32 direction, u32 sprite, u32 movement, u32 mapNo);
void DeleteMapObject(LocalMapObject *mapObject);
LocalMapObject *GetMapObjectByID(MapObjectMan *arr, int id);
void sub_0205FC94(LocalMapObject *mapObject, int movement);
void MapObject_SetGfxID(LocalMapObject *mapObject, u32 spriteId);
void sub_0205F6AC(LocalMapObject *mapObject, int a1);
void MapObject_SetBits(LocalMapObject *mapObject, u32 bits);
void MapObject_ClearBits(LocalMapObject *mapObject, u32 bits);
void MapObject_SetID(LocalMapObject *mapObject, u32 id);
void MapObject_SetType(LocalMapObject *mapObject, u32 type);
void MapObject_SetFlagID(LocalMapObject *mapObject, u32 flagId);
void MapObject_SetScript(LocalMapObject *mapObject, u32 script);
void MapObject_SetParam(LocalMapObject *mapObject, int value, int which);
int MapObject_GetParam(LocalMapObject *mapObject, int which);
void MapObject_SetXRange(LocalMapObject *mapObject, u32 xRange);
void MapObject_SetYRange(LocalMapObject *mapObject, u32 yRange);
void sub_0205F89C(LocalMapObject* map_object, BOOL enable_bit);

#endif //POKEHEARTGOLD_FIELD_MAP_OBJECT_H
