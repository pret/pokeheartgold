#ifndef NNSYS_G3D_GLBSTATE_INLINE_H_
#define NNSYS_G3D_GLBSTATE_INLINE_H_

static inline void NNS_G3dGlbSetBaseRot(const MtxFx33 *pRot) {
    MI_Copy36B(pRot, &NNS_G3dGlb.prmBaseRot);
    NNS_G3dGlb.flag &= ~(NNS_G3D_GLB_FLAG_BASECAMERA_UPTODATE | NNS_G3D_GLB_FLAG_INVBASE_UPTODATE | NNS_G3D_GLB_FLAG_INVBASECAMERA_UPTODATE);
}

static inline void NNS_G3dGlbFlush(void) {
    NNS_G3dGlbFlushP();
}

#endif //NNSYS_G3D_GLBSTATE_INLINE_H_
