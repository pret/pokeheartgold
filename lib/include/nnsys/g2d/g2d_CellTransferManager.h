#ifndef NNS_G2D_G2D_CELL_TRANSFER_MANAGER_H
#define NNS_G2D_G2D_CELL_TRANSFER_MANAGER_H

#include <nnsys/g2d/g2d_Image.h>

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

#endif // NNS_G2D_G2D_CELL_TRANSFER_MANAGER_H
