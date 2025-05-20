#include "sprite_system.h"

#include "global.h"

#include "assert.h"
#include "gf_gfx_loader.h"
#include "heap.h"
#include "obj_char_transfer.h"
#include "obj_pltt_transfer.h"
#include "palette.h"
#include "sprite.h"
#include "unk_02009D48.h"
#include "unk_0200ACF0.h"
#include "unk_0200B150.h"
#include "unk_02020654.h"

static void SpriteSystem_DeleteSpriteList(SpriteManager *spriteManager);
static void SpriteManager_FreeResourceHeaders(SpriteManager *spriteManager);
static void SpriteManager_FreeResources(SpriteManager *spriteManager);
static void SpriteSystem_FreeVramTransfers(SpriteSystem *spriteSystem);
static void SpriteSystem_FreeSpriteManager(SpriteSystem *spriteSystem, SpriteManager *spriteManager);
static BOOL SpriteSystem_LoadResourceDataFromFilepaths(SpriteSystem *spriteSystem, SpriteManager *spriteManager, const u16 *a2, int a3, int a4);
static Sprite *CreateSpriteFromResourceHeader(SpriteSystem *spriteSystem, SpriteManager *spriteManager, int headerIndex, s16 x, s16 y, s16 z, u16 animSeqNo, int rotation, int palIndex, NNS_G2D_VRAM_TYPE whichScreen, int a10, int a11, int a12, int a13);
static ManagedSprite *SpriteSystem_NewSpriteInternal(SpriteSystem *spriteSystem, SpriteManager *spriteManager, const UnkTemplate_0200D748 *unkTemplate, fx32 yOffset);
static BOOL LoadResObjInternal(SpriteSystem *spriteSystem, SpriteManager *spriteManager, NarcId narcId, int fileId, BOOL compressed, GfGfxResType a6, int resId);
static BOOL LoadResObjFromNarcInternal(SpriteSystem *spriteSystem, SpriteManager *spriteManager, NARC *narc, int fileId, BOOL compressed, GfGfxResType a6, int resId);
static BOOL RegisterLoadedResources(GF_2DGfxResObjList *list, SpriteResource *obj);
static BOOL UnregisterLoadedResources(GF_2DGfxResMan *manager, GF_2DGfxResObjList *list, u32 cellOrAnimId);
static BOOL UnregisterLoadedCharResources(GF_2DGfxResMan *manager, GF_2DGfxResObjList *list, u32 charId);
static BOOL UnregisterLoadedPlttResources(GF_2DGfxResMan *manager, GF_2DGfxResObjList *list, u32 plttId);

SpriteSystem *SpriteSystem_Alloc(HeapID heapId) {
    SpriteSystem *ret = AllocFromHeap(heapId, sizeof(SpriteSystem));
    if (ret == NULL) {
        return NULL;
    }
    ret->heapId = heapId;
    ret->numGfxHandlers = 0;
    ret->hasOamManager = TRUE;
    return ret;
}

SpriteManager *SpriteManager_New(SpriteSystem *spriteSystem) {
    GF_ASSERT(spriteSystem != NULL);
    SpriteManager *ret = AllocFromHeap(spriteSystem->heapId, sizeof(SpriteManager));
    if (ret == NULL) {
        return NULL;
    }
    ++spriteSystem->numGfxHandlers;
    for (int i = 0; i < GF_GFX_RES_TYPE_MAX; ++i) {
        ret->_2dGfxResMan[i] = NULL;
    }
    return ret;
}

G2dRenderer *SpriteSystem_GetRenderer(SpriteSystem *spriteSystem) {
    return &spriteSystem->renderer;
}

BOOL SpriteSystem_Init(SpriteSystem *spriteSystem, const OamManagerParam *oamManagerParam, const OamCharTransferParam *oamTransferParam, int numPltts) {
    GF_ASSERT(spriteSystem != NULL);
    if (spriteSystem == NULL) {
        return FALSE;
    }
    ObjCharTransferTemplate transferTemplate;
    transferTemplate.maxTasks = oamTransferParam->maxTasks;
    transferTemplate.sizeMain = oamTransferParam->sizeMain;
    transferTemplate.sizeSub = oamTransferParam->sizeSub;
    transferTemplate.heapId = spriteSystem->heapId;
    ObjCharTransfer_InitEx(&transferTemplate, oamTransferParam->charModeMain, oamTransferParam->charModeSub);
    ObjPlttTransfer_Init(numPltts, spriteSystem->heapId);
    NNS_G2dInitOamManagerModule();
    if (spriteSystem->hasOamManager == TRUE) {
        OamManager_Create(oamManagerParam->fromOBJmain, oamManagerParam->numOBJmain, oamManagerParam->fromAffineMain, oamManagerParam->numAffineMain, oamManagerParam->fromOBJsub, oamManagerParam->numOBJsub, oamManagerParam->fromAffineSub, oamManagerParam->numAffineSub, spriteSystem->heapId);
    }
    spriteSystem->cellTransferState = sub_02020654(0x20, spriteSystem->heapId);
    ObjCharTransfer_ClearBuffers();
    ObjPlttTransfer_Reset();
    return TRUE;
}

BOOL SpriteSystem_InitSprites(SpriteSystem *spriteSystem, SpriteManager *spriteManager, int numSprites) {
    if (spriteSystem == NULL || spriteManager == NULL) {
        return FALSE;
    }
    spriteManager->spriteList = G2dRenderer_Init(numSprites, &spriteSystem->renderer, spriteSystem->heapId);
    return TRUE;
}

void thunk_Sprite_Delete(Sprite *sprite) {
    Sprite_Delete(sprite);
}

void SpriteSystem_DrawSprites(SpriteManager *spriteManager) {
    GF_ASSERT(spriteManager != NULL);
    SpriteList_RenderAndAnimateSprites(spriteManager->spriteList);
}

void SpriteSystem_TransferOam(void) {
    OamManager_ApplyAndResetBuffers();
}

void SpriteSystem_UpdateTransfer(void) {
    thunk_UpdateCellTransferStateManager();
}

static void SpriteSystem_DeleteSpriteList(SpriteManager *spriteManager) {
    SpriteList_Delete(spriteManager->spriteList);
}

static void SpriteManager_FreeResourceHeaders(SpriteManager *spriteManager) {
    if (spriteManager->spriteHeaderList != NULL) {
        SpriteResourceHeaderList_Destroy(spriteManager->spriteHeaderList);
    }
}

static void SpriteManager_FreeResources(SpriteManager *spriteManager) {
    for (int i = 0; i < spriteManager->numGfxResObjectTypes; ++i) {
        GF2DGfxResHeader_Reset(GF2DGfxResHeader_GetByIndex(spriteManager->_2dGfxResHeader, i));
    }
    FreeToHeap(spriteManager->_2dGfxResHeader);
    sub_0200AED4(spriteManager->_2dGfxResObjList[0]);
    sub_0200B0CC(spriteManager->_2dGfxResObjList[1]);
    for (int i = 0; i < spriteManager->numGfxResObjectTypes; ++i) {
        Delete2DGfxResObjList(spriteManager->_2dGfxResObjList[i]);
        Destroy2DGfxResObjMan(spriteManager->_2dGfxResMan[i]);
    }
}

