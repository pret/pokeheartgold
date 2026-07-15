#include "overlay_42.h"
#include "sprite_transfer.h"

const u8 _02229AF8[4] = { 0, 0, 1, 1 };
const u8 ov42_02229AFC[8] = { 0, 1, 149, 150, 151, 152, 0, 0 };
const u8 ov42_02229B04[12] = { 1, 255, 8, 2, 4, 16, 16, 2, 4, 0, 0, 0 };
const u8 ov42_02229B10[16] = { 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17 };

const func_type_02229B48 ov42_02229B48[10] = { NULL, ov42_02227DD8, ov42_02227DE8, ov42_02227DF8, ov42_02227E18, ov42_02227E28, ov42_02227E38, ov42_02227E48, ov42_02227E58, NULL };

const func_type_02227504 ov42_02229B20[10] = { ov42_02227D48, ov42_02227D54, ov42_02227D64, ov42_02227D74, ov42_02227D88, ov42_02227D98, ov42_02227DA8, ov42_02227DB8, ov42_02227DC8, NULL };

const u32 ov42_02229B70[12] = { 3, 4, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 };
const u16 ov42_02229BA2[305] = { 0, 0, 3, 2, 5, 3, 11, 4, 31, 5, 50, 6, 51, 7, 62, 8, 70, 9, 97, 1, 6, 10, 7, 11, 13, 12, 14, 13, 35, 14, 37, 15, 42, 16, 63, 17, 4, 18, 8, 19, 52, 20, 53, 21, 2, 22, 15, 23, 16, 24, 59, 25, 60, 26, 9, 27, 12, 28, 23, 29, 22, 30, 41, 31, 38, 32, 39, 33, 17, 34, 68, 35, 69, 36, 1, 37, 45, 38, 54, 39, 56, 40, 20, 41, 10, 42, 19, 43, 29, 44, 36, 45, 40, 46, 43, 47, 34, 48, 55, 49, 71, 50, 141, 51, 142, 52, 143, 53, 144, 54, 145, 55, 169, 56, 44, 58, 30, 59, 175, 94, 18, 103, 148, 114, 84, 115, 24, 116, 25, 117, 168, 132, 86, 135, 277, 139, 278, 140, 279, 141, 280, 142, 281, 143, 282, 144, 283, 145, 284, 146, 285, 147, 286, 148, 238, 149, 239, 150, 295, 151, 296, 152 };

UnkStruct_ov42_02227060 *ov42_02227060(SpriteList *arg0, PaletteData *arg1, s32 arg2, enum HeapID heapID) {
    int i;
    UnkStruct_ov42_02227060 *temp_r0 = Heap_Alloc(heapID, sizeof(UnkStruct_ov42_02227060));
    memset(temp_r0, 0, sizeof(UnkStruct_ov42_02227060));
    temp_r0->unk0 = arg0;
    temp_r0->unk4 = arg1;
    temp_r0->unk2304 = NARC_New(NARC_a_1_7_9, heapID);
    temp_r0->unk2308 = NARC_New(NARC_a_1_8_6, heapID);
    for (i = 0; i < 2; i++) {
        temp_r0->unk22F0[i] = Create2DGfxResObjMan(154, (GfGfxResType)i, heapID);
    }
    for (i = 0; i < 2; i++) {
        temp_r0->unk22F0[i + 2] = Create2DGfxResObjMan(23, (GfGfxResType)(i + 2), heapID);
    }
    for (i = 0; i < 3; i++) {
        ov42_02227570(temp_r0, i, heapID);
    }
    temp_r0->unkC = arg2;
    temp_r0->unk8 = Heap_Alloc(heapID, arg2 * sizeof(UnkStruct_ov42_02227114));
    memset(temp_r0->unk8, 0, sizeof(UnkStruct_ov42_02227114) * temp_r0->unkC);
    return temp_r0;
}

void ov42_02227114(UnkStruct_ov42_02227060 *arg0) {
    for (int i = 0; i < arg0->unkC; i++) {
        if (ov42_02227E68(&arg0->unk8[i]) == 0) {
            ov42_0222740C(&arg0->unk8[i]);
        }
    }
    for (int i = 0; i < 3; i++) {
        ov42_02227604(arg0, i);
    }
    ov42_022271F8(arg0);
    NARC_Delete(arg0->unk2304);
    NARC_Delete(arg0->unk2308);
    for (int i = 0; i < 4; i++) {
        Destroy2DGfxResObjMan(arg0->unk22F0[i]);
    }
    Heap_Free(arg0->unk8);
    Heap_Free(arg0);
}

