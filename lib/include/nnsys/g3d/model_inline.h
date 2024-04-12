#ifndef NNSYS_G3D_MODEL_INLINE_H_
#define NNSYS_G3D_MODEL_INLINE_H_

#include <nitro.h>
#include <nnsys/g3d/binres/res_struct.h>

void NNSi_G3dModifyMatFlag(NNSG3dResMdl *pMdl, BOOL isOn, NNSG3dMatFlag flag);
void NNSi_G3dModifyPolygonAttrMask(NNSG3dResMdl *pMdl, BOOL isOn, u32 mask);

static inline void NNS_G3dMdlUseGlbDiff(NNSG3dResMdl *pMdl) {
    NNSi_G3dModifyMatFlag(pMdl, FALSE, NNS_G3D_MATFLAG_DIFFUSE);
}

static inline void NNS_G3dMdlUseGlbAmb(NNSG3dResMdl *pMdl) {
    NNSi_G3dModifyMatFlag(pMdl, FALSE, NNS_G3D_MATFLAG_AMBIENT);
}

static inline void NNS_G3dMdlUseGlbEmi(NNSG3dResMdl *pMdl) {
    NNSi_G3dModifyMatFlag(pMdl, FALSE, NNS_G3D_MATFLAG_EMISSION);
}

static inline void NNS_G3dMdlUseGlbSpec(NNSG3dResMdl *pMdl) {
    NNSi_G3dModifyMatFlag(pMdl, FALSE, NNS_G3D_MATFLAG_SPECULAR);
}

static inline void NNS_G3dMdlUseGlbLightEnableFlag(NNSG3dResMdl *pMdl) {
    NNSi_G3dModifyPolygonAttrMask(pMdl, FALSE, REG_G3_POLYGON_ATTR_LE_MASK);
}

#endif //NNSYS_G3D_MODEL_INLINE_H_
