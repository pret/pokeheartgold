#include "assert.h"
#include "global.h"
#include "heap.h"
#include "gf_gfx_loader.h"
#include "palette.h"
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
BOOL sub_0200D124(UnkStruct_0200CF18* a0, UnkStruct_0200CF38* a1, const u16* a2, int a3, int a4);
Sprite* sub_0200D2F0(UnkStruct_0200CF18* a0, UnkStruct_0200CF38* a1, int a2, s16 x, s16 y, s16 z, u16 animSeqNo, int rotation, int a8, int whichScreen, int a10, int a11, int a12, int a13);
void sub_0200DAE4(struct _2DGfxResObjList* list, _2DGfxResObj* obj);
BOOL sub_0200DA04(UnkStruct_0200CF18* a0, UnkStruct_0200CF38* a1, NarcId narcId, int fileId, BOOL compressed, int a6, int resId);
BOOL sub_0200DA74(UnkStruct_0200CF18* a0, UnkStruct_0200CF38* a1, NARC* narc, int fileId, BOOL compressed, int a6, int resId);

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
    for (int i = 0; i < GF_GFX_RES_TYPE_MAX; ++i) {
        ret->_2dGfxResMan[i] = NULL;
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
    if (a0->listOfUnkStruct_9D48 != NULL) {
        sub_02009F24(a0->listOfUnkStruct_9D48);
    }
}

