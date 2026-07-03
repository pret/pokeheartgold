#include "global.h"

#include "field/ov01_021E7FDC.h"

#include "gf_gfx_loader.h"
#include "unk_0200A090.h"
#include "unk_0200ACF0.h"

void ov01_021E847C(GF_2DGfxResObjList *a0, SpriteResource *a1);

void UnkFieldSpriteRenderer_ov01_021E7FDC_Init(UnkStruct_ov01_021E7FDC *a0, const u16 *resDatIdxs, int numSprites, enum HeapID heapID) {
    GF_2DGfxResHeader *curResHeader;
    NARC *resdatNarc;
    GF_2DGfxResHeader *resHeaders;
    struct ResdatNarcEntry *resdatNarcEntry;
    u32 i;

    a0->spriteList = G2dRenderer_Init(numSprites, &a0->renderer, heapID);
    a0->heapID = heapID;
    if (resDatIdxs[GF_GFX_RES_TYPE_MCEL] == 0xFFFF) {
        a0->numResMans = 4;
    } else {
        a0->numResMans = 6;
    }
    resHeaders = Heap_Alloc(heapID, GF2DGfxResHeader_sizeof() * a0->numResMans);
    resdatNarc = NARC_New(NARC_data_resdat, heapID);
    for (i = 0; i < a0->numResMans; ++i) {
        curResHeader = GF2DGfxResHeader_GetByIndex(resHeaders, i);
        GF_2DGfxResHeaderNarcList *sp28 = GfGfxLoader_LoadFromOpenNarc(resdatNarc, resDatIdxs[i], FALSE, heapID, TRUE);
        GF2DGfxResHeader_Init(sp28, curResHeader, heapID);
        Heap_Free(sp28);
    }
    for (i = 0; i < a0->numResMans; ++i) {
        curResHeader = GF2DGfxResHeader_GetByIndex(resHeaders, i);
        a0->spriteResManagers[i] = Create2DGfxResObjMan(GF2dGfxResHeader_GetNumObjects(curResHeader), (GfGfxResType)i, heapID);
    }
    for (i = 0; i < a0->numResMans; ++i) {
        curResHeader = GF2DGfxResHeader_GetByIndex(resHeaders, i);
        a0->spriteResObjLists[i] = Create2DGfxResObjList(GF2dGfxResHeader_GetNumObjects(curResHeader), heapID);
        LoadAll2DGfxResObjsFromHeader(a0->spriteResManagers[i], curResHeader, a0->spriteResObjLists[i], heapID);
    }
    for (i = 0; i < a0->numResMans; ++i) {
        curResHeader = GF2DGfxResHeader_GetByIndex(resHeaders, i);
        GF2DGfxResHeader_Reset(curResHeader);
    }
    Heap_Free(resHeaders);
    sub_0200ADE4(a0->spriteResObjLists[GF_GFX_RES_TYPE_CHAR]);
    sub_0200B050(a0->spriteResObjLists[GF_GFX_RES_TYPE_PLTT]);
    resdatNarcEntry = GfGfxLoader_LoadFromOpenNarc(resdatNarc, resDatIdxs[6], FALSE, heapID, TRUE);
    a0->spriteResourceHeaderList = SpriteResourceHeaderList_Create(resdatNarcEntry, heapID, a0->spriteResManagers[GF_GFX_RES_TYPE_CHAR], a0->spriteResManagers[GF_GFX_RES_TYPE_PLTT], a0->spriteResManagers[GF_GFX_RES_TYPE_CELL], a0->spriteResManagers[GF_GFX_RES_TYPE_ANIM], a0->spriteResManagers[GF_GFX_RES_TYPE_MCEL], a0->spriteResManagers[GF_GFX_RES_TYPE_MANM]);
    Heap_Free(resdatNarcEntry);
    NARC_Delete(resdatNarc);
}

