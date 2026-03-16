#ifndef POKEHEARTGOLD_UNK_02092BB8_H
#define POKEHEARTGOLD_UNK_02092BB8_H

#include "heap.h"

struct UnkStruct_02092BB8 {
    u16 unk_0;
    u16 unk_2;
};

struct UnkStruct_02092BB8 *sub_02092BB8(enum HeapID heapID);
void sub_02092BD0(struct UnkStruct_02092BB8 *a0);
void sub_02092BD8(struct UnkStruct_02092BB8 *a0, u16 a1, u16 a2);
u16 sub_02092BE0(struct UnkStruct_02092BB8 *a0);
u32 sub_02092BE4(struct UnkStruct_02092BB8 *a0);

#endif // POKEHEARTGOLD_UNK_02092BB8_H
