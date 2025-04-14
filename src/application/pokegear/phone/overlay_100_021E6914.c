#include "application/pokegear/phone.h"

#include "math_util.h"
#include "unk_0200ACF0.h"
#include "unk_0200B150.h"
#include "vram_transfer_manager.h"

typedef struct UnkStruct_ov100_021E76BC {
    u32 unk_0;
    const OamManagerParam *unk_4;
    const OamCharTransferParam *unk_8;
    const u16 *unk_C;
} UnkStruct_ov100_021E76BC;

void ov100_021E6978(PokegearPhoneApp *phoneApp, int a1);
void ov100_021E69C8(PokegearPhoneApp *phoneApp);
void ov100_021E6CF4(PokegearPhoneApp_UnkSub094 *a0);
void ov100_021E6A58(PokegearPhoneApp_UnkSub094 *a0, int a1);

extern const u8 ov100_021E764C[];
extern const u8 ov100_021E770C[];
extern const UnkStruct_ov100_021E76BC ov100_021E76BC[];
void ov100_021E6C4C(PokegearPhoneApp_UnkSub094 *a0, u16 a1);

// -ipo file shenanigans
#define ov100_021E76BC_ipo ((const UnkStruct_ov100_021E76BC *)(ov100_021E764C + 0x70))

void ov100_021E6914(PokegearPhoneApp *phoneApp) {
    GF_CreateVramTransferManager(32, phoneApp->heapId);
    phoneApp->unk_08C = SpriteRenderer_Create(phoneApp->heapId);
    SpriteRenderer_CreateOamCharPlttManagers(phoneApp->unk_08C, ov100_021E76BC_ipo[0].unk_4, ov100_021E76BC_ipo[0].unk_8, 0x20);
    sub_0200B2E0(phoneApp->heapId);
    sub_0200B2E8(phoneApp->heapId);
}

void ov100_021E6950(PokegearPhoneApp *phoneApp) {
    SpriteRenderer_Delete(phoneApp->unk_08C);
    phoneApp->unk_08C = NULL;
    GF_DestroyVramTransferManager();
    sub_0200B2E0(phoneApp->heapId);
    sub_0200B2E8(phoneApp->heapId);
}

void ov100_021E6978(PokegearPhoneApp *phoneApp, int a1) {
    if (phoneApp->unk_08C != NULL) {
        phoneApp->unk_090 = SpriteRenderer_CreateGfxHandler(phoneApp->unk_08C);
        SpriteRenderer_CreateSpriteList(phoneApp->unk_08C, phoneApp->unk_090, ov100_021E76BC[a1].unk_0);
        sub_0200D2A4(phoneApp->unk_08C, phoneApp->unk_090, ov100_021E76BC[a1].unk_C, 1, 0);
    }
}

void ov100_021E69C8(PokegearPhoneApp *phoneApp) {
    if (phoneApp->unk_090 != NULL) {
        SpriteRenderer_RemoveGfxHandler(phoneApp->unk_08C, phoneApp->unk_090);
        phoneApp->unk_090 = NULL;
    }
}

void ov100_021E69E8(PokegearPhoneApp *phoneApp) {
    if (phoneApp->unk_090 != NULL) {
        SpriteGfxHandler_RenderAndAnimateSprites(phoneApp->unk_090);
    }
}

