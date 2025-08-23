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

void ov100_021E6A58(PokegearApp_UnkSub094 *a0, int a1);
void ov100_021E6C4C(PokegearApp_UnkSub094 *a0, u16 a1);
void ov100_021E6CF4(PokegearApp_UnkSub094 *a0);
void ov100_021E6D34(PokegearApp_UnkSub094 *a0, u16 a1);

u16 PokegearCursorManager_GetFreeCursorSlot(PokegearCursorManager *cursorManager);
void PokegearCursorManager_UpdateCursorSpritePosition(PokegearCursorManager *cursorManager, u16 index);
void PokegearCursorManager_UpdateActiveCursorPosition(PokegearCursorManager *cursorManager, u8 move);
u8 PokegearCursorManager_SetCursorPosition(PokegearCursorManager *cursorManager, u16 index, u8 newIndex);

extern const u8 ov100_021E764C[];

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

// functions for PokegearApp_UnkSub094

PokegearApp_UnkSub094 *ov100_021E69F8(enum HeapID heapID, u16 a1, u16 a2, u16 a3, u16 a4, int a5) {
    PokegearApp_UnkSub094 *ret = Heap_Alloc(heapID, sizeof(PokegearApp_UnkSub094));
    MI_CpuClear8(ret, sizeof(PokegearApp_UnkSub094));
    ret->heapID = heapID;
    if (a2 > 4) {
        ret->unk_00A = 4;
    } else {
        ret->unk_00A = a2;
    }
    ret->unk_00C = a1;
    ret->unk_00E = a4;
    ret->unk_004 = a5;
    ov100_021E6C4C(ret, a3);
    return ret;
}

void ov100_021E6A3C(PokegearApp_UnkSub094 *a0) {
    ov100_021E6CF4(a0);
    MI_CpuClear8(a0, sizeof(PokegearApp_UnkSub094));
    Heap_Free(a0);
}

void ov100_021E6A58(PokegearApp_UnkSub094 *a0, int a1) {
    SpriteResource *obj;

    obj = a0->spriteResources[GF_GFX_RES_TYPE_CHAR]->obj[0];
    ReplaceCharResObjFromNarc(a0->resourceManagers[GF_GFX_RES_TYPE_CHAR], obj, NARC_application_pokegear_pgear_gra, a1 + 6, FALSE, a0->heapID);
    sub_0200AE8C(obj);

    obj = a0->spriteResources[GF_GFX_RES_TYPE_PLTT]->obj[0];
    ReplacePlttResObjFromNarc(a0->resourceManagers[GF_GFX_RES_TYPE_PLTT], obj, NARC_application_pokegear_pgear_gra, a1, FALSE, a0->heapID);
    sub_0200B084(obj);
}

void ov100_021E6AB0(PokegearApp_UnkSub094 *a0) {
    if (a0->spriteList != NULL) {
        SpriteList_RenderAndAnimateSprites(a0->spriteList);
    }
}

