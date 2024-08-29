#ifndef POKEHEARTGOLD_UNK_02013FDC_H
#define POKEHEARTGOLD_UNK_02013FDC_H

#include "filesystem.h"

typedef struct UnkStruct_02014E30 {
    int x;
    int y;
    int w;
    int h;
} UnkStruct_02014E30;

void sub_020141C4(NarcId narcId, s32 fileId, HeapID heapId, int x, int y, int width, int height, void *dest);
void *sub_02014298(NarcId narcId, s32 fileId, HeapID heapId, int x, int y, int width, int height);
void sub_020143E0(NarcId narcId, s32 fileId, HeapID heapId, UnkStruct_02014E30 *a3, void *dest);
void sub_02014400(NarcId narcId, s32 fileId, HeapID heapId, void *dest);
void *sub_0201442C(NarcId narcId, s32 fileId, HeapID heapId);
void *sub_02014450(NarcId narcId, s32 fileId, HeapID heapId);
void sub_02014494(NarcId narcId, s32 fileId, HeapID heapId, int x, int y, int width, int height, void *dest, u32 pid, BOOL isAnimated, int whichFacing, int species);
void sub_02014510(NarcId narcId, s32 fileId, HeapID heapId, UnkStruct_02014E30 *a3, void *dest, u32 personality, BOOL isAnimated, int whichFacing, int species);
void sub_02014540(NarcId narcId, s32 fileId, HeapID heapId, void *dest, u32 personality, BOOL isAnimated, int whichFacing, int species);
void *sub_0201457C(NarcId narcId, s32 fileId, HeapID heapId, u32 personality, BOOL isAnimated, int whichFacing, int species);
void sub_020145B4(const void *texSrc, int texDim, int x, int y, int w, int h, void *dest);

#endif // POKEHEARTGOLD_UNK_02013FDC_H
