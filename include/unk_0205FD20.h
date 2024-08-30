#ifndef POKEHEARTGOLD_UNK_0205FD20_H
#define POKEHEARTGOLD_UNK_0205FD20_H

#include "map_object.h"
#include "task.h"

void sub_02061070(LocalMapObject *object);
u32 sub_020611F4(u32 direction);
BOOL sub_02060E54(LocalMapObject *object, int tile);
BOOL sub_02060EBC(LocalMapObject *object, int tile);
int GetDeltaXByFacingDirection(int direction);
int GetDeltaYByFacingDirection(int direction);
void sub_020611C8(int x, int y, VecFx32 *a2);
void sub_0206121C(TaskManager *taskman, VecFx32 *a1);

#endif // POKEHEARTGOLD_UNK_0205FD20_H
