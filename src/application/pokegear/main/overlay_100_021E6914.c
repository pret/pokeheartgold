#include "application/pokegear/pgear_gra.naix"
#include "application/pokegear/pokegear_internal.h"
#include "data/resdat.naix"

#include "math_util.h"
#include "unk_0200ACF0.h"
#include "unk_0200B150.h"
#include "vram_transfer_manager.h"

typedef struct PokegearObjResSpec {
    u32 maxSprites;
    const OamManagerParam *oamManagerParam;
    const OamCharTransferParam *oamCharTransferParam;
    const u16 *resIdList;
} PokegearObjResSpec;

static void PokegearUIManager_LoadInitialGfx(PokegearUIManager *uiManager, u16 skin);
static void PokegearUIManager_UnloadSprites(PokegearUIManager *uiManager);
static void PokegearUIManager_LoadInitialSkinGfx(PokegearUIManager *uiManager, u16 skin);

static const OamManagerParam sOamManagerParam = {
    .fromOBJmain = 0x00,
    .numOBJmain = 0x80,
    .fromAffineMain = 0x00,
    .numAffineMain = 0x20,
    .fromOBJsub = 0x00,
    .numOBJsub = 0x80,
    .fromAffineSub = 0x00,
    .numAffineSub = 0x20,
};

static const OamCharTransferParam sOamCharTransferParam = {
    .maxTasks = 0x00000040,
    .sizeMain = 0x00010000,
    .sizeSub = 0x00004000,
    .charModeMain = GX_OBJVRAMMODE_CHAR_1D_32K,
    .charModeSub = GX_OBJVRAMMODE_CHAR_1D_32K,
};

static const u16 sResList_Map[] = {
    NARC_resdat_resdat_00000034_bin,
    NARC_resdat_resdat_00000035_bin,
    NARC_resdat_resdat_00000033_bin,
    NARC_resdat_resdat_00000032_bin,
    0xFFFF,
    0xFFFF,
    NARC_resdat_resdat_00000080_bin,
};
static const u16 sResList_Configure[] = {
    NARC_resdat_resdat_00000042_bin,
    NARC_resdat_resdat_00000043_bin,
    NARC_resdat_resdat_00000041_bin,
    NARC_resdat_resdat_00000040_bin,
    0xFFFF,
    0xFFFF,
    NARC_resdat_resdat_00000082_bin,
};
static const u16 sResList_Phone[] = {
    NARC_resdat_resdat_00000046_bin,
    NARC_resdat_resdat_00000047_bin,
    NARC_resdat_resdat_00000045_bin,
    NARC_resdat_resdat_00000044_bin,
    0xFFFF,
    0xFFFF,
    NARC_resdat_resdat_00000083_bin,
};
static const u16 sResList_Radio[] = {
    NARC_resdat_resdat_00000038_bin,
    NARC_resdat_resdat_00000039_bin,
    NARC_resdat_resdat_00000037_bin,
    NARC_resdat_resdat_00000036_bin,
    0xFFFF,
    0xFFFF,
    NARC_resdat_resdat_00000081_bin,
};

// clang-format off
static const PokegearObjResSpec sPokegearObjResSpecs[] = {
    [GEAR_APP_CONFIGURE] = { 0x80, &sOamManagerParam, &sOamCharTransferParam, sResList_Configure },
    [GEAR_APP_RADIO]     = { 0x80, &sOamManagerParam, &sOamCharTransferParam, sResList_Radio     },
    [GEAR_APP_MAP]       = { 0xC0, &sOamManagerParam, &sOamCharTransferParam, sResList_Map       },
    [GEAR_APP_PHONE]     = { 0x80, &sOamManagerParam, &sOamCharTransferParam, sResList_Phone     },
    [GEAR_APP_CANCEL]    = { 0x80, &sOamManagerParam, &sOamCharTransferParam, sResList_Map       },
};
// clang-format on

void PokegearApp_CreateSpriteSystem(PokegearAppData *pokegearApp) {
    GF_CreateVramTransferManager(32, pokegearApp->heapID);
    pokegearApp->spriteSystem = SpriteSystem_Alloc(pokegearApp->heapID);
    SpriteSystem_Init(pokegearApp->spriteSystem, sPokegearObjResSpecs[0].oamManagerParam, sPokegearObjResSpecs[0].oamCharTransferParam, 0x20);
    thunk_ClearMainOAM(pokegearApp->heapID);
    thunk_ClearSubOAM(pokegearApp->heapID);
}

