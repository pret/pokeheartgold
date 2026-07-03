#include "global.h"

#include "field/ov01_021E7FDC.h"

#include "gf_gfx_loader.h"
#include "unk_0200A090.h"
#include "unk_0200ACF0.h"

void UnkFieldSpriteRenderer_ov01_021E7FDC_Init(UnkStruct_ov01_021E7FDC *a0, const u16 *a1, int a2, enum HeapID a3) {
    GF_2DGfxResHeader *curResHeader;
    NARC *resdatNarc;
    GF_2DGfxResHeader *resHeaders;
    struct ResdatNarcEntry *resdatNarcEntry;
    u32 i;

    a0->spriteList = G2dRenderer_Init(a2, &a0->renderer, a3);
    a0->unk_162 = a3;
    if (a1[GF_GFX_RES_TYPE_MCEL] == 0xFFFF) {
        a0->unk_160 = 4;
    } else {
        a0->unk_160 = 6;
    }
    resHeaders = Heap_Alloc(a3, GF2DGfxResHeader_sizeof() * a0->unk_160);
    resdatNarc = NARC_New(NARC_data_resdat, a3);
    for (i = 0; i < a0->unk_160; ++i) {
        curResHeader = GF2DGfxResHeader_GetByIndex(resHeaders, i);
        GF_2DGfxResHeaderNarcList *sp28 = GfGfxLoader_LoadFromOpenNarc(resdatNarc, a1[i], FALSE, a3, TRUE);
        GF2DGfxResHeader_Init(sp28, curResHeader, a3);
        Heap_Free(sp28);
    }
    for (i = 0; i < a0->unk_160; ++i) {
        curResHeader = GF2DGfxResHeader_GetByIndex(resHeaders, i);
        a0->spriteResManagers[i] = Create2DGfxResObjMan(GF2dGfxResHeader_GetNumObjects(curResHeader), (GfGfxResType)i, a3);
    }
    for (i = 0; i < a0->unk_160; ++i) {
        curResHeader = GF2DGfxResHeader_GetByIndex(resHeaders, i);
        a0->spriteResObjLists[i] = Create2DGfxResObjList(GF2dGfxResHeader_GetNumObjects(curResHeader), a3);
        LoadAll2DGfxResObjsFromHeader(a0->spriteResManagers[i], curResHeader, a0->spriteResObjLists[i], a3);
    }
    for (i = 0; i < a0->unk_160; ++i) {
        curResHeader = GF2DGfxResHeader_GetByIndex(resHeaders, i);
        GF2DGfxResHeader_Reset(curResHeader);
    }
    Heap_Free(resHeaders);
    sub_0200ADE4(a0->spriteResObjLists[GF_GFX_RES_TYPE_CHAR]);
    sub_0200B050(a0->spriteResObjLists[GF_GFX_RES_TYPE_PLTT]);
    resdatNarcEntry = GfGfxLoader_LoadFromOpenNarc(resdatNarc, a1[6], FALSE, a3, TRUE);
    a0->spriteResourceHeaderList = SpriteResourceHeaderList_Create(resdatNarcEntry, a3, a0->spriteResManagers[GF_GFX_RES_TYPE_CHAR], a0->spriteResManagers[GF_GFX_RES_TYPE_PLTT], a0->spriteResManagers[GF_GFX_RES_TYPE_CELL], a0->spriteResManagers[GF_GFX_RES_TYPE_ANIM], a0->spriteResManagers[GF_GFX_RES_TYPE_MCEL], a0->spriteResManagers[GF_GFX_RES_TYPE_MANM]);
    Heap_Free(resdatNarcEntry);
    NARC_Delete(resdatNarc);
}

void UnkFieldSpriteRenderer_ov01_021E7FDC_Release(UnkStruct_ov01_021E7FDC *a0) {
    u32 i;

    SpriteList_Delete(a0->spriteList);
    SpriteResourceHeaderList_Destroy(a0->spriteResourceHeaderList);
    sub_0200AED4(a0->spriteResObjLists[GF_GFX_RES_TYPE_CHAR]);
    sub_0200B0CC(a0->spriteResObjLists[GF_GFX_RES_TYPE_PLTT]);
    for (i = 0; i < a0->unk_160; ++i) {
        Delete2DGfxResObjList(a0->spriteResObjLists[i]);
        Destroy2DGfxResObjMan(a0->spriteResManagers[i]);
    }
}
