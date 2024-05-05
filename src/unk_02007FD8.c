#include "filesystem.h"
#include "global.h"
#include "unk_02007FD8.h"
#include "poketool/pokegra/otherpoke.naix"

void sub_02009CD0(void *pRawCharData);
void sub_02009160(UnkStruct_02007FD4_sub *a0);
void sub_020094FC(UnkStruct_02007FD4 *a0);
void sub_0200994C(UnkStruct_02007FD4 *a0);
void sub_0200925C(UnkStruct_02007FD4_sub *a0);

extern const int _020F5B04[4][2][4];
extern const int _020F5988[4][4];

UnkStruct_02007FD4 *sub_02007FD4(HeapID heapId) {
    UnkStruct_02007FD4 *ret = AllocFromHeap(heapId, sizeof(UnkStruct_02007FD4));
    MI_CpuClearFast(ret, sizeof(UnkStruct_02007FD4));
    ret->unk_2E8 = heapId;
    ret->unk_330 = 0;
    ret->unk_2EC = 0;
    ret->unk_2F0 = 0x8000;
    ret->unk_2F4 = 0;
    ret->unk_2F8 = 0x80;
    ret->unk_2FC = AllocFromHeap(heapId, 0x8000);
    ret->unk_300 = AllocFromHeap(heapId, 0xC0);
    MI_CpuClearFast(ret->unk_300, 4);
    ret->unk_304 = AllocFromHeap(heapId, 0xC0);
    MI_CpuClearFast(ret->unk_304, 4);
    for (int i = 0; i < 4; ++i) {
        MI_CpuClearFast(&ret->unk_000[i], sizeof(UnkStruct_02007FD4_sub));
    }
    NNS_G2dSetupSoftwareSpriteCamera();
    ret->unk_333 = 0;

    NNSG2dCharacterData *charData;
    u8 *pRawCharData;
    void *pNcgrFile = AllocAndReadWholeNarcMemberByIdPair(NARC_poketool_pokegra_otherpoke, NARC_otherpoke_259_NCGR, ret->unk_2E8);  // shadow.png
    NNS_G2dGetUnpackedCharacterData(pNcgrFile, &charData);
    ret->unk_30C = charData->pixelFmt;
    ret->unk_310 = charData->mapingType;
    ret->unk_314 = charData->characterFmt;
    pRawCharData = charData->pRawData;
    sub_02009CD0(pRawCharData);
    MI_CpuFill8(ret->unk_2FC, *pRawCharData, 0x8000);
    for (int i = 0; i < 80; ++i) {
        for (int j = 0; j < 40; ++j) {
            int dstOffs = 0x5050 + 0x80 * i + j;
            int srcOffs = 0x50 * i + j;
            ret->unk_2FC[dstOffs] = pRawCharData[srcOffs];
        }
    }
    FreeToHeap(pNcgrFile);
    ret->unk_331 = 1;
    ret->unk_332 = 1;
    return ret;
}

