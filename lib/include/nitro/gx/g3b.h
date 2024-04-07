#ifndef _NITRO_GX_G3B_H_
#define _NITRO_GX_G3B_H_

#include <nitro/gx/gxcommon.h>
#include <nitro/gx/g3.h>

void G3B_MaterialColorDiffAmb(GXDLInfo *info, GXRgb diffuse, GXRgb ambient, BOOL IsSetVtxColor);
void G3B_MaterialColorSpecEmi(GXDLInfo *info, GXRgb specular, GXRgb emission, BOOL IsShininess);

#endif //_NITRO_GX_G3B_H_