static void SpriteSystem_FreeVramTransfers(SpriteSystem *spriteSystem) {
    sub_0202067C(spriteSystem->cellTransferState);
    ObjCharTransfer_Destroy();
    ObjPlttTransfer_Destroy();
    if (spriteSystem->hasOamManager == TRUE) {
        OamManager_Free();
    }
}

static void SpriteSystem_FreeSpriteManager(SpriteSystem *spriteSystem, SpriteManager *spriteManager) {
    --spriteSystem->numGfxHandlers;
    FreeToHeap(spriteManager);
}

void SpriteSystem_DestroySpriteManager(SpriteSystem *spriteSystem, SpriteManager *spriteManager) {
    SpriteSystem_DeleteSpriteList(spriteManager);
    SpriteManager_FreeResourceHeaders(spriteManager);
    SpriteManager_FreeResources(spriteManager);
    SpriteSystem_FreeSpriteManager(spriteSystem, spriteManager);
}

void SpriteSystem_Free(SpriteSystem *spriteSystem) {
    GF_ASSERT(spriteSystem->numGfxHandlers == 0);
    SpriteSystem_FreeVramTransfers(spriteSystem);
    FreeToHeap(spriteSystem);
}

static BOOL SpriteSystem_LoadResourceDataFromFilepaths(SpriteSystem *spriteSystem, SpriteManager *spriteManager, const u16 *fileIdList, int loadCharMode, int loadPlttMode) {
    int i;
    int numGfxResTypes;
    int size;
    GF_2DGfxResHeader *header;
    void *data;
    NARC *narc;

    numGfxResTypes = GF_GFX_RES_TYPE_MAX;

    if (spriteSystem == NULL || spriteManager == NULL) {
        return FALSE;
    }
    if (fileIdList[GF_GFX_RES_TYPE_MCEL] == 0xFFFF) {
        numGfxResTypes = GF_GFX_RES_TYPE_MAX - 2;
    }
    spriteManager->numGfxResObjectTypes = numGfxResTypes;
    size = GF2DGfxResHeader_sizeof();
    spriteManager->_2dGfxResHeader = AllocFromHeap(spriteSystem->heapId, size * numGfxResTypes);
    narc = NARC_New(NARC_data_resdat, spriteSystem->heapId);

    for (i = 0; i < numGfxResTypes; ++i) {
        header = GF2DGfxResHeader_GetByIndex(spriteManager->_2dGfxResHeader, i);
        data = GfGfxLoader_LoadFromOpenNarc(narc, fileIdList[i], FALSE, spriteSystem->heapId, TRUE);
        GF2DGfxResHeader_Init((GF_2DGfxResHeaderNarcList *)data, header, spriteSystem->heapId);
        FreeToHeap(data);
    }
    for (i = 0; i < numGfxResTypes; ++i) {
        header = GF2DGfxResHeader_GetByIndex(spriteManager->_2dGfxResHeader, i);
        size = GF2dGfxResHeader_GetNumObjects(header);
        spriteManager->_2dGfxResMan[i] = Create2DGfxResObjMan(size, (GfGfxResType)i, spriteSystem->heapId);
    }
    for (i = 0; i < numGfxResTypes; ++i) {
        header = GF2DGfxResHeader_GetByIndex(spriteManager->_2dGfxResHeader, i);
        size = GF2dGfxResHeader_GetNumObjects(header);
        spriteManager->_2dGfxResObjList[i] = Create2DGfxResObjList(size, spriteSystem->heapId);
        spriteManager->numGfxResObjects[i] = LoadAll2DGfxResObjsFromHeader(spriteManager->_2dGfxResMan[i], header, spriteManager->_2dGfxResObjList[i], spriteSystem->heapId);
    }
    switch (loadCharMode) {
    case 0:
        sub_0200ADE4(spriteManager->_2dGfxResObjList[GF_GFX_RES_TYPE_CHAR]);
        break;
    case 1:
        sub_0200AE58(spriteManager->_2dGfxResObjList[GF_GFX_RES_TYPE_CHAR]);
        break;
    case 2:
    default:
        sub_0200AD30(spriteManager->_2dGfxResObjList[GF_GFX_RES_TYPE_CHAR]);
        break;
    }
    switch (loadPlttMode) {
    case 0:
        sub_0200B050(spriteManager->_2dGfxResObjList[GF_GFX_RES_TYPE_PLTT]);
        break;
    case 1:
    default:
        sub_0200AFD8(spriteManager->_2dGfxResObjList[GF_GFX_RES_TYPE_PLTT]);
        break;
    }
    data = GfGfxLoader_LoadFromOpenNarc(narc, fileIdList[6], FALSE, spriteSystem->heapId, TRUE);
    spriteManager->spriteHeaderList = SpriteResourceHeaderList_Create(
        (struct ResdatNarcEntry *)data,
        spriteSystem->heapId,
        spriteManager->_2dGfxResMan[GF_GFX_RES_TYPE_CHAR],
        spriteManager->_2dGfxResMan[GF_GFX_RES_TYPE_PLTT],
        spriteManager->_2dGfxResMan[GF_GFX_RES_TYPE_CELL],
        spriteManager->_2dGfxResMan[GF_GFX_RES_TYPE_ANIM],
        spriteManager->_2dGfxResMan[GF_GFX_RES_TYPE_MCEL],
        spriteManager->_2dGfxResMan[GF_GFX_RES_TYPE_MANM]);
    FreeToHeap(data);
    NARC_Delete(narc);
    return TRUE;
}

BOOL sub_0200D294(SpriteSystem *spriteSystem, SpriteManager *spriteManager, const u16 *fileIdList) {
    return SpriteSystem_LoadResourceDataFromFilepaths(spriteSystem, spriteManager, fileIdList, 2, 1);
}

BOOL sub_0200D2A4(SpriteSystem *spriteSystem, SpriteManager *spriteManager, const u16 *fileIdList, int loadCharMode, int loadPlttMode) {
    return SpriteSystem_LoadResourceDataFromFilepaths(spriteSystem, spriteManager, fileIdList, loadCharMode, loadPlttMode);
}

Sprite *SpriteSystem_CreateSpriteFromResourceHeader(SpriteSystem *spriteSystem, SpriteManager *spriteManager, const UnkStruct_0200D2B4 *template) {
    return CreateSpriteFromResourceHeader(spriteSystem, spriteManager, template->resourceSet, template->x, template->y, template->x /* typo? */, template->animSeqNo, template->rotation, template->palIndex, template->whichScreen, template->unk_18, template->unk_1C, template->unk_20, template->unk_24);
}

