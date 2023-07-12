#include "global.h"
#include "heap.h"
#include "vram_transfer_manager.h"

static GF_VramTransferManager *sVramTransferManager;

void GF_CreateVramTransferManager(u32 taskMax, HeapID heapId) {
    GF_ASSERT(sVramTransferManager == NULL);

    sVramTransferManager = AllocFromHeap(heapId, sizeof(GF_VramTransferManager));
    GF_ASSERT(sVramTransferManager != NULL);

    sVramTransferManager->tasks = AllocFromHeap(heapId, taskMax * sizeof(NNSGfdVramTransferTask));
    sVramTransferManager->nMax = taskMax;
    sVramTransferManager->nCur = 0;
    NNS_GfdInitVramTransferManager(sVramTransferManager->tasks, sVramTransferManager->nMax);
}

void GF_DestroyVramTransferManager(void) {
    GF_ASSERT(sVramTransferManager != NULL);
    FreeToHeap(sVramTransferManager->tasks);
    FreeToHeap(sVramTransferManager);
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
    if (sVramTransferManager == NULL) return;

    NNS_GfdDoVramTransfer();
    sVramTransferManager->nCur = 0;
}

u32 GF_GetNumPendingVramTransferTasks(void) {
    GF_ASSERT(sVramTransferManager != NULL);
    return sVramTransferManager->nCur;
}
