#ifndef NITRO_FX_FX_MTX33_H_
#define NITRO_FX_FX_MTX33_H_

static inline void MTX_Copy33(const MtxFx33 *pSrc, MtxFx33 *pDst) {
    MI_Copy36B(pSrc, pDst);
}

#endif //NITRO_FX_FX_MTX33_H_
