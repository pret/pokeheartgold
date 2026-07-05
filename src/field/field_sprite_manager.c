#include "field/field_sprite_manager.h"

#include "global.h"

#include "gf_gfx_loader.h"
#include "sprite_transfer.h"
#include "unk_0200A090.h"

static BOOL TryAddSpriteResourceToObjList(GF_2DGfxResObjList *objList, SpriteResource *spriteResource);
static void FieldSpriteManager_AddCellOrAnimRes(FieldSpriteManager *fieldSpriteManager, NarcId narcId, int fileId, BOOL compressed, GfGfxResType resType, int resId);

void FieldSpriteManager_InitWithResDat(FieldSpriteManager *fieldSpriteManager, const ResdatIdList *resDatIdxs, int numSprites, enum HeapID heapID) {
    GF_2DGfxResHeader *curResHeader;
    NARC *resdatNarc;
    GF_2DGfxResHeader *resHeaders;
    struct ResdatNarcEntry *resdatNarcEntry;
    u32 i;

    fieldSpriteManager->spriteList = G2dRenderer_Init(numSprites, &fieldSpriteManager->renderer, heapID);
    fieldSpriteManager->heapID = heapID;
    if (resDatIdxs->mcelRes == 0xFFFF) {
        fieldSpriteManager->numResMans = GF_GFX_RES_TYPE_MAX - 2;
    } else {
        fieldSpriteManager->numResMans = GF_GFX_RES_TYPE_MAX;
    }
    resHeaders = Heap_Alloc(heapID, GF2DGfxResHeader_sizeof() * fieldSpriteManager->numResMans);
    resdatNarc = NARC_New(NARC_data_resdat, heapID);
    for (i = 0; i < fieldSpriteManager->numResMans; ++i) {
        curResHeader = GF2DGfxResHeader_GetByIndex(resHeaders, i);
        GF_2DGfxResHeaderNarcList *narcList = GfGfxLoader_LoadFromOpenNarc(resdatNarc, resDatIdxs->raw[i], FALSE, heapID, TRUE);
        GF2DGfxResHeader_Init(narcList, curResHeader, heapID);
        Heap_Free(narcList);
    }
    for (i = 0; i < fieldSpriteManager->numResMans; ++i) {
        curResHeader = GF2DGfxResHeader_GetByIndex(resHeaders, i);
        fieldSpriteManager->spriteResManagers[i] = Create2DGfxResObjMan(GF2dGfxResHeader_GetNumObjects(curResHeader), (GfGfxResType)i, heapID);
    }
    for (i = 0; i < fieldSpriteManager->numResMans; ++i) {
        curResHeader = GF2DGfxResHeader_GetByIndex(resHeaders, i);
        fieldSpriteManager->spriteResObjLists[i] = Create2DGfxResObjList(GF2dGfxResHeader_GetNumObjects(curResHeader), heapID);
        LoadAll2DGfxResObjsFromHeader(fieldSpriteManager->spriteResManagers[i], curResHeader, fieldSpriteManager->spriteResObjLists[i], heapID);
    }
    for (i = 0; i < fieldSpriteManager->numResMans; ++i) {
        curResHeader = GF2DGfxResHeader_GetByIndex(resHeaders, i);
        GF2DGfxResHeader_Reset(curResHeader);
    }
    Heap_Free(resHeaders);
    SpriteTransfer_CreateAllCharTransferTasks_AllocAtEnd(fieldSpriteManager->spriteResObjLists[GF_GFX_RES_TYPE_CHAR]);
    SpriteTransfer_CreateAllPlttTransferTasks(fieldSpriteManager->spriteResObjLists[GF_GFX_RES_TYPE_PLTT]);
    resdatNarcEntry = GfGfxLoader_LoadFromOpenNarc(resdatNarc, resDatIdxs->headerId, FALSE, heapID, TRUE);
    fieldSpriteManager->spriteResourceHeaderList = SpriteResourceHeaderList_Create(resdatNarcEntry, heapID, fieldSpriteManager->spriteResManagers[GF_GFX_RES_TYPE_CHAR], fieldSpriteManager->spriteResManagers[GF_GFX_RES_TYPE_PLTT], fieldSpriteManager->spriteResManagers[GF_GFX_RES_TYPE_CELL], fieldSpriteManager->spriteResManagers[GF_GFX_RES_TYPE_ANIM], fieldSpriteManager->spriteResManagers[GF_GFX_RES_TYPE_MCEL], fieldSpriteManager->spriteResManagers[GF_GFX_RES_TYPE_MANM]);
    Heap_Free(resdatNarcEntry);
    NARC_Delete(resdatNarc);
}

