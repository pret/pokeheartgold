#include "gf_gfx_loader.h"
#include "overlay_42.h"

const u8 ov42_02229EB0[] = { 0, 3, 2, 4, 0, 5, 6, 8, 7, 8, 2, 6 };
const u8 ov42_02229EA4[] = { 0, 0, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0 };
const BgTemplate ov42_02229EBC = {
    .x = 0,
    .y = 0,
    .bufferSize = 4096,
    .baseTile = 0,
    .size = 3,
    .colorMode = 0,
    .screenBase = 0,
    .charBase = 0,
    .bgExtPltt = 0,
    .priority = 0,
    .areaOver = 0,
    .dummy = 0,
    .mosaic = 0,
};

s32 ov42_02228CDC(UnkStruct_ov42_02228110 *arg0, UnkStruct_ov42_02227F68 *arg1, UnkStruct_ov42_022280A8 *arg2, UnkStruct_ov42_02228CDC *arg3, UnkStruct_ov42_02228EB0 *arg4) {
    int temp_r0 = ov42_02228188(arg0, 5);
    if ((temp_r0 == 0) || (temp_r0 == 4)) {
        ov42_02228EB0(arg4, arg0, arg3->unk0, arg3->unk3, arg3->unk2);
        return 1;
    }
    return 0;
}

s32 ov42_02228D08(UnkStruct_ov42_02228110 *arg0, UnkStruct_ov42_02227F68 *arg1, UnkStruct_ov42_022280A8 *arg2, UnkStruct_ov42_02228CDC *arg3, UnkStruct_ov42_02228EB0 *arg4) {
    int temp_r6 = ov42_02228188(arg0, 5);
    int temp_r0 = ov42_02228188(arg0, 6);
    if (temp_r6 == 0 && temp_r0 != arg3->unk2) {
        ov42_02228EB0(arg4, arg0, arg3->unk0, arg3->unk3, arg3->unk2);
        return 1;
    }
    return 0;
}

s32 ov42_02228D44(UnkStruct_ov42_02228110 *arg0, UnkStruct_ov42_02227F68 *arg1, UnkStruct_ov42_022280A8 *arg2, UnkStruct_ov42_02228CDC *arg3, UnkStruct_ov42_02228EB0 *arg4) {
    int temp_r0 = ov42_02228188(arg0, 5);
    if ((temp_r0 == 0) && (ov42_02228E34(arg0, arg1, arg3->unk2) != 1) && (ov42_02228E9C(arg0, arg2, arg3->unk2) != 1)) {
        ov42_02228EB0(arg4, arg0, arg3->unk0, arg3->unk3, arg3->unk2);
        return 1;
    }
    if ((temp_r0 == 0) && (ov42_02228188(arg0, 10) >= 8)) {
        ov42_02228EB0(arg4, arg0, 5U, arg3->unk3, arg3->unk2);
        return 1;
    }
    return 0;
}

s32 ov42_02228DB8(UnkStruct_ov42_02228110 *arg0, UnkStruct_ov42_02227F68 *arg1, UnkStruct_ov42_022280A8 *arg2, UnkStruct_ov42_02228CDC *arg3, UnkStruct_ov42_02228EB0 *arg4) {
    return ov42_02228D44(arg0, arg1, arg2, arg3, arg4);
}

s32 ov42_02228DC8(UnkStruct_ov42_02228110 *arg0, UnkStruct_ov42_02227F68 *arg1, UnkStruct_ov42_022280A8 *arg2, UnkStruct_ov42_02228CDC *arg3, UnkStruct_ov42_02228EB0 *arg4) {
    if (ov42_02228188(arg0, 5) == 0) {
        ov42_02228EB0(arg4, arg0, arg3->unk0, arg3->unk3, arg3->unk2);
        return 1;
    }
    return 0;
}

s32 ov42_02228DF0(UnkStruct_ov42_02228110 *arg0, UnkStruct_ov42_02227F68 *arg1, UnkStruct_ov42_022280A8 *arg2, UnkStruct_ov42_02228CDC *arg3, UnkStruct_ov42_02228EB0 *arg4) {
    GF_ASSERT(FALSE);
    return 0;
}

