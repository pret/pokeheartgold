#ifndef POKEHEARTGOLD_UNK_02025534_H
#define POKEHEARTGOLD_UNK_02025534_H

#include "heap.h"

struct UnkStruct_02025534_sub {
    int unk0;
    void *unk4;
};

struct UnkStruct_02025534 {
    struct UnkStruct_02025534_sub *vals;
    int max;
    int num;
};

struct UnkStruct_02025534 *sub_02025534(int num, HeapID heapId);
void sub_02025580(struct UnkStruct_02025534 *a0);

#endif //POKEHEARTGOLD_UNK_02025534_H
