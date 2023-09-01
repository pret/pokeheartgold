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
UnkImageStruct* sub_0200D748(UnkStruct_0200CF18* a0, UnkStruct_0200CF38* a1, UnkTemplate_0200D748* a2, u32 a3);
BOOL sub_0200DA04(UnkStruct_0200CF18* a0, UnkStruct_0200CF38* a1, NarcId narcId, int fileId, BOOL compressed, GfGfxResType a6, int resId);
BOOL sub_0200DA74(UnkStruct_0200CF18* a0, UnkStruct_0200CF38* a1, NARC* narc, int fileId, BOOL compressed, GfGfxResType a6, int resId);
BOOL sub_0200DAE4(_2DGfxResObjList* list, _2DGfxResObj* obj);
BOOL sub_0200DB64(_2DGfxResMan* manager, _2DGfxResObjList* list, u32 charId);
BOOL sub_0200DBB8(_2DGfxResMan* manager, _2DGfxResObjList* list, u32 plttId);
BOOL sub_0200DB18(_2DGfxResMan* manager, _2DGfxResObjList* list, u32 cellOrAnimId);

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

Sprite* sub_0200D2F0(UnkStruct_0200CF18* a0, UnkStruct_0200CF38* a1, int headerIndex, s16 x, s16 y, s16 z, u16 animSeqNo, int priority, int a8, int whichScreen, int a10, int a11, int a12, int a13) {
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
    template.priority = priority;
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
    return sub_0200DA04(a0, a1, narcId, fileId, compressed, GF_GFX_RES_TYPE_CELL, resId);
}

BOOL sub_0200D6EC(UnkStruct_0200CF18* a0, UnkStruct_0200CF38* a1, NARC* narc, int fileId, BOOL compressed, int resId) {
    return sub_0200DA74(a0, a1, narc, fileId, compressed, GF_GFX_RES_TYPE_CELL, resId);
}

BOOL sub_0200D704(UnkStruct_0200CF18* a0, UnkStruct_0200CF38* a1, NarcId narcId, int fileId, BOOL compressed, int resId) {
    return sub_0200DA04(a0, a1, narcId, fileId, compressed, GF_GFX_RES_TYPE_ANIM, resId);
}

BOOL sub_0200D71C(UnkStruct_0200CF18* a0, UnkStruct_0200CF38* a1, NARC* narc, int fileId, BOOL compressed, int resId) {
    return sub_0200DA74(a0, a1, narc, fileId, compressed, GF_GFX_RES_TYPE_ANIM, resId);
}

UnkImageStruct* sub_0200D734(UnkStruct_0200CF18* a0, UnkStruct_0200CF38* a1, UnkTemplate_0200D748* a2) {
    return sub_0200D748(a0, a1, a2, FX32_CONST(0xC0));
}

UnkImageStruct* sub_0200D740(UnkStruct_0200CF18* a0, UnkStruct_0200CF38* a1, UnkTemplate_0200D748* a2, u32 a3) {
    return sub_0200D748(a0, a1, a2, a3);
}

