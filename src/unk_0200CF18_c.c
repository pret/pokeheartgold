#include "global.h"
#include "unk_0200CF18.h"

UnkStruct_0200CF18* sub_0200CF18(HeapID heapId) {
    UnkStruct_0200CF18* ret = AllocFromHeap(heapId, sizeof(UnkStruct_0200CF18));
    if (ret == NULL) {
        return NULL;
    }
    ret->heapId = heapId;
    ret->unk_004 = 0;
    ret->unk_008 = 1;
    return ret;
}