s32 ov42_02228DFC(UnkStruct_ov42_02228110 *arg0, UnkStruct_ov42_02227F68 *arg1, UnkStruct_ov42_022280A8 *arg2, UnkStruct_ov42_02228CDC *arg3, UnkStruct_ov42_02228EB0 *arg4) {
    return ov42_02228D44(arg0, arg1, arg2, arg3, arg4);
}

s32 ov42_02228E0C(UnkStruct_ov42_02228110 *arg0, UnkStruct_ov42_02227F68 *arg1, UnkStruct_ov42_022280A8 *arg2, UnkStruct_ov42_02228CDC *arg3, UnkStruct_ov42_02228EB0 *arg4) {
    if (ov42_02228188(arg0, 5) == 0) {
        ov42_02228EB0(arg4, arg0, arg3->unk0, arg3->unk3, arg3->unk2);
        return TRUE;
    }
    return FALSE;
}

s32 ov42_02228E34(UnkStruct_ov42_02228110 *arg0, UnkStruct_ov42_02227F68 *arg1, u8 arg2) {
    UnkStruct_ov44_02232914 sp0 = ov42_022282DC(arg0);
    sp0 = ov42_02228270(sp0, arg2);
    return ov42_02227FA4(arg1, sp0.unk0 / 16, sp0.unk2 / 16);
}

BOOL ov42_02228E9C(UnkStruct_ov42_02228110 *arg0, UnkStruct_ov42_022280A8 *arg1, u8 arg2) {
    if (ov42_022283BC(arg0, arg1, arg2) != 0) {
        return TRUE;
    }
    return FALSE;
}

void ov42_02228EB0(UnkStruct_ov42_02228EB0 *arg0, UnkStruct_ov42_02228110 *arg1, u16 arg2, u8 arg3, s32 arg4) {
    arg0->unk0 = ov42_022282DC(arg1);
    arg0->unk4 = arg2;
    arg0->unk7 = arg3;
    arg0->unk6 = arg4;
}

UnkStruct_ov42_02228EDC *ov42_02228EDC(SpriteList *arg0, PaletteData *arg1, u16 arg2, s8 arg3, enum HeapID heapID) {
    UnkStruct_ov42_02228EDC *temp_r4 = Heap_Alloc(heapID, sizeof(UnkStruct_ov42_02228EDC));
    temp_r4->unk0 = ov42_02227060(arg0, arg1, arg2, heapID);
    temp_r4->unk8 = arg2;
    UnkStruct_ov42_0222903C *temp_r0 = Heap_Alloc(heapID, 20 * temp_r4->unk8);
    temp_r4->unk4 = temp_r0;
    memset(temp_r0, 0, 20 * temp_r4->unk8);
    temp_r4->unkA = 2;
    temp_r4->unkB = arg3;
    return temp_r4;
}

UnkStruct_ov42_02228EDC *ov42_02228F24(SpriteList *arg0, PaletteData *arg1, u16 arg2, s32 arg3, s32 arg4, s32 arg5, enum HeapID heapID) {
    UnkStruct_ov42_02228EDC *temp_r4 = Heap_Alloc(heapID, sizeof(UnkStruct_ov42_02228EDC));
    temp_r4->unk0 = ov42_02227060(arg0, arg1, arg2, heapID);
    temp_r4->unk8 = arg2;
    UnkStruct_ov42_0222903C *temp_r0 = Heap_Alloc(heapID, 20 * temp_r4->unk8);
    temp_r4->unk4 = temp_r0;
    memset(temp_r0, 0, 20 * temp_r4->unk8);
    temp_r4->unkA = 2;
    temp_r4->unkB = arg5;
    ov42_02227194(temp_r4->unk0, arg3, temp_r4->unkB, arg4, heapID);
    ov42_0222729C(temp_r4->unk0, temp_r4->unkB, 40001, heapID);
    return temp_r4;
}

void ov42_02228F94(UnkStruct_ov42_02228EDC *arg0) {
    for (int i = 0; i < arg0->unk8; i++) {
        if (ov42_02229274(&arg0->unk4[i]) == 0) {
            ov42_022290C4(&arg0->unk4[i]);
        }
    }
    ov42_022272B4(arg0->unk0);
    ov42_0222901C(arg0);
    ov42_02227114(arg0->unk0);
    Heap_Free(arg0->unk4);
    Heap_Free(arg0);
}