ManagedSprite *ov100_021E6AC0(PokegearApp_UnkSub094 *a0, u8 x, u8 y, u8 z, u8 priority, u8 drawPriority, u8 unused, u8 seq, int isBottomScreen) {
    NNS_G2D_VRAM_TYPE vramType;
    ManagedSprite *ret;
    SpriteTemplate spriteTemplate;

    static const u8 ov100_021E770C[] = { 2, 2, 2, 3, 1, 1, 1, 1 };

    ret = Heap_Alloc(a0->heapID, sizeof(ManagedSprite));
    MI_CpuClear8(ret, sizeof(ManagedSprite));
    ret->spriteResourceHeaderList = Heap_Alloc(a0->heapID, sizeof(SpriteResourceHeaderList));
    ret->spriteResourceHeaderList->headers = Heap_Alloc(a0->heapID, sizeof(SpriteResourcesHeader));
    // ret->spriteResourceHeaderList->num = 1;
    ret->spriteResourcesHeader = ret->spriteResourceHeaderList->headers;
    vramType = isBottomScreen == 0 ? NNS_G2D_VRAM_TYPE_2DMAIN : NNS_G2D_VRAM_TYPE_2DSUB;
    CreateSpriteResourcesHeader(ret->spriteResourcesHeader, 0xE000, 0xE000, 0xE000, 0xE000, -1, -1, 0, priority, a0->resourceManagers[GF_GFX_RES_TYPE_CHAR], a0->resourceManagers[GF_GFX_RES_TYPE_PLTT], a0->resourceManagers[GF_GFX_RES_TYPE_CELL], a0->resourceManagers[GF_GFX_RES_TYPE_ANIM], NULL, NULL);

    spriteTemplate.spriteList = a0->spriteList;
    spriteTemplate.header = ret->spriteResourcesHeader;
    SetVecFx32(spriteTemplate.position, FX32_CONST(x), FX32_CONST(y), FX32_CONST(z));
    if (vramType == NNS_G2D_VRAM_TYPE_2DSUB) {
        spriteTemplate.position.y += FX32_CONST(192);
    }
    SetVecFx32(spriteTemplate.scale, FX32_ONE, FX32_ONE, FX32_ONE);
    spriteTemplate.rotation = 0;
    spriteTemplate.drawPriority = drawPriority;
    spriteTemplate.whichScreen = vramType;
    spriteTemplate.heapID = a0->heapID;
    ret->sprite = Sprite_CreateAffine(&spriteTemplate);
    SpriteResource *obj = a0->spriteResources[GF_GFX_RES_TYPE_PLTT]->obj[0];
    if (ret->sprite != NULL) {
        int seq_copy = seq;
        Sprite_SetAnimCtrlSeq(ret->sprite, seq_copy);
        Sprite_SetPaletteOverride(ret->sprite, ov100_021E770C[seq_copy] + SpriteTransfer_GetPlttOffset(obj, vramType));
    } else {
        GF_ASSERT(FALSE);
    }
    return ret;
}

void ov100_021E6C44(ManagedSprite *managedSprite) {
    Sprite_DeleteAndFreeResources(managedSprite);
}

void ov100_021E6C4C(PokegearApp_UnkSub094 *a0, u16 a1) {
    u8 spC[4] = { 1, 1, 1, 1 };

    a0->spriteList = G2dRenderer_Init(a0->unk_00C, &a0->renderer, a0->heapID);
    spC[1] = a0->unk_00A;
    for (u32 i = 0; i < 4; ++i) {
        a0->resourceManagers[i] = Create2DGfxResObjMan(spC[i], (GfGfxResType)i, a0->heapID);
        a0->spriteResources[i] = Create2DGfxResObjList(spC[i], a0->heapID);
        for (u32 j = 0; j < a0->spriteResources[i]->max; ++j) {
            a0->spriteResources[i]->obj[j] = NULL;
        }
    }
    ov100_021E6D34(a0, a1);
}

void ov100_021E6CF4(PokegearApp_UnkSub094 *a0) {
    SpriteList_Delete(a0->spriteList);
    sub_0200AED4(a0->spriteResources[GF_GFX_RES_TYPE_CHAR]);
    sub_0200B0CC(a0->spriteResources[GF_GFX_RES_TYPE_PLTT]);
    for (u32 i = 0; i < 4; ++i) {
        Delete2DGfxResObjList(a0->spriteResources[i]);
        Destroy2DGfxResObjMan(a0->resourceManagers[i]);
    }
}

