#include "party_menu_sprites.h"

#include "global.h"

#include "data/resdat.naix"

#include "gf_gfx_loader.h"
#include "pokemon_icon_idx.h"
#include "unk_0208805C.h"
#include "vram_transfer_manager.h"

static void sub_0207F0FC(Sprite *sprite, u8 seqNo);
static int sub_0207F11C(PartyMenuMonsDrawState *monDraw);

static const UnmanagedSpriteTemplate sSpriteTemplates[24] = {
    {
     0x1,
     0x40,
     0x18,
     0x0,
     0x1,
     0x3,
     0x0,
     NNS_G2D_VRAM_TYPE_2DMAIN,
     0x0,
     0x0,
     0x0,
     0x0,
     },
    {
     0x1,
     0x40,
     0x48,
     0x0,
     0x2,
     0x2,
     0x0,
     NNS_G2D_VRAM_TYPE_2DMAIN,
     0x0,
     0x0,
     0x0,
     0x0,
     },
    {
     0x2,
     0xE8,
     0xA8,
     0x0,
     0x2,
     0x1,
     0x0,
     NNS_G2D_VRAM_TYPE_2DMAIN,
     0x0,
     0x0,
     0x0,
     0x0,
     },
    {
     0x2,
     0xE8,
     0xB8,
     0x0,
     0x2,
     0x1,
     0x0,
     NNS_G2D_VRAM_TYPE_2DMAIN,
     0x0,
     0x0,
     0x0,
     0x0,
     },
    {
     0x3,
     0x24,
     0x2C,
     0x0,
     0x0,
     0x1,
     0x2,
     NNS_G2D_VRAM_TYPE_2DMAIN,
     0x0,
     0x0,
     0x0,
     0x0,
     },
    {
     0x3,
     0xA4,
     0x34,
     0x0,
     0x0,
     0x1,
     0x2,
     NNS_G2D_VRAM_TYPE_2DMAIN,
     0x0,
     0x0,
     0x0,
     0x0,
     },
    {
     0x3,
     0x24,
     0x5C,
     0x0,
     0x0,
     0x1,
     0x2,
     NNS_G2D_VRAM_TYPE_2DMAIN,
     0x0,
     0x0,
     0x0,
     0x0,
     },
    {
     0x3,
     0xA4,
     0x64,
     0x0,
     0x0,
     0x1,
     0x2,
     NNS_G2D_VRAM_TYPE_2DMAIN,
     0x0,
     0x0,
     0x0,
     0x0,
     },
    {
     0x3,
     0x24,
     0x8C,
     0x0,
     0x0,
     0x1,
     0x2,
     NNS_G2D_VRAM_TYPE_2DMAIN,
     0x0,
     0x0,
     0x0,
     0x0,
     },
    {
     0x3,
     0xA4,
     0x94,
     0x0,
     0x0,
     0x1,
     0x2,
     NNS_G2D_VRAM_TYPE_2DMAIN,
     0x0,
     0x0,
     0x0,
     0x0,
     },
    {
     0xA,
     0xA4,
     0x94,
     0x0,
     0x0,
     0x0,
     0x6,
     NNS_G2D_VRAM_TYPE_2DMAIN,
     0x0,
     0x0,
     0x0,
     0x0,
     },
    {
     0xA,
     0xA4,
     0x94,
     0x0,
     0x0,
     0x0,
     0x6,
     NNS_G2D_VRAM_TYPE_2DMAIN,
     0x0,
     0x0,
     0x0,
     0x0,
     },
    {
     0xA,
     0xA4,
     0x94,
     0x0,
     0x0,
     0x0,
     0x6,
     NNS_G2D_VRAM_TYPE_2DMAIN,
     0x0,
     0x0,
     0x0,
     0x0,
     },
    {
     0xA,
     0xA4,
     0x94,
     0x0,
     0x0,
     0x0,
     0x6,
     NNS_G2D_VRAM_TYPE_2DMAIN,
     0x0,
     0x0,
     0x0,
     0x0,
     },
    {
     0xA,
     0xA4,
     0x94,
     0x0,
     0x0,
     0x0,
     0x6,
     NNS_G2D_VRAM_TYPE_2DMAIN,
     0x0,
     0x0,
     0x0,
     0x0,
     },
    {
     0xA,
     0xA4,
     0x94,
     0x0,
     0x0,
     0x0,
     0x6,
     NNS_G2D_VRAM_TYPE_2DMAIN,
     0x0,
     0x0,
     0x0,
     0x0,
     },
    {
     0xA,
     0xA4,
     0x94,
     0x0,
     0x2,
     0x0,
     0x6,
     NNS_G2D_VRAM_TYPE_2DMAIN,
     0x0,
     0x0,
     0x0,
     0x0,
     },
    {
     0xA,
     0xA4,
     0x94,
     0x0,
     0x2,
     0x0,
     0x6,
     NNS_G2D_VRAM_TYPE_2DMAIN,
     0x0,
     0x0,
     0x0,
     0x0,
     },
    {
     0xA,
     0xA4,
     0x94,
     0x0,
     0x2,
     0x0,
     0x6,
     NNS_G2D_VRAM_TYPE_2DMAIN,
     0x0,
     0x0,
     0x0,
     0x0,
     },
    {
     0xA,
     0xA4,
     0x94,
     0x0,
     0x2,
     0x0,
     0x6,
     NNS_G2D_VRAM_TYPE_2DMAIN,
     0x0,
     0x0,
     0x0,
     0x0,
     },
    {
     0xA,
     0xA4,
     0x94,
     0x0,
     0x2,
     0x0,
     0x6,
     NNS_G2D_VRAM_TYPE_2DMAIN,
     0x0,
     0x0,
     0x0,
     0x0,
     },
    {
     0xA,
     0xA4,
     0x94,
     0x0,
     0x2,
     0x0,
     0x6,
     NNS_G2D_VRAM_TYPE_2DMAIN,
     0x0,
     0x0,
     0x0,
     0x0,
     },
    {
     0xB,
     0xA4,
     0x94,
     0x0,
     0x0,
     0x0,
     0x0,
     NNS_G2D_VRAM_TYPE_2DSUB,
     0x0,
     0x0,
     0x0,
     0x0,
     },
    {
     0x3,
     0x32,
     0x194,
     0x0,
     0x0,
     0x0,
     0x0,
     NNS_G2D_VRAM_TYPE_2DMAIN,
     0x0,
     0x0,
     0x0,
     0x0,
     },
};

