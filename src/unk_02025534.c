#include "global.h"
#include "unk_02025534.h"
#include "system.h"
#include "unk_0201F4C4.h"

void sub_0202568C(struct _2DGfxRawResMan *resourceMgr);
struct _2DGfxRawResObj *sub_020256C8(struct _2DGfxRawResMan *resourceMgr, int id);
struct _2DGfxRawResObj *sub_02025738(struct _2DGfxRawResMan *resourceMgr);
void sub_02025768(struct _2DGfxRawResObj *resourceObj);
void sub_0202585C(struct UnkStruct_02025780 *a0, struct UnkStruct_02025B04 *a1);
struct UnkStruct_02025B04 *sub_02025940(struct UnkStruct_02025780 *a0, int a1);
int sub_02025988(struct UnkStruct_02025B04 *a0);
void sub_020259B0(struct UnkStruct_02025B04 *a0);
void sub_02025A64(struct UnkStruct_02025B04 *a0);
struct UnkStruct_02025B04 *sub_02025AD4(const struct UnkStruct_02025780 *a0);
void sub_02025B04(struct UnkStruct_02025B04 *a0);
NNSG3dResTex *sub_02025B18(struct UnkStruct_02025B04 *a0);
NNSG3dResTex *sub_02025B28(struct UnkStruct_02025B04 *a0);
void sub_02025B40(NNSG3dResTex *tex, NNSG3dTexKey *texKey, NNSG3dTexKey *tex4x4Key, NNSG3dPlttKey *plttKey);
void sub_02025BB0(NNSG3dResTex *tex, struct UnkStruct_02025B04 *a1);
void sub_02025BDC(NNSG3dResTex *tex, NNSG3dTexKey texKey, NNSG3dTexKey tex4x4Key, NNSG3dPlttKey plttKey);
void sub_02025BF0(NNSG3dResTex *tex);
void *sub_02025C08(const NNSG3dResFileHeader *a0, HeapID heapId);
u32 sub_02025C2C(const NNSG3dResFileHeader *header);

struct _2DGfxRawResMan *Create2DGfxResMan(int num, HeapID heapId) {
    struct _2DGfxRawResMan *ret = AllocFromHeap(heapId, sizeof(struct _2DGfxRawResMan));
    int i;

    GF_ASSERT(ret != NULL);
    ret->vals = AllocFromHeap(heapId, num * sizeof(struct _2DGfxRawResObj));
    GF_ASSERT(ret->vals != NULL);
    for (i = 0; i < num; i++) {
        sub_02025768(&ret->vals[i]);
    }
    ret->max = num;
    ret->num = 0;
    return ret;
}

void Destroy2DGfxResMan(struct _2DGfxRawResMan *resourceMgr) {
    GF_ASSERT(resourceMgr != NULL);
    sub_0202568C(resourceMgr);
    FreeToHeap(resourceMgr->vals);
    FreeToHeap(resourceMgr);
}

BOOL sub_020255A0(struct _2DGfxRawResMan *resourceMgr, int id) {
    GF_ASSERT(resourceMgr != NULL);
    return sub_020256C8(resourceMgr, id) == NULL;
}

struct _2DGfxRawResObj *sub_020255C4(struct _2DGfxRawResMan *resourceMgr, void *resource, int id) {
    GF_ASSERT(resourceMgr != NULL);
    struct _2DGfxRawResObj *obj = sub_02025738(resourceMgr);
    GF_ASSERT(obj != NULL);
    GF_ASSERT(sub_020255A0(resourceMgr, id) == TRUE);
    obj->data = resource;
    obj->id = id;
    ++resourceMgr->num;
    return obj;
}

struct _2DGfxRawResObj *sub_02025600(struct _2DGfxRawResMan *resourceMgr, const char *name, int id, HeapID heapId) {
    GF_ASSERT(resourceMgr != NULL);
    GF_ASSERT(name != NULL);
    struct _2DGfxRawResObj *obj = sub_02025738(resourceMgr);
    GF_ASSERT(obj != NULL);
    GF_ASSERT(sub_020255A0(resourceMgr, id) == TRUE);
    obj->data = Sys_AllocAndReadFile(heapId, name);
    GF_ASSERT(obj->data != NULL);
    obj->id = id;
    ++resourceMgr->num;
    return obj;
}