void sub_02008120(UnkStruct_02007FD4 *r5) {
    int i;
    int width;
    int height;
    int u0;
    int v0;
    int u1;
    int v1;

    sub_020094FC(r5);
    sub_0200994C(r5);
    NNS_G3dGeFlushBuffer();
    G3_PushMtx();
    G3_TexImageParam(r5->unk_2B0.attr.fmt, GX_TEXGEN_TEXCOORD, r5->unk_2B0.attr.sizeS, r5->unk_2B0.attr.sizeT, GX_TEXREPEAT_NONE, GX_TEXFLIP_NONE, r5->unk_2B0.attr.plttUse, r5->unk_2EC);
    for (i = 0; i < 4; ++i) {
        if (r5->unk_000[i].unk_00_00 && !r5->unk_000[i].unk_24.unk_30_00 && !r5->unk_000[i].unk_24.unk_30_0B) {
            if (r5->unk_000[i].unk_68 != NULL) {
                r5->unk_000[i].unk_68(&r5->unk_000[i], &r5->unk_000[i].unk_24);
            }
            NNS_G3dGeFlushBuffer();
            if (r5->unk_333 != 1) {
                G3_Identity();
            }
            sub_0200925C(&r5->unk_000[i]);
            G3_TexPlttBase(r5->unk_2F4 + 0x20 * i, r5->unk_2B0.attr.fmt);
            G3_Translate((r5->unk_000[i].unk_24.unk_00 + r5->unk_000[i].unk_24.unk_1C) << FX32_SHIFT, (r5->unk_000[i].unk_24.unk_02 + r5->unk_000[i].unk_24.unk_1E) << FX32_SHIFT, (r5->unk_000[i].unk_24.unk_04) << FX32_SHIFT);
            G3_RotX(FX_SinIdx(r5->unk_000[i].unk_24.unk_14), FX_CosIdx(r5->unk_000[i].unk_24.unk_14));
            G3_RotY(FX_SinIdx(r5->unk_000[i].unk_24.unk_16), FX_CosIdx(r5->unk_000[i].unk_24.unk_16));
            G3_RotZ(FX_SinIdx(r5->unk_000[i].unk_24.unk_18), FX_CosIdx(r5->unk_000[i].unk_24.unk_18));
            G3_Translate(-((r5->unk_000[i].unk_24.unk_00 + r5->unk_000[i].unk_24.unk_1C) << FX32_SHIFT), -((r5->unk_000[i].unk_24.unk_02 + r5->unk_000[i].unk_24.unk_1E) << FX32_SHIFT), -((r5->unk_000[i].unk_24.unk_04) << FX32_SHIFT));
            G3_MaterialColorDiffAmb(GX_RGB(r5->unk_000[i].unk_24.unk_2C_00, r5->unk_000[i].unk_24.unk_2C_05, r5->unk_000[i].unk_24.unk_2C_10), GX_RGB(r5->unk_000[i].unk_24.unk_2C_15, r5->unk_000[i].unk_24.unk_2C_20, r5->unk_000[i].unk_24.unk_2C_25), TRUE);
            G3_MaterialColorSpecEmi(GX_RGB(16, 16, 16), RGB_BLACK, FALSE);
            G3_PolygonAttr(GX_LIGHTMASK_NONE, GX_POLYGONMODE_MODULATE, GX_CULL_NONE, r5->unk_000[i].unk_00_01, r5->unk_000[i].unk_24.unk_30_02, 0);
            if (r5->unk_000[i].unk_24.unk_30_01) {
                u0 = _020F5B04[i][r5->unk_000[i].unk_5B][0] + r5->unk_000[i].unk_24.unk_20;
                u1 = _020F5B04[i][r5->unk_000[i].unk_5B][0] + r5->unk_000[i].unk_24.unk_20 + r5->unk_000[i].unk_24.unk_22;
                v0 = _020F5B04[i][r5->unk_000[i].unk_5B][1] + r5->unk_000[i].unk_24.unk_21;
                v1 = _020F5B04[i][r5->unk_000[i].unk_5B][1] + r5->unk_000[i].unk_24.unk_21 + r5->unk_000[i].unk_24.unk_23;
                NNS_G2dDrawSpriteFast(
                    r5->unk_000[i].unk_24.unk_00 - 40 + r5->unk_000[i].unk_24.unk_20 + r5->unk_000[i].unk_24.unk_08,
                    r5->unk_000[i].unk_24.unk_02 - 40 + r5->unk_000[i].unk_24.unk_21 + r5->unk_000[i].unk_24.unk_0A - r5->unk_000[i].unk_6C.unk_2,
                    r5->unk_000[i].unk_24.unk_04 + r5->unk_000[i].unk_24.unk_0C,
                    r5->unk_000[i].unk_24.unk_22,
                    r5->unk_000[i].unk_24.unk_23,
                    u0,
                    v0,
                    u1,
                    v1
                );
            } else {
                width = (80 * r5->unk_000[i].unk_24.unk_10) >> 8;
                height = (80 * r5->unk_000[i].unk_24.unk_12) >> 8;
                u0 = _020F5B04[i][r5->unk_000[i].unk_5B][0];
                u1 = _020F5B04[i][r5->unk_000[i].unk_5B][2];
                v0 = _020F5B04[i][r5->unk_000[i].unk_5B][1];
                v1 = _020F5B04[i][r5->unk_000[i].unk_5B][3];
                NNS_G2dDrawSpriteFast(
                    r5->unk_000[i].unk_24.unk_00 - width / 2 + r5->unk_000[i].unk_24.unk_08,
                    r5->unk_000[i].unk_24.unk_02 - height / 2 + r5->unk_000[i].unk_24.unk_0A - r5->unk_000[i].unk_6C.unk_2,
                    r5->unk_000[i].unk_24.unk_04 + r5->unk_000[i].unk_24.unk_0C,
                    width,
                    height,
                    u0,
                    v0,
                    u1,
                    v1
                );
            }
            if (r5->unk_000[i].unk_6C.unk_0_0 != 0 && r5->unk_000[i].unk_6C.unk_0_5 != 0 && !r5->unk_000[i].unk_24.unk_30_01 && !(r5->unk_334 & 1)) {
                if (r5->unk_333 != 1) {
                    G3_Identity();
                }
                G3_TexPlttBase(r5->unk_2F4 + 0x20 * (3 + r5->unk_000[i].unk_6C.unk_0_0), r5->unk_2B0.attr.fmt);
                if (r5->unk_000[i].unk_6C.unk_0_4) {
                    width = (64 * r5->unk_000[i].unk_24.unk_10) >> 8;
                    height = (16 * r5->unk_000[i].unk_24.unk_12) >> 8;
                } else {
                    width = 64;
                    height = 16;
                }
                if (r5->unk_000[i].unk_6C.unk_0_2) {
                    r5->unk_000[i].unk_6C.unk_4 = r5->unk_000[i].unk_24.unk_00 + r5->unk_000[i].unk_24.unk_08 + r5->unk_000[i].unk_6C.unk_8;
                }
                if (r5->unk_000[i].unk_6C.unk_0_3) {
                    r5->unk_000[i].unk_6C.unk_6 = r5->unk_000[i].unk_24.unk_02 + r5->unk_000[i].unk_24.unk_0A + r5->unk_000[i].unk_6C.unk_A;
                }
                u0 = _020F5988[r5->unk_000[i].unk_6C.unk_0_5][0];
                v0 = _020F5988[r5->unk_000[i].unk_6C.unk_0_5][1];
                u1 = _020F5988[r5->unk_000[i].unk_6C.unk_0_5][2];
                v1 = _020F5988[r5->unk_000[i].unk_6C.unk_0_5][3];
                NNS_G2dDrawSpriteFast(
                    r5->unk_000[i].unk_6C.unk_4 - width / 2,
                    r5->unk_000[i].unk_6C.unk_6 - height / 2,
                    -1000,
                    width,
                    height,
                    u0,
                    v0,
                    u1,
                    v1
                );
            }
        }
    }
    G3_PopMtx(1);
}