void sub_0207EB24(PartyMenu *partyMenu) {
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_ON);
    GfGfx_EngineBTogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_ON);
    GF_CreateVramTransferManager(32, HEAP_ID_PARTY_MENU);
    partyMenu->spriteRenderer = SpriteSystem_Alloc(HEAP_ID_PARTY_MENU);
    partyMenu->spriteGfxHandler = SpriteManager_New(partyMenu->spriteRenderer);

    OamManagerParam oamManagerTemplate = {
        .fromOBJmain = 0,
        .numOBJmain = 128,
        .fromAffineMain = 0,
        .numAffineMain = 32,
        .fromOBJsub = 4,
        .numOBJsub = 124,
        .fromAffineSub = 1,
        .numAffineSub = 31,
    };
    OamCharTransferParam transferTemplate = {
        35,
        0x400,
        0x400,
        GX_OBJVRAMMODE_CHAR_1D_32K,
        GX_OBJVRAMMODE_CHAR_1D_32K,
    };
    SpriteSystem_Init(partyMenu->spriteRenderer, &oamManagerTemplate, &transferTemplate, 32);
    SpriteSystem_InitSprites(partyMenu->spriteRenderer, partyMenu->spriteGfxHandler, 49);
    G2dRenderer_SetSubSurfaceCoords(SpriteSystem_GetRenderer(partyMenu->spriteRenderer), 0, FX32_CONST(256));

    u16 _021018B4[7] = {
        NARC_resdat_resdat_00000050_bin,
        NARC_resdat_resdat_00000051_bin,
        NARC_resdat_resdat_00000049_bin,
        NARC_resdat_resdat_00000048_bin,
        0xFFFF,
        0xFFFF,
        NARC_resdat_resdat_00000084_bin,
    };
    sub_0200D294(partyMenu->spriteRenderer, partyMenu->spriteGfxHandler, _021018B4);
}

