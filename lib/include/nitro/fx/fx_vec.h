#ifndef NITRO_FX_FX_VEC_H_
#define NITRO_FX_FX_VEC_H_

void VEC_Add(const VecFx32 *a, const VecFx32 *b, VecFx32 *ab);
void VEC_Subtract(const VecFx32 *a, const VecFx32 *b, VecFx32 *ab);
void VEC_Normalize(const VecFx32 *pSrc, VecFx32 *pDst);
fx32 VEC_DotProduct(const VecFx32 *a, const VecFx32 *b);
void VEC_MultAdd(fx32 a, const VecFx32 *v1, const VecFx32 *v2, VecFx32 *pDest);

#endif //NITRO_FX_FX_VEC_H_
