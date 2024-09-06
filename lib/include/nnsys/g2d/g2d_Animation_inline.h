#ifndef NNSYS_G2D_G2D_ANIMATION_INLINE_H
#define NNSYS_G2D_G2D_ANIMATION_INLINE_H

#include <nnsys/g2d/g2d_Animation.h>

static inline void NNS_G2dStartAnimCtrl(
    NNSG2dAnimController *pAnimCtrl) {
    pAnimCtrl->bActive = TRUE;
}

static inline BOOL NNS_G2dIsAnimCtrlActive(const NNSG2dAnimController *pAnimCtrl) {
    return pAnimCtrl->bActive;
}

#endif // NNSYS_G2D_G2D_ANIMATION_INLINE_H
