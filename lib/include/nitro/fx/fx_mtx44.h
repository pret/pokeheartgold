#ifndef NITRO_FX_FX_MTX44_H_
#define NITRO_FX_FX_MTX44_H_

#include <nitro/mi/memory.h>
#include <nitro/fx/fx.h>
#include <nitro/fx/fx_const.h>

static inline void MTX_Identity44(MtxFx44 * pDst);
static inline void MTX_Copy44To33(const MtxFx44 * pSrc, MtxFx33 * pDst);
static inline void MTX_Copy44To43(const MtxFx44 * pSrc, MtxFx43 * pDst);
static inline void MTX_Transpose44(const MtxFx44 * pSrc, MtxFx44 * pDst);
void MTX_TransApply44(const MtxFx44 * pSrc, MtxFx44 * pDst, fx32 x, fx32 y, fx32 z);
static inline void MTX_Scale44(MtxFx44 * pDst, fx32 x, fx32 y, fx32 z);
void MTX_ScaleApply44(const MtxFx44 * pSrc, MtxFx44 * pDst, fx32 x, fx32 y, fx32 z);
static inline void MTX_RotX44(MtxFx44 * pDst, fx32 sinVal, fx32 cosVal);
static inline void MTX_RotY44(MtxFx44 * pDst, fx32 sinVal, fx32 cosVal);
static inline void MTX_RotZ44(MtxFx44 * pDst, fx32 sinVal, fx32 cosVal);
void MTX_RotAxis44(MtxFx44 * pDst, const VecFx32 * vec, fx32 sinVal, fx32 cosVal);
void MTX_Concat44(const MtxFx44 * a, const MtxFx44 * b, MtxFx44 * ab);
void MTX_FrustumW(fx32 t, fx32 b, fx32 l, fx32 r, fx32 n, fx32 f, fx32 scaleW, MtxFx44 * mtx);
void MTX_PerspectiveW(fx32 fovySin, fx32 fovyCos, fx32 aspect, fx32 n, fx32 f, fx32 scaleW, MtxFx44 * mtx);
void MTX_OrthoW(fx32 t, fx32 b, fx32 l, fx32 r, fx32 n, fx32 f, fx32 scaleW, MtxFx44 * mtx);

void MTX_Identity44_(register MtxFx44 * pDst);
void MTX_Copy44To33_(register const MtxFx44 * pSrc, register MtxFx33 * pDst);
void MTX_Copy44To43_(register const MtxFx44 * pSrc, register MtxFx43 * pDst);
void MTX_Transpose44_(register const MtxFx44 * pSrc, register MtxFx44 * pDst);
void MTX_Scale44_(register MtxFx44 * pDst, register fx32 x, register fx32 y, register fx32 z);
void MTX_RotX44_(register MtxFx44 * pDst, register fx32 sinVal, register fx32 cosVal);
void MTX_RotY44_(register MtxFx44 * pDst, register fx32 sinVal, register fx32 cosVal);
void MTX_RotZ44_(register MtxFx44 * pDst, register fx32 sinVal, register fx32 cosVal);

static inline void MTX_Identity44 (MtxFx44 * pDst) {
    MTX_Identity44_(pDst);
}

static inline void MTX_Copy44 (const MtxFx44 * pSrc, MtxFx44 * pDst) {
    MI_Copy64B(pSrc, pDst);
}

static inline void MTX_Copy44To33 (const MtxFx44 * pSrc, MtxFx33 * pDst) {
    MTX_Copy44To33_(pSrc, pDst);
}

static inline void MTX_Copy44To43 (const MtxFx44 * pSrc, MtxFx43 * pDst) {
    MTX_Copy44To43_(pSrc, pDst);
}

static inline void MTX_Transpose44 (const MtxFx44 * pSrc, MtxFx44 * pDst) {
    MTX_Transpose44_(pSrc, pDst);
}

static inline void MTX_Scale44 (MtxFx44 * pDst, fx32 x, fx32 y, fx32 z) {
    MTX_Scale44_(pDst, x, y, z);
}

static inline void MTX_RotX44 (MtxFx44 * pDst, fx32 sinVal, fx32 cosVal) {
    MTX_RotX44_(pDst, sinVal, cosVal);
}

static inline void MTX_RotY44 (MtxFx44 * pDst, fx32 sinVal, fx32 cosVal) {
    MTX_RotY44_(pDst, sinVal, cosVal);
}

static inline void MTX_RotZ44 (MtxFx44 * pDst, fx32 sinVal, fx32 cosVal) {
    MTX_RotZ44_(pDst, sinVal, cosVal);
}

static inline void MTX_Frustum (fx32 t, fx32 b, fx32 l, fx32 r, fx32 n, fx32 f, MtxFx44 * mtx) {
    MTX_FrustumW(t, b, l, r, n, f, FX32_ONE, mtx);
}

static inline
void MTX_Perspective (fx32 fovySin, fx32 fovyCos, fx32 aspect, fx32 n, fx32 f, MtxFx44 * mtx) {
    MTX_PerspectiveW(fovySin, fovyCos, aspect, n, f, FX32_ONE, mtx);
}

static inline void MTX_Ortho (fx32 t, fx32 b, fx32 l, fx32 r, fx32 n, fx32 f, MtxFx44 * mtx) {
    MTX_OrthoW(t, b, l, r, n, f, FX32_ONE, mtx);
}

#endif //NITRO_FX_FX_MTX44_H_
