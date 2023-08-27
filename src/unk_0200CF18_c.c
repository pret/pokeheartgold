#include "assert.h"
#include "global.h"
#include "heap.h"
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