void PokegearApp_DestroySpriteSystem(PokegearAppData *pokegearApp) {
    SpriteSystem_Free(pokegearApp->spriteSystem);
    pokegearApp->spriteSystem = NULL;
    GF_DestroyVramTransferManager();
    thunk_ClearMainOAM(pokegearApp->heapID);
    thunk_ClearSubOAM(pokegearApp->heapID);
}

void PokegearApp_CreateSpriteManager(PokegearAppData *pokegearApp, int spriteSet) {
    if (pokegearApp->spriteSystem != NULL) {
        pokegearApp->spriteManager = SpriteManager_New(pokegearApp->spriteSystem);
        SpriteSystem_InitSprites(pokegearApp->spriteSystem, pokegearApp->spriteManager, sPokegearObjResSpecs[spriteSet].maxSprites);
        sub_0200D2A4(pokegearApp->spriteSystem, pokegearApp->spriteManager, sPokegearObjResSpecs[spriteSet].resIdList, 1, 0);
    }
}

void PokegearApp_DestroySpriteManager(PokegearAppData *pokegearApp) {
    if (pokegearApp->spriteManager != NULL) {
        SpriteSystem_DestroySpriteManager(pokegearApp->spriteSystem, pokegearApp->spriteManager);
        pokegearApp->spriteManager = NULL;
    }
}

void PokegearApp_DrawSprites(PokegearAppData *pokegearApp) {
    if (pokegearApp->spriteManager != NULL) {
        SpriteSystem_DrawSprites(pokegearApp->spriteManager);
    }
}

// functions for PokegearUIManager

PokegearUIManager *PokegearUIManager_Create(enum HeapID heapID, u16 spriteCount, u16 resCount, u16 skin, u16 vramType, int mode) {
    PokegearUIManager *ret = Heap_Alloc(heapID, sizeof(PokegearUIManager));
    MI_CpuClear8(ret, sizeof(PokegearUIManager));
    ret->heapID = heapID;
    if (resCount > 4) {
        ret->plttCount = 4;
    } else {
        ret->plttCount = resCount;
    }
    ret->spriteCount = spriteCount;
    ret->vramType = vramType;
    ret->mode = mode;
    PokegearUIManager_LoadInitialGfx(ret, skin);
    return ret;
}

void PokegearUIManager_Delete(PokegearUIManager *uiManager) {
    PokegearUIManager_UnloadSprites(uiManager);
    MI_CpuClear8(uiManager, sizeof(PokegearUIManager));
    Heap_Free(uiManager);
}

void PokegearUIManager_LoadSkinGfx(PokegearUIManager *uiManager, u8 skin) {
    SpriteResource *obj;

    obj = uiManager->spriteResources[GF_GFX_RES_TYPE_CHAR]->obj[0];
    ReplaceCharResObjFromNarc(uiManager->resourceManagers[GF_GFX_RES_TYPE_CHAR], obj, NARC_application_pokegear_pgear_gra, skin + NARC_pgear_gra_pgear_gra_00000006_NCGR, FALSE, uiManager->heapID);
    sub_0200AE8C(obj);

    obj = uiManager->spriteResources[GF_GFX_RES_TYPE_PLTT]->obj[0];
    ReplacePlttResObjFromNarc(uiManager->resourceManagers[GF_GFX_RES_TYPE_PLTT], obj, NARC_application_pokegear_pgear_gra, skin + NARC_pgear_gra_pgear_gra_00000000_NCLR, FALSE, uiManager->heapID);
    sub_0200B084(obj);
}

void PokegearUIManager_AnimateSprites(PokegearUIManager *uiManager) {
    if (uiManager->spriteList != NULL) {
        SpriteList_RenderAndAnimateSprites(uiManager->spriteList);
    }
}

