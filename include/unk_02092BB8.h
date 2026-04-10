#ifndef POKEHEARTGOLD_UNK_02092BB8_H
#define POKEHEARTGOLD_UNK_02092BB8_H

#include "heap.h"

struct UnkStruct_02092BB8 {
    u16 unk_0;
    u16 unk_2;
};

struct UnkStruct_02092BB8 *UnkStruct_02092BB8_Alloc(enum HeapID heapID);
void UnkStruct_02092BB8_Free(struct UnkStruct_02092BB8 *a0);
void UnkStruct_02092BB8_Set(struct UnkStruct_02092BB8 *a0, u16 a1, u16 a2);
u16 UnkStruct_02092BB8_GetUnk2(struct UnkStruct_02092BB8 *a0);
u32 UnkStruct_02092BB8_GetUnk0(struct UnkStruct_02092BB8 *a0);

#endif // POKEHEARTGOLD_UNK_02092BB8_H
