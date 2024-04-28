#ifndef POKEHEARTGOLD_UNK_02013FDC_H
#define POKEHEARTGOLD_UNK_02013FDC_H

#include "filesystem.h"

typedef struct UnkStruct_02014E30 {
    int x;
    int y;
    int w;
    int h;
} UnkStruct_02014E30;

void sub_020141C4(NarcId a0, s32 a1, HeapID a2, int sp8, int sp48, int sp4C, int sp50, void *sp54);
void *sub_02014298(NarcId a0, s32 a1, HeapID a2, int a3, int a4, int a5, int a6);
void *sub_0201442C(NarcId narcId, s32 fileId, HeapID heapId);
void *sub_02014450(NarcId narcId, s32 fileId, HeapID heapId);
// FIXME: Types are probably wrong.
void sub_020145B4(const void *texSrc, u32 texDim, u32 x, u32 y, u32 w, u32 h, void *dest);
void sub_02014510(NarcId narcId, s32 fileId, HeapID heapId, UnkStruct_02014E30 *a3, void *dest, u32 personality, int a6, int a7, u16 species);
void sub_020143E0(int a0, int a1, HeapID heapID, UnkStruct_02014E30 *a3, void *a4);

#endif //POKEHEARTGOLD_UNK_02013FDC_H
