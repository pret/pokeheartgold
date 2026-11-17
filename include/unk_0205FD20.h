#ifndef POKEHEARTGOLD_UNK_0205FD20_H
#define POKEHEARTGOLD_UNK_0205FD20_H

#include "map_object.h"
#include "task.h"

BOOL MapObject_IsOutOfRange(LocalMapObject *object, int x, int y, int z);
BOOL sub_02060DEC(LocalMapObject *object, int x, int z, int direction);
BOOL MapObject_IsOnElevatedBridge(LocalMapObject *object, u32 tileBehavior);
void sub_02061070(LocalMapObject *object);
void VecFx32_StepDirection(int direction, VecFx32 *vec, fx32 val);
u32 Direction_GetOpposite(u32 direction);
BOOL MapObject_IsOnWater(LocalMapObject *object, int tile);
BOOL MapObject_IsOnSnow(LocalMapObject *object, int tile);
int GetDeltaXByFacingDirection(int direction);
int GetDeltaZByFacingDirection(int direction);
void sub_020611C8(int x, int y, VecFx32 *a2);
BOOL MapObject_RecalculatePositionHeight(FieldSystem *fieldSystem, VecFx32 *a1);
void MapObject_UpdateCoords(LocalMapObject *object);
u32 LocalMapObject_GetNextPositionMetatileBehavior(LocalMapObject *object, int direction);
u32 sub_02060FE0(LocalMapObject *object, int direction);

#endif // POKEHEARTGOLD_UNK_0205FD20_H
