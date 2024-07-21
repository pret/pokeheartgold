#ifndef POKEHEARTGOLD_UNK_0208805C_H
#define POKEHEARTGOLD_UNK_0208805C_H

#include "heap.h"

u8 CalculateHpBarPixelsLength(int hp, int maxHp, int pixelsWide);
int CalculateHpBarColor(u16 hp, u16 maxHp, int pixelsWide);
int sub_020880CC(int a0, HeapID heapId);

#endif