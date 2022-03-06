#include "unk_02026EB4.h"

void sub_02026FE8(u32 szByte, u32 szByteFor4x4, void *pManagementWork, u32 szByteManagementWork, BOOL useAsDefault);
void sub_02026FF8(u32 szByte, void *pManagementWork, u32 szByteManagementWork, BOOL useAsDefault);
void sub_02027000(u16 numSlot, BOOL useAsDefault);
void sub_02027008(int numSlot, BOOL useAsDefault);
void sub_02026F6C(void);

struct Unk3Dstruct_02026EB4 *sub_02026EB4(HeapID heapId, int r7, int r5, int sp4, int sp20, void (*sp24)(void)) {
    struct Unk3Dstruct_02026EB4 *ret;
    u32 texWorkSz, pltWorkSz;

    ret = AllocFromHeap(heapId, sizeof(struct Unk3Dstruct_02026EB4));
    ret->heapId = heapId;

    NNS_G3dInit();
    G3X_InitMtxStack();
    G3_SwapBuffers(GX_SORTMODE_AUTO, GX_BUFFERMODE_W);
    if (!r7) {
        texWorkSz = NNS_GfdGetLnkTexVramManagerWorkSize(r5 << 7);
        ret->texWork = AllocFromHeap(ret->heapId, texWorkSz);
        sub_02026FE8(r5 << 17, 0, ret->texWork, texWorkSz, TRUE);
    } else {
        sub_02027000(r5, TRUE);
    }
    if (!sp4) {
        pltWorkSz = NNS_GfdGetLnkPlttVramManagerWorkSize(sp20 << 8);
        ret->plttWork = AllocFromHeap(ret->heapId, pltWorkSz);
        sub_02026FF8(sp20 << 13, ret->plttWork, pltWorkSz, TRUE);
    } else {
        sub_02027008(sp20, TRUE);
    }
    if (sp24 != NULL) {
        sp24();
    } else {
        sub_02026F6C();
    }
    return ret;
}
