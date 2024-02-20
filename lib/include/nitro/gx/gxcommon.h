#ifndef NITRO_GX_GXCOMMON_H_
#define NITRO_GX_GXCOMMON_H_

#ifndef SDK_ASM
#include <nitro/types.h>
typedef u16 GXRgb;
#endif

#define GX_RGB_R_SHIFT            (0)
#define GX_RGB_R_MASK             (0x001f)
#define GX_RGB_G_SHIFT            (5)
#define GX_RGB_G_MASK             (0x03e0)
#define GX_RGB_B_SHIFT            (10)
#define GX_RGB_B_MASK             (0x7c00)
#ifdef SDK_ASM
#define GX_RGB(r, g, b)           ((((r) << GX_RGB_R_SHIFT) | ((g) << GX_RGB_G_SHIFT) | ((b) << GX_RGB_B_SHIFT)))
#else
#define GX_RGB(r, g, b)           ((GXRgb)(((r) << GX_RGB_R_SHIFT) | ((g) << GX_RGB_G_SHIFT) | ((b) << GX_RGB_B_SHIFT)))
#endif

#define GX_DEFAULT_DMAID 3

#endif //NITRO_GX_GXCOMMON_H_