void FieldSpriteManager_ReleaseWithResDat(FieldSpriteManager *fieldSpriteManager) {
    u32 i;

    SpriteList_Delete(fieldSpriteManager->spriteList);
    SpriteResourceHeaderList_Destroy(fieldSpriteManager->spriteResourceHeaderList);
    SpriteTransfer_DeleteAllCharTransferTasks(fieldSpriteManager->spriteResObjLists[GF_GFX_RES_TYPE_CHAR]);
    SpriteTransfer_DeleteAllPlttTransferTasks(fieldSpriteManager->spriteResObjLists[GF_GFX_RES_TYPE_PLTT]);
    for (i = 0; i < fieldSpriteManager->numResMans; ++i) {
        Delete2DGfxResObjList(fieldSpriteManager->spriteResObjLists[i]);
        Destroy2DGfxResObjMan(fieldSpriteManager->spriteResManagers[i]);
    }
}

Sprite *FieldSpriteManager_CreateSprite(FieldSpriteManager *fieldSpriteManager, const UnmanagedSpriteTemplate *unmanagedSpriteTemplate) {
    SpriteTemplate spriteTemplate;
    VecFx32 scale = { FX32_ONE, FX32_ONE, FX32_ONE };
    VecFx32 position = {
        unmanagedSpriteTemplate->x * FX32_ONE,
        unmanagedSpriteTemplate->y * FX32_ONE,
        unmanagedSpriteTemplate->z * FX32_ONE,
    };
    Sprite *ret;

    if (unmanagedSpriteTemplate->vram == NNS_G2D_VRAM_TYPE_2DSUB) {
        position.y += 192 * FX32_ONE;
    }

    spriteTemplate.spriteList = fieldSpriteManager->spriteList;
    spriteTemplate.header = &fieldSpriteManager->spriteResourceHeaderList->headers[unmanagedSpriteTemplate->resourceSet];
    spriteTemplate.position = position;
    spriteTemplate.scale = scale;
    spriteTemplate.rotation = 0;
    spriteTemplate.drawPriority = unmanagedSpriteTemplate->drawPriority;
    spriteTemplate.whichScreen = unmanagedSpriteTemplate->vram;
    spriteTemplate.heapID = (enum HeapID)fieldSpriteManager->heapID;
    ret = Sprite_CreateAffine(&spriteTemplate);
    GF_ASSERT(ret != NULL);
    Sprite_SetAnimCtrlSeq(ret, unmanagedSpriteTemplate->animation);
    if (unmanagedSpriteTemplate->paletteMode != 1) {
        Sprite_SetPalIndexRespectVramOffset(ret, unmanagedSpriteTemplate->pal);
    }
    return ret;
}

void FieldSpriteManager_InitEmptyResLists(FieldSpriteManager *fieldSpriteManager, const SpriteResourceCountsListUnion *resDatCounts, int numSprites, enum HeapID heapId) {
    u32 i;
    u32 j;

    fieldSpriteManager->spriteList = G2dRenderer_Init(numSprites, &fieldSpriteManager->renderer, heapId);
    fieldSpriteManager->heapID = heapId;
    if (resDatCounts->numMcel == 0 || resDatCounts->numManm == 0) {
        fieldSpriteManager->numResMans = GF_GFX_RES_TYPE_MAX - 2;
        fieldSpriteManager->spriteResManagers[GF_GFX_RES_TYPE_MCEL] = NULL;
        fieldSpriteManager->spriteResManagers[GF_GFX_RES_TYPE_MANM] = NULL;
    } else {
        fieldSpriteManager->numResMans = GF_GFX_RES_TYPE_MAX;
    }
    for (i = 0; i < fieldSpriteManager->numResMans; ++i) {
        fieldSpriteManager->spriteResManagers[i] = Create2DGfxResObjMan(resDatCounts->asArray[i], (GfGfxResType)i, heapId);
    }
    for (i = 0; i < fieldSpriteManager->numResMans; ++i) {
        if (resDatCounts->asArray[i] != 0) {
            fieldSpriteManager->spriteResObjLists[i] = Create2DGfxResObjList(resDatCounts->asArray[i], heapId);
            for (j = 0; j < fieldSpriteManager->spriteResObjLists[i]->max; ++j) {
                fieldSpriteManager->spriteResObjLists[i]->obj[j] = NULL;
            }
        }
    }
}