ManagedSprite *PokegearUIManager_CreateSprite(PokegearUIManager *uiManager, u8 x, u8 y, u8 z, u8 priority, u8 drawPriority, u8 index, u8 seq, int isBottomScreen) {
    NNS_G2D_VRAM_TYPE vramType;
    ManagedSprite *ret;
    SpriteTemplate spriteTemplate;

    static const u8 sPlttOverrides[] = { 2, 2, 2, 3, 1, 1, 1, 1 };

    ret = Heap_Alloc(uiManager->heapID, sizeof(ManagedSprite));
    MI_CpuClear8(ret, sizeof(ManagedSprite));
    ret->spriteResourceHeaderList = Heap_Alloc(uiManager->heapID, sizeof(SpriteResourceHeaderList));
    ret->spriteResourceHeaderList->headers = Heap_Alloc(uiManager->heapID, sizeof(SpriteResourcesHeader));
    // ret->spriteResourceHeaderList->num = 1;
    ret->spriteResourcesHeader = ret->spriteResourceHeaderList->headers;
    vramType = isBottomScreen == 0 ? NNS_G2D_VRAM_TYPE_2DMAIN : NNS_G2D_VRAM_TYPE_2DSUB;
    CreateSpriteResourcesHeader(ret->spriteResourcesHeader, 0xE000, 0xE000, 0xE000, 0xE000, -1, -1, 0, priority, uiManager->resourceManagers[GF_GFX_RES_TYPE_CHAR], uiManager->resourceManagers[GF_GFX_RES_TYPE_PLTT], uiManager->resourceManagers[GF_GFX_RES_TYPE_CELL], uiManager->resourceManagers[GF_GFX_RES_TYPE_ANIM], NULL, NULL);

    spriteTemplate.spriteList = uiManager->spriteList;
    spriteTemplate.header = ret->spriteResourcesHeader;
    SetVecFx32(spriteTemplate.position, FX32_CONST(x), FX32_CONST(y), FX32_CONST(z));
    if (vramType == NNS_G2D_VRAM_TYPE_2DSUB) {
        spriteTemplate.position.y += FX32_CONST(192);
    }
    SetVecFx32(spriteTemplate.scale, FX32_ONE, FX32_ONE, FX32_ONE);
    spriteTemplate.rotation = 0;
    spriteTemplate.drawPriority = drawPriority;
    spriteTemplate.whichScreen = vramType;
    spriteTemplate.heapID = uiManager->heapID;
    ret->sprite = Sprite_CreateAffine(&spriteTemplate);
    SpriteResource *obj = uiManager->spriteResources[GF_GFX_RES_TYPE_PLTT]->obj[0];
    if (ret->sprite != NULL) {
        int seq_copy = seq;
        Sprite_SetAnimCtrlSeq(ret->sprite, seq_copy);
        Sprite_SetPaletteOverride(ret->sprite, sPlttOverrides[seq_copy] + SpriteTransfer_GetPlttOffset(obj, vramType));
    } else {
        GF_ASSERT(FALSE);
    }
    return ret;
}

void PokegearUIManager_DeleteSprite(ManagedSprite *managedSprite) {
    Sprite_DeleteAndFreeResources(managedSprite);
}

static void PokegearUIManager_LoadInitialGfx(PokegearUIManager *uiManager, u16 skin) {
    u8 resCounts[4] = { 1, 1, 1, 1 };

    uiManager->spriteList = G2dRenderer_Init(uiManager->spriteCount, &uiManager->renderer, uiManager->heapID);
    resCounts[GF_GFX_RES_TYPE_PLTT] = uiManager->plttCount;
    for (u32 i = 0; i < 4; ++i) {
        uiManager->resourceManagers[i] = Create2DGfxResObjMan(resCounts[i], (GfGfxResType)i, uiManager->heapID);
        uiManager->spriteResources[i] = Create2DGfxResObjList(resCounts[i], uiManager->heapID);
        for (u32 j = 0; j < uiManager->spriteResources[i]->max; ++j) {
            uiManager->spriteResources[i]->obj[j] = NULL;
        }
    }
    PokegearUIManager_LoadInitialSkinGfx(uiManager, skin);
}

static void PokegearUIManager_UnloadSprites(PokegearUIManager *auiManager) {
    SpriteList_Delete(auiManager->spriteList);
    sub_0200AED4(auiManager->spriteResources[GF_GFX_RES_TYPE_CHAR]);
    sub_0200B0CC(auiManager->spriteResources[GF_GFX_RES_TYPE_PLTT]);
    for (u32 i = 0; i < 4; ++i) {
        Delete2DGfxResObjList(auiManager->spriteResources[i]);
        Destroy2DGfxResObjMan(auiManager->resourceManagers[i]);
    }
}