void sub_02025658(struct _2DGfxRawResMan *resourceMgr, struct _2DGfxRawResObj *a1) {
    GF_ASSERT(resourceMgr != NULL);
    GF_ASSERT(a1 != NULL);
    if (a1->data != NULL) {
        FreeToHeap(a1->data);
        a1->data = NULL;
    }
    a1->id = -1;
    --resourceMgr->num;
}

// -----------------------------------------

void sub_0202568C(struct _2DGfxRawResMan *resourceMgr) {
    int i;

    GF_ASSERT(resourceMgr != NULL);
    GF_ASSERT(resourceMgr->vals != NULL);
    for (i = 0; i < resourceMgr->max; ++i) {
        if (resourceMgr->vals[i].id != -1) {
            sub_02025658(resourceMgr, &resourceMgr->vals[i]);
        }
    }
}

struct _2DGfxRawResObj *sub_020256C8(struct _2DGfxRawResMan *resourceMgr, int id) {
    int i;

    GF_ASSERT(resourceMgr != NULL);
    for (i = 0; i < resourceMgr->max; ++i) {
        if (resourceMgr->vals[i].id == id) {
            return &resourceMgr->vals[i];
        }
    }

    return NULL;
}

void *sub_020256FC(struct _2DGfxRawResObj *obj) {
    GF_ASSERT(obj != NULL);
    return obj->data;
}

void sub_0202570C(struct _2DGfxRawResObj *obj, void *newPtr) {
    GF_ASSERT(obj != NULL);
    if (obj->data != NULL) {
        FreeToHeap(obj->data);
    }
    obj->data = newPtr;
}

int Get2DGfxRawResObjId(struct _2DGfxRawResObj *obj) {
    GF_ASSERT(obj != NULL);
    return obj->id;
}

struct _2DGfxRawResObj *sub_02025738(struct _2DGfxRawResMan *resourceMgr) {
    int i;

    GF_ASSERT(resourceMgr != NULL);
    for (i = 0; i < resourceMgr->max; ++i) {
        if (resourceMgr->vals[i].id == -1) {
            return &resourceMgr->vals[i];
        }
    }

    return NULL;
}

void sub_02025768(struct _2DGfxRawResObj *obj) {
    GF_ASSERT(obj != NULL);
    obj->id = -1;
    obj->data = NULL;
}

// -----------------------------------------

struct UnkStruct_02025780 *sub_02025780(int num, HeapID heapId) {
    struct UnkStruct_02025780 *ret = AllocFromHeap(heapId, sizeof(struct UnkStruct_02025780));
    ret->man = Create2DGfxResMan(num, heapId);
    ret->unk_4 = AllocFromHeap(heapId, num * sizeof(struct UnkStruct_02025B04));
    for (int i = 0; i < num; ++i) {
        sub_02025B04(&ret->unk_4[i]);
    }
    return ret;
}

void sub_020257C4(struct UnkStruct_02025780 *a0) {
    GF_ASSERT(a0 != NULL);
    sub_02025900(a0);
    Destroy2DGfxResMan(a0->man);
    FreeToHeap(a0->unk_4);
    FreeToHeap(a0);
}

BOOL sub_020257E8(struct UnkStruct_02025780 *a0, int id) {
    GF_ASSERT(a0 != NULL);
    return sub_020255A0(a0->man, id);
}

struct UnkStruct_02025B04 *sub_02025800(struct UnkStruct_02025780 *a0, void *a1, int a2, u32 a3, HeapID heapId) {
    struct UnkStruct_02025B04 *ret;
    void *r1;
    GF_ASSERT(a0 != NULL);
    ret = sub_02025AD4(a0);
    ret->unk_16 = a3;
    if (ret->unk_16 == TRUE) {
        r1 = sub_02025C08(a1, heapId);
        ret->resFileHeader = a1;
    } else {
        r1 = a1;
        ret->resFileHeader = NULL;
    }
    ret->obj = sub_020255C4(a0->man, r1, a2);
    return ret;
}

struct UnkStruct_02025B04 *sub_02025844(struct UnkStruct_02025780 *a0, void *a1, int a2, u32 a3, HeapID heapId) {
    struct UnkStruct_02025B04 *ret = sub_02025800(a0, a1, a2, a3, heapId);
    sub_02025A64(ret);
    return ret;
}

