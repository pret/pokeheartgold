#ifndef POKEHEARTGOLD_FIELD_MAP_OBJECT_H
#define POKEHEARTGOLD_FIELD_MAP_OBJECT_H

typedef struct LocalMapObject LocalMapObject;

LocalMapObject *GetMapObjectByID(LocalMapObject *arr, int id);
void sub_0205FC94(LocalMapObject *mapObject, int movement);
void MapObject_SetGfxID(LocalMapObject *mapObject, u32 spriteId);
void sub_0205F6AC(LocalMapObject *mapObject, int a1);

#endif //POKEHEARTGOLD_FIELD_MAP_OBJECT_H