void FieldSpriteManager_AddPlttRes(FieldSpriteManager *fieldSpriteManager, NarcId narcId, int fileId, BOOL compressed, int plttNum, NNS_G2D_VRAM_TYPE vramType, int resId) {
    SpriteResource *spriteResource;

    if (!GF2DGfxResObjExistsById(fieldSpriteManager->spriteResManagers[GF_GFX_RES_TYPE_PLTT], resId)) {
        GF_ASSERT(FALSE);
        return;
    }
    spriteResource = AddPlttResObjFromNarc(fieldSpriteManager->spriteResManagers[GF_GFX_RES_TYPE_PLTT], narcId, fileId, compressed, resId, vramType, plttNum, (enum HeapID)fieldSpriteManager->heapID);
    if (spriteResource != NULL) {
        GF_ASSERT(SpriteTransfer_CreatePlttTransferTask(spriteResource) == TRUE);
        TryAddSpriteResourceToObjList(fieldSpriteManager->spriteResObjLists[GF_GFX_RES_TYPE_PLTT], spriteResource);
        SpriteTransfer_GetPlttOffset(spriteResource, vramType);
    } else {
        GF_ASSERT(FALSE);
    }
}

void FieldSpriteManager_AddCellRes(FieldSpriteManager *fieldSpriteManager, NarcId narcId, int fileId, BOOL compressed, int resId) {
    FieldSpriteManager_AddCellOrAnimRes(fieldSpriteManager, narcId, fileId, compressed, GF_GFX_RES_TYPE_CELL, resId);
}

void FieldSpriteManager_AddAnimRes(FieldSpriteManager *fieldSpriteManager, NarcId narcId, int fileId, BOOL compressed, int resId) {
    FieldSpriteManager_AddCellOrAnimRes(fieldSpriteManager, narcId, fileId, compressed, GF_GFX_RES_TYPE_ANIM, resId);
}

void FieldSpriteManager_AddCharRes(FieldSpriteManager *fieldSpriteManager, NarcId narcId, int fileId, BOOL compressed, NNS_G2D_VRAM_TYPE vramType, int resId) {
    SpriteResource *spriteResource;

    if (!GF2DGfxResObjExistsById(fieldSpriteManager->spriteResManagers[GF_GFX_RES_TYPE_CHAR], resId)) {
        GF_ASSERT(FALSE);
        return;
    }
    spriteResource = AddCharResObjFromNarc(fieldSpriteManager->spriteResManagers[GF_GFX_RES_TYPE_CHAR], narcId, fileId, compressed, resId, vramType, (enum HeapID)fieldSpriteManager->heapID);
    if (spriteResource != NULL) {
        SpriteTransfer_CreateCharTransferTask_AllocAtEnd(spriteResource);
        TryAddSpriteResourceToObjList(fieldSpriteManager->spriteResObjLists[GF_GFX_RES_TYPE_CHAR], spriteResource);
    } else {
        GF_ASSERT(FALSE);
    }
}

static BOOL TryAddSpriteResourceToObjList(GF_2DGfxResObjList *objList, SpriteResource *spriteResource) {
    int i;

    for (i = 0; i < objList->max; ++i) {
        if (objList->obj[i] == NULL) {
            objList->obj[i] = spriteResource;
            ++objList->num;
            return TRUE;
        }
    }

    return FALSE;
}

static void FieldSpriteManager_AddCellOrAnimRes(FieldSpriteManager *fieldSpriteManager, NarcId narcId, int fileId, BOOL compressed, GfGfxResType resType, int resId) {
    SpriteResource *spriteResource;

    if (!GF2DGfxResObjExistsById(fieldSpriteManager->spriteResManagers[resType], resId)) {
        GF_ASSERT(FALSE);
        return;
    }
    spriteResource = AddCellOrAnimResObjFromNarc(fieldSpriteManager->spriteResManagers[resType], narcId, fileId, compressed, resId, resType, (enum HeapID)fieldSpriteManager->heapID);
    if (spriteResource != NULL) {
        if (TryAddSpriteResourceToObjList(fieldSpriteManager->spriteResObjLists[resType], spriteResource) != TRUE) {
            GF_ASSERT(FALSE);
            return;
        }
    } else {
        GF_ASSERT(FALSE);
    }
}

