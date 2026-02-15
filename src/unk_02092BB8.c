#include "unk_02092BB8.h"

#include "global.h"

#include "heap.h"

struct UnkStruct_02092BB8 *sub_02092BB8(enum HeapID heapID) {
    struct UnkStruct_02092BB8 *ret = Heap_Alloc(heapID, sizeof(struct UnkStruct_02092BB8));
    sub_02092BD8(ret, 0, 2);
    return ret;
}

void sub_02092BD0(struct UnkStruct_02092BB8 *a0) {
    Heap_Free(a0);
}

void sub_02092BD8(struct UnkStruct_02092BB8 *a0, u16 a1, u16 a2) {
    a0->unk_0 = a1;
    a0->unk_2 = a2;
}

u16 sub_02092BE0(struct UnkStruct_02092BB8 *a0) {
    return a0->unk_2;
}

u32 sub_02092BE4(struct UnkStruct_02092BB8 *a0) {
    return a0->unk_0;
}
