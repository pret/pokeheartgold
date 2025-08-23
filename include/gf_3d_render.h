#ifndef POKEHEARTGOLD_GF_3D_RENDER_H
#define POKEHEARTGOLD_GF_3D_RENDER_H

#include "global.h"

#include "heap.h"

BOOL GF3dRender_ResTexIsLoaded(NNSG3dResTex *tex);
void GF3dRender_InitObjFromHeader(NNSG3dRenderObj *obj, NNSG3dResMdl **p_mdl, NNSG3dResFileHeader **p_header);
void GF3dRender_DrawModel(NNSG3dRenderObj *obj, const VecFx32 *translation, const MtxFx33 *rotation, const VecFx32 *scale);
void GF3dRender_InitSimpleManager(HeapID heapID);
void GF3dRender_DeleteSimpleManager(void);
BOOL GF3dRender_BindModelSet(NNSG3dResFileHeader *obj, const NNSG3dResTex *tex);
BOOL GF3dRender_AllocAndLoadTexResources(NNSG3dResTex *tex);

// temporary veneers maybe?
void GF3dRender_LoadTexture(NNSG3dResTex *pTex, BOOL exec_begin_end);
void GF3dRender_LoadPalette(NNSG3dResTex *pTex, BOOL exec_begin_end);

#endif // POKEHEARTGOLD_GF_3D_RENDER_H
