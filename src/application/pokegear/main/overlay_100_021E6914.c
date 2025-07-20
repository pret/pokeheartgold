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

u16 PokegearAppSwitch_GetFreeButtonSlot(PokegearAppSwitch *appSwitch);
void PokegearAppSwitch_UpdateCursorSpritePosition(PokegearAppSwitch *appSwitch, u16 index);
void PokegearAppSwitch_UpdateActiveCursorPosition(PokegearAppSwitch *appSwitch, u8 move);
u8 PokegearAppSwitch_SetCursorPosition(PokegearAppSwitch *appSwitch, u16 index, u8 newIndex);

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
    GF_CreateVramTransferManager(32, pokegearApp->heapId);
    pokegearApp->spriteSystem = SpriteSystem_Alloc(pokegearApp->heapId);
    SpriteSystem_Init(pokegearApp->spriteSystem, sPokegearObjResSpecs[0].oamManagerParam, sPokegearObjResSpecs[0].oamCharTransferParam, 0x20);
    thunk_ClearMainOAM(pokegearApp->heapId);
    thunk_ClearSubOAM(pokegearApp->heapId);
}

void PokegearApp_DestroySpriteSystem(PokegearAppData *pokegearApp) {
    SpriteSystem_Free(pokegearApp->spriteSystem);
    pokegearApp->spriteSystem = NULL;
    GF_DestroyVramTransferManager();
    thunk_ClearMainOAM(pokegearApp->heapId);
    thunk_ClearSubOAM(pokegearApp->heapId);
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

PokegearApp_UnkSub094 *ov100_021E69F8(HeapID heapId, u16 a1, u16 a2, u16 a3, u16 a4, int a5) {
    PokegearApp_UnkSub094 *ret = AllocFromHeap(heapId, sizeof(PokegearApp_UnkSub094));
    MI_CpuClear8(ret, sizeof(PokegearApp_UnkSub094));
    ret->heapId = heapId;
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
    FreeToHeap(a0);
}

void ov100_021E6A58(PokegearApp_UnkSub094 *a0, int a1) {
    SpriteResource *obj;

    obj = a0->spriteResources[GF_GFX_RES_TYPE_CHAR]->obj[0];
    ReplaceCharResObjFromNarc(a0->resourceManagers[GF_GFX_RES_TYPE_CHAR], obj, NARC_a_1_4_3, a1 + 6, FALSE, a0->heapId);
    sub_0200AE8C(obj);

    obj = a0->spriteResources[GF_GFX_RES_TYPE_PLTT]->obj[0];
    ReplacePlttResObjFromNarc(a0->resourceManagers[GF_GFX_RES_TYPE_PLTT], obj, NARC_a_1_4_3, a1, FALSE, a0->heapId);
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

    ret = AllocFromHeap(a0->heapId, sizeof(ManagedSprite));
    MI_CpuClear8(ret, sizeof(ManagedSprite));
    ret->spriteResourceHeaderList = AllocFromHeap(a0->heapId, sizeof(SpriteResourceHeaderList));
    ret->spriteResourceHeaderList->headers = AllocFromHeap(a0->heapId, sizeof(SpriteResourcesHeader));
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
    spriteTemplate.heapId = a0->heapId;
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

    a0->spriteList = G2dRenderer_Init(a0->unk_00C, &a0->renderer, a0->heapId);
    spC[1] = a0->unk_00A;
    for (u32 i = 0; i < 4; ++i) {
        a0->resourceManagers[i] = Create2DGfxResObjMan(spC[i], (GfGfxResType)i, a0->heapId);
        a0->spriteResources[i] = Create2DGfxResObjList(spC[i], a0->heapId);
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
    objList->obj[0] = AddCharResObjFromNarc(a0->resourceManagers[GF_GFX_RES_TYPE_CHAR], NARC_a_1_4_3, a1 + 6, FALSE, 0xE000, (NNS_G2D_VRAM_TYPE)a0->unk_00E, a0->heapId);
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
        objList->obj[0] = AddCellOrAnimResObjFromNarc(a0->resourceManagers[GF_GFX_RES_TYPE_CELL + i], NARC_a_1_4_3, 12 + i, FALSE, 0xE000, (GfGfxResType)(GF_GFX_RES_TYPE_CELL + i), a0->heapId);
        GF_ASSERT(objList->obj[0] != NULL);
    }

    objList = a0->spriteResources[GF_GFX_RES_TYPE_PLTT];
    objList->obj[0] = AddPlttResObjFromNarc(a0->resourceManagers[GF_GFX_RES_TYPE_PLTT], NARC_a_1_4_3, a1, FALSE, 0xE000, (NNS_G2D_VRAM_TYPE)a0->unk_00E, 4, a0->heapId);
    GF_ASSERT(objList->obj[0] != NULL);
    sub_0200B00C(objList->obj[0]);
}

// functions for PokegearObjectsManager

PokegearObjectsManager *PokegearObjectsManager_Create(int count, HeapID heapId) {
    PokegearObjectsManager *ret = (PokegearObjectsManager *)AllocFromHeap(heapId, sizeof(PokegearObjectsManager));
    MI_CpuClear8(ret, sizeof(PokegearObjectsManager));
    ret->max = count;
    ret->objects = AllocFromHeap(heapId, count * sizeof(PokegearManagedObject));
    MI_CpuClear8(ret->objects, count * sizeof(PokegearManagedObject));
    return ret;
}

void PokegearObjectsManager_Release(PokegearObjectsManager *mgr) {
    MI_CpuClear8(mgr->objects, mgr->max * sizeof(PokegearManagedObject));
    FreeToHeap(mgr->objects);
    MI_CpuClear8(mgr, sizeof(PokegearObjectsManager));
    FreeToHeap(mgr);
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
    obj->active = 1;
    obj->unk_01 = 1;
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

PokegearAppSwitch *PokegearAppSwitch_Alloc(int count, HeapID heapId) {
    PokegearAppSwitch *ret = (PokegearAppSwitch *)AllocFromHeap(heapId, sizeof(PokegearAppSwitch));
    MI_CpuClear8(ret, sizeof(PokegearAppSwitch));
    ret->count = count;
    ret->buttons = AllocFromHeap(heapId, count * sizeof(PokegearAppSwitchButton));
    MI_CpuClear8(ret->buttons, count * sizeof(PokegearAppSwitchButton));
    return ret;
}

void PokegearAppSwitch_Free(PokegearAppSwitch *appSwitch) {
    for (int i = 0; i < appSwitch->count; ++i) {
        if (appSwitch->buttons[i].buttonsAreActive && appSwitch->buttons[i].buttonSpec != NULL) {
            PokegearAppSwitch_RemoveButtons(appSwitch, i);
        }
    }
    MI_CpuClear8(appSwitch->buttons, appSwitch->count * sizeof(PokegearAppSwitchButton));
    FreeToHeap(appSwitch->buttons);
    MI_CpuClear8(appSwitch, sizeof(PokegearAppSwitch));
    FreeToHeap(appSwitch);
}

u16 PokegearAppSwitch_AddButtons(PokegearAppSwitch *appSwitch, const PokegearAppSwitchButtonSpec *buttonSpec, u8 numSpecs, u8 cursorPos, BOOL managedSprites, HeapID heapId, void *cursorSprite1, void *cursorSprite2, void *cursorSprite3, void *cursorSprite4) {
    u16 index = PokegearAppSwitch_GetFreeButtonSlot(appSwitch);
    if (index == 0xFFFF) {
        return 0xFFFF;
    }

    PokegearAppSwitchButton *button = &appSwitch->buttons[index];
    button->buttonsAreActive = TRUE;
    button->buttonsAre4Tiles = TRUE;
    button->count = numSpecs;
    button->lastIndex = button->count - 1;
    button->buttonSpec = AllocFromHeap(heapId, button->count * sizeof(PokegearAppSwitchButtonSpec));
    MI_CpuCopy8(buttonSpec, button->buttonSpec, button->count * sizeof(PokegearAppSwitchButtonSpec));
    if (cursorPos >= button->count) {
        button->cursorPos = 0;
    } else {
        button->cursorPos = cursorPos;
    }
    button->buttonsAreManagedSprite = managedSprites;
    button->cursorSprites[0].undisclosed = cursorSprite1;
    button->cursorSprites[1].undisclosed = cursorSprite2;
    button->cursorSprites[2].undisclosed = cursorSprite3;
    button->cursorSprites[3].undisclosed = cursorSprite4;
    return index;
}

BOOL PokegearAppSwitch_RemoveButtons(PokegearAppSwitch *appSwitch, u16 buttonIndex) {
    if (buttonIndex >= appSwitch->count || !appSwitch->buttons[buttonIndex].buttonsAreActive) {
        return FALSE;
    }
    if (appSwitch->activeCursorIndex == buttonIndex) {
        appSwitch->activeCursorIndex = 0xFFFF;
        appSwitch->lastButton = NULL;
    }
    MI_CpuClear8(appSwitch->buttons[buttonIndex].buttonSpec, appSwitch->buttons[buttonIndex].count * sizeof(PokegearAppSwitchButtonSpec));
    FreeToHeap(appSwitch->buttons[buttonIndex].buttonSpec);
    MI_CpuClear8(&appSwitch->buttons[buttonIndex], sizeof(PokegearAppSwitchButton));
    return FALSE;
}

u16 PokegearAppSwitch_GetFreeButtonSlot(PokegearAppSwitch *appSwitch) {
    for (u16 i = 0; i < appSwitch->count; ++i) {
        if (!appSwitch->buttons[i].buttonsAreActive) {
            return i;
        }
    }

    return 0xFFFF;
}

u16 PokegearAppSwitch_SetCursorSpritesDrawState(PokegearAppSwitch *cursor, u16 index, BOOL draw) {
    PokegearAppSwitchButton *button;
    if (index == 0xFFFF) {
        button = cursor->lastButton;
    } else if (index >= cursor->count || (button = &cursor->buttons[index], !button->buttonsAreActive)) {
        return 0xFFFF;
    }
    if (!button->buttonsAreManagedSprite) {
        thunk_Sprite_SetDrawFlag(button->cursorSprites[0].sprite, draw);
        if (button->buttonsAre4Tiles == TRUE) {
            thunk_Sprite_SetDrawFlag(button->cursorSprites[1].sprite, draw);
            thunk_Sprite_SetDrawFlag(button->cursorSprites[2].sprite, draw);
            thunk_Sprite_SetDrawFlag(button->cursorSprites[3].sprite, draw);
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

void PokegearAppSwitch_UpdateCursorSpritePosition(PokegearAppSwitch *appSwitch, u16 index) {
    PokegearAppSwitchButton *buttons;
    if (index == 0xFFFF) {
        buttons = appSwitch->lastButton;
    } else if (index >= appSwitch->count) {
        return;
    } else {
        buttons = &appSwitch->buttons[index];
    }

    PokegearAppSwitchButtonSpec *spec = &buttons->buttonSpec[buttons->cursorPos];
    if (!buttons->buttonsAreManagedSprite) {
        if (!buttons->buttonsAre4Tiles) {
            Sprite_SetPositionXY(buttons->cursorSprites[0].sprite, spec->x, spec->y);
        } else {
            Sprite_SetPositionXY(buttons->cursorSprites[0].sprite, spec->x + spec->leftOffset, spec->y + spec->topOffset);
            Sprite_SetPositionXY(buttons->cursorSprites[1].sprite, spec->x + spec->leftOffset, spec->y + spec->bottomOffset);
            Sprite_SetPositionXY(buttons->cursorSprites[2].sprite, spec->x + spec->rightOffset, spec->y + spec->topOffset);
            Sprite_SetPositionXY(buttons->cursorSprites[3].sprite, spec->x + spec->rightOffset, spec->y + spec->bottomOffset);
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

u16 PokegearAppSwitch_SetSpecIndexAndCursorPos(PokegearAppSwitch *appSwitch, u16 index, u8 cursorPos) {
    if (index >= appSwitch->count) {
        return 0xFFFF;
    }
    appSwitch->lastButton = &appSwitch->buttons[index];
    appSwitch->activeCursorIndex = index;
    if (cursorPos != 0xFF) {
        if (cursorPos >= appSwitch->buttons[index].count) {
            appSwitch->buttons[index].cursorPos = 0;
        } else {
            appSwitch->buttons[index].cursorPos = cursorPos;
        }
    }
    PokegearAppSwitch_UpdateCursorSpritePosition(appSwitch, 0xFFFF);
    return index;
}

u8 PokegearAppSwitch_GetCursorPos(PokegearAppSwitch *appSwitch) {
    return appSwitch->lastButton->cursorPos;
}

u8 PokegearAppSwitch_GetSpecCursorPos(PokegearAppSwitch *appSwitch, u16 index) {
    if (index == 0xFFFF) {
        return appSwitch->lastButton->cursorPos;
    } else if (index >= appSwitch->count || !appSwitch->buttons[index].buttonsAreActive) {
        return 0;
    } else {
        return appSwitch->buttons[index].cursorPos;
    }
}

void PokegearAppSwitch_UpdateActiveCursorPosition(PokegearAppSwitch *appSwitch, u8 move) {
    if (appSwitch->lastButton != NULL) {
        PokegearAppSwitchButtonSpec *spec = &appSwitch->lastButton->buttonSpec[appSwitch->lastButton->cursorPos];
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
        if (newIndex <= appSwitch->lastButton->lastIndex) {
            appSwitch->lastButton->cursorPos = newIndex;
        }
    }
}

u8 PokegearAppSwitch_MoveActiveCursor(PokegearAppSwitch *appSwitch, u8 move) {
    PokegearAppSwitch_UpdateActiveCursorPosition(appSwitch, move);
    PokegearAppSwitch_UpdateCursorSpritePosition(appSwitch, 0xFFFF);
    return appSwitch->lastButton->cursorPos;
}

u8 PokegearAppSwitch_SetActiveCursorPosition(PokegearAppSwitch *appSwitch, u8 newIndex) {
    return PokegearAppSwitch_SetCursorPosition(appSwitch, appSwitch->activeCursorIndex, newIndex);
}

u8 PokegearAppSwitch_SetCursorPosition(PokegearAppSwitch *appSwitch, u16 index, u8 newIndex) {
    PokegearAppSwitchButton *button;
    if (index == 0xFFFF) {
        button = appSwitch->lastButton;
        index = appSwitch->activeCursorIndex;
    } else if (index >= appSwitch->count || (button = &appSwitch->buttons[index], !button->buttonsAreActive)) {
        return 0;
    }
    if (button->lastIndex < newIndex) {
        button->cursorPos = 0;
    } else {
        button->cursorPos = newIndex;
    }
    PokegearAppSwitch_UpdateCursorSpritePosition(appSwitch, index);
    return button->cursorPos;
}

void PokegearAppSwitch_SetCursorSpritesAnimateFlag(PokegearAppSwitch *appSwitch, u16 index, BOOL active) {
    if (index == 0xFFFF) {
        index = appSwitch->activeCursorIndex;
    }
    if (index < appSwitch->count) {
        PokegearAppSwitchButton *button = &appSwitch->buttons[index];
        if (button->buttonsAreActive) {
            if (!button->buttonsAreManagedSprite) {
                if (!button->buttonsAre4Tiles) {
                    Sprite_ResetAnimCtrlState(button->cursorSprites[0].sprite);
                    thunk_Sprite_SetAnimationFlag(button->cursorSprites[0].sprite, active);
                } else {
                    for (int i = 0; i < 4; ++i) {
                        Sprite_ResetAnimCtrlState(button->cursorSprites[i].sprite);
                        thunk_Sprite_SetAnimationFlag(button->cursorSprites[i].sprite, active);
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