UnkImageStruct* sub_0200D748(UnkStruct_0200CF18* a0, UnkStruct_0200CF38* a1, UnkTemplate_0200D748* a2, u32 a3) {
    int i;
    int r2;
    UnkImageStruct* ret = AllocFromHeap(a0->heapId, sizeof(UnkImageStruct));
    SpriteTemplate template;
    int resIdList[GF_GFX_RES_TYPE_MAX];

    if (ret == NULL) {
        return NULL;
    }
    ret->unk8 = AllocFromHeap(a0->heapId, sizeof(ListOfUnkStruct_02009D48));
    if (ret->unk8 == NULL) {
        return NULL;
    }
    ret->unk8->headers = AllocFromHeap(a0->heapId, sizeof(SpriteResourcesHeader));
    ret->unk4 = ret->unk8->headers;
    if (ret->unk8->headers == NULL) {
        if (ret->unk8 != NULL) { // always true
            FreeToHeap(ret->unk8);
        }
        return NULL; // leaks 16 bytes
    }
    for (i = 0; i < GF_GFX_RES_TYPE_MAX; ++i) {
        resIdList[i] = a2->unk_14[i];
    }
    if (a1->_2dGfxResMan[GF_GFX_RES_TYPE_MCEL] == NULL || a1->_2dGfxResMan[GF_GFX_RES_TYPE_MANM] == NULL) {
        resIdList[GF_GFX_RES_TYPE_MCEL] = -1;
        resIdList[GF_GFX_RES_TYPE_MANM] = -1;
    } else {
        if (resIdList[GF_GFX_RES_TYPE_MCEL] != -1 && !_2DGfxResObjExistsById(a1->_2dGfxResMan[GF_GFX_RES_TYPE_MCEL], resIdList[GF_GFX_RES_TYPE_MCEL])) {
            resIdList[GF_GFX_RES_TYPE_MCEL] = -1;
        }
        if (resIdList[GF_GFX_RES_TYPE_MANM] != -1 && !_2DGfxResObjExistsById(a1->_2dGfxResMan[GF_GFX_RES_TYPE_MANM], resIdList[GF_GFX_RES_TYPE_MANM])) {
            resIdList[GF_GFX_RES_TYPE_MANM] = -1;
        }
    }
    CreateSpriteResourcesHeader(
        ret->unk4,
        resIdList[GF_GFX_RES_TYPE_CHAR],
        resIdList[GF_GFX_RES_TYPE_PLTT],
        resIdList[GF_GFX_RES_TYPE_CELL],
        resIdList[GF_GFX_RES_TYPE_ANIM],
        resIdList[GF_GFX_RES_TYPE_MCEL],
        resIdList[GF_GFX_RES_TYPE_MANM],
        a2->unk_30,
        a2->unk_2C,
        a1->_2dGfxResMan[GF_GFX_RES_TYPE_CHAR],
        a1->_2dGfxResMan[GF_GFX_RES_TYPE_PLTT],
        a1->_2dGfxResMan[GF_GFX_RES_TYPE_CELL],
        a1->_2dGfxResMan[GF_GFX_RES_TYPE_ANIM],
        a1->_2dGfxResMan[GF_GFX_RES_TYPE_MCEL],
        a1->_2dGfxResMan[GF_GFX_RES_TYPE_MANM]
    );

    template.spriteList = a1->spriteList;
    template.header = ret->unk4;
    template.position.x = FX32_CONST(a2->x);
    template.position.y = FX32_CONST(a2->y);
    template.position.z = FX32_CONST(a2->z);
    if (a2->vram == NNS_G2D_VRAM_TYPE_2DSUB) {
        template.position.y += a3;
    }
    template.scale.x = FX32_ONE;
    template.scale.y = FX32_ONE;
    template.scale.z = FX32_ONE;
    template.rotation = 0;
    template.priority = a2->unk_08;
    template.whichScreen = a2->vram;
    template.heapId = a0->heapId;
    ret->sprite = CreateSprite(&template);
    ret->vramTransfer = a2->unk_30;
    if (ret->sprite != NULL) {
        Set2dSpriteAnimSeqNo(ret->sprite, a2->animation);
        if (a2->pal != 0xFFFF) {
            r2 = sub_02024A6C(ret->sprite);
            sub_02024A14(ret->sprite, r2 + a2->pal);
        }
    } else {
        GF_ASSERT(0);
    }
    return ret;
}

NNSG2dImagePaletteProxy* sub_0200D934(UnkStruct_0200CF38* a0, int id) {
    return sub_0200B0F8(Get2DGfxResObjById(a0->_2dGfxResMan[GF_GFX_RES_TYPE_PLTT], id), NULL);
}

int sub_0200D944(UnkStruct_0200CF38* a0, int id, int vram) {
    return sub_0200B12C(Get2DGfxResObjById(a0->_2dGfxResMan[GF_GFX_RES_TYPE_PLTT], id), vram);
}

BOOL sub_0200D958(UnkStruct_0200CF38* a0, u32 character) {
    return sub_0200DB64(a0->_2dGfxResMan[GF_GFX_RES_TYPE_CHAR], a0->_2dGfxResObjList[GF_GFX_RES_TYPE_CHAR], character);
}

BOOL sub_0200D968(UnkStruct_0200CF38* a0, u32 pal) {
    return sub_0200DBB8(a0->_2dGfxResMan[GF_GFX_RES_TYPE_PLTT], a0->_2dGfxResObjList[GF_GFX_RES_TYPE_PLTT], pal);
}

