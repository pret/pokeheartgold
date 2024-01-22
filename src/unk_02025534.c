#include "global.h"
#include "unk_02025534.h"
#include "system.h"
#include "unk_0201F4C4.h"

static struct _2DGfxRawResObj *_2DGfxResMan_FindNextFreeObjSlot(struct _2DGfxRawResMan *resourceMgr);
void _2DGfxResObj_Init(struct _2DGfxRawResObj *resourceObj);
static void _3DGfxResMan_FreeObj(struct _3DGfxRawResMan *man, struct _3DGfxRawResObj *obj);
static int Get3DGfxRawResObjId(struct _3DGfxRawResObj *obj);
static struct _3DGfxRawResObj *_3DGfxResMan_FindNextFreeObjSlot(const struct _3DGfxRawResMan *man);
static void _3DGfxResObj_Init(struct _3DGfxRawResObj *obj);
static NNSG3dResTex *_3DGfxResObj_GetTex_Internal(struct _3DGfxRawResObj *obj);
static NNSG3dResTex *_3DGfxResObj_GetTex_MaybeFromSecondaryHeader(struct _3DGfxRawResObj *obj);
static void ResTexAllocVramAndGetKeys(NNSG3dResTex *tex, NNSG3dTexKey *texKey, NNSG3dTexKey *tex4x4Key, NNSG3dPlttKey *plttKey);
static void ResTexLoad(NNSG3dResTex *tex, struct _3DGfxRawResObj *obj);
static void ResTexSetKeys(NNSG3dResTex *tex, NNSG3dTexKey texKey, NNSG3dTexKey tex4x4Key, NNSG3dPlttKey plttKey);
static void ResTexReleaseKeys(NNSG3dResTex *tex);
static void *ResFileHeaderCopyWithoutTex(const NNSG3dResFileHeader *header, HeapID heapId);
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

