#include "unk_02009D48.h"

#include "global.h"

#include "obj_char_transfer.h"
#include "obj_pltt_transfer.h"
#include "sprite.h"
#include "unk_0200ACF0.h"
#include "unk_0200B150.h"
#include "unk_02025C44.h"

void CreateSpriteResourcesHeader(struct SpriteResourcesHeader *hdr, int charId, int plttId, int cellId, int cellAnmId, int multiCellId, int multiCellAnmId, int transfer, int priority, GF_2DGfxResMan *charMan, GF_2DGfxResMan *plttMan, GF_2DGfxResMan *cellMan, GF_2DGfxResMan *cellAnmMan, GF_2DGfxResMan *multiCellMan, GF_2DGfxResMan *multiCellAnmMan) {
    SpriteResource *charObj;
    SpriteResource *plttObj;
    SpriteResource *cellObj;
    SpriteResource *cellAnmObj = NULL;
    SpriteResource *multiCellObj = NULL;
    SpriteResource *multiCellAnmObj = NULL;
    NNSG2dImageProxy *proxy;

    GF_ASSERT(charMan != NULL);
    GF_ASSERT(plttMan != NULL);
    GF_ASSERT(cellAnmMan != NULL);
    GF_ASSERT(cellMan != NULL);
    GF_ASSERT(hdr != NULL);

    charObj = SpriteResourceCollection_Find(charMan, charId);
    GF_ASSERT(charObj != NULL);
    plttObj = SpriteResourceCollection_Find(plttMan, plttId);
    GF_ASSERT(plttObj != NULL);
    cellObj = SpriteResourceCollection_Find(cellMan, cellId);
    GF_ASSERT(cellObj != NULL);

    if (cellAnmMan != NULL) {
        if (cellAnmId != -1) {
            cellAnmObj = SpriteResourceCollection_Find(cellAnmMan, cellAnmId);
            GF_ASSERT(cellAnmObj != NULL);
        }
    }
    if (multiCellMan != NULL) {
        if (multiCellId != -1) {
            multiCellObj = SpriteResourceCollection_Find(multiCellMan, multiCellId);
        }
        if (multiCellAnmId != -1) {
            multiCellAnmObj = SpriteResourceCollection_Find(multiCellAnmMan, multiCellAnmId);
        }
    }
    if (transfer) {
        proxy = sub_0200AF24(charObj, cellObj);
        GF_ASSERT(proxy != NULL);
        hdr->charData = GF2DGfxResObj_GetCharDataPtr(charObj);
    } else {
        proxy = sub_0200AF00(charObj);
        GF_ASSERT(proxy != NULL);
        hdr->charData = NULL;
    }
    hdr->plttProxy = SpriteTransfer_GetPaletteProxy(plttObj, proxy);
    hdr->imageProxy = proxy;
    hdr->cellData = GF2DGfxResObj_GetCellDataPtr(cellObj);
    if (cellAnmObj != NULL) {
        hdr->cellAnim = GF2DGfxResObj_GetAnimDataPtr(cellAnmObj);
    } else {
        hdr->cellAnim = NULL;
    }
    if (multiCellObj != NULL) {
        hdr->multiCellData = GF2DGfxResObj_GetMultiCellDataPtr(multiCellObj);
        hdr->multiCellAnim = GF2DGfxResObj_GetMultiAnimDataPtr(multiCellAnmObj);
    } else {
        hdr->multiCellData = NULL;
        hdr->multiCellAnim = NULL;
    }
    hdr->flag = transfer;
    hdr->priority = priority;
}

SpriteResourceHeaderList *SpriteResourceHeaderList_Create(const struct ResdatNarcEntry *resdatNarcEntry, enum HeapID heapID, GF_2DGfxResMan *charMan, GF_2DGfxResMan *plttMan, GF_2DGfxResMan *cellMan, GF_2DGfxResMan *animMan, GF_2DGfxResMan *mcelMan, GF_2DGfxResMan *manmMan) {
    int i;
    int num = 0;
    SpriteResourceHeaderList *ret;

    while (resdatNarcEntry[num].charId != -2) {
        num++;
    }
    ret = Heap_Alloc(heapID, sizeof(SpriteResourceHeaderList));
    ret->headers = Heap_Alloc(heapID, sizeof(SpriteResourcesHeader) * num);
    ret->num = num;
    for (i = 0; i < ret->num; i++) {
        CreateSpriteResourcesHeader(&ret->headers[i], resdatNarcEntry[i].charId, resdatNarcEntry[i].plttId, resdatNarcEntry[i].cellId, resdatNarcEntry[i].animId, resdatNarcEntry[i].mcelId, resdatNarcEntry[i].manmId, resdatNarcEntry[i].xferFlag, resdatNarcEntry[i].priority, charMan, plttMan, cellMan, animMan, mcelMan, manmMan);
    }
    return ret;
}

