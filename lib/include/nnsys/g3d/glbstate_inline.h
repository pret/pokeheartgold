#ifndef NNSYS_G3D_GLBSTATE_INLINE_H_
#define NNSYS_G3D_GLBSTATE_INLINE_H_

#include <nitro.h>
#include <nnsys/g3d/glbstate.h>

static inline void NNS_G3dGlbSetBaseRot(const MtxFx33 *pRot) {
    MI_Copy36B(pRot, &NNS_G3dGlb.prmBaseRot);
    NNS_G3dGlb.flag &= ~(NNS_G3D_GLB_FLAG_BASECAMERA_UPTODATE | NNS_G3D_GLB_FLAG_INVBASE_UPTODATE | NNS_G3D_GLB_FLAG_INVBASECAMERA_UPTODATE);
}

static inline void NNS_G3dGlbFlush(void) {
    NNS_G3dGlbFlushP();
}

extern void MTX_LookAt(const VecFx32 *camPos, const VecFx32 *camUp, const VecFx32 *target, MtxFx43 *mtx); //unsure if this is right
extern void MTX_PerspectiveW(fx32 fovySin, fx32 fovyCos, fx32 aspect, fx32 n, fx32 f, fx32 scale, MtxFx44 *mtx); //unsure if this is right
extern void MTX_OrthoW(fx32 t, fx32 b, fx32 l, fx32 r, fx32 n, fx32 f, fx32 scale, MtxFx44 * mtx); //unsure if this is right

static inline void NNS_G3dGlbLookAt(const VecFx32 *camPos, const VecFx32 *camUp, const VecFx32 *camTarget) {
    NNS_G3dGlb.camPos = *camPos;
    NNS_G3dGlb.camUp = *camUp;
    NNS_G3dGlb.camTarget = *camTarget;
    MTX_LookAt(camPos, camUp, camTarget, &NNS_G3dGlb.cameraMtx);
    NNS_G3dGlb.flag &= ~(NNS_G3D_GLB_FLAG_INVCAMERA_UPTODATE | NNS_G3D_GLB_FLAG_INVBASECAMERA_UPTODATE | NNS_G3D_GLB_FLAG_INVCAMERAPROJ_UPTODATE | NNS_G3D_GLB_FLAG_BASECAMERA_UPTODATE);
}

static inline void NNS_G3dGlbPerspective(fx32 fovySin, fx32 fovyCos, fx32 aspect, fx32 n, fx32 f) {
    MTX_PerspectiveW(fovySin, fovyCos, aspect, n, f, FX32_ONE, &NNS_G3dGlb.projMtx);
    NNS_G3dGlb.flag &= ~(NNS_G3D_GLB_FLAG_INVPROJ_UPTODATE | NNS_G3D_GLB_FLAG_INVCAMERAPROJ_UPTODATE);
}

static inline void NNS_G3dGlbOrtho(fx32 t, fx32 b, fx32 l, fx32 r, fx32 n, fx32 f) {
    MTX_OrthoW(t, b, l, r, n, f, FX32_ONE, &NNS_G3dGlb.projMtx);
    NNS_G3dGlb.flag &= ~(NNS_G3D_GLB_FLAG_INVPROJ_UPTODATE | NNS_G3D_GLB_FLAG_INVCAMERAPROJ_UPTODATE);
}

static inline void NNS_G3dGlbSetViewPort(int x1, int y1, int x2, int y2) {
    NNS_G3dGlb.prmViewPort = GX_PACK_VIEWPORT_PARAM(x1, y1, x2, y2);
}

#endif //NNSYS_G3D_GLBSTATE_INLINE_H_