void _2DGfxResMan_FreeObj(struct _2DGfxRawResMan *resourceMgr, struct _2DGfxRawResObj *obj) {
    GF_ASSERT(resourceMgr != NULL);
    GF_ASSERT(obj != NULL);
    if (obj->data != NULL) {
        FreeToHeap(obj->data);
        obj->data = NULL;
    }
    obj->id = -1;
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

void Destroy3DGfxResMan(struct _3DGfxRawResMan *man) {
    GF_ASSERT(man != NULL);
    _3DGfxResMan_FreeAllObjs(man);
    Destroy2DGfxResMan(man->man);
    FreeToHeap(man->objs);
    FreeToHeap(man);
}

BOOL _3DGfxResMan_DoesNotHaveObjWithId(struct _3DGfxRawResMan *man, int id) {
    GF_ASSERT(man != NULL);
    return _2DGfxResMan_DoesNotHaveObjWithId(man->man, id);
}

struct _3DGfxRawResObj *_3DGfxResMan_AllocObj(struct _3DGfxRawResMan *man, void *resource, int id, BOOL shouldCopyWithoutTex, HeapID heapId) {
    struct _3DGfxRawResObj *ret;
    void *newResource;
    GF_ASSERT(man != NULL);
    ret = _3DGfxResMan_FindNextFreeObjSlot(man);
    ret->headerNeedsLoad = shouldCopyWithoutTex;
    if (ret->headerNeedsLoad == TRUE) {
        newResource = ResFileHeaderCopyWithoutTex(resource, heapId);
        ret->resFileHeader = resource;
    } else {
        newResource = resource;
        ret->resFileHeader = NULL;
    }
    ret->obj = _2DGfxResMan_AllocObj(man->man, newResource, id);
    return ret;
}

struct _3DGfxRawResObj *_3DGfxResMan_AllocObjAndKeys(struct _3DGfxRawResMan *man, void *resource, int id, BOOL shouldCopyWithoutTex, HeapID heapId) {
    struct _3DGfxRawResObj *ret = _3DGfxResMan_AllocObj(man, resource, id, shouldCopyWithoutTex, heapId);
    _3DGfxResObj_AllocVramAndGetKeys(ret);
    return ret;
}

static void _3DGfxResMan_FreeObj(struct _3DGfxRawResMan *man, struct _3DGfxRawResObj *obj) {
    GF_ASSERT(man != NULL);
    GF_ASSERT(obj != NULL);
    if (obj->headerNeedsLoad == TRUE && obj->hasLoadedFromHeader == FALSE) {
        FreeToHeap(obj->resFileHeader);
        obj->headerNeedsLoad = FALSE;
    }
    if (obj->obj != NULL) {
        _2DGfxResMan_FreeObj(man->man, obj->obj);
    }
    if (obj->texKey != 0) {
        GF_ASSERT(!NNS_GfdFreeTexVram(obj->texKey));
    }
    if (obj->tex4x4Key != 0) {
        GF_ASSERT(!NNS_GfdFreeTexVram(obj->tex4x4Key));
    }
    if (obj->plttKey != 0) {
        GF_ASSERT(!NNS_GfdFreePlttVram(obj->plttKey));
    }
    _3DGfxResObj_Init(obj);
}

void _3DGfxResMan_FreeObjById(struct _3DGfxRawResMan *man, int id) {
    GF_ASSERT(man != NULL);
    _3DGfxResMan_FreeObj(man, _3DGfxResMan_GetObjById(man, id));
}

void _3DGfxResMan_FreeAllObjs(struct _3DGfxRawResMan *man) {
    int i;

    GF_ASSERT(man != NULL);
    GF_ASSERT(man->objs != NULL);

    for (i = 0; i < man->man->max; ++i) {
        if (man->objs[i].obj != NULL) {
            _3DGfxResMan_FreeObj(man, &man->objs[i]);
        }
    }
}

struct _3DGfxRawResObj *_3DGfxResMan_GetObjById(struct _3DGfxRawResMan *man, int id) {
    int i;
    int idTemp;

    GF_ASSERT(man != NULL);

    for (i = 0; i < man->man->max; ++i) {
        if (man->objs[i].obj != NULL) {
            idTemp = Get3DGfxRawResObjId(&man->objs[i]);
            if (idTemp == id) {
                return &man->objs[i];
            }
        }
    }

    return NULL;
}

static int Get3DGfxRawResObjId(struct _3DGfxRawResObj *obj) {
    GF_ASSERT(obj != NULL);
    return Get2DGfxRawResObjId(obj->obj);
}


NNSG3dResTex *_3DGfxResObj_GetTex(struct _3DGfxRawResObj *obj) {
    GF_ASSERT(obj != NULL);
    return _3DGfxResObj_GetTex_Internal(obj);
}

void _3DGfxResObj_LoadTex(struct _3DGfxRawResObj *obj) {
    GF_ASSERT(obj != NULL);
    GF_ASSERT(!obj->hasLoadedFromHeader);
    if (obj->plttKey == 0) {
        GF_ASSERT(FALSE);
        return;
    }
    ResTexLoad(_3DGfxResObj_GetTex_MaybeFromSecondaryHeader(obj), obj);
}

void _3DGfxResMan_LoadObjTexById(struct _3DGfxRawResMan *man, int id) {
    GF_ASSERT(man != NULL);
    _3DGfxResObj_LoadTex(_3DGfxResMan_GetObjById(man, id));
}

void _3DGfxResObj_FreeVramAndSecondaryHeader(struct _3DGfxRawResObj *obj) {
    GF_ASSERT(obj != NULL);
    if (!obj->headerNeedsLoad) {
        GF_ASSERT(FALSE);
        return;
    }
    if (obj->hasLoadedFromHeader) {
        GF_ASSERT(FALSE);
        return;
    }
    ResTexReleaseKeys(_3DGfxResObj_GetTex_MaybeFromSecondaryHeader(obj));
    ResTexSetKeys(_3DGfxResObj_GetTex_Internal(obj), obj->texKey, obj->tex4x4Key, obj->plttKey);
    FreeToHeap(obj->resFileHeader);
    obj->resFileHeader = NULL;
    obj->hasLoadedFromHeader = TRUE;
}

void _3DGfxResMan_FreeObjVramAndSecondaryHeaderById(struct _3DGfxRawResMan *obj, int id) {
    GF_ASSERT(obj != NULL);
    _3DGfxResObj_FreeVramAndSecondaryHeader(_3DGfxResMan_GetObjById(obj, id));
}

void _3DGfxResObj_AllocVramAndGetKeys(struct _3DGfxRawResObj *obj) {
    GF_ASSERT(obj != NULL);
    GF_ASSERT(!obj->hasLoadedFromHeader);
    if (obj->plttKey != 0) {
        GF_ASSERT(FALSE);
        return;
    }
    ResTexAllocVramAndGetKeys(_3DGfxResObj_GetTex_MaybeFromSecondaryHeader(obj), &obj->texKey, &obj->tex4x4Key, &obj->plttKey);
}

NNSG3dTexKey _3DGfxResObj_GetTexKey(struct _3DGfxRawResObj *obj) {
    GF_ASSERT(obj != NULL);
    return obj->texKey;
}

NNSG3dTexKey _3DGfxResObj_GetTex4x4Key(struct _3DGfxRawResObj *obj) {
    GF_ASSERT(obj != NULL);
    return obj->tex4x4Key;
}

NNSG3dPlttKey _3DGfxResObj_GetPlttKey(struct _3DGfxRawResObj *obj) {
    GF_ASSERT(obj != NULL);
    return obj->plttKey;
}

u32 G3dResFileHeader_GetSizeWithoutTex(const NNSG3dResFileHeader *header) {
    return ResFileHeaderGetSizeWithoutTex(header);
}

static struct _3DGfxRawResObj *_3DGfxResMan_FindNextFreeObjSlot(const struct _3DGfxRawResMan *obj) {
    for (int i = 0; i < obj->man->max; ++i) {
        if (obj->objs[i].obj == NULL) {
            return &obj->objs[i];
        }
    }

    return NULL;
}

static void _3DGfxResObj_Init(struct _3DGfxRawResObj *obj) {
    obj->obj = NULL;
    obj->texKey = 0;
    obj->tex4x4Key = 0;
    obj->plttKey = 0;
    obj->hasLoadedFromHeader = FALSE;
    obj->resFileHeader = NULL;
    obj->hasLoadedFromHeader = FALSE;  // BUG: should be headerNeedsLoad?
}

static NNSG3dResTex *_3DGfxResObj_GetTex_Internal(struct _3DGfxRawResObj *obj) {
    return NNS_G3dGetTex(_2DGfxResObj_GetData(obj->obj));
}

static NNSG3dResTex *_3DGfxResObj_GetTex_MaybeFromSecondaryHeader(struct _3DGfxRawResObj *obj) {
    return NNS_G3dGetTex(!obj->headerNeedsLoad ? _2DGfxResObj_GetData(obj->obj) : obj->resFileHeader);
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

static void ResTexLoad(NNSG3dResTex *tex, struct _3DGfxRawResObj *obj) {
    ResTexSetKeys(tex, obj->texKey, obj->tex4x4Key, obj->plttKey);
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

static void *ResFileHeaderCopyWithoutTex(const NNSG3dResFileHeader *header, HeapID heapId) {
    u32 size = ResFileHeaderGetSizeWithoutTex(header);
    void *ret = AllocFromHeap(heapId, size);
    memcpy(ret, header, size);
    return ret;
}

static u32 ResFileHeaderGetSizeWithoutTex(const NNSG3dResFileHeader *header) {
    NNSG3dResTex *tex = NNS_G3dGetTex(header);
    GF_ASSERT(tex != NULL);
    return (const u8 *)NNS_G3dGetTexData(tex) - (const u8 *)header;
}
