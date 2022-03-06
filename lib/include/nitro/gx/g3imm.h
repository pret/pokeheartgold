#ifndef NITRO_GX_G3IMM_H_
#define NITRO_GX_G3IMM_H_

typedef enum {
    GX_SORTMODE_AUTO = 0,
    GX_SORTMODE_MANUAL = 1
} GXSortMode;

typedef enum {
    GX_BUFFERMODE_Z = 0,
    GX_BUFFERMODE_W = 1
} GXBufferMode;

#define GX_PACK_SWAPBUFFERS_PARAM(am, zw) \
    ((u32) (((am) << REG_G3_SWAP_BUFFERS_XS_SHIFT) | \
            ((zw) << REG_G3_SWAP_BUFFERS_DP_SHIFT)))

static inline void G3_SwapBuffers(GXSortMode am, GXBufferMode zw) {
    reg_G3_SWAP_BUFFERS = GX_PACK_SWAPBUFFERS_PARAM(am, zw);
}

#endif //NITRO_GX_G3IMM_H_
