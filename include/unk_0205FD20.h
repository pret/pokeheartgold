#ifndef POKEHEARTGOLD_UNK_0205FD20_H
#define POKEHEARTGOLD_UNK_0205FD20_H

#include "map_object.h"
#include "task.h"

void sub_02061070(LocalMapObject *object);
void VecFx32_StepDirection(int direction, VecFx32 *vec, fx32 val);
u32 Direction_GetOpposite(u32 direction);
BOOL sub_02060E54(LocalMapObject *object, int tile);
BOOL sub_02060EBC(LocalMapObject *object, int tile);
int GetDeltaXByFacingDirection(int direction);
int GetDeltaYByFacingDirection(int direction);
void sub_020611C8(int x, int y, VecFx32 *a2);
BOOL MapObject_RecalculatePositionHeight(FieldSystem *fieldSystem, VecFx32 *a1);
void sub_02060F78(LocalMapObject *object);
u32 LocalMapObject_GetNextPositionMetatileBehavior(LocalMapObject *object, int direction);
u32 sub_02060FE0(LocalMapObject *object, int direction);

#endif // POKEHEARTGOLD_UNK_0205FD20_H
