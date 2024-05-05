#include "filesystem.h"
#include "global.h"
#include "unk_02007FD8.h"
#include "poketool/pokegra/otherpoke.naix"

void sub_02009CD0(void *pRawCharData);
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
