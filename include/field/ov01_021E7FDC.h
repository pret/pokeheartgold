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
    s16 x;
    s16 y;
    s16 z;
    u16 animSeq;
    int drawPriority;
    int palIndex;
    NNS_G2D_VRAM_TYPE vramType;
    int dontOverridePalIndex;
    u8 filler_1C[0xC];
} SpriteTemplate_ov01_021E81F0;

typedef struct UnkStruct_ov01_021E851C_Sub8 {
    SpriteResourcesHeader *unk_0;
    u8 filler_4[4];
} UnkStruct_ov01_021E851C_Sub8;

typedef struct UnkTemplate_ov01_021E851C {
    s16 x;
    s16 y;
    s16 z;
    u16 animSeq;
    int drawPriority;
    int palIndex;
    NNS_G2D_VRAM_TYPE vramType;
    int resIds[6];
    int priority;
    int transfer;
} UnkTemplate_ov01_021E851C;

void UnkFieldSpriteRenderer_ov01_021E7FDC_Init(UnkStruct_ov01_021E7FDC *a0, const u16 *resDatIdxs, int numSprites, enum HeapID heapID);
void UnkFieldSpriteRenderer_ov01_021E7FDC_Release(UnkStruct_ov01_021E7FDC *a0);
Sprite *ov01_021E81F0(UnkStruct_ov01_021E7FDC *a0, const SpriteTemplate_ov01_021E81F0 *a1);
void ov01_021E8298(UnkStruct_ov01_021E7FDC *a0, const int *resDatCounts, int numSprites, enum HeapID heapId);
void ov01_021E8378(UnkStruct_ov01_021E7FDC *a0, NarcId narcId, int fileId, BOOL compressed, int plttNum, NNS_G2D_VRAM_TYPE vramType, int resId);
void ov01_021E83F0(UnkStruct_ov01_021E7FDC *a0, NarcId narcId, int fileId, BOOL compressed, int resId);
void ov01_021E8404(UnkStruct_ov01_021E7FDC *a0, NarcId narcId, int fileId, BOOL compressed, int resId);
void ov01_021E8418(UnkStruct_ov01_021E7FDC *a0, NarcId narcId, int fileId, BOOL compressed, NNS_G2D_VRAM_TYPE vramType, int resId);
ManagedSprite *ov01_021E851C(UnkStruct_ov01_021E7FDC *a0, const UnkTemplate_ov01_021E851C *a1);
void ov01_021E86F4(UnkStruct_ov01_021E7FDC *a0);

#endif // POKEHEARTGOLD_FIELD_OV01_021E7FDC_H