void ov42_02227194(UnkStruct_ov42_02227060 *arg0, s32 arg1, u8 arg2, s32 arg3, enum HeapID heapID) {
    GF_ASSERT(ov42_02227680(arg1, arg3));
    ov42_022276DC(arg0, ov42_02227654(arg1), arg2, arg3, heapID, 0);
}

void ov42_022271D0(UnkStruct_ov42_02227060 *arg0, s32 arg1) {
    ov42_02227948(arg0, ov42_02227654(arg1));
}

s32 ov42_022271E4(UnkStruct_ov42_02227060 *arg0, s32 arg1) {
    return ov42_022279E8(arg0, ov42_02227654(arg1));
}

void ov42_022271F8(UnkStruct_ov42_02227060 *arg0) {
    if (arg0->unk2300 != 0) {
        ov42_02227274(arg0);
    }
    for (int i = 0; i < 153; i++) {
        if (ov42_022279E8(arg0, i) == 1) {
            ov42_02227948(arg0, i);
        }
    }
}

void ov42_02227228(UnkStruct_ov42_02227060 *arg0, u8 arg1, s32 arg2, enum HeapID heapID) {
    GF_ASSERT(arg2);
    ov42_02227B6C(arg0, arg1, heapID);
    ov42_02227C18(arg0, heapID);
    for (int i = 0; i < 16; i++) {
        ov42_022276DC(arg0, ov42_02229B10[i], arg1, arg2, heapID, 1);
    }
}

void ov42_02227274(UnkStruct_ov42_02227060 *arg0) {
    ov42_02227BE0(arg0);
    ov42_02227CA8(arg0);
    for (int i = 0; i < 16; i++) {
        ov42_02227948(arg0, ov42_02229B10[i]);
    }
}

void ov42_0222729C(UnkStruct_ov42_02227060 *arg0, u8 arg1, s32 arg2, enum HeapID heapID) {
    ov42_022279FC(arg0, arg1, heapID);
    arg0->unk22EC = arg2;
}

void ov42_022272B4(UnkStruct_ov42_02227060 *arg0) {
    ov42_02227B04(arg0);
}

UnkStruct_ov42_02227114 *ov42_022272BC(UnkStruct_ov42_02227060 *arg0, s16 *arg1, s32 arg2, enum HeapID heapID) {
    UnkStruct_ov42_02227114 *temp_r4 = ov42_02227CF8(arg0);
    u16 r0 = ov42_02227654(arg2);
    GF_ASSERT(ov42_022279E8(arg0, r0) == 1);

    SpriteTemplate spriteTemplate = { NULL };
    spriteTemplate.spriteList = arg0->unk0;
    spriteTemplate.header = &arg0->unk10[r0].unk14;
    spriteTemplate.position.x = arg1[0] << FX32_SHIFT;
    spriteTemplate.position.y = arg1[1] << FX32_SHIFT;

    spriteTemplate.scale.x = 4096;
    spriteTemplate.scale.y = 4096;
    spriteTemplate.scale.z = 4096;
    spriteTemplate.drawPriority = arg1[2];
    spriteTemplate.heapID = heapID;

    if ((arg0->unk10[r0].unkC == 3) || (arg0->unk10[r0].unkC == 1)) {
        spriteTemplate.whichScreen = NNS_G2D_VRAM_TYPE_2DMAIN;
    } else {
        spriteTemplate.whichScreen = NNS_G2D_VRAM_TYPE_2DSUB;
    }
    Sprite *sprite = Sprite_CreateAffine(&spriteTemplate);
    temp_r4->unk4 = sprite;
    Sprite_SetPriority(sprite, arg1[3]);

    if (arg0->unk10[r0].unk10 == 1) {
        Sprite_SetAnimCtrlSeq(temp_r4->unk4, 6);
    } else {
        Sprite_SetAnimCtrlSeq(temp_r4->unk4, 1);
    }
    temp_r4->unkC = 9;
    temp_r4->unk14 = 0;
    temp_r4->unk10 = 1;
    temp_r4->unk0 = &arg0->unk10[r0].unk0;
    if (ov42_02227B5C(arg0->unk22B8) != 0) {
        memset(&spriteTemplate, 0, sizeof(SpriteTemplate));
        spriteTemplate.spriteList = arg0->unk0;
        spriteTemplate.header = &arg0->unk22C8;
        spriteTemplate.position.x = arg1[0] << FX32_SHIFT;
        spriteTemplate.position.y = arg1[1] << FX32_SHIFT;

        spriteTemplate.scale.x = 4096;
        spriteTemplate.scale.y = 4096;
        spriteTemplate.scale.z = 4096;
        spriteTemplate.drawPriority = arg0->unk22EC;
        spriteTemplate.heapID = heapID;

        if ((arg0->unk10[r0].unkC == 3) || (arg0->unk10[r0].unkC == 1)) {
            spriteTemplate.whichScreen = NNS_G2D_VRAM_TYPE_2DMAIN;
        } else {
            spriteTemplate.whichScreen = NNS_G2D_VRAM_TYPE_2DSUB;
        }
        Sprite *sprite = Sprite_CreateAffine(&spriteTemplate);
        temp_r4->unk8 = sprite;
        Sprite_SetPriority(sprite, arg1[3]);
    } else {
        temp_r4->unk8 = NULL;
    }
    return temp_r4;
}