void ov42_02228FE0(UnkStruct_ov42_02228EDC *arg0, s32 arg1, s32 arg2, enum HeapID heapID) {
    if (ov42_022271E4(arg0->unk0, arg1) == 0) {
        ov42_02227194(arg0->unk0, arg1, arg0->unkB, arg2, heapID);
    }
}

void ov42_02229004(UnkStruct_ov42_02228EDC *arg0, s32 arg1) {
    ov42_022271D0(arg0->unk0, arg1);
}

s32 ov42_02229010(UnkStruct_ov42_02228EDC *arg0, s32 arg1) {
    return ov42_022271E4(arg0->unk0, arg1);
}

void ov42_0222901C(UnkStruct_ov42_02228EDC *arg0) {
    ov42_022271F8(arg0->unk0);
}

void ov42_02229028(UnkStruct_ov42_02228EDC *arg0, s32 arg1, enum HeapID heapID) {
    ov42_02227228(arg0->unk0, arg0->unkB, arg1, heapID);
}

UnkStruct_ov42_0222903C *ov42_0222903C(UnkStruct_ov42_02228EDC *arg0, UnkStruct_ov42_02228110 *arg1, u32 arg2, enum HeapID heapID) {
    UnkStruct_ov42_0222903C *temp_r4 = ov42_02229284(arg0);
    temp_r4->unk8 = ov42_02228188(arg1, 5);
    temp_r4->unkA = ov42_02228188(arg1, 6);
    temp_r4->unkC = ov42_02228188(arg1, 4);
    temp_r4->unk0 = arg1;
    temp_r4->unk12 = arg2;
    temp_r4->unk13 = 1;
    temp_r4->unkE = 0;
    temp_r4->unk10 = 0;

    u16 sp4[4];
    sp4[0] = ov42_02228188(arg1, 0);
    sp4[1] = ov42_02228188(arg1, 1);
    sp4[2] = ov42_0222922C(sp4[1], temp_r4->unk12);
    sp4[3] = arg0->unkA;
    temp_r4->unk4 = ov42_022272BC(arg0->unk0, sp4, ov42_02228188(arg1, 7), heapID);
    ov42_0222910C(temp_r4);
    return temp_r4;
}

void ov42_022290C4(UnkStruct_ov42_0222903C *arg0) {
    ov42_0222740C(arg0->unk4);
    __builtin__clear(arg0, sizeof(UnkStruct_ov42_0222903C));
}

void ov42_022290DC(UnkStruct_ov42_02228EDC *arg0) {
    for (int i = 0; i < arg0->unk8; i++) {
        if (ov42_02229274(&arg0->unk4[i]) == 0) {
            ov42_0222910C(&arg0->unk4[i]);
        }
    }
}

void ov42_0222910C(UnkStruct_ov42_0222903C *arg0) {
    if (arg0->unk13 != 0) {
        s32 temp_r6 = ov42_02228188(arg0->unk0, 5);
        s32 temp_r4 = ov42_02228188(arg0->unk0, 6);
        s16 temp_r1 = ov42_02228188(arg0->unk0, 8);
        if ((arg0->unk8 != temp_r6) || (arg0->unkA != temp_r4) || (temp_r1 == 0)) {
            arg0->unk8 = temp_r6;
            arg0->unkA = temp_r4;
            ov42_02229308(arg0, ov42_022292BC(arg0->unk4, temp_r6), temp_r4);
        }
        UnkStruct_ov44_02232914 sp0;
        ov42_022292D8(arg0, &sp0.unk2, &sp0.unk0);
        ov42_02227434(arg0->unk4, sp0.unk2, sp0.unk0);
        u16 r1 = ov42_0222922C(sp0.unk0, arg0->unk12);
        ov42_02227474(arg0->unk4, r1);
        ov42_02227538(arg0->unk4);
    }
}

void ov42_0222919C(UnkStruct_ov42_0222903C *arg0, s8 arg1) {
    arg0->unk13 = arg1;
}

void ov42_022291A0(UnkStruct_ov42_0222903C *arg0) {
    ov42_02229308(arg0, 1U, arg0->unkA);
}

void ov42_022291AC(UnkStruct_ov42_0222903C *arg0) {
    ov42_02227538(arg0->unk4);
}

void ov42_022291B8(UnkStruct_ov42_0222903C *arg0) {
    ov42_02229308(arg0, ov42_022292BC(arg0->unk4, arg0->unk8), arg0->unkA);
    ov42_0222910C(arg0);
}