static Sprite *CreateSpriteFromResourceHeader(SpriteSystem *spriteSystem, SpriteManager *spriteManager, int headerIndex, s16 x, s16 y, s16 z, u16 animSeqNo, int priority, int palIndex, NNS_G2D_VRAM_TYPE whichScreen, int a10, int a11, int a12, int a13) {
    Sprite *ret = NULL;
    SpriteTemplate template;

    template.spriteList = spriteManager->spriteList;
    template.header = &spriteManager->spriteHeaderList->headers[headerIndex];

    template.position.x = FX32_CONST(x);
    template.position.y = FX32_CONST(y);
    template.position.z = FX32_CONST(z);

    if (whichScreen == NNS_G2D_VRAM_TYPE_2DSUB) {
        template.position.y += FX32_CONST(GX_LCD_SIZE_Y);
    }
    template.scale.x = FX32_ONE;
    template.scale.y = FX32_ONE;
    template.scale.z = FX32_ONE;
    template.rotation = 0;
    template.priority = priority;
    template.whichScreen = whichScreen;
    template.heapId = spriteSystem->heapId;
    ret = Sprite_CreateAffine(&template);
    if (ret != NULL) {
        Sprite_SetAnimCtrlSeq(ret, animSeqNo);
        switch (a10) {
        case 0:
            Sprite_SetPaletteOverride(ret, palIndex);
            break;
        case 1:
            break;
        case 2:
            Sprite_SetPalIndexRespectVramOffset(ret, palIndex);
            break;
        }
    }
    return ret;
}

BOOL SpriteSystem_InitManagerWithCapacities(SpriteSystem *spriteSystem, SpriteManager *spriteManager, SpriteResourceCountsListUnion *countsArray) {
    int i, j;
    int numGfxResTypes = GF_GFX_RES_TYPE_MAX;
    int num;

    if (spriteSystem == NULL || spriteManager == NULL) {
        return FALSE;
    }
    if (countsArray->numMcel == 0 || countsArray->numManm == 0) {
        numGfxResTypes = GF_GFX_RES_TYPE_MAX - 2;
    }
    spriteManager->numGfxResObjectTypes = numGfxResTypes;

    for (i = 0; i < numGfxResTypes; ++i) {
        spriteManager->_2dGfxResMan[i] = Create2DGfxResObjMan(countsArray->asArray[i], (GfGfxResType)i, spriteSystem->heapId);
    }

    for (i = 0; i < numGfxResTypes; ++i) {
        num = countsArray->asArray[i];
        if (num == 0) {
            continue;
        }
        spriteManager->_2dGfxResObjList[i] = Create2DGfxResObjList(num, spriteSystem->heapId);
        spriteManager->numGfxResObjects[i] = 0;
        for (j = 0; j < spriteManager->_2dGfxResObjList[i]->max; ++j) {
            spriteManager->_2dGfxResObjList[i]->obj[j] = NULL;
        }
    }
    return TRUE;
}

BOOL SpriteSystem_LoadCharResObj(SpriteSystem *spriteSystem, SpriteManager *spriteManager, NarcId narcId, int fileId, BOOL compressed, NNS_G2D_VRAM_TYPE vram, int resId) {
    if (!GF2DGfxResObjExistsById(spriteManager->_2dGfxResMan[GF_GFX_RES_TYPE_CHAR], resId)) {
        return FALSE;
    }
    SpriteResource *obj = AddCharResObjFromNarc(spriteManager->_2dGfxResMan[GF_GFX_RES_TYPE_CHAR], narcId, fileId, compressed, resId, vram, spriteSystem->heapId);
    if (obj != NULL) {
        sub_0200ADA4(obj);
        RegisterLoadedResources(spriteManager->_2dGfxResObjList[GF_GFX_RES_TYPE_CHAR], obj);
        return TRUE;
    }
    GF_ASSERT(0);
    return obj != NULL;
}

BOOL SpriteSystem_LoadCharResObjFromOpenNarc(SpriteSystem *spriteSystem, SpriteManager *spriteManager, NARC *narc, int fileId, BOOL compressed, NNS_G2D_VRAM_TYPE vram, int resId) {
    if (!GF2DGfxResObjExistsById(spriteManager->_2dGfxResMan[GF_GFX_RES_TYPE_CHAR], resId)) {
        return FALSE;
    }
    SpriteResource *obj = AddCharResObjFromOpenNarc(spriteManager->_2dGfxResMan[GF_GFX_RES_TYPE_CHAR], narc, fileId, compressed, resId, vram, spriteSystem->heapId);
    if (obj != NULL) {
        sub_0200ADA4(obj);
        RegisterLoadedResources(spriteManager->_2dGfxResObjList[GF_GFX_RES_TYPE_CHAR], obj);
        return TRUE;
    }
    GF_ASSERT(0);
    return obj != NULL;
}

s8 SpriteSystem_LoadPlttResObj(SpriteSystem *spriteSystem, SpriteManager *spriteManager, NarcId narcId, int fileId, BOOL compressed, int pltt_num, NNS_G2D_VRAM_TYPE vram, int resId) {
    if (!GF2DGfxResObjExistsById(spriteManager->_2dGfxResMan[GF_GFX_RES_TYPE_PLTT], resId)) {
        return -1;
    }
    SpriteResource *obj = AddPlttResObjFromNarc(spriteManager->_2dGfxResMan[GF_GFX_RES_TYPE_PLTT], narcId, fileId, compressed, resId, vram, pltt_num, spriteSystem->heapId);
    if (obj != NULL) {
        GF_ASSERT(sub_0200B00C(obj) == TRUE);
        RegisterLoadedResources(spriteManager->_2dGfxResObjList[GF_GFX_RES_TYPE_PLTT], obj);
        return SpriteTransfer_GetPlttOffset(obj, vram);
    }
    GF_ASSERT(0);
    return -1;
}

s8 SpriteSystem_LoadPlttResObjFromOpenNarc(SpriteSystem *spriteSystem, SpriteManager *spriteManager, NARC *narc, int fileId, BOOL compressed, int pltt_num, NNS_G2D_VRAM_TYPE vram, int resId) {
    if (!GF2DGfxResObjExistsById(spriteManager->_2dGfxResMan[GF_GFX_RES_TYPE_PLTT], resId)) {
        return -1;
    }
    SpriteResource *obj = AddPlttResObjFromOpenNarc(spriteManager->_2dGfxResMan[GF_GFX_RES_TYPE_PLTT], narc, fileId, compressed, resId, vram, pltt_num, spriteSystem->heapId);
    if (obj != NULL) {
        GF_ASSERT(sub_0200B00C(obj) == TRUE);
        RegisterLoadedResources(spriteManager->_2dGfxResObjList[GF_GFX_RES_TYPE_PLTT], obj);
        return SpriteTransfer_GetPlttOffset(obj, vram);
    }
    GF_ASSERT(0);
    return -1;
}

u8 SpriteSystem_LoadPaletteBuffer(PaletteData *plttData, PaletteBufferId bufferId, SpriteSystem *spriteSystem, SpriteManager *spriteManager, NarcId narcId, int fileId, BOOL compressed, int pltt_num, NNS_G2D_VRAM_TYPE vram, int resId) {
    int ret = SpriteSystem_LoadPlttResObj(spriteSystem, spriteManager, narcId, fileId, compressed, pltt_num, vram, resId);
    if (ret != -1) {
        PaletteData_LoadPaletteSlotFromHardware(plttData, bufferId, ret * 16, pltt_num * 32);
    }
    return ret;
}

