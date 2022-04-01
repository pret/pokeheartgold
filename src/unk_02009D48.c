#include "unk_02009D48.h"
#include "unk_0200ACF0.h"
#include "unk_02023694.h"
#include "unk_02025C44.h"
#include "unk_0200B150.h"
#include "unk_020215A0.h"
#include "unk_02022588.h"

void sub_02009D48(struct UnkStruct_02009D48 *hdr, int charId, int plttId, int cellId, int cellAnmId, int multiCellId, int multiCellAnmId, int transfer, int priority, struct _2DGfxResMan *charMan, struct _2DGfxResMan *plttMan, struct _2DGfxResMan *cellMan, struct _2DGfxResMan *cellAnmMan, struct _2DGfxResMan *multiCellMan, struct _2DGfxResMan *multiCellAnmMan) {
    struct _2DGfxResObj *charObj;
    struct _2DGfxResObj *plttObj;
    struct _2DGfxResObj *cellObj;
    struct _2DGfxResObj *cellAnmObj = NULL;
    struct _2DGfxResObj *multiCellObj = NULL;
    struct _2DGfxResObj *multiCellAnmObj = NULL;
    NNSG2dImageProxy *proxy;

    GF_ASSERT(charMan != NULL);
    GF_ASSERT(plttMan != NULL);
    GF_ASSERT(cellAnmMan != NULL);
    GF_ASSERT(cellMan != NULL);
    GF_ASSERT(hdr != NULL);

    charObj = Get2DGfxResObjById(charMan, charId);
    GF_ASSERT(charObj != NULL);
    plttObj = Get2DGfxResObjById(plttMan, plttId);
    GF_ASSERT(plttObj != NULL);
    cellObj = Get2DGfxResObjById(cellMan, cellId);
    GF_ASSERT(cellObj != NULL);

    if (cellAnmMan != NULL) {
        if (cellAnmId != -1) {
            cellAnmObj = Get2DGfxResObjById(cellAnmMan, cellAnmId);
            GF_ASSERT(cellAnmObj != NULL);
        }
    }
    if (multiCellMan != NULL) {
        if (multiCellId != -1) {
            multiCellObj = Get2DGfxResObjById(multiCellMan, multiCellId);
        }
        if (multiCellAnmId != -1) {
            multiCellAnmObj = Get2DGfxResObjById(multiCellAnmMan, multiCellAnmId);
        }
    }
    if (transfer) {
        proxy = sub_0200AF24(charObj, cellObj);
        GF_ASSERT(proxy != NULL);
        hdr->charData = sub_0200A810(charObj);
    } else {
        proxy = sub_0200AF00(charObj);
        GF_ASSERT(proxy != NULL);
        hdr->charData = NULL;
    }
    hdr->plttProxy = sub_0200B0F8(plttObj, proxy);
    hdr->imageProxy = proxy;
    hdr->cellData = sub_0200A840(cellObj);
    if (cellAnmObj != NULL) {
        hdr->cellAnim = sub_0200A858(cellAnmObj);
    } else {
        hdr->cellAnim = NULL;
    }
    if (multiCellObj != NULL) {
        hdr->multiCellData = sub_0200A870(multiCellObj);
        hdr->multiCellAnim = sub_0200A888(multiCellAnmObj);
    } else {
        hdr->multiCellData = NULL;
        hdr->multiCellAnim = NULL;
    }
    hdr->flag = transfer;
    hdr->priority = priority;
}

ListOfUnkStruct_02009D48 *sub_02009E84(const struct UnkStruct_02009E84 *a0, HeapID heapId, struct _2DGfxResMan *charMan, struct _2DGfxResMan *plttMan, struct _2DGfxResMan *cellMan, struct _2DGfxResMan *animMan, struct _2DGfxResMan *mcelMan, struct _2DGfxResMan *manmMan) {
    int i;
    int num = 0;
    ListOfUnkStruct_02009D48 *ret;

    while (a0[num].charId != -2) {
        num++;
    }
    ret = AllocFromHeap(heapId, sizeof(ListOfUnkStruct_02009D48));
    ret->headers = AllocFromHeap(heapId, sizeof(UnkStruct_02009D48) * num);
    ret->num = num;
    for (i = 0; i < ret->num; i++) {
        sub_02009D48(&ret->headers[i], a0[i].charId, a0[i].plttId, a0[i].cellId, a0[i].animId, a0[i].mcelId, a0[i].manmId, a0[i].xferFlag, a0[i].priority, charMan, plttMan, cellMan, animMan, mcelMan, manmMan);
    }
    return ret;
}

