#ifndef POKEHEARTGOLD_FX_UTIL_H
#define POKEHEARTGOLD_FX_UTIL_H

#include <nitro/fx/fx.h>

#include "global.h"

// clang-format off
#define VEC_FX32(__x, __y, __z) (VecFx32){ FX32_CONST(__x), FX32_CONST(__y), FX32_CONST(__z) }
#define VEC_FX16(__x, __y, __z) (VecFx16){ FX16_CONST(__x), FX16_CONST(__y), FX16_CONST(__z) }
// clang-format on

fx32 FX_Min(fx32 a, fx32 b);
fx32 FX_Max(fx32 a, fx32 b);
fx32 VEC_DistanceFromPointToLine(const VecFx32 *a, const VecFx32 *near, const VecFx32 *far);
fx32 VEC_AngleBetween(const VecFx32 *param0, const VecFx32 *param1);
void MTX_Rot33Vec(MtxFx33 *outRot, VecFx32 *angles);
void MTX_Rot33Angles(MtxFx33 *outRot, u16 alpha, u16 beta, u16 gamma);
void FX_CalcLinearFov(u16 angularFov, fx32 distance, fx32 aspectRatio, fx32 *outWidth, fx32 *outHeight);

#endif // POKEHEARTGOLD_FX_UTIL_H