BOOL sub_0200D978(UnkStruct_0200CF38* a0, u32 cell) {
    return sub_0200DB18(a0->_2dGfxResMan[GF_GFX_RES_TYPE_CELL], a0->_2dGfxResObjList[GF_GFX_RES_TYPE_CELL], cell);
}

BOOL sub_0200D988(UnkStruct_0200CF38* a0, u32 animation) {
    return sub_0200DB18(a0->_2dGfxResMan[GF_GFX_RES_TYPE_ANIM], a0->_2dGfxResObjList[GF_GFX_RES_TYPE_ANIM], animation);
}

void sub_0200D998(UnkStruct_0200CF18* a0, UnkStruct_0200CF38* a1) {
    int i;

    sub_0200D044(a1);
    sub_0200AED4(a1->_2dGfxResObjList[GF_GFX_RES_TYPE_CHAR]);
    sub_0200B0CC(a1->_2dGfxResObjList[GF_GFX_RES_TYPE_PLTT]);

    for (i = 0; i < a1->unk_54; ++i) {
        Delete2DGfxResObjList(a1->_2dGfxResObjList[i]);
        Destroy2DGfxResObjMan(a1->_2dGfxResMan[i]);
    }
    sub_0200D0D4(a0, a1);
}

void sub_0200D9DC(UnkImageStruct* a0) {
    if (a0->vramTransfer) {
        sub_0200AF80(a0->unk4->imageProxy);
    }
    Sprite_Delete(a0->sprite);
    sub_02009F24(a0->unk8);
    FreeToHeap(a0);
}

BOOL sub_0200DA04(UnkStruct_0200CF18* a0, UnkStruct_0200CF38* a1, NarcId narcId, int fileId, BOOL compressed, GfGfxResType a6, int resId) {
    if (!_2DGfxResObjExistsById(a1->_2dGfxResMan[a6], resId)) {
        return FALSE;
    }
    _2DGfxResObj* data = AddCellOrAnimResObjFromNarc(a1->_2dGfxResMan[a6], narcId, fileId, compressed, resId, a6, a0->heapId);
    if (data != NULL) {
        BOOL result = sub_0200DAE4(a1->_2dGfxResObjList[a6], data);
        GF_ASSERT(result == TRUE);
        return result;
    }
    GF_ASSERT(0);
    return data != NULL;
}

BOOL sub_0200DA74(UnkStruct_0200CF18* a0, UnkStruct_0200CF38* a1, NARC* narc, int fileId, BOOL compressed, GfGfxResType a6, int resId) {
    if (!_2DGfxResObjExistsById(a1->_2dGfxResMan[a6], resId)) {
        return FALSE;
    }
    _2DGfxResObj* data = AddCellOrAnimResObjFromOpenNarc(a1->_2dGfxResMan[a6], narc, fileId, compressed, resId, a6, a0->heapId);
    if (data != NULL) {
        BOOL result = sub_0200DAE4(a1->_2dGfxResObjList[a6], data);
        GF_ASSERT(result == TRUE);
        return result;
    }
    GF_ASSERT(0);
    return data != NULL;
}

BOOL sub_0200DAE4(_2DGfxResObjList* list, _2DGfxResObj* obj) {
    for (int i = 0; i < list->max; ++i) {
        if (list->obj[i] == NULL) {
            list->obj[i] = obj;
            ++list->num;
            return TRUE;
        }
    }
    return FALSE;
}

BOOL sub_0200DB18(_2DGfxResMan* manager, _2DGfxResObjList* list, u32 cellOrAnimId) {
    for (int i = 0; i < list->max; ++i) {
        if (list->obj[i] != NULL) {
            u32 test_id = sub_0200A7FC(list->obj[i]);
            if (test_id == cellOrAnimId) {
                DestroySingle2DGfxResObj(manager, list->obj[i]);
                list->obj[i] = NULL;
                --list->num;
                return TRUE;
            }
        }
    }
    return FALSE;
}

