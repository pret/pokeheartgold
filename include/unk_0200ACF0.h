#ifndef POKEHEARTGOLD_UNK_0200ACF0_H
#define POKEHEARTGOLD_UNK_0200ACF0_H

#include "unk_0200A090.h"

BOOL sub_0200ACF0(SpriteResource *obj);
void sub_0200AD30(GF_2DGfxResObjList *charResObjList);
BOOL sub_0200AD64(SpriteResource *obj);
BOOL sub_0200ADA4(SpriteResource *charResObj);
void sub_0200ADE4(GF_2DGfxResObjList *charResObjList);
BOOL sub_0200AE18(SpriteResource *obj);
void sub_0200AE58(GF_2DGfxResObjList *charResObjList);
void sub_0200AE8C(SpriteResource *charResObj);
void sub_0200AEB0(SpriteResource *charResObj);
void sub_0200AED4(GF_2DGfxResObjList *charResObjList);
NNSG2dImageProxy *sub_0200AF00(SpriteResource *charResObj);
NNSG2dImageProxy *sub_0200AF24(SpriteResource *charResObj, SpriteResource *cellResObj);
void sub_0200AF80(const NNSG2dImageProxy *imgProxy);
BOOL sub_0200AF94(SpriteResource *obj);
void sub_0200AFD8(GF_2DGfxResObjList *plttResObjList);
BOOL sub_0200B00C(SpriteResource *plttResObj);
void sub_0200B050(GF_2DGfxResObjList *plttResObjList);
void sub_0200B084(SpriteResource *plttResObj);
void sub_0200B0A8(SpriteResource *plttResObj);
void sub_0200B0CC(GF_2DGfxResObjList *plttResObjList);
NNSG2dImagePaletteProxy *SpriteTransfer_GetPaletteProxy(SpriteResource *plttResObj, NNSG2dImageProxy *imageProxy);
int SpriteTransfer_GetPlttOffset(SpriteResource *plttResObj, NNS_G2D_VRAM_TYPE vram);

#endif // POKEHEARTGOLD_UNK_0200ACF0_H