void sub_02008524(UnkStruct_02007FD4 *a0) {
    FreeToHeap(a0->unk_2FC);
    FreeToHeap(a0->unk_300);
    FreeToHeap(a0->unk_304);
    FreeToHeap(a0);
}

void sub_02008550(UnkStruct_02007FD4_sub *a0) {
    a0->unk_59 = 0;
    for (int i = 0; i < 10; ++i) {
        a0->unk_5C[i] = 0;
    }
    if (a0->unk_84[a0->unk_59].unk_0 == -1) {
        a0->unk_5B = 0;
    } else {
        a0->unk_58 = 1;
        a0->unk_5B = a0->unk_84[a0->unk_59].unk_0;
        a0->unk_5A = a0->unk_84[a0->unk_59].unk_1;
        a0->unk_24.unk_08 = a0->unk_84[a0->unk_59].unk_2;
    }
}

void sub_020085C8(UnkStruct_02007FD4_sub *a0, UnkStruct_02007FD4_sub84 *a1) {
    MI_CpuCopy8(a1, a0->unk_84, sizeof(struct UnkStruct_02007FD4_sub84) * 10);
}

BOOL sub_020085DC(UnkStruct_02007FD4_sub *a0) {
    return a0->unk_58 != 0;
}

UnkStruct_02007FD4_sub *sub_020085EC(UnkStruct_02007FD4 *a0, SomeDrawPokemonStruct *a1, int a2, int a3, int a4, int a5, UnkStruct_02007FD4_sub84 *a6, UnkStruct_02007FD4_sub_func68 a7) {
    int i;
    for (i = 0; i < 4; ++i) {
        if (!a0->unk_000[i].unk_00_00) {
            break;
        }
    }
    GF_ASSERT(i != 4);
    return sub_02008634(a0, a1, a2, a3, a4, a5, i, a6, a7);
}

