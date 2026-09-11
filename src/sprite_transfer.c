#include "sprite_transfer.h"

#include "global.h"

#include "obj_char_transfer.h"
#include "obj_pltt_transfer.h"

BOOL SpriteTransfer_CreateCharTransferTask(SpriteResource *obj) {
    GF_ASSERT(obj != NULL);
    GF_ASSERT(GF2DGfxResObj_GetResType(obj) == GF_GFX_RES_TYPE_CHAR);

    ObjCharTransferTaskTemplate template;
    template.charData = GF2DGfxResObj_GetCharDataPtr(obj);
    template.vram = GF2DGfxResObj_GetLoadAddress(obj);
    template.id = GF2DGfxResObj_GetResID(obj);
    template.atEnd = FALSE;
    return ObjCharTransfer_CreateTaskAndDoTransferFromTemplate(&template);
}

void SpriteTransfer_CreateAllCharTransferTasks(GF_2DGfxResObjList *charResObjList) {
    GF_ASSERT(charResObjList != NULL);
    for (int i = 0; i < charResObjList->max; ++i) {
        if (charResObjList->obj[i] != NULL) {
            GF_ASSERT(SpriteTransfer_CreateCharTransferTask(charResObjList->obj[i]));
        }
    }
}

BOOL SpriteTransfer_CreateCharTransferTask_UpdateMappingTypeFromHW(SpriteResource *obj) {
    GF_ASSERT(obj != NULL);
    GF_ASSERT(GF2DGfxResObj_GetResType(obj) == GF_GFX_RES_TYPE_CHAR);

    ObjCharTransferTaskTemplate template;
    template.charData = GF2DGfxResObj_GetCharDataPtr(obj);
    template.vram = GF2DGfxResObj_GetLoadAddress(obj);
    template.id = GF2DGfxResObj_GetResID(obj);
    template.atEnd = FALSE;
    return ObjCharTransfer_CreateTaskAndDoTransferFromTemplate_UpdateMappingTypeFromHW(&template);
}

BOOL SpriteTransfer_CreateCharTransferTask_AllocAtEnd(SpriteResource *obj) {
    GF_ASSERT(obj != NULL);
    GF_ASSERT(GF2DGfxResObj_GetResType(obj) == GF_GFX_RES_TYPE_CHAR);

    ObjCharTransferTaskTemplate template;
    template.charData = GF2DGfxResObj_GetCharDataPtr(obj);
    template.vram = GF2DGfxResObj_GetLoadAddress(obj);
    template.id = GF2DGfxResObj_GetResID(obj);
    template.atEnd = TRUE;
    return ObjCharTransfer_CreateTaskAndDoTransferFromTemplate(&template);
}

void SpriteTransfer_CreateAllCharTransferTasks_AllocAtEnd(GF_2DGfxResObjList *charResObjList) {
    GF_ASSERT(charResObjList != NULL);
    for (int i = 0; i < charResObjList->max; ++i) {
        if (charResObjList->obj[i] != NULL) {
            GF_ASSERT(SpriteTransfer_CreateCharTransferTask_AllocAtEnd(charResObjList->obj[i]));
        }
    }
}

BOOL SpriteTransfer_CreateCharTransferTask_UpdateMappingTypeFromHW_AllocAtEnd(SpriteResource *obj) {
    GF_ASSERT(obj != NULL);
    GF_ASSERT(GF2DGfxResObj_GetResType(obj) == GF_GFX_RES_TYPE_CHAR);

    ObjCharTransferTaskTemplate template;
    template.charData = GF2DGfxResObj_GetCharDataPtr(obj);
    template.vram = GF2DGfxResObj_GetLoadAddress(obj);
    template.id = GF2DGfxResObj_GetResID(obj);
    template.atEnd = TRUE;
    return ObjCharTransfer_CreateTaskAndDoTransferFromTemplate_UpdateMappingTypeFromHW(&template);
}