void ov42_022291D8(UnkStruct_ov42_0222903C *arg0, UnkStruct_ov44_02232914 arg1) {
    ov42_02227434(arg0->unk4, arg1.unk0, arg1.unk2);
}

s32 ov42_022291F4(UnkStruct_ov42_0222903C *arg0) {
    return ov42_022274AC(arg0->unk4);
}

void ov42_02229200(UnkStruct_ov42_0222903C *arg0, u16 arg1) {
    ov42_02227490(arg0->unk4, arg1);
}

u16 ov42_0222920C(UnkStruct_ov42_0222903C *arg0) {
    return ov42_02227480(arg0->unk4);
}

void ov42_02229218(UnkStruct_ov42_0222903C *arg0, s32 arg1) {
    ov42_02229308(arg0, 0, arg1);
    ov42_02227538(arg0->unk4);
}

u32 ov42_0222922C(s16 arg0, u8 arg1) {
    if (arg1 == 1) {
        return 40000 - (arg0 * 2);
    }
    return 40001 - (arg0 * 2);
}

u8 ov42_02229248(UnkStruct_ov42_0222903C *arg0) {
    return Sprite_GetPalOffset(ov42_02227430(arg0->unk4));
}

void ov42_02229258(UnkStruct_ov42_0222903C *arg0, UnkStruct_ov44_02232914 arg1) {
    ov42_022274DC(arg0->unk4, arg1.unk0, arg1.unk2);
}

s32 ov42_02229274(UnkStruct_ov42_0222903C *arg0) {
    if (arg0->unk4 == 0) {
        return 1;
    }
    return 0;
}

UnkStruct_ov42_0222903C *ov42_02229284(UnkStruct_ov42_02228EDC *arg0) {
    for (int i = 0; i < arg0->unk8; i++) {
        if (ov42_02229274(&arg0->unk4[i]) == 1) {
            return &arg0->unk4[i];
        }
    }
    GF_ASSERT(FALSE);
    return NULL;
}

u8 ov42_022292BC(UnkStruct_ov42_02227114 *arg0, s32 arg1) {
    if (ov42_022274B8(arg0) == 2) {
        return 0;
    }
    return ov42_02229EB0[arg1];
}

void ov42_022292D8(UnkStruct_ov42_0222903C *arg0, s16 *arg1, s16 *arg2) {
    UnkStruct_ov44_02232914 sp0 = ov42_022282F4(arg0->unk0);
    *arg1 = sp0.unk0;
    *arg2 = sp0.unk2;
}

void ov42_02229308(UnkStruct_ov42_0222903C *arg0, u8 arg1, s32 arg2) {
    u16 temp_r6;
    u16 temp_r7;

    temp_r7 = ov42_022274D0(arg0->unk4);
    temp_r6 = ov42_022274C0(arg0->unk4);
    ov42_02227504(arg0->unk4, arg1, arg2);
    if (temp_r6 != arg1) {
        if ((ov42_02229EA4[arg1] == 1) && (arg0->unk10 == arg1)) {
            ov42_022274C4(arg0->unk4, arg0->unkE);
        }
        if (ov42_02229EA4[temp_r6] == 1) {
            arg0->unk10 = temp_r6;
            arg0->unkE = temp_r7;
        }
    }
}

void ov42_02229358(UnkStruct_ov44_02232914 *arg0, UnkStruct_ov42_02228110 *arg1) {
    UnkStruct_ov44_02232914 sp0 = ov42_022282F4(arg1);
    ov42_022293A0(arg0, sp0.unk2 - 96, sp0.unk0 - 112);
}

void ov42_02229394(UnkStruct_ov44_02232914 *arg0) {
    __builtin__clear(arg0, 4);
}

void ov42_022293A0(UnkStruct_ov44_02232914 *arg0, s16 arg1, s16 arg2) {
    arg0->unk0 = arg1;
    arg0->unk2 = arg2;
}

s16 ov42_022293A8(UnkStruct_ov44_02232914 *arg0) {
    return arg0->unk0;
}

s16 ov42_022293B0(UnkStruct_ov44_02232914 *arg0) {
    return arg0->unk2;
}