void ov42_0222740C(UnkStruct_ov42_02227114 *arg0) {
    if (arg0->unk8 != 0) {
        Sprite_Delete(arg0->unk8);
    }
    Sprite_Delete(arg0->unk4);
    memset(arg0, 0, sizeof(UnkStruct_ov42_02227114));
}

Sprite *ov42_02227430(UnkStruct_ov42_02227114 *arg0) {
    return arg0->unk4;
}

void ov42_02227434(UnkStruct_ov42_02227114 *arg0, s16 arg1, s16 arg2) {
    VecFx32 sp0;
    sp0.x = arg1 << FX32_SHIFT;
    sp0.y = arg2 << FX32_SHIFT;
    sp0.z = 0;
    Sprite_SetMatrix(arg0->unk4, &sp0);
    if (arg0->unk8 != 0) {
        sp0.x += 32768;
        sp0.y += 57344;
        Sprite_SetMatrix(arg0->unk8, &sp0);
    }
}

void ov42_02227474(UnkStruct_ov42_02227114 *arg0, u16 arg1) {
    Sprite_SetDrawPriority(arg0->unk4, arg1);
}

u16 ov42_02227480(UnkStruct_ov42_02227114 *arg0) {
    return Sprite_GetDrawPriority(arg0->unk4);
}

void ov42_02227490(UnkStruct_ov42_02227114 *arg0, u16 arg1) {
    Sprite_SetDrawFlag(arg0->unk4, arg1);
    if (arg0->unk8 != NULL) {
        Sprite_SetDrawFlag(arg0->unk8, arg1);
    }
}

BOOL ov42_022274AC(UnkStruct_ov42_02227114 *arg0) {
    return Sprite_GetDrawFlag(arg0->unk4);
}

s32 ov42_022274B8(UnkStruct_ov42_02227114 *arg0) {
    return arg0->unk0[4];
}

u32 ov42_022274C0(UnkStruct_ov42_02227114 *arg0) {
    return arg0->unkC;
}

void ov42_022274C4(UnkStruct_ov42_02227114 *arg0, u16 arg1) {
    Sprite_SetAnimationFrame(arg0->unk4, arg1);
}

u16 ov42_022274D0(UnkStruct_ov42_02227114 *arg0) {
    return Sprite_GetAnimationFrame(arg0->unk4);
}

void ov42_022274DC(UnkStruct_ov42_02227114 *arg0, s16 arg1, s16 arg2) {
    if (arg0->unk8 != 0) {
        VecFx32 sp0;
        sp0.x = (arg1 + 8) << FX32_SHIFT;
        sp0.y = (arg2 + 14) << FX32_SHIFT;
        sp0.z = 0;
        Sprite_SetMatrix(arg0->unk8, &sp0);
    }
}

void ov42_02227504(UnkStruct_ov42_02227114 *arg0, s32 arg1, s32 arg2) {
    GF_ASSERT(arg1 < 10);
    GF_ASSERT(arg2 < 4);
    arg0->unkC = arg1;
    arg0->unk14 = 0;
    func_type_02227504 func = ov42_02229B20[arg1];
    if (func != NULL) {
        func(arg0, arg2);
    }
}

void ov42_02227538(UnkStruct_ov42_02227114 *arg0) {
    BOOL var_r0 = FALSE;
    u8 temp_r2 = ov42_02229B04[arg0->unkC];
    if (temp_r2 == 255) {
        var_r0 = TRUE;
    } else if (temp_r2 >= arg0->unk14 + 1) {
        var_r0 = TRUE;
    }
    if (var_r0 == TRUE) {
        ov42_02227D30(arg0);
        arg0->unk14++;
    }
}

