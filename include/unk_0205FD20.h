#ifndef POKEHEARTGOLD_UNK_0205FD20_H
#define POKEHEARTGOLD_UNK_0205FD20_H

#include "field_map_object.h"

void sub_02061070(LocalMapObject *object);
u32 sub_020611F4(u32 direction);
BOOL sub_02060E54(LocalMapObject *object, int tile);
BOOL sub_02060EBC(LocalMapObject *object, int tile);
int GetDeltaXByFacingDirection(int direction);
int GetDeltaYByFacingDirection(int direction);

#endif //POKEHEARTGOLD_UNK_0205FD20_H
