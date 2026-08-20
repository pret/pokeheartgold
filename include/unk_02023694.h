#ifndef POKEHEARTGOLD_UNK_02023694_H
#define POKEHEARTGOLD_UNK_02023694_H

#include "constants/heap.h"

#include "sprite.h"

void BillboardLists_Create(int count, enum HeapID heapID);
void BillboardLists_Delete(void);
void BillboardLists_Draw(void);
void sub_02023910(void *arg0);
void sub_02023EA4(Sprite *sprite, int arg1);

#endif // POKEHEARTGOLD_UNK_02023694_H