UnkStruct_02007FD4_sub *sub_02008634(UnkStruct_02007FD4 *a0, SomeDrawPokemonStruct *a1, int a2, int a3, int a4, int a5, int a6, UnkStruct_02007FD4_sub84 *a7, UnkStruct_02007FD4_sub_func68 a8) {
    GF_ASSERT(!a0->unk_000[a6].unk_00_00);
    MI_CpuClearFast(&a0->unk_000[a6], sizeof(UnkStruct_02007FD4_sub));
    a0->unk_000[a6].unk_00_00 = TRUE;
    a0->unk_000[a6].unk_00_07 = TRUE;
    a0->unk_000[a6].unk_00_08 = TRUE;
    a0->unk_000[a6].unk_00_01 = a5;
    a0->unk_000[a6].unk_04 = *a1;
    a0->unk_000[a6].unk_14 = *a1;
    a0->unk_000[a6].unk_24.unk_00 = a2;
    a0->unk_000[a6].unk_24.unk_02 = a3;
    a0->unk_000[a6].unk_24.unk_04 = a4;
    a0->unk_000[a6].unk_24.unk_10 = 0x100;
    a0->unk_000[a6].unk_24.unk_12 = 0x100;
    a0->unk_000[a6].unk_24.unk_30_02 = 31;
    a0->unk_000[a6].unk_24.unk_2C_00 = 31;
    a0->unk_000[a6].unk_24.unk_2C_05 = 31;
    a0->unk_000[a6].unk_24.unk_2C_10 = 31;
    a0->unk_000[a6].unk_24.unk_2C_15 = 16;
    a0->unk_000[a6].unk_24.unk_2C_20 = 16;
    a0->unk_000[a6].unk_24.unk_2C_25 = 16;
    a0->unk_000[a6].unk_68 = a8;
    a0->unk_000[a6].unk_6C.unk_4 = a2;
    a0->unk_000[a6].unk_6C.unk_6 = a3;
    a0->unk_000[a6].unk_6C.unk_0_2 = TRUE;
    a0->unk_000[a6].unk_6C.unk_0_3 = TRUE;
    a0->unk_000[a6].unk_6C.unk_0_4 = TRUE;
    if (a7 != NULL) {
        MI_CpuCopy8(a7, a0->unk_000[a6].unk_84, 10 * sizeof(UnkStruct_02007FD4_sub84));
    }
    return &a0->unk_000[a6];
}

void sub_02008780(UnkStruct_02007FD4_sub *a0) {
    a0->unk_00_00 = FALSE;
}

void sub_0200878C(UnkStruct_02007FD4 *a0) {
    for (int i = 0; i < 4; ++i) {
        sub_02008780(&a0->unk_000[i]);
    }
}

