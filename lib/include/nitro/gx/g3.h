#ifndef NITRO_GX_G3_H_
#define NITRO_GX_G3_H_

#include <nitro/types.h>
#include <nitro/fx.h>

#define G3OP_NOP                0x00

#define G3OP_MTX_MODE           0x10
#define G3OP_MTX_PUSH           0x11
#define G3OP_MTX_POP            0x12
#define G3OP_MTX_STORE          0x13
#define G3OP_MTX_RESTORE        0x14
#define G3OP_MTX_IDENTITY       0x15
#define G3OP_MTX_LOAD_4x4       0x16
#define G3OP_MTX_LOAD_4x3       0x17
#define G3OP_MTX_MULT_4x4       0x18
#define G3OP_MTX_MULT_4x3       0x19
#define G3OP_MTX_MULT_3x3       0x1a
#define G3OP_MTX_SCALE          0x1b
#define G3OP_MTX_TRANS          0x1c

#define G3OP_COLOR              0x20
#define G3OP_NORMAL             0x21
#define G3OP_TEXCOORD           0x22
#define G3OP_VTX_16             0x23
#define G3OP_VTX_10             0x24
#define G3OP_VTX_XY             0x25
#define G3OP_VTX_XZ             0x26
#define G3OP_VTX_YZ             0x27
#define G3OP_VTX_DIFF           0x28
#define G3OP_POLYGON_ATTR       0x29
#define G3OP_TEXIMAGE_PARAM     0x2a
#define G3OP_TEXPLTT_BASE       0x2b

#define G3OP_DIF_AMB            0x30
#define G3OP_SPE_EMI            0x31
#define G3OP_LIGHT_VECTOR       0x32
#define G3OP_LIGHT_COLOR        0x33
#define G3OP_SHININESS          0x34

#define G3OP_BEGIN              0x40
#define G3OP_END                0x41

#define G3OP_SWAP_BUFFERS       0x50

#define G3OP_VIEWPORT           0x60

#define G3OP_BOX_TEST           0x70
#define G3OP_POS_TEST           0x71
#define G3OP_VEC_TEST           0x72

#define G3OP_DUMMY_COMMAND      0xFF

#define G3OP_NOP_NPARAMS                0

#define G3OP_MTX_MODE_NPARAMS           1
#define G3OP_MTX_PUSH_NPARAMS           0
#define G3OP_MTX_POP_NPARAMS            1
#define G3OP_MTX_STORE_NPARAMS          1
#define G3OP_MTX_RESTORE_NPARAMS        1
#define G3OP_MTX_IDENTITY_NPARAMS       0
#define G3OP_MTX_LOAD_4x4_NPARAMS       16
#define G3OP_MTX_LOAD_4x3_NPARAMS       12
#define G3OP_MTX_MULT_4x4_NPARAMS       16
#define G3OP_MTX_MULT_4x3_NPARAMS       12
#define G3OP_MTX_MULT_3x3_NPARAMS       9
#define G3OP_MTX_SCALE_NPARAMS          3
#define G3OP_MTX_TRANS_NPARAMS          3

#define G3OP_COLOR_NPARAMS              1
#define G3OP_NORMAL_NPARAMS             1
#define G3OP_TEXCOORD_NPARAMS           1
#define G3OP_VTX_16_NPARAMS             2
#define G3OP_VTX_10_NPARAMS             1
#define G3OP_VTX_XY_NPARAMS             1
#define G3OP_VTX_XZ_NPARAMS             1
#define G3OP_VTX_YZ_NPARAMS             1
#define G3OP_VTX_DIFF_NPARAMS           1
#define G3OP_POLYGON_ATTR_NPARAMS       1
#define G3OP_TEXIMAGE_PARAM_NPARAMS     1
#define G3OP_TEXPLTT_BASE_NPARAMS       1

#define G3OP_DIF_AMB_NPARAMS            1
#define G3OP_SPE_EMI_NPARAMS            1
#define G3OP_LIGHT_VECTOR_NPARAMS       1
#define G3OP_LIGHT_COLOR_NPARAMS        1
#define G3OP_SHININESS_NPARAMS          32

#define G3OP_BEGIN_NPARAMS              1
#define G3OP_END_NPARAMS                0

#define G3OP_SWAP_BUFFERS_NPARAMS       1

#define G3OP_VIEWPORT_NPARAMS           1

#define G3OP_BOX_TEST_NPARAMS           3
#define G3OP_POS_TEST_NPARAMS           2
#define G3OP_VEC_TEST_NPARAMS           1

typedef enum {
    GX_TEXSIZE_S8 = 0,
    GX_TEXSIZE_S16 = 1,
    GX_TEXSIZE_S32 = 2,
    GX_TEXSIZE_S64 = 3,
    GX_TEXSIZE_S128 = 4,
    GX_TEXSIZE_S256 = 5,
    GX_TEXSIZE_S512 = 6,
    GX_TEXSIZE_S1024 = 7
} GXTexSizeS;

typedef enum {
    GX_TEXSIZE_T8 = 0,
    GX_TEXSIZE_T16 = 1,
    GX_TEXSIZE_T32 = 2,
    GX_TEXSIZE_T64 = 3,
    GX_TEXSIZE_T128 = 4,
    GX_TEXSIZE_T256 = 5,
    GX_TEXSIZE_T512 = 6,
    GX_TEXSIZE_T1024 = 7
} GXTexSizeT;

