#ifndef NNSYS_G2D_FMT_G2D_COMMON_DATA_H
#define NNSYS_G2D_FMT_G2D_COMMON_DATA_H

#include <nitro.h>

typedef struct NNSG2dUserExDataBlock {
    u32 blkTypeID;
    u32 blkSize;
} NNSG2dUserExDataBlock;

static inline const NNSG2dUserExDataBlock *NNSi_G2dGetUserExDataBlkByID(const void *pExtendData, u32 blkTypeID) {
    if (pExtendData != NULL) {
        const NNSG2dUserExDataBlock *pBlk = (const NNSG2dUserExDataBlock *)pExtendData;

        if (pBlk->blkTypeID == blkTypeID) {
            return pBlk;
        }
        pBlk = (const NNSG2dUserExDataBlock *)((const u8 *)pBlk + pBlk->blkSize);
    }
    return NULL;
}

#endif // NNSYS_G2D_FMT_G2D_COMMON_DATA_H