void sub_020087A4(UnkStruct_02007FD4_sub *a0, int a1, int a2) {
    switch (a1) {
    case 0:
        a0->unk_24.unk_00 = a2;
        break;
    case 1:
        a0->unk_24.unk_02 = a2;
        break;
    case 2:
        a0->unk_24.unk_04 = a2;
        break;
    case 3:
        a0->unk_24.unk_08 = a2;
        break;
    case 4:
        a0->unk_24.unk_0A = a2;
        break;
    case 5:
        a0->unk_24.unk_0C = a2;
        break;
    case 6:
        a0->unk_24.unk_30_00 = a2;
        break;
    case 7:
        a0->unk_24.unk_14 = a2;
        break;
    case 8:
        a0->unk_24.unk_16 = a2;
        break;
    case 9:
        a0->unk_24.unk_18 = a2;
        break;
    case 10:
        a0->unk_24.unk_1C = a2;
        break;
    case 11:
        a0->unk_24.unk_1E = a2;
        break;
    case 12:
        a0->unk_24.unk_10 = a2;
        break;
    case 13:
        a0->unk_24.unk_12 = a2;
        break;
    case 14:
        a0->unk_24.unk_30_01 = a2;
        break;
    case 15:
        a0->unk_24.unk_20 = a2;
        break;
    case 16:
        a0->unk_24.unk_21 = a2;
        break;
    case 17:
        a0->unk_24.unk_22 = a2;
        break;
    case 18:
        a0->unk_24.unk_23 = a2;
        break;
    case 19:
        a0->unk_6C.unk_4 = a2;
        break;
    case 20:
        a0->unk_6C.unk_6 = a2;
        break;
    case 21:
        a0->unk_6C.unk_8 = a2;
        break;
    case 22:
        a0->unk_6C.unk_A = a2;
        break;
    case 23:
        a0->unk_24.unk_30_02 = a2;
        break;
    case 24:
        a0->unk_24.unk_2C_00 = a2;
        break;
    case 25:
        a0->unk_24.unk_2C_05 = a2;
        break;
    case 26:
        a0->unk_24.unk_2C_10 = a2;
        break;
    case 27:
        a0->unk_24.unk_2C_15 = a2;
        break;
    case 28:
        a0->unk_24.unk_2C_20 = a2;
        break;
    case 29:
        a0->unk_24.unk_2C_25 = a2;
        break;
    case 30:
        a0->unk_24.unk_30_0C = a2;
        a0->unk_00_08 = TRUE;
        break;
    case 31:
        a0->unk_24.unk_28 = a2;
        a0->unk_00_08 = TRUE;
        break;
    case 32:
        a0->unk_24.unk_24 = a2;
        a0->unk_00_08 = TRUE;
        break;
    case 33:
        a0->unk_24.unk_25 = a2;
        a0->unk_00_08 = TRUE;
        break;
    case 34:
        a0->unk_24.unk_26 = a2;
        break;
    case 35:
        a0->unk_24.unk_30_09 = a2;
        a0->unk_00_07 = TRUE;
        break;
    case 36:
        a0->unk_24.unk_30_0A = a2;
        a0->unk_00_07 = TRUE;
        break;
    case 37:
        a0->unk_24.unk_30_0B = a2;
        break;
    case 38:
        a0->unk_5B = a2;
        break;
    case 40:
        a0->unk_24.unk_30_0D = a2;
        a0->unk_00_07 = TRUE;
        break;
    case 41:
        a0->unk_6C.unk_2 = a2;
        break;
    case 42:
        a0->unk_6C.unk_0_0 = a2;
        a0->unk_00_08 = TRUE;
        break;
    case 43:
        a0->unk_6C.unk_0_2 = a2;
        break;
    case 44:
        a0->unk_6C.unk_0_3 = a2;
        break;
    case 45:
        a0->unk_6C.unk_0_4 = a2;
        break;
    case 46:
        a0->unk_6C.unk_0_5 = a2;
        break;
    }
}