typedef enum {
    GX_TEXFMT_NONE = 0,
    GX_TEXFMT_A3I5 = 1,
    GX_TEXFMT_PLTT4 = 2,
    GX_TEXFMT_PLTT16 = 3,
    GX_TEXFMT_PLTT256 = 4,
    GX_TEXFMT_COMP4x4 = 5,
    GX_TEXFMT_A5I3 = 6,
    GX_TEXFMT_DIRECT = 7
} GXTexFmt;

typedef enum {
    GX_TEXPLTTCOLOR0_USE = 0,
    GX_TEXPLTTCOLOR0_TRNS = 1
} GXTexPlttColor0;

typedef enum {
    GX_LIGHTID_0 = 0,
    GX_LIGHTID_1 = 1,
    GX_LIGHTID_2 = 2,
    GX_LIGHTID_3 = 3
} GXLightId;

typedef enum {
    GX_MTXMODE_PROJECTION = 0,
    GX_MTXMODE_POSITION = 1,
    GX_MTXMODE_POSITION_VECTOR = 2,
    GX_MTXMODE_TEXTURE = 3
} GXMtxMode;

typedef enum {
    GX_TEXGEN_NONE        = 0,
    GX_TEXGEN_TEXCOORD    = 1,
    GX_TEXGEN_NORMAL      = 2,
    GX_TEXGEN_VERTEX      = 3
} GXTexGen;

typedef enum {
    GX_TEXREPEAT_NONE    = 0,
    GX_TEXREPEAT_S       = 1,
    GX_TEXREPEAT_T       = 2,
    GX_TEXREPEAT_ST      = 3
} GXTexRepeat;

typedef enum {
    GX_TEXFLIP_NONE    = 0,
    GX_TEXFLIP_S       = 1,
    GX_TEXFLIP_T       = 2,
    GX_TEXFLIP_ST      = 3
} GXTexFlip;

typedef enum {
    GX_BEGIN_TRIANGLES      = 0,
    GX_BEGIN_QUADS          = 1,
    GX_BEGIN_TRIANGLE_STRIP = 2,
    GX_BEGIN_QUAD_STRIP     = 3
} GXBegin;

typedef enum {
    GX_LIGHTMASK_NONE = 0,
    GX_LIGHTMASK_0 = 1,
    GX_LIGHTMASK_1 = 2,
    GX_LIGHTMASK_01 = 3,
    GX_LIGHTMASK_2 = 4,
    GX_LIGHTMASK_02 = 5,
    GX_LIGHTMASK_12 = 6,
    GX_LIGHTMASK_012 = 7,
    GX_LIGHTMASK_3 = 8,
    GX_LIGHTMASK_03 = 9,
    GX_LIGHTMASK_13 = 10,
    GX_LIGHTMASK_013 = 11,
    GX_LIGHTMASK_23 = 12,
    GX_LIGHTMASK_023 = 13,
    GX_LIGHTMASK_123 = 14,
    GX_LIGHTMASK_0123 = 15
} GXLightMask;

typedef enum {
    GX_POLYGONMODE_MODULATE    = 0,
    GX_POLYGONMODE_DECAL       = 1,
    GX_POLYGONMODE_TOON        = 2,
    GX_POLYGONMODE_SHADOW      = 3
} GXPolygonMode;

typedef enum {
    GX_CULL_ALL      = 0,
    GX_CULL_FRONT    = 1,
    GX_CULL_BACK     = 2,
    GX_CULL_NONE     = 3
} GXCull;

#ifdef SDK_ADS
    typedef struct {
        u32 val[3];
    } GXBoxTestParam;
#else
    typedef union {
        u32 val[3];
        struct {
            fx16 x;
            fx16 y;
            fx16 z;
            fx16 width;
            fx16 height;
            fx16 depth;
        };
    } GXBoxTestParam;
#endif

#define GX_PACK_VIEWPORT_PARAM(x1, y1, x2, y2)  ((u32)((x1) | ((y1) << 8) | ((x2) << 16) | ((y2) << 24)))
#define GX_PACK_DIFFAMB_PARAM(diffuse, ambient, IsSetVtxColor)   \
    ((u32)((diffuse)                                           | \
           ((ambient) << REG_G3_DIF_AMB_AMBIENT_RED_SHIFT)     | \
           (((IsSetVtxColor) != FALSE) << REG_G3_DIF_AMB_C_SHIFT)))
#define GX_PACK_SPECEMI_PARAM(specular, emission, IsShininess)   \
    ((u32)((specular)                                          | \
           ((emission) << REG_G3_SPE_EMI_EMISSION_RED_SHIFT)   | \
           (((IsShininess) != FALSE) << REG_G3_SPE_EMI_S_SHIFT)))
#define GX_PACK_POLYGONATTR_PARAM(light, polyMode, cullMode, polygonID, alpha, misc) \
    ((u32)(((light) << REG_G3_POLYGON_ATTR_LE_SHIFT)     | \
           ((polyMode) << REG_G3_POLYGON_ATTR_PM_SHIFT)  | \
           ((cullMode) << REG_G3_POLYGON_ATTR_BK_SHIFT)  | \
           (misc)                                        | \
           ((polygonID) << REG_G3_POLYGON_ATTR_ID_SHIFT) | \
           ((alpha) << REG_G3_POLYGON_ATTR_ALPHA_SHIFT)))

typedef struct {
    u8 *curr_cmd;
    u32 *curr_param;
    u32 *bottom;
    u32 length;
    BOOL param0_cmd_flg;
} GXDLInfo;

void G3_BeginMakeDL(GXDLInfo *info, void *ptr, u32 length);
u32 G3_EndMakeDL(GXDLInfo *info);

#endif //NITRO_GX_G3_H_
