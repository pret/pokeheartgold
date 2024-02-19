#include "global.h"
#include "unk_020215A0.h"
#include "vram_transfer_manager.h"

typedef struct UnkStruct_021D21F4_sub2 {
    u8 unk_00[8];
} UnkStruct_021D21F4_sub2;

typedef struct UnkStruct_021D21F4_sub {
    NNSG2dCharacterData *unk_00;
    u32 unk_04;  // flag
    u8 unk_08;
    int unk_0C;
    NNSG2dImageProxy unk_10;
    u32 unk_34;
    u32 unk_38;
    u8 unk_3C;
    int unk_40;
    BOOL unk_44;
    int unk_48;
    int unk_4C;
    int unk_50;
} UnkStruct_021D21F4_sub;

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
UnkStruct_021D21F4_sub *sub_02021C50(const NNSG2dImageProxy *proxyIn);
BOOL sub_02021CCC(UnkStruct_021D21F4_sub *a0);
BOOL sub_02021D00(UnkStruct_021D21F4_sub *a0);
void sub_02021D58(UnkStruct_021D21F4_sub *a0);
UnkStruct_021D21F4_sub *sub_02021D70(int resId);
BOOL sub_02021DE4(int a0, int *a1, int *a2, u32 a3, int *a4, int *a5);
void sub_02021E90(UnkStruct_021D21F4_sub *a0, int a1, int a2);
void sub_02021EC0(int a0, int a1, int a2, int a3, int a4);
void sub_02021FB0(UnkStruct_021D21F4_sub *a0);
UnkStruct_021D21F4_sub *sub_02022024(void);
void sub_02022060(void);
void sub_020221D0(int a0, int a1, int HeapID);
void sub_02022238(UnkStruct_021D21F4_sub2 *a0);
void sub_02022278(UnkStruct_021D21F4_sub2 *a0);
void sub_020223C4(UnkStruct_021D21F4_sub *a0);
int sub_02022448(GXOBJVRamModeChar mode);
int sub_020224A8(int a0, int a1);
BOOL sub_020224C0(u32 size, int a1, int *a2, int *a3);
void sub_02022510(u32 size, int a1);
void sub_0202256C(int a0, int a1, int a2, int *a3, int *a4);
void sub_02022374(int a0, int a1, UnkStruct_021D21F4_sub2 *a2);

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

NNSG2dImageProxy *sub_02021934(int resId, u32 size) {
    UnkStruct_021D21F4_sub *sub = sub_02021D70(resId);
    GF_ASSERT(sub != NULL);
    if (sub->unk_3C == 0) {
        return NULL;
    }
    int sp14;
    int sp10;
    int spC;
    int sp8;
    sub_02021DE4(sub->unk_04, &sp14, &sp10, size, &spC, &sp8);
    if (sub->unk_3C == 3) {
        return NULL;
    }
    sub->unk_3C = 3;
    sub_02021E90(sub, sp14, sp10);
    sub->unk_48 = 1;
    sub->unk_4C = spC;
    sub->unk_50 = sp8;
    sub_02021FB0(sub);
    sub_02021EC0(sub->unk_04, sp14, sp10, spC, sp8);

    return &sub->unk_10;
}

NNSG2dImageProxy *sub_020219B8(NNSG2dImageProxy *proxyIn) {
    UnkStruct_021D21F4_sub *sub = sub_02021C50(proxyIn);
    GF_ASSERT(sub != NULL);
    UnkStruct_021D21F4_sub *sub2 = sub_02022024();
    GF_ASSERT(sub2 != NULL);
    if (sub->unk_3C != 3) {
        return NULL;
    }
    *sub2 = *sub;
    sub2->unk_3C = 4;
    int sp14;
    int sp10;
    int spC;
    int sp8;
    sub_02021DE4(sub2->unk_04, &sp14, &sp10, (sub2->unk_04 & 1 ? sub2->unk_4C : sub2->unk_50), &spC, &sp8);
    sub_02021E90(sub2, sp14, sp10);
    sub2->unk_48 = 1;
    sub2->unk_4C = spC;
    sub2->unk_50 = sp8;
    sub_02021FB0(sub2);
    sub_02021EC0(sub2->unk_04, sp14, sp10, spC, sp8);

    return &sub2->unk_10;
}

