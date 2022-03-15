#ifndef POKEHEARTGOLD_UNK_0200FA24_H
#define POKEHEARTGOLD_UNK_0200FA24_H

#include "heap.h"

void BeginNormalPaletteFade(int pattern, int typeTop, int typeBottom, u16 color, int duration, int framesPer, HeapID heapId);
void sub_0200FBDC(int a0);
void sub_0200FBF4(int a0, int a1);
void sub_0200FB2C(void);
BOOL IsPaletteFadeActive(void);

#endif //POKEHEARTGOLD_UNK_0200FA24_H
