#include "filesystem.h"
#include "global.h"
#include "unk_02007FD8.h"
#include "palette.h"
#include "poketool/pokegra/otherpoke.naix"
#include "constants/species.h"

static void sub_02009160(Pokepic *pokepic);
static void sub_020094FC(PokepicManager *pokepicManager);
static void sub_0200925C(Pokepic *pokepic);
static void sub_0200994C(PokepicManager *pokepicManager);
static u8 swapNybbles(u8 val);
static void Pokepic_MaybeAddSpindaSpots(Pokepic *pokepic, u8 *charData);
static u16 lcrngUpdate(u32 *p);
static void UnscanPokepic_PtHGSS(u8 *pRawCharData);
static void UnscanPokepic_DP(u8 *pRawCharData);

static const u8 sSpindaSpot1Coords[][2] = {
    {0x1B, 0x0F},
    {0x1C, 0x0F},
    {0x1D, 0x0F},
    {0x1E, 0x0F},
    {0x1A, 0x10},
    {0x1B, 0x10},
    {0x1C, 0x10},
    {0x1D, 0x10},
    {0x1E, 0x10},
    {0x1F, 0x10},
    {0x19, 0x11},
    {0x1A, 0x11},
    {0x1B, 0x11},
    {0x1C, 0x11},
    {0x1D, 0x11},
    {0x1E, 0x11},
    {0x1F, 0x11},
    {0x20, 0x11},
    {0x19, 0x12},
    {0x1A, 0x12},
    {0x1B, 0x12},
    {0x1C, 0x12},
    {0x1D, 0x12},
    {0x1E, 0x12},
    {0x1F, 0x12},
    {0x20, 0x12},
    {0x19, 0x13},
    {0x1A, 0x13},
    {0x1B, 0x13},
    {0x1C, 0x13},
    {0x1D, 0x13},
    {0x1E, 0x13},
    {0x1F, 0x13},
    {0x20, 0x13},
    {0x19, 0x14},
    {0x1A, 0x14},
    {0x1B, 0x14},
    {0x1C, 0x14},
    {0x1D, 0x14},
    {0x1E, 0x14},
    {0x1F, 0x14},
    {0x20, 0x14},
    {0x1A, 0x15},
    {0x1B, 0x15},
    {0x1C, 0x15},
    {0x1D, 0x15},
    {0x1E, 0x15},
    {0x1F, 0x15},
    {0x1B, 0x16},
    {0x1C, 0x16},
    {0x1D, 0x16},
    {0x1E, 0x16},
    {0xFF, 0xFF},
};

static const u8 sSpindaSpot2Coords[][2] = {
    {0x33, 0x11},
    {0x34, 0x11},
    {0x35, 0x11},
    {0x36, 0x11},
    {0x32, 0x12},
    {0x33, 0x12},
    {0x34, 0x12},
    {0x35, 0x12},
    {0x36, 0x12},
    {0x37, 0x12},
    {0x31, 0x13},
    {0x32, 0x13},
    {0x33, 0x13},
    {0x34, 0x13},
    {0x35, 0x13},
    {0x36, 0x13},
    {0x37, 0x13},
    {0x38, 0x13},
    {0x31, 0x14},
    {0x32, 0x14},
    {0x33, 0x14},
    {0x34, 0x14},
    {0x35, 0x14},
    {0x36, 0x14},
    {0x37, 0x14},
    {0x38, 0x14},
    {0x31, 0x15},
    {0x32, 0x15},
    {0x33, 0x15},
    {0x34, 0x15},
    {0x35, 0x15},
    {0x36, 0x15},
    {0x37, 0x15},
    {0x38, 0x15},
    {0x31, 0x16},
    {0x32, 0x16},
    {0x33, 0x16},
    {0x34, 0x16},
    {0x35, 0x16},
    {0x36, 0x16},
    {0x37, 0x16},
    {0x38, 0x16},
    {0x32, 0x17},
    {0x33, 0x17},
    {0x34, 0x17},
    {0x35, 0x17},
    {0x36, 0x17},
    {0x37, 0x17},
    {0x33, 0x18},
    {0x34, 0x18},
    {0x35, 0x18},
    {0x36, 0x18},
    {0xFF, 0xFF},
};

static const u8 sSpindaSpot3Coords[][2] = {
    {0x1E, 0x21},
    {0x1F, 0x21},
    {0x20, 0x21},
    {0x1D, 0x22},
    {0x1E, 0x22},
    {0x1F, 0x22},
    {0x20, 0x22},
    {0x21, 0x22},
    {0x1C, 0x23},
    {0x1D, 0x23},
    {0x1E, 0x23},
    {0x1F, 0x23},
    {0x20, 0x23},
    {0x21, 0x23},
    {0x22, 0x23},
    {0x1C, 0x24},
    {0x1D, 0x24},
    {0x1E, 0x24},
    {0x1F, 0x24},
    {0x20, 0x24},
    {0x21, 0x24},
    {0x22, 0x24},
    {0x1C, 0x25},
    {0x1D, 0x25},
    {0x1E, 0x25},
    {0x1F, 0x25},
    {0x20, 0x25},
    {0x21, 0x25},
    {0x22, 0x25},
    {0x1C, 0x26},
    {0x1D, 0x26},
    {0x1E, 0x26},
    {0x1F, 0x26},
    {0x20, 0x26},
    {0x21, 0x26},
    {0x22, 0x26},
    {0x1C, 0x27},
    {0x1D, 0x27},
    {0x1E, 0x27},
    {0x1F, 0x27},
    {0x20, 0x27},
    {0x21, 0x27},
    {0x22, 0x27},
    {0x1D, 0x28},
    {0x1E, 0x28},
    {0x1F, 0x28},
    {0x20, 0x28},
    {0x21, 0x28},
    {0x1E, 0x29},
    {0x1F, 0x29},
    {0x20, 0x29},
    {0xFF, 0xFF},
};