int sub_02008A78(UnkStruct_02007FD4_sub *a0, int a1) {
    switch (a1) {
    case 0:
        return a0->unk_24.unk_00;
    case 1:
        return a0->unk_24.unk_02;
    case 2:
        return a0->unk_24.unk_04;
    case 3:
        return a0->unk_24.unk_08;
    case 4:
        return a0->unk_24.unk_0A;
    case 5:
        return a0->unk_24.unk_0C;
    case 6:
        return a0->unk_24.unk_30_00;
    case 7:
        return a0->unk_24.unk_14;
    case 8:
        return a0->unk_24.unk_16;
    case 9:
        return a0->unk_24.unk_18;
    case 10:
        return a0->unk_24.unk_1C;
    case 11:
        return a0->unk_24.unk_1E;
    case 12:
        return a0->unk_24.unk_10;
    case 13:
        return a0->unk_24.unk_12;
    case 14:
        return a0->unk_24.unk_30_01;
    case 15:
        return a0->unk_24.unk_20;
    case 16:
        return a0->unk_24.unk_21;
    case 17:
        return a0->unk_24.unk_22;
    case 18:
        return a0->unk_24.unk_23;
    case 19:
        return a0->unk_6C.unk_4;
    case 20:
        return a0->unk_6C.unk_6;
    case 21:
        return a0->unk_6C.unk_8;
    case 22:
        return a0->unk_6C.unk_A;
    case 23:
        return a0->unk_24.unk_30_02;
    case 24:
        return a0->unk_24.unk_2C_00;
    case 25:
        return a0->unk_24.unk_2C_05;
    case 26:
        return a0->unk_24.unk_2C_10;
    case 27:
        return a0->unk_24.unk_2C_15;
    case 28:
        return a0->unk_24.unk_2C_20;
    case 29:
        return a0->unk_24.unk_2C_25;
    case 30:
        return a0->unk_24.unk_30_0C;
    case 31:
        return a0->unk_24.unk_28;
    case 32:
        return a0->unk_24.unk_24;
    case 33:
        return a0->unk_24.unk_25;
    case 34:
        return a0->unk_24.unk_26;
    case 35:
        return a0->unk_24.unk_30_09;
    case 36:
        return a0->unk_24.unk_30_0A;
    case 37:
        return a0->unk_24.unk_30_0B;
    case 38:
        return a0->unk_5B;
    case 40:
        return a0->unk_24.unk_30_0D;
    case 41:
        return a0->unk_6C.unk_2;
    case 42:
        return a0->unk_6C.unk_0_0;
    case 43:
        return a0->unk_6C.unk_0_2;
    case 44:
        return a0->unk_6C.unk_0_3;
    case 45:
        return a0->unk_6C.unk_0_4;
    case 46:
        return a0->unk_6C.unk_0_5;
    }

    GF_ASSERT(FALSE);
    return 0;
}