ManagedSprite *FieldSpriteManager_CreateManagedSprite(FieldSpriteManager *fieldSpriteManager, const ManagedSpriteTemplate *managedSpriteTemplate) {
    SpriteTemplate spriteTemplate;
    int resIds[6];
    ManagedSprite *sprite;
    int palIndex;
    int i;

    sprite = Heap_Alloc((enum HeapID)fieldSpriteManager->heapID, sizeof(ManagedSprite));
    sprite->spriteResourceHeaderList = Heap_Alloc((enum HeapID)fieldSpriteManager->heapID, sizeof(SpriteResourceHeaderList));
    sprite->spriteResourceHeaderList->headers = Heap_Alloc((enum HeapID)fieldSpriteManager->heapID, sizeof(SpriteResourcesHeader));
    sprite->spriteResourcesHeader = &sprite->spriteResourceHeaderList->headers[0];
    for (i = 0; i < GF_GFX_RES_TYPE_MAX; ++i) {
        resIds[i] = managedSpriteTemplate->resIdList[i];
    }
    if (fieldSpriteManager->spriteResManagers[GF_GFX_RES_TYPE_MCEL] == NULL || fieldSpriteManager->spriteResManagers[GF_GFX_RES_TYPE_MANM] == NULL) {
        resIds[GF_GFX_RES_TYPE_MCEL] = -1;
        resIds[GF_GFX_RES_TYPE_MANM] = -1;
    } else {
        if (resIds[GF_GFX_RES_TYPE_MCEL] != -1 && !GF2DGfxResObjExistsById(fieldSpriteManager->spriteResManagers[GF_GFX_RES_TYPE_MCEL], resIds[GF_GFX_RES_TYPE_MCEL])) {
            resIds[GF_GFX_RES_TYPE_MCEL] = -1;
        }
        if (resIds[GF_GFX_RES_TYPE_MANM] != -1 && !GF2DGfxResObjExistsById(fieldSpriteManager->spriteResManagers[GF_GFX_RES_TYPE_MANM], resIds[GF_GFX_RES_TYPE_MANM])) {
            resIds[GF_GFX_RES_TYPE_MANM] = -1;
        }
    }
    CreateSpriteResourcesHeader(sprite->spriteResourcesHeader, resIds[GF_GFX_RES_TYPE_CHAR], resIds[GF_GFX_RES_TYPE_PLTT], resIds[GF_GFX_RES_TYPE_CELL], resIds[GF_GFX_RES_TYPE_ANIM], resIds[GF_GFX_RES_TYPE_MCEL], resIds[GF_GFX_RES_TYPE_MANM], managedSpriteTemplate->vramTransfer, managedSpriteTemplate->bgPriority, fieldSpriteManager->spriteResManagers[GF_GFX_RES_TYPE_CHAR], fieldSpriteManager->spriteResManagers[GF_GFX_RES_TYPE_PLTT], fieldSpriteManager->spriteResManagers[GF_GFX_RES_TYPE_CELL], fieldSpriteManager->spriteResManagers[GF_GFX_RES_TYPE_ANIM], fieldSpriteManager->spriteResManagers[GF_GFX_RES_TYPE_MCEL], fieldSpriteManager->spriteResManagers[GF_GFX_RES_TYPE_MANM]);
    spriteTemplate.spriteList = fieldSpriteManager->spriteList;
    spriteTemplate.header = sprite->spriteResourcesHeader;
    spriteTemplate.position.x = FX32_CONST(managedSpriteTemplate->x);
    spriteTemplate.position.y = FX32_CONST(managedSpriteTemplate->y);
    spriteTemplate.position.z = FX32_CONST(managedSpriteTemplate->z);
    if (managedSpriteTemplate->vram == NNS_G2D_VRAM_TYPE_2DSUB) {
        spriteTemplate.position.y += 192 * FX32_ONE;
    }
    spriteTemplate.scale.x = FX32_ONE;
    spriteTemplate.scale.y = FX32_ONE;
    spriteTemplate.scale.z = FX32_ONE;
    spriteTemplate.rotation = 0;
    spriteTemplate.drawPriority = managedSpriteTemplate->drawPriority;
    spriteTemplate.whichScreen = managedSpriteTemplate->vram;
    spriteTemplate.heapID = (enum HeapID)fieldSpriteManager->heapID;
    sprite->sprite = Sprite_CreateAffine(&spriteTemplate);
    if (sprite->sprite != NULL) {
        palIndex = Sprite_GetPalIndex(sprite->sprite);
        Sprite_SetAnimCtrlSeq(sprite->sprite, managedSpriteTemplate->animation);
        Sprite_SetPaletteOverride(sprite->sprite, palIndex + managedSpriteTemplate->pal);
    } else {
        GF_ASSERT(FALSE);
    }
    return sprite;
}

void FieldSpriteManager_ReleaseWithoutResDat(FieldSpriteManager *fieldSpriteManager) {
    u32 i;

    SpriteList_Delete(fieldSpriteManager->spriteList);
    SpriteTransfer_DeleteAllCharTransferTasks(fieldSpriteManager->spriteResObjLists[GF_GFX_RES_TYPE_CHAR]);
    SpriteTransfer_DeleteAllPlttTransferTasks(fieldSpriteManager->spriteResObjLists[GF_GFX_RES_TYPE_PLTT]);
    for (i = 0; i < fieldSpriteManager->numResMans; ++i) {
        Delete2DGfxResObjList(fieldSpriteManager->spriteResObjLists[i]);
        Destroy2DGfxResObjMan(fieldSpriteManager->spriteResManagers[i]);
    }
}
