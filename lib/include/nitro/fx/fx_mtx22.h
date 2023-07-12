#ifndef NITR_FX_FX_MTX22_H_
#define NITR_FX_FX_MTX22_H_

#include <nitro/types.h>
#include <nitro/fx/fx.h>

void MTX_Rot22_(MtxFx22 *mtx, fx16 x, fx16 y);
void MTX_ScaleApply22(MtxFx22 *a, MtxFx22 *b, fx32 x, fx32 y);

#endif //NITR_FX_FX_MTX22_H_
