#ifndef POKEHEARTGOLD_UNK_0208805C_H
#define POKEHEARTGOLD_UNK_0208805C_H

#include "bg_window.h"
#include "filesystem.h"
#include "heap.h"

u16 sub_0208805C(int a0);
u8 CalculateHpBarPixelsLength(u32 hp, u32 maxHp, u8 pixelsWide);
u8 HpBar_GetColorIdx(u32 pixelsCur, u32 pixelsWide);
u8 CalculateHpBarColor(u16 hp, u16 maxHp, u32 pixelsWide);
void sub_020880CC(u8 a0, HeapID heapId);
int sub_020881C0(s16 *a0, u16 a1);
void sub_0208820C(BgConfig *bgConfig, HeapID heapId, NARC *narc, NarcId unused, int fileId, GFBgLayer layer, int kind, u32 szByte, u32 offest);

#endif