void UnkFieldSpriteRenderer_ov01_021E7FDC_Release(UnkStruct_ov01_021E7FDC *a0) {
    u32 i;

    SpriteList_Delete(a0->spriteList);
    SpriteResourceHeaderList_Destroy(a0->spriteResourceHeaderList);
    sub_0200AED4(a0->spriteResObjLists[GF_GFX_RES_TYPE_CHAR]);
    sub_0200B0CC(a0->spriteResObjLists[GF_GFX_RES_TYPE_PLTT]);
    for (i = 0; i < a0->numResMans; ++i) {
        Delete2DGfxResObjList(a0->spriteResObjLists[i]);
        Destroy2DGfxResObjMan(a0->spriteResManagers[i]);
    }
}

Sprite *ov01_021E81F0(UnkStruct_ov01_021E7FDC *a0, const SpriteTemplate_ov01_021E81F0 *a1) {
    SpriteTemplate spriteTemplate;
    VecFx32 scale = { FX32_ONE, FX32_ONE, FX32_ONE };
    VecFx32 position = {
        a1->xPos * FX32_ONE,
        a1->yPos * FX32_ONE,
        a1->zPos * FX32_ONE,
    };
    Sprite *ret;

    if (a1->vramType == NNS_G2D_VRAM_TYPE_2DSUB) {
        position.y += 192 * FX32_ONE;
    }

    spriteTemplate.spriteList = a0->spriteList;
    spriteTemplate.header = &a0->spriteResourceHeaderList->headers[a1->resId];
    spriteTemplate.position = position;
    spriteTemplate.scale = scale;
    spriteTemplate.rotation = 0;
    spriteTemplate.drawPriority = a1->drawPriority;
    spriteTemplate.whichScreen = a1->vramType;
    spriteTemplate.heapID = (enum HeapID)a0->heapID;
    ret = Sprite_CreateAffine(&spriteTemplate);
    GF_ASSERT(ret != NULL);
    Sprite_SetAnimCtrlSeq(ret, a1->animSeq);
    if (a1->dontOverridePalIndex != 1) {
        Sprite_SetPalIndexRespectVramOffset(ret, a1->palIndex);
    }
    return ret;
}

void ov01_021E8298(UnkStruct_ov01_021E7FDC *a0, const int *a1, int a2, enum HeapID a3) {
    u32 i;
    u32 j;

    a0->spriteList = G2dRenderer_Init(a2, &a0->renderer, a3);
    a0->heapID = a3;
    if (a1[GF_GFX_RES_TYPE_MCEL] == 0 || a1[GF_GFX_RES_TYPE_MANM] == 0) {
        a0->numResMans = 4;
        a0->spriteResManagers[GF_GFX_RES_TYPE_MCEL] = NULL;
        a0->spriteResManagers[GF_GFX_RES_TYPE_MANM] = NULL;
    } else {
        a0->numResMans = 6;
    }
    for (i = 0; i < a0->numResMans; ++i) {
        a0->spriteResManagers[i] = Create2DGfxResObjMan(a1[i], (GfGfxResType)i, a3);
    }
    for (i = 0; i < a0->numResMans; ++i) {
        if (a1[i] != 0) {
            a0->spriteResObjLists[i] = Create2DGfxResObjList(a1[i], a3);
            for (j = 0; j < a0->spriteResObjLists[i]->max; ++j) {
                a0->spriteResObjLists[i]->obj[j] = NULL;
            }
        }
    }
}

void ov01_021E8378(UnkStruct_ov01_021E7FDC *a0, NarcId a1, int a2, BOOL a3, int a4, NNS_G2D_VRAM_TYPE a5, int a6) {
    SpriteResource *r4;

    if (!GF2DGfxResObjExistsById(a0->spriteResManagers[GF_GFX_RES_TYPE_PLTT], a6)) {
        GF_ASSERT(FALSE);
        return;
    }
    r4 = AddPlttResObjFromNarc(a0->spriteResManagers[GF_GFX_RES_TYPE_PLTT], a1, a2, a3, a6, a5, a4, (enum HeapID)a0->heapID);
    if (r4 != NULL) {
        GF_ASSERT(sub_0200B00C(r4) == TRUE);
        ov01_021E847C(a0->spriteResObjLists[GF_GFX_RES_TYPE_PLTT], r4);
        SpriteTransfer_GetPlttOffset(r4, a5);
    } else {
        GF_ASSERT(FALSE);
    }
}