void sub_02008C2C(UnkStruct_02007FD4_sub *a0, int a1, int a2) {
    switch (a1) {
    case 0:
        a0->unk_24.unk_00 += a2;
        break;
    case 1:
        a0->unk_24.unk_02 += a2;
        break;
    case 2:
        a0->unk_24.unk_04 += a2;
        break;
    case 3:
        a0->unk_24.unk_08 += a2;
        break;
    case 4:
        a0->unk_24.unk_0A += a2;
        break;
    case 5:
        a0->unk_24.unk_0C += a2;
        break;
    case 6:
        a0->unk_24.unk_30_00 += a2;
        break;
    case 7:
        a0->unk_24.unk_14 += a2;
        break;
    case 8:
        a0->unk_24.unk_16 += a2;
        break;
    case 9:
        a0->unk_24.unk_18 += a2;
        break;
    case 10:
        a0->unk_24.unk_1C += a2;
        break;
    case 11:
        a0->unk_24.unk_1E += a2;
        break;
    case 12:
        a0->unk_24.unk_10 += a2;
        break;
    case 13:
        a0->unk_24.unk_12 += a2;
        break;
    case 14:
        a0->unk_24.unk_30_01 += a2;
        break;
    case 15:
        a0->unk_24.unk_20 += a2;
        break;
    case 16:
        a0->unk_24.unk_21 += a2;
        break;
    case 17:
        a0->unk_24.unk_22 += a2;
        break;
    case 18:
        a0->unk_24.unk_23 += a2;
        break;
    case 19:
        a0->unk_6C.unk_4 += a2;
        break;
    case 20:
        a0->unk_6C.unk_6 += a2;
        break;
    case 21:
        a0->unk_6C.unk_8 += a2;
        break;
    case 22:
        a0->unk_6C.unk_A += a2;
        break;
    case 23:
        a0->unk_24.unk_30_02 += a2;
        break;
    case 24:
        a0->unk_24.unk_2C_00 += a2;
        break;
    case 25:
        a0->unk_24.unk_2C_05 += a2;
        break;
    case 26:
        a0->unk_24.unk_2C_10 += a2;
        break;
    case 27:
        a0->unk_24.unk_2C_15 += a2;
        break;
    case 28:
        a0->unk_24.unk_2C_20 += a2;
        break;
    case 29:
        a0->unk_24.unk_2C_25 += a2;
        break;
    case 30:
        a0->unk_24.unk_30_0C += a2;
        a0->unk_00_08 = TRUE;
        break;
    case 31:
        a0->unk_24.unk_28 += a2;
        a0->unk_00_08 = TRUE;
        break;
    case 32:
        a0->unk_24.unk_24 += a2;
        a0->unk_00_08 = TRUE;
        break;
    case 33:
        a0->unk_24.unk_25 += a2;
        a0->unk_00_08 = TRUE;
        break;
    case 34:
        a0->unk_24.unk_26 += a2;
        break;
    case 35:
        a0->unk_24.unk_30_09 += a2;
        a0->unk_00_07 = TRUE;
        break;
    case 36:
        a0->unk_24.unk_30_0A += a2;
        a0->unk_00_07 = TRUE;
        break;
    case 37:
        a0->unk_24.unk_30_0B += a2;
        break;
    case 38:
        a0->unk_5B += a2;
        break;
    case 40:
        a0->unk_24.unk_30_0D += a2;
        a0->unk_00_07 = TRUE;
        break;
    case 41:
        a0->unk_6C.unk_2 += a2;
        break;
    case 42:
        a0->unk_6C.unk_0_0 += a2;
        a0->unk_00_08 = TRUE;
        break;
    case 43:
        a0->unk_6C.unk_0_2 += a2;
        break;
    case 44:
        a0->unk_6C.unk_0_3 += a2;
        break;
    case 45:
        a0->unk_6C.unk_0_4 += a2;
        break;
    case 46:
        a0->unk_6C.unk_0_5 += a2;
        break;
    }
}

void sub_0200908C(UnkStruct_02007FD4_sub *a0, int a1, int a2, int a3, int a4) {
    a0->unk_24.unk_30_01 = TRUE;
    a0->unk_24.unk_20 = a1;
    a0->unk_24.unk_21 = a2;
    a0->unk_24.unk_22 = a3;
    a0->unk_24.unk_23 = a4;
}

void sub_020090B4(UnkStruct_02007FD4_sub *a0, int a1, int a2, int a3, int a4) {
    a0->unk_24.unk_30_0C = TRUE;
    a0->unk_24.unk_24 = a1;
    a0->unk_24.unk_25 = a2;
    a0->unk_24.unk_26 = 0;
    a0->unk_24.unk_27 = a3;
    a0->unk_24.unk_28 = a4;
}

