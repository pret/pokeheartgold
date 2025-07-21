#include "application/pokegear/pokegear_internal.h"

#include "math_util.h"
#include "unk_0200ACF0.h"
#include "unk_0200B150.h"
#include "vram_transfer_manager.h"

typedef struct UnkStruct_ov100_021E76BC {
    u32 maxSprites;
    const OamManagerParam *oamManagerParam;
    const OamCharTransferParam *oamCharTransferParam;
    const u16 *resIdList;
} UnkStruct_ov100_021E76BC;

void ov100_021E6A58(PokegearApp_UnkSub094 *a0, int a1);
void ov100_021E6C4C(PokegearApp_UnkSub094 *a0, u16 a1);
void ov100_021E6CF4(PokegearApp_UnkSub094 *a0);
void ov100_021E6D34(PokegearApp_UnkSub094 *a0, u16 a1);

u16 PokegearAppSwitch_GetFreeButtonSlot(PokegearAppSwitch *appSwitch);
void ov100_021E71B4(PokegearAppSwitch *appSwitch, u16 index);
void ov100_021E7368(PokegearAppSwitch *appSwitch, u8 move);
u8 ov100_021E73D4(PokegearAppSwitch *appSwitch, u16 index, u8 newIndex);

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

static const u16 ov100_021E767A[] = { 0x0022, 0x0023, 0x0021, 0x0020, 0xFFFF, 0xFFFF, 0x0050 };
static const u16 ov100_021E7650[] = { 0x002A, 0x002B, 0x0029, 0x0028, 0xFFFF, 0xFFFF, 0x0052 };
static const u16 ov100_021E765E[] = { 0x002E, 0x002F, 0x002D, 0x002C, 0xFFFF, 0xFFFF, 0x0053 };
static const u16 ov100_021E766C[] = { 0x0026, 0x0027, 0x0025, 0x0024, 0xFFFF, 0xFFFF, 0x0051 };

static const UnkStruct_ov100_021E76BC ov100_021E76BC[] = {
    { 0x80, &sOamManagerParam, &sOamCharTransferParam, ov100_021E7650 },
    { 0x80, &sOamManagerParam, &sOamCharTransferParam, ov100_021E766C },
    { 0xC0, &sOamManagerParam, &sOamCharTransferParam, ov100_021E767A },
    { 0x80, &sOamManagerParam, &sOamCharTransferParam, ov100_021E765E },
    { 0x80, &sOamManagerParam, &sOamCharTransferParam, ov100_021E767A },
};

void ov100_021E6914(PokegearAppData *pokegearApp) {
    GF_CreateVramTransferManager(32, pokegearApp->heapId);
    pokegearApp->spriteSystem = SpriteSystem_Alloc(pokegearApp->heapId);
    SpriteSystem_Init(pokegearApp->spriteSystem, ov100_021E76BC[0].oamManagerParam, ov100_021E76BC[0].oamCharTransferParam, 0x20);
    sub_0200B2E0(pokegearApp->heapId);
    sub_0200B2E8(pokegearApp->heapId);
}

void ov100_021E6950(PokegearAppData *pokegearApp) {
    SpriteSystem_Free(pokegearApp->spriteSystem);
    pokegearApp->spriteSystem = NULL;
    GF_DestroyVramTransferManager();
    sub_0200B2E0(pokegearApp->heapId);
    sub_0200B2E8(pokegearApp->heapId);
}

