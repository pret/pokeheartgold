#include "unk_02009D48.h"
#include "unk_0200ACF0.h"

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