void sub_0202585C(struct UnkStruct_02025780 *a0, struct UnkStruct_02025B04 *a1) {
    GF_ASSERT(a0 != NULL);
    GF_ASSERT(a1 != NULL);
    if (a1->unk_16 == TRUE && a1->unk_14 == 0) {
        FreeToHeap(a1->resFileHeader);
        a1->unk_16 = FALSE;
    }
    if (a1->obj != NULL) {
        sub_02025658(a0->man, a1->obj);
    }
    if (a1->texKey != 0) {
        GF_ASSERT(!NNS_GfdFreeTexVram(a1->texKey));
    }
    if (a1->tex4x4Key != 0) {
        GF_ASSERT(!NNS_GfdFreeTexVram(a1->tex4x4Key));
    }
    if (a1->plttKey != 0) {
        GF_ASSERT(!NNS_GfdFreePlttVram(a1->plttKey));
    }
    sub_02025B04(a1);
}

void sub_020258E0(struct UnkStruct_02025780 *a0, int a1) {
    GF_ASSERT(a0 != NULL);
    sub_0202585C(a0, sub_02025940(a0, a1));
}

void sub_02025900(struct UnkStruct_02025780 *a0) {
    int i;

    GF_ASSERT(a0 != NULL);
    GF_ASSERT(a0->unk_4 != NULL);

    for (i = 0; i < a0->man->max; ++i) {
        if (a0->unk_4[i].obj != NULL) {
            sub_0202585C(a0, &a0->unk_4[i]);
        }
    }
}

struct UnkStruct_02025B04 *sub_02025940(struct UnkStruct_02025780 *a0, int a1) {
    int i;
    int r0;

    GF_ASSERT(a0 != NULL);

    for (i = 0; i < a0->man->max; ++i) {
        if (a0->unk_4[i].obj != NULL) {
            r0 = sub_02025988(&a0->unk_4[i]);
            if (r0 == a1) {
                return &a0->unk_4[i];
            }
        }
    }

    return NULL;
}

int sub_02025988(struct UnkStruct_02025B04 *a0) {
    GF_ASSERT(a0 != NULL);
    return Get2DGfxRawResObjId(a0->obj);
}


NNSG3dResTex *sub_0202599C(struct UnkStruct_02025B04 *a0) {
    GF_ASSERT(a0 != NULL);
    return sub_02025B18(a0);
}

void sub_020259B0(struct UnkStruct_02025B04 *a0) {
    GF_ASSERT(a0 != NULL);
    GF_ASSERT(a0->unk_14 == 0);
    if (a0->plttKey == 0) {
        GF_ASSERT(FALSE);
        return;
    }
    sub_02025BB0(sub_02025B28(a0), a0);
}

void sub_020259E0(struct UnkStruct_02025780 *a0, int a1) {
    GF_ASSERT(a0 != NULL);
    sub_020259B0(sub_02025940(a0, a1));
}

void sub_020259FC(struct UnkStruct_02025B04 *a0) {
    GF_ASSERT(a0 != NULL);
    if (!a0->unk_16) {
        GF_ASSERT(FALSE);
        return;
    }
    if (a0->unk_14 != 0) {
        GF_ASSERT(FALSE);
        return;
    }
    sub_02025BF0(sub_02025B28(a0));
    sub_02025BDC(sub_02025B18(a0), a0->texKey, a0->tex4x4Key, a0->plttKey);
    FreeToHeap(a0->resFileHeader);
    a0->resFileHeader = NULL;
    a0->unk_14 = 1;
}

void sub_02025A48(struct UnkStruct_02025780 *a0, int a1) {
    GF_ASSERT(a0 != NULL);
    sub_020259FC(sub_02025940(a0, a1));
}

void sub_02025A64(struct UnkStruct_02025B04 *a0) {
    GF_ASSERT(a0 != NULL);
    GF_ASSERT(a0->unk_14 == 0);
    if (a0->plttKey != 0) {
        GF_ASSERT(FALSE);
        return;
    }
    sub_02025B40(sub_02025B28(a0), &a0->texKey, &a0->tex4x4Key, &a0->plttKey);
}

