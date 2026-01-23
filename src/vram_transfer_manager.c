#include "vram_transfer_manager.h"

#include "global.h"

#include "heap.h"

static GF_VramTransferManager *sVramTransferManager;
BOOL sub_02020684(NNS_GFD_DST_TYPE type, u32 dstAddr, void *pSrc, u32 szByte);

void GF_CreateVramTransferManager(u32 taskMax, enum HeapID heapID) {
    GF_ASSERT(sVramTransferManager == NULL);

    sVramTransferManager = Heap_Alloc(heapID, sizeof(GF_VramTransferManager));
    GF_ASSERT(sVramTransferManager != NULL);

    sVramTransferManager->tasks = Heap_Alloc(heapID, taskMax * sizeof(NNSGfdVramTransferTask));
    sVramTransferManager->nMax = taskMax;
    sVramTransferManager->nCur = 0;
    NNS_GfdInitVramTransferManager(sVramTransferManager->tasks, sVramTransferManager->nMax);
}

void GF_DestroyVramTransferManager(void) {
    GF_ASSERT(sVramTransferManager != NULL);
    Heap_Free(sVramTransferManager->tasks);
    Heap_Free(sVramTransferManager);
    sVramTransferManager = NULL;
}

BOOL GF_CreateNewVramTransferTask(NNS_GFD_DST_TYPE type, u32 dstAddr, void *pSrc, u32 szByte) {
    GF_ASSERT(sVramTransferManager != NULL);
    sVramTransferManager->nCur++;

    if (sVramTransferManager->nCur >= sVramTransferManager->nMax) {
        GF_ASSERT(FALSE);
        return 0;
    }

    return NNS_GfdRegisterNewVramTransferTask(type, dstAddr, pSrc, szByte);
}

void GF_RunVramTransferTasks(void) {
    if (sVramTransferManager == NULL) {
        return;
    }

    NNS_GfdDoVramTransfer();
    sVramTransferManager->nCur = 0;
}

u32 GF_GetNumPendingVramTransferTasks(void) {
    GF_ASSERT(sVramTransferManager != NULL);
    return sVramTransferManager->nCur;
}

NNSG2dCellTransferState *sub_02020654(int a0, enum HeapID heapID) {
    NNSG2dCellTransferState *ret = Heap_Alloc(heapID, a0 * sizeof(NNSG2dCellTransferState));
    NNS_G2dInitCellTransferStateManager(ret, a0, sub_02020684);
    return ret;
}

void thunk_UpdateCellTransferStateManager(void) {
    NNS_G2dUpdateCellTransferStateManager();
}

void sub_0202067C(NNSG2dCellTransferState *transferStates) {
    Heap_Free(transferStates);
}

BOOL sub_02020684(NNS_GFD_DST_TYPE type, u32 dstAddr, void *pSrc, u32 szByte) {
    return GF_CreateNewVramTransferTask(type, dstAddr, pSrc, szByte);
}