void ov42_02227570(UnkStruct_ov42_02227060 *arg0, s32 arg1, enum HeapID heapID) {
    s32 r5 = arg1 * 4;
    GF_ASSERT(arg0->unk2188[r5] == NULL);
    for (int i = 0; i < 4; i++) {
        s32 index = i % 2 + 2;
        s32 offset = 256 + arg1 * 2;
        arg0->unk2188[r5 + i] = AddCellOrAnimResObjFromOpenNarc(arg0->unk22F0[index], arg0->unk2304, ov42_02229B70[r5 + i], FALSE, _02229AF8[i] + offset, (GfGfxResType)index, heapID);
    }
}

void ov42_02227604(UnkStruct_ov42_02227060 *arg0, s32 arg1) {
    s32 temp_r5 = arg1 * 4;
    GF_ASSERT(arg0->unk2188[temp_r5]);
    for (int i = 0; i < 4; i++) {
        u32 index = (i % 2) + 2;
        DestroySingle2DGfxResObj(arg0->unk22F0[index], arg0->unk2188[temp_r5 + i]);
        arg0->unk2188[temp_r5 + i] = NULL;
    }
}

u16 ov42_02227654(s32 arg0) {
    int j = 0;
    for (s32 i = 0; i < 153; i++) {
        if (arg0 == ov42_02229BA2[j]) {
            return ov42_02229BA2[i * 2 + 1];
        }
        j += 2;
    }
    GF_ASSERT(FALSE);
    return 0;
}

s32 ov42_02227680(u32 arg0, s32 arg1) {
    if (arg1 == 0) {
        if ((arg0 == 0) || (arg0 == 97) || (arg0 == 238) || (arg0 == 239) || (arg0 - 295 <= 1)) {
            return 1;
        }
        return 0;
    }
    return 1;
}

s32 ov42_022276AC(s32 arg0, s32 arg1, s32 arg2) {
    GF_ASSERT(arg1 == 2 || arg1 == 3);
    s32 var_r1 = arg1 - 2;
    if (arg2 == 0) {
        var_r1 += 2;
    }
    return 256 + (arg0 * 2) + _02229AF8[var_r1];
}

void ov42_022276DC(UnkStruct_ov42_02227060 *arg0, s32 arg1, u8 arg2, s32 arg3, enum HeapID heapID, s32 arg5) {
    GF_ASSERT(!arg0->unk10[arg1].unk4);
    if (arg5 == 0) {
        ov42_02227720(arg0, arg1, arg2, arg3, heapID);
        return;
    }
    ov42_02227874(arg0, arg1, arg2, arg3, heapID);
}

void ov42_02227720(UnkStruct_ov42_02227060 *arg0, s32 arg1, s32 arg2, s32 arg3, enum HeapID heapID) {
    arg0->unk10[arg1].unk4 = AddCharResObjFromOpenNarc(arg0->unk22F0[0], arg0->unk2304, arg1 * 2 + 14, 0, arg1 + 512, arg2, (enum HeapID)heapID);
    arg0->unk10[arg1].unk8 = AddPlttResObjFromOpenNarc(arg0->unk22F0[1], arg0->unk2304, arg1 * 2 + 13, 0, arg1 + 512, arg2, 1, (enum HeapID)heapID);
    NNSG2dCharacterData *charData = GF2DGfxResObj_GetCharDataPtr(arg0->unk10[arg1].unk4);

    s32 sp34;
    if (charData->szByte != 6144) {
        sp34 = 1;
    } else {
        sp34 = 0;
    }
    if (arg3 == 2) {
        charData->szByte = 2048;
    } else if (arg3 == 1) {
        if (sp34 != 0) {
            charData->szByte = 5120;
        } else {
            charData->szByte = 6144;
        }
    }
    if (SpriteTransfer_CreateCharTransferTask_UpdateMappingTypeFromHW_AllocAtEnd(arg0->unk10[arg1].unk4) == 0) {
        GF_ASSERT(FALSE);
    }
    if (SpriteTransfer_CreatePlttTransferTask(arg0->unk10[arg1].unk8) == 0) {
        GF_ASSERT(FALSE);
    }
    if (arg0->unk4 != 0) {
        ov42_02227E78(arg0, arg0->unk10[arg1].unk8, 1);
    }
    sub_0200A740(arg0->unk10[arg1].unk4);
    sub_0200A740(arg0->unk10[arg1].unk8);
    arg0->unk10[arg1].unkC = arg2;
    arg0->unk10[arg1].unk10 = arg3;
    arg0->unk10[arg1].unk0 = 0;
    s32 temp_r6_2 = ov42_022276AC(arg3, 2, sp34);
    CreateSpriteResourcesHeader(&arg0->unk10[arg1].unk14, arg1 + 512, arg1 + 512, temp_r6_2, ov42_022276AC(arg3, 3, sp34), -1, -1, 0, 0, arg0->unk22F0[0], arg0->unk22F0[1], arg0->unk22F0[2], arg0->unk22F0[3], 0, 0);
}

