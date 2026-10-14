#include "spl_random.h"

u32 gSPLRandomState;

void SPLRandom_VecFx32(VecFx32 *vec)
{
    vec->x = SPLRandom_FX32(24);
    vec->y = SPLRandom_FX32(24);
    vec->z = SPLRandom_FX32(24);
    VEC_Normalize(vec, vec);
}

void SPLRandom_VecFx32_XY(VecFx32 *vec)
{
    vec->x = SPLRandom_FX32(24);
    vec->y = SPLRandom_FX32(24);
    vec->z = 0;
    VEC_Normalize(vec, vec);
}