void SpriteTransfer_SpriteTransfer_CreateAllCharTransferTasks_UpdateMappingTypeFromHW_AllocAtEnd(GF_2DGfxResObjList *charResObjList) {
    GF_ASSERT(charResObjList != NULL);
    for (int i = 0; i < charResObjList->max; ++i) {
        if (charResObjList->obj[i] != NULL) {
            GF_ASSERT(SpriteTransfer_CreateCharTransferTask_UpdateMappingTypeFromHW_AllocAtEnd(charResObjList->obj[i]));
        }
    }
}

void SpriteTransfer_ReplaceCharData(SpriteResource *obj) {
    GF_ASSERT(obj != NULL);

    int id = GF2DGfxResObj_GetResID(obj);
    NNSG2dCharacterData *charData = GF2DGfxResObj_GetCharDataPtr(obj);
    ObjCharTransfer_ReplaceGraphicsFromChardataByResID(id, charData);
}

void SpriteTransfer_DeleteCharTransferTask(SpriteResource *obj) {
    GF_ASSERT(obj != NULL);
    GF_ASSERT(GF2DGfxResObj_GetResType(obj) == GF_GFX_RES_TYPE_CHAR);

    ObjCharTransfer_ResetTransferTasksByResID(GF2DGfxResObj_GetResID(obj));
}

void SpriteTransfer_DeleteAllCharTransferTasks(GF_2DGfxResObjList *charResObjList) {
    GF_ASSERT(charResObjList != NULL);
    for (int i = 0; i < charResObjList->max; ++i) {
        if (charResObjList->obj[i] != NULL) {
            SpriteTransfer_DeleteCharTransferTask(charResObjList->obj[i]);
        }
    }
}

NNSG2dImageProxy *SpriteTransfer_GetCharProxy(SpriteResource *obj) {
    GF_ASSERT(obj != NULL);
    GF_ASSERT(GF2DGfxResObj_GetResType(obj) == GF_GFX_RES_TYPE_CHAR);

    return ObjCharTransfer_GetProxyPtrByResID(GF2DGfxResObj_GetResID(obj));
}

NNSG2dImageProxy *SpriteTransfer_GetCharProxyWithCell(SpriteResource *charResObj, SpriteResource *cellResObj) {
    NNSG2dImageProxy *ret;

    GF_ASSERT(charResObj != NULL);
    GF_ASSERT(GF2DGfxResObj_GetResType(charResObj) == GF_GFX_RES_TYPE_CHAR);
    GF_ASSERT(cellResObj != NULL);
    GF_ASSERT(GF2DGfxResObj_GetResType(cellResObj) == GF_GFX_RES_TYPE_CELL);

    int resID = GF2DGfxResObj_GetResID(charResObj);
    NNSG2dCellDataBank *cellData = GF2DGfxResObj_GetCellDataPtr(cellResObj);
    ret = ObjCharTransfer_ResizeTaskByResID_GetProxyPtr(resID, cellData->pVramTransferData->szByteMax);
    if (ret == NULL) {
        ret = ObjCharTransfer_CopyTransferTaskByProxyPtr(ObjCharTransfer_GetProxyPtrByResID(resID));
    }
    return ret;
}

void SpriteTransfer_DeleteCharTransferTaskByProxy(const NNSG2dImageProxy *imgProxy) {
    GF_ASSERT(imgProxy != NULL);
    ObjCharTransfer_DeleteTaskCopyByProxyPtr(imgProxy);
}

BOOL SpriteTransfer_CreateExtPlttTransferTask(SpriteResource *plttResObj) {
    GF_ASSERT(plttResObj != NULL);
    GF_ASSERT(GF2DGfxResObj_GetResType(plttResObj) == GF_GFX_RES_TYPE_PLTT);

    ObjPlttTransferTaskTemplate template;
    template.plttData = GF2DGfxResObj_GetPlttDataPtr(plttResObj);
    template.vram = GF2DGfxResObj_GetLoadAddress(plttResObj);
    template.id = GF2DGfxResObj_GetResID(plttResObj);
    template.plttNum = GF2DGfxResObj_GetPlttNum(plttResObj);
    return ObjPlttTransfer_CreateTaskAndDoTransferFromTemplate_HandleExtPltt(&template);
}

