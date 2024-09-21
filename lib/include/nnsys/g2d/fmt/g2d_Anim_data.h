#ifndef NNSYS_G2D_FMT_G2D_ANIM_DATA_H_
#define NNSYS_G2D_FMT_G2D_ANIM_DATA_H_

#include <nitro.h>
#include <nnsys/g2d/fmt/g2d_Common_data.h>

#define NNS_G2D_BINFILE_SIG_CELLANIM      (u32)'NANR'
#define NNS_G2D_BINFILE_SIG_MULTICELLANIM (u32)'NMAR'
#define NNS_G2D_BLKSIG_ANIMBANK           (u32)'ABNK'
#define NNS_G2D_USEREXBLK_ANMATTR         (u32)'UAAT'

typedef enum NNSG2dAnimationPlayMode {
    NNS_G2D_ANIMATIONPLAYMODE_INVALID = 0x0,
    NNS_G2D_ANIMATIONPLAYMODE_FORWARD,
    NNS_G2D_ANIMATIONPLAYMODE_FORWARD_LOOP,
    NNS_G2D_ANIMATIONPLAYMODE_REVERSE,
    NNS_G2D_ANIMATIONPLAYMODE_REVERSE_LOOP,
    NNS_G2D_ANIMATIONPLAYMODE_MAX
} NNSG2dAnimationPlayMode;

typedef struct NNSG2dAnimFrameData {
    void *pContent;
    u16 frames;
    u16 pad16;

} NNSG2dAnimFrameData;

typedef struct NNSG2dAnimSequenceData {
    u16 numFrames;
    u16 loopStartFrameIdx;
    u32 animType;
    NNSG2dAnimationPlayMode playMode;
    NNSG2dAnimFrameData *pAnmFrameArray;

} NNSG2dAnimSequenceData;

typedef struct NNSG2dAnimBankData {
    u16 numSequences;
    u16 numTotalFrames;
    NNSG2dAnimSequenceData *pSequenceArrayHead;
    NNSG2dAnimFrameData *pFrameArrayHead;
    void *pAnimContents;
    void *pStringBank;
    void *pExtendedData;
} NNSG2dAnimBankData;

typedef struct NNSG2dUserExAnimFrameAttr {
    u32 *pAttr;
} NNSG2dUserExAnimFrameAttr;

typedef struct NNSG2dUserExAnimSequenceAttr {
    u16 numFrames;
    u16 pad16;
    u32 *pAttr;
    NNSG2dUserExAnimFrameAttr *pAnmFrmAttrArray;

} NNSG2dUserExAnimSequenceAttr;

typedef struct NNSG2dUserExAnimAttrBank {
    u16 numSequences;
    u16 numAttribute;
    NNSG2dUserExAnimSequenceAttr *pAnmSeqAttrArray;

} NNSG2dUserExAnimAttrBank;

static inline const NNSG2dUserExAnimAttrBank *NNS_G2dGetUserExAnimAttrBank(const NNSG2dAnimBankData *pAnimBank) {
    const NNSG2dUserExDataBlock *pBlk = NNSi_G2dGetUserExDataBlkByID(pAnimBank->pExtendedData, NNS_G2D_USEREXBLK_ANMATTR);

    if (pBlk != NULL) {
        return (const NNSG2dUserExAnimAttrBank *)(pBlk + 1);
    } else {
        return NULL;
    }
}

static inline const NNSG2dUserExAnimSequenceAttr *NNS_G2dGetUserExAnimSequenceAttr(const NNSG2dUserExAnimAttrBank *pAnimAttrBank, u16 idx) {
    if (idx < pAnimAttrBank->numSequences) {
        return &pAnimAttrBank->pAnmSeqAttrArray[idx];
    } else {
        return NULL;
    }
}

static inline u32 NNS_G2dGetUserExAnimSeqAttrValue(const NNSG2dUserExAnimSequenceAttr *pAnimSeqAttr) {
    return pAnimSeqAttr->pAttr[0];
}

static inline const NNSG2dUserExAnimFrameAttr *NNS_G2dGetUserExAnimFrameAttr(
    const NNSG2dUserExAnimSequenceAttr *pAnimSeqAttr,
    u16 idx) {
    if (pAnimSeqAttr->numFrames) {
        return &pAnimSeqAttr->pAnmFrmAttrArray[idx];
    } else {
        return NULL;
    }
}

static inline u32 NNS_G2dGetUserExAnimFrmAttrValue(const NNSG2dUserExAnimFrameAttr *pFrmAttr) {
    return pFrmAttr->pAttr[0];
}

#endif // NNSYS_G2D_FMT_G2D_ANIM_DATA_H_
