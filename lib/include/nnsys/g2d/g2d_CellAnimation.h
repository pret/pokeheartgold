#ifndef NNSYS_G2D_G2D_CELLANIMATION_H_
#define NNSYS_G2D_G2D_CELLANIMATION_H_

#include <nnsys/g2d/fmt/g2d_Cell_data.h>
#include <nnsys/g2d/fmt/g2d_SRTControl_data.h>
#include <nnsys/g2d/g2d_Animation.h>

typedef NNSG2dAnimBankData NNSG2dCellAnimBankData;

typedef struct NNSG2dCellAnimation {
    NNSG2dAnimController animCtrl;
    const NNSG2dCellData *pCurrentCell;
    const NNSG2dCellDataBank *pCellDataBank;
    u32 cellTransferStateHandle;
    NNSG2dSRTControl srtCtrl;
} NNSG2dCellAnimation;

void NNS_G2dSetCellAnimationSequence(NNSG2dCellAnimation *pCellAnim, const NNSG2dAnimSequence *pAnimSeq);
void NNS_G2dTickCellAnimation(NNSG2dCellAnimation *pCellAnim, fx32 frames);
void NNS_G2dSetCellAnimationCurrentFrame(NNSG2dCellAnimation *pCellAnim, u16 frameIndex);
void NNS_G2dInitCellAnimation(NNSG2dCellAnimation *pCellAnim, const NNSG2dAnimSequence *pAnimSeq, const NNSG2dCellDataBank *pCellDataBank);
void NNS_G2dInitCellAnimationVramTransfered(NNSG2dCellAnimation *pCellAnim, const NNSG2dAnimSequence *pAnimSeq, const NNSG2dCellDataBank *pCellBank, u32 vramSettingHandle, u32 dstAddr3D, u32 dstAddr2DMain, u32 dstAddr2DSub, const void *pSrcNCGR, const void *pSrcNCBR, u32 szSrcData);

#endif // NNSYS_G2D_G2D_CELLANIMATION_H_
