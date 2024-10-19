#include "unk_02018424.h"

#include "global.h"

#include "constants/sndseq.h"

#include "gf_gfx_loader.h"

UnkStruct_020185FC *sub_02018498(UnkStruct_02018424 *a0, Ov122_021E7488 *a1, u8 a2, u8 a3, u8 a4, u8 a5, u8 a6, UnkFunc_020185FC a7, void *a8, BOOL a9, int a10);
u8 sub_0201881C(LISTMENUITEM *listMenuItem, u8 a1, int a2, int a3);
void sub_02018890(UnkStruct_020185FC *a0);
void sub_02018744(UnkStruct_02018424 *a0, Ov122_021E7488 *a1, int a2, int a3);
void sub_020189AC(UnkStruct_020185FC *a0);
void sub_02018C90(UnkStruct_020185FC *a0);
void sub_02018DF4(UnkStruct_020185FC *a0, int a1);
void sub_02018FE8(UnkStruct_020185FC *a0, int a1);
void sub_02018FFC(UnkStruct_020185FC *a0, int a1);

UnkStruct_02018424 *sub_02018424(HeapID heapId, int a1) {
    UnkStruct_02018424 *ret = AllocFromHeap(heapId, sizeof(UnkStruct_02018424));
    MI_CpuClear8(ret, sizeof(UnkStruct_02018424));
    ret->heapId      = heapId;
    ret->charDataRaw = GfGfxLoader_LoadFromNarc(NARC_a_1_6_5, 1, FALSE, heapId, FALSE);
    NNS_G2dGetUnpackedBGCharacterData(ret->charDataRaw, &ret->pCharData);
    ret->plttDataRaw = GfGfxLoader_LoadFromNarc(NARC_a_1_6_5, 0, FALSE, heapId, FALSE);
    NNS_G2dGetUnpackedPaletteData(ret->plttDataRaw, &ret->pPlttData);
    ret->unk_14 = a1;
    return ret;
}

void sub_02018474(UnkStruct_02018424 *a0) {
    FreeToHeap(a0->plttDataRaw);
    FreeToHeap(a0->charDataRaw);
    MI_CpuFill8(a0, 0, sizeof(UnkStruct_02018424));
    FreeToHeap(a0);
}

UnkStruct_020185FC *sub_02018498(UnkStruct_02018424 *a0, Ov122_021E7488 *a1, u8 a2, u8 a3, u8 a4, u8 a5, u8 a6, UnkFunc_020185FC a7, void *a8, BOOL a9, int a10) {
    UnkStruct_020185FC *ret = AllocFromHeap(a0->heapId, sizeof(UnkStruct_020185FC));
    MI_CpuClear8(ret, sizeof(UnkStruct_020185FC));
    MI_CpuCopy8(a1, &ret->unk_04, sizeof(Ov122_021E7488));
    ret->unk_00 = a0;
    if (a6 < ret->unk_04.unk14) {
        ret->unk_24 = a6;
    }
    ret->unk_25   = 0;
    ret->unk_2C   = a0->heapId;
    ret->unk_29   = a4;
    ret->unk_24   = a6;
    ret->unk_27_1 = a2;
    ret->unk_30   = a7;
    ret->unk_34   = a8;
    ret->unk_27_0 = a9;
    if (a5 == 0) {
        ret->unk_26 = sub_0201881C(a1->unkC, ret->unk_04.unk14, 4, ret->unk_04.unk0.unk1);
    } else {
        ret->unk_26 = a5;
    }
    switch (a10) {
    default:
        GF_ASSERT(FALSE);
    case 0:
        ret->unk_28 = a3;
        break;
    case 1:
        ret->unk_26 = (ret->unk_26 + 1) & ~1;
        if (a3 - (ret->unk_26 + 2) / 2 < 0) {
            ret->unk_28 = 0;
        } else {
            ret->unk_28 = a3 - (ret->unk_26 + 2) / 2;
        }
        break;
    case 2:
        if (a3 - (ret->unk_26 + 2) < 0) {
            ret->unk_28 = 0;
        } else {
            ret->unk_28 = a3 - (ret->unk_26 + 2);
        }
        break;
    }
    sub_02018890(ret);
    sub_02018744(a0, &ret->unk_04, ret->unk_00->unk_14, ret->unk_2C);
    sub_020189AC(ret);
    sub_02018C90(ret);
    sub_02018DF4(ret, ret->unk_24);
    sub_02018FE8(ret, SEQ_SE_DP_SELECT);
    sub_02018FFC(ret, 0);
    return ret;
}

UnkStruct_020185FC *sub_020185FC(UnkStruct_02018424 *a0, Ov122_021E7488 *a1, u8 a2, u8 a3, u8 a4, u8 a5, u8 a6) {
    return sub_02018498(a0, a1, a2, a3, a4, a5, a6, NULL, NULL, FALSE, 0);
}

UnkStruct_020185FC *sub_02018620(UnkStruct_02018424 *a0, Ov122_021E7488 *a1, u8 a2, u8 a3, u8 a4, u8 a5, u8 a6, int a7) {
    return sub_02018498(a0, a1, a2, a3, a4, a5, a6, NULL, NULL, FALSE, a7);
}

UnkStruct_020185FC *sub_02018648(UnkStruct_02018424 *a0, Ov122_021E7488 *a1, u8 a2, u8 a3, u8 a4, u8 a5, u8 a6, UnkFunc_020185FC a7, void *a8, BOOL a9) {
    return sub_02018498(a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, 0);
}