u8 SpriteSystem_LoadPaletteBufferFromOpenNarc(PaletteData *plttData, PaletteBufferId bufferId, SpriteSystem *spriteSystem, SpriteManager *spriteManager, NARC *narc, int fileId, BOOL compressed, int pltt_num, NNS_G2D_VRAM_TYPE vram, int resId) {
    int ret = SpriteSystem_LoadPlttResObjFromOpenNarc(spriteSystem, spriteManager, narc, fileId, compressed, pltt_num, vram, resId);
    if (ret != -1) {
        PaletteData_LoadPaletteSlotFromHardware(plttData, bufferId, ret * 16, pltt_num * 32);
    }
    return ret;
}

BOOL SpriteSystem_LoadCellResObj(SpriteSystem *spriteSystem, SpriteManager *spriteManager, NarcId narcId, int fileId, BOOL compressed, int resId) {
    return LoadResObjInternal(spriteSystem, spriteManager, narcId, fileId, compressed, GF_GFX_RES_TYPE_CELL, resId);
}

BOOL SpriteSystem_LoadCellResObjFromOpenNarc(SpriteSystem *spriteSystem, SpriteManager *spriteManager, NARC *narc, int fileId, BOOL compressed, int resId) {
    return LoadResObjFromNarcInternal(spriteSystem, spriteManager, narc, fileId, compressed, GF_GFX_RES_TYPE_CELL, resId);
}

BOOL SpriteSystem_LoadAnimResObj(SpriteSystem *spriteSystem, SpriteManager *spriteManager, NarcId narcId, int fileId, BOOL compressed, int resId) {
    return LoadResObjInternal(spriteSystem, spriteManager, narcId, fileId, compressed, GF_GFX_RES_TYPE_ANIM, resId);
}

BOOL SpriteSystem_LoadAnimResObjFromOpenNarc(SpriteSystem *spriteSystem, SpriteManager *spriteManager, NARC *narc, int fileId, BOOL compressed, int resId) {
    return LoadResObjFromNarcInternal(spriteSystem, spriteManager, narc, fileId, compressed, GF_GFX_RES_TYPE_ANIM, resId);
}

ManagedSprite *SpriteSystem_NewSprite(SpriteSystem *spriteSystem, SpriteManager *spriteManager, const UnkTemplate_0200D748 *template) {
    return SpriteSystem_NewSpriteInternal(spriteSystem, spriteManager, template, FX32_CONST(GX_LCD_SIZE_Y));
}

ManagedSprite *SpriteSystem_NewSpriteWithYOffset(SpriteSystem *spriteSystem, SpriteManager *spriteManager, const UnkTemplate_0200D748 *template, fx32 yOffset) {
    return SpriteSystem_NewSpriteInternal(spriteSystem, spriteManager, template, yOffset);
}

static ManagedSprite *SpriteSystem_NewSpriteInternal(SpriteSystem *spriteSystem, SpriteManager *spriteManager, const UnkTemplate_0200D748 *unkTemplate, fx32 yOffset) {
    int i;
    int paletteOffset;
    ManagedSprite *ret = AllocFromHeap(spriteSystem->heapId, sizeof(ManagedSprite));
    SpriteTemplate spriteTemplate;
    int resIdList[GF_GFX_RES_TYPE_MAX];

    if (ret == NULL) {
        return NULL;
    }
    ret->spriteResourceHeaderList = AllocFromHeap(spriteSystem->heapId, sizeof(SpriteResourceHeaderList));
    if (ret->spriteResourceHeaderList == NULL) {
        return NULL;
    }
    ret->spriteResourceHeaderList->headers = AllocFromHeap(spriteSystem->heapId, sizeof(SpriteResourcesHeader));
    ret->spriteResourcesHeader = ret->spriteResourceHeaderList->headers;
    if (ret->spriteResourceHeaderList->headers == NULL) {
        if (ret->spriteResourceHeaderList != NULL) { // always true
            FreeToHeap(ret->spriteResourceHeaderList);
        }
        return NULL; // leaks 16 bytes
    }
    for (i = 0; i < GF_GFX_RES_TYPE_MAX; ++i) {
        resIdList[i] = unkTemplate->resIdList[i];
    }
    if (spriteManager->_2dGfxResMan[GF_GFX_RES_TYPE_MCEL] == NULL || spriteManager->_2dGfxResMan[GF_GFX_RES_TYPE_MANM] == NULL) {
        resIdList[GF_GFX_RES_TYPE_MCEL] = -1;
        resIdList[GF_GFX_RES_TYPE_MANM] = -1;
    } else {
        if (resIdList[GF_GFX_RES_TYPE_MCEL] != -1 && !GF2DGfxResObjExistsById(spriteManager->_2dGfxResMan[GF_GFX_RES_TYPE_MCEL], resIdList[GF_GFX_RES_TYPE_MCEL])) {
            resIdList[GF_GFX_RES_TYPE_MCEL] = -1;
        }
        if (resIdList[GF_GFX_RES_TYPE_MANM] != -1 && !GF2DGfxResObjExistsById(spriteManager->_2dGfxResMan[GF_GFX_RES_TYPE_MANM], resIdList[GF_GFX_RES_TYPE_MANM])) {
            resIdList[GF_GFX_RES_TYPE_MANM] = -1;
        }
    }
    CreateSpriteResourcesHeader(
        ret->spriteResourcesHeader,
        resIdList[GF_GFX_RES_TYPE_CHAR],
        resIdList[GF_GFX_RES_TYPE_PLTT],
        resIdList[GF_GFX_RES_TYPE_CELL],
        resIdList[GF_GFX_RES_TYPE_ANIM],
        resIdList[GF_GFX_RES_TYPE_MCEL],
        resIdList[GF_GFX_RES_TYPE_MANM],
        unkTemplate->vramTransfer,
        unkTemplate->bgPriority,
        spriteManager->_2dGfxResMan[GF_GFX_RES_TYPE_CHAR],
        spriteManager->_2dGfxResMan[GF_GFX_RES_TYPE_PLTT],
        spriteManager->_2dGfxResMan[GF_GFX_RES_TYPE_CELL],
        spriteManager->_2dGfxResMan[GF_GFX_RES_TYPE_ANIM],
        spriteManager->_2dGfxResMan[GF_GFX_RES_TYPE_MCEL],
        spriteManager->_2dGfxResMan[GF_GFX_RES_TYPE_MANM]);

    spriteTemplate.spriteList = spriteManager->spriteList;
    spriteTemplate.header = ret->spriteResourcesHeader;
    spriteTemplate.position.x = FX32_CONST(unkTemplate->x);
    spriteTemplate.position.y = FX32_CONST(unkTemplate->y);
    spriteTemplate.position.z = FX32_CONST(unkTemplate->z);
    if (unkTemplate->vram == NNS_G2D_VRAM_TYPE_2DSUB) {
        spriteTemplate.position.y += yOffset;
    }
    spriteTemplate.scale.x = FX32_ONE;
    spriteTemplate.scale.y = FX32_ONE;
    spriteTemplate.scale.z = FX32_ONE;
    spriteTemplate.rotation = 0;
    spriteTemplate.priority = unkTemplate->spritePriority;
    spriteTemplate.whichScreen = unkTemplate->vram;
    spriteTemplate.heapId = spriteSystem->heapId;
    ret->sprite = Sprite_CreateAffine(&spriteTemplate);
    ret->vramTransfer = unkTemplate->vramTransfer;
    if (ret->sprite != NULL) {
        Sprite_SetAnimCtrlSeq(ret->sprite, unkTemplate->animation);
        if (unkTemplate->pal != 0xFFFF) {
            paletteOffset = Sprite_GetPalIndex(ret->sprite);
            Sprite_SetPaletteOverride(ret->sprite, paletteOffset + unkTemplate->pal);
        }
    } else {
        GF_ASSERT(0);
    }
    return ret;
}

