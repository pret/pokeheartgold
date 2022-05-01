#ifndef POKEHEARTGOLD_UNK_0201F4C4_H
#define POKEHEARTGOLD_UNK_0201F4C4_H

void Draw3dModel(NNSG3dRenderObj *obj, const VecFx32 *translation, const MtxFx33 *rotation, const VecFx32 *scale);
BOOL AllocAndLoad3dTexResources(NNSG3dResTex *tex);
BOOL Bind3dModelSet(NNSG3dResFileHeader *obj, NNSG3dResTex *tex);
void sub_0201F51C(NNSG3dRenderObj *obj, NNSG3dResMdl **p_mdl, NNSG3dResFileHeader **p_header);

#endif //POKEHEARTGOLD_UNK_0201F4C4_H