PokegearPhoneApp_UnkSub094 *ov100_021E69F8(HeapID heapId, u16 a1, u16 a2, u16 a3, u16 a4, int a5) {
    PokegearPhoneApp_UnkSub094 *ret = AllocFromHeap(heapId, sizeof(PokegearPhoneApp_UnkSub094));
    MI_CpuClear8(ret, sizeof(PokegearPhoneApp_UnkSub094));
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

void ov100_021E6A3C(PokegearPhoneApp_UnkSub094 *a0) {
    ov100_021E6CF4(a0);
    MI_CpuClear8(a0, sizeof(PokegearPhoneApp_UnkSub094));
    FreeToHeap(a0);
}

void ov100_021E6A58(PokegearPhoneApp_UnkSub094 *a0, int a1) {
    GF_2DGfxResObj *obj;

    obj = a0->unk_150[GF_GFX_RES_TYPE_CHAR]->obj[0];
    ReplaceCharResObjFromNarc(a0->unk_140[GF_GFX_RES_TYPE_CHAR], obj, NARC_a_1_4_3, a1 + 6, FALSE, a0->heapId);
    sub_0200AE8C(obj);

    obj = a0->unk_150[GF_GFX_RES_TYPE_PLTT]->obj[0];
    ReplacePlttResObjFromNarc(a0->unk_140[GF_GFX_RES_TYPE_PLTT], obj, NARC_a_1_4_3, a1, FALSE, a0->heapId);
    sub_0200B084(obj);
}

void ov100_021E6AB0(PokegearPhoneApp_UnkSub094 *a0) {
    if (a0->unk_010 != NULL) {
        SpriteList_RenderAndAnimateSprites(a0->unk_010);
    }
}

UnkImageStruct *ov100_021E6AC0(PokegearPhoneApp_UnkSub094 *a0, u8 x, u8 y, u8 z, u8 a4, u8 a5, u8 a6, u8 a7, int a8) {
    NNS_G2D_VRAM_TYPE r6;
    UnkImageStruct *ret;
    SpriteTemplate sp34;

    ret = AllocFromHeap(a0->heapId, sizeof(UnkImageStruct));
    MI_CpuClear8(ret, sizeof(UnkImageStruct));
    ret->spriteResourceHeaderList = AllocFromHeap(a0->heapId, sizeof(SpriteResourceHeaderList));
    ret->spriteResourceHeaderList->headers = AllocFromHeap(a0->heapId, sizeof(SpriteResourcesHeader));
    // ret->spriteResourceHeaderList->num = 1;
    ret->spriteResourcesHeader = ret->spriteResourceHeaderList->headers;
    r6 = a8 == 0 ? NNS_G2D_VRAM_TYPE_2DMAIN : NNS_G2D_VRAM_TYPE_2DSUB;
    CreateSpriteResourcesHeader(ret->spriteResourcesHeader, 0xE000, 0xE000, 0xE000, 0xE000, -1, -1, 0, a4, a0->unk_140[GF_GFX_RES_TYPE_CHAR], a0->unk_140[GF_GFX_RES_TYPE_PLTT], a0->unk_140[GF_GFX_RES_TYPE_CELL], a0->unk_140[GF_GFX_RES_TYPE_ANIM], NULL, NULL);

    sp34.spriteList = a0->unk_010;
    sp34.header = ret->spriteResourcesHeader;
    SetVecFx32(sp34.position, FX32_CONST(x), FX32_CONST(y), FX32_CONST(z));
    if (r6 == NNS_G2D_VRAM_TYPE_2DSUB) {
        sp34.position.y += FX32_CONST(192);
    }
    SetVecFx32(sp34.scale, FX32_ONE, FX32_ONE, FX32_ONE);
    sp34.rotation = 0;
    sp34.priority = a5;
    sp34.whichScreen = r6;
    sp34.heapId = a0->heapId;
    ret->sprite = Sprite_CreateAffine(&sp34);
    GF_2DGfxResObj *obj = a0->unk_150[GF_GFX_RES_TYPE_PLTT]->obj[0];
    if (ret->sprite != NULL) {
        int r5 = a7;
        Sprite_SetAnimCtrlSeq(ret->sprite, r5);
        Sprite_SetPalIndex(ret->sprite, ov100_021E770C[r5] + GF_PlttResObj_GetVramSlotNum(obj, r6));
    } else {
        GF_ASSERT(FALSE);
    }
    return ret;
}

void ov100_021E6C44(UnkImageStruct *a0) {
    UnkImageStruct_Delete(a0);
}