NNSG2dImagePaletteProxy *SpriteManager_FindPlttResourceProxy(SpriteManager *spriteManager, int id) {
    return SpriteTransfer_GetPaletteProxy(SpriteResourceCollection_Find(spriteManager->_2dGfxResMan[GF_GFX_RES_TYPE_PLTT], id), NULL);
}

int SpriteManager_FindPlttResourceOffset(SpriteManager *spriteManager, int id, NNS_G2D_VRAM_TYPE vram) {
    return SpriteTransfer_GetPlttOffset(SpriteResourceCollection_Find(spriteManager->_2dGfxResMan[GF_GFX_RES_TYPE_PLTT], id), vram);
}

BOOL SpriteManager_UnloadCharObjById(SpriteManager *spriteManager, u32 character) {
    return UnregisterLoadedCharResources(spriteManager->_2dGfxResMan[GF_GFX_RES_TYPE_CHAR], spriteManager->_2dGfxResObjList[GF_GFX_RES_TYPE_CHAR], character);
}

BOOL SpriteManager_UnloadPlttObjById(SpriteManager *spriteManager, u32 pal) {
    return UnregisterLoadedPlttResources(spriteManager->_2dGfxResMan[GF_GFX_RES_TYPE_PLTT], spriteManager->_2dGfxResObjList[GF_GFX_RES_TYPE_PLTT], pal);
}

BOOL SpriteManager_UnloadCellObjById(SpriteManager *spriteManager, u32 cell) {
    return UnregisterLoadedResources(spriteManager->_2dGfxResMan[GF_GFX_RES_TYPE_CELL], spriteManager->_2dGfxResObjList[GF_GFX_RES_TYPE_CELL], cell);
}

BOOL SpriteManager_UnloadAnimObjById(SpriteManager *spriteManager, u32 animation) {
    return UnregisterLoadedResources(spriteManager->_2dGfxResMan[GF_GFX_RES_TYPE_ANIM], spriteManager->_2dGfxResObjList[GF_GFX_RES_TYPE_ANIM], animation);
}

void SpriteSystem_FreeResourcesAndManager(SpriteSystem *spriteSystem, SpriteManager *spriteManager) {
    int i;

    SpriteSystem_DeleteSpriteList(spriteManager);
    sub_0200AED4(spriteManager->_2dGfxResObjList[GF_GFX_RES_TYPE_CHAR]);
    sub_0200B0CC(spriteManager->_2dGfxResObjList[GF_GFX_RES_TYPE_PLTT]);

    for (i = 0; i < spriteManager->numGfxResObjectTypes; ++i) {
        Delete2DGfxResObjList(spriteManager->_2dGfxResObjList[i]);
        Destroy2DGfxResObjMan(spriteManager->_2dGfxResMan[i]);
    }
    SpriteSystem_FreeSpriteManager(spriteSystem, spriteManager);
}

void Sprite_DeleteAndFreeResources(ManagedSprite *managedSprite) {
    if (managedSprite->vramTransfer) {
        sub_0200AF80(managedSprite->spriteResourcesHeader->imageProxy);
    }
    Sprite_Delete(managedSprite->sprite);
    SpriteResourceHeaderList_Destroy(managedSprite->spriteResourceHeaderList);
    FreeToHeap(managedSprite);
}

static BOOL LoadResObjInternal(SpriteSystem *spriteSystem, SpriteManager *spriteManager, NarcId narcId, int fileId, BOOL compressed, GfGfxResType a6, int resId) {
    if (!GF2DGfxResObjExistsById(spriteManager->_2dGfxResMan[a6], resId)) {
        return FALSE;
    }
    SpriteResource *data = AddCellOrAnimResObjFromNarc(spriteManager->_2dGfxResMan[a6], narcId, fileId, compressed, resId, a6, spriteSystem->heapId);
    if (data != NULL) {
        BOOL result = RegisterLoadedResources(spriteManager->_2dGfxResObjList[a6], data);
        GF_ASSERT(result == TRUE);
        return result;
    }
    GF_ASSERT(0);
    return data != NULL;
}

static BOOL LoadResObjFromNarcInternal(SpriteSystem *spriteSystem, SpriteManager *spriteManager, NARC *narc, int fileId, BOOL compressed, GfGfxResType a6, int resId) {
    if (!GF2DGfxResObjExistsById(spriteManager->_2dGfxResMan[a6], resId)) {
        return FALSE;
    }
    SpriteResource *data = AddCellOrAnimResObjFromOpenNarc(spriteManager->_2dGfxResMan[a6], narc, fileId, compressed, resId, a6, spriteSystem->heapId);
    if (data != NULL) {
        BOOL result = RegisterLoadedResources(spriteManager->_2dGfxResObjList[a6], data);
        GF_ASSERT(result == TRUE);
        return result;
    }
    GF_ASSERT(0);
    return data != NULL;
}

static BOOL RegisterLoadedResources(GF_2DGfxResObjList *list, SpriteResource *obj) {
    for (int i = 0; i < list->max; ++i) {
        if (list->obj[i] == NULL) {
            list->obj[i] = obj;
            ++list->num;
            return TRUE;
        }
    }
    return FALSE;
}

static BOOL UnregisterLoadedResources(GF_2DGfxResMan *manager, GF_2DGfxResObjList *list, u32 cellOrAnimId) {
    for (int i = 0; i < list->max; ++i) {
        if (list->obj[i] != NULL) {
            u32 test_id = GF2DGfxResObj_GetResID(list->obj[i]);
            if (test_id == cellOrAnimId) {
                DestroySingle2DGfxResObj(manager, list->obj[i]);
                list->obj[i] = NULL;
                --list->num;
                return TRUE;
            }
        }
    }
    return FALSE;
}

static BOOL UnregisterLoadedCharResources(GF_2DGfxResMan *manager, GF_2DGfxResObjList *list, u32 charId) {
    for (int i = 0; i < list->max; ++i) {
        if (list->obj[i] != NULL) {
            u32 test_id = GF2DGfxResObj_GetResID(list->obj[i]);
            if (test_id == charId) {
                ObjCharTransfer_ResetTransferTasksByResID(charId);
                DestroySingle2DGfxResObj(manager, list->obj[i]);
                list->obj[i] = NULL;
                --list->num;
                return TRUE;
            }
        }
    }
    return FALSE;
}

