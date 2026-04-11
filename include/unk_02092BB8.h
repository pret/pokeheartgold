#ifndef POKEHEARTGOLD_UNK_02092BB8_H
#define POKEHEARTGOLD_UNK_02092BB8_H

#include "heap.h"

typedef struct UnkStruct_02092BB8 {
    u16 species;
    u16 unk_2;
} UnkStruct_02092BB8;

UnkStruct_02092BB8 *UnkStruct_02092BB8_New(enum HeapID heapID);
void UnkStruct_02092BB8_Free(UnkStruct_02092BB8 *a0);
void UnkStruct_02092BB8_Set(UnkStruct_02092BB8 *a0, u16 a1, u16 a2);
u16 UnkStruct_02092BB8_GetUnk2(UnkStruct_02092BB8 *a0);
u32 UnkStruct_02092BB8_GetSpecies(UnkStruct_02092BB8 *a0);

#endif // POKEHEARTGOLD_UNK_02092BB8_H
