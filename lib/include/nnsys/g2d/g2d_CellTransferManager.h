#ifndef NNS_G2D_G2D_CELL_TRANSFER_MANAGER_H
#define NNS_G2D_G2D_CELL_TRANSFER_MANAGER_H

#include <nnsys/g2d/g2d_Image.h>
#include <nnsys/gfd/VramTransferMan/gfd_VramTransferManager.h>

typedef BOOL (*VramTransferTaskRegisterFuncPtr)(NNS_GFD_DST_TYPE type, u32 dstAddr, void *pSrc, u32 szByte);

typedef struct NNSG2dCellTransferState {
    NNSG2dVRamLocation dstVramLocation;
    u32 szDst;
    const void *pSrcNCGR;
    const void *pSrcNCBR;
    u32 szSrcData;
    BOOL bActive;
    u32 bDrawn;
    u32 bTransferRequested;
    u32 srcOffset;
    u32 szByte;
} NNSG2dCellTransferState;

void NNS_G2dFreeCellTransferStateHandle(u32 handle);
u32 NNS_G2dGetNewCellTransferStateHandle();
NNS_G2dInitCellTransferStateManager(NNSG2dCellTransferState *pCellStateArray, u32 numCellState, VramTransferTaskRegisterFuncPtr pTaskRegisterFunc);
void NNS_G2dUpdateCellTransferStateManager(void);

#endif // NNS_G2D_G2D_CELL_TRANSFER_MANAGER_H
