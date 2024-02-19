#include "global.h"
#include "unk_020215A0.h"
#include "vram_transfer_manager.h"

typedef struct UnkStruct_021D21F4_sub {
    NNSG2dCharacterData *unk_00;
    NNS_G2D_VRAM_TYPE unk_04;
    u8 unk_08;
    int unk_0C;
    NNSG2dImageProxy unk_10;
    u32 unk_34;
    u32 unk_38;
    u8 unk_3C;
    int unk_40;
    BOOL unk_44;
    int unk_48;
    u32 unk_4C;
    u32 unk_50;
} UnkStruct_021D21F4_sub;

struct UnkStruct_021D21F4 {
    UnkStruct_021D21F4_sub *unk_00;
    int unk_04;
    int unk_08;
    int unk_0C;
    int unk_10;
    u8 filler_14[8];
    u32 unk_1C;
    u32 unk_20;
    int unk_24;
    int unk_28;
    u32 unk_2C;
    u32 unk_30;
    u32 unk_34;
    u32 unk_38;
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
GXOBJVRamModeChar sub_02021DA8(UnkStruct_021D21F4_sub *a0, int a1);
void sub_02021DD0(UnkStruct_021D21F4_sub *a0, int a1, int a2);
BOOL sub_02021DE4(int a0, u32 *a1, u32 *a2, u32 a3, u32 *a4, u32 *a5);  // a0 should be NNS_G2D_VRAM_TYPE but needs to be int in order to match
void sub_02021E90(UnkStruct_021D21F4_sub *a0, u32 a1, u32 a2);
void sub_02021EC0(NNS_G2D_VRAM_TYPE a0, u32 a1, u32 a2, u32 a3, u32 a4);
void sub_02021F28(UnkStruct_021D21F4_sub *a0);
void sub_02021F54(UnkStruct_021D21F4_sub *a0, NNS_G2D_VRAM_TYPE a1);
void sub_02021FB0(UnkStruct_021D21F4_sub *a0);
UnkStruct_021D21F4_sub *sub_02022024(void);
void sub_02022060(void);
void sub_020221D0(int a0, int a1, int HeapID);
void sub_02022238(u32 a0);
void sub_02022278(u32 a0);
void sub_02022290(int a0, int a1, int a2);
int sub_020222EC(int a0, u32 a1);
void sub_020223C4(UnkStruct_021D21F4_sub *a0);
int sub_02022448(GXOBJVRamModeChar mode);
int sub_020224B8(int a0, int a1);
int sub_020224A8(int a0, int a1);
BOOL sub_020224C0(u32 size, NNS_G2D_VRAM_TYPE a1, u32 *a2, u32 *a3);
void sub_02022510(u32 size, int a1);
void sub_0202256C(int a0, int a1, int a2, int *a3, int *a4);
void sub_02022374(int a0, int a1, u32 a2);
int sub_02022488(u32 a0, int a1, int a2);

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
            sub_02021EC0(NNS_G2D_VRAM_TYPE_2DMAIN, sp8, 0, sp4, 0);
        }
    } else {
        sub_0202256C(_021D21F4->unk_20, a0, a1, &sp8, &sp4);
        if (sp4 > 0) {
            sub_02021EC0(NNS_G2D_VRAM_TYPE_2DSUB, 0, sp8, 0, sp4);
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
    if (sub->unk_04 & NNS_G2D_VRAM_TYPE_2DMAIN) {
        GF_CreateNewVramTransferTask(NNS_GFD_DST_2D_OBJ_CHAR_MAIN, sub->unk_34, charData->pRawData, charData->szByte);
    }
    if (sub->unk_04 & NNS_G2D_VRAM_TYPE_2DSUB) {
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
    u32 sp14;
    u32 sp10;
    u32 spC;
    u32 sp8;
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
    UnkStruct_021D21F4_sub *sub;
    UnkStruct_021D21F4_sub *sub2;
    u32 sp14;
    u32 sp10;
    u32 spC;
    u32 sp8;
    u32 r2;

    sub = sub_02021C50(proxyIn);
    GF_ASSERT(sub != NULL);
    sub2 = sub_02022024();
    GF_ASSERT(sub2 != NULL);
    if (sub->unk_3C != 3) {
        return NULL;
    }
    *sub2 = *sub;
    sub2->unk_3C = 4;
    if (sub2->unk_04 & NNS_G2D_VRAM_TYPE_2DMAIN) {
        r2 = sub2->unk_4C;
    } else {
        r2 = sub2->unk_50;
    }

    sub_02021DE4(sub2->unk_04, &sp14, &sp10, r2, &spC, &sp8);
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

BOOL sub_02021AC8(u32 a0, int a1, NNS_G2D_VRAM_TYPE a2, UnkStruct_02021AC8 *a3) {
    u32 sp14;
    u32 sp10;
    u32 spC;
    u32 sp8;
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
    a0->unk_04 = NNS_G2D_VRAM_TYPE_3DMAIN;
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
    a1->unk_04 = a0->vram;
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

BOOL sub_02021CCC(UnkStruct_021D21F4_sub *a0) {
    u32 sp4;
    u32 sp0;
    BOOL ret = sub_020224C0(a0->unk_00->szByte, a0->unk_04, &sp4, &sp0);
    if (ret) {
        sub_02021DD0(a0, sp4, sp0);
        sub_02022510(a0->unk_00->szByte, a0->unk_04);
    }
    return ret;
}

BOOL sub_02021D00(UnkStruct_021D21F4_sub *a0) {
    u32 sp14;
    u32 sp10;
    u32 spC;
    u32 sp8;
    if (!sub_02021DE4(a0->unk_04, &sp14, &sp10, a0->unk_00->szByte, &spC, &sp8)) {
        return FALSE;
    }
    sub_02021E90(a0, sp14, sp10);
    a0->unk_48 = 1;
    a0->unk_4C = spC;
    a0->unk_50 = sp8;
    sub_02021F28(a0);
    sub_02021EC0(a0->unk_04, sp14, sp10, spC, sp8);
    return TRUE;
}

void sub_02021D58(UnkStruct_021D21F4_sub *a0) {
    if (a0->unk_48) {
        sub_020223C4(a0);
    }
    sub_02021C08(a0);
}

UnkStruct_021D21F4_sub *sub_02021D70(int resId) {
    for (int i = 0; i < _021D21F4->unk_04; ++i) {
        if (_021D21F4->unk_00[i].unk_0C == resId) {
            return &_021D21F4->unk_00[i];
        }
    }

    return NULL;
}

GXOBJVRamModeChar sub_02021DA8(UnkStruct_021D21F4_sub *a0, int a1) {
    if (a1 == 1) {
        a0->unk_00->mapingType = GX_GetOBJVRamModeChar();
    } else {
        a0->unk_00->mapingType = GXS_GetOBJVRamModeChar();
    }
    return a0->unk_00->mapingType;
}

void sub_02021DD0(UnkStruct_021D21F4_sub *a0, int a1, int a2) {
    a0->unk_34 = a1;
    a0->unk_38 = a2;
    if (a0->unk_08 == 0) {
        sub_02021F28(a0);
    }
}

BOOL sub_02021DE4(int a0, u32 *a1, u32 *a2, u32 a3, u32 *a4, u32 *a5) {
    if (a0 & NNS_G2D_VRAM_TYPE_2DMAIN) {
        *a4 = sub_02022488(a3, _021D21F4->unk_2C, 1);
        int r0 = sub_020224A8(*a4, _021D21F4->unk_2C);
        *a1 = sub_020222EC(r0, _021D21F4->unk_34);
        if (*a1 == -1) {
            GF_ASSERT(FALSE);
            return FALSE;
        }
        *a1 = sub_020224B8(*a1, _021D21F4->unk_2C);
    }
    if (a0 & NNS_G2D_VRAM_TYPE_2DSUB) {
        *a5 = sub_02022488(a3, _021D21F4->unk_30, 1);
        int r0 = sub_020224A8(*a5, _021D21F4->unk_30);
        *a2 = sub_020222EC(r0, _021D21F4->unk_38);
        if (*a2 == -1) {
            GF_ASSERT(FALSE);
            return FALSE;
        }
        *a2 = sub_020224B8(*a2, _021D21F4->unk_30);
    }
    return TRUE;
}

void sub_02021E90(UnkStruct_021D21F4_sub *a0, u32 a1, u32 a2) {
    if (a0->unk_04 & NNS_G2D_VRAM_TYPE_2DMAIN) {
        a0->unk_34 = a1 + _021D21F4->unk_1C;
    }
    if (a0->unk_04 & NNS_G2D_VRAM_TYPE_2DSUB) {
        a0->unk_38 = a2 + _021D21F4->unk_20;
    }
}

void sub_02021EC0(NNS_G2D_VRAM_TYPE a0, u32 a1, u32 a2, u32 a3, u32 a4) {
    if (a0 & NNS_G2D_VRAM_TYPE_2DMAIN) {
        int r7 = sub_020224A8(a3, _021D21F4->unk_2C);
        int r0 = sub_020224A8(a1, _021D21F4->unk_2C);
        sub_02022290(r0, r7, _021D21F4->unk_34);
    }
    if (a0 & NNS_G2D_VRAM_TYPE_2DSUB) {
        int r7 = sub_020224A8(a4, _021D21F4->unk_30);
        int r0 = sub_020224A8(a2, _021D21F4->unk_30);
        sub_02022290(r0, r7, _021D21F4->unk_38);
    }
}

void sub_02021F28(UnkStruct_021D21F4_sub *a0) {
    NNS_G2dInitImageProxy(&a0->unk_10);
    if (a0->unk_04 != NNS_G2D_VRAM_TYPE_BOTH) {
        sub_02021F54(a0, a0->unk_04);
    } else {
        sub_02021F54(a0, NNS_G2D_VRAM_TYPE_2DMAIN);
        sub_02021F54(a0, NNS_G2D_VRAM_TYPE_2DSUB);
    }
}

void sub_02021F54(UnkStruct_021D21F4_sub *a0, NNS_G2D_VRAM_TYPE a1) {
    int r0 = a0->unk_40 ? sub_02021DA8(a0, a1) : a1;
    u32 r1;
    if (a1 == NNS_G2D_VRAM_TYPE_2DMAIN) {
        r1 = a0->unk_34;
        GX_GetOBJVRamModeChar();
    } else {
        r1 = a0->unk_38;
        GXS_GetOBJVRamModeChar();
    }
    if (r0 == 0) {
        NNS_G2dLoadImage2DMapping(a0->unk_00, r1, a1, &a0->unk_10);
    } else {
        NNS_G2dLoadImage1DMapping(a0->unk_00, r1, a1, &a0->unk_10);
    }
    if (a1 == NNS_G2D_VRAM_TYPE_2DMAIN) {
        GX_GetOBJVRamModeChar();
    } else {
        GXS_GetOBJVRamModeChar();
    }
}