static const u8 sSpindaSpot4Coords[][2] = {
    {0x2B, 0x21},
    {0x2C, 0x21},
    {0x2D, 0x21},
    {0x29, 0x22},
    {0x2A, 0x22},
    {0x2B, 0x22},
    {0x2C, 0x22},
    {0x2D, 0x22},
    {0x2E, 0x22},
    {0x2F, 0x22},
    {0x28, 0x23},
    {0x29, 0x23},
    {0x2A, 0x23},
    {0x2B, 0x23},
    {0x2C, 0x23},
    {0x2D, 0x23},
    {0x2E, 0x23},
    {0x2F, 0x23},
    {0x30, 0x23},
    {0x28, 0x24},
    {0x29, 0x24},
    {0x2A, 0x24},
    {0x2B, 0x24},
    {0x2C, 0x24},
    {0x2D, 0x24},
    {0x2E, 0x24},
    {0x2F, 0x24},
    {0x30, 0x24},
    {0x28, 0x25},
    {0x29, 0x25},
    {0x2A, 0x25},
    {0x2B, 0x25},
    {0x2C, 0x25},
    {0x2D, 0x25},
    {0x2E, 0x25},
    {0x2F, 0x25},
    {0x30, 0x25},
    {0x28, 0x26},
    {0x29, 0x26},
    {0x2A, 0x26},
    {0x2B, 0x26},
    {0x2C, 0x26},
    {0x2D, 0x26},
    {0x2E, 0x26},
    {0x2F, 0x26},
    {0x30, 0x26},
    {0x28, 0x27},
    {0x29, 0x27},
    {0x2A, 0x27},
    {0x2B, 0x27},
    {0x2C, 0x27},
    {0x2D, 0x27},
    {0x2E, 0x27},
    {0x2F, 0x27},
    {0x30, 0x27},
    {0x28, 0x28},
    {0x29, 0x28},
    {0x2A, 0x28},
    {0x2B, 0x28},
    {0x2C, 0x28},
    {0x2D, 0x28},
    {0x2E, 0x28},
    {0x2F, 0x28},
    {0x30, 0x28},
    {0x29, 0x29},
    {0x2A, 0x29},
    {0x2B, 0x29},
    {0x2C, 0x29},
    {0x2D, 0x29},
    {0x2E, 0x29},
    {0x2F, 0x29},
    {0x2B, 0x2A},
    {0x2C, 0x2A},
    {0x2D, 0x2A},
    {0xFF, 0xFF},
};

static const u8 (*sSpindaSpotsCoordsPtrs[4])[2] = {
    sSpindaSpot1Coords,
    sSpindaSpot2Coords,
    sSpindaSpot3Coords,
    sSpindaSpot4Coords,
};

static const int _020F5B04[4][2][4] = {
    {
        {0x00, 0x00, 0x50, 0x50},
        {0x50, 0x00, 0xA0, 0x50},
    },
    {
        {0x00, 0x50, 0x50, 0xA0},
        {0x50, 0x50, 0xA0, 0xA0},
    },
    {
        {0x00, 0xA0, 0x50, 0xF0},
        {0x50, 0xA0, 0xA0, 0xF0},
    },
    {
        {0xA0, 0x00, 0xF0, 0x50},
        {0xA0, 0x50, 0xF0, 0xA0},
    },
};

static const int _020F5988[4][4] = {
    {0xA0, 0xA0, 0xE0, 0xB0},
    {0xA0, 0xA0, 0xE0, 0xB0},
    {0xA0, 0xB0, 0xE0, 0xC0},
    {0xA0, 0xC0, 0xE0, 0xD0},
};

PokepicManager *PokepicManager_Create(HeapID heapId) {
    PokepicManager *ret = AllocFromHeap(heapId, sizeof(PokepicManager));
    MI_CpuClearFast(ret, sizeof(PokepicManager));
    ret->heapId = heapId;
    ret->unk_330 = 0;
    ret->charBaseAddr = 0;
    ret->charSize = 0x8000;
    ret->plttBaseAddr = 0;
    ret->plttSize = 0x80;
    ret->charRawData = AllocFromHeap(heapId, 0x8000);
    ret->plttRawData = AllocFromHeap(heapId, 0xC0);
    MI_CpuClearFast(ret->plttRawData, 4);
    ret->plttRawDataUnfaded = AllocFromHeap(heapId, 0xC0);
    MI_CpuClearFast(ret->plttRawDataUnfaded, 4);
    for (int i = 0; i < 4; ++i) {
        MI_CpuClearFast(&ret->pics[i], sizeof(Pokepic));
    }
    NNS_G2dSetupSoftwareSpriteCamera();
    ret->unk_333 = FALSE;

    NNSG2dCharacterData *charData;
    u8 *pRawCharData;
    void *pNcgrFile = AllocAndReadWholeNarcMemberByIdPair(NARC_poketool_pokegra_otherpoke, NARC_otherpoke_259_NCGR, ret->heapId);  // shadow.png
    NNS_G2dGetUnpackedCharacterData(pNcgrFile, &charData);
    ret->charData.pixelFmt = charData->pixelFmt;
    ret->charData.mapingType = charData->mapingType;
    ret->charData.characterFmt = charData->characterFmt;
    pRawCharData = charData->pRawData;
    UnscanPokepic_PtHGSS(pRawCharData);
    MI_CpuFill8(ret->charRawData, *pRawCharData, 0x8000);
    for (int i = 0; i < 80; ++i) {
        for (int j = 0; j < 40; ++j) {
            int dstOffs = 0x5050 + 0x80 * i + j;
            int srcOffs = 0x50 * i + j;
            ret->charRawData[dstOffs] = pRawCharData[srcOffs];
        }
    }
    FreeToHeap(pNcgrFile);
    ret->needLoadImage = 1;
    ret->needLoadPltt = 1;
    return ret;
}