void PokegearApp_CreateSpriteManager(PokegearAppData *pokegearApp, int a1) {
    if (pokegearApp->spriteSystem != NULL) {
        pokegearApp->spriteManager = SpriteManager_New(pokegearApp->spriteSystem);
        SpriteSystem_InitSprites(pokegearApp->spriteSystem, pokegearApp->spriteManager, ov100_021E76BC[a1].maxSprites);
        sub_0200D2A4(pokegearApp->spriteSystem, pokegearApp->spriteManager, ov100_021E76BC[a1].resIdList, 1, 0);
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
    Heap_Free(a0);
}

void ov100_021E6A58(PokegearApp_UnkSub094 *a0, int a1) {
    SpriteResource *obj;

    obj = a0->spriteResources[GF_GFX_RES_TYPE_CHAR]->obj[0];
    ReplaceCharResObjFromNarc(a0->unk_140[GF_GFX_RES_TYPE_CHAR], obj, NARC_a_1_4_3, a1 + 6, FALSE, a0->heapId);
    sub_0200AE8C(obj);

    obj = a0->spriteResources[GF_GFX_RES_TYPE_PLTT]->obj[0];
    ReplacePlttResObjFromNarc(a0->unk_140[GF_GFX_RES_TYPE_PLTT], obj, NARC_a_1_4_3, a1, FALSE, a0->heapId);
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
    CreateSpriteResourcesHeader(ret->spriteResourcesHeader, 0xE000, 0xE000, 0xE000, 0xE000, -1, -1, 0, priority, a0->unk_140[GF_GFX_RES_TYPE_CHAR], a0->unk_140[GF_GFX_RES_TYPE_PLTT], a0->unk_140[GF_GFX_RES_TYPE_CELL], a0->unk_140[GF_GFX_RES_TYPE_ANIM], NULL, NULL);

    spriteTemplate.spriteList = a0->spriteList;
    spriteTemplate.header = ret->spriteResourcesHeader;
    SetVecFx32(spriteTemplate.position, FX32_CONST(x), FX32_CONST(y), FX32_CONST(z));
    if (vramType == NNS_G2D_VRAM_TYPE_2DSUB) {
        spriteTemplate.position.y += FX32_CONST(192);
    }
    SetVecFx32(spriteTemplate.scale, FX32_ONE, FX32_ONE, FX32_ONE);
    spriteTemplate.rotation = 0;
    spriteTemplate.priority = drawPriority;
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

    a0->spriteList = G2dRenderer_Init(a0->unk_00C, &a0->unk_014, a0->heapId);
    spC[1] = a0->unk_00A;
    for (u32 i = 0; i < 4; ++i) {
        a0->unk_140[i] = Create2DGfxResObjMan(spC[i], (GfGfxResType)i, a0->heapId);
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
        Destroy2DGfxResObjMan(a0->unk_140[i]);
    }
}

void ov100_021E6D34(PokegearApp_UnkSub094 *a0, u16 a1) {
    GF_2DGfxResObjList *objList;

    objList = a0->spriteResources[GF_GFX_RES_TYPE_CHAR];
    objList->obj[0] = AddCharResObjFromNarc(a0->unk_140[GF_GFX_RES_TYPE_CHAR], NARC_a_1_4_3, a1 + 6, FALSE, 0xE000, (NNS_G2D_VRAM_TYPE)a0->unk_00E, a0->heapId);
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
        objList->obj[0] = AddCellOrAnimResObjFromNarc(a0->unk_140[GF_GFX_RES_TYPE_CELL + i], NARC_a_1_4_3, 12 + i, FALSE, 0xE000, (GfGfxResType)(GF_GFX_RES_TYPE_CELL + i), a0->heapId);
        GF_ASSERT(objList->obj[0] != NULL);
    }

    objList = a0->spriteResources[GF_GFX_RES_TYPE_PLTT];
    objList->obj[0] = AddPlttResObjFromNarc(a0->unk_140[GF_GFX_RES_TYPE_PLTT], NARC_a_1_4_3, a1, FALSE, 0xE000, (NNS_G2D_VRAM_TYPE)a0->unk_00E, 4, a0->heapId);
    GF_ASSERT(objList->obj[0] != NULL);
    sub_0200B00C(objList->obj[0]);
}

// functions for UnkStruct_ov100_021E6E20

UnkStruct_ov100_021E6E20 *ov100_021E6E20(int count, HeapID heapId) {
    UnkStruct_ov100_021E6E20 *ret = (UnkStruct_ov100_021E6E20 *)AllocFromHeap(heapId, sizeof(UnkStruct_ov100_021E6E20));
    MI_CpuClear8(ret, sizeof(UnkStruct_ov100_021E6E20));
    ret->max = count;
    ret->unk_08 = AllocFromHeap(heapId, count * sizeof(UnkStruct_ov100_021E6E20_Sub8));
    MI_CpuClear8(ret->unk_08, count * sizeof(UnkStruct_ov100_021E6E20_Sub8));
    return ret;
}

void ov100_021E6E58(UnkStruct_ov100_021E6E20 *a0) {
    MI_CpuClear8(a0->unk_08, a0->max * sizeof(UnkStruct_ov100_021E6E20_Sub8));
    Heap_Free(a0->unk_08);
    MI_CpuClear8(a0, sizeof(UnkStruct_ov100_021E6E20));
    Heap_Free(a0);
}

void ov100_021E6E84(UnkStruct_ov100_021E6E20 *a0) {
    for (u16 i = 0; i < a0->num; ++i) {
        if (a0->unk_08[i].unk_00 != 0 && a0->unk_08[i].unk_02 == 0) {
            Sprite_SetPositionXY(a0->unk_08[i].sprite, a0->unk_08[i].unk_04, a0->unk_08[i].unk_06);
        }
    }
}

u16 ov100_021E6EC4(UnkStruct_ov100_021E6E20 *a0, Sprite *sprite) {
    if (a0->num >= a0->max) {
        return 0xFFFF;
    }

    UnkStruct_ov100_021E6E20_Sub8 *ptr = &a0->unk_08[a0->num];
    ptr->sprite = sprite;
    ptr->unk_00 = 1;
    ptr->unk_01 = 1;
    return a0->num++;
}