BOOL sub_0200DB64(_2DGfxResMan* manager, _2DGfxResObjList* list, u32 charId) {
    for (int i = 0; i < list->max; ++i) {
        if (list->obj[i] != NULL) {
            u32 test_id = sub_0200A7FC(list->obj[i]);
            if (test_id == charId) {
                sub_02021884(charId);
                DestroySingle2DGfxResObj(manager, list->obj[i]);
                list->obj[i] = NULL;
                --list->num;
                return TRUE;
            }
        }
    }
    return FALSE;
}

BOOL sub_0200DBB8(_2DGfxResMan* manager, _2DGfxResObjList* list, u32 plttId) {
    for (int i = 0; i < list->max; ++i) {
        if (list->obj[i] != NULL) {
            u32 test_id = sub_0200A7FC(list->obj[i]);
            if (test_id == plttId) {
                sub_02022744(plttId);
                DestroySingle2DGfxResObj(manager, list->obj[i]);
                list->obj[i] = NULL;
                --list->num;
                return TRUE;
            }
        }
    }
    return FALSE;
}

void sub_0200DC0C(Sprite* sprite) {
    sub_020249B0(sprite, FX32_ONE);
}

void sub_0200DC18(UnkImageStruct* unk) {
    sub_0200DC0C(unk->sprite);
}

void sub_0200DC24(UnkImageStruct* unk) {
    sub_020249B0(unk->sprite, 2 * FX32_ONE);
}

void sub_0200DC34(UnkImageStruct* unk, fx32 frames) {
    sub_020249B0(unk->sprite, frames);
}

u32 sub_0200DC40(UnkImageStruct* unk) {
    return sub_020248C8(unk->sprite);
}

void sub_0200DC4C(UnkImageStruct* unk, int seqno) {
    Set2dSpriteAnimSeqNo(unk->sprite, seqno);
}

void sub_0200DC58(UnkImageStruct* unk, int a1) {
    sub_02024950(unk->sprite, a1);
}

u16 sub_0200DC64(UnkImageStruct* unk) {
    return sub_020249A8(unk->sprite);
}

void sub_0200DC70(Sprite* sprite, int a1) {
    Set2dSpriteAnimActiveFlag(sprite, a1);
}

void sub_0200DC78(UnkImageStruct* unk, int a1) {
    sub_0200DC70(unk->sprite, a1);
}

void sub_0200DC84(Sprite* sprite, fx32 frame) {
    sub_02024868(sprite, frame);
}

void sub_0200DC8C(UnkImageStruct* unk, fx32 frame) {
    sub_0200DC84(unk->sprite, frame);
}

BOOL sub_0200DC98(Sprite* sprite) {
    return sub_02024B68(sprite);
}

BOOL sub_0200DCA0(UnkImageStruct* unk) {
    return sub_0200DC98(unk->sprite);
}

void sub_0200DCAC(UnkImageStruct* unk) {
    sub_02024964(unk->sprite);
}

void sub_0200DCB8(Sprite* sprite) {
    sub_020249D4(sprite);
}

void sub_0200DCC0(UnkImageStruct *unk) {
    sub_0200DCB8(unk->sprite);
}

u16 sub_0200DCCC(Sprite* sprite) {
    return sub_020249F8(sprite);
}

u16 sub_0200DCD4(UnkImageStruct* unk) {
    return sub_0200DCCC(unk->sprite);
}

void sub_0200DCE0(Sprite* sprite, int flag) {
    Set2dSpriteVisibleFlag(sprite, flag);
}

void sub_0200DCE8(UnkImageStruct* unk, int flag) {
    sub_0200DCE0(unk->sprite, flag);
}

BOOL sub_0200DCF4(Sprite* sprite) {
    return sub_020248B8(sprite);
}

BOOL sub_0200DCFC(UnkImageStruct* a0) {
    return sub_0200DCF4(a0->sprite);
}

void sub_0200DD08(Sprite* sprite, int a1) {
    sub_02024A14(sprite, a1);
}

void sub_0200DD10(UnkImageStruct* unk, int a1) {
    sub_0200DD08(unk->sprite, a1);
}

void sub_0200DD1C(Sprite* sprite, u8 a1) {
    sub_02024A74(sprite, a1);
}

void sub_0200DD24(UnkImageStruct* unk, u8 a1) {
    sub_0200DD1C(unk->sprite, a1);
}

u8 sub_0200DD30(UnkImageStruct* unk) {
    return sub_02024ACC(unk->sprite);
}