void sub_0207EBE4(PartyMenu *partyMenu, u8 partySlot, u16 x, u16 y, NARC *narc) {
    Pokemon *mon = Party_GetMonByIndex(partyMenu->args->party, partySlot);
    UnmanagedSpriteTemplate sp1C;
    int isEgg;

    partyMenu->monsDrawState[partySlot].iconX = x;
    partyMenu->monsDrawState[partySlot].iconY = y;

    sub_0200E2B8(partyMenu->spriteRenderer, partyMenu->spriteGfxHandler, narc, Pokemon_GetIconNaix(mon), FALSE, partySlot + 4);

    isEgg = GetMonData(mon, MON_DATA_IS_EGG, NULL);

    sp1C.resourceSet = partySlot + 4;
    sp1C.x = x;
    sp1C.y = y;
    sp1C.z = 0;
    sp1C.animSeqNo = 0;
    sp1C.rotation = 0;
    sp1C.palIndex = GetMonIconPaletteEx(partyMenu->monsDrawState[partySlot].species, partyMenu->monsDrawState[partySlot].form, isEgg) + 3;
    sp1C.whichScreen = NNS_G2D_VRAM_TYPE_2DMAIN;
    sp1C.unk_18 = 0;
    sp1C.unk_1C = 0;
    sp1C.unk_20 = 0;
    sp1C.unk_24 = 0;
    partyMenu->monsDrawState[partySlot].iconSprite = SpriteSystem_CreateSpriteFromResourceHeader(partyMenu->spriteRenderer, partyMenu->spriteGfxHandler, &sp1C);
    sp1C.whichScreen = NNS_G2D_VRAM_TYPE_2DMAIN;
    sp1C.palIndex = GetMonIconPaletteEx(partyMenu->monsDrawState[partySlot].species, partyMenu->monsDrawState[partySlot].form, isEgg) + 1;
    sp1C.x = x;
    sp1C.y = y + 0x100;
    partyMenu->monsDrawState[partySlot].mainScreenIconSprite = SpriteSystem_CreateSpriteFromResourceHeader(partyMenu->spriteRenderer, partyMenu->spriteGfxHandler, &sp1C);
}

void sub_0207ECE0(PartyMenu *partyMenu, u8 partySlot) {
    Pokemon *mon;
    NARC *narc;
    int species;
    int form;
    u32 imageLocation;
    u32 subImageLocation;
    void *ncgrFile;
    NNSG2dCharacterData *pCharData;

    mon = Party_GetMonByIndex(partyMenu->args->party, partySlot);
    species = GetMonData(mon, MON_DATA_SPECIES, NULL);
    form = GetMonData(mon, MON_DATA_FORM, NULL);
    narc = NARC_New(NARC_poketool_icongra_poke_icon, HEAP_ID_PARTY_MENU);
    imageLocation = NNS_G2dGetImageLocation(Sprite_GetImageProxy(partyMenu->monsDrawState[partySlot].iconSprite), NNS_G2D_VRAM_TYPE_2DMAIN);
    ncgrFile = GfGfxLoader_LoadFromOpenNarc(narc, Pokemon_GetIconNaix(mon), FALSE, HEAP_ID_PARTY_MENU, TRUE);
    if (NNS_G2dGetUnpackedCharacterData(ncgrFile, &pCharData)) {
        DC_FlushRange(pCharData->pRawData, pCharData->szByte);
        GX_LoadOBJ(pCharData->pRawData, imageLocation, pCharData->szByte);
        subImageLocation = NNS_G2dGetImageLocation(Sprite_GetImageProxy(partyMenu->monsDrawState[partySlot].mainScreenIconSprite), NNS_G2D_VRAM_TYPE_2DSUB);
        DC_FlushRange(pCharData->pRawData, pCharData->szByte);
        GXS_LoadOBJ(pCharData->pRawData, subImageLocation, pCharData->szByte);
    }
    Heap_Free(ncgrFile);
    thunk_Sprite_SetPaletteOverride(partyMenu->monsDrawState[partySlot].iconSprite, GetMonIconPaletteEx(species, form, FALSE) + 3);
    thunk_Sprite_SetPaletteOverride(partyMenu->monsDrawState[partySlot].mainScreenIconSprite, GetMonIconPaletteEx(species, form, FALSE) + 1);
    NARC_Delete(narc);
}

