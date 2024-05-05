#ifndef NITRO_GX_G3IMM_H_
#define NITRO_GX_G3IMM_H_

#include <nitro/hw/io_reg.h>
#include <nitro/gx/gxcommon.h>
#include <nitro/gx/g3.h>

typedef enum {
    GX_SORTMODE_AUTO = 0,
    GX_SORTMODE_MANUAL = 1
} GXSortMode;

typedef enum {
    GX_BUFFERMODE_Z = 0,
    GX_BUFFERMODE_W = 1
} GXBufferMode;

#define GX_PACK_MTXMODE_PARAM(mode)    ((u32) ((mode) << REG_G3_MTX_MODE_M_SHIFT))
#define GX_PACK_POPMTX_PARAM(num)      ((u32) (num))
#define GX_PACK_STOREMTX_PARAM(num)    ((u32) (num))
#define GX_PACK_RESTOREMTX_PARAM(num)  ((u32) (num))
#define GX_PACK_TEXIMAGE_PARAM(texFmt, texGen, s, t, repeat, flip, pltt0, addr) \
    ((u32)(((addr) >> 3)                                    | \
           ((texFmt) << REG_G3_TEXIMAGE_PARAM_TEXFMT_SHIFT) | \
           ((texGen) << REG_G3_TEXIMAGE_PARAM_TGEN_SHIFT)   | \
           ((s) << REG_G3_TEXIMAGE_PARAM_V_SIZE_SHIFT)      | \
           ((t) << REG_G3_TEXIMAGE_PARAM_T_SIZE_SHIFT)      | \
           ((repeat) << REG_G3_TEXIMAGE_PARAM_RS_SHIFT)     | \
           ((flip) << REG_G3_TEXIMAGE_PARAM_FS_SHIFT)       | \
           ((pltt0) << REG_G3_TEXIMAGE_PARAM_TR_SHIFT)))
#define GX_PACK_SWAPBUFFERS_PARAM(am, zw) \
    ((u32) (((am) << REG_G3_SWAP_BUFFERS_XS_SHIFT) | \
            ((zw) << REG_G3_SWAP_BUFFERS_DP_SHIFT)))
#define GX_PACK_TEXPLTTBASE_PARAM(addr, texFmt) \
    ((u32)((addr) >> (4 - ((texFmt) == GX_TEXFMT_PLTT4))))

static inline void G3_SwapBuffers(GXSortMode am, GXBufferMode zw) {
    reg_G3_SWAP_BUFFERS = GX_PACK_SWAPBUFFERS_PARAM(am, zw);
}

static inline void G3_ViewPort(int x1, int y1, int x2, int y2) {
    reg_G3_VIEWPORT = GX_PACK_VIEWPORT_PARAM(x1, y1, x2, y2);
}

static inline void G3_MtxMode(GXMtxMode mode) {
    reg_G3_MTX_MODE = GX_PACK_MTXMODE_PARAM(mode);
}

static inline void G3_PushMtx() {
    reg_G3_MTX_PUSH = 0;
}

static inline void G3_PopMtx(int num) {
    reg_G3_MTX_POP = GX_PACK_POPMTX_PARAM(num);
}

static inline void G3_TexImageParam(GXTexFmt texFmt, GXTexGen texGen, GXTexSizeS s, GXTexSizeT t, GXTexRepeat repeat, GXTexFlip flip, GXTexPlttColor0 pltt0, u32 addr) {
    reg_G3_TEXIMAGE_PARAM = GX_PACK_TEXIMAGE_PARAM(texFmt, texGen, s, t, repeat, flip, pltt0, addr);
}

static inline void G3_Identity() {
    reg_G3_MTX_IDENTITY = 0;
}

static inline void G3_TexPlttBase(u32 addr, GXTexFmt texfmt) {
    u32 param = GX_PACK_TEXPLTTBASE_PARAM(addr, texfmt);
    reg_G3_TEXPLTT_BASE = param;
}

static inline void G3_Translate(fx32 x, fx32 y, fx32 z) {
    reg_G3_MTX_TRANS = (u32)x;
    reg_G3_MTX_TRANS = (u32)y;
    reg_G3_MTX_TRANS = (u32)z;
}

static inline void G3_MaterialColorDiffAmb(GXRgb diffuse, GXRgb ambient, BOOL IsSetVtxColor) {
    reg_G3_DIF_AMB = GX_PACK_DIFFAMB_PARAM(diffuse, ambient, IsSetVtxColor);
}

static inline void G3_MaterialColorSpecEmi(GXRgb specular, GXRgb emission, BOOL IsShininess) {
    reg_G3_SPE_EMI = GX_PACK_SPECEMI_PARAM(specular, emission, IsShininess);
}

static inline void G3_PolygonAttr(int light, GXPolygonMode polyMode, GXCull cullMode, int polygonID, int alpha, int misc) {
    reg_G3_POLYGON_ATTR = GX_PACK_POLYGONATTR_PARAM(light,
                                                    polyMode, cullMode, polygonID, alpha, misc);
}

#endif //NITRO_GX_G3IMM_H_
