#ifndef NITRO_FX_FX_VEC_H_
#define NITRO_FX_FX_VEC_H_

#include <nitro/fx/fx.h>

void VEC_Add(const VecFx32 *a, const VecFx32 *b, VecFx32 *ab);
void VEC_Subtract(const VecFx32 *a, const VecFx32 *b, VecFx32 *ab);
fx32 VEC_Mag(VecFx32 *a);
void VEC_Normalize(const VecFx32 *pSrc, VecFx32 *pDst);

void VEC_Fx16Add(const VecFx16 *a, const VecFx16 *b, VecFx16 *ab);
void VEC_Fx16Normalize(const VecFx16 * pSrc, VecFx16 * pDst);

#endif //NITRO_FX_FX_VEC_H_
