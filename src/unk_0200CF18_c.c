#include "assert.h"
#include "global.h"
#include "heap.h"
#include "gf_gfx_loader.h"
#include "unk_02009D48.h"
#include "unk_020215A0.h"
#include "unk_02022588.h"
#include "unk_0200B150.h"
#include "unk_0200CF18.h"
#include "unk_0200ACF0.h"
#include "unk_02020654.h"
#include "unk_02023694.h"

void sub_0200D044(UnkStruct_0200CF38* a0);
void sub_0200D050(UnkStruct_0200CF38* a0);
void sub_0200D060(UnkStruct_0200CF38* a0);
void sub_0200D0B4(UnkStruct_0200CF18* a0);
void sub_0200D0D4(UnkStruct_0200CF18* a0, UnkStruct_0200CF38* a1);
BOOL sub_0200D124(UnkStruct_0200CF18* a0, UnkStruct_0200CF38* a1, u16* a2, int a3, int a4, int a5);

UnkStruct_0200CF18* sub_0200CF18(HeapID heapId) {
    UnkStruct_0200CF18* ret = AllocFromHeap(heapId, sizeof(UnkStruct_0200CF18));
    if (ret == NULL) {
        return NULL;
    }
    ret->heapId = heapId;
    ret->unk_004 = 0;
    ret->unk_008 = TRUE;
    return ret;
}

UnkStruct_0200CF38* sub_0200CF38(UnkStruct_0200CF18* a0) {
    GF_ASSERT(a0 != NULL);
    UnkStruct_0200CF38* ret = AllocFromHeap(a0->heapId, sizeof(UnkStruct_0200CF38));
    if (ret == NULL) {
        return NULL;
    }
    ++a0->unk_004;
    for (int i = 0; i < 6; ++i) {
        ret->unk_0C[i] = NULL;
    }
    return ret;
}

GF_G2dRenderer* sub_0200CF6C(UnkStruct_0200CF18* a0) {
    return &a0->renderer;
}

BOOL sub_0200CF70(UnkStruct_0200CF18* a0, Unk122_021E92FC* a1, Unk122_021E92D0* a2, int a3) {
    GF_ASSERT(a0 != NULL);
    if (a0 == NULL) {
        return FALSE;
    }
    struct UnkStruct_020215A0 sp14;
    sp14.unk_00 = a2->unk0;
    sp14.unk_04 = a2->unk4;
    sp14.unk_08 = a2->unk8;
    sp14.heapId = a0->heapId;
    sub_020215C0(&sp14, a2->unkC, a2->unk10);
    sub_02022588(a3, a0->heapId);
    NNS_G2dInitOamManagerModule();
    if (a0->unk_008 == TRUE) {
        OamManager_Create(a1->unk0, a1->unk4, a1->unk8, a1->unkC, a1->unk10, a1->unk14, a1->unk18, a1->unk1C, a0->heapId);
    }
    a0->cellTransferState = sub_02020654(0x20, a0->heapId);
    sub_020216C8();
    sub_02022638();
    return TRUE;
}

BOOL sub_0200CFF4(UnkStruct_0200CF18* a0, UnkStruct_0200CF38* a1, int a2) {
    if (a0 == NULL || a1 == NULL) {
        return FALSE;
    }
    a1->spriteList = G2dRenderer_Init(a2, &a0->renderer, a0->heapId);
    return TRUE;
}

void sub_0200D018(Sprite* sprite) {
    Sprite_Delete(sprite);
}

void sub_0200D020(UnkStruct_0200CF38* a0) {
    GF_ASSERT(a0 != NULL);
    sub_0202457C(a0->spriteList);
}

void sub_0200D034(void) {
    OamManager_ApplyAndResetBuffers();
}

void sub_0200D03C(void) {
    sub_02020674();
}

void sub_0200D044(UnkStruct_0200CF38* a0) {
    sub_02024504(a0->spriteList);
}

void sub_0200D050(UnkStruct_0200CF38* a0) {
    if (a0->unk_04 != NULL) {
        sub_02009F24(a0->unk_04);
    }
}

