#ifndef NITRO_GX_G3_H_
#define NITRO_GX_G3_H_

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

#define GX_PACK_VIEWPORT_PARAM(x1, y1, x2, y2)  ((u32)((x1) | ((y1) << 8) | ((x2) << 16) | ((y2) << 24)))

#endif //NITRO_GX_G3_H_