void ov100_021E6EF4(UnkStruct_ov100_021E6E20 *a0) {
    for (u16 i = 0; i < a0->num; ++i) {
        if (a0->unk_08[i].sprite != NULL) {
            thunk_Sprite_Delete(a0->unk_08[i].sprite);
        }
    }
    MI_CpuClear8(a0->unk_08, a0->num * sizeof(UnkStruct_ov100_021E6E20_Sub8));
    a0->num = 0;
}

void ov100_021E6F34(UnkStruct_ov100_021E6E20 *a0, u8 firstIndex) {
    u16 i;
    u16 clearCount;

    clearCount = a0->num - firstIndex;
    for (i = firstIndex; i < a0->num; ++i) {
        if (a0->unk_08[i].sprite != NULL) {
            thunk_Sprite_Delete(a0->unk_08[i].sprite);
        }
    }
    MI_CpuClear8(a0->unk_08 + firstIndex, clearCount * sizeof(UnkStruct_ov100_021E6E20_Sub8));
    a0->num -= clearCount;
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
    Heap_Free(appSwitch->buttons);
    MI_CpuClear8(appSwitch, sizeof(PokegearAppSwitch));
    Heap_Free(appSwitch);
}

u16 PokegearAppSwitch_AddButtons(PokegearAppSwitch *appSwitch, const PokegearAppSwitchButtonSpec *buttonSpec, u8 numSpecs, u8 cursorPos, BOOL managedSprites, HeapID heapId, PokegearSpriteUnion cursorSprite1, PokegearSpriteUnion cursorSprite2, PokegearSpriteUnion cursorSprite3, PokegearSpriteUnion cursorSprite4) {
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
    button->cursorSprites[0] = cursorSprite1;
    button->cursorSprites[1] = cursorSprite2;
    button->cursorSprites[2] = cursorSprite3;
    button->cursorSprites[3] = cursorSprite4;
    return index;
}

BOOL PokegearAppSwitch_RemoveButtons(PokegearAppSwitch *appSwitch, u16 buttonIndex) {
    if (buttonIndex >= appSwitch->count || !appSwitch->buttons[buttonIndex].buttonsAreActive) {
        return FALSE;
    }
    if (appSwitch->lastButtonIndex == buttonIndex) {
        appSwitch->lastButtonIndex = 0xFFFF;
        appSwitch->lastButton = NULL;
    }
    MI_CpuClear8(appSwitch->buttons[buttonIndex].buttonSpec, appSwitch->buttons[buttonIndex].count * sizeof(PokegearAppSwitchButtonSpec));
    Heap_Free(appSwitch->buttons[buttonIndex].buttonSpec);
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

u16 PokegearAppSwitchCursor_SetCursorSpritesDrawState(PokegearAppSwitch *cursor, u16 index, BOOL draw) {
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

void ov100_021E71B4(PokegearAppSwitch *appSwitch, u16 index) {
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
    appSwitch->lastButtonIndex = index;
    if (cursorPos != 0xFF) {
        if (cursorPos >= appSwitch->buttons[index].count) {
            appSwitch->buttons[index].cursorPos = 0;
        } else {
            appSwitch->buttons[index].cursorPos = cursorPos;
        }
    }
    ov100_021E71B4(appSwitch, 0xFFFF);
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

void ov100_021E7368(PokegearAppSwitch *appSwitch, u8 move) {
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

u8 ov100_021E73AC(PokegearAppSwitch *appSwitch, u8 move) {
    ov100_021E7368(appSwitch, move);
    ov100_021E71B4(appSwitch, 0xFFFF);
    return appSwitch->lastButton->cursorPos;
}

u8 ov100_021E73C8(PokegearAppSwitch *appSwitch, u8 newIndex) {
    return ov100_021E73D4(appSwitch, appSwitch->lastButtonIndex, newIndex);
}

u8 ov100_021E73D4(PokegearAppSwitch *appSwitch, u16 index, u8 newIndex) {
    PokegearAppSwitchButton *button;
    if (index == 0xFFFF) {
        button = appSwitch->lastButton;
        index = appSwitch->lastButtonIndex;
    } else if (index >= appSwitch->count || (button = &appSwitch->buttons[index], !button->buttonsAreActive)) {
        return 0;
    }
    if (button->lastIndex < newIndex) {
        button->cursorPos = 0;
    } else {
        button->cursorPos = newIndex;
    }
    ov100_021E71B4(appSwitch, index);
    return button->cursorPos;
}

void PokegearAppSwitch_SetCursorSpritesAnimateFlag(PokegearAppSwitch *appSwitch, u16 index, BOOL active) {
    if (index == 0xFFFF) {
        index = appSwitch->lastButtonIndex;
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
