#ifndef NNSYS_G3D_KERNEL_INLINE_H_
#define NNSYS_G3D_KERNEL_INLINE_H_

static inline void NNS_G3dAnmObjSetFrame(NNSG3dAnmObj* pAnmObj, fx32 frame) {
    pAnmObj->frame = frame;
}

static inline fx32 NNS_G3dAnmObjGetNumFrame(const NNSG3dAnmObj* pAnmObj) {
    const NNSG3dResAnmCommon* p;
    p = (const NNSG3dResAnmCommon*) pAnmObj->resAnm;
    return p->numFrame * FX32_ONE;
}

#endif //NNSYS_G3D_KERNEL_INLINE_H_