void sub_0200D060(UnkStruct_0200CF38* a0) {
    for (int i = 0; i < a0->unk_54; ++i) {
        sub_0200A954(sub_0200A900(a0->unk_08, i));
    }
    FreeToHeap(a0->unk_08);
    sub_0200AED4(a0->unk_24[0]);
    sub_0200B0CC(a0->unk_24[1]);
    for (int i = 0; i < a0->unk_54; ++i) {
        Delete2DGfxResObjList(a0->unk_24[i]);
        Destroy2DGfxResObjMan(a0->unk_0C[i]);
    }
}

void sub_0200D0B4(UnkStruct_0200CF18* a0) {
    sub_0202067C(a0->cellTransferState);
    sub_0202168C();
    sub_02022608();
    if (a0->unk_008 == TRUE) {
        OamManager_Free();
    }
}

void sub_0200D0D4(UnkStruct_0200CF18* a0, UnkStruct_0200CF38* a1) {
    --a0->unk_004;
    FreeToHeap(a1);
}

void sub_0200D0E4(UnkStruct_0200CF18* a0, UnkStruct_0200CF38* a1) {
    sub_0200D044(a1);
    sub_0200D050(a1);
    sub_0200D060(a1);
    sub_0200D0D4(a0, a1);
}

void sub_0200D108(UnkStruct_0200CF18* a0) {
    GF_ASSERT(a0->unk_004 == 0);
    sub_0200D0B4(a0);
    FreeToHeap(a0);
}

BOOL sub_0200D124(UnkStruct_0200CF18* a0, UnkStruct_0200CF38* a1, u16* a2, int a3, int a4, int a5) {
    int i;
    int r7;
    int size;
    struct _2DGfxResHeader* header;
    void* data;
    NARC* narc;

    r7 = 6;
    
    if (a0 == NULL || a1 == NULL) {
        return FALSE;
    }
    if (a2[4] == 0xFFFF) {
        r7 = 4;
    }
    a1->unk_54 = r7;
    size = sub_0200A8FC();
    a1->unk_08 = AllocFromHeap(a0->heapId, size * r7);
    narc = NARC_New(NARC_a_1_7_5, a0->heapId);

    for (i = 0; i < r7; ++i) {
        header = sub_0200A900(a1->unk_08, i);
        data = GfGfxLoader_LoadFromOpenNarc(narc, a2[i], FALSE, a0->heapId, TRUE);
        sub_0200A908(data, header, a0->heapId);
        FreeToHeap(data);
    }
    for (i = 0; i < r7; ++i) {
        header = sub_0200A900(a1->unk_08, i);
        size = sub_0200A96C(header);
        a1->unk_0C[i] = Create2DGfxResObjMan(size, (GfGfxResType)i, a0->heapId);
    }
    for (i = 0; i < r7; ++i) {
        header = sub_0200A900(a1->unk_08, i);
        size = sub_0200A96C(header);
        a1->unk_24[i] = Create2DGfxResObjList(size, a0->heapId);
        a1->unk_3C[i] = LoadAll2DGfxResObjsFromHeader(a1->unk_0C[i], header, a1->unk_24[i], a0->heapId);
    }
    switch (a3) {
    case 0:
        sub_0200ADE4(a1->unk_24[0]);
        break;
    case 1:
        sub_0200AE58(a1->unk_24[0]);
        break;
    case 2:
    default:
        sub_0200AD30(a1->unk_24[0]);
        break;
    }
    switch (a4) {
    case 0:
        sub_0200B050(a1->unk_24[1]);
        break;
    case 1:
    default:
        sub_0200AFD8(a1->unk_24[1]);
        break;
    }
    data = GfGfxLoader_LoadFromOpenNarc(narc, a2[6], FALSE, a0->heapId, TRUE);
    a1->unk_04 = sub_02009E84(data, a0->heapId, a1->unk_0C[0], a1->unk_0C[1], a1->unk_0C[2], a1->unk_0C[3], a1->unk_0C[4], a1->unk_0C[5]);
    FreeToHeap(data);
    NARC_Delete(narc);
    return TRUE;
}