static BOOL UnregisterLoadedPlttResources(GF_2DGfxResMan *manager, GF_2DGfxResObjList *list, u32 plttId) {
    for (int i = 0; i < list->max; ++i) {
        if (list->obj[i] != NULL) {
            u32 test_id = GF2DGfxResObj_GetResID(list->obj[i]);
            if (test_id == plttId) {
                ObjPlttTransfer_FreeTaskByID(plttId);
                DestroySingle2DGfxResObj(manager, list->obj[i]);
                list->obj[i] = NULL;
                --list->num;
                return TRUE;
            }
        }
    }
    return FALSE;
}

void Sprite_TickFrame(Sprite *sprite) {
    Sprite_UpdateAnim(sprite, FX32_ONE);
}

void ManagedSprite_TickFrame(ManagedSprite *managedSprite) {
    Sprite_TickFrame(managedSprite->sprite);
}

void ManagedSprite_TickTwoFrames(ManagedSprite *managedSprite) {
    Sprite_UpdateAnim(managedSprite->sprite, 2 * FX32_ONE);
}

void ManagedSprite_TickNFrames(ManagedSprite *managedSprite, fx32 frames) {
    Sprite_UpdateAnim(managedSprite->sprite, frames);
}

u32 ManagedSprite_GetNumFrames(ManagedSprite *managedSprite) {
    return Sprite_GetNumAnimSeqs(managedSprite->sprite);
}

void ManagedSprite_SetAnim(ManagedSprite *managedSprite, int seqno) {
    Sprite_SetAnimCtrlSeq(managedSprite->sprite, seqno);
}

void ManagedSprite_SetAnimNoRestart(ManagedSprite *managedSprite, int a1) {
    Sprite_TryChangeAnimSeq(managedSprite->sprite, a1);
}

u16 ManagedSprite_GetActiveAnim(ManagedSprite *managedSprite) {
    return Sprite_GetAnimationNumber(managedSprite->sprite);
}

void thunk_Sprite_SetAnimationFlag(Sprite *sprite, int a1) {
    Sprite_SetAnimActiveFlag(sprite, a1);
}

void ManagedSprite_SetAnimateFlag(ManagedSprite *managedSprite, int a1) {
    thunk_Sprite_SetAnimationFlag(managedSprite->sprite, a1);
}

void thunk_Sprite_SetAnimationSpeed(Sprite *sprite, fx32 speed) {
    Sprite_SetAnimSpeed(sprite, speed);
}

void ManagedSprite_SetAnimSpeed(ManagedSprite *managedSprite, fx32 speed) {
    thunk_Sprite_SetAnimationSpeed(managedSprite->sprite, speed);
}

BOOL thunk_Sprite_IsAnimated(Sprite *sprite) {
    return Sprite_IsAnimated(sprite);
}

BOOL ManagedSprite_IsAnimated(ManagedSprite *managedSprite) {
    return thunk_Sprite_IsAnimated(managedSprite->sprite);
}

void ManagedSprite_ResetSpriteAnimCtrlState(ManagedSprite *managedSprite) {
    Sprite_ResetAnimCtrlState(managedSprite->sprite);
}

void thunk_Sprite_SetAnimationFrame(Sprite *sprite, u16 frameIndex) {
    Sprite_SetAnimationFrame(sprite, frameIndex);
}

void ManagedSprite_SetAnimationFrame(ManagedSprite *managedSprite, u16 frameIndex) {
    thunk_Sprite_SetAnimationFrame(managedSprite->sprite, frameIndex);
}

u16 thunk_Sprite_GetAnimationFrame(Sprite *sprite) {
    return Sprite_GetAnimationFrame(sprite);
}

u16 ManagedSprite_GetAnimationFrame(ManagedSprite *managedSprite) {
    return thunk_Sprite_GetAnimationFrame(managedSprite->sprite);
}

void thunk_Sprite_SetDrawFlag(Sprite *sprite, int flag) {
    Sprite_SetDrawFlag(sprite, flag);
}

void ManagedSprite_SetDrawFlag(ManagedSprite *managedSprite, int flag) {
    thunk_Sprite_SetDrawFlag(managedSprite->sprite, flag);
}

BOOL thunk_Sprite_GetDrawFlag(Sprite *sprite) {
    return Sprite_GetDrawFlag(sprite);
}

BOOL ManagedSprite_GetDrawFlag(ManagedSprite *a0) {
    return thunk_Sprite_GetDrawFlag(a0->sprite);
}

void thunk_Sprite_SetPaletteOverride(Sprite *sprite, int a1) {
    Sprite_SetPaletteOverride(sprite, a1);
}

void ManagedSprite_SetPaletteOverride(ManagedSprite *managedSprite, int a1) {
    thunk_Sprite_SetPaletteOverride(managedSprite->sprite, a1);
}

void thunk_Sprite_SetPaletteOffset(Sprite *sprite, u8 a1) {
    Sprite_SetPalOffset(sprite, a1);
}

void ManagedSprite_SetPaletteOverrideOffset(ManagedSprite *managedSprite, u8 a1) {
    thunk_Sprite_SetPaletteOffset(managedSprite->sprite, a1);
}

u8 ManagedSprite_GetPaletteOverrideOffset(ManagedSprite *managedSprite) {
    return Sprite_GetPalOffset(managedSprite->sprite);
}

void thunk_Sprite_SetPriority(Sprite *sprite, int a1) {
    Sprite_SetPriority(sprite, a1);
}

int ManagedSprite_GetPriority(ManagedSprite *managedSprite) {
    return Sprite_GetPriority(managedSprite->sprite);
}

void ManagedSprite_SetPriority(ManagedSprite *managedSprite, int a1) {
    thunk_Sprite_SetPriority(managedSprite->sprite, a1);
}

void thunk_Sprite_SetDrawPriority(Sprite *sprite, u16 a1) {
    Sprite_SetDrawPriority(sprite, a1);
}

void ManagedSprite_SetDrawPriority(ManagedSprite *managedSprite, u16 a1) {
    thunk_Sprite_SetDrawPriority(managedSprite->sprite, a1);
}

u16 thunk_Sprite_GetDrawPriority(Sprite *sprite) {
    return Sprite_GetDrawPriority(sprite);
}

u16 ManagedSprite_GetDrawPriority(ManagedSprite *managedSprite) {
    return thunk_Sprite_GetDrawPriority(managedSprite->sprite);
}

void Sprite_SetPositionXY(Sprite *sprite, s16 x, s16 y) {
    VecFx32 vec;

    vec.x = x * FX32_ONE;
    vec.y = y * FX32_ONE;
    if (Sprite_GetVramType(sprite) == NNS_G2D_VRAM_TYPE_2DSUB) {
        vec.y += GX_LCD_SIZE_Y * FX32_ONE;
    }
    vec.z = 0;
    Sprite_SetMatrix(sprite, &vec);
}

void ManagedSprite_SetPositionXY(ManagedSprite *managedSprite, s16 x, s16 y) {
    Sprite_SetPositionXY(managedSprite->sprite, x, y);
}

