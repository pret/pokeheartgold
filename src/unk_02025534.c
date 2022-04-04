#include "unk_02025534.h"

void sub_0202568C(struct _2DGfxRawResMan *a0);
void sub_02025768(struct _2DGfxRawResObj *sub);
struct _2DGfxRawResObj *sub_020256C8(struct _2DGfxRawResMan *a0, int a1);

struct _2DGfxRawResMan *Create2DGfxResMan(int num, HeapID heapId) {
    struct _2DGfxRawResMan *ret = AllocFromHeap(heapId, sizeof(struct _2DGfxRawResMan));
    int i;

    GF_ASSERT(ret != NULL);
    ret->vals = AllocFromHeap(heapId, num * sizeof(struct _2DGfxRawResObj));
    GF_ASSERT(ret->vals != NULL);
    for (i = 0; i < num; i++) {
        sub_02025768(&ret->vals[i]);
    }
    ret->max = num;
    ret->num = 0;
    return ret;
}

void Destroy2DGfxResMan(struct _2DGfxRawResMan *a0) {
    GF_ASSERT(a0 != NULL);
    sub_0202568C(a0);
    FreeToHeap(a0->vals);
    FreeToHeap(a0);
}

BOOL sub_020255A0(struct _2DGfxRawResMan *a0, int a1) {
    GF_ASSERT(a0 != NULL);
    return sub_020256C8(a0, a1) == NULL;
}
