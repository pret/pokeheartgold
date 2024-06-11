#ifndef _NITRO_GX_G3B_H_
#define _NITRO_GX_G3B_H_

#include <nitro/gx/gxcommon.h>
#include <nitro/gx/g3.h>
#include <nitro/gx/g3imm.h>

void G3B_Nop(GXDLInfo * info);
void G3B_MtxMode(GXDLInfo * info, GXMtxMode mode);
void G3B_PushMtx(GXDLInfo * info);
void G3B_PopMtx(GXDLInfo * info, int num);
void G3B_StoreMtx(GXDLInfo * info, int num);
void G3B_RestoreMtx(GXDLInfo * info, int num);
void G3B_Identity(GXDLInfo * info);
void G3B_LoadMtx44(GXDLInfo * info, const MtxFx44 * m);
void G3B_LoadMtx43(GXDLInfo * info, const MtxFx43 * m);
void G3B_MultMtx44(GXDLInfo * info, const MtxFx44 * m);
void G3B_MultMtx43(GXDLInfo * info, const MtxFx43 * m);
void G3B_MultMtx33(GXDLInfo * info, const MtxFx33 * m);
void G3B_Scale(GXDLInfo * info, fx32 x, fx32 y, fx32 z);
void G3B_Translate(GXDLInfo * info, fx32 x, fx32 y, fx32 z);
void G3B_MultTransMtx33(GXDLInfo * info, const MtxFx33 * mtx, const VecFx32 * trans);
void G3B_Color(GXDLInfo * info, GXRgb rgb);
void G3B_Normal(GXDLInfo * info, fx16 x, fx16 y, fx16 z);
void G3B_TexCoord(GXDLInfo * info, fx32 s, fx32 t);
void G3B_Vtx(GXDLInfo * info, fx16 x, fx16 y, fx16 z);
void G3B_Vtx10(GXDLInfo * info, fx16 x, fx16 y, fx16 z);
void G3B_VtxXY(GXDLInfo * info, fx16 x, fx16 y);
void G3B_VtxXZ(GXDLInfo * info, fx16 x, fx16 z);
void G3B_VtxYZ(GXDLInfo * info, fx16 y, fx16 z);
void G3B_VtxDiff(GXDLInfo * info, fx16 x, fx16 y, fx16 z);
void G3B_PolygonAttr(GXDLInfo * info, int light, GXPolygonMode polyMode, GXCull cullMode, int polygonID, int alpha, int misc);
void G3B_TexImageParam(GXDLInfo * info,
                       GXTexFmt texFmt,
                       GXTexGen texGen,
                       GXTexSizeS s,
                       GXTexSizeT t,
                       GXTexRepeat repeat, GXTexFlip flip, GXTexPlttColor0 pltt0, u32 addr);

void G3B_TexPlttBase(GXDLInfo * info, u32 addr, GXTexFmt texfmt);
void G3B_MaterialColorDiffAmb(GXDLInfo * info, GXRgb diffuse, GXRgb ambient, BOOL IsSetVtxColor);
void G3B_MaterialColorSpecEmi(GXDLInfo * info, GXRgb specular, GXRgb emission, BOOL IsShininess);
void G3B_LightVector(GXDLInfo * info, GXLightId lightID, fx16 x, fx16 y, fx16 z);
void G3B_LightColor(GXDLInfo * info, GXLightId lightID, GXRgb rgb);
void G3B_Shininess(GXDLInfo * info, const u32 * table);
void G3B_Begin(GXDLInfo * info, GXBegin primitive);
void G3B_End(GXDLInfo * info);
void G3B_SwapBuffers(GXDLInfo * info, GXSortMode am, GXBufferMode zw);
void G3B_ViewPort(GXDLInfo * info, int x1, int y1, int x2, int y2);
void G3B_BoxTest(GXDLInfo * info, const GXBoxTestParam * box);
void G3B_PositionTest(GXDLInfo * info, fx16 x, fx16 y, fx16 z);
void G3B_VectorTest(GXDLInfo * info, fx16 x, fx16 y, fx16 z);

#endif //_NITRO_GX_G3B_H_
