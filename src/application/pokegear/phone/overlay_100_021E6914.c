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
void ov100_021E6A58(PokegearPhoneApp_UnkSub094 *a0, int a1);
void ov100_021E6C4C(PokegearPhoneApp_UnkSub094 *a0, u16 a1);
void ov100_021E6CF4(PokegearPhoneApp_UnkSub094 *a0);
void ov100_021E6D34(PokegearPhoneApp_UnkSub094 *a0, u16 a1);
u16 ov100_021E70FC(PokegearPhoneApp_UnkSub07C *a0);
void ov100_021E71B4(PokegearPhoneApp_UnkSub07C *a0, u16 a1);
void ov100_021E7368(PokegearPhoneApp_UnkSub07C *a0, u8 a1);
u8 ov100_021E73D4(PokegearPhoneApp_UnkSub07C *a0, u16 a1, u8 a2);

extern const u8 ov100_021E764C[];

static const OamManagerParam ov100_021E769C = {
    .fromOBJmain = 0x00,
    .numOBJmain = 0x80,
    .fromAffineMain = 0x00,
    .numAffineMain = 0x20,
    .fromOBJsub = 0x00,
    .numOBJsub = 0x80,
    .fromAffineSub = 0x00,
    .numAffineSub = 0x20,
};

static const OamCharTransferParam ov100_021E7688 = {
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
    { 0x80, &ov100_021E769C, &ov100_021E7688, ov100_021E7650 },
    { 0x80, &ov100_021E769C, &ov100_021E7688, ov100_021E766C },
    { 0xC0, &ov100_021E769C, &ov100_021E7688, ov100_021E767A },
    { 0x80, &ov100_021E769C, &ov100_021E7688, ov100_021E765E },
    { 0x80, &ov100_021E769C, &ov100_021E7688, ov100_021E767A },
};

void ov100_021E6914(PokegearPhoneApp *phoneApp) {
    GF_CreateVramTransferManager(32, phoneApp->heapId);
    phoneApp->unk_08C = SpriteRenderer_Create(phoneApp->heapId);
    SpriteRenderer_CreateOamCharPlttManagers(phoneApp->unk_08C, ov100_021E76BC[0].unk_4, ov100_021E76BC[0].unk_8, 0x20);
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

// functions for PokegearPhoneApp_UnkSub094

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

    static const u8 ov100_021E770C[] = { 2, 2, 2, 3, 1, 1, 1, 1 };

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

void ov100_021E6C4C(PokegearPhoneApp_UnkSub094 *a0, u16 a1) {
    u8 spC[4] = { 1, 1, 1, 1 };

    a0->unk_010 = G2dRenderer_Init(a0->unk_00C, &a0->unk_014, a0->heapId);
    spC[1] = a0->unk_00A;
    for (u32 i = 0; i < 4; ++i) {
        a0->unk_140[i] = Create2DGfxResObjMan(spC[i], (GfGfxResType)i, a0->heapId);
        a0->unk_150[i] = Create2DGfxResObjList(spC[i], a0->heapId);
        for (u32 j = 0; j < a0->unk_150[i]->max; ++j) {
            a0->unk_150[i]->obj[j] = NULL;
        }
    }
    ov100_021E6D34(a0, a1);
}

void ov100_021E6CF4(PokegearPhoneApp_UnkSub094 *a0) {
    SpriteList_Delete(a0->unk_010);
    sub_0200AED4(a0->unk_150[GF_GFX_RES_TYPE_CHAR]);
    sub_0200B0CC(a0->unk_150[GF_GFX_RES_TYPE_PLTT]);
    for (u32 i = 0; i < 4; ++i) {
        Delete2DGfxResObjList(a0->unk_150[i]);
        Destroy2DGfxResObjMan(a0->unk_140[i]);
    }
}

void ov100_021E6D34(PokegearPhoneApp_UnkSub094 *a0, u16 a1) {
    GF_2DGfxResObjList *objList;

    objList = a0->unk_150[GF_GFX_RES_TYPE_CHAR];
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
        objList = a0->unk_150[GF_GFX_RES_TYPE_CELL + i];
        objList->obj[0] = AddCellOrAnimResObjFromNarc(a0->unk_140[GF_GFX_RES_TYPE_CELL + i], NARC_a_1_4_3, 12 + i, FALSE, 0xE000, (GfGfxResType)(GF_GFX_RES_TYPE_CELL + i), a0->heapId);
        GF_ASSERT(objList->obj[0] != NULL);
    }

    objList = a0->unk_150[GF_GFX_RES_TYPE_PLTT];
    objList->obj[0] = AddPlttResObjFromNarc(a0->unk_140[GF_GFX_RES_TYPE_PLTT], NARC_a_1_4_3, a1, FALSE, 0xE000, (NNS_G2D_VRAM_TYPE)a0->unk_00E, 4, a0->heapId);
    GF_ASSERT(objList->obj[0] != NULL);
    sub_0200B00C(objList->obj[0]);
}

