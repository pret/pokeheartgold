#ifndef NNSYS_G3D_GECOM_INLINE_H_
#define NNSYS_G3D_GECOM_INLINE_H_

static inline void NNS_G3dGeMtxMode(GXMtxMode mode) {
    NNS_G3dGeBufferOP_N(G3OP_MTX_MODE, (u32*)&mode, G3OP_MTX_MODE_NPARAMS);
}

static inline void NNS_G3dGePushMtx(void) {
    NNS_G3dGeBufferOP_N(G3OP_MTX_PUSH, NULL, G3OP_MTX_PUSH_NPARAMS);
}

static inline void NNS_G3dGePopMtx(int num) {
    NNS_G3dGeBufferOP_N(G3OP_MTX_POP, (u32*)&num, G3OP_MTX_POP_NPARAMS);
}

static inline void NNS_G3dGeMultMtx43(const MtxFx43* m) {
    NNS_G3dGeBufferOP_N(G3OP_MTX_MULT_4x3, (u32*) m, G3OP_MTX_MULT_4x3_NPARAMS);
}

#endif //NNSYS_G3D_GECOM_INLINE_H_
