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
BOOL sub_020255A0(struct UnkStruct_02025534 *resourceMgr, int a1);
void sub_02025658(struct UnkStruct_02025534 *resourceMgr, struct UnkStruct_02025534_sub *a1);
void sub_0202570C(struct UnkStruct_02025534_sub *resource, void *newPtr);
int sub_02025728(struct UnkStruct_02025534_sub *resource);

#endif //POKEHEARTGOLD_UNK_02025534_H
