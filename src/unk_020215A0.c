#include "global.h"
#include "unk_020215A0.h"
#include "vram_transfer_manager.h"

typedef struct UnkStruct_021D21F4_sub {
    NNSG2dCharacterData *unk_00;
    u32 unk_04;  // flag
    u8 filler_08[4];
    int unk_0C;
    NNSG2dImageProxy unk_10;
    u32 unk_34;
    u32 unk_38;
    u8 unk_3C;
    int unk_40;
    u8 filler_44[16];
} UnkStruct_021D21F4_sub;  // size: 84

typedef struct UnkStruct_021D21F4_sub2 {
    u8 unk_00[8];
} UnkStruct_021D21F4_sub2;

struct UnkStruct_021D21F4 {
    UnkStruct_021D21F4_sub *unk_00;
    int unk_04;
    int unk_08;
    int unk_0C;
    int unk_10;
    u8 filler_14[8];
    int unk_1C;
    int unk_20;
    int unk_24;
    int unk_28;
    u32 unk_2C;
    u32 unk_30;
    UnkStruct_021D21F4_sub2 *unk_34;
    UnkStruct_021D21F4_sub2 *unk_38;
} *_021D21F4;

BOOL sub_0202180C(int resId);
void sub_020218D4(void);
void sub_02021C08(UnkStruct_021D21F4_sub *a0);
BOOL sub_02021C2C(const UnkStruct_02021758 *a0, UnkStruct_021D21F4_sub *a1);
BOOL sub_02021C9C(UnkStruct_021D21F4_sub *a0);
void sub_02021D58(UnkStruct_021D21F4_sub *a0);
UnkStruct_021D21F4_sub *sub_02021D70(int resId);
void sub_02021EC0(int a0, int a1, int a2, int a3, int a4);
UnkStruct_021D21F4_sub *sub_02022024(void);
void sub_02022060(void);
void sub_020221D0(int a0, int a1, int HeapID);
void sub_02022238(UnkStruct_021D21F4_sub2 *a0);
void sub_02022278(UnkStruct_021D21F4_sub2 *a0);
int sub_02022448(GXOBJVRamModeChar mode);
int sub_020224A8(int a0, int a1);
void sub_0202256C(int a0, int a1, int a2, int *a3, int *a4);

void sub_020215A0(UnkStruct_020215A0 *template) {
    sub_020215C0(template, GX_GetOBJVRamModeChar(), GXS_GetOBJVRamModeChar());
}

void sub_020215C0(UnkStruct_020215A0 *template, GXOBJVRamModeChar modeMain, GXOBJVRamModeChar modeSub) {
    if (_021D21F4 == NULL) {
        _021D21F4 = AllocFromHeap(template->heapId, sizeof(struct UnkStruct_021D21F4));
        MI_CpuClear32(_021D21F4, sizeof(struct UnkStruct_021D21F4));
        _021D21F4->unk_04 = template->unk_00;
        _021D21F4->unk_00 = (UnkStruct_021D21F4_sub *)AllocFromHeap(template->heapId, sizeof(UnkStruct_021D21F4_sub) * _021D21F4->unk_04);
        for (int i = 0; i < template->unk_00; ++i) {
            sub_02021C08(&_021D21F4->unk_00[i]);
        }
        _021D21F4->unk_2C = sub_02022448(modeMain);
        _021D21F4->unk_30 = sub_02022448(modeSub);
        GX_SetOBJVRamModeChar(modeMain);
        GXS_SetOBJVRamModeChar(modeSub);
        int r4 = sub_020224A8(template->unk_04, _021D21F4->unk_2C);
        int r0 = sub_020224A8(template->unk_08, _021D21F4->unk_30);
        sub_020221D0(r4, r0, template->heapId);
    }
}

void sub_0202168C(void) {
    if (_021D21F4 != NULL) {
        sub_02022238(_021D21F4->unk_34);
        sub_02022238(_021D21F4->unk_38);
        sub_020218D4();
        FreeToHeap(_021D21F4->unk_00);
        FreeToHeap(_021D21F4);
        _021D21F4 = NULL;
    }
}

