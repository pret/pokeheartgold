#ifndef POKEHEARTGOLD_UNK_02013FDC_H
#define POKEHEARTGOLD_UNK_02013FDC_H

#include "filesystem.h"

typedef struct UnkStruct_02014494 {
    u32 filler_00[4];
} UnkStruct_02014494;

void *sub_0201442C(NarcId narcId, s32 fileId, HeapID heapId);
void *sub_02014450(NarcId narcId, s32 fileId, HeapID heapId);
// FIXME: Types are probably wrong.
void sub_020145B4(const void *a0, u32 a1, u32 a2, u32 a3, u32 a4, u32 a5, void *a6);
void sub_02014510(NarcId narcId, s32 fileId, HeapID heapId, UnkStruct_02014494 *a3, void *dest, u32 personality, int a6, int a7, u16 species);

#endif //POKEHEARTGOLD_UNK_02013FDC_H