void sub_0207EDD4(PartyMenu *partyMenu) {
    partyMenu->sprites[PARTY_MENU_SPRITE_ID_CURSOR] = SpriteSystem_CreateSpriteFromResourceHeader(partyMenu->spriteRenderer, partyMenu->spriteGfxHandler, &sSpriteTemplates[0]);
    partyMenu->sprites[PARTY_MENU_SPRITE_ID_SWITCH_MON_CURSOR] = SpriteSystem_CreateSpriteFromResourceHeader(partyMenu->spriteRenderer, partyMenu->spriteGfxHandler, &sSpriteTemplates[1]);
    partyMenu->sprites[PARTY_MENU_SPRITE_ID_8] = SpriteSystem_CreateSpriteFromResourceHeader(partyMenu->spriteRenderer, partyMenu->spriteGfxHandler, &sSpriteTemplates[2]);
    partyMenu->sprites[PARTY_MENU_SPRITE_ID_9] = SpriteSystem_CreateSpriteFromResourceHeader(partyMenu->spriteRenderer, partyMenu->spriteGfxHandler, &sSpriteTemplates[3]);
    partyMenu->sprites[PARTY_MENU_SPRITE_ID_28] = SpriteSystem_CreateSpriteFromResourceHeader(partyMenu->spriteRenderer, partyMenu->spriteGfxHandler, &sSpriteTemplates[22]);

    for (u32 i = 0; i < 6; ++i) {
        partyMenu->sprites[PARTY_MENU_SPRITE_ID_MON1_STATUS + i] = SpriteSystem_CreateSpriteFromResourceHeader(partyMenu->spriteRenderer, partyMenu->spriteGfxHandler, &sSpriteTemplates[4 + i]);
        partyMenu->monsDrawState[i].statusIconX = sSpriteTemplates[4 + i].x;
        partyMenu->monsDrawState[i].statusIconY = sSpriteTemplates[4 + i].y;
        Sprite_SetDrawFlag(partyMenu->sprites[PARTY_MENU_SPRITE_ID_MON1_STATUS + i], FALSE);

        partyMenu->sprites[PARTY_MENU_SPRITE_ID_MON1_HELD_ITEM + i] = SpriteSystem_CreateSpriteFromResourceHeader(partyMenu->spriteRenderer, partyMenu->spriteGfxHandler, &sSpriteTemplates[10 + i]);
        partyMenu->sprites[PARTY_MENU_SPRITE_ID_MON1_CAPSULE + i] = SpriteSystem_CreateSpriteFromResourceHeader(partyMenu->spriteRenderer, partyMenu->spriteGfxHandler, &sSpriteTemplates[16 + i]);
    }
    for (u32 i = 0; i < 6; ++i) {
        partyMenu->mainScreenStatusSprites[i] = SpriteSystem_CreateSpriteFromResourceHeader(partyMenu->spriteRenderer, partyMenu->spriteGfxHandler, &sSpriteTemplates[23]);
        Sprite_SetDrawFlag(partyMenu->mainScreenStatusSprites[i], FALSE);
    }
    Sprite_SetDrawFlag(partyMenu->sprites[PARTY_MENU_SPRITE_ID_SWITCH_MON_CURSOR], FALSE);
    Sprite_SetDrawFlag(partyMenu->sprites[PARTY_MENU_SPRITE_ID_28], FALSE);
}

void sub_0207EF5C(PartyMenu *partyMenu, u8 partySlot, u16 x, u16 y) {
    UnmanagedSpriteTemplate sp0;

    sp0.resourceSet = 0;
    sp0.x = x;
    sp0.y = y;
    sp0.z = 0;
    sp0.animSeqNo = 0;
    sp0.palIndex = 0;
    sp0.unk_18 = 0;
    sp0.unk_1C = 0;
    sp0.unk_20 = 0;
    sp0.unk_24 = 0;
    sp0.rotation = 1;
    sp0.whichScreen = NNS_G2D_VRAM_TYPE_2DMAIN;
    partyMenu->sprites[partySlot + PARTY_MENU_SPRITE_ID_BALL] = SpriteSystem_CreateSpriteFromResourceHeader(partyMenu->spriteRenderer, partyMenu->spriteGfxHandler, &sp0);
}

void PartyMenu_RemoveSpriteRenderer(PartyMenu *partyMenu) {
    SpriteSystem_DestroySpriteManager(partyMenu->spriteRenderer, partyMenu->spriteGfxHandler);
    SpriteSystem_Free(partyMenu->spriteRenderer);
}