NNSG3dTexKey sub_02025A9C(struct UnkStruct_02025B04 *a0) {
    GF_ASSERT(a0 != NULL);
    return a0->texKey;
}

NNSG3dTexKey sub_02025AAC(struct UnkStruct_02025B04 *a0) {
    GF_ASSERT(a0 != NULL);
    return a0->tex4x4Key;
}

NNSG3dPlttKey sub_02025ABC(struct UnkStruct_02025B04 *a0) {
    GF_ASSERT(a0 != NULL);
    return a0->plttKey;
}

u32 sub_02025ACC(const NNSG3dResFileHeader *header) {
    return sub_02025C2C(header);
}

struct UnkStruct_02025B04 *sub_02025AD4(const struct UnkStruct_02025780 *a0) {
    for (int i = 0; i < a0->man->max; ++i) {
        if (a0->unk_4[i].obj == NULL) {
            return &a0->unk_4[i];
        }
    }

    return NULL;
}

void sub_02025B04(struct UnkStruct_02025B04 *a0) {
    a0->obj = NULL;
    a0->texKey = 0;
    a0->tex4x4Key = 0;
    a0->plttKey = 0;
    a0->unk_14 = 0;
    a0->resFileHeader = NULL;
    a0->unk_14 = 0;  // BUG: should be unk_16?
}

NNSG3dResTex *sub_02025B18(struct UnkStruct_02025B04 *a0) {
    return NNS_G3dGetTex(sub_020256FC(a0->obj));
}

NNSG3dResTex *sub_02025B28(struct UnkStruct_02025B04 *a0) {
    return NNS_G3dGetTex(!a0->unk_16 ? sub_020256FC(a0->obj) : a0->resFileHeader);
}

void sub_02025B40(NNSG3dResTex *tex, NNSG3dTexKey *texKey, NNSG3dTexKey *tex4x4Key, NNSG3dPlttKey *plttKey) {
    u32 texSize;
    u32 tex4x4Size;
    u32 plttSize;

    texSize = NNS_G3dTexGetRequiredSize(tex);
    tex4x4Size = NNS_G3dTex4x4GetRequiredSize(tex);
    plttSize = NNS_G3dPlttGetRequiredSize(tex);

    if (texSize != 0) {
        *texKey = NNS_GfdAllocTexVram(texSize, FALSE, 0);
    }
    if (tex4x4Size != 0) {
        *tex4x4Key = NNS_GfdAllocTexVram(tex4x4Size, TRUE, 0);
    }
    if (plttSize != 0) {
        *plttKey = NNS_GfdAllocPlttVram(plttSize, tex->tex4x4Info.flag & NNS_G3D_RESPLTT_USEPLTT4, 0);
    }
}

void sub_02025BB0(NNSG3dResTex *tex, struct UnkStruct_02025B04 *a1) {
    sub_02025BDC(tex, a1->texKey, a1->tex4x4Key, a1->plttKey);
    DC_FlushRange(tex, tex->header.size);
    Call_NNS_G3dTexLoad(tex, TRUE);
    Call_NNS_G3dPlttLoad(tex, TRUE);
}

void sub_02025BDC(NNSG3dResTex *tex, NNSG3dTexKey texKey, NNSG3dTexKey tex4x4Key, NNSG3dPlttKey plttKey) {
    NNS_G3dTexSetTexKey(tex, texKey, tex4x4Key);
    NNS_G3dPlttSetPlttKey(tex, plttKey);
}

void sub_02025BF0(NNSG3dResTex *tex) {
    NNSG3dTexKey texKey;
    NNSG3dTexKey tex4x4Key;
    NNS_G3dTexReleaseTexKey(tex, &texKey, &tex4x4Key);
    NNS_G3dPlttReleasePlttKey(tex);
}

void *sub_02025C08(const NNSG3dResFileHeader *a0, HeapID heapId) {
    u32 size = sub_02025C2C(a0);
    void *ret = AllocFromHeap(heapId, size);
    memcpy(ret, a0, size);
    return ret;
}

u32 sub_02025C2C(const NNSG3dResFileHeader *header) {
    NNSG3dResTex *tex = NNS_G3dGetTex(header);
    GF_ASSERT(tex != NULL);
    return (const u8 *)NNS_G3dGetTexData(tex) - (const u8 *)header;
}
