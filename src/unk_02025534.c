#include "global.h"
#include "unk_02025534.h"
#include "system.h"
#include "unk_0201F4C4.h"

static struct _2DGfxRawResObj *_2DGfxResMan_FindNextFreeObjSlot(struct _2DGfxRawResMan *resourceMgr);
void _2DGfxResObj_Init(struct _2DGfxRawResObj *resourceObj);
static void _3DGfxResMan_FreeObj(struct _3DGfxRawResMan *a0, struct _3DGfxRawResObj *a1);
static int Get3DGfxRawResObjId(struct _3DGfxRawResObj *a0);
static struct _3DGfxRawResObj *_3DGfxResMan_FindNextFreeObjSlot(const struct _3DGfxRawResMan *a0);
static void _3DGfxResObj_Init(struct _3DGfxRawResObj *a0);
static NNSG3dResTex *_3DGfxResObj_GetTex_Internal(struct _3DGfxRawResObj *a0);
static NNSG3dResTex *_3DGfxResObj_GetTex_MaybeFromSecondaryHeader(struct _3DGfxRawResObj *a0);
static void ResTexAllocVramAndGetKeys(NNSG3dResTex *tex, NNSG3dTexKey *texKey, NNSG3dTexKey *tex4x4Key, NNSG3dPlttKey *plttKey);
static void ResTexLoad(NNSG3dResTex *tex, struct _3DGfxRawResObj *a1);
static void ResTexSetKeys(NNSG3dResTex *tex, NNSG3dTexKey texKey, NNSG3dTexKey tex4x4Key, NNSG3dPlttKey plttKey);
static void ResTexReleaseKeys(NNSG3dResTex *tex);
static void *ResFileHeaderCopyWithoutTex(const NNSG3dResFileHeader *a0, HeapID heapId);
static u32 ResFileHeaderGetSizeWithoutTex(const NNSG3dResFileHeader *header);

struct _2DGfxRawResMan *Create2DGfxResMan(int num, HeapID heapId) {
    struct _2DGfxRawResMan *ret = AllocFromHeap(heapId, sizeof(struct _2DGfxRawResMan));
    int i;

    GF_ASSERT(ret != NULL);
    ret->vals = AllocFromHeap(heapId, num * sizeof(struct _2DGfxRawResObj));
    GF_ASSERT(ret->vals != NULL);
    for (i = 0; i < num; i++) {
        _2DGfxResObj_Init(&ret->vals[i]);
    }
    ret->max = num;
    ret->num = 0;
    return ret;
}

void Destroy2DGfxResMan(struct _2DGfxRawResMan *resourceMgr) {
    GF_ASSERT(resourceMgr != NULL);
    _2DGfxResMan_FreeAllObjs(resourceMgr);
    FreeToHeap(resourceMgr->vals);
    FreeToHeap(resourceMgr);
}

BOOL _2DGfxResMan_DoesNotHaveObjWithId(struct _2DGfxRawResMan *resourceMgr, int id) {
    GF_ASSERT(resourceMgr != NULL);
    return _2DGfxResMan_GetObjById(resourceMgr, id) == NULL;
}

struct _2DGfxRawResObj *_2DGfxResMan_AllocObj(struct _2DGfxRawResMan *resourceMgr, void *resource, int id) {
    GF_ASSERT(resourceMgr != NULL);
    struct _2DGfxRawResObj *obj = _2DGfxResMan_FindNextFreeObjSlot(resourceMgr);
    GF_ASSERT(obj != NULL);
    GF_ASSERT(_2DGfxResMan_DoesNotHaveObjWithId(resourceMgr, id) == TRUE);
    obj->data = resource;
    obj->id = id;
    ++resourceMgr->num;
    return obj;
}

struct _2DGfxRawResObj *_2DGfxResMan_ReadAndAllocObj(struct _2DGfxRawResMan *resourceMgr, const char *name, int id, HeapID heapId) {
    GF_ASSERT(resourceMgr != NULL);
    GF_ASSERT(name != NULL);
    struct _2DGfxRawResObj *obj = _2DGfxResMan_FindNextFreeObjSlot(resourceMgr);
    GF_ASSERT(obj != NULL);
    GF_ASSERT(_2DGfxResMan_DoesNotHaveObjWithId(resourceMgr, id) == TRUE);
    obj->data = Sys_AllocAndReadFile(heapId, name);
    GF_ASSERT(obj->data != NULL);
    obj->id = id;
    ++resourceMgr->num;
    return obj;
}