void ov100_021E6D34(PokegearApp_UnkSub094 *a0, u16 a1) {
    GF_2DGfxResObjList *objList;

    objList = a0->spriteResources[GF_GFX_RES_TYPE_CHAR];
    objList->obj[0] = AddCharResObjFromNarc(a0->resourceManagers[GF_GFX_RES_TYPE_CHAR], NARC_application_pokegear_pgear_gra, a1 + 6, FALSE, 0xE000, (NNS_G2D_VRAM_TYPE)a0->unk_00E, a0->heapID);
    GF_ASSERT(objList->obj[0] != NULL);
    switch (a0->unk_004) {
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
        objList = a0->spriteResources[GF_GFX_RES_TYPE_CELL + i];
        objList->obj[0] = AddCellOrAnimResObjFromNarc(a0->resourceManagers[GF_GFX_RES_TYPE_CELL + i], NARC_application_pokegear_pgear_gra, 12 + i, FALSE, 0xE000, (GfGfxResType)(GF_GFX_RES_TYPE_CELL + i), a0->heapID);
        GF_ASSERT(objList->obj[0] != NULL);
    }

    objList = a0->spriteResources[GF_GFX_RES_TYPE_PLTT];
    objList->obj[0] = AddPlttResObjFromNarc(a0->resourceManagers[GF_GFX_RES_TYPE_PLTT], NARC_application_pokegear_pgear_gra, a1, FALSE, 0xE000, (NNS_G2D_VRAM_TYPE)a0->unk_00E, 4, a0->heapID);
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

// functions for PokegearAppSwitchCursor

PokegearCursorManager *PokegearCursorManager_Alloc(int count, enum HeapID heapID) {
    PokegearCursorManager *ret = (PokegearCursorManager *)Heap_Alloc(heapID, sizeof(PokegearCursorManager));
    MI_CpuClear8(ret, sizeof(PokegearCursorManager));
    ret->count = count;
    ret->cursors = Heap_Alloc(heapID, count * sizeof(PokegearCursor));
    MI_CpuClear8(ret->cursors, count * sizeof(PokegearCursor));
    return ret;
}

void PokegearCursorManager_Free(PokegearCursorManager *cursorManager) {
    for (int i = 0; i < cursorManager->count; ++i) {
        if (cursorManager->cursors[i].active && cursorManager->cursors[i].grid != NULL) {
            PokegearCursorManager_RemoveCursor(cursorManager, i);
        }
    }
    MI_CpuClear8(cursorManager->cursors, cursorManager->count * sizeof(PokegearCursor));
    Heap_Free(cursorManager->cursors);
    MI_CpuClear8(cursorManager, sizeof(PokegearCursorManager));
    Heap_Free(cursorManager);
}

u16 PokegearCursorManager_AddButtons(PokegearCursorManager *cursorManager, const PokegearCursorGrid *buttonSpec, u8 numSpecs, u8 cursorPos, BOOL managedSprites, enum HeapID heapID, void *cursorSprite1, void *cursorSprite2, void *cursorSprite3, void *cursorSprite4) {
    u16 index = PokegearCursorManager_GetFreeCursorSlot(cursorManager);
    if (index == 0xFFFF) {
        return 0xFFFF;
    }

    PokegearCursor *button = &cursorManager->cursors[index];
    button->active = TRUE;
    button->buttonsAre4Tiles = TRUE;
    button->count = numSpecs;
    button->lastIndex = button->count - 1;
    button->grid = Heap_Alloc(heapID, button->count * sizeof(PokegearCursorGrid));
    MI_CpuCopy8(buttonSpec, button->grid, button->count * sizeof(PokegearCursorGrid));
    if (cursorPos >= button->count) {
        button->cursorPos = 0;
    } else {
        button->cursorPos = cursorPos;
    }
    button->buttonsAreManagedSprite = managedSprites;
    button->cursorSprites[0].raw = cursorSprite1;
    button->cursorSprites[1].raw = cursorSprite2;
    button->cursorSprites[2].raw = cursorSprite3;
    button->cursorSprites[3].raw = cursorSprite4;
    return index;
}

BOOL PokegearCursorManager_RemoveCursor(PokegearCursorManager *cursorManager, u16 cursorIndex) {
    if (cursorIndex >= cursorManager->count || !cursorManager->cursors[cursorIndex].active) {
        return FALSE;
    }
    if (cursorManager->activeCursorIndex == cursorIndex) {
        cursorManager->activeCursorIndex = 0xFFFF;
        cursorManager->lastCursor = NULL;
    }
    MI_CpuClear8(cursorManager->cursors[cursorIndex].grid, cursorManager->cursors[cursorIndex].count * sizeof(PokegearCursorGrid));
    Heap_Free(cursorManager->cursors[cursorIndex].grid);
    MI_CpuClear8(&cursorManager->cursors[cursorIndex], sizeof(PokegearCursor));
    return FALSE;
}

u16 PokegearCursorManager_GetFreeCursorSlot(PokegearCursorManager *cursorManager) {
    for (u16 i = 0; i < cursorManager->count; ++i) {
        if (!cursorManager->cursors[i].active) {
            return i;
        }
    }

    return 0xFFFF;
}

u16 PokegearCursorManager_SetCursorSpritesDrawState(PokegearCursorManager *cursorManager, u16 index, BOOL draw) {
    PokegearCursor *button;
    if (index == 0xFFFF) {
        button = cursorManager->lastCursor;
    } else if (index >= cursorManager->count || (button = &cursorManager->cursors[index], !button->active)) {
        return 0xFFFF;
    }
    if (!button->buttonsAreManagedSprite) {
        thunk_Sprite_SetDrawFlag(button->cursorSprites[0].unmanaged, draw);
        if (button->buttonsAre4Tiles == TRUE) {
            thunk_Sprite_SetDrawFlag(button->cursorSprites[1].unmanaged, draw);
            thunk_Sprite_SetDrawFlag(button->cursorSprites[2].unmanaged, draw);
            thunk_Sprite_SetDrawFlag(button->cursorSprites[3].unmanaged, draw);
        }
    } else {
        ManagedSprite_SetDrawFlag(button->cursorSprites[0].managed, draw);
        if (button->buttonsAre4Tiles == TRUE) {
            ManagedSprite_SetDrawFlag(button->cursorSprites[1].managed, draw);
            ManagedSprite_SetDrawFlag(button->cursorSprites[2].managed, draw);
            ManagedSprite_SetDrawFlag(button->cursorSprites[3].managed, draw);
        }
    }
    return index;
}

void PokegearCursorManager_UpdateCursorSpritePosition(PokegearCursorManager *cursorManager, u16 index) {
    PokegearCursor *buttons;
    if (index == 0xFFFF) {
        buttons = cursorManager->lastCursor;
    } else if (index >= cursorManager->count) {
        return;
    } else {
        buttons = &cursorManager->cursors[index];
    }

    PokegearCursorGrid *spec = &buttons->grid[buttons->cursorPos];
    if (!buttons->buttonsAreManagedSprite) {
        if (!buttons->buttonsAre4Tiles) {
            Sprite_SetPositionXY(buttons->cursorSprites[0].unmanaged, spec->x, spec->y);
        } else {
            Sprite_SetPositionXY(buttons->cursorSprites[0].unmanaged, spec->x + spec->leftOffset, spec->y + spec->topOffset);
            Sprite_SetPositionXY(buttons->cursorSprites[1].unmanaged, spec->x + spec->leftOffset, spec->y + spec->bottomOffset);
            Sprite_SetPositionXY(buttons->cursorSprites[2].unmanaged, spec->x + spec->rightOffset, spec->y + spec->topOffset);
            Sprite_SetPositionXY(buttons->cursorSprites[3].unmanaged, spec->x + spec->rightOffset, spec->y + spec->bottomOffset);
        }
    } else {
        if (!buttons->buttonsAre4Tiles) {
            ManagedSprite_SetPositionXY(buttons->cursorSprites[0].managed, spec->x, spec->y);
        } else {
            ManagedSprite_SetPositionXY(buttons->cursorSprites[0].managed, spec->x + spec->leftOffset, spec->y + spec->topOffset);
            ManagedSprite_SetPositionXY(buttons->cursorSprites[1].managed, spec->x + spec->leftOffset, spec->y + spec->bottomOffset);
            ManagedSprite_SetPositionXY(buttons->cursorSprites[2].managed, spec->x + spec->rightOffset, spec->y + spec->topOffset);
            ManagedSprite_SetPositionXY(buttons->cursorSprites[3].managed, spec->x + spec->rightOffset, spec->y + spec->bottomOffset);
        }
    }
}

u16 PokegearCursorManager_SetSpecIndexAndCursorPos(PokegearCursorManager *cursorManager, u16 index, u8 cursorPos) {
    if (index >= cursorManager->count) {
        return 0xFFFF;
    }
    cursorManager->lastCursor = &cursorManager->cursors[index];
    cursorManager->activeCursorIndex = index;
    if (cursorPos != 0xFF) {
        if (cursorPos >= cursorManager->cursors[index].count) {
            cursorManager->cursors[index].cursorPos = 0;
        } else {
            cursorManager->cursors[index].cursorPos = cursorPos;
        }
    }
    PokegearCursorManager_UpdateCursorSpritePosition(cursorManager, 0xFFFF);
    return index;
}

u8 PokegearCursorManager_GetCursorPos(PokegearCursorManager *cursorManager) {
    return cursorManager->lastCursor->cursorPos;
}

u8 PokegearCursorManager_GetSpecCursorPos(PokegearCursorManager *cursorManager, u16 index) {
    if (index == 0xFFFF) {
        return cursorManager->lastCursor->cursorPos;
    } else if (index >= cursorManager->count || !cursorManager->cursors[index].active) {
        return 0;
    } else {
        return cursorManager->cursors[index].cursorPos;
    }
}

void PokegearCursorManager_UpdateActiveCursorPosition(PokegearCursorManager *cursorManager, u8 move) {
    if (cursorManager->lastCursor != NULL) {
        PokegearCursorGrid *spec = &cursorManager->lastCursor->grid[cursorManager->lastCursor->cursorPos];
        u8 newIndex;
        switch (move) {
        case 1:
            newIndex = spec->buttonRight;
            break;
        case 2:
            newIndex = spec->buttonUp;
            break;
        case 3:
            newIndex = spec->buttonDown;
            break;
        case 0:
        default:
            newIndex = spec->buttonLeft;
            break;
        }
        if (newIndex <= cursorManager->lastCursor->lastIndex) {
            cursorManager->lastCursor->cursorPos = newIndex;
        }
    }
}

u8 PokegearCursorManager_MoveActiveCursor(PokegearCursorManager *cursorManager, u8 move) {
    PokegearCursorManager_UpdateActiveCursorPosition(cursorManager, move);
    PokegearCursorManager_UpdateCursorSpritePosition(cursorManager, 0xFFFF);
    return cursorManager->lastCursor->cursorPos;
}

u8 PokegearCursorManager_SetActiveCursorPosition(PokegearCursorManager *cursorManager, u8 newIndex) {
    return PokegearCursorManager_SetCursorPosition(cursorManager, cursorManager->activeCursorIndex, newIndex);
}

u8 PokegearCursorManager_SetCursorPosition(PokegearCursorManager *cursorManager, u16 index, u8 newIndex) {
    PokegearCursor *button;
    if (index == 0xFFFF) {
        button = cursorManager->lastCursor;
        index = cursorManager->activeCursorIndex;
    } else if (index >= cursorManager->count || (button = &cursorManager->cursors[index], !button->active)) {
        return 0;
    }
    if (button->lastIndex < newIndex) {
        button->cursorPos = 0;
    } else {
        button->cursorPos = newIndex;
    }
    PokegearCursorManager_UpdateCursorSpritePosition(cursorManager, index);
    return button->cursorPos;
}

void PokegearCursorManager_SetCursorSpritesAnimateFlag(PokegearCursorManager *cursorManager, u16 index, BOOL active) {
    if (index == 0xFFFF) {
        index = cursorManager->activeCursorIndex;
    }
    if (index < cursorManager->count) {
        PokegearCursor *button = &cursorManager->cursors[index];
        if (button->active) {
            if (!button->buttonsAreManagedSprite) {
                if (!button->buttonsAre4Tiles) {
                    Sprite_ResetAnimCtrlState(button->cursorSprites[0].unmanaged);
                    thunk_Sprite_SetAnimationFlag(button->cursorSprites[0].unmanaged, active);
                } else {
                    for (int i = 0; i < 4; ++i) {
                        Sprite_ResetAnimCtrlState(button->cursorSprites[i].unmanaged);
                        thunk_Sprite_SetAnimationFlag(button->cursorSprites[i].unmanaged, active);
                    }
                }
            } else {
                if (!button->buttonsAre4Tiles) {
                    ManagedSprite_ResetSpriteAnimCtrlState(button->cursorSprites[0].managed);
                    ManagedSprite_SetAnimateFlag(button->cursorSprites[0].managed, active);
                } else {
                    for (int i = 0; i < 4; ++i) {
                        ManagedSprite_ResetSpriteAnimCtrlState(button->cursorSprites[i].managed);
                        ManagedSprite_SetAnimateFlag(button->cursorSprites[i].managed, active);
                    }
                }
            }
        }
    }
}
