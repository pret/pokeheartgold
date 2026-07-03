#ifndef POKEHEARTGOLD_FIELD_OV01_021E7FDC_H
#define POKEHEARTGOLD_FIELD_OV01_021E7FDC_H

#include "sprite.h"
#include "unk_02009D48.h"

typedef struct UnkStruct_ov01_021E7FDC {
    SpriteList *spriteList;
    G2dRenderer renderer;
    SpriteResourceHeaderList *spriteResourceHeaderList;
    GF_2DGfxResMan *spriteResManagers[GF_GFX_RES_TYPE_MAX];
    GF_2DGfxResObjList *spriteResObjLists[GF_GFX_RES_TYPE_MAX];
    u16 numResMans;
    u16 heapID;
} UnkStruct_ov01_021E7FDC;

typedef struct SpriteTemplate_ov01_021E81F0 {
    int resId;
    s16 xPos;
    s16 yPos;
    s16 zPos;
    u16 animSeq;
    int drawPriority;
    int palIndex;
    NNS_G2D_VRAM_TYPE vramType;
    int dontOverridePalIndex;
    u8 filler_1C[0xC];
} SpriteTemplate_ov01_021E81F0;

void UnkFieldSpriteRenderer_ov01_021E7FDC_Init(UnkStruct_ov01_021E7FDC *a0, const u16 *resDatIdxs, int numSprites, enum HeapID heapID);
void UnkFieldSpriteRenderer_ov01_021E7FDC_Release(UnkStruct_ov01_021E7FDC *a0);
Sprite *ov01_021E81F0(UnkStruct_ov01_021E7FDC *a0, const SpriteTemplate_ov01_021E81F0 *a1);
void ov01_021E8298(UnkStruct_ov01_021E7FDC *a0, const int *a1, int a2, enum HeapID a3);
void ov01_021E8378(UnkStruct_ov01_021E7FDC *a0, NarcId a1, int a2, BOOL a3, int a4, NNS_G2D_VRAM_TYPE a5, int a6);

#endif // POKEHEARTGOLD_FIELD_OV01_021E7FDC_H