void sub_0200D060(UnkStruct_0200CF38* a0) {
    for (int i = 0; i < a0->unk_54; ++i) {
        sub_0200A954(sub_0200A900(a0->_2dGfxResHeader, i));
    }
    FreeToHeap(a0->_2dGfxResHeader);
    sub_0200AED4(a0->_2dGfxResObjList[0]);
    sub_0200B0CC(a0->_2dGfxResObjList[1]);
    for (int i = 0; i < a0->unk_54; ++i) {
        Delete2DGfxResObjList(a0->_2dGfxResObjList[i]);
        Destroy2DGfxResObjMan(a0->_2dGfxResMan[i]);
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

BOOL sub_0200D124(UnkStruct_0200CF18* a0, UnkStruct_0200CF38* a1, const u16* a2, int a3, int a4) {
    int i;
    int r7;
    int size;
    struct _2DGfxResHeader* header;
    void* data;
    NARC* narc;

    r7 = GF_GFX_RES_TYPE_MAX;
    
    if (a0 == NULL || a1 == NULL) {
        return FALSE;
    }
    if (a2[GF_GFX_RES_TYPE_MCEL] == 0xFFFF) {
        r7 = GF_GFX_RES_TYPE_MAX - 2;
    }
    a1->unk_54 = r7;
    size = sub_0200A8FC();
    a1->_2dGfxResHeader = AllocFromHeap(a0->heapId, size * r7);
    narc = NARC_New(NARC_a_1_7_5, a0->heapId);

    for (i = 0; i < r7; ++i) {
        header = sub_0200A900(a1->_2dGfxResHeader, i);
        data = GfGfxLoader_LoadFromOpenNarc(narc, a2[i], FALSE, a0->heapId, TRUE);
        sub_0200A908(data, header, a0->heapId);
        FreeToHeap(data);
    }
    for (i = 0; i < r7; ++i) {
        header = sub_0200A900(a1->_2dGfxResHeader, i);
        size = sub_0200A96C(header);
        a1->_2dGfxResMan[i] = Create2DGfxResObjMan(size, (GfGfxResType)i, a0->heapId);
    }
    for (i = 0; i < r7; ++i) {
        header = sub_0200A900(a1->_2dGfxResHeader, i);
        size = sub_0200A96C(header);
        a1->_2dGfxResObjList[i] = Create2DGfxResObjList(size, a0->heapId);
        a1->unk_3C[i] = LoadAll2DGfxResObjsFromHeader(a1->_2dGfxResMan[i], header, a1->_2dGfxResObjList[i], a0->heapId);
    }
    switch (a3) {
    case 0:
        sub_0200ADE4(a1->_2dGfxResObjList[GF_GFX_RES_TYPE_CHAR]);
        break;
    case 1:
        sub_0200AE58(a1->_2dGfxResObjList[GF_GFX_RES_TYPE_CHAR]);
        break;
    case 2:
    default:
        sub_0200AD30(a1->_2dGfxResObjList[GF_GFX_RES_TYPE_CHAR]);
        break;
    }
    switch (a4) {
    case 0:
        sub_0200B050(a1->_2dGfxResObjList[1]);
        break;
    case 1:
    default:
        sub_0200AFD8(a1->_2dGfxResObjList[1]);
        break;
    }
    data = GfGfxLoader_LoadFromOpenNarc(narc, a2[6], FALSE, a0->heapId, TRUE);
    a1->listOfUnkStruct_9D48 = sub_02009E84(data, a0->heapId, a1->_2dGfxResMan[0], a1->_2dGfxResMan[1], a1->_2dGfxResMan[2], a1->_2dGfxResMan[3], a1->_2dGfxResMan[4], a1->_2dGfxResMan[5]);
    FreeToHeap(data);
    NARC_Delete(narc);
    return TRUE;
}

BOOL sub_0200D294(UnkStruct_0200CF18* a0, UnkStruct_0200CF38* a1, const u16* a2) {
    return sub_0200D124(a0, a1, a2, 2, 1);
}

BOOL sub_0200D2A4(UnkStruct_0200CF18* a0, UnkStruct_0200CF38* a1, const u16* a2, int a3, int a4) {
    return sub_0200D124(a0, a1, a2, a3, a4);
}

Sprite* sub_0200D2B4(UnkStruct_0200CF18* a0, UnkStruct_0200CF38* a1, const UnkStruct_0200D2B4* a2) {
    return sub_0200D2F0(a0, a1, a2->unk_00, a2->x, a2->y, a2->x /* typo? */, a2->unk_0A, a2->unk_0C, a2->unk_10, a2->unk_14, a2->unk_18, a2->unk_1C, a2->unk_20, a2->unk_24);
}

Sprite* sub_0200D2F0(UnkStruct_0200CF18* a0, UnkStruct_0200CF38* a1, int headerIndex, s16 x, s16 y, s16 z, u16 animSeqNo, int rotation, int a8, int whichScreen, int a10, int a11, int a12, int a13) {
    Sprite* ret = NULL;
    SpriteTemplate template;

    template.spriteList = a1->spriteList;
    template.header = &a1->listOfUnkStruct_9D48->headers[headerIndex];

    template.position.x = FX32_CONST(x);
    template.position.y = FX32_CONST(y);
    template.position.z = FX32_CONST(z);

    if (whichScreen == 2) {
        template.position.y += FX32_CONST(0xC0);
    }
    template.scale.x = FX32_ONE;
    template.scale.y = FX32_ONE;
    template.scale.z = FX32_ONE;
    template.rotation = 0;
    template.priority = rotation;
    template.whichScreen = whichScreen;
    template.heapId = a0->heapId;
    ret = CreateSprite(&template);
    if (ret != NULL) {
        Set2dSpriteAnimSeqNo(ret, animSeqNo);
        switch (a10) {
        case 0:
            sub_02024A14(ret, a8);
            break;
        case 1:
            break;
        case 2:
            sub_02024A48(ret, a8);
            break;
        }
    }
    return ret;
}

BOOL sub_0200D3F8(UnkStruct_0200CF18* a0, UnkStruct_0200CF38* a1, Unk122_021E92E4* a2) {
    int i, j;
    int sp4 = GF_GFX_RES_TYPE_MAX;
    int num;

    if (a0 == NULL || a1 == NULL) {
        return FALSE;
    }
    if (a2->unk0[GF_GFX_RES_TYPE_MCEL] == 0 || a2->unk0[GF_GFX_RES_TYPE_MANM] == 0) {
        sp4 = GF_GFX_RES_TYPE_MAX - 2;
    }
    a1->unk_54 = sp4;

    for (i = 0; i < sp4; ++i) {
        a1->_2dGfxResMan[i] = Create2DGfxResObjMan(a2->unk0[i], (GfGfxResType)i, a0->heapId);
    }

    for (i = 0; i < sp4; ++i) {
        num = a2->unk0[i];
        if (num == 0) {
            continue;
        }
        a1->_2dGfxResObjList[i] = Create2DGfxResObjList(num, a0->heapId);
        a1->unk_3C[i] = 0;
        for (j = 0; j < a1->_2dGfxResObjList[i]->max; ++j) {
            a1->_2dGfxResObjList[i]->obj[j] = NULL;
        }
    }
    return TRUE;
}

BOOL sub_0200D4A4(UnkStruct_0200CF18* a0, UnkStruct_0200CF38* a1, NarcId narcId, int fileId, BOOL compressed, int vram, int resId) {
    if (!_2DGfxResObjExistsById(a1->_2dGfxResMan[GF_GFX_RES_TYPE_CHAR], resId)) {
        return FALSE;
    }
    _2DGfxResObj* obj = AddCharResObjFromNarc(a1->_2dGfxResMan[GF_GFX_RES_TYPE_CHAR], narcId, fileId, compressed, resId, vram, a0->heapId);
    if (obj != NULL) {
        sub_0200ADA4(obj);
        sub_0200DAE4(a1->_2dGfxResObjList[GF_GFX_RES_TYPE_CHAR], obj);
        return TRUE;
    }
    GF_ASSERT(0);
    return obj != NULL;
}

BOOL sub_0200D504(UnkStruct_0200CF18* a0, UnkStruct_0200CF38* a1, NARC* narc, int fileId, BOOL compressed, int vram, int resId) {
    if (!_2DGfxResObjExistsById(a1->_2dGfxResMan[GF_GFX_RES_TYPE_CHAR], resId)) {
        return FALSE;
    }
    _2DGfxResObj* obj = AddCharResObjFromOpenNarc(a1->_2dGfxResMan[GF_GFX_RES_TYPE_CHAR], narc, fileId, compressed, resId, vram, a0->heapId);
    if (obj != NULL) {
        sub_0200ADA4(obj);
        sub_0200DAE4(a1->_2dGfxResObjList[GF_GFX_RES_TYPE_CHAR], obj);
        return TRUE;
    }
    GF_ASSERT(0);
    return obj != NULL;
}

s8 sub_0200D564(UnkStruct_0200CF18* a0, UnkStruct_0200CF38* a1, NarcId narcId, int fileId, BOOL compressed, int pltt_num, int vram, int resId) {
    if (!_2DGfxResObjExistsById(a1->_2dGfxResMan[GF_GFX_RES_TYPE_PLTT], resId)) {
        return -1;
    }
    _2DGfxResObj* obj = AddPlttResObjFromNarc(a1->_2dGfxResMan[GF_GFX_RES_TYPE_PLTT], narcId, fileId, compressed, resId, vram, pltt_num, a0->heapId);
    if (obj != NULL) {
        GF_ASSERT(sub_0200B00C(obj) == TRUE);
        sub_0200DAE4(a1->_2dGfxResObjList[GF_GFX_RES_TYPE_PLTT], obj);
        return sub_0200B12C(obj, vram);
    }
    GF_ASSERT(0);
    return -1;
}

s8 sub_0200D5D4(UnkStruct_0200CF18* a0, UnkStruct_0200CF38* a1, NARC* narc, int fileId, BOOL compressed, int pltt_num, int vram, int resId) {
    if (!_2DGfxResObjExistsById(a1->_2dGfxResMan[GF_GFX_RES_TYPE_PLTT], resId)) {
        return -1;
    }
    _2DGfxResObj* obj = AddPlttResObjFromOpenNarc(a1->_2dGfxResMan[GF_GFX_RES_TYPE_PLTT], narc, fileId, compressed, resId, vram, pltt_num, a0->heapId);
    if (obj != NULL) {
        GF_ASSERT(sub_0200B00C(obj) == TRUE);
        sub_0200DAE4(a1->_2dGfxResObjList[GF_GFX_RES_TYPE_PLTT], obj);
        return sub_0200B12C(obj, vram);
    }
    GF_ASSERT(0);
    return -1;
}

u8 sub_0200D644(PaletteData* a0, u32 bufferId, UnkStruct_0200CF18* a2, UnkStruct_0200CF38* a3, NarcId narcId, int fileId, BOOL compressed, int pltt_num, int vram, int resId) {
    int ret = sub_0200D564(a2, a3, narcId, fileId, compressed, pltt_num, vram, resId);
    if (ret != -1) {
        sub_020032A4(a0, bufferId, ret * 16, pltt_num * 32);
    }
    return ret;
}

u8 sub_0200D68C(PaletteData* a0, u32 bufferId, UnkStruct_0200CF18* a2, UnkStruct_0200CF38* a3, NARC* narc, int fileId, BOOL compressed, int pltt_num, int vram, int resId) {
    int ret = sub_0200D5D4(a2, a3, narc, fileId, compressed, pltt_num, vram, resId);
    if (ret != -1) {
        sub_020032A4(a0, bufferId, ret * 16, pltt_num * 32);
    }
    return ret;
}

BOOL sub_0200D6D4(UnkStruct_0200CF18* a0, UnkStruct_0200CF38* a1, NarcId narcId, int fileId, BOOL compressed, int resId) {
    return sub_0200DA04(a0, a1, narcId, fileId, compressed, 2, resId);
}

BOOL sub_0200D6EC(UnkStruct_0200CF18* a0, UnkStruct_0200CF38* a1, NARC* narc, int fileId, BOOL compressed, int resId) {
    return sub_0200DA74(a0, a1, narc, fileId, compressed, 2, resId);
}

BOOL sub_0200D704(UnkStruct_0200CF18* a0, UnkStruct_0200CF38* a1, NarcId narcId, int fileId, BOOL compressed, int resId) {
    return sub_0200DA04(a0, a1, narcId, fileId, compressed, 3, resId);
}

BOOL sub_0200D71C(UnkStruct_0200CF18* a0, UnkStruct_0200CF38* a1, NARC* narc, int fileId, BOOL compressed, int resId) {
    return sub_0200DA74(a0, a1, narc, fileId, compressed, 3, resId);
}
