#include "unk_02025534.h"

void sub_0202568C(struct UnkStruct_02025534 *a0);
void sub_02025768(struct UnkStruct_02025534_sub *sub);
struct UnkStruct_02025534_sub *sub_020256C8(struct UnkStruct_02025534 *a0, int a1);

struct UnkStruct_02025534 *sub_02025534(int num, HeapID heapId) {
    struct UnkStruct_02025534 *ret = AllocFromHeap(heapId, sizeof(struct UnkStruct_02025534));
    int i;

    GF_ASSERT(ret != NULL);
    ret->vals = AllocFromHeap(heapId, num * sizeof(struct UnkStruct_02025534_sub));
    GF_ASSERT(ret->vals != NULL);
    for (i = 0; i < num; i++) {
        sub_02025768(&ret->vals[i]);
    }
    ret->max = num;
    ret->num = 0;
    return ret;
}

void sub_02025580(struct UnkStruct_02025534 *a0) {
    GF_ASSERT(a0 != NULL);
    sub_0202568C(a0);
    FreeToHeap(a0->vals);
    FreeToHeap(a0);
}

BOOL sub_020255A0(struct UnkStruct_02025534 *a0, int a1) {
    GF_ASSERT(a0 != NULL);
    return sub_020256C8(a0, a1) == NULL;
}
