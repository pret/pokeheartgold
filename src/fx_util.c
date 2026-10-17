#include "fx_util.h"

#include <nitro.h>
#include <nitro/fx/fx_trig.h>
#include <nnsys.h>

#include "global.h"

#include "math_util.h"

fx32 FX_Min(fx32 a, fx32 b) {
    return a < b ? a : b;
}

fx32 FX_Max(fx32 a, fx32 b) {
    return a > b ? a : b;
}

fx32 VEC_DistanceFromPointToLine(const VecFx32 *point, const VecFx32 *a, const VecFx32 *b) {
    VecFx32 vecAB, vecAP, distanceVec, vecProjection;
    VecFx32 zero = { .x = 0, .y = 0, .z = 0 };

    VEC_Subtract(b, a, &vecAB);
    VEC_Subtract(point, a, &vecAP);

    fx32 scalarProjection = FX_Div(VEC_DotProduct(&vecAB, &vecAP), FX_Mul(vecAB.x, vecAB.x) + FX_Mul(vecAB.y, vecAB.y) + FX_Mul(vecAB.z, vecAB.z));
    VEC_MultAdd(scalarProjection, &vecAB, &zero, &vecProjection); // bug: should normalize vecAB first

    VEC_Subtract(&vecProjection, &vecAP, &distanceVec);
    return VEC_Mag(&distanceVec);
}

fx32 VEC_AngleBetween(const VecFx32 *a, const VecFx32 *b) {
    VecFx32 aNorm, bNorm;

    VEC_Normalize(a, &aNorm);
    VEC_Normalize(b, &bNorm);

    fx32 cos = FX_Mul(aNorm.z, bNorm.z) + FX_Mul(aNorm.x, bNorm.x);
    fx32 sin = FX_Mul(aNorm.z, bNorm.x) - FX_Mul(aNorm.x, bNorm.z);

    fx32 angle;
    if (cos == 0) {
        angle = sin > 0 ? FX_DEG_TO_IDX(FX32_CONST(90)) : FX_DEG_TO_IDX(FX32_CONST(270));
    } else {
        angle = FX_Atan2Idx(sin, cos);
    }

    return angle;
}

void MTX_Rot33Vec(MtxFx33 *outRot, VecFx32 *angles) {
    MtxFx33 tmp;

    MTX_RotX33(outRot, FX_SinIdx((u16)angles->x), FX_CosIdx((u16)angles->x));
    MTX_RotY33(&tmp, FX_SinIdx((u16)angles->y), FX_CosIdx((u16)angles->y));
    MTX_Concat33(outRot, &tmp, outRot);
    MTX_RotZ33(&tmp, FX_SinIdx((u16)angles->z), FX_CosIdx((u16)angles->z));
    MTX_Concat33(outRot, &tmp, outRot);
}

void MTX_Rot33Angles(MtxFx33 *outRot, u16 alpha, u16 beta, u16 gamma) {
    MtxFx33 tmp;

    MTX_RotX33(outRot, GF_SinDegNoWrap(alpha), GF_CosDegNoWrap(alpha));
    MTX_RotY33(&tmp, GF_SinDegNoWrap(beta), GF_CosDegNoWrap(beta));
    MTX_Concat33(outRot, &tmp, outRot);
    MTX_RotZ33(&tmp, GF_SinDegNoWrap(gamma), GF_CosDegNoWrap(gamma));
    MTX_Concat33(outRot, &tmp, outRot);
}

void FX_CalcLinearFov(u16 angularFov, fx32 distance, fx32 aspectRatio, fx32 *outWidth, fx32 *outHeight) {
    fx32 sin = FX_SinIdx(angularFov);
    fx32 cos = FX_CosIdx(angularFov);
    fx32 tan = FX_Div(sin, cos);

    *outHeight = FX_Mul(distance, tan);
    *outHeight = FX_Mul(*outHeight, FX32_CONST(2));
    *outWidth = FX_Mul(*outHeight, aspectRatio);
}