void ov42_02227874(UnkStruct_ov42_02227060 *arg0, s32 arg1, s32 arg2, s32 arg3, enum HeapID heapID) {
    s32 r7 = arg1 - 2;
    arg0->unk10[arg1].unk4 = AddCharResObjFromOpenNarc(arg0->unk22F0[0], arg0->unk2308, arg1 - 1, 0, arg1 + 512, arg2, heapID);
    if (arg3 == 2) {
        GF2DGfxResObj_GetCharDataPtr(arg0->unk10[arg1].unk4)->szByte = 2048;
    } else if (arg3 == 1) {
        GF2DGfxResObj_GetCharDataPtr(arg0->unk10[arg1].unk4)->szByte = 5120;
    }
    GF_ASSERT(SpriteTransfer_CreateCharTransferTask_UpdateMappingTypeFromHW_AllocAtEnd(arg0->unk10[arg1].unk4));
    sub_0200A740(arg0->unk10[arg1].unk4);
    arg0->unk10[arg1].unk8 = NULL;
    arg0->unk10[arg1].unkC = arg2;
    arg0->unk10[arg1].unk10 = arg3;
    arg0->unk10[arg1].unk0 = 1;
    CreateSpriteResourcesHeader(&arg0->unk10[arg1].unk14, arg1 + 512, 1026, r7 + 384, r7 + 384, -1, -1, 0, 0, arg0->unk22F0[0], arg0->unk22F0[1], arg0->unk22F0[2], arg0->unk22F0[3], 0, 0);
}

void ov42_02227948(UnkStruct_ov42_02227060 *arg0, s32 arg1) {
    GF_ASSERT(arg0->unk10[arg1].unk4);
    if (arg0->unk10[arg1].unk0 == 0) {
        ov42_0222797C(arg0, arg1);
        return;
    }
    ov42_022279C0(arg0, arg1);
}

void ov42_0222797C(UnkStruct_ov42_02227060 *arg0, s32 arg1) {
    SpriteTransfer_DeleteCharTransferTask(arg0->unk10[arg1].unk4);
    SpriteTransfer_DeletePlttTransferTask(arg0->unk10[arg1].unk8);
    DestroySingle2DGfxResObj(arg0->unk22F0[0], arg0->unk10[arg1].unk4);
    DestroySingle2DGfxResObj(arg0->unk22F0[1], arg0->unk10[arg1].unk8);
    arg0->unk10[arg1].unk4 = NULL;
    arg0->unk10[arg1].unk8 = NULL;
}

void ov42_022279C0(UnkStruct_ov42_02227060 *arg0, s32 arg1) {
    SpriteTransfer_DeleteCharTransferTask(arg0->unk10[arg1].unk4);
    DestroySingle2DGfxResObj(arg0->unk22F0[0], arg0->unk10[arg1].unk4);
    arg0->unk10[arg1].unk4 = NULL;
}

BOOL ov42_022279E8(UnkStruct_ov42_02227060 *arg0, s32 arg1) {
    if (arg0->unk10[arg1].unk4 != NULL) {
        return TRUE;
    }
    return FALSE;
}

