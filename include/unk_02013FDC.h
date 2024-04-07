#ifndef POKEHEARTGOLD_UNK_02013FDC_H
#define POKEHEARTGOLD_UNK_02013FDC_H

#include "filesystem.h"

typedef struct UnkStruct_02014E30 {
    u32 unk_0;
    u32 unk_4;
    u32 unk_8;
    u32 unk_C;
} UnkStruct_02014E30;

void *sub_0201442C(NarcId narcId, s32 fileId, HeapID heapId);
void *sub_02014450(NarcId narcId, s32 fileId, HeapID heapId);
// FIXME: Types are probably wrong.
void sub_020145B4(const void *a0, u32 a1, u32 a2, u32 a3, u32 a4, u32 a5, void *a6);
void sub_02014510(NarcId narcId, s32 fileId, HeapID heapId, UnkStruct_02014E30 *a3, void *dest, u32 personality, int a6, int a7, u16 species);
void sub_020143E0(int a0, int a1, HeapID heapID, UnkStruct_02014E30 *a3, void *a4);

#endif //POKEHEARTGOLD_UNK_02013FDC_H
