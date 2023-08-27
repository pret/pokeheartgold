#include "assert.h"
#include "global.h"
#include "heap.h"
#include "unk_02009D48.h"
#include "unk_020215A0.h"
#include "unk_02022588.h"
#include "unk_0200B150.h"
#include "unk_0200CF18.h"
#include "unk_02020654.h"

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

UnkStruct_0200CF38* sub_0200CF38(UnkStruct_0200CF18* a0) {
    GF_ASSERT(a0 != NULL);
    UnkStruct_0200CF38* ret = AllocFromHeap(a0->heapId, sizeof(UnkStruct_0200CF38));
    if (ret == NULL) {
        return NULL;
    }
    ++a0->unk_004;
    for (int i = 0; i < 6; ++i) {
        ret->unk_0C[i] = NULL;
    }
    return ret;
}

GF_G2dRenderer* sub_0200CF6C(UnkStruct_0200CF18* a0) {
    return &a0->renderer;
}

BOOL sub_0200CF70(UnkStruct_0200CF18* a0, Unk122_021E92FC* a1, Unk122_021E92D0* a2, int a3) {
    GF_ASSERT(a0 != NULL);
    if (a0 == NULL) {
        return FALSE;
    }
    struct UnkStruct_020215A0 sp14;
    sp14.unk_00 = a2->unk0;
    sp14.unk_04 = a2->unk4;
    sp14.unk_08 = a2->unk8;
    sp14.heapId = a0->heapId;
    sub_020215C0(&sp14, a2->unkC, a2->unk10);
    sub_02022588(a3, a0->heapId);
    NNS_G2dInitOamManagerModule();
    if (a0->unk_008 == 1) {
        OamManager_Create(a1->unk0, a1->unk4, a1->unk8, a1->unkC, a1->unk10, a1->unk14, a1->unk18, a1->unk1C, a0->heapId);
    }
    a0->cellTransferState = sub_02020654(0x20, a0->heapId);
    sub_020216C8();
    sub_02022638();
    return TRUE;
}