void sub_020090E4(UnkStruct_02007FD4 *a0, int a1, int a2, int a3, int a4) {
    for (int i = 0; i < 4; ++i) {
        if (a0->unk_000[i].unk_00_00) {
            a0->unk_000[i].unk_24.unk_30_0C = TRUE;
            a0->unk_000[i].unk_24.unk_24 = a1;
            a0->unk_000[i].unk_24.unk_25 = a2;
            a0->unk_000[i].unk_24.unk_26 = 0;
            a0->unk_000[i].unk_24.unk_27 = a3;
            a0->unk_000[i].unk_24.unk_28 = a4;
        }
    }
}

BOOL sub_02009138(UnkStruct_02007FD4_sub *a0) {
    return a0->unk_24.unk_30_0C == TRUE;
}

void sub_0200914C(UnkStruct_02007FD4_sub *a0, int a1) {
    a0->unk_24.unk_0A = (40 - a1) - (((40 - a1) * a0->unk_24.unk_12) >> 8);
}

static inline void sub_02009160_ex(u8 *a0, u8 *a1, u8 *a2, u8 *a3, u8 *a4, const UnkStruct_02007FD4_sub84 *a5) {
    if (*a0 != 0) {
        if (*a3 == 0) {
            ++(*a2);
            while (a5[*a2].unk_0 < -1) {
                ++a4[*a2];
                if (a5[*a2].unk_1 == a4[*a2] || a5[*a2].unk_1 == 0) {
                    a4[*a2] = 0;
                    ++a2;  // ++(*a2);
                } else {
                    *a2 = -2 - a5[*a2].unk_0;
                }
            }
            if (a5[*a2].unk_0 == -1 || *a2 >= 10) {
                *a1 = 0;
                *a0 = 0;
            } else {
                *a1 = a5[*a2].unk_0;
                *a3 = a5[*a2].unk_1;
            }
        } else {
            --(*a3);
        }
    }
}

void sub_02009160(UnkStruct_02007FD4_sub *a0) {
    if (a0->unk_58 != 0) {
        if (a0->unk_5A == 0) {
            ++a0->unk_59;
            while (a0->unk_84[a0->unk_59].unk_0 < -1) {
                ++a0->unk_5C[a0->unk_59];
                if (a0->unk_84[a0->unk_59].unk_1 == a0->unk_5C[a0->unk_59] || a0->unk_84[a0->unk_59].unk_1 == 0) {
                    a0->unk_5C[a0->unk_59] = 0;
                    ++a0->unk_59;
                } else {
                    a0->unk_59 = -2 - a0->unk_84[a0->unk_59].unk_0;
                }
            }
            if (a0->unk_59 >= 10 || a0->unk_84[a0->unk_59].unk_0 == -1) {
                a0->unk_5B = 0;
                a0->unk_58 = 0;
                a0->unk_24.unk_08 = 0;
            } else {
                a0->unk_5B = a0->unk_84[a0->unk_59].unk_0;
                a0->unk_5A = a0->unk_84[a0->unk_59].unk_1;
                a0->unk_24.unk_08 = a0->unk_84[a0->unk_59].unk_2;
            }
        } else {
            --a0->unk_5A;
        }
    }
}

void sub_0200925C(UnkStruct_02007FD4_sub *a0) {
    sub_02009160(a0);
}

void sub_02009264(UnkStruct_02009264 *a0, struct UnkStruct_02007FD4_sub84 *a1) {
    a0->unk_0 = 1;
    a0->unk_2 = 0;
    a0->unk_1 = a1->unk_0;
    a0->unk_3 = a1->unk_1;
    a0->unk_10 = a1;
    for (int i = 0; i < 10; ++i) {
        a0->unk_4[i] = 0;
    }
}

int sub_02009284(UnkStruct_02009264 *a0) {
    if (a0->unk_0) {
        sub_02009160_ex(&a0->unk_0, &a0->unk_1, &a0->unk_2, &a0->unk_3, a0->unk_4, a0->unk_10);
        return a0->unk_1;
    }

    return -1;
}

void sub_02009324(UnkStruct_02007FD4_sub *a0) {
    a0->unk_00_07 = TRUE;
    a0->unk_00_08 = TRUE;
}