void sub_02008120(PokepicManager *pokepicManager) {
    int i;
    int width;
    int height;
    int u0;
    int v0;
    int u1;
    int v1;

    sub_020094FC(pokepicManager);
    sub_0200994C(pokepicManager);
    NNS_G3dGeFlushBuffer();
    G3_PushMtx();
    G3_TexImageParam(pokepicManager->imageProxy.attr.fmt, GX_TEXGEN_TEXCOORD, pokepicManager->imageProxy.attr.sizeS, pokepicManager->imageProxy.attr.sizeT, GX_TEXREPEAT_NONE, GX_TEXFLIP_NONE, pokepicManager->imageProxy.attr.plttUse, pokepicManager->charBaseAddr);
    for (i = 0; i < 4; ++i) {
        if (pokepicManager->pics[i].active && !pokepicManager->pics[i].drawParam.hasVanished && !pokepicManager->pics[i].drawParam.dontDraw) {
            if (pokepicManager->pics[i].callback != NULL) {
                pokepicManager->pics[i].callback(&pokepicManager->pics[i], &pokepicManager->pics[i].drawParam);
            }
            NNS_G3dGeFlushBuffer();
            if (pokepicManager->unk_333 != TRUE) {
                G3_Identity();
            }
            sub_0200925C(&pokepicManager->pics[i]);
            G3_TexPlttBase(pokepicManager->plttBaseAddr + 0x20 * i, pokepicManager->imageProxy.attr.fmt);
            G3_Translate((pokepicManager->pics[i].drawParam.xCenter + pokepicManager->pics[i].drawParam.xPivot) << FX32_SHIFT, (pokepicManager->pics[i].drawParam.yCenter + pokepicManager->pics[i].drawParam.yPivot) << FX32_SHIFT, (pokepicManager->pics[i].drawParam.zCenter) << FX32_SHIFT);
            G3_RotX(FX_SinIdx(pokepicManager->pics[i].drawParam.rotX), FX_CosIdx(pokepicManager->pics[i].drawParam.rotX));
            G3_RotY(FX_SinIdx(pokepicManager->pics[i].drawParam.rotY), FX_CosIdx(pokepicManager->pics[i].drawParam.rotY));
            G3_RotZ(FX_SinIdx(pokepicManager->pics[i].drawParam.rotZ), FX_CosIdx(pokepicManager->pics[i].drawParam.rotZ));
            G3_Translate(-((pokepicManager->pics[i].drawParam.xCenter + pokepicManager->pics[i].drawParam.xPivot) << FX32_SHIFT), -((pokepicManager->pics[i].drawParam.yCenter + pokepicManager->pics[i].drawParam.yPivot) << FX32_SHIFT), -((pokepicManager->pics[i].drawParam.zCenter) << FX32_SHIFT));
            G3_MaterialColorDiffAmb(GX_RGB(pokepicManager->pics[i].drawParam.diffuseR, pokepicManager->pics[i].drawParam.diffuseG, pokepicManager->pics[i].drawParam.diffuseB), GX_RGB(pokepicManager->pics[i].drawParam.ambientR, pokepicManager->pics[i].drawParam.ambientG, pokepicManager->pics[i].drawParam.ambientB), TRUE);
            G3_MaterialColorSpecEmi(GX_RGB(16, 16, 16), RGB_BLACK, FALSE);
            G3_PolygonAttr(GX_LIGHTMASK_NONE, GX_POLYGONMODE_MODULATE, GX_CULL_NONE, pokepicManager->pics[i].polygonId, pokepicManager->pics[i].drawParam.alpha, 0);
            if (pokepicManager->pics[i].drawParam.visible) {
                u0 = _020F5B04[i][pokepicManager->pics[i].unk_5B][0] + pokepicManager->pics[i].drawParam.unk_20;
                u1 = _020F5B04[i][pokepicManager->pics[i].unk_5B][0] + pokepicManager->pics[i].drawParam.unk_20 + pokepicManager->pics[i].drawParam.unk_22;
                v0 = _020F5B04[i][pokepicManager->pics[i].unk_5B][1] + pokepicManager->pics[i].drawParam.unk_21;
                v1 = _020F5B04[i][pokepicManager->pics[i].unk_5B][1] + pokepicManager->pics[i].drawParam.unk_21 + pokepicManager->pics[i].drawParam.unk_23;
                NNS_G2dDrawSpriteFast(
                    pokepicManager->pics[i].drawParam.xCenter - 40 + pokepicManager->pics[i].drawParam.unk_20 + pokepicManager->pics[i].drawParam.xOffset,
                    pokepicManager->pics[i].drawParam.yCenter - 40 + pokepicManager->pics[i].drawParam.unk_21 + pokepicManager->pics[i].drawParam.yOffset - pokepicManager->pics[i].shadow.unk_2,
                    pokepicManager->pics[i].drawParam.zCenter + pokepicManager->pics[i].drawParam.zOffset,
                    pokepicManager->pics[i].drawParam.unk_22,
                    pokepicManager->pics[i].drawParam.unk_23,
                    u0,
                    v0,
                    u1,
                    v1
                );
            } else {
                width = (80 * pokepicManager->pics[i].drawParam.unk_10) >> 8;
                height = (80 * pokepicManager->pics[i].drawParam.unk_12) >> 8;
                u0 = _020F5B04[i][pokepicManager->pics[i].unk_5B][0];
                u1 = _020F5B04[i][pokepicManager->pics[i].unk_5B][2];
                v0 = _020F5B04[i][pokepicManager->pics[i].unk_5B][1];
                v1 = _020F5B04[i][pokepicManager->pics[i].unk_5B][3];
                NNS_G2dDrawSpriteFast(
                    pokepicManager->pics[i].drawParam.xCenter - width / 2 + pokepicManager->pics[i].drawParam.xOffset,
                    pokepicManager->pics[i].drawParam.yCenter - height / 2 + pokepicManager->pics[i].drawParam.yOffset - pokepicManager->pics[i].shadow.unk_2,
                    pokepicManager->pics[i].drawParam.zCenter + pokepicManager->pics[i].drawParam.zOffset,
                    width,
                    height,
                    u0,
                    v0,
                    u1,
                    v1
                );
            }
            if (pokepicManager->pics[i].shadow.palSlot != 0 && pokepicManager->pics[i].shadow.unk_0_5 != 0 && !pokepicManager->pics[i].drawParam.visible && !(pokepicManager->unk_334 & 1)) {
                if (pokepicManager->unk_333 != TRUE) {
                    G3_Identity();
                }
                G3_TexPlttBase(pokepicManager->plttBaseAddr + 0x20 * (3 + pokepicManager->pics[i].shadow.palSlot), pokepicManager->imageProxy.attr.fmt);
                if (pokepicManager->pics[i].shadow.unk_0_4) {
                    width = (64 * pokepicManager->pics[i].drawParam.unk_10) >> 8;
                    height = (16 * pokepicManager->pics[i].drawParam.unk_12) >> 8;
                } else {
                    width = 64;
                    height = 16;
                }
                if (pokepicManager->pics[i].shadow.unk_0_2) {
                    pokepicManager->pics[i].shadow.x = pokepicManager->pics[i].drawParam.xCenter + pokepicManager->pics[i].drawParam.xOffset + pokepicManager->pics[i].shadow.unk_8;
                }
                if (pokepicManager->pics[i].shadow.unk_0_3) {
                    pokepicManager->pics[i].shadow.y = pokepicManager->pics[i].drawParam.yCenter + pokepicManager->pics[i].drawParam.yOffset + pokepicManager->pics[i].shadow.unk_A;
                }
                u0 = _020F5988[pokepicManager->pics[i].shadow.unk_0_5][0];
                v0 = _020F5988[pokepicManager->pics[i].shadow.unk_0_5][1];
                u1 = _020F5988[pokepicManager->pics[i].shadow.unk_0_5][2];
                v1 = _020F5988[pokepicManager->pics[i].shadow.unk_0_5][3];
                NNS_G2dDrawSpriteFast(
                    pokepicManager->pics[i].shadow.x - width / 2,
                    pokepicManager->pics[i].shadow.y - height / 2,
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

void PokepicManager_Delete(PokepicManager *pokepicManager) {
    FreeToHeap(pokepicManager->charRawData);
    FreeToHeap(pokepicManager->plttRawData);
    FreeToHeap(pokepicManager->plttRawDataUnfaded);
    FreeToHeap(pokepicManager);
}

void sub_02008550(Pokepic *pokepic) {
    pokepic->unk_59 = 0;
    for (int i = 0; i < 10; ++i) {
        pokepic->unk_5C[i] = 0;
    }
    if (pokepic->unk_84[pokepic->unk_59].unk_0 == -1) {
        pokepic->unk_5B = 0;
    } else {
        pokepic->unk_58 = 1;
        pokepic->unk_5B = pokepic->unk_84[pokepic->unk_59].unk_0;
        pokepic->unk_5A = pokepic->unk_84[pokepic->unk_59].unk_1;
        pokepic->drawParam.xOffset = pokepic->unk_84[pokepic->unk_59].unk_2;
    }
}

void sub_020085C8(Pokepic *pokepic, UnkStruct_02007FD4_sub84 *a1) {
    MI_CpuCopy8(a1, pokepic->unk_84, sizeof(struct UnkStruct_02007FD4_sub84) * 10);
}

BOOL sub_020085DC(Pokepic *pokepic) {
    return pokepic->unk_58 != 0;
}

Pokepic *PokepicManager_CreatePokepic(PokepicManager *pokepicManager, PokepicTemplate *template, int x, int y, int z, int polygonId, UnkStruct_02007FD4_sub84 *a6, PokepicCallback callback) {
    int i;
    for (i = 0; i < 4; ++i) {
        if (!pokepicManager->pics[i].active) {
            break;
        }
    }
    GF_ASSERT(i != 4);
    return PokepicManager_CreatePokepicAt(pokepicManager, template, x, y, z, polygonId, i, a6, callback);
}

Pokepic *PokepicManager_CreatePokepicAt(PokepicManager *pokepicManager, PokepicTemplate *template, int x, int y, int z, int polygonId, int picIndex, UnkStruct_02007FD4_sub84 *a7, PokepicCallback callback) {
    GF_ASSERT(!pokepicManager->pics[picIndex].active);
    MI_CpuClearFast(&pokepicManager->pics[picIndex], sizeof(Pokepic));
    pokepicManager->pics[picIndex].active = TRUE;
    pokepicManager->pics[picIndex].needReloadChar = TRUE;
    pokepicManager->pics[picIndex].needReloadPltt = TRUE;
    pokepicManager->pics[picIndex].polygonId = polygonId;
    pokepicManager->pics[picIndex].template = *template;
    pokepicManager->pics[picIndex].templateBak = *template;
    pokepicManager->pics[picIndex].drawParam.xCenter = x;
    pokepicManager->pics[picIndex].drawParam.yCenter = y;
    pokepicManager->pics[picIndex].drawParam.zCenter = z;
    pokepicManager->pics[picIndex].drawParam.unk_10 = 0x100;
    pokepicManager->pics[picIndex].drawParam.unk_12 = 0x100;
    pokepicManager->pics[picIndex].drawParam.alpha = 31;
    pokepicManager->pics[picIndex].drawParam.diffuseR = 31;
    pokepicManager->pics[picIndex].drawParam.diffuseG = 31;
    pokepicManager->pics[picIndex].drawParam.diffuseB = 31;
    pokepicManager->pics[picIndex].drawParam.ambientR = 16;
    pokepicManager->pics[picIndex].drawParam.ambientG = 16;
    pokepicManager->pics[picIndex].drawParam.ambientB = 16;
    pokepicManager->pics[picIndex].callback = callback;
    pokepicManager->pics[picIndex].shadow.x = x;
    pokepicManager->pics[picIndex].shadow.y = y;
    pokepicManager->pics[picIndex].shadow.unk_0_2 = TRUE;
    pokepicManager->pics[picIndex].shadow.unk_0_3 = TRUE;
    pokepicManager->pics[picIndex].shadow.unk_0_4 = TRUE;
    if (a7 != NULL) {
        MI_CpuCopy8(a7, pokepicManager->pics[picIndex].unk_84, 10 * sizeof(UnkStruct_02007FD4_sub84));
    }
    return &pokepicManager->pics[picIndex];
}

void Pokepic_Delete(Pokepic *pokepic) {
    pokepic->active = FALSE;
}

void PokepicManager_DeleteAllPics(PokepicManager *pokepicManager) {
    for (int i = 0; i < 4; ++i) {
        Pokepic_Delete(&pokepicManager->pics[i]);
    }
}

void Pokepic_SetAttr(Pokepic *pokepic, int attr, int value) {
    switch (attr) {
    case 0:
        pokepic->drawParam.xCenter = value;
        break;
    case 1:
        pokepic->drawParam.yCenter = value;
        break;
    case 2:
        pokepic->drawParam.zCenter = value;
        break;
    case 3:
        pokepic->drawParam.xOffset = value;
        break;
    case 4:
        pokepic->drawParam.yOffset = value;
        break;
    case 5:
        pokepic->drawParam.zOffset = value;
        break;
    case 6:
        pokepic->drawParam.hasVanished = value;
        break;
    case 7:
        pokepic->drawParam.rotX = value;
        break;
    case 8:
        pokepic->drawParam.rotY = value;
        break;
    case 9:
        pokepic->drawParam.rotZ = value;
        break;
    case 10:
        pokepic->drawParam.xPivot = value;
        break;
    case 11:
        pokepic->drawParam.yPivot = value;
        break;
    case 12:
        pokepic->drawParam.unk_10 = value;
        break;
    case 13:
        pokepic->drawParam.unk_12 = value;
        break;
    case 14:
        pokepic->drawParam.visible = value;
        break;
    case 15:
        pokepic->drawParam.unk_20 = value;
        break;
    case 16:
        pokepic->drawParam.unk_21 = value;
        break;
    case 17:
        pokepic->drawParam.unk_22 = value;
        break;
    case 18:
        pokepic->drawParam.unk_23 = value;
        break;
    case 19:
        pokepic->shadow.x = value;
        break;
    case 20:
        pokepic->shadow.y = value;
        break;
    case 21:
        pokepic->shadow.unk_8 = value;
        break;
    case 22:
        pokepic->shadow.unk_A = value;
        break;
    case 23:
        pokepic->drawParam.alpha = value;
        break;
    case 24:
        pokepic->drawParam.diffuseR = value;
        break;
    case 25:
        pokepic->drawParam.diffuseG = value;
        break;
    case 26:
        pokepic->drawParam.diffuseB = value;
        break;
    case 27:
        pokepic->drawParam.ambientR = value;
        break;
    case 28:
        pokepic->drawParam.ambientG = value;
        break;
    case 29:
        pokepic->drawParam.ambientB = value;
        break;
    case 30:
        pokepic->drawParam.fadeActive = value;
        pokepic->needReloadPltt = TRUE;
        break;
    case 31:
        pokepic->drawParam.fadeTargetColor = value;
        pokepic->needReloadPltt = TRUE;
        break;
    case 32:
        pokepic->drawParam.fadeCur = value;
        pokepic->needReloadPltt = TRUE;
        break;
    case 33:
        pokepic->drawParam.fadeEnd = value;
        pokepic->needReloadPltt = TRUE;
        break;
    case 34:
        pokepic->drawParam.fadeDelayCounter = value;
        break;
    case 35:
        pokepic->drawParam.hflip = value;
        pokepic->needReloadChar = TRUE;
        break;
    case 36:
        pokepic->drawParam.vflip = value;
        pokepic->needReloadChar = TRUE;
        break;
    case 37:
        pokepic->drawParam.dontDraw = value;
        break;
    case 38:
        pokepic->unk_5B = value;
        break;
    case 40:
        pokepic->drawParam.mosaic = value;
        pokepic->needReloadChar = TRUE;
        break;
    case 41:
        pokepic->shadow.unk_2 = value;
        break;
    case 42:
        pokepic->shadow.palSlot = value;
        pokepic->needReloadPltt = TRUE;
        break;
    case 43:
        pokepic->shadow.unk_0_2 = value;
        break;
    case 44:
        pokepic->shadow.unk_0_3 = value;
        break;
    case 45:
        pokepic->shadow.unk_0_4 = value;
        break;
    case 46:
        pokepic->shadow.unk_0_5 = value;
        break;
    }
}

int Pokepic_GetAttr(Pokepic *pokepic, int attr) {
    switch (attr) {
    case 0:
        return pokepic->drawParam.xCenter;
    case 1:
        return pokepic->drawParam.yCenter;
    case 2:
        return pokepic->drawParam.zCenter;
    case 3:
        return pokepic->drawParam.xOffset;
    case 4:
        return pokepic->drawParam.yOffset;
    case 5:
        return pokepic->drawParam.zOffset;
    case 6:
        return pokepic->drawParam.hasVanished;
    case 7:
        return pokepic->drawParam.rotX;
    case 8:
        return pokepic->drawParam.rotY;
    case 9:
        return pokepic->drawParam.rotZ;
    case 10:
        return pokepic->drawParam.xPivot;
    case 11:
        return pokepic->drawParam.yPivot;
    case 12:
        return pokepic->drawParam.unk_10;
    case 13:
        return pokepic->drawParam.unk_12;
    case 14:
        return pokepic->drawParam.visible;
    case 15:
        return pokepic->drawParam.unk_20;
    case 16:
        return pokepic->drawParam.unk_21;
    case 17:
        return pokepic->drawParam.unk_22;
    case 18:
        return pokepic->drawParam.unk_23;
    case 19:
        return pokepic->shadow.x;
    case 20:
        return pokepic->shadow.y;
    case 21:
        return pokepic->shadow.unk_8;
    case 22:
        return pokepic->shadow.unk_A;
    case 23:
        return pokepic->drawParam.alpha;
    case 24:
        return pokepic->drawParam.diffuseR;
    case 25:
        return pokepic->drawParam.diffuseG;
    case 26:
        return pokepic->drawParam.diffuseB;
    case 27:
        return pokepic->drawParam.ambientR;
    case 28:
        return pokepic->drawParam.ambientG;
    case 29:
        return pokepic->drawParam.ambientB;
    case 30:
        return pokepic->drawParam.fadeActive;
    case 31:
        return pokepic->drawParam.fadeTargetColor;
    case 32:
        return pokepic->drawParam.fadeCur;
    case 33:
        return pokepic->drawParam.fadeEnd;
    case 34:
        return pokepic->drawParam.fadeDelayCounter;
    case 35:
        return pokepic->drawParam.hflip;
    case 36:
        return pokepic->drawParam.vflip;
    case 37:
        return pokepic->drawParam.dontDraw;
    case 38:
        return pokepic->unk_5B;
    case 40:
        return pokepic->drawParam.mosaic;
    case 41:
        return pokepic->shadow.unk_2;
    case 42:
        return pokepic->shadow.palSlot;
    case 43:
        return pokepic->shadow.unk_0_2;
    case 44:
        return pokepic->shadow.unk_0_3;
    case 45:
        return pokepic->shadow.unk_0_4;
    case 46:
        return pokepic->shadow.unk_0_5;
    }

    GF_ASSERT(FALSE);
    return 0;
}

void Pokepic_AddAttr(Pokepic *pokepic, int attr, int addend) {
    switch (attr) {
    case 0:
        pokepic->drawParam.xCenter += addend;
        break;
    case 1:
        pokepic->drawParam.yCenter += addend;
        break;
    case 2:
        pokepic->drawParam.zCenter += addend;
        break;
    case 3:
        pokepic->drawParam.xOffset += addend;
        break;
    case 4:
        pokepic->drawParam.yOffset += addend;
        break;
    case 5:
        pokepic->drawParam.zOffset += addend;
        break;
    case 6:
        pokepic->drawParam.hasVanished += addend;
        break;
    case 7:
        pokepic->drawParam.rotX += addend;
        break;
    case 8:
        pokepic->drawParam.rotY += addend;
        break;
    case 9:
        pokepic->drawParam.rotZ += addend;
        break;
    case 10:
        pokepic->drawParam.xPivot += addend;
        break;
    case 11:
        pokepic->drawParam.yPivot += addend;
        break;
    case 12:
        pokepic->drawParam.unk_10 += addend;
        break;
    case 13:
        pokepic->drawParam.unk_12 += addend;
        break;
    case 14:
        pokepic->drawParam.visible += addend;
        break;
    case 15:
        pokepic->drawParam.unk_20 += addend;
        break;
    case 16:
        pokepic->drawParam.unk_21 += addend;
        break;
    case 17:
        pokepic->drawParam.unk_22 += addend;
        break;
    case 18:
        pokepic->drawParam.unk_23 += addend;
        break;
    case 19:
        pokepic->shadow.x += addend;
        break;
    case 20:
        pokepic->shadow.y += addend;
        break;
    case 21:
        pokepic->shadow.unk_8 += addend;
        break;
    case 22:
        pokepic->shadow.unk_A += addend;
        break;
    case 23:
        pokepic->drawParam.alpha += addend;
        break;
    case 24:
        pokepic->drawParam.diffuseR += addend;
        break;
    case 25:
        pokepic->drawParam.diffuseG += addend;
        break;
    case 26:
        pokepic->drawParam.diffuseB += addend;
        break;
    case 27:
        pokepic->drawParam.ambientR += addend;
        break;
    case 28:
        pokepic->drawParam.ambientG += addend;
        break;
    case 29:
        pokepic->drawParam.ambientB += addend;
        break;
    case 30:
        pokepic->drawParam.fadeActive += addend;
        pokepic->needReloadPltt = TRUE;
        break;
    case 31:
        pokepic->drawParam.fadeTargetColor += addend;
        pokepic->needReloadPltt = TRUE;
        break;
    case 32:
        pokepic->drawParam.fadeCur += addend;
        pokepic->needReloadPltt = TRUE;
        break;
    case 33:
        pokepic->drawParam.fadeEnd += addend;
        pokepic->needReloadPltt = TRUE;
        break;
    case 34:
        pokepic->drawParam.fadeDelayCounter += addend;
        break;
    case 35:
        pokepic->drawParam.hflip += addend;
        pokepic->needReloadChar = TRUE;
        break;
    case 36:
        pokepic->drawParam.vflip += addend;
        pokepic->needReloadChar = TRUE;
        break;
    case 37:
        pokepic->drawParam.dontDraw += addend;
        break;
    case 38:
        pokepic->unk_5B += addend;
        break;
    case 40:
        pokepic->drawParam.mosaic += addend;
        pokepic->needReloadChar = TRUE;
        break;
    case 41:
        pokepic->shadow.unk_2 += addend;
        break;
    case 42:
        pokepic->shadow.palSlot += addend;
        pokepic->needReloadPltt = TRUE;
        break;
    case 43:
        pokepic->shadow.unk_0_2 += addend;
        break;
    case 44:
        pokepic->shadow.unk_0_3 += addend;
        break;
    case 45:
        pokepic->shadow.unk_0_4 += addend;
        break;
    case 46:
        pokepic->shadow.unk_0_5 += addend;
        break;
    }
}

void sub_0200908C(Pokepic *pokepic, int a1, int a2, int a3, int a4) {
    pokepic->drawParam.visible = TRUE;
    pokepic->drawParam.unk_20 = a1;
    pokepic->drawParam.unk_21 = a2;
    pokepic->drawParam.unk_22 = a3;
    pokepic->drawParam.unk_23 = a4;
}

void Pokepic_StartPaletteFade(Pokepic *pokepic, int start, int end, int framesPer, int targetColor) {
    pokepic->drawParam.fadeActive = TRUE;
    pokepic->drawParam.fadeCur = start;
    pokepic->drawParam.fadeEnd = end;
    pokepic->drawParam.fadeDelayCounter = 0;
    pokepic->drawParam.fadeDelayLength = framesPer;
    pokepic->drawParam.fadeTargetColor = targetColor;
}

void Pokepic_StartPaletteFadeAll(PokepicManager *pokepicManager, int start, int end, int framesPer, int targetColor) {
    for (int i = 0; i < 4; ++i) {
        if (pokepicManager->pics[i].active) {
            pokepicManager->pics[i].drawParam.fadeActive = TRUE;
            pokepicManager->pics[i].drawParam.fadeCur = start;
            pokepicManager->pics[i].drawParam.fadeEnd = end;
            pokepicManager->pics[i].drawParam.fadeDelayCounter = 0;
            pokepicManager->pics[i].drawParam.fadeDelayLength = framesPer;
            pokepicManager->pics[i].drawParam.fadeTargetColor = targetColor;
        }
    }
}

BOOL sub_02009138(Pokepic *pokepic) {
    return pokepic->drawParam.fadeActive == TRUE;
}

void sub_0200914C(Pokepic *pokepic, int a1) {
    pokepic->drawParam.yOffset = (40 - a1) - (((40 - a1) * pokepic->drawParam.unk_12) >> 8);
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

static void sub_02009160(Pokepic *pokepic) {
    if (pokepic->unk_58 != 0) {
        if (pokepic->unk_5A == 0) {
            ++pokepic->unk_59;
            while (pokepic->unk_84[pokepic->unk_59].unk_0 < -1) {
                ++pokepic->unk_5C[pokepic->unk_59];
                if (pokepic->unk_84[pokepic->unk_59].unk_1 == pokepic->unk_5C[pokepic->unk_59] || pokepic->unk_84[pokepic->unk_59].unk_1 == 0) {
                    pokepic->unk_5C[pokepic->unk_59] = 0;
                    ++pokepic->unk_59;
                } else {
                    pokepic->unk_59 = -2 - pokepic->unk_84[pokepic->unk_59].unk_0;
                }
            }
            if (pokepic->unk_59 >= 10 || pokepic->unk_84[pokepic->unk_59].unk_0 == -1) {
                pokepic->unk_5B = 0;
                pokepic->unk_58 = 0;
                pokepic->drawParam.xOffset = 0;
            } else {
                pokepic->unk_5B = pokepic->unk_84[pokepic->unk_59].unk_0;
                pokepic->unk_5A = pokepic->unk_84[pokepic->unk_59].unk_1;
                pokepic->drawParam.xOffset = pokepic->unk_84[pokepic->unk_59].unk_2;
            }
        } else {
            --pokepic->unk_5A;
        }
    }
}

static void sub_0200925C(Pokepic *pokepic) {
    sub_02009160(pokepic);
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

void Pokepic_ScheduleReloadFromNarc(Pokepic *pokepic) {
    pokepic->needReloadChar = TRUE;
    pokepic->needReloadPltt = TRUE;
}

void Pokepic_Push(Pokepic *pokepic) {
    pokepic->templateBak = pokepic->template;
    pokepic->shadowBak = pokepic->shadow;
}

void Pokepic_Pop(Pokepic *pokepic) {
    pokepic->template = pokepic->templateBak;
    pokepic->shadow = pokepic->shadowBak;
    pokepic->needReloadChar = TRUE;
    pokepic->needReloadPltt = TRUE;
}

void PokepicManager_SetCharBaseAddrAndSize(PokepicManager *pokepicManager, int addr, int size) {
    pokepicManager->charBaseAddr = addr;
    pokepicManager->charSize = size;
}

void PokepicManager_SetPlttBaseAddrAndSize(PokepicManager *pokepicManager, int addr, int size) {
    pokepicManager->plttBaseAddr = addr;
    pokepicManager->plttSize = size;
}

PokepicTemplate *Pokepic_GetTemplate(Pokepic *pokepic) {
    return &pokepic->template;
}

void PokepicManager_HandleLoadImgAndOrPltt(PokepicManager *pokepicManager) {
    if (pokepicManager->needLoadImage) {
        pokepicManager->needLoadImage = FALSE;
        NNS_G2dInitImageProxy(&pokepicManager->imageProxy);
        pokepicManager->charData.H = 0x20;
        pokepicManager->charData.W = 0x20;
        pokepicManager->charData.szByte = pokepicManager->charSize;
        pokepicManager->charData.pRawData = pokepicManager->charRawData;
        NNS_G2dLoadImage2DMapping(&pokepicManager->charData, pokepicManager->charBaseAddr, NNS_G2D_VRAM_TYPE_3DMAIN, &pokepicManager->imageProxy);
    }
    if (pokepicManager->needLoadPltt) {
        pokepicManager->needLoadPltt = FALSE;
        NNS_G2dInitImagePaletteProxy(&pokepicManager->paletteProxy);
        pokepicManager->plttData.szByte = pokepicManager->plttSize;
        pokepicManager->plttData.pRawData = pokepicManager->plttRawData;
        NNS_G2dLoadPalette(&pokepicManager->plttData, pokepicManager->plttBaseAddr, NNS_G2D_VRAM_TYPE_3DMAIN, &pokepicManager->paletteProxy);
    }
}

void sub_020094B0(PokepicManager *pokepicManager, int a1) {
    pokepicManager->unk_333 = a1;
}

BOOL Pokepic_IsActive(Pokepic *pokepic) {
    GF_ASSERT(pokepic != NULL);
    return !!pokepic->active;
}

void sub_020094D8(PokepicManager *pokepicManager, u32 a1) {
    pokepicManager->unk_334 |= a1;
}

void sub_020094E4(PokepicManager *pokepicManager, u32 a1) {
    pokepicManager->unk_334 &= (a1 ^ -1u);
}

static void sub_020094FC(PokepicManager *pokepicManager) {
    NNSG2dCharacterData *pCharData;
    int i;
    int k;
    int j;
    u8 *pRawCharData;
    void *sp4C;
    u8 needCharUpdate = FALSE;
    for (i = 0; i < 4; ++i) {
        if (pokepicManager->pics[i].active && pokepicManager->pics[i].needReloadChar) {
            pokepicManager->pics[i].needReloadChar = FALSE;
            needCharUpdate = TRUE;
            sp4C = AllocAndReadWholeNarcMemberByIdPair((NarcId)pokepicManager->pics[i].template.narcID, pokepicManager->pics[i].template.charDataID, pokepicManager->heapId);
            NNS_G2dGetUnpackedCharacterData(sp4C, &pCharData);
            pokepicManager->charData.pixelFmt = pCharData->pixelFmt;
            pokepicManager->charData.mapingType = pCharData->mapingType;
            pokepicManager->charData.characterFmt = pCharData->characterFmt;
            pRawCharData = pCharData->pRawData;
            UnscanPokepic(pRawCharData, (NarcId)pokepicManager->pics[i].template.narcID);
            Pokepic_MaybeAddSpindaSpots(&pokepicManager->pics[i], pRawCharData);
            if (i == 3) {
                for (j = 0; j < 80; ++j) {
                    for (k = 0; k < 80; ++k) {
                        if (k < 40) {
                            if (pokepicManager->pics[i].drawParam.hflip && pokepicManager->pics[i].drawParam.vflip) {
                                pokepicManager->charRawData[j * 128 + k + 80] = swapNybbles(pRawCharData[(79 - j) * 80 + (39 - k)]);
                            } else if (pokepicManager->pics[i].drawParam.hflip) {
                                pokepicManager->charRawData[j * 128 + k + 80] = swapNybbles(pRawCharData[j * 80 + (39 - k)]);
                            } else if (pokepicManager->pics[i].drawParam.vflip) {
                                pokepicManager->charRawData[j * 128 + k + 80] = pRawCharData[(79 - j) * 80 + k];
                            } else if (pokepicManager->pics[i].drawParam.mosaic != 0) {
                                if (j % (pokepicManager->pics[i].drawParam.mosaic * 2)) {
                                    pokepicManager->charRawData[j * 128 + k + 80] = pokepicManager->charRawData[(j - 1) * 128 + k + 80];
                                } else if (k % pokepicManager->pics[i].drawParam.mosaic) {
                                    pokepicManager->charRawData[j * 128 + k + 80] = pokepicManager->charRawData[j * 128 + (k - 1) + 80];
                                } else {
                                    pokepicManager->charRawData[j * 128 + k + 80] = (pRawCharData[j * 80 + k] & 0xF) | ((pRawCharData[j * 80 + k] & 0xF) << 4);
                                }
                            } else {
                                pokepicManager->charRawData[j * 128 + k + 80] = pRawCharData[j * 80 + k];
                            }
                        } else {
                            if (pokepicManager->pics[i].drawParam.hflip && pokepicManager->pics[i].drawParam.vflip) {
                                pokepicManager->charRawData[j * 128 + k + 10280] = swapNybbles(pRawCharData[(79 - j) * 80 + (79 - (k - 40))]);
                            } else if (pokepicManager->pics[i].drawParam.hflip) {
                                pokepicManager->charRawData[j * 128 + k + 10280] = swapNybbles(pRawCharData[j * 80 + (79 - (k - 40))]);
                            } else if (pokepicManager->pics[i].drawParam.vflip) {
                                pokepicManager->charRawData[j * 128 + k + 10280] = pRawCharData[(79 - j) * 80 + k];
                            } else if (pokepicManager->pics[i].drawParam.mosaic != 0) {
                                if (j % (pokepicManager->pics[i].drawParam.mosaic * 2)) {
                                    pokepicManager->charRawData[j * 128 + k + 10280] = pokepicManager->charRawData[(j - 1) * 128 + k + 10280];
                                } else if (k % pokepicManager->pics[i].drawParam.mosaic) {
                                    pokepicManager->charRawData[j * 128 + k + 10280] = pokepicManager->charRawData[j * 128 + (k - 1) + 10280];
                                } else {
                                    pokepicManager->charRawData[j * 128 + k + 10280] = (pRawCharData[j * 80 + k] & 0xF) | ((pRawCharData[j * 80 + k] & 0xF) << 4);
                                }
                            } else {
                                pokepicManager->charRawData[j * 128 + k + 10280] = pRawCharData[j * 80 + k];
                            }
                        }
                    }
                }
            } else {
                for (j = 0; j < 80; ++j) {
                    for (k = 0; k < 80; ++k) {
                        if (pokepicManager->pics[i].drawParam.hflip && pokepicManager->pics[i].drawParam.vflip) {
                            if (k < 40) {
                                pokepicManager->charRawData[j * 128 + k + 10240 * i] = swapNybbles(pRawCharData[(79 - j) * 80 + (39 - k)]);
                            } else {
                                pokepicManager->charRawData[j * 128 + k + 10240 * i] = swapNybbles(pRawCharData[(79 - j) * 80 + (79 - (k - 40))]);
                            }
                        } else if (pokepicManager->pics[i].drawParam.hflip) {
                            if (k < 40) {
                                pokepicManager->charRawData[j * 128 + k + 10240 * i] = swapNybbles(pRawCharData[j * 80 + (39 - k)]);
                            } else {
                                pokepicManager->charRawData[j * 128 + k + 10240 * i] = swapNybbles(pRawCharData[j * 80 + (79 - (k - 40))]);
                            }
                        } else if (pokepicManager->pics[i].drawParam.vflip) {
                            pokepicManager->charRawData[j * 128 + k + 10240 * i] = pRawCharData[(79 - j) * 80 + k];
                        } else if (pokepicManager->pics[i].drawParam.mosaic != 0) {
                            if (j % (pokepicManager->pics[i].drawParam.mosaic * 2)) {
                                pokepicManager->charRawData[j * 128 + k + 10240 * i] = pokepicManager->charRawData[(j - 1) * 128 + k + 10240 * i];
                            } else if (k % pokepicManager->pics[i].drawParam.mosaic) {
                                pokepicManager->charRawData[j * 128 + k + 10240 * i] = pokepicManager->charRawData[j * 128 + (k - 1) + 10240 * i];
                            } else {
                                pokepicManager->charRawData[j * 128 + k + 10240 * i] = (pRawCharData[j * 80 + k] & 0xF) | ((pRawCharData[j * 80 + k] & 0xF) << 4);
                            }
                        } else {
                            pokepicManager->charRawData[j * 128 + k + 10240 * i] = pRawCharData[j * 80 + k];
                        }
                    }
                }
            }
            FreeToHeap(sp4C);
        }
    }
    pokepicManager->needLoadImage = needCharUpdate;
}

static void sub_0200994C(PokepicManager *pokepicManager) {
    NNSG2dPaletteData *plttData;
    int i;
    int j;
    u16 *src;
    void *nclrFile;
    u8 needPlttUpdate = FALSE;

    for (i = 0; i < 4; ++i) {
        if (pokepicManager->pics[i].active && pokepicManager->pics[i].needReloadPltt) {
            pokepicManager->pics[i].needReloadPltt = FALSE;
            needPlttUpdate = TRUE;
            nclrFile = AllocAndReadWholeNarcMemberByIdPair((NarcId)pokepicManager->pics[i].template.narcID, pokepicManager->pics[i].template.palDataID, pokepicManager->heapId);
            NNS_G2dGetUnpackedPaletteData(nclrFile, &plttData);
            pokepicManager->plttData.fmt = plttData->fmt;
            src = plttData->pRawData;
            for (j = 0; j < 16; ++j) {
                pokepicManager->plttRawData[j + 16 * i] = src[j];
                pokepicManager->plttRawDataUnfaded[j + 16 * i] = src[j];
            }
            FreeToHeap(nclrFile);
            if (pokepicManager->pics[i].shadow.palSlot != 0) {
                nclrFile = AllocAndReadWholeNarcMemberByIdPair(NARC_poketool_pokegra_otherpoke, NARC_otherpoke_260_NCLR, pokepicManager->heapId);
                NNS_G2dGetUnpackedPaletteData(nclrFile, &plttData);
                src = plttData->pRawData;
                for (j = 0; j < 16; ++j) {
                    pokepicManager->plttRawData[j + 16 * (3 + pokepicManager->pics[i].shadow.palSlot)] = src[j];
                    pokepicManager->plttRawDataUnfaded[j + 16 * (3 + pokepicManager->pics[i].shadow.palSlot)] = src[j];
                }
                FreeToHeap(nclrFile);
            }
        }
        if (pokepicManager->pics[i].active && pokepicManager->pics[i].drawParam.fadeActive) {
            if (pokepicManager->pics[i].drawParam.fadeDelayCounter == 0) {
                needPlttUpdate = TRUE;
                pokepicManager->pics[i].drawParam.fadeDelayCounter = pokepicManager->pics[i].drawParam.fadeDelayLength;
                BlendPalette(pokepicManager->plttRawDataUnfaded + 16 * i, pokepicManager->plttRawData + 16 * i, 16, pokepicManager->pics[i].drawParam.fadeCur, pokepicManager->pics[i].drawParam.fadeTargetColor);
                if (pokepicManager->pics[i].shadow.palSlot != 0) {
                    BlendPalette(pokepicManager->plttRawDataUnfaded + 16 * (3 + pokepicManager->pics[i].shadow.palSlot), pokepicManager->plttRawData + 16 * (3 + pokepicManager->pics[i].shadow.palSlot), 16, pokepicManager->pics[i].drawParam.fadeCur, pokepicManager->pics[i].drawParam.fadeTargetColor);
                }
                if (pokepicManager->pics[i].drawParam.fadeCur == pokepicManager->pics[i].drawParam.fadeEnd) {
                    pokepicManager->pics[i].drawParam.fadeActive = FALSE;
                } else if (pokepicManager->pics[i].drawParam.fadeCur > pokepicManager->pics[i].drawParam.fadeEnd) {
                    --pokepicManager->pics[i].drawParam.fadeCur;
                } else {
                    ++pokepicManager->pics[i].drawParam.fadeCur;
                }
            } else {
                --pokepicManager->pics[i].drawParam.fadeDelayCounter;
            }
        }
    }
    pokepicManager->needLoadPltt = needPlttUpdate;
}

static u8 swapNybbles(u8 val) {
    u8 ret = (val & 0xF0) >> 4;
    ret |= (val & 0x0F) << 4;
    return ret;
}

static void Pokepic_MaybeAddSpindaSpots(Pokepic *pokepic, u8 *charData) {
    if (pokepic->template.species != SPECIES_NONE) {
        RawChardata_PlaceSpindaSpots(charData, pokepic->template.personality, TRUE);
    }
}

void RawChardata_PlaceSpindaSpots(u8 *pRawData, u32 pid, BOOL isAnimated) {
    const u8 (*spotCoords)[2];
    int i;
    u8 x;
    u8 y;
    u8 j;
    int destOffset;
    u32 lr = pid;
    for (i = 0; i < 4; ++i) {
        spotCoords = sSpindaSpotsCoordsPtrs[i];
        j = 0;
        while (spotCoords[j][0] != 0xFF) {
            x = spotCoords[j][0] + ((pid & 0x0F) - 8);
            y = spotCoords[j][1] + (((pid & 0xF0) >> 4) - 8);
            destOffset = x / 2 + y * 80;
            if (x & 1) {
                if ((pRawData[destOffset] & 0xF0) >= 0x10 && (pRawData[destOffset] & 0xF0) <= 0x30) {
                    pRawData[destOffset] += 0x50;
                }
            } else {
                if ((pRawData[destOffset] & 0x0F) >= 0x01 && (pRawData[destOffset] & 0x0F) <= 0x03) {
                    pRawData[destOffset] += 0x05;
                }
            }
            ++j;
        }
        pid >>= 8;
    }
    pid = lr;
    if (isAnimated) {
        for (i = 0; i < 4; ++i) {
            spotCoords = sSpindaSpotsCoordsPtrs[i];
            j = 0;
            while (spotCoords[j][0] != 0xFF) {
                x = (spotCoords[j][0] - 14) + ((pid & 0x0F) - 8) + 80;
                y = spotCoords[j][1] + (((pid & 0xF0) >> 4) - 8);
                destOffset = x / 2 + y * 80;
                if (x & 1) {
                    if ((pRawData[destOffset] & 0xF0) >= 0x10 && (pRawData[destOffset] & 0xF0) <= 0x30) {
                        pRawData[destOffset] += 0x50;
                    }
                } else {
                    if ((pRawData[destOffset] & 0x0F) >= 0x01 && (pRawData[destOffset] & 0x0F) <= 0x03) {
                        pRawData[destOffset] += 0x05;
                    }
                }
                ++j;
            }
            pid >>= 8;
        }
    }
}

static u16 lcrngUpdate(u32 *p) {
    *p = *p * 1103515245 + 24691;
    return *p / 65536;
}

static void UnscanPokepic_PtHGSS(u8 *pRawCharData) {
    int i;
    u16 *pCharData_asU16 = (u16 *)pRawCharData;
    u32 seed = *pCharData_asU16;
    for (i = 0; i < 3200; ++i) {
        pCharData_asU16[i] ^= seed;
        lcrngUpdate(&seed);
    }
}

static void UnscanPokepic_DP(u8 *pRawCharData) {
    int i;
    u16 *pCharData_asU16 = (u16 *)pRawCharData;
    u32 seed = pCharData_asU16[3199];
    for (i = 3199; i > -1; --i) {
        pCharData_asU16[i] ^= seed;
        lcrngUpdate(&seed);
    }
}

void UnscanPokepic(u8 *pRawData, NarcId narcId) {
    if (narcId == NARC_pbr_pokegra || narcId == NARC_pbr_otherpoke || narcId == NARC_a_0_5_8 || narcId == NARC_a_0_0_6) {
        UnscanPokepic_DP(pRawData);
    } else {
        UnscanPokepic_PtHGSS(pRawData);
    }
}