void sub_0200DD3C(Sprite* sprite, int a1) {
    sub_02024A04(sprite, a1);
}

int sub_0200DD48(UnkImageStruct* unk) {
    return sub_02024A0C(unk->sprite);
}

void sub_0200DD54(UnkImageStruct* unk, int a1) {
    sub_0200DD3C(unk->sprite, a1);
}

void sub_0200DD60(Sprite* sprite, u16 a1) {
    sub_02024ADC(sprite, a1);
}

void sub_0200DD68(UnkImageStruct* unk, u16 a1) {
    sub_0200DD60(unk->sprite, a1);
}

u16 sub_0200DD74(Sprite* sprite) {
    return sub_02024AF8(sprite);
}

u16 sub_0200DD7C(UnkImageStruct* unk) {
    return sub_0200DD74(unk->sprite);
}

void sub_0200DD88(Sprite* sprite, s16 x, s16 y) {
    VecFx32 vec;

    vec.x = x * FX32_ONE;
    vec.y = y * FX32_ONE;
    if (sub_02024B60(sprite) == NNS_G2D_VRAM_TYPE_2DSUB) {
        vec.y += 192 * FX32_ONE;
    }
    vec.z = 0;
    sub_020247D4(sprite, &vec);
}

void sub_0200DDB8(UnkImageStruct* unk, s16 x, s16 y) {
    sub_0200DD88(unk->sprite, x, y);
}

void sub_0200DDC4(Sprite* sprite, s16 x, s16 y, fx32 yOffset) {
    VecFx32 vec;

    vec.x = x * FX32_ONE;
    vec.y = y * FX32_ONE;
    if (sub_02024B60(sprite) == NNS_G2D_VRAM_TYPE_2DSUB) {
        vec.y += yOffset;
    }
    vec.z = 0;
    sub_020247D4(sprite, &vec);
}

void sub_0200DDF4(UnkImageStruct* unk, s16 x, s16 y, fx32 yOffset) {
    sub_0200DDC4(unk->sprite, x, y, yOffset);
}

void sub_0200DE00(Sprite* sprite, s16* x, s16* y) {
    const VecFx32* pos = sub_020248AC(sprite);
    *x = pos->x / FX32_ONE;
    if (sub_02024B60(sprite) == NNS_G2D_VRAM_TYPE_2DSUB) {
        *y = (pos->y - 192 * FX32_ONE) / FX32_ONE;
    } else {
        *y = pos->y / FX32_ONE;
    }
}

void sub_0200DE44(UnkImageStruct* unk, s16* x, s16* y) {
    sub_0200DE00(unk->sprite, x, y);
}

void sub_0200DE50(Sprite* sprite, s16* x, s16* y, fx32 yOffset) {
    const VecFx32* pos = sub_020248AC(sprite);
    *x = pos->x / FX32_ONE;
    if (sub_02024B60(sprite) == NNS_G2D_VRAM_TYPE_2DSUB) {
        *y = (pos->y - yOffset) / FX32_ONE;
    } else {
        *y = pos->y / FX32_ONE;
    }
}

void sub_0200DE94(UnkImageStruct* unk, s16* x, s16* y, fx32 yOffset) {
    sub_0200DE50(unk->sprite, x, y, yOffset);
}

void sub_0200DEA0(Sprite* sprite, s16 dx, s16 dy) {
    VecFx32 vec;
    const VecFx32* pos = sub_020248AC(sprite);
    vec.x = pos->x + dx * FX32_ONE;
    vec.y = pos->y + dy * FX32_ONE;
    vec.z = pos->z;
    sub_020247D4(sprite, &vec);
}

void sub_0200DED0(UnkImageStruct* unk, s16 dx, s16 dy) {
    sub_0200DEA0(unk->sprite, dx, dy);
}

void sub_0200DEDC(UnkImageStruct* unk, fx32 dx, fx32 dy) {
    VecFx32 vec;
    const VecFx32* pos = sub_020248AC(unk->sprite);
    vec.x = pos->x + dx;
    vec.y = pos->y + dy;
    vec.z = pos->z;
    sub_020247D4(unk->sprite, &vec);
}