void _2DGfxResMan_FreeObj(struct _2DGfxRawResMan *resourceMgr, struct _2DGfxRawResObj *a1) {
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

void _2DGfxResMan_FreeAllObjs(struct _2DGfxRawResMan *resourceMgr) {
    int i;

    GF_ASSERT(resourceMgr != NULL);
    GF_ASSERT(resourceMgr->vals != NULL);
    for (i = 0; i < resourceMgr->max; ++i) {
        if (resourceMgr->vals[i].id != -1) {
            _2DGfxResMan_FreeObj(resourceMgr, &resourceMgr->vals[i]);
        }
    }
}

struct _2DGfxRawResObj *_2DGfxResMan_GetObjById(struct _2DGfxRawResMan *resourceMgr, int id) {
    int i;

    GF_ASSERT(resourceMgr != NULL);
    for (i = 0; i < resourceMgr->max; ++i) {
        if (resourceMgr->vals[i].id == id) {
            return &resourceMgr->vals[i];
        }
    }

    return NULL;
}

void *_2DGfxResObj_GetData(struct _2DGfxRawResObj *obj) {
    GF_ASSERT(obj != NULL);
    return obj->data;
}

void _2DGfxResObj_ReplaceData(struct _2DGfxRawResObj *obj, void *newPtr) {
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

static struct _2DGfxRawResObj *_2DGfxResMan_FindNextFreeObjSlot(struct _2DGfxRawResMan *resourceMgr) {
    int i;

    GF_ASSERT(resourceMgr != NULL);
    for (i = 0; i < resourceMgr->max; ++i) {
        if (resourceMgr->vals[i].id == -1) {
            return &resourceMgr->vals[i];
        }
    }

    return NULL;
}

void _2DGfxResObj_Init(struct _2DGfxRawResObj *obj) {
    GF_ASSERT(obj != NULL);
    obj->id = -1;
    obj->data = NULL;
}

// -----------------------------------------

struct _3DGfxRawResMan *Create3DGfxResMan(int num, HeapID heapId) {
    struct _3DGfxRawResMan *ret = AllocFromHeap(heapId, sizeof(struct _3DGfxRawResMan));
    ret->man = Create2DGfxResMan(num, heapId);
    ret->objs = AllocFromHeap(heapId, num * sizeof(struct _3DGfxRawResObj));
    for (int i = 0; i < num; ++i) {
        _3DGfxResObj_Init(&ret->objs[i]);
    }
    return ret;
}

void Destroy3DGfxResMan(struct _3DGfxRawResMan *a0) {
    GF_ASSERT(a0 != NULL);
    _3DGfxResMan_FreeAllObjs(a0);
    Destroy2DGfxResMan(a0->man);
    FreeToHeap(a0->objs);
    FreeToHeap(a0);
}

BOOL _3DGfxResMan_DoesNotHaveObjWithId(struct _3DGfxRawResMan *a0, int id) {
    GF_ASSERT(a0 != NULL);
    return _2DGfxResMan_DoesNotHaveObjWithId(a0->man, id);
}

struct _3DGfxRawResObj *_3DGfxResMan_AllocObj(struct _3DGfxRawResMan *man, void *a1, int a2, u32 a3, HeapID heapId) {
    struct _3DGfxRawResObj *ret;
    void *resource;
    GF_ASSERT(man != NULL);
    ret = _3DGfxResMan_FindNextFreeObjSlot(man);
    ret->unk_16 = a3;
    if (ret->unk_16 == TRUE) {
        resource = ResFileHeaderCopyWithoutTex(a1, heapId);
        ret->resFileHeader = a1;
    } else {
        resource = a1;
        ret->resFileHeader = NULL;
    }
    ret->obj = _2DGfxResMan_AllocObj(man->man, resource, a2);
    return ret;
}

struct _3DGfxRawResObj *_3DGfxResMan_AllocObjAndKeys(struct _3DGfxRawResMan *a0, void *a1, int a2, u32 a3, HeapID heapId) {
    struct _3DGfxRawResObj *ret = _3DGfxResMan_AllocObj(a0, a1, a2, a3, heapId);
    _3DGfxResObj_AllocVramAndGetKeys(ret);
    return ret;
}

static void _3DGfxResMan_FreeObj(struct _3DGfxRawResMan *a0, struct _3DGfxRawResObj *a1) {
    GF_ASSERT(a0 != NULL);
    GF_ASSERT(a1 != NULL);
    if (a1->unk_16 == TRUE && a1->unk_14 == 0) {
        FreeToHeap(a1->resFileHeader);
        a1->unk_16 = FALSE;
    }
    if (a1->obj != NULL) {
        _2DGfxResMan_FreeObj(a0->man, a1->obj);
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
    _3DGfxResObj_Init(a1);
}

void _3DGfxResMan_FreeObjById(struct _3DGfxRawResMan *a0, int a1) {
    GF_ASSERT(a0 != NULL);
    _3DGfxResMan_FreeObj(a0, _3DGfxResMan_GetObjById(a0, a1));
}

void _3DGfxResMan_FreeAllObjs(struct _3DGfxRawResMan *a0) {
    int i;

    GF_ASSERT(a0 != NULL);
    GF_ASSERT(a0->objs != NULL);

    for (i = 0; i < a0->man->max; ++i) {
        if (a0->objs[i].obj != NULL) {
            _3DGfxResMan_FreeObj(a0, &a0->objs[i]);
        }
    }
}

struct _3DGfxRawResObj *_3DGfxResMan_GetObjById(struct _3DGfxRawResMan *a0, int a1) {
    int i;
    int r0;

    GF_ASSERT(a0 != NULL);

    for (i = 0; i < a0->man->max; ++i) {
        if (a0->objs[i].obj != NULL) {
            r0 = Get3DGfxRawResObjId(&a0->objs[i]);
            if (r0 == a1) {
                return &a0->objs[i];
            }
        }
    }

    return NULL;
}

static int Get3DGfxRawResObjId(struct _3DGfxRawResObj *a0) {
    GF_ASSERT(a0 != NULL);
    return Get2DGfxRawResObjId(a0->obj);
}


NNSG3dResTex *_3DGfxResObj_GetTex(struct _3DGfxRawResObj *a0) {
    GF_ASSERT(a0 != NULL);
    return _3DGfxResObj_GetTex_Internal(a0);
}

void _3DGfxResObj_LoadTex(struct _3DGfxRawResObj *a0) {
    GF_ASSERT(a0 != NULL);
    GF_ASSERT(a0->unk_14 == 0);
    if (a0->plttKey == 0) {
        GF_ASSERT(FALSE);
        return;
    }
    ResTexLoad(_3DGfxResObj_GetTex_MaybeFromSecondaryHeader(a0), a0);
}

void _3DGfxResMan_LoadObjTexById(struct _3DGfxRawResMan *a0, int a1) {
    GF_ASSERT(a0 != NULL);
    _3DGfxResObj_LoadTex(_3DGfxResMan_GetObjById(a0, a1));
}

void _3DGfxResObj_FreeVramAndSecondaryHeader(struct _3DGfxRawResObj *a0) {
    GF_ASSERT(a0 != NULL);
    if (!a0->unk_16) {
        GF_ASSERT(FALSE);
        return;
    }
    if (a0->unk_14 != 0) {
        GF_ASSERT(FALSE);
        return;
    }
    ResTexReleaseKeys(_3DGfxResObj_GetTex_MaybeFromSecondaryHeader(a0));
    ResTexSetKeys(_3DGfxResObj_GetTex_Internal(a0), a0->texKey, a0->tex4x4Key, a0->plttKey);
    FreeToHeap(a0->resFileHeader);
    a0->resFileHeader = NULL;
    a0->unk_14 = 1;
}

void _3DGfxResMan_FreeObjVramAndSecondaryHeaderById(struct _3DGfxRawResMan *a0, int a1) {
    GF_ASSERT(a0 != NULL);
    _3DGfxResObj_FreeVramAndSecondaryHeader(_3DGfxResMan_GetObjById(a0, a1));
}

void _3DGfxResObj_AllocVramAndGetKeys(struct _3DGfxRawResObj *a0) {
    GF_ASSERT(a0 != NULL);
    GF_ASSERT(a0->unk_14 == 0);
    if (a0->plttKey != 0) {
        GF_ASSERT(FALSE);
        return;
    }
    ResTexAllocVramAndGetKeys(_3DGfxResObj_GetTex_MaybeFromSecondaryHeader(a0), &a0->texKey, &a0->tex4x4Key, &a0->plttKey);
}

NNSG3dTexKey _3DGfxResObj_GetTexKey(struct _3DGfxRawResObj *a0) {
    GF_ASSERT(a0 != NULL);
    return a0->texKey;
}

NNSG3dTexKey _3DGfxResObj_GetTex4x4Key(struct _3DGfxRawResObj *a0) {
    GF_ASSERT(a0 != NULL);
    return a0->tex4x4Key;
}

NNSG3dPlttKey _3DGfxResObj_GetPlttKey(struct _3DGfxRawResObj *a0) {
    GF_ASSERT(a0 != NULL);
    return a0->plttKey;
}

u32 G3dResFileHeader_GetSizeWithoutTex(const NNSG3dResFileHeader *header) {
    return ResFileHeaderGetSizeWithoutTex(header);
}

static struct _3DGfxRawResObj *_3DGfxResMan_FindNextFreeObjSlot(const struct _3DGfxRawResMan *a0) {
    for (int i = 0; i < a0->man->max; ++i) {
        if (a0->objs[i].obj == NULL) {
            return &a0->objs[i];
        }
    }

    return NULL;
}

static void _3DGfxResObj_Init(struct _3DGfxRawResObj *a0) {
    a0->obj = NULL;
    a0->texKey = 0;
    a0->tex4x4Key = 0;
    a0->plttKey = 0;
    a0->unk_14 = 0;
    a0->resFileHeader = NULL;
    a0->unk_14 = 0;  // BUG: should be unk_16?
}

static NNSG3dResTex *_3DGfxResObj_GetTex_Internal(struct _3DGfxRawResObj *a0) {
    return NNS_G3dGetTex(_2DGfxResObj_GetData(a0->obj));
}

static NNSG3dResTex *_3DGfxResObj_GetTex_MaybeFromSecondaryHeader(struct _3DGfxRawResObj *a0) {
    return NNS_G3dGetTex(!a0->unk_16 ? _2DGfxResObj_GetData(a0->obj) : a0->resFileHeader);
}

static void ResTexAllocVramAndGetKeys(NNSG3dResTex *tex, NNSG3dTexKey *texKey, NNSG3dTexKey *tex4x4Key, NNSG3dPlttKey *plttKey) {
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

static void ResTexLoad(NNSG3dResTex *tex, struct _3DGfxRawResObj *a1) {
    ResTexSetKeys(tex, a1->texKey, a1->tex4x4Key, a1->plttKey);
    DC_FlushRange(tex, tex->header.size);
    Call_NNS_G3dTexLoad(tex, TRUE);
    Call_NNS_G3dPlttLoad(tex, TRUE);
}

static void ResTexSetKeys(NNSG3dResTex *tex, NNSG3dTexKey texKey, NNSG3dTexKey tex4x4Key, NNSG3dPlttKey plttKey) {
    NNS_G3dTexSetTexKey(tex, texKey, tex4x4Key);
    NNS_G3dPlttSetPlttKey(tex, plttKey);
}

static void ResTexReleaseKeys(NNSG3dResTex *tex) {
    NNSG3dTexKey texKey;
    NNSG3dTexKey tex4x4Key;
    NNS_G3dTexReleaseTexKey(tex, &texKey, &tex4x4Key);
    NNS_G3dPlttReleasePlttKey(tex);
}

static void *ResFileHeaderCopyWithoutTex(const NNSG3dResFileHeader *a0, HeapID heapId) {
    u32 size = ResFileHeaderGetSizeWithoutTex(a0);
    void *ret = AllocFromHeap(heapId, size);
    memcpy(ret, a0, size);
    return ret;
}

static u32 ResFileHeaderGetSizeWithoutTex(const NNSG3dResFileHeader *header) {
    NNSG3dResTex *tex = NNS_G3dGetTex(header);
    GF_ASSERT(tex != NULL);
    return (const u8 *)NNS_G3dGetTexData(tex) - (const u8 *)header;
}
