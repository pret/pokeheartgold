#ifndef NNSYS_G3D_GECOM_INLINE_H_
#define NNSYS_G3D_GECOM_INLINE_H_

static inline void NNS_G3dGePushMtx(void) {
    NNS_G3dGeBufferOP_N(G3OP_MTX_PUSH, NULL, G3OP_MTX_PUSH_NPARAMS);
}

static inline void NNS_G3dGePopMtx(int num) {
    NNS_G3dGeBufferOP_N(G3OP_MTX_POP, (u32*)&num, G3OP_MTX_POP_NPARAMS);
}

#endif //NNSYS_G3D_GECOM_INLINE_H_
