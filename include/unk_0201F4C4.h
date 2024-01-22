#ifndef POKEHEARTGOLD_UNK_0201F4C4_H
#define POKEHEARTGOLD_UNK_0201F4C4_H

#include "global.h"
#include "heap.h"

BOOL G3dResTexIsLoaded(NNSG3dResTex *tex);
void G3dRenderObjInit_FromHeader(NNSG3dRenderObj *obj, NNSG3dResMdl **p_mdl, NNSG3dResFileHeader **p_header);
void Draw3dModel(NNSG3dRenderObj *obj, const VecFx32 *translation, const MtxFx33 *rotation, const VecFx32 *scale);
void Simple3DVramManager_Init(HeapID heapID);
void Simple3DVramManager_Delete(void);
BOOL Bind3dModelSet(NNSG3dResFileHeader *obj, const NNSG3dResTex *tex);
BOOL AllocAndLoad3dTexResources(NNSG3dResTex *tex);

// temporary
void Call_NNS_G3dTexLoad(NNSG3dResTex *pTex, BOOL exec_begin_end);
void Call_NNS_G3dPlttLoad(NNSG3dResTex *pTex, BOOL exec_begin_end);

#endif // POKEHEARTGOLD_UNK_0201F4C4_H
