#include "global.h"
#include "unk_0202055C.h"

static Unk0202055C *sUnknown;

void sub_0202055C(u32 a0, u32 a1) {
    void *ptr;

    GF_ASSERT(sUnknown == NULL);
    ptr = AllocFromHeap(a1, sizeof(Unk0202055C));
    sUnknown = ptr;
    GF_ASSERT(ptr != NULL);

    ptr = AllocFromHeap(a1, a0 << 4);
    sUnknown->unk8 = ptr;

    sUnknown->unk0 = a0;
    sUnknown->unk4 = 0;
    NNS_GfdInitVramTransferManager(sUnknown->unk8, sUnknown->unk0);
}

void sub_020205AC(void) {
    GF_ASSERT(sUnknown != NULL);
    FreeToHeap(sUnknown->unk8);
    FreeToHeap(sUnknown);
    sUnknown = 0;
}

u32 sub_020205D8(u32 a0, u32 a1, u32 a2, u32 a3) {
    GF_ASSERT(sUnknown != NULL);
    sUnknown->unk4++;

    if (sUnknown->unk4 >= sUnknown->unk0) {
        GF_AssertFail();
        return 0;
    }

    return NNS_GfdRegisterNewVramTransferTask(a0, a1, a2, a3);
}

void sub_0202061C(void) {
    if (sUnknown == NULL) return;

    NNS_GfdDoVramTransfer();
    sUnknown->unk4 = 0;
}

u32 sub_02020638(void) {
    GF_ASSERT(sUnknown != NULL);
    return sUnknown->unk4;
}
