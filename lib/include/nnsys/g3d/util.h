#ifndef NNS_G3D_UTIL_H_
#define NNS_G3D_UTIL_H_

#include <nitro.h>

void NNS_G3dInit(void);
int NNS_G3dScrPosToWorldLine(int px, int py, VecFx32* pNear, VecFx32* pFar);
BOOL NNS_G3dResDefaultSetup(void* pResData);

#endif //NNS_G3D_UTIL_H_
