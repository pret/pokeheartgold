#ifndef NITRO_FX_FX_VEC_H_
#define NITRO_FX_FX_VEC_H_

#include <nitro/types.h>

void VEC_Add(const VecFx32 *a, const VecFx32 *b, VecFx32 *ab);
void VEC_Subtract(const VecFx32 *a, const VecFx32 *b, VecFx32 *ab);
fx32 VEC_Mag(VecFx32 *a);

#endif //NITRO_FX_FX_VEC_H_
