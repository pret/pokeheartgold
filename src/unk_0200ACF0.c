#include "global.h"
#include "unk_0200ACF0.h"
#include "unk_020215A0.h"
#include "unk_02022588.h"

BOOL sub_0200ACF0(_2DGfxResObj *obj) {
    GF_ASSERT(obj != NULL);
    GF_ASSERT(_2DGfxResObj_GetResType(obj) == GF_GFX_RES_TYPE_CHAR);

    UnkStruct_02021758 sp00;
    sp00.charData = _2DGfxResObj_GetCharDataPtr(obj);
    sp00.vram = _2DGfxResObj_GetVRamType(obj);
    sp00.id = _2DGfxResObj_GetResID(obj);
    sp00.unk_0C = FALSE;
    return sub_02021758(&sp00);
}

void sub_0200AD30(_2DGfxResObjList *charResObjList) {
    GF_ASSERT(charResObjList != NULL);
    for (int i = 0; i < charResObjList->max; ++i) {
        if (charResObjList->obj[i] != NULL) {
            GF_ASSERT(sub_0200ACF0(charResObjList->obj[i]));
        }
    }
}

BOOL sub_0200AD64(_2DGfxResObj *obj) {
    GF_ASSERT(obj != NULL);
    GF_ASSERT(_2DGfxResObj_GetResType(obj) == GF_GFX_RES_TYPE_CHAR);

    UnkStruct_02021758 sp00;
    sp00.charData = _2DGfxResObj_GetCharDataPtr(obj);
    sp00.vram = _2DGfxResObj_GetVRamType(obj);
    sp00.id = _2DGfxResObj_GetResID(obj);
    sp00.unk_0C = FALSE;
    return sub_020217B0(&sp00);
}

BOOL sub_0200ADA4(_2DGfxResObj *obj) {
    GF_ASSERT(obj != NULL);
    GF_ASSERT(_2DGfxResObj_GetResType(obj) == GF_GFX_RES_TYPE_CHAR);

    UnkStruct_02021758 sp00;
    sp00.charData = _2DGfxResObj_GetCharDataPtr(obj);
    sp00.vram = _2DGfxResObj_GetVRamType(obj);
    sp00.id = _2DGfxResObj_GetResID(obj);
    sp00.unk_0C = TRUE;
    return sub_02021758(&sp00);
}

void sub_0200ADE4(_2DGfxResObjList *charResObjList) {
    GF_ASSERT(charResObjList != NULL);
    for (int i = 0; i < charResObjList->max; ++i) {
        if (charResObjList->obj[i] != NULL) {
            GF_ASSERT(sub_0200ADA4(charResObjList->obj[i]));
        }
    }
}

BOOL sub_0200AE18(_2DGfxResObj *obj) {
    GF_ASSERT(obj != NULL);
    GF_ASSERT(_2DGfxResObj_GetResType(obj) == GF_GFX_RES_TYPE_CHAR);

    UnkStruct_02021758 sp00;
    sp00.charData = _2DGfxResObj_GetCharDataPtr(obj);
    sp00.vram = _2DGfxResObj_GetVRamType(obj);
    sp00.id = _2DGfxResObj_GetResID(obj);
    sp00.unk_0C = TRUE;
    return sub_020217B0(&sp00);
}

void sub_0200AE58(_2DGfxResObjList *charResObjList) {
    GF_ASSERT(charResObjList != NULL);
    for (int i = 0; i < charResObjList->max; ++i) {
        if (charResObjList->obj[i] != NULL) {
            GF_ASSERT(sub_0200AE18(charResObjList->obj[i]));
        }
    }
}

void sub_0200AE8C(_2DGfxResObj *obj) {
    GF_ASSERT(obj != NULL);

    int id = _2DGfxResObj_GetResID(obj);
    NNSG2dCharacterData *charData = _2DGfxResObj_GetCharDataPtr(obj);
    sub_0202183C(id, charData);
}

void sub_0200AEB0(_2DGfxResObj *obj) {
    GF_ASSERT(obj != NULL);
    GF_ASSERT(_2DGfxResObj_GetResType(obj) == GF_GFX_RES_TYPE_CHAR);

    int id = _2DGfxResObj_GetResID(obj);
    sub_02021884(id);
}

void sub_0200AED4(_2DGfxResObjList *charResObjList) {
    GF_ASSERT(charResObjList != NULL);
    for (int i = 0; i < charResObjList->max; ++i) {
        if (charResObjList->obj[i] != NULL) {
            sub_0200AEB0(charResObjList->obj[i]);
        }
    }
}

NNSG2dImageProxy *sub_0200AF00(_2DGfxResObj *obj) {
    GF_ASSERT(obj != NULL);
    GF_ASSERT(_2DGfxResObj_GetResType(obj) == GF_GFX_RES_TYPE_CHAR);

    int id = _2DGfxResObj_GetResID(obj);
    return sub_02021910(id);
}

