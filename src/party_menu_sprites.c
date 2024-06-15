#include "gf_gfx_loader.h"
#include "global.h"
#include "party_menu_sprites.h"
#include "pokemon_icon_idx.h"
#include "vram_transfer_manager.h"

extern const UnkStruct_0200D2B4 _021018F8[24];

void sub_0207EB24(PartyMenuStruct *partyMenu) {
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_ON);
    GfGfx_EngineBTogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_ON);
    GF_CreateVramTransferManager(32, HEAP_ID_PARTY_MENU);
    partyMenu->unk_658 = SpriteRenderer_Create(HEAP_ID_PARTY_MENU);
    partyMenu->unk_65C = SpriteRenderer_CreateGfxHandler(partyMenu->unk_658);

    extern const Unk122_021E92FC _021018D8;
    Unk122_021E92FC sp24 = _021018D8;

    extern const Unk122_021E92D0 _021018C4;
    Unk122_021E92D0 sp10 = _021018C4;

    sub_0200CF70(partyMenu->unk_658, &sp24, &sp10, 32);
    sub_0200CFF4(partyMenu->unk_658, partyMenu->unk_65C, 49);
    G2dRenderer_SetSubSurfaceCoords(SpriteRenderer_GetG2dRendererPtr(partyMenu->unk_658), 0, FX32_CONST(256));

    extern const u16 _021018B4[7];
    u16 sp0[7];
    ARRAY_ASSIGN(sp0, _021018B4);
    sub_0200D294(partyMenu->unk_658, partyMenu->unk_65C, sp0);
}

void sub_0207EBE4(PartyMenuStruct *partyMenu, u8 partySlot, u16 x, u16 y, NARC *narc) {
    Pokemon *mon = Party_GetMonByIndex(partyMenu->args->party, partySlot);
    UnkStruct_0200D2B4 sp1C;
    int isEgg;

    partyMenu->monsDrawState[partySlot].unk_16 = x;
    partyMenu->monsDrawState[partySlot].unk_18 = y;

    sub_0200E2B8(partyMenu->unk_658, partyMenu->unk_65C, narc, Pokemon_GetIconNaix(mon), FALSE, partySlot + 4);

    isEgg = GetMonData(mon, MON_DATA_IS_EGG, NULL);

    sp1C.resourceSet = partySlot + 4;
    sp1C.x = x;
    sp1C.y = y;
    sp1C.z = 0;
    sp1C.animSeqNo = 0;
    sp1C.rotation = 0;
    sp1C.unk_10 = GetMonIconPaletteEx(partyMenu->monsDrawState[partySlot].species, partyMenu->monsDrawState[partySlot].form, isEgg) + 3;
    sp1C.whichScreen = NNS_G2D_VRAM_TYPE_2DMAIN;
    sp1C.unk_18 = 0;
    sp1C.unk_1C = 0;
    sp1C.unk_20 = 0;
    sp1C.unk_24 = 0;
    partyMenu->monsDrawState[partySlot].unk_24 = SpriteRenderer_CreateSprite(partyMenu->unk_658, partyMenu->unk_65C, &sp1C);
    sp1C.whichScreen = NNS_G2D_VRAM_TYPE_2DMAIN;
    sp1C.unk_10 = GetMonIconPaletteEx(partyMenu->monsDrawState[partySlot].species, partyMenu->monsDrawState[partySlot].form, isEgg) + 1;
    sp1C.x = x;
    sp1C.y = y + 0x100;
    partyMenu->monsDrawState[partySlot].unk_28 = SpriteRenderer_CreateSprite(partyMenu->unk_658, partyMenu->unk_65C, &sp1C);
}

void sub_0207ECE0(PartyMenuStruct *partyMenu, u8 partySlot) {
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
    imageLocation = NNS_G2dGetImageLocation(Sprite_GetImageProxy(partyMenu->monsDrawState[partySlot].unk_24), NNS_G2D_VRAM_TYPE_2DMAIN);
    ncgrFile = GfGfxLoader_LoadFromOpenNarc(narc, Pokemon_GetIconNaix(mon), FALSE, HEAP_ID_PARTY_MENU, TRUE);
    if (NNS_G2dGetUnpackedCharacterData(ncgrFile, &pCharData)) {
        DC_FlushRange(pCharData->pRawData, pCharData->szByte);
        GX_LoadOBJ(pCharData->pRawData, imageLocation, pCharData->szByte);
        subImageLocation = NNS_G2dGetImageLocation(Sprite_GetImageProxy(partyMenu->monsDrawState[partySlot].unk_28), NNS_G2D_VRAM_TYPE_2DSUB);
        DC_FlushRange(pCharData->pRawData, pCharData->szByte);
        GXS_LoadOBJ(pCharData->pRawData, subImageLocation, pCharData->szByte);
    }
    FreeToHeap(ncgrFile);
    thunk_Sprite_SetPalIndex(partyMenu->monsDrawState[partySlot].unk_24, GetMonIconPaletteEx(species, form, FALSE) + 3);
    thunk_Sprite_SetPalIndex(partyMenu->monsDrawState[partySlot].unk_28, GetMonIconPaletteEx(species, form, FALSE) + 1);
    NARC_Delete(narc);
}

void sub_0207EDD4(PartyMenuStruct *partyMenu) {
    partyMenu->sprites[6] = SpriteRenderer_CreateSprite(partyMenu->unk_658, partyMenu->unk_65C, &_021018F8[0]);
    partyMenu->sprites[7] = SpriteRenderer_CreateSprite(partyMenu->unk_658, partyMenu->unk_65C, &_021018F8[1]);
    partyMenu->sprites[8] = SpriteRenderer_CreateSprite(partyMenu->unk_658, partyMenu->unk_65C, &_021018F8[2]);
    partyMenu->sprites[9] = SpriteRenderer_CreateSprite(partyMenu->unk_658, partyMenu->unk_65C, &_021018F8[3]);
    partyMenu->sprites[28] = SpriteRenderer_CreateSprite(partyMenu->unk_658, partyMenu->unk_65C, &_021018F8[22]);

    for (u32 i = 0; i < 6; ++i) {
        partyMenu->sprites[10 + i] = SpriteRenderer_CreateSprite(partyMenu->unk_658, partyMenu->unk_65C, &_021018F8[4 + i]);
        partyMenu->monsDrawState[i].unk_1A = _021018F8[4 + i].x;
        partyMenu->monsDrawState[i].unk_1C = _021018F8[4 + i].y;
        Set2dSpriteVisibleFlag(partyMenu->sprites[10 + i], FALSE);

        partyMenu->sprites[16 + i] = SpriteRenderer_CreateSprite(partyMenu->unk_658, partyMenu->unk_65C, &_021018F8[10 + i]);
        partyMenu->sprites[22 + i] = SpriteRenderer_CreateSprite(partyMenu->unk_658, partyMenu->unk_65C, &_021018F8[16 + i]);
    }
    for (u32 i = 0; i < 6; ++i) {
        partyMenu->sprites[58 + i] = SpriteRenderer_CreateSprite(partyMenu->unk_658, partyMenu->unk_65C, &_021018F8[23]);
        Set2dSpriteVisibleFlag(partyMenu->sprites[58 + i], FALSE);
    }
    Set2dSpriteVisibleFlag(partyMenu->sprites[7], FALSE);
    Set2dSpriteVisibleFlag(partyMenu->sprites[28], FALSE);
}
