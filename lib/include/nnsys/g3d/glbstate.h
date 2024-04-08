#ifndef NNSYS_G3D_GLBSTATE_H_
#define NNSYS_G3D_GLBSTATE_H_

#include <nitro.h>
#include <nnsys/g3d/kernel.h>

typedef enum {
    NNS_G3D_GLB_FLAG_FLUSH_WVP              = 0x00000001,
    NNS_G3D_GLB_FLAG_FLUSH_VP               = 0x00000002,
    NNS_G3D_GLB_FLAG_INVBASE_UPTODATE       = 0x00000004,
    NNS_G3D_GLB_FLAG_INVCAMERA_UPTODATE     = 0x00000008,
    NNS_G3D_GLB_FLAG_INVPROJ_UPTODATE       = 0x00000010,
    NNS_G3D_GLB_FLAG_INVBASECAMERA_UPTODATE = 0x00000020,
    NNS_G3D_GLB_FLAG_INVCAMERAPROJ_UPTODATE = 0x00000040,

    NNS_G3D_GLB_FLAG_BASECAMERA_UPTODATE    = 0x00000080,

    NNS_G3D_GLB_FLAG_SRTCAMERA_UPTODATE     = NNS_G3D_GLB_FLAG_BASECAMERA_UPTODATE,
    NNS_G3D_GLB_FLAG_FLUSH_ALT              = NNS_G3D_GLB_FLAG_FLUSH_WVP
} NNSG3dGlbFlag;

typedef struct {
    u32 cmd0;
    u32 mtxmode_proj;
    MtxFx44 projMtx;
    u32 mtxmode_posvec;
    MtxFx43 cameraMtx;
    u32 cmd1;
    u32 lightVec[4];
    u32 cmd2;
    u32 prmMatColor0;
    u32 prmMatColor1;
    u32 prmPolygonAttr;
    u32 prmViewPort;
    u32 cmd3;
    u32 lightColor[4];
    u32 cmd4;
    MtxFx33 prmBaseRot;
    VecFx32 prmBaseTrans;
    VecFx32 prmBaseScale;
    u32 prmTexImageParam;
    u32 flag;
    MtxFx43 invCameraMtx;
    MtxFx43 srtCameraMtx;
    MtxFx43 invSrtCameraMtx;
    MtxFx43 invBaseMtx;
    MtxFx44 invProjMtx;
    MtxFx44 invCameraProjMtx;
    VecFx32 camPos;
    VecFx32 camUp;
    VecFx32 camTarget;
} NNSG3dGlb;

extern NNSG3dGlb NNS_G3dGlb;

void NNS_G3dGlbSetBaseTrans(const VecFx32 *pTrans);

void NNS_G3dGlbSetBaseScale(const VecFx32 *pScale);
void NNS_G3dGlbFlushP(void);
void NNS_G3dDraw(NNSG3dRenderObj *pRenderObj);
void NNS_G3dGlbLightVector(GXLightId lightID, fx16 x, fx16 y, fx16 z);
void NNS_G3dGlbLightColor(GXLightId lightID, GXRgb rgb);
void NNS_G3dGlbMaterialColorDiffAmb(GXRgb diffuse, GXRgb ambient, BOOL IsSetVtxColor);
void NNS_G3dGlbMaterialColorSpecEmi(GXRgb specular, GXRgb emission, BOOL IsShininess);
void NNS_G3dGlbPolygonAttr(int light, GXPolygonMode polyMode, GXCull cullMode, int polygonID, int alpha, int misc /* GXPolygonAttrMisc */);

#endif //NNSYS_G3D_GLBSTATE_H_
