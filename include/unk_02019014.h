#ifndef POKEHEARTGOLD_UNK_02019014_H
#define POKEHEARTGOLD_UNK_02019014_H

#include "unk_02022D74.h"

typedef struct UnkStruct_02019014 UnkStruct_02019014;

struct UnkStruct_02019040 {
    u16 unk_0;
    u16 unk_2;
    VecFx32 unk_4;
    u32 unk_10;
};

UnkStruct_02019014 *sub_02019014(HeapID heapId, UnkStruct_02022D74 *a1);
BOOL sub_020190E8(UnkStruct_02019014 *a0);
void sub_02019040(UnkStruct_02019014 *a0, struct UnkStruct_02019040 *a1, int a2);
void sub_02019030(UnkStruct_02019014 *unk);

#endif //POKEHEARTGOLD_UNK_02019014_H