void sub_02009F24(ListOfUnkStruct_02009D48 *list) {
    GF_ASSERT(list != NULL);
    if (list->headers != NULL) {
        FreeToHeap(list->headers);
    }
    FreeToHeap(list);
}

UnkStruct_0202445C *sub_02009F40(int a0, UnkStruct_02009F40 *a1, HeapID heapId) {
    struct UnkStruct_0202445C *ret;
    struct UnkLocal_02009F40 sp10;
    NNSG2dViewRect sp0;

    sub_02025C44(&a1->rendererInstance, -FX32_ONE);
    sp0.posTopLeft.x = 0;
    sp0.posTopLeft.y = 0;
    sp0.sizeView.x = 255 * FX32_ONE;
    sp0.sizeView.y = 192 * FX32_ONE;
    sub_0200B27C(&a1->renderSurface[0], &sp0, 1, &a1->rendererInstance);
    sp0.posTopLeft.x = 0;
    sp0.posTopLeft.y = 192 * FX32_ONE;
    sp0.sizeView.x = 255 * FX32_ONE;
    sp0.sizeView.y = 192 * FX32_ONE;
    sub_0200B27C(&a1->renderSurface[1], &sp0, 2, &a1->rendererInstance);
    sp10.unk_0 = a0;
    sp10.rendererInstance = &a1->rendererInstance;
    sp10.heapId = heapId;
    return sub_0202445C(&sp10);
}

void sub_02009FA8(struct UnkStruct_02009F40 *a0, fx32 x, fx32 y) {
    struct NNSG2dViewRect sp0;

    sp0.posTopLeft.x = x;
    sp0.posTopLeft.y = y;
    sp0.sizeView.x = 255 * FX32_ONE;
    sp0.sizeView.y = 192 * FX32_ONE;
    sub_02025C88(&a0->renderSurface[0], &sp0);
}

void sub_02009FC8(struct UnkStruct_02009F40 *a0, fx32 x, fx32 y) {
    struct NNSG2dViewRect sp0;

    sp0.posTopLeft.x = x;
    sp0.posTopLeft.y = y;
    sp0.sizeView.x = 255 * FX32_ONE;
    sp0.sizeView.y = 192 * FX32_ONE;
    sub_02025C88(&a0->renderSurface[1], &sp0);
}

void sub_02009FE8(u32 a0, GXOBJVRamModeChar mode) {
    switch (mode) {
    case GX_OBJVRAMMODE_CHAR_1D_32K:
        if (GX_GetBankForOBJ() == GX_VRAM_OBJ_16_G || GX_GetBankForOBJ() == GX_VRAM_OBJ_16_F) {
            sub_020216F4(0x3E00, 0x200, a0);
        } else {
            sub_020216F4(0x7E00, 0x200, a0);
        }
        break;
    case GX_OBJVRAMMODE_CHAR_1D_64K:
        sub_020216F4(0xFE00, 0x200, a0);
        break;
    case GX_OBJVRAMMODE_CHAR_1D_128K:
        if (GX_GetBankForOBJ() == GX_VRAM_OBJ_80_EF || GX_GetBankForOBJ() == GX_VRAM_OBJ_80_EG) {
            sub_020216F4(0x13E00, 0x200, a0);
        } else {
            sub_020216F4(0x1FE00, 0x200, a0);
        }
        break;
    default:
        GF_ASSERT(0);
        break;
    }
}

void sub_0200A080(u32 a0) {
    sub_020225E4(0xC000, a0);
}