NNSG2dImageProxy *sub_0200AF24(_2DGfxResObj *charResObj, _2DGfxResObj *cellResObj) {
    NNSG2dImageProxy *ret;

    GF_ASSERT(charResObj != NULL);
    GF_ASSERT(_2DGfxResObj_GetResType(charResObj) == GF_GFX_RES_TYPE_CHAR);
    GF_ASSERT(cellResObj != NULL);
    GF_ASSERT(_2DGfxResObj_GetResType(cellResObj) == GF_GFX_RES_TYPE_CELL);

    int resID = _2DGfxResObj_GetResID(charResObj);
    NNSG2dCellDataBank *cellData = _2DGfxResObj_GetCellDataPtr(cellResObj);
    ret = sub_02021934(resID, cellData->pVramTransferData->szByteMax);
    if (ret == NULL) {
        ret = sub_020219B8(sub_02021910(resID));
    }
    return ret;
}

void sub_0200AF80(const NNSG2dImageProxy* imgProxy) {
    GF_ASSERT(imgProxy != NULL);
    sub_02021A50(imgProxy);
}

// ------------------

BOOL sub_0200AF94(_2DGfxResObj *plttResObj) {
    GF_ASSERT(plttResObj != NULL);
    GF_ASSERT(_2DGfxResObj_GetResType(plttResObj) == GF_GFX_RES_TYPE_PLTT);

    UnkStruct_02022660 sp00;
    sp00.plttData = _2DGfxResObj_GetPlttDataPtr(plttResObj);
    sp00.vram = _2DGfxResObj_GetVRamType(plttResObj);
    sp00.id = _2DGfxResObj_GetResID(plttResObj);
    sp00.plttNum = _2DGfxResObj_GetPlttNum(plttResObj);
    return sub_02022660(&sp00);
}

void sub_0200AFD8(_2DGfxResObjList *plttResObjList) {
    GF_ASSERT(plttResObjList != NULL);
    for (int i = 0; i < plttResObjList->max; ++i) {
        if (plttResObjList->obj[i] != NULL) {
            GF_ASSERT(sub_0200AF94(plttResObjList->obj[i]));
        }
    }
}

BOOL sub_0200B00C(_2DGfxResObj *plttResObj) {
    GF_ASSERT(plttResObj != NULL);
    GF_ASSERT(_2DGfxResObj_GetResType(plttResObj) == GF_GFX_RES_TYPE_PLTT);

    UnkStruct_02022660 sp00;
    sp00.plttData = _2DGfxResObj_GetPlttDataPtr(plttResObj);
    sp00.vram = _2DGfxResObj_GetVRamType(plttResObj);
    sp00.id = _2DGfxResObj_GetResID(plttResObj);
    sp00.plttNum = _2DGfxResObj_GetPlttNum(plttResObj);
    return sub_020226A4(&sp00);
}

void sub_0200B050(_2DGfxResObjList *plttResObjList) {
    GF_ASSERT(plttResObjList != NULL);
    for (int i = 0; i < plttResObjList->max; ++i) {
        if (plttResObjList->obj[i] != NULL) {
            GF_ASSERT(sub_0200B00C(plttResObjList->obj[i]));
        }
    }
}

void sub_0200B084(_2DGfxResObj* plttResObj) {
    GF_ASSERT(plttResObj != NULL);
    int resID = _2DGfxResObj_GetResID(plttResObj);
    NNSG2dPaletteData *plttData = _2DGfxResObj_GetPlttDataPtr(plttResObj);
    sub_020226E4(resID, plttData);
}

void sub_0200B0A8(_2DGfxResObj *plttResObj) {
    GF_ASSERT(plttResObj != NULL);
    GF_ASSERT(_2DGfxResObj_GetResType(plttResObj) == GF_GFX_RES_TYPE_PLTT);

    int resID = _2DGfxResObj_GetResID(plttResObj);
    sub_02022744(resID);
}

void sub_0200B0CC(_2DGfxResObjList *plttResObjList) {
    GF_ASSERT(plttResObjList != NULL);
    for (int i = 0; i < plttResObjList->max; ++i) {
        if (plttResObjList->obj[i] != NULL) {
            sub_0200B0A8(plttResObjList->obj[i]);
        }
    }
}

NNSG2dImagePaletteProxy *sub_0200B0F8(_2DGfxResObj *plttResObj, NNSG2dImageProxy *imageProxy) {
    GF_ASSERT(plttResObj != NULL);
    GF_ASSERT(_2DGfxResObj_GetResType(plttResObj) == GF_GFX_RES_TYPE_PLTT);

    int resID = _2DGfxResObj_GetResID(plttResObj);
    if (imageProxy != NULL) {
        return sub_020227D4(resID, imageProxy);
    } else {
        return sub_020227AC(resID);
    }
}

int sub_0200B12C(_2DGfxResObj* plttResObj, NNS_G2D_VRAM_TYPE vram) {
    NNSG2dImagePaletteProxy *plttProxy = sub_0200B0F8(plttResObj, NULL);
    int location = NNS_G2dGetImagePaletteLocation(plttProxy, vram);
    if (location != -1) {
        location /= 32;
    }
    return location;
}
