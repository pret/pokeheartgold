#ifndef NITRO_FX_FX_MTX33_H_
#define NITRO_FX_FX_MTX33_H_

static inline void MTX_Copy33(const MtxFx33 *pSrc, MtxFx33 *pDst) {
    MI_Copy36B(pSrc, pDst);
}

void MTX_Identity33_(register MtxFx33 *pDst);
void MTX_RotX33_(register MtxFx33 *pDst, register fx32 sinVal, register fx32 cosVal);
void MTX_RotY33_(register MtxFx33 *pDst, register fx32 sinVal, register fx32 cosVal);
void MTX_Concat33(const MtxFx33 *a, const MtxFx33 *b, MtxFx33 *ab);
void MTX_MultVec33(const VecFx32 *vec, const MtxFx33 *m, VecFx32 *dst);

static inline void MTX_Identity33(MtxFx33 *pDst) {
    MTX_Identity33_(pDst);
}

static inline void MTX_RotY33(MtxFx33 *pDst, fx32 sinVal, fx32 cosVal) {
    MTX_RotY33_(pDst, sinVal, cosVal);
}

static inline void MTX_RotX33(MtxFx33 *pDst, fx32 sinVal, fx32 cosVal) {
    MTX_RotX33_(pDst, sinVal, cosVal);
}

#endif //NITRO_FX_FX_MTX33_H_