void sub_020216C8(void) {
    _021D21F4->unk_0C = 0;
    _021D21F4->unk_10 = 0;
    sub_02022278(_021D21F4->unk_34);
    sub_02022278(_021D21F4->unk_38);
    sub_02022060();
}

void sub_020216F4(u32 a0, u32 a1, u32 a2) {
    int sp8;
    int sp4;
    if (a2 == 1) {
        sub_0202256C(_021D21F4->unk_1C, a0, a1, &sp8, &sp4);
        if (sp4 > 0) {
            sub_02021EC0(1, sp8, 0, sp4, 0);
        }
    } else {
        sub_0202256C(_021D21F4->unk_20, a0, a1, &sp8, &sp4);
        if (sp4 > 0) {
            sub_02021EC0(2, 0, sp8, 0, sp4);
        }
    }
}

BOOL sub_02021758(const UnkStruct_02021758 *a0) {
    GF_ASSERT(sub_0202180C(a0->id) != 1);
    UnkStruct_021D21F4_sub *sub = sub_02022024();
    if (sub == NULL) {
        GF_ASSERT(FALSE);
        return FALSE;
    }
    if (!sub_02021C2C(a0, sub)) {
        return FALSE;
    }
    if (!sub_02021C9C(sub)) {
        sub_02021884(sub->unk_0C);
        return FALSE;
    }
    ++_021D21F4->unk_08;
    return TRUE;
}

BOOL sub_020217B0(const UnkStruct_02021758 *a0) {
    GF_ASSERT(sub_0202180C(a0->id) != 1);
    UnkStruct_021D21F4_sub *sub = sub_02022024();
    if (sub == NULL) {
        GF_ASSERT(FALSE);
        return FALSE;
    }
    if (!sub_02021C2C(a0, sub)) {
        return FALSE;
    }
    sub->unk_40 = 1;
    if (!sub_02021C9C(sub)) {
        sub_02021884(sub->unk_0C);
        return FALSE;
    }
    ++_021D21F4->unk_08;
    return TRUE;
}

BOOL sub_0202180C(int resId) {
    for (int i = 0; i < _021D21F4->unk_04; ++i) {
        if (resId == _021D21F4->unk_00[i].unk_0C) {
            return TRUE;
        }
    }

    return FALSE;
}

void sub_0202183C(int id, NNSG2dCharacterData *charData) {
    GF_ASSERT(charData != NULL);
    UnkStruct_021D21F4_sub *sub = sub_02021D70(id);
    GF_ASSERT(sub != NULL);
    sub->unk_00 = charData;
    if (sub->unk_04 & 1) {
        GF_CreateNewVramTransferTask(NNS_GFD_DST_2D_OBJ_CHAR_MAIN, sub->unk_34, charData->pRawData, charData->szByte);
    }
    if (sub->unk_04 & 2) {
        GF_CreateNewVramTransferTask(NNS_GFD_DST_2D_OBJ_CHAR_SUB, sub->unk_38, charData->pRawData, charData->szByte);
    }
}

void sub_02021884(int resId) {
    UnkStruct_021D21F4_sub *sub;
    BOOL r5 = TRUE;
    do {
        sub = sub_02021D70(resId);
        GF_ASSERT(sub != NULL);
        if (sub->unk_3C == 4) {
            sub_02021A50(&sub->unk_10);
        } else {
            r5 = FALSE;
        }
    } while (r5);
    if (sub->unk_3C != 0) {
        sub_02021D58(sub);
        --_021D21F4->unk_08;
    }
}

void sub_020218D4(void) {
    for (int i = 0; i < _021D21F4->unk_04; ++i) {
        if (_021D21F4->unk_00[i].unk_3C != 0) {
            sub_02021D58(&_021D21F4->unk_00[i]);
            --_021D21F4->unk_08;
        }
    }
}

NNSG2dImageProxy *sub_02021910(int resId) {
    UnkStruct_021D21F4_sub *sub = sub_02021D70(resId);
    GF_ASSERT(sub != NULL);
    if (sub->unk_3C == 0) {
        return NULL;
    }

    return &sub->unk_10;
}