// functions for UnkStruct_ov100_021E6E20

UnkStruct_ov100_021E6E20 *ov100_021E6E20(int a1, HeapID heapId) {
    UnkStruct_ov100_021E6E20 *ret = (UnkStruct_ov100_021E6E20 *)AllocFromHeap(heapId, sizeof(UnkStruct_ov100_021E6E20));
    MI_CpuClear8(ret, sizeof(UnkStruct_ov100_021E6E20));
    ret->unk_00 = a1;
    ret->unk_08 = AllocFromHeap(heapId, a1 * sizeof(UnkStruct_ov100_021E6E20_Sub8));
    MI_CpuClear8(ret->unk_08, a1 * sizeof(UnkStruct_ov100_021E6E20_Sub8));
    return ret;
}

void ov100_021E6E58(UnkStruct_ov100_021E6E20 *a0) {
    MI_CpuClear8(a0->unk_08, a0->unk_00 * sizeof(UnkStruct_ov100_021E6E20_Sub8));
    FreeToHeap(a0->unk_08);
    MI_CpuClear8(a0, sizeof(UnkStruct_ov100_021E6E20));
    FreeToHeap(a0);
}

void ov100_021E6E84(UnkStruct_ov100_021E6E20 *a0) {
    for (u16 i = 0; i < a0->unk_02; ++i) {
        if (a0->unk_08[i].unk_00 != 0 && a0->unk_08[i].unk_02 == 0) {
            Sprite_SetPositionXY(a0->unk_08[i].unk_20, a0->unk_08[i].unk_04, a0->unk_08[i].unk_06);
        }
    }
}

u16 ov100_021E6EC4(UnkStruct_ov100_021E6E20 *a0, Sprite *a1) {
    if (a0->unk_02 >= a0->unk_00) {
        return 0xFFFF;
    }

    UnkStruct_ov100_021E6E20_Sub8 *ptr = &a0->unk_08[a0->unk_02];
    ptr->unk_20 = a1;
    ptr->unk_00 = 1;
    ptr->unk_01 = 1;
    return a0->unk_02++;
}

void ov100_021E6EF4(UnkStruct_ov100_021E6E20 *a0) {
    for (u16 i = 0; i < a0->unk_02; ++i) {
        if (a0->unk_08[i].unk_20 != NULL) {
            thunk_Sprite_Delete(a0->unk_08[i].unk_20);
        }
    }
    MI_CpuClear8(a0->unk_08, a0->unk_02 * sizeof(UnkStruct_ov100_021E6E20_Sub8));
    a0->unk_02 = 0;
}

void ov100_021E6F34(UnkStruct_ov100_021E6E20 *a0, u8 a1) {
    u16 i;
    u16 r7;

    r7 = a0->unk_02 - a1;
    for (i = a1; i < a0->unk_02; ++i) {
        if (a0->unk_08[i].unk_20 != NULL) {
            thunk_Sprite_Delete(a0->unk_08[i].unk_20);
        }
    }
    MI_CpuClear8(a0->unk_08 + a1, r7 * sizeof(UnkStruct_ov100_021E6E20_Sub8));
    a0->unk_02 -= r7;
}

// functions for PokegearPhoneApp_UnkSub07C