void PartyMenu_DrawMonStatusIcon(PartyMenu *partyMenu, u8 partySlot, u8 status) {
    Sprite **pSprite1 = &partyMenu->sprites[partySlot + PARTY_MENU_SPRITE_ID_MON1_STATUS];
    Sprite **pSprite2 = &partyMenu->mainScreenStatusSprites[partySlot];
    if (status == PARTY_MON_STATUS_ICON_OK) {
        Sprite_SetDrawFlag(*pSprite1, FALSE);
    } else {
        Sprite_SetAnimCtrlSeq(*pSprite1, status);
        Sprite_SetAnimCtrlSeq(*pSprite2, status);
        Sprite_SetDrawFlag(*pSprite1, TRUE);
    }
}

void PartyMenu_DrawMonHeldItemIcon(PartyMenu *partyMenu, u8 partySlot, u16 heldItem) {
    Sprite **pSprite = &partyMenu->sprites[partySlot + PARTY_MENU_SPRITE_ID_MON1_HELD_ITEM];
    if (heldItem == ITEM_NONE) {
        Sprite_SetDrawFlag(*pSprite, FALSE);
    } else {
        if (ItemIdIsMail(heldItem) == TRUE) {
            Sprite_SetAnimCtrlSeq(*pSprite, 1);
        } else {
            Sprite_SetAnimCtrlSeq(*pSprite, 0);
        }
        Sprite_SetDrawFlag(*pSprite, TRUE);
    }
}

void PartyMenu_SetMonHeldMailIcon(PartyMenu *partyMenu, u8 partySlot) {
    Sprite **pSprite = &partyMenu->sprites[partySlot + PARTY_MENU_SPRITE_ID_MON1_HELD_ITEM];

    Sprite_SetAnimCtrlSeq(*pSprite, 1);
    Sprite_SetDrawFlag(*pSprite, TRUE);
}

void PartyMenu_SetMonHeldItemIconCoords(PartyMenu *partyMenu, u8 partySlot, s16 x, s16 y) {
    partyMenu->monsDrawState[partySlot].heldItemX = x + 8;
    partyMenu->monsDrawState[partySlot].heldItemY = y + 8;
    Sprite_SetPositionXY(partyMenu->sprites[partySlot + PARTY_MENU_SPRITE_ID_MON1_HELD_ITEM], partyMenu->monsDrawState[partySlot].heldItemX, partyMenu->monsDrawState[partySlot].heldItemY);
}

void PartyMenu_RefreshMonCapsuleIconSpritePos(PartyMenu *partyMenu, u8 partySlot) {
    Sprite_SetPositionXY(partyMenu->sprites[partySlot + PARTY_MENU_SPRITE_ID_MON1_CAPSULE], partyMenu->monsDrawState[partySlot].heldItemX + 8, partyMenu->monsDrawState[partySlot].heldItemY);
}

void PartyMenu_DrawMonCapsuleIcon(PartyMenu *partyMenu, u8 partySlot) {
    Sprite **pSprite = &partyMenu->sprites[partySlot + PARTY_MENU_SPRITE_ID_MON1_CAPSULE];
    if (partyMenu->monsDrawState[partySlot].capsule == 0) {
        Sprite_SetDrawFlag(*pSprite, FALSE);
    } else {
        Sprite_SetDrawFlag(*pSprite, TRUE);
    }
}

static void sub_0207F0FC(Sprite *sprite, u8 seqNo) {
    if (seqNo != Sprite_GetAnimationNumber(sprite)) {
        Sprite_SetAnimationFrame(sprite, 0);
        Sprite_SetAnimCtrlSeq(sprite, seqNo);
    }
}

static int sub_0207F11C(PartyMenuMonsDrawState *monDraw) {
    if (monDraw->hp == 0) {
        return 0;
    }
    if (monDraw->status != PARTY_MON_STATUS_ICON_OK && monDraw->status != PARTY_MON_STATUS_ICON_UNSET && monDraw->status != PARTY_MON_STATUS_ICON_FNT) {
        return 5;
    }
    switch (CalculateHpBarColor(monDraw->hp, monDraw->maxHp, 48)) {
    case 4:
        return 1;
    case 3:
        return 2;
    case 2:
        return 3;
    case 1:
        return 4;
    case 0:
    default:
        return 0;
    }
}