void sub_0200DF08(UnkImageStruct* unk, fx32 x, fx32 y) {
    VecFx32 vec;
    const VecFx32* pos = sub_020248AC(unk->sprite);
    vec.x = x;
    vec.y = y;
    vec.z = pos->z;
    sub_020247D4(unk->sprite, &vec);
}

void sub_0200DF2C(UnkImageStruct* unk, fx32* x, fx32* y) {
    const VecFx32* pos = sub_020248AC(unk->sprite);
    *x = pos->x;
    *y = pos->y;
}

void sub_0200DF44(UnkImageStruct* unk, fx32 x, fx32 y, fx32 yOffset) {
    if (sub_02024B60(unk->sprite) == NNS_G2D_VRAM_TYPE_2DSUB) {
        sub_0200DF08(unk, x, y + yOffset);
    } else {
        sub_0200DF08(unk, x, y);
    }
}

void sub_0200DF70(UnkImageStruct* unk, fx32* x, fx32* y, fx32 yOffset) {
    sub_0200DF2C(unk, x, y);
    if (sub_02024B60(unk->sprite) == NNS_G2D_VRAM_TYPE_2DSUB) {
        *y -= yOffset;
    }
}

void sub_0200DF90(Sprite* sprite, u8 a1) {
    sub_0202487C(sprite, a1);
}

void sub_0200DF98(UnkImageStruct* unk, u8 a1) {
    sub_0200DF90(unk->sprite, a1);
}

void sub_0200DFA4(Sprite* sprite, f32 x, f32 y) {
    VecFx32* scale = sub_020248B0(sprite);
    scale->x = FX_F32_TO_FX32(x);
    scale->y = FX_F32_TO_FX32(y);
    sub_020247F4(sprite, scale);
}

void sub_0200E024(UnkImageStruct* unk, f32 x, f32 y) {
    sub_0200DFA4(unk->sprite, x, y);
}

void sub_0200E030(Sprite* sprite, f32* x, f32* y) {
    VecFx32* scale = sub_020248B0(sprite);
    *x = FX_FX32_TO_F32(scale->x);
    *y = FX_FX32_TO_F32(scale->y);
}

void sub_0200E060(UnkImageStruct* unk, f32* x, f32* y) {
    sub_0200E030(unk->sprite, x, y);
}

void sub_0200E06C(Sprite* sprite, u16 a1) {
    sub_02024818(sprite, a1);
}

void sub_0200E074(UnkImageStruct* unk, u16 a1) {
    sub_0200E06C(unk->sprite, a1);
}

void sub_0200E080(Sprite* sprite, u16 a1) {
    u16 rotation = sub_020248B4(sprite);
    rotation += a1;
    sub_02024818(sprite, rotation);
}

void sub_0200E098(UnkImageStruct* unk, u16 a1) {
    sub_0200E080(unk->sprite, a1);
}

u16 sub_0200E0A4(Sprite* sprite) {
    return sub_020248B4(sprite);
}

u16 sub_0200E0AC(UnkImageStruct* unk) {
    return sub_0200E0A4(unk->sprite);
}

void sub_0200E0B8(Sprite* sprite, u8 a1) {
    sub_02024890(sprite, a1);
}

void sub_0200E0C0(UnkImageStruct* unk, u8 a1) {
    sub_0200E0B8(unk->sprite, a1);
}

void sub_0200E0CC(UnkImageStruct* unk, s16 x, s16 y) {
    VecFx32 matrix;
    matrix.x = x * FX32_ONE;
    matrix.y = y * FX32_ONE;
    matrix.z = 0;
    sub_020247E4(unk->sprite, &matrix);
}

void sub_0200E0E8(UnkImageStruct* unk, BOOL mosaic) {
    sub_02024B38(unk->sprite, mosaic);
}

void sub_0200E0F4(Sprite* sprite, GXOamMode mode) {
    sub_02024B78(sprite, mode);
}

void sub_0200E0FC(UnkImageStruct* unk, GXOamMode mode) {
    sub_0200E0F4(unk->sprite, mode);
}

GXOamMode sub_0200E108(Sprite* sprite) {
    return sub_02024BAC(sprite);
}

GXOamMode sub_0200E110(UnkImageStruct* unk) {
    return sub_0200E108(unk->sprite);
}

u32 sub_0200E11C(UnkImageStruct* unk) {
    return sub_02024C9C(unk->sprite);
}