PokegearPhoneApp_UnkSub07C *ov100_021E6F88(int a1, HeapID heapId) {
    PokegearPhoneApp_UnkSub07C *ret = (PokegearPhoneApp_UnkSub07C *)AllocFromHeap(heapId, sizeof(PokegearPhoneApp_UnkSub07C));
    MI_CpuClear8(ret, sizeof(PokegearPhoneApp_UnkSub07C));
    ret->unk_00 = a1;
    ret->unk_04 = AllocFromHeap(heapId, a1 * sizeof(PokegearPhoneApp_UnkSub07C_Sub4));
    MI_CpuClear8(ret->unk_04, a1 * sizeof(PokegearPhoneApp_UnkSub07C_Sub4));
    return ret;
}

void ov100_021E6FBC(PokegearPhoneApp_UnkSub07C *a0) {
    for (int i = 0; i < a0->unk_00; ++i) {
        if (a0->unk_04[i].unk_00_0 && a0->unk_04[i].unk_04 != NULL) {
            ov100_021E70A4(a0, i);
        }
    }
    MI_CpuClear8(a0->unk_04, a0->unk_00 * sizeof(PokegearPhoneApp_UnkSub07C_Sub4));
    FreeToHeap(a0->unk_04);
    MI_CpuClear8(a0, sizeof(PokegearPhoneApp_UnkSub07C));
    FreeToHeap(a0);
}

u16 ov100_021E7014(PokegearPhoneApp_UnkSub07C *a0, const PokegearPhoneApp_UnkSub07C_Sub4_Sub4 *a1, u8 a2, u8 a3, BOOL a4, HeapID heapId, SpriteOrUnkImageStruct a6, SpriteOrUnkImageStruct a7, SpriteOrUnkImageStruct a8, SpriteOrUnkImageStruct a9) {
    u16 r6 = ov100_021E70FC(a0);
    if (r6 == 0xFFFF) {
        return 0xFFFF;
    }

    PokegearPhoneApp_UnkSub07C_Sub4 *r4 = &a0->unk_04[r6];
    r4->unk_00_0 = TRUE;
    r4->unk_00_2 = TRUE;
    r4->unk_02 = a2;
    r4->unk_03 = r4->unk_02 - 1;
    r4->unk_04 = AllocFromHeap(heapId, r4->unk_02 * sizeof(PokegearPhoneApp_UnkSub07C_Sub4_Sub4));
    MI_CpuCopy8(a1, r4->unk_04, r4->unk_02 * sizeof(PokegearPhoneApp_UnkSub07C_Sub4_Sub4));
    if (a3 >= r4->unk_02) {
        r4->unk_01 = 0;
    } else {
        r4->unk_01 = a3;
    }
    r4->unk_00_1 = a4;
    r4->unk_10[0] = a6;
    r4->unk_10[1] = a7;
    r4->unk_10[2] = a8;
    r4->unk_10[3] = a9;
    return r6;
}

BOOL ov100_021E70A4(PokegearPhoneApp_UnkSub07C *a0, u16 a1) {
    if (a1 >= a0->unk_00 || !a0->unk_04[a1].unk_00_0) {
        return FALSE;
    }
    if (a0->unk_02 == a1) {
        a0->unk_02 = 0xFFFF;
        a0->unk_08 = NULL;
    }
    MI_CpuClear8(a0->unk_04[a1].unk_04, a0->unk_04[a1].unk_02 * sizeof(PokegearPhoneApp_UnkSub07C_Sub4_Sub4));
    FreeToHeap(a0->unk_04[a1].unk_04);
    MI_CpuClear8(&a0->unk_04[a1], sizeof(PokegearPhoneApp_UnkSub07C_Sub4));
    return FALSE;
}

u16 ov100_021E70FC(PokegearPhoneApp_UnkSub07C *a0) {
    for (u16 i = 0; i < a0->unk_00; ++i) {
        if (!a0->unk_04[i].unk_00_0) {
            return i;
        }
    }

    return 0xFFFF;
}

