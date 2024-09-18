#ifndef NNSYS_G2D_G2D_ANIMATION_H
#define NNSYS_G2D_G2D_ANIMATION_H

#include <nnsys/g2d/fmt/g2d_Anim_data.h>

typedef NNSG2dAnimFrameData NNSG2dAnimFrame;
typedef NNSG2dAnimSequenceData NNSG2dAnimSequence;
typedef void (*NNSG2dAnmCallBackPtr)(u32 data, fx32 currentFrame);

typedef enum NNSG2dAnmCallbackType {
    NNS_G2D_ANMCALLBACKTYPE_NONE = 0,
    NNS_G2D_ANMCALLBACKTYPE_LAST_FRM,
    NNS_G2D_ANMCALLBACKTYPE_SPEC_FRM,
    NNS_G2D_ANMCALLBACKTYPE_EVER_FRM,
    AnmCallbackType_MAX
} NNSG2dAnmCallbackType;

typedef struct NNSG2dCallBackFunctor {
    NNSG2dAnmCallbackType type;
    u32 param;
    NNSG2dAnmCallBackPtr pFunc;
    u16 frameIdx;
    u16 pad16_;
} NNSG2dCallBackFunctor, NNSG2dAnimCallBackFunctor;

typedef struct NNSG2dAnimController {
    const NNSG2dAnimFrame *pCurrent;
    const NNSG2dAnimFrame *pActiveCurrent;
    BOOL bReverse;
    BOOL bActive;
    fx32 currentTime;
    fx32 speed;
    NNSG2dAnimationPlayMode overriddenPlayMode;
    const NNSG2dAnimSequence *pAnimSequence;
    NNSG2dAnimCallBackFunctor callbackFunctor;
} NNSG2dAnimController;

void NNS_G2dResetAnimCtrlState(NNSG2dAnimController *pAnimCtrl);
u16 NNS_G2dGetAnimCtrlCurrentFrame(const NNSG2dAnimController *pAnimCtrl);

#endif // NNSYS_G2D_G2D_ANIMATION_H
