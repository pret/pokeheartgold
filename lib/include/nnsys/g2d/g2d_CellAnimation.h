#ifndef NNSYS_G2D_G2D_CELLANIMATION_H_
#define NNSYS_G2D_G2D_CELLANIMATION_H_

#include <nnsys/g2d/g2d_Animation.h>

typedef NNSG2dAnimBankData NNSG2dCellAnimBankData;

typedef struct NNSG2dCellAnimation{
    NNSG2dAnimController animCtrl;
    const NNSG2dCellData* pCurrentCell;
    const NNSG2dCellDataBank* pCellDataBank;
    u32 cellTransferStateHandle;
    NNSG2dSRTControl srtCtrl;
} NNSG2dCellAnimation;

#endif //NNSYS_G2D_G2D_CELLANIMATION_H_