u16 ov100_021E7128(PokegearPhoneApp_UnkSub07C *a0, u16 a1, BOOL a2) {
    PokegearPhoneApp_UnkSub07C_Sub4 *r4;
    if (a1 == 0xFFFF) {
        r4 = a0->unk_08;
    } else if (a1 >= a0->unk_00 || (r4 = &a0->unk_04[a1], !r4->unk_00_0)) {
        return 0xFFFF;
    }
    if (!r4->unk_00_1) {
        thunk_Set2dSpriteVisibleFlag(r4->unk_10[0].sprite, a2);
        if (r4->unk_00_2 == TRUE) {
            thunk_Set2dSpriteVisibleFlag(r4->unk_10[1].sprite, a2);
            thunk_Set2dSpriteVisibleFlag(r4->unk_10[2].sprite, a2);
            thunk_Set2dSpriteVisibleFlag(r4->unk_10[3].sprite, a2);
        }
    } else {
        UnkImageStruct_SetSpriteVisibleFlag(r4->unk_10[0].unk_image_struct, a2);
        if (r4->unk_00_2 == TRUE) {
            UnkImageStruct_SetSpriteVisibleFlag(r4->unk_10[1].unk_image_struct, a2);
            UnkImageStruct_SetSpriteVisibleFlag(r4->unk_10[2].unk_image_struct, a2);
            UnkImageStruct_SetSpriteVisibleFlag(r4->unk_10[3].unk_image_struct, a2);
        }
    }
    return a1;
}

void ov100_021E71B4(PokegearPhoneApp_UnkSub07C *a0, u16 a1) {
    PokegearPhoneApp_UnkSub07C_Sub4 *r4;
    if (a1 == 0xFFFF) {
        r4 = a0->unk_08;
    } else if (a1 >= a0->unk_00) {
        return;
    } else {
        r4 = &a0->unk_04[a1];
    }

    PokegearPhoneApp_UnkSub07C_Sub4_Sub4 *r5 = &r4->unk_04[r4->unk_01];
    if (!r4->unk_00_1) {
        if (!r4->unk_00_2) {
            Sprite_SetPositionXY(r4->unk_10[0].sprite, r5->unk_06, r5->unk_07);
        } else {
            Sprite_SetPositionXY(r4->unk_10[0].sprite, r5->unk_06 + r5->unk_08, r5->unk_07 + r5->unk_0A);
            Sprite_SetPositionXY(r4->unk_10[1].sprite, r5->unk_06 + r5->unk_08, r5->unk_07 + r5->unk_0B);
            Sprite_SetPositionXY(r4->unk_10[2].sprite, r5->unk_06 + r5->unk_09, r5->unk_07 + r5->unk_0A);
            Sprite_SetPositionXY(r4->unk_10[3].sprite, r5->unk_06 + r5->unk_09, r5->unk_07 + r5->unk_0B);
        }
    } else {
        if (!r4->unk_00_2) {
            UnkImageStruct_SetSpritePositionXY(r4->unk_10[0].unk_image_struct, r5->unk_06, r5->unk_07);
        } else {
            UnkImageStruct_SetSpritePositionXY(r4->unk_10[0].unk_image_struct, r5->unk_06 + r5->unk_08, r5->unk_07 + r5->unk_0A);
            UnkImageStruct_SetSpritePositionXY(r4->unk_10[1].unk_image_struct, r5->unk_06 + r5->unk_08, r5->unk_07 + r5->unk_0B);
            UnkImageStruct_SetSpritePositionXY(r4->unk_10[2].unk_image_struct, r5->unk_06 + r5->unk_09, r5->unk_07 + r5->unk_0A);
            UnkImageStruct_SetSpritePositionXY(r4->unk_10[3].unk_image_struct, r5->unk_06 + r5->unk_09, r5->unk_07 + r5->unk_0B);
        }
    }
}

u16 ov100_021E72F8(PokegearPhoneApp_UnkSub07C *a0, u16 a1, u8 a2) {
    if (a1 >= a0->unk_00) {
        return 0xFFFF;
    }
    a0->unk_08 = &a0->unk_04[a1];
    a0->unk_02 = a1;
    if (a2 != 0xFF) {
        if (a2 >= a0->unk_04[a1].unk_02) {
            a0->unk_04[a1].unk_01 = 0;
        } else {
            a0->unk_04[a1].unk_01 = a2;
        }
    }
    ov100_021E71B4(a0, 0xFFFF);
    return a1;
}

