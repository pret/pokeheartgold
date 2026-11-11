// Force global.h first
// clang-format off
#include "global.h"
// clang-format on

#include "unk_02097024.h"

#include "heap.h"
#include "unk_02096C88.h"

struct UnkStruct_02097024 {
    u8 filler_00[0x14];
    UnkStruct_0209707C_Sub8 unk_14;
    UnkStruct_02096C88 *unk_30;
    u8 filler_34[0x8];
};

UnkStruct_02097024 *sub_02097024(const UnkStruct_0209707C_Sub8 *tmplate, enum HeapID heapID);

UnkStruct_02097024 *sub_02097024(const UnkStruct_0209707C_Sub8 *tmplate, enum HeapID heapID) {
    UnkStruct_02097024 *ret = Heap_Alloc(heapID, sizeof(UnkStruct_02097024));
    memset(ret, 0, sizeof(UnkStruct_02097024));
    ret->unk_14 = *tmplate;
    ret->unk_30 = sub_02096C88(ret, heapID);
    return ret;
}
