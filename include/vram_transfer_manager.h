#ifndef POKEHEARTGOLD_VRAM_TRANSFER_MANAGER_H
#define POKEHEARTGOLD_VRAM_TRANSFER_MANAGER_H

#include "heap.h"

typedef struct {
    u32 nMax;
    u32 nCur;
    NNSGfdVramTransferTask *tasks;
} GF_VramTransferManager;

void GF_CreateVramTransferManager(u32, HeapID);
void GF_DestroyVramTransferManager(void);
BOOL GF_CreateNewVramTransferTask(NNS_GFD_DST_TYPE type, u32 dstAddr, void *pSrc, u32 szByte);
void GF_RunVramTransferTasks(void);
u32 GF_GetNumPendingVramTransferTasks(void);

#endif // POKEHEARTGOLD_VRAM_TRANSFER_MANAGER_H
