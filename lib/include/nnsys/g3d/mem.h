#ifndef NNSYS_G3D_MEM_H_
#define NNSYS_G3D_MEM_H_

#include <nnsys/fnd/allocator.h>
#include <nnsys/g3d/kernel.h>

NNSG3dAnmObj *NNS_G3dAllocAnmObj(NNSFndAllocator *pAlloc, const void *pAnm, const NNSG3dResMdl *pMdl);
void NNS_G3dFreeAnmObj(NNSFndAllocator *pAlloc, NNSG3dAnmObj *pAnmObj);

#endif // NNSYS_G3D_MEM_H_