void SpriteTransfer_CreateAllExtPlttTransferTasks(GF_2DGfxResObjList *plttResObjList) {
    GF_ASSERT(plttResObjList != NULL);
    for (int i = 0; i < plttResObjList->max; ++i) {
        if (plttResObjList->obj[i] != NULL) {
            GF_ASSERT(SpriteTransfer_CreateExtPlttTransferTask(plttResObjList->obj[i]));
        }
    }
}

BOOL SpriteTransfer_CreatePlttTransferTask(SpriteResource *plttResObj) {
    GF_ASSERT(plttResObj != NULL);
    GF_ASSERT(GF2DGfxResObj_GetResType(plttResObj) == GF_GFX_RES_TYPE_PLTT);

    ObjPlttTransferTaskTemplate template;
    template.plttData = GF2DGfxResObj_GetPlttDataPtr(plttResObj);
    template.vram = GF2DGfxResObj_GetLoadAddress(plttResObj);
    template.id = GF2DGfxResObj_GetResID(plttResObj);
    template.plttNum = GF2DGfxResObj_GetPlttNum(plttResObj);
    return ObjPlttTransfer_CreateTaskAndDoTransferFromTemplate_ExtPlttBanned(&template);
}

void SpriteTransfer_CreateAllPlttTransferTasks(GF_2DGfxResObjList *plttResObjList) {
    GF_ASSERT(plttResObjList != NULL);
    for (int i = 0; i < plttResObjList->max; ++i) {
        if (plttResObjList->obj[i] != NULL) {
            GF_ASSERT(SpriteTransfer_CreatePlttTransferTask(plttResObjList->obj[i]));
        }
    }
}

void SpriteTransfer_ReplacePlttData(SpriteResource *plttResObj) {
    GF_ASSERT(plttResObj != NULL);
    int resID = GF2DGfxResObj_GetResID(plttResObj);
    NNSG2dPaletteData *plttData = GF2DGfxResObj_GetPlttDataPtr(plttResObj);
    ObjPlttTransfer_CreateTransferTask(resID, plttData);
}

void SpriteTransfer_DeletePlttTransferTask(SpriteResource *plttResObj) {
    GF_ASSERT(plttResObj != NULL);
    GF_ASSERT(GF2DGfxResObj_GetResType(plttResObj) == GF_GFX_RES_TYPE_PLTT);

    ObjPlttTransfer_FreeTaskByID(GF2DGfxResObj_GetResID(plttResObj));
}

void SpriteTransfer_DeleteAllPlttTransferTasks(GF_2DGfxResObjList *plttResObjList) {
    GF_ASSERT(plttResObjList != NULL);
    for (int i = 0; i < plttResObjList->max; ++i) {
        if (plttResObjList->obj[i] != NULL) {
            SpriteTransfer_DeletePlttTransferTask(plttResObjList->obj[i]);
        }
    }
}

NNSG2dImagePaletteProxy *SpriteTransfer_GetPaletteProxy(SpriteResource *plttResObj, NNSG2dImageProxy *imageProxy) {
    GF_ASSERT(plttResObj != NULL);
    GF_ASSERT(GF2DGfxResObj_GetResType(plttResObj) == GF_GFX_RES_TYPE_PLTT);

    int resID = GF2DGfxResObj_GetResID(plttResObj);
    if (imageProxy != NULL) {
        return ObjPlttTransfer_GetPlttProxyByID_UpdateRefProxyExtFlag(resID, imageProxy);
    } else {
        return ObjPlttTransfer_GetPlttProxyByID(resID);
    }
}

int SpriteTransfer_GetPlttOffset(SpriteResource *plttResObj, NNS_G2D_VRAM_TYPE vram) {
    NNSG2dImagePaletteProxy *plttProxy = SpriteTransfer_GetPaletteProxy(plttResObj, NULL);
    int location = NNS_G2dGetImagePaletteLocation(plttProxy, vram);
    if (location != -1) {
        location /= 32;
    }
    return location;
}