void sub_02021A50(const NNSG2dImageProxy *proxy) {
    int i;
    for (i = 0; i < _021D21F4->unk_04; ++i) {
        if ((_021D21F4->unk_00[i].unk_3C == 3 || _021D21F4->unk_00[i].unk_3C == 4) && &_021D21F4->unk_00[i].unk_10 == proxy)  {
            break;
        }
    }
    if (i < _021D21F4->unk_04) {
        sub_020223C4(&_021D21F4->unk_00[i]);
        if (_021D21F4->unk_00[i].unk_3C == 3) {
            _021D21F4->unk_00[i].unk_3C = 2;
        } else {
            _021D21F4->unk_00[i].unk_3C = 0;
            sub_02021C08(&_021D21F4->unk_00[i]);
        }
    }
}

BOOL sub_02021AC8(u32 a0, int a1, int a2, UnkStruct_02021AC8 *a3) {
    int sp14;
    int sp10;
    int spC;
    int sp8;
    BOOL ret;

    if (a1 == 0) {
        ret = sub_020224C0(a0, a2, &sp14, &sp10);
        if (ret) {
            sub_02022510(a0, a2);
            a3->unk_08 = a2;
            a3->unk_00 = a0;
            a3->unk_04 = a2 == 1 ? sp14 : sp10;
            a3->unk_0A = 0;
        }
    } else {
        ret = sub_02021DE4(a2, &sp14, &sp10, a0, &spC, &sp8);
        if (ret) {
            sub_02021EC0(a2, sp14, sp10, spC, sp8);
            a3->unk_08 = a2;
            if (a2 == 1) {
                a3->unk_00 = spC;
                a3->unk_04 = sp14 + _021D21F4->unk_1C;
            } else {
                a3->unk_00 = sp8;
                a3->unk_04 = sp10 + _021D21F4->unk_20;
            }
            a3->unk_0A = 1;
        }
    }
    return ret;
}

void sub_02021B5C(UnkStruct_02021AC8 *a0) {
    if (a0->unk_0A != 0) {
        if (a0->unk_08 & 1) {
            int r5 = sub_020224A8(a0->unk_00, _021D21F4->unk_2C);
            int r0 = sub_020224A8(a0->unk_04 - _021D21F4->unk_1C, _021D21F4->unk_2C);
            sub_02022374(r0, r5, _021D21F4->unk_34);
        }
        if (a0->unk_08 & 2) {
            int r5 = sub_020224A8(a0->unk_00, _021D21F4->unk_30);
            int r0 = sub_020224A8(a0->unk_04 - _021D21F4->unk_20, _021D21F4->unk_30);
            sub_02022374(r0, r5, _021D21F4->unk_38);
        }
    }
}

UnkStruct_021D21F4 *sub_02021BD0(void) {
    GF_ASSERT(_021D21F4 != NULL);
    UnkStruct_021D21F4 *ret = _021D21F4;
    _021D21F4 = NULL;
    return ret;
}

void sub_02021BEC(UnkStruct_021D21F4 *a0) {
    GF_ASSERT(_021D21F4 == NULL);
    _021D21F4 = a0;
}

void sub_02021C08(UnkStruct_021D21F4_sub *a0) {
    a0->unk_00 = NULL;
    a0->unk_04 = 0;
    a0->unk_08 = 0;
    a0->unk_0C = -1;
    a0->unk_34 = 0;
    a0->unk_38 = 0;
    a0->unk_3C = 0;
    a0->unk_40 = 0;
    NNS_G2dInitImageProxy(&a0->unk_10);
}

BOOL sub_02021C2C(const UnkStruct_02021758 *a0, UnkStruct_021D21F4_sub *a1) {
    a1->unk_00 = a0->charData;
    a1->unk_0C = a0->id;
    a1->unk_04 = a0->dest;
    a1->unk_08 = a1->unk_00->characterFmt >> 8;
    a1->unk_44 = a0->unk_0C;
    a1->unk_48 = 0;
    a1->unk_4C = 0;
    a1->unk_50 = 0;
    return TRUE;
}

UnkStruct_021D21F4_sub *sub_02021C50(const NNSG2dImageProxy *proxyIn) {
    int i;

    for (i = 0; i < _021D21F4->unk_04; ++i) {
        if (_021D21F4->unk_00[i].unk_3C != 0 && &_021D21F4->unk_00[i].unk_10 == proxyIn) {
            break;
        }
    }
    if (i >= _021D21F4->unk_04) {
        return NULL;
    }

    return &_021D21F4->unk_00[i];
}

BOOL sub_02021C9C(UnkStruct_021D21F4_sub *a0) {
    BOOL ret = TRUE;
    if (a0->unk_08 != 0) {
        a0->unk_3C = 2;
    } else {
        a0->unk_3C = 1;
        if (a0->unk_44 == 0) {
            ret = sub_02021CCC(a0);
        } else {
            ret = sub_02021D00(a0);
        }
    }
    return ret;
}