UnkStruct_ov42_022293B8 *ov42_022293B8(G2dRenderer *g2dRenderer, BgConfig *bgConfig, u8 *arg2, enum HeapID heapID) {
    UnkStruct_ov42_022293B8 *temp_r0 = Heap_Alloc(heapID, sizeof(UnkStruct_ov42_022293B8));
    __builtin__clear(temp_r0, sizeof(UnkStruct_ov42_022293B8));
    temp_r0->g2dRenderer = g2dRenderer;
    temp_r0->bgConfig = bgConfig;
    temp_r0->unk10 = arg2[0];
    u8 temp_r1 = arg2[1];
    temp_r0->unk14 = temp_r1;
    ov42_02229514(temp_r0->bgConfig, temp_r1, arg2);
    temp_r0->unk8 = GfGfxLoader_GetScrnData((NarcId)arg2[8], arg2[9], arg2[10], &temp_r0->nnsg2dScreenData, heapID);
    return temp_r0;
}

void ov42_0222940C(UnkStruct_ov42_022293B8 *arg0) {
    Heap_Free(arg0->unk8);
    Heap_Free(arg0);
}

void ov42_02229420(UnkStruct_ov42_022293B8 *arg0, UnkStruct_ov44_02232914 *arg1) {
    s16 temp_r4;
    s16 temp_r5;
    temp_r5 = ov42_022293A8(arg1);
    temp_r4 = ov42_022293B0(arg1);
    if (arg0->unk10 == 0) {
        f32 var_r0;
        f32 var_r0_2;
        if (temp_r5 > 0) {
            var_r0 = 0.5f + (temp_r5 << 12);
        } else {
            var_r0 = (temp_r5 << 12) - 0.5f;
        }
        if (temp_r4 > 0) {
            var_r0_2 = 0.5f + (temp_r4 << 12);
        } else {
            var_r0_2 = (temp_r4 << 12) - 0.5f;
        }
        G2dRenderer_SetMainSurfaceCoords(arg0->g2dRenderer, var_r0_2, var_r0);
    } else {
        f32 var_r0_3;
        f32 var_r0_4;
        if (temp_r5 > 0) {
            var_r0_3 = 0.5f + (temp_r5 << 12);
        } else {
            var_r0_3 = (temp_r5 << 12) - 0.5f;
        }
        if (temp_r4 > 0) {
            var_r0_4 = 0.5f + (temp_r4 << 12);
        } else {
            var_r0_4 = (temp_r4 << 12) - 0.5f;
        }
        G2dRenderer_SetSubSurfaceCoords(arg0->g2dRenderer, var_r0_4, (fx32)var_r0_3 + 0xC0000);
    }
    ov42_02229570(arg0, temp_r4, temp_r5);
}

void ov42_02229514(BgConfig *bgConfig, s32 arg1, u8 *arg2) {
    BgTemplate bgTemplate = ov42_02229EBC;
    bgTemplate.colorMode = arg2[2];
    bgTemplate.screenBase = arg2[3];
    bgTemplate.charBase = arg2[4];
    bgTemplate.bgExtPltt = arg2[5];
    bgTemplate.priority = arg2[6];
    bgTemplate.areaOver = 0;
    bgTemplate.mosaic = arg2[7];
    FreeBgTilemapBuffer(bgConfig, arg1);
    InitBgFromTemplate(bgConfig, arg1, &bgTemplate, 0);
}

void ov42_02229570(UnkStruct_ov42_022293B8 *arg0, s16 arg1, s16 arg2) {
    s16 temp_r3 = arg1 / 8;
    s16 temp_r0 = arg2 / 8;
    s16 temp_r6 = arg1 % 8;
    s16 temp_r4_3 = arg2 % 8;

    if ((temp_r3 != arg0->unk18) || (temp_r0 != arg0->unk1A)) {
        arg0->unk18 = temp_r3;
        arg0->unk1A = temp_r0;
        ov42_02229600(arg0->bgConfig, arg0->unk14, arg0->nnsg2dScreenData, -temp_r3, -temp_r0);
        ScheduleBgTilemapBufferTransfer(arg0->bgConfig, arg0->unk14);
    }
    ScheduleSetBgPosText(arg0->bgConfig, arg0->unk14, BG_POS_OP_SET_X, temp_r6);
    ScheduleSetBgPosText(arg0->bgConfig, arg0->unk14, BG_POS_OP_SET_Y, temp_r4_3);
}