static void PokegearUIManager_LoadInitialSkinGfx(PokegearUIManager *uiManager, u16 skin) {
    GF_2DGfxResObjList *objList;

    objList = uiManager->spriteResources[GF_GFX_RES_TYPE_CHAR];
    objList->obj[0] = AddCharResObjFromNarc(uiManager->resourceManagers[GF_GFX_RES_TYPE_CHAR], NARC_application_pokegear_pgear_gra, skin + NARC_pgear_gra_pgear_gra_00000006_NCGR, FALSE, 0xE000, (NNS_G2D_VRAM_TYPE)uiManager->vramType, uiManager->heapID);
    GF_ASSERT(objList->obj[0] != NULL);
    switch (uiManager->mode) {
    case 1:
        sub_0200ADA4(objList->obj[0]);
        break;
    case 2:
        sub_0200AE18(objList->obj[0]);
        break;
    case 0:
    default:
        sub_0200ACF0(objList->obj[0]);
        break;
    }

    for (int i = 0; i < 2; ++i) {
        objList = uiManager->spriteResources[GF_GFX_RES_TYPE_CELL + i];
        objList->obj[0] = AddCellOrAnimResObjFromNarc(uiManager->resourceManagers[GF_GFX_RES_TYPE_CELL + i], NARC_application_pokegear_pgear_gra, i + NARC_pgear_gra_pgear_gra_00000012_NCER, FALSE, 0xE000, (GfGfxResType)(GF_GFX_RES_TYPE_CELL + i), uiManager->heapID);
        GF_ASSERT(objList->obj[0] != NULL);
    }

    objList = uiManager->spriteResources[GF_GFX_RES_TYPE_PLTT];
    objList->obj[0] = AddPlttResObjFromNarc(uiManager->resourceManagers[GF_GFX_RES_TYPE_PLTT], NARC_application_pokegear_pgear_gra, skin + NARC_pgear_gra_pgear_gra_00000000_NCLR, FALSE, 0xE000, (NNS_G2D_VRAM_TYPE)uiManager->vramType, 4, uiManager->heapID);
    GF_ASSERT(objList->obj[0] != NULL);
    sub_0200B00C(objList->obj[0]);
}

// functions for PokegearObjectsManager

PokegearObjectsManager *PokegearObjectsManager_Create(int count, enum HeapID heapID) {
    PokegearObjectsManager *ret = (PokegearObjectsManager *)Heap_Alloc(heapID, sizeof(PokegearObjectsManager));
    MI_CpuClear8(ret, sizeof(PokegearObjectsManager));
    ret->max = count;
    ret->objects = Heap_Alloc(heapID, count * sizeof(PokegearManagedObject));
    MI_CpuClear8(ret->objects, count * sizeof(PokegearManagedObject));
    return ret;
}

void PokegearObjectsManager_Release(PokegearObjectsManager *mgr) {
    MI_CpuClear8(mgr->objects, mgr->max * sizeof(PokegearManagedObject));
    Heap_Free(mgr->objects);
    MI_CpuClear8(mgr, sizeof(PokegearObjectsManager));
    Heap_Free(mgr);
}

void PokegearObjectsManager_UpdateAllSpritesPos(PokegearObjectsManager *mgr) {
    for (u16 i = 0; i < mgr->num; ++i) {
        if (mgr->objects[i].active != 0 && mgr->objects[i].autoUpdateDisabled == 0) {
            Sprite_SetPositionXY(mgr->objects[i].sprite, mgr->objects[i].pos.x, mgr->objects[i].pos.y);
        }
    }
}

u16 PokegearObjectsManager_AppendSprite(PokegearObjectsManager *mgr, Sprite *sprite) {
    if (mgr->num >= mgr->max) {
        return 0xFFFF;
    }

    PokegearManagedObject *obj = &mgr->objects[mgr->num];
    obj->sprite = sprite;
    obj->active = TRUE;
    obj->autoCull = 1;
    return mgr->num++;
}

void PokegearObjectsManager_Reset(PokegearObjectsManager *mgr) {
    for (u16 i = 0; i < mgr->num; ++i) {
        if (mgr->objects[i].sprite != NULL) {
            thunk_Sprite_Delete(mgr->objects[i].sprite);
        }
    }
    MI_CpuClear8(mgr->objects, mgr->num * sizeof(PokegearManagedObject));
    mgr->num = 0;
}

void PokegearObjectsManager_DeleteSpritesFromIndexToEnd(PokegearObjectsManager *mgr, u8 firstIndex) {
    u16 i;
    u16 clearCount;

    clearCount = mgr->num - firstIndex;
    for (i = firstIndex; i < mgr->num; ++i) {
        if (mgr->objects[i].sprite != NULL) {
            thunk_Sprite_Delete(mgr->objects[i].sprite);
        }
    }
    MI_CpuClear8(mgr->objects + firstIndex, clearCount * sizeof(PokegearManagedObject));
    mgr->num -= clearCount;
}