void Sprite_SetPositionXYWithSubscreenOffset(Sprite *sprite, s16 x, s16 y, fx32 yOffset) {
    VecFx32 vec;

    vec.x = x * FX32_ONE;
    vec.y = y * FX32_ONE;
    if (Sprite_GetVramType(sprite) == NNS_G2D_VRAM_TYPE_2DSUB) {
        vec.y += yOffset;
    }
    vec.z = 0;
    Sprite_SetMatrix(sprite, &vec);
}

void ManagedSprite_SetPositionXYWithSubscreenOffset(ManagedSprite *managedSprite, s16 x, s16 y, fx32 yOffset) {
    Sprite_SetPositionXYWithSubscreenOffset(managedSprite->sprite, x, y, yOffset);
}

void Sprite_GetPositionXY(Sprite *sprite, s16 *x, s16 *y) {
    const VecFx32 *pos = Sprite_GetMatrixPtr(sprite);
    *x = pos->x / FX32_ONE;
    if (Sprite_GetVramType(sprite) == NNS_G2D_VRAM_TYPE_2DSUB) {
        *y = (pos->y - GX_LCD_SIZE_Y * FX32_ONE) / FX32_ONE;
    } else {
        *y = pos->y / FX32_ONE;
    }
}

void ManagedSprite_GetPositionXY(ManagedSprite *managedSprite, s16 *x, s16 *y) {
    Sprite_GetPositionXY(managedSprite->sprite, x, y);
}

void Sprite_GetPositionXY_CustomScreenYOffset(Sprite *sprite, s16 *x, s16 *y, fx32 yOffset) {
    const VecFx32 *pos = Sprite_GetMatrixPtr(sprite);
    *x = pos->x / FX32_ONE;
    if (Sprite_GetVramType(sprite) == NNS_G2D_VRAM_TYPE_2DSUB) {
        *y = (pos->y - yOffset) / FX32_ONE;
    } else {
        *y = pos->y / FX32_ONE;
    }
}

void ManagedSprite_GetPositionXYWithSubscreenOffset(ManagedSprite *managedSprite, s16 *x, s16 *y, fx32 yOffset) {
    Sprite_GetPositionXY_CustomScreenYOffset(managedSprite->sprite, x, y, yOffset);
}

void Sprite_OffsetPositionXY(Sprite *sprite, s16 dx, s16 dy) {
    VecFx32 vec;
    const VecFx32 *pos = Sprite_GetMatrixPtr(sprite);
    vec.x = pos->x + dx * FX32_ONE;
    vec.y = pos->y + dy * FX32_ONE;
    vec.z = pos->z;
    Sprite_SetMatrix(sprite, &vec);
}

void ManagedSprite_OffsetPositionXY(ManagedSprite *managedSprite, s16 dx, s16 dy) {
    Sprite_OffsetPositionXY(managedSprite->sprite, dx, dy);
}

void ManagedSprite_AddSpritePrecisePositionXY(ManagedSprite *managedSprite, fx32 dx, fx32 dy) {
    VecFx32 vec;
    const VecFx32 *pos = Sprite_GetMatrixPtr(managedSprite->sprite);
    vec.x = pos->x + dx;
    vec.y = pos->y + dy;
    vec.z = pos->z;
    Sprite_SetMatrix(managedSprite->sprite, &vec);
}

void ManagedSprite_SetPositonFxXY(ManagedSprite *managedSprite, fx32 x, fx32 y) {
    VecFx32 vec;
    const VecFx32 *pos = Sprite_GetMatrixPtr(managedSprite->sprite);
    vec.x = x;
    vec.y = y;
    vec.z = pos->z;
    Sprite_SetMatrix(managedSprite->sprite, &vec);
}

void ManagedSprite_GetSpritePositionFxXY(ManagedSprite *managedSprite, fx32 *x, fx32 *y) {
    const VecFx32 *pos = Sprite_GetMatrixPtr(managedSprite->sprite);
    *x = pos->x;
    *y = pos->y;
}

void ManagedSprite_SetPositionFxXYWithSubscreenOffset(ManagedSprite *managedSprite, fx32 x, fx32 y, fx32 yOffset) {
    if (Sprite_GetVramType(managedSprite->sprite) == NNS_G2D_VRAM_TYPE_2DSUB) {
        ManagedSprite_SetPositonFxXY(managedSprite, x, y + yOffset);
    } else {
        ManagedSprite_SetPositonFxXY(managedSprite, x, y);
    }
}

void ManagedSprite_GetPositionFxXYWithSubscreenOffset(ManagedSprite *managedSprite, fx32 *x, fx32 *y, fx32 yOffset) {
    ManagedSprite_GetSpritePositionFxXY(managedSprite, x, y);
    if (Sprite_GetVramType(managedSprite->sprite) == NNS_G2D_VRAM_TYPE_2DSUB) {
        *y -= yOffset;
    }
}

void thunk_Sprite_SetAffineOverworldMode(Sprite *sprite, u8 a1) {
    Sprite_SetAffineOverwriteMode(sprite, a1);
}

void ManagedSprite_SetAffineOverwriteMode(ManagedSprite *managedSprite, u8 a1) {
    thunk_Sprite_SetAffineOverworldMode(managedSprite->sprite, a1);
}

void Sprite_SetAffineScaleXY(Sprite *sprite, f32 x, f32 y) {
    VecFx32 *scale = Sprite_GetScalePtr(sprite);
    scale->x = FX_F32_TO_FX32(x);
    scale->y = FX_F32_TO_FX32(y);
    Sprite_SetAffineScale(sprite, scale);
}

void ManagedSprite_SetAffineScale(ManagedSprite *managedSprite, f32 x, f32 y) {
    Sprite_SetAffineScaleXY(managedSprite->sprite, x, y);
}

void Sprite_GetAffineScaleXY(Sprite *sprite, f32 *x, f32 *y) {
    VecFx32 *scale = Sprite_GetScalePtr(sprite);
    *x = FX_FX32_TO_F32(scale->x);
    *y = FX_FX32_TO_F32(scale->y);
}

void ManagedSprite_GetAffineScale(ManagedSprite *managedSprite, f32 *x, f32 *y) {
    Sprite_GetAffineScaleXY(managedSprite->sprite, x, y);
}

void thunk_Sprite_SetAffineZRotation(Sprite *sprite, u16 rotation) {
    Sprite_SetAffineZRotation(sprite, rotation);
}

void ManagedSprite_SetAffineZRotation(ManagedSprite *managedSprite, u16 rotation) {
    thunk_Sprite_SetAffineZRotation(managedSprite->sprite, rotation);
}

void Sprite_OffsetAffineZRotation2(Sprite *sprite, u16 offset) {
    u16 rotation = Sprite_GetRotation(sprite);
    rotation += offset;
    Sprite_SetAffineZRotation(sprite, rotation);
}

void ManagedSprite_OffsetAffineZRotation(ManagedSprite *managedSprite, u16 rotation) {
    Sprite_OffsetAffineZRotation2(managedSprite->sprite, rotation);
}

u16 thunk_Sprite_GetRotation(Sprite *sprite) {
    return Sprite_GetRotation(sprite);
}

u16 ManagedSprite_GetRotation(ManagedSprite *managedSprite) {
    return thunk_Sprite_GetRotation(managedSprite->sprite);
}