void ov42_02229600(BgConfig *bgConfig, s32 arg1, NNSG2dScreenData *nnsg2dScreenData, s16 arg3, s16 arg4) {
    s16 sp34 = nnsg2dScreenData->screenWidth / 8;
    s16 sp30 = nnsg2dScreenData->screenHeight / 8;

    s16 sp2C;
    if (arg3 < 0) {
        sp2C = -arg3;
    } else {
        sp2C = 0;
    }
    s16 sp28;
    if (arg4 < 0) {
        sp28 = -arg4;
    } else {
        sp28 = 0;
    }
    if (arg3 <= 0) {
        arg3 = 0;
    }
    if (arg4 <= 0) {
        arg4 = 0;
    }
    s16 var_r7 = 33 - arg3;
    s16 var_r6 = 25 - arg4;
    s32 temp_r1 = sp2C + var_r7;
    if (sp34 < temp_r1) {
        var_r7 -= temp_r1 - sp34;
    }
    s32 temp_r1_2 = sp28 + var_r6;
    if (sp30 < temp_r1_2) {
        var_r6 -= temp_r1_2 - sp30;
    }
    FillBgTilemapRect(bgConfig, arg1, 0, 0, 0, 33, 25, 17);
    ov42_022296F0(bgConfig, arg1, arg3, arg4, var_r7, var_r6, nnsg2dScreenData->rawData, sp2C, sp28, sp34, sp30);
}

void ov42_022296F0(BgConfig *bgConfig, u8 arg1, u8 arg2, u8 arg3, u8 arg4, u8 arg5, void *arg6, u8 arg7, u8 arg8, u8 arg9, u8 argA) {
    s8 sp48;
    s8 sp44;
    u8 sp40 = ov42_02229880(arg9, argA);
    if (sp40 == 0) {
        CopyToBgTilemapRect(bgConfig, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, argA);
        return;
    }
    sp48 = arg5;
    while (sp48 > 0) {
        int sp4C = arg8 % 32;
        if (sp4C + sp48 <= 32) {
            sp44 = sp48;
            sp48 = 0;
        } else {
            sp44 = 32 - sp4C;
            sp48 -= sp44;
        }
        s8 r1 = arg8 / 32;
        s8 r4 = arg4;
        s8 r5 = arg7;
        s8 r7 = arg2;
        while (r4 > 0) {
            s8 r6;
            if ((r5 % 32) + r4 <= 32) {
                r6 = r4;
                r4 = 0;
            } else {
                r6 = 32 - (r5 % 32);
                r4 = r4 - r6;
            }
            UnkStruct_ov44_02232914 sp4;
            void *temp = ov42_022298B4(arg6, (s8)(r5 / 32), r1, sp40, arg9, argA, &sp4);
            CopyToBgTilemapRect(bgConfig, arg1, r7, arg3, r6, sp44, temp, r5 % 32, sp4C, sp4.unk0, sp4.unk2);
            r5 += r6;
            r7 += r6;
        }
        arg8 += sp44;
        arg3 += sp44;
    }
}

u8 ov42_02229880(u8 arg0, u8 arg1) {
    if (arg0 > 64) {
        GF_ASSERT(FALSE);
    }
    if (arg1 > 64) {
        GF_ASSERT(FALSE);
    }
    if (arg0 <= 32) {
        if (arg1 <= 32) {
            return 0;
        }
        return 2;
    }
    if (arg1 <= 32) {
        return 1;
    }
    return 3;
}

void *ov42_022298B4(void *arg0, u8 arg1, u8 arg2, u8 arg3, u8 arg4, u8 arg5, UnkStruct_ov44_02232914 *arg6) {
    switch (arg3) {
    case 0:
        arg6->unk0 = arg4;
        arg6->unk2 = arg5;
        return arg0;
    case 1:
        int var_r4;
        if (((arg1 + 1) << 5) <= arg4) {
            var_r4 = 32;
        } else {
            var_r4 = arg4 - (arg1 << 5);
        }
        arg6->unk0 = var_r4;
        arg6->unk2 = arg5;
        return arg0 + arg1 * ((s16)(arg5 << 6));
    case 2:
        arg6->unk0 = arg4;
        int var_r1;
        if (((arg2 + 1) << 5) <= arg5) {
            var_r1 = 32;
        } else {
            var_r1 = arg5 - (arg2 << 5);
        }
        arg6->unk2 = var_r1;
        return arg0 + arg2 * ((s16)(arg4 << 6));
    case 3:
        int var_r5;
        if (((arg1 + 1) << 5) <= arg4) {
            var_r5 = 32;
        } else {
            var_r5 = arg4 - (arg1 << 5);
        }
        arg6->unk0 = var_r5;
        if (((arg2 + 1) << 5) <= arg5) {
            var_r5 = 32;
        } else {
            var_r5 = arg5 - (arg2 << 5);
        }
        arg6->unk2 = var_r5;
        u16 var_r2;
        if (arg2 == 0) {
            var_r2 = 0;
            if (arg1 != 0) {
                var_r2 += 2048;
            }
        } else {
            var_r2 = (arg4 << 6);
            if (arg1 != 0) {
                var_r2 = var_r2 + (arg5 << 6);
            }
        }
        return arg0 + var_r2;
    default:
        GF_ASSERT(FALSE);
    }
    GF_ASSERT(FALSE);
    return NULL;
}

