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
    u16 unk_160;
    u16 unk_162;
} UnkStruct_ov01_021E7FDC;

typedef struct SpriteTemplate_ov01_021E81F0 {
    int unk_0;
    s16 unk_4;
    s16 unk_6;
    s16 unk_8;
    u16 unk_A;
    int unk_C;
    int unk_10;
    int unk_14;
    int unk_18;
    u8 filler_1C[0xC];
} SpriteTemplate_ov01_021E81F0;

void UnkFieldSpriteRenderer_ov01_021E7FDC_Init(UnkStruct_ov01_021E7FDC *a0, const u16 *a1, int a2, HeapID a3);
void UnkFieldSpriteRenderer_ov01_021E7FDC_Release(UnkStruct_ov01_021E7FDC *a0);
Sprite *ov01_021E81F0(UnkStruct_ov01_021E7FDC *a0, const SpriteTemplate_ov01_021E81F0 *a1);

#endif // POKEHEARTGOLD_FIELD_OV01_021E7FDC_H
