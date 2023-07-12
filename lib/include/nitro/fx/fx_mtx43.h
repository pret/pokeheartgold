#ifndef NITRO_FX_FX_MTX43_H_
#define NITRO_FX_FX_MTX43_H_

#include <nitro/types.h>

void MTX_Identity43_(register MtxFx43 *pDst);
void MTX_TransApply43(const MtxFx43 *pSrc, MtxFx43 *pDst, fx32 x, fx32 y, fx32 z);
void MTX_Concat43(const MtxFx43 *a, const MtxFx43 *b, MtxFx43 *ab);
void MTX_RotX43_(register MtxFx43 *pDst, register fx32 sinVal, register fx32 cosVal);
void MTX_RotY43_(register MtxFx43 *pDst, register fx32 sinVal, register fx32 cosVal);
void MTX_Scale43_(register MtxFx43 *pDst, register fx32 x, register fx32 y, register fx32 z);

static inline void MTX_Identity43(MtxFx43 *pDst) {
    MTX_Identity43_(pDst);
}

static inline void MTX_RotX43(MtxFx43 *pDst, fx32 sinVal, fx32 cosVal) {
    MTX_RotX43_(pDst, sinVal, cosVal);
}

static inline void MTX_RotY43(MtxFx43 *pDst, fx32 sinVal, fx32 cosVal) {
    MTX_RotY43_(pDst, sinVal, cosVal);
}

static inline void MTX_Scale43(MtxFx43 *pDst, fx32 x, fx32 y, fx32 z) {
    MTX_Scale43_(pDst, x, y, z);
}

#endif //NITRO_FX_FX_MTX43_H_