UnkStruct_ov42_02229A40 *ov42_02229974(s32 arg0, enum HeapID heapID) {
    UnkStruct_ov42_02229A40 *temp_r0 = Heap_Alloc(heapID, sizeof(UnkStruct_ov42_02229A40));
    GF_ASSERT(temp_r0);
    s32 temp_r1 = arg0 + 1;
    temp_r0->unk4 = temp_r1;
    void *temp_r0_2 = Heap_Alloc(heapID, temp_r1 * 8);
    temp_r0->unk0 = temp_r0_2;
    memset(temp_r0_2, 0, temp_r0->unk4 * 8);
    temp_r0->unk8 = 0;
    temp_r0->unkA = 0;
    return temp_r0;
}

void ov42_022299AC(u32 *arg0) {
    Heap_Free((void *)*arg0);
    Heap_Free(arg0);
}

void ov42_022299C0(UnkStruct_ov42_022299C0 *arg0, UnkStruct_ov44_02232031 *arg1) {
    UnkStruct_ov44_02232031 sp0;
    if (arg0->unk8 == ((arg0->unkA + 1) % arg0->unk4)) {
        ov42_02229A08(arg0, &sp0);
    }
    arg0->unk0[arg0->unkA] = *arg1;
    arg0->unkA = (arg0->unkA + 1) % arg0->unk4;
}

s32 ov42_02229A08(UnkStruct_ov42_022299C0 *arg0, UnkStruct_ov44_02232031 *arg1) {
    if (arg0->unkA == arg0->unk8) {
        return 0;
    }
    *arg1 = arg0->unk0[arg0->unk8];
    arg0->unk8 = (arg0->unk8 + 1) % arg0->unk4;
    return 1;
}

UnkStruct_ov42_02229A40 *ov42_02229A40(s32 arg0, enum HeapID heapID) {
    UnkStruct_ov42_02229A40 *temp_r0 = Heap_Alloc(heapID, sizeof(UnkStruct_ov42_02229A40));
    GF_ASSERT(temp_r0);
    temp_r0->unk4 = arg0 + 1;
    temp_r0->unk0 = Heap_Alloc(heapID, (arg0 + 1) * 4);
    memset(temp_r0->unk0, 0, temp_r0->unk4 * 4);
    temp_r0->unk8 = 0;
    temp_r0->unkA = 0;
    return temp_r0;
}

void ov42_02229A78(UnkStruct_ov42_02229A40 *arg0) {
    Heap_Free(arg0->unk0);
    Heap_Free(arg0);
}

void ov42_02229A8C(UnkStruct_ov42_02229A40 *arg0, UnkStruct_ov42_02228CDC *arg1) {
    UnkStruct_ov42_02228CDC sp0;
    if (arg0->unk8 == ((arg0->unkA + 1) % arg0->unk4)) {
        ov42_02229AC8(arg0, &sp0);
    }
    arg0->unk0[arg0->unkA] = arg1[0];
    arg0->unkA = (arg0->unkA + 1) % arg0->unk4;
}

u32 ov42_02229AC8(UnkStruct_ov42_02229A40 *arg0, UnkStruct_ov42_02228CDC *arg1) {
    if (arg0->unkA == arg0->unk8) {
        return 0;
    }
    *arg1 = arg0->unk0[arg0->unk8];
    arg0->unk8 = (arg0->unk8 + 1) % arg0->unk4;
    return 1;
}