u8 ov100_021E7334(PokegearPhoneApp_UnkSub07C *a0) {
    return a0->unk_08->unk_01;
}

u8 ov100_021E733C(PokegearPhoneApp_UnkSub07C *a0, u16 a1) {
    if (a1 == 0xFFFF) {
        return a0->unk_08->unk_01;
    } else if (a1 >= a0->unk_00 || !a0->unk_04[a1].unk_00_0) {
        return 0;
    } else {
        return a0->unk_04[a1].unk_01;
    }
}

void ov100_021E7368(PokegearPhoneApp_UnkSub07C *a0, u8 a1) {
    if (a0->unk_08 != NULL) {
        PokegearPhoneApp_UnkSub07C_Sub4_Sub4 *r2 = &a0->unk_08->unk_04[a0->unk_08->unk_01];
        u8 r2_2;
        switch (a1) {
        case 1:
            r2_2 = r2->unk_03;
            break;
        case 2:
            r2_2 = r2->unk_04;
            break;
        case 3:
            r2_2 = r2->unk_05;
            break;
        case 0:
        default:
            r2_2 = r2->unk_02;
            break;
        }
        if (r2_2 <= a0->unk_08->unk_03) {
            a0->unk_08->unk_01 = r2_2;
        }
    }
}

u8 ov100_021E73AC(PokegearPhoneApp_UnkSub07C *a0, u8 a1) {
    ov100_021E7368(a0, a1);
    ov100_021E71B4(a0, 0xFFFF);
    return a0->unk_08->unk_01;
}

u8 ov100_021E73C8(PokegearPhoneApp_UnkSub07C *a0, u8 a1) {
    return ov100_021E73D4(a0, a0->unk_02, a1);
}

u8 ov100_021E73D4(PokegearPhoneApp_UnkSub07C *a0, u16 a1, u8 a2) {
    PokegearPhoneApp_UnkSub07C_Sub4 *r4;
    if (a1 == 0xFFFF) {
        r4 = a0->unk_08;
        a1 = a0->unk_02;
    } else if (a1 >= a0->unk_00 || (r4 = &a0->unk_04[a1], !r4->unk_00_0)) {
        return 0;
    }
    if (r4->unk_03 < a2) {
        r4->unk_01 = 0;
    } else {
        r4->unk_01 = a2;
    }
    ov100_021E71B4(a0, a1);
    return r4->unk_01;
}

void ov100_021E7414(PokegearPhoneApp_UnkSub07C *a0, u16 a1, BOOL a2) {
    if (a1 == 0xFFFF) {
        a1 = a0->unk_02;
    }
    if (a1 < a0->unk_00) {
        PokegearPhoneApp_UnkSub07C_Sub4 *r4 = &a0->unk_04[a1];
        if (r4->unk_00_0) {
            if (!r4->unk_00_1) {
                if (!r4->unk_00_2) {
                    Sprite_ResetAnimCtrlState(r4->unk_10[0].sprite);
                    thunk_Set2dSpriteAnimActiveFlag(r4->unk_10[0].sprite, a2);
                } else {
                    for (int i = 0; i < 4; ++i) {
                        Sprite_ResetAnimCtrlState(r4->unk_10[i].sprite);
                        thunk_Set2dSpriteAnimActiveFlag(r4->unk_10[i].sprite, a2);
                    }
                }
            } else {
                if (!r4->unk_00_2) {
                    UnkImageStruct_ResetSpriteAnimCtrlState(r4->unk_10[0].unk_image_struct);
                    UnkImageStruct_SetSpriteAnimActiveFlag(r4->unk_10[0].unk_image_struct, a2);
                } else {
                    for (int i = 0; i < 4; ++i) {
                        UnkImageStruct_ResetSpriteAnimCtrlState(r4->unk_10[i].unk_image_struct);
                        UnkImageStruct_SetSpriteAnimActiveFlag(r4->unk_10[i].unk_image_struct, a2);
                    }
                }
            }
        }
    }
}
