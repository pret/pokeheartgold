#ifndef NNSYS_G2D_G2D_MULTICELLANIMATION_H_
#define NNSYS_G2D_G2D_MULTICELLANIMATION_H_

#include <nnsys/g2d/fmt/g2d_Anim_data.h>
#include <nnsys/g2d/fmt/g2d_MultiCell_data.h>
#include <nnsys/g2d/fmt/g2d_SRTControl_data.h>
#include <nnsys/g2d/g2d_Animation.h>
#include <nnsys/g2d/g2d_CellAnimation.h>
#include <nnsys/g2d/g2d_Node.h>

typedef enum {
    NNS_G2D_MCTYPE_DONOT_SHARE_CELLANIM,
    NNS_G2D_MCTYPE_SHARE_CELLANIM
} NNSG2dMCType;

typedef NNSG2dAnimSequence NNSG2dMultiCellAnimSequence;
typedef NNSG2dAnimBankData NNSG2dMultiCellAnimBankData;

typedef struct NNSG2dMultiCellInstance {
    const NNSG2dMultiCellData *pCurrentMultiCell;
    const NNSG2dCellAnimBankData *pAnimDataBank;
    NNSG2dMCType mcType;
    void *pCellAnimInstasnces;
} NNSG2dMultiCellInstance;

typedef struct NNSG2dMultiCellAnimation {
    NNSG2dAnimController animCtrl;
    u16 totalVideoFrame;
    u16 pad16;
    NNSG2dMultiCellInstance multiCellInstance;
    const NNSG2dMultiCellDataBank *pMultiCellDataBank;
    NNSG2dSRTControl srtCtrl;
} NNSG2dMultiCellAnimation;

void NNS_G2dSetAnimSequenceToMCAnimation(NNSG2dMultiCellAnimation *pMultiCellAnim, const NNSG2dMultiCellAnimSequence *pAnimSeq);
void NNS_G2dTickMCAnimation(NNSG2dMultiCellAnimation *pMultiCellAnim, fx32 frames);
void NNS_G2dSetMCAnimationCurrentFrame(NNSG2dMultiCellAnimation *pMultiCellAnim, u16 frameIndex);
u16 NNS_G2dGetMCBankNumNodesRequired(const NNSG2dMultiCellDataBank *pMultiCellDataBank);
void NNS_G2dInitMCAnimation(NNSG2dMultiCellAnimation *pMultiCellAnim, NNSG2dNode *pNodeArray, NNSG2dCellAnimation *pCellAnim, u16 numNode, const NNSG2dCellAnimBankData *pAnimBank, const NNSG2dCellDataBank *pCellDataBank, const NNSG2dMultiCellDataBank *pMultiCellDataBank);

#endif // NNSYS_G2D_G2D_MULTICELLANIMATION_H_
