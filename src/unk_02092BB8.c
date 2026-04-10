#include "unk_02092BB8.h"

#include "global.h"

struct UnkStruct_02092BB8 *UnkStruct_02092BB8_Alloc(enum HeapID heapID) {
    struct UnkStruct_02092BB8 *ret = Heap_Alloc(heapID, sizeof(struct UnkStruct_02092BB8));
    UnkStruct_02092BB8_Set(ret, 0, 2);
    return ret;
}

void UnkStruct_02092BB8_Free(struct UnkStruct_02092BB8 *a0) {
    Heap_Free(a0);
}

void UnkStruct_02092BB8_Set(struct UnkStruct_02092BB8 *a0, u16 a1, u16 a2) {
    a0->unk_0 = a1;
    a0->unk_2 = a2;
}

u16 UnkStruct_02092BB8_GetUnk2(struct UnkStruct_02092BB8 *a0) {
    return a0->unk_2;
}

u32 UnkStruct_02092BB8_GetUnk0(struct UnkStruct_02092BB8 *a0) {
    return a0->unk_0;
}