void thunk_Sprite_SetFlipMode(Sprite *sprite, u8 a1) {
    Sprite_SetFlipMode(sprite, a1);
}

void ManagedSprite_SetFlipMode(ManagedSprite *managedSprite, u8 a1) {
    thunk_Sprite_SetFlipMode(managedSprite->sprite, a1);
}

void ManagedSprite_SetAffineTranslation(ManagedSprite *managedSprite, s16 x, s16 y) {
    VecFx32 matrix;
    matrix.x = x * FX32_ONE;
    matrix.y = y * FX32_ONE;
    matrix.z = 0;
    Sprite_SetAffineMatrix(managedSprite->sprite, &matrix);
}

void ManagedSprite_SetMosaicFlag(ManagedSprite *managedSprite, BOOL mosaic) {
    Sprite_SetMosaic(managedSprite->sprite, mosaic);
}

void thunk_Sprite_SetOamMode(Sprite *sprite, GXOamMode mode) {
    Sprite_SetOamMode(sprite, mode);
}

void ManagedSprite_SetOamMode(ManagedSprite *managedSprite, GXOamMode mode) {
    thunk_Sprite_SetOamMode(managedSprite->sprite, mode);
}

GXOamMode thunk_Sprite_GetOamMode(Sprite *sprite) {
    return Sprite_GetOamMode(sprite);
}

GXOamMode ManagedSprite_GetOamMode(ManagedSprite *managedSprite) {
    return thunk_Sprite_GetOamMode(managedSprite->sprite);
}

u32 ManagedSprite_GetUserAttrForCurrentAnimFrame(ManagedSprite *managedSprite) {
    return Sprite_GetCurrentAnimFrameExAttr(managedSprite->sprite);
}

BOOL SpriteSystem_LoadCharResObjWithHardwareMappingType(SpriteSystem *spriteSystem, SpriteManager *spriteManager, NarcId narcId, int fileId, BOOL compressed, NNS_G2D_VRAM_TYPE vram, int resId) {
    if (!GF2DGfxResObjExistsById(spriteManager->_2dGfxResMan[GF_GFX_RES_TYPE_CHAR], resId)) {
        return FALSE;
    }
    SpriteResource *obj = AddCharResObjFromNarc(spriteManager->_2dGfxResMan[GF_GFX_RES_TYPE_CHAR], narcId, fileId, compressed, resId, vram, spriteSystem->heapId);
    if (obj != NULL) {
        sub_0200AD64(obj);
        RegisterLoadedResources(spriteManager->_2dGfxResObjList[GF_GFX_RES_TYPE_CHAR], obj);
        return TRUE;
    }
    GF_ASSERT(0);
    return obj != NULL;
}

BOOL SpriteSystem_LoadCharResObjAtEndWithHardwareMappingType(SpriteSystem *spriteSystem, SpriteManager *spriteManager, NarcId narcId, int fileId, BOOL compressed, NNS_G2D_VRAM_TYPE vram, int resId) {
    if (!GF2DGfxResObjExistsById(spriteManager->_2dGfxResMan[GF_GFX_RES_TYPE_CHAR], resId)) {
        return FALSE;
    }
    SpriteResource *obj = AddCharResObjFromNarc(spriteManager->_2dGfxResMan[GF_GFX_RES_TYPE_CHAR], narcId, fileId, compressed, resId, vram, spriteSystem->heapId);
    if (obj != NULL) {
        sub_0200AE18(obj);
        RegisterLoadedResources(spriteManager->_2dGfxResObjList[GF_GFX_RES_TYPE_CHAR], obj);
        return TRUE;
    }
    GF_ASSERT(0);
    return obj != NULL;
}

BOOL SpriteSystem_LoadCharResObjFromOpenNarcWithHardwareMappingType(SpriteSystem *spriteSystem, SpriteManager *spriteManager, NARC *narc, int fileId, BOOL compressed, NNS_G2D_VRAM_TYPE vram, int resId) {
    if (!GF2DGfxResObjExistsById(spriteManager->_2dGfxResMan[GF_GFX_RES_TYPE_CHAR], resId)) {
        return FALSE;
    }
    SpriteResource *obj = AddCharResObjFromOpenNarc(spriteManager->_2dGfxResMan[GF_GFX_RES_TYPE_CHAR], narc, fileId, compressed, resId, vram, spriteSystem->heapId);
    if (obj != NULL) {
        sub_0200AE18(obj);
        RegisterLoadedResources(spriteManager->_2dGfxResObjList[GF_GFX_RES_TYPE_CHAR], obj);
        return TRUE;
    }
    GF_ASSERT(0);
    return obj != NULL;
}

void SpriteSystem_ReplaceCharResObj(SpriteSystem *spriteSystem, SpriteManager *spriteManager, NarcId narcId, int fileId, BOOL compressed, int resId) {
    SpriteResource *obj = SpriteResourceCollection_Find(spriteManager->_2dGfxResMan[GF_GFX_RES_TYPE_CHAR], resId);
    ReplaceCharResObjFromNarc(spriteManager->_2dGfxResMan[GF_GFX_RES_TYPE_CHAR], obj, narcId, fileId, compressed, spriteSystem->heapId);
    sub_0200AE8C(obj);
}

void SpriteSystem_ReplacePlttResObj(SpriteSystem *spriteSystem, SpriteManager *spriteManager, NarcId narcId, int fileId, BOOL compressed, int resId) {
    SpriteResource *obj = SpriteResourceCollection_Find(spriteManager->_2dGfxResMan[GF_GFX_RES_TYPE_PLTT], resId);
    ReplacePlttResObjFromNarc(spriteManager->_2dGfxResMan[GF_GFX_RES_TYPE_PLTT], obj, narcId, fileId, compressed, spriteSystem->heapId);
    sub_0200B084(obj);
}

SpriteList *SpriteManager_GetSpriteList(SpriteManager *spriteManager) {
    return spriteManager->spriteList;
}

void SpriteManager_SetSpriteList(SpriteManager *spriteManager, SpriteList *spriteList) {
    spriteManager->spriteList = spriteList;
}

void sub_0200E2B8(SpriteSystem *spriteSystem, SpriteManager *spriteManager, NARC *narc, int fileId, BOOL compressed, int resId) {
    SpriteResource *obj = SpriteResourceCollection_Find(spriteManager->_2dGfxResMan[GF_GFX_RES_TYPE_CHAR], resId);
    ReplaceCharResObjFromOpenNarc(spriteManager->_2dGfxResMan[GF_GFX_RES_TYPE_CHAR], obj, narc, fileId, compressed, spriteSystem->heapId);
    sub_0200AE8C(obj);
}

void sub_0200E2EC(SpriteSystem *spriteSystem, SpriteManager *spriteManager, NARC *narc, int fileId, BOOL compressed, int resId) {
    SpriteResource *obj = SpriteResourceCollection_Find(spriteManager->_2dGfxResMan[GF_GFX_RES_TYPE_PLTT], resId);
    ReplacePlttResObjFromOpenNarc(spriteManager->_2dGfxResMan[GF_GFX_RES_TYPE_PLTT], obj, narc, fileId, compressed, spriteSystem->heapId);
    sub_0200B084(obj);
}