void SpriteResourceHeaderList_Destroy(SpriteResourceHeaderList *list) {
    GF_ASSERT(list != NULL);
    if (list->headers != NULL) {
        Heap_Free(list->headers);
    }
    Heap_Free(list);
}

SpriteList *G2dRenderer_Init(int numSprites, G2dRenderer *renderer, enum HeapID heapID) {
    struct SpriteListParam param;
    NNSG2dViewRect rect;

    GF_InitG2dRenderer(&renderer->rendererInstance, -FX32_ONE);
    rect.posTopLeft.x = 0;
    rect.posTopLeft.y = 0;
    rect.sizeView.x = 255 * FX32_ONE;
    rect.sizeView.y = 192 * FX32_ONE;
    sub_0200B27C(&renderer->renderSurface[0], &rect, NNS_G2D_VRAM_TYPE_2DMAIN, &renderer->rendererInstance);
    rect.posTopLeft.x = 0;
    rect.posTopLeft.y = 192 * FX32_ONE;
    rect.sizeView.x = 255 * FX32_ONE;
    rect.sizeView.y = 192 * FX32_ONE;
    sub_0200B27C(&renderer->renderSurface[1], &rect, NNS_G2D_VRAM_TYPE_2DSUB, &renderer->rendererInstance);
    param.num = numSprites;
    param.rendererInstance = &renderer->rendererInstance;
    param.heapID = heapID;
    return SpriteList_Create(&param);
}

void G2dRenderer_SetMainSurfaceCoords(G2dRenderer *renderer, fx32 x, fx32 y) {
    struct NNSG2dViewRect rect;

    rect.posTopLeft.x = x;
    rect.posTopLeft.y = y;
    rect.sizeView.x = 255 * FX32_ONE;
    rect.sizeView.y = 192 * FX32_ONE;
    GF_SetG2dRendererSurface(&renderer->renderSurface[0], &rect);
}

void G2dRenderer_SetSubSurfaceCoords(G2dRenderer *renderer, fx32 x, fx32 y) {
    struct NNSG2dViewRect rect;

    rect.posTopLeft.x = x;
    rect.posTopLeft.y = y;
    rect.sizeView.x = 255 * FX32_ONE;
    rect.sizeView.y = 192 * FX32_ONE;
    GF_SetG2dRendererSurface(&renderer->renderSurface[1], &rect);
}

void G2dRenderer_SetObjCharTransferReservedRegion(NNS_G2D_VRAM_TYPE vram, GXOBJVRamModeChar mode) {
    switch (mode) {
    case GX_OBJVRAMMODE_CHAR_1D_32K:
        if (GX_GetBankForOBJ() == GX_VRAM_OBJ_16_G || GX_GetBankForOBJ() == GX_VRAM_OBJ_16_F) {
            ObjCharTransfer_SetReservedRegion(0x3E00, 0x200, vram);
        } else {
            ObjCharTransfer_SetReservedRegion(0x7E00, 0x200, vram);
        }
        break;
    case GX_OBJVRAMMODE_CHAR_1D_64K:
        ObjCharTransfer_SetReservedRegion(0xFE00, 0x200, vram);
        break;
    case GX_OBJVRAMMODE_CHAR_1D_128K:
        if (GX_GetBankForOBJ() == GX_VRAM_OBJ_80_EF || GX_GetBankForOBJ() == GX_VRAM_OBJ_80_EG) {
            ObjCharTransfer_SetReservedRegion(0x13E00, 0x200, vram);
        } else {
            ObjCharTransfer_SetReservedRegion(0x1FE00, 0x200, vram);
        }
        break;
    default:
        GF_ASSERT(FALSE);
        break;
    }
}

void G2dRenderer_SetPlttTransferReservedRegion(NNS_G2D_VRAM_TYPE type) {
    ObjPlttTransfer_SetReservedRegion(0xC000, type);
}
