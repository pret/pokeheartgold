#ifndef NNSYS_G2D_G2D_VEC_DATA_H_
#define NNSYS_G2D_G2D_VEC_DATA_H_

typedef struct NNSG2dFVec2 {
    fx32 x;
    fx32 y;
} NNSG2dFVec2;

typedef union {
    struct {
        fx32 _00, _01;
        fx32 _10, _11;
        fx32 _20, _21;
    };
    fx32 m[3][2];
    fx32 a[6];
} MtxFx32;

#endif //NNSYS_G2D_G2D_VEC_DATA_H_