void sub_0207F178(PartyMenu *partyMenu) {
    PartyMenuMonsDrawState *monDraw;
    u16 i;

    for (i = 0; i < 6; ++i) {
        monDraw = &partyMenu->monsDrawState[i];
        if (monDraw->active) {
            int animSeqNo;
            if (partyMenu->swapMonsData.active == 1 && (partyMenu->swapMonsData.slots[0] == i || partyMenu->swapMonsData.slots[1] == i)) {
                animSeqNo = 0;
            } else {
                animSeqNo = sub_0207F11C(monDraw);
            }
            sub_0207F0FC(monDraw->iconSprite, animSeqNo);
            Sprite_UpdateAnim(monDraw->iconSprite, FX32_ONE);
            if (partyMenu->partyMonIndex == i && animSeqNo != 0 && animSeqNo != 5) {
                if (Sprite_GetAnimationFrame(monDraw->iconSprite) == 0) {
                    Sprite_SetPositionXY(monDraw->iconSprite, monDraw->iconX, monDraw->iconY - 3);
                } else {
                    Sprite_SetPositionXY(monDraw->iconSprite, monDraw->iconX, monDraw->iconY + 1);
                }
            } else {
                Sprite_SetPositionXY(monDraw->iconSprite, monDraw->iconX, monDraw->iconY);
            }
        }
    }
}

void sub_0207F240(PartyMenu *partyMenu, u8 partySlot, int selected) {
    u8 sp1, sp0;
    sub_02020A0C(&partyMenu->unk_948[partySlot], &sp1, &sp0);
    Sprite_SetAnimCtrlSeq(partyMenu->sprites[PARTY_MENU_SPRITE_ID_CURSOR], sub_0207B5EC(partyMenu->args->unk_25, partySlot));
    Sprite_SetDrawFlag(partyMenu->sprites[PARTY_MENU_SPRITE_ID_CURSOR], TRUE);
    Sprite_SetPositionXY(partyMenu->sprites[PARTY_MENU_SPRITE_ID_CURSOR], sp1, sp0);
    thunk_Sprite_SetPaletteOverride(partyMenu->sprites[PARTY_MENU_SPRITE_ID_CURSOR], selected);
}

void sub_0207F2A8(PartyMenu *partyMenu, s16 x, s16 y) {
    VecFx32 pos;
    pos.x = x * FX32_ONE;
    pos.y = y * FX32_ONE;
    pos.y += FX32_CONST(256);
    pos.z = 0;
    Sprite_SetMatrix(partyMenu->sprites[PARTY_MENU_SPRITE_ID_28], &pos);
    Sprite_SetDrawFlag(partyMenu->sprites[PARTY_MENU_SPRITE_ID_28], TRUE);
    Sprite_SetAnimationFrame(partyMenu->sprites[PARTY_MENU_SPRITE_ID_28], 0);
    Sprite_SetAnimCtrlSeq(partyMenu->sprites[PARTY_MENU_SPRITE_ID_28], 0);
}

void sub_0207F2F8(PartyMenu *partyMenu) {
    if (Sprite_GetDrawFlag(partyMenu->sprites[PARTY_MENU_SPRITE_ID_28]) == TRUE) {
        Sprite_UpdateAnim(partyMenu->sprites[PARTY_MENU_SPRITE_ID_28], FX32_ONE);
        if (Sprite_GetAnimationFrame(partyMenu->sprites[PARTY_MENU_SPRITE_ID_28]) == 2) {
            Sprite_SetDrawFlag(partyMenu->sprites[PARTY_MENU_SPRITE_ID_28], FALSE);
        }
    }
}

void PartyMenu_SetTopScreenSelectionPanelYDisplacement(PartyMenu *partyMenu, int dy) {
    for (int i = 0; i < Party_GetCount(partyMenu->args->party); ++i) {
        Sprite_SetPositionXY(partyMenu->monsDrawState[i].mainScreenIconSprite, 30, 456 - dy);
        Sprite_SetPositionXY(partyMenu->mainScreenStatusSprites[i], 50, 476 - dy);
    }
}

void PartyMenu_SetTopScreenMonIconSprite(PartyMenu *partyMenu, u8 selection) {
    for (int i = 0; i < Party_GetCount(partyMenu->args->party); ++i) {
        Sprite_SetDrawFlag(partyMenu->monsDrawState[i].mainScreenIconSprite, FALSE);
        Sprite_SetDrawFlag(partyMenu->mainScreenStatusSprites[i], FALSE);
    }
    Sprite_SetDrawFlag(partyMenu->monsDrawState[selection].mainScreenIconSprite, TRUE);
    if (partyMenu->monsDrawState[selection].status != PARTY_MON_STATUS_ICON_OK) {
        Sprite_SetDrawFlag(partyMenu->mainScreenStatusSprites[selection], TRUE);
    }
}