void ov42_022279FC(UnkStruct_ov42_02227060 *arg0, s32 arg1, enum HeapID heapID) {
    GF_ASSERT(arg0->unk22B8[0] == NULL);
    int i = 0;
    s32 sp34 = 0;
    s32 sp30;
    for (i = 0; i < 6; i++) {
        if (ov42_022279E8(arg0, ov42_02229AFC[i]) == 1) {
            sp30 = ov42_02229AFC[i];
            sp34 = 1;
            break;
        }
    }
    GF_ASSERT(sp34 == 1);
    for (i = 0; i < 2; i++) {
        arg0->unk22B8[i + 2] = AddCellOrAnimResObjFromOpenNarc(arg0->unk22F0[i + 2], arg0->unk2304, i, 0, 288, (GfGfxResType)(i + 2), heapID);
    }
    arg0->unk22B8[0] = AddCharResObjFromOpenNarc(arg0->unk22F0[0], arg0->unk2304, 2, 0, 288, arg1, heapID);
    if (SpriteTransfer_CreateCharTransferTask_UpdateMappingTypeFromHW_AllocAtEnd(arg0->unk22B8[0]) == 0) {
        GF_ASSERT(FALSE);
    }
    sub_0200A740(arg0->unk22B8[0]);
    CreateSpriteResourcesHeader(&arg0->unk22C8, 288, sp30 + 512, 288, 288, -1, -1, 0, 0, arg0->unk22F0[0], arg0->unk22F0[1], arg0->unk22F0[2], arg0->unk22F0[3], 0, 0);
}

void ov42_02227B04(UnkStruct_ov42_02227060 *arg0) {
    if (ov42_02227B5C(arg0->unk22B8) == 1) {
        SpriteTransfer_DeleteCharTransferTask(arg0->unk22B8[0]);
        DestroySingle2DGfxResObj(arg0->unk22F0[0], arg0->unk22B8[0]);
        arg0->unk22B8[0] = NULL;
        for (int i = 0; i < 2; i++) {
            DestroySingle2DGfxResObj(arg0->unk22F0[i + 2], arg0->unk22B8[i + 2]);
            arg0->unk22B8[i + 2] = NULL;
        }
    }
}

BOOL ov42_02227B5C(SpriteResource **arg0) {
    return arg0[0] != NULL;
}

void ov42_02227B6C(UnkStruct_ov42_02227060 *arg0, s32 arg1, enum HeapID heapID) {
    GF_ASSERT(!arg0->unk2300);
    arg0->unk2300 = AddPlttResObjFromOpenNarc(arg0->unk22F0[1], arg0->unk2308, 0, 0, 1026, arg1, 8, heapID);
    GF_ASSERT(SpriteTransfer_CreatePlttTransferTask(arg0->unk2300));
    if (arg0->unk4 != 0) {
        ov42_02227E78(arg0, arg0->unk2300, 8);
    }
    sub_0200A740(arg0->unk2300);
}

void ov42_02227BE0(UnkStruct_ov42_02227060 *arg0) {
    GF_ASSERT(arg0->unk2300);
    SpriteTransfer_DeletePlttTransferTask(arg0->unk2300);
    DestroySingle2DGfxResObj(arg0->unk22F0[1], arg0->unk2300);
    arg0->unk2300 = NULL;
}

void ov42_02227C18(UnkStruct_ov42_02227060 *arg0, enum HeapID heapID) {
    GF_ASSERT(!arg0->unk21B8[0].unk0);
    for (int i = 0; i < 16; i++) {
        arg0->unk21B8[i].unk0 = AddCellOrAnimResObjFromOpenNarc(arg0->unk22F0[2], arg0->unk2308, 17 + (i * 2), 0, i + 384, GF_GFX_RES_TYPE_CELL, heapID);
        arg0->unk21B8[i].unk4 = AddCellOrAnimResObjFromOpenNarc(arg0->unk22F0[3], arg0->unk2308, 18 + (i * 2), 0, i + 384, GF_GFX_RES_TYPE_ANIM, heapID);
    }
}

void ov42_02227CA8(UnkStruct_ov42_02227060 *arg0) {
    GF_ASSERT(arg0->unk21B8[0].unk0);
    for (int i = 0; i < 16; i++) {
        DestroySingle2DGfxResObj(arg0->unk22F0[2], arg0->unk21B8[i].unk0);
        DestroySingle2DGfxResObj(arg0->unk22F0[3], arg0->unk21B8[i].unk4);
        arg0->unk21B8[i].unk0 = NULL;
        arg0->unk21B8[i].unk4 = NULL;
    }
}

UnkStruct_ov42_02227114 *ov42_02227CF8(UnkStruct_ov42_02227060 *arg0) {
    for (int i = 0; i < arg0->unkC; i++) {
        if (ov42_02227E68(&arg0->unk8[i]) == 1) {
            return &arg0->unk8[i];
        }
    }
    GF_ASSERT(FALSE);
    return 0;
}

void ov42_02227D30(UnkStruct_ov42_02227114 *arg0) {
    func_type_02229B48 spriteFunc = ov42_02229B48[arg0->unkC];
    if (spriteFunc != NULL) {
        spriteFunc(arg0);
    }
}
