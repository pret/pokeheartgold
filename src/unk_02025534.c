#include "global.h"

#include "gf_3d_loader.h"
#include "gf_3d_render.h"
#include "system.h"

static GF_2DGfxRawResObj *GF2DGfxResMan_FindNextFreeObjSlot(GF_2DGfxRawResMan *resourceMgr);
static void GF2DGfxResObj_Init(GF_2DGfxRawResObj *resourceObj);
static void GF_3DGfxResMan_FreeObj(GF_3DGfxRawResMan *man, GF_3DGfxRawResObj *obj);
static int Get3DGfxRawResObjId(GF_3DGfxRawResObj *obj);
static GF_3DGfxRawResObj *GF_3DGfxResMan_FindNextFreeObjSlot(const GF_3DGfxRawResMan *man);
static void GF_3DGfxResObj_Init(GF_3DGfxRawResObj *obj);
static NNSG3dResTex *GF_3DGfxResObj_GetTex_Internal(GF_3DGfxRawResObj *obj);
static NNSG3dResTex *GF_3DGfxResObj_GetTex_MaybeFromSecondaryHeader(GF_3DGfxRawResObj *obj);
static void ResTexAllocVramAndGetKeys(NNSG3dResTex *tex, NNSG3dTexKey *texKey, NNSG3dTexKey *tex4x4Key, NNSG3dPlttKey *plttKey);
static void ResTexLoad(NNSG3dResTex *tex, GF_3DGfxRawResObj *obj);
static void ResTexSetKeys(NNSG3dResTex *tex, NNSG3dTexKey texKey, NNSG3dTexKey tex4x4Key, NNSG3dPlttKey plttKey);
static void ResTexReleaseKeys(NNSG3dResTex *tex);
static void *ResFileHeaderCopyWithoutTex(const NNSG3dResFileHeader *header, HeapID heapId);
static u32 ResFileHeaderGetSizeWithoutTex(const NNSG3dResFileHeader *header);

// -----------------------------------------
// 2D graphics
// -----------------------------------------

GF_2DGfxRawResMan *GF2dGfxRawResMan_Create(int num, HeapID heapId) {
    GF_2DGfxRawResMan *ret = AllocFromHeap(heapId, sizeof(GF_2DGfxRawResMan));
    int i;

    GF_ASSERT(ret != NULL);
    ret->vals = AllocFromHeap(heapId, num * sizeof(GF_2DGfxRawResObj));
    GF_ASSERT(ret->vals != NULL);
    for (i = 0; i < num; i++) {
        GF2DGfxResObj_Init(&ret->vals[i]);
    }
    ret->max = num;
    ret->num = 0;
    return ret;
}

void GF2dGfxRawResObj_Destroy(GF_2DGfxRawResMan *resourceMgr) {
    GF_ASSERT(resourceMgr != NULL);
    GF2dGfxRawResMan_FreeAllObjs(resourceMgr);
    Heap_Free(resourceMgr->vals);
    Heap_Free(resourceMgr);
}

BOOL GF2dGfxRawResMan_DoesNotHaveObjWithId(GF_2DGfxRawResMan *resourceMgr, int id) {
    GF_ASSERT(resourceMgr != NULL);
    return GF2dGfxRawResMan_GetObjById(resourceMgr, id) == NULL;
}

GF_2DGfxRawResObj *GF2dGfxRawResMan_AllocObj(GF_2DGfxRawResMan *resourceMgr, void *resource, int id) {
    GF_ASSERT(resourceMgr != NULL);
    GF_2DGfxRawResObj *obj = GF2DGfxResMan_FindNextFreeObjSlot(resourceMgr);
    GF_ASSERT(obj != NULL);
    GF_ASSERT(GF2dGfxRawResMan_DoesNotHaveObjWithId(resourceMgr, id) == TRUE);
    obj->data = resource;
    obj->id = id;
    ++resourceMgr->num;
    return obj;
}

GF_2DGfxRawResObj *GF2dGfxRawResMan_ReadAndAllocObj(GF_2DGfxRawResMan *resourceMgr, const char *name, int id, HeapID heapId) {
    GF_ASSERT(resourceMgr != NULL);
    GF_ASSERT(name != NULL);
    GF_2DGfxRawResObj *obj = GF2DGfxResMan_FindNextFreeObjSlot(resourceMgr);
    GF_ASSERT(obj != NULL);
    GF_ASSERT(GF2dGfxRawResMan_DoesNotHaveObjWithId(resourceMgr, id) == TRUE);
    obj->data = Sys_AllocAndReadFile(heapId, name);
    GF_ASSERT(obj->data != NULL);
    obj->id = id;
    ++resourceMgr->num;
    return obj;
}

void GF2dGfxRawResMan_FreeObj(GF_2DGfxRawResMan *resourceMgr, GF_2DGfxRawResObj *obj) {
    GF_ASSERT(resourceMgr != NULL);
    GF_ASSERT(obj != NULL);
    if (obj->data != NULL) {
        Heap_Free(obj->data);
        obj->data = NULL;
    }
    obj->id = -1;
    --resourceMgr->num;
}

void GF2dGfxRawResMan_FreeAllObjs(GF_2DGfxRawResMan *resourceMgr) {
    int i;

    GF_ASSERT(resourceMgr != NULL);
    GF_ASSERT(resourceMgr->vals != NULL);
    for (i = 0; i < resourceMgr->max; ++i) {
        if (resourceMgr->vals[i].id != -1) {
            GF2dGfxRawResMan_FreeObj(resourceMgr, &resourceMgr->vals[i]);
        }
    }
}

GF_2DGfxRawResObj *GF2dGfxRawResMan_GetObjById(GF_2DGfxRawResMan *resourceMgr, int id) {
    int i;

    GF_ASSERT(resourceMgr != NULL);
    for (i = 0; i < resourceMgr->max; ++i) {
        if (resourceMgr->vals[i].id == id) {
            return &resourceMgr->vals[i];
        }
    }

    return NULL;
}

void *GF2dGfxRawResObj_GetData(GF_2DGfxRawResObj *obj) {
    GF_ASSERT(obj != NULL);
    return obj->data;
}

void GF2dGfxRawResObj_ReplaceData(GF_2DGfxRawResObj *obj, void *newPtr) {
    GF_ASSERT(obj != NULL);
    if (obj->data != NULL) {
        Heap_Free(obj->data);
    }
    obj->data = newPtr;
}

int Get2DGfxRawResObjId(GF_2DGfxRawResObj *obj) {
    GF_ASSERT(obj != NULL);
    return obj->id;
}

static GF_2DGfxRawResObj *GF2DGfxResMan_FindNextFreeObjSlot(GF_2DGfxRawResMan *resourceMgr) {
    int i;

    GF_ASSERT(resourceMgr != NULL);
    for (i = 0; i < resourceMgr->max; ++i) {
        if (resourceMgr->vals[i].id == -1) {
            return &resourceMgr->vals[i];
        }
    }

    return NULL;
}

static void GF2DGfxResObj_Init(GF_2DGfxRawResObj *obj) {
    GF_ASSERT(obj != NULL);
    obj->id = -1;
    obj->data = NULL;
}

// -----------------------------------------
// 3D graphics
// -----------------------------------------

GF_3DGfxRawResMan *GF3dGfxRawResMan_Create(int num, HeapID heapId) {
    GF_3DGfxRawResMan *ret = AllocFromHeap(heapId, sizeof(GF_3DGfxRawResMan));
    ret->man = GF2dGfxRawResMan_Create(num, heapId);
    ret->objs = AllocFromHeap(heapId, num * sizeof(GF_3DGfxRawResObj));
    for (int i = 0; i < num; ++i) {
        GF_3DGfxResObj_Init(&ret->objs[i]);
    }
    return ret;
}

void GF3dGfxRawResMan_Destroy(GF_3DGfxRawResMan *man) {
    GF_ASSERT(man != NULL);
    GF3dGfxRawResMan_FreeAllObjs(man);
    GF2dGfxRawResObj_Destroy(man->man);
    Heap_Free(man->objs);
    Heap_Free(man);
}

BOOL GF3dGfxRawResMan_DoesNotHaveObjWithId(GF_3DGfxRawResMan *man, int id) {
    GF_ASSERT(man != NULL);
    return GF2dGfxRawResMan_DoesNotHaveObjWithId(man->man, id);
}

GF_3DGfxRawResObj *GF3dGfxRawResMan_AllocObj(GF_3DGfxRawResMan *man, void *resource, int id, BOOL shouldCopyWithoutTex, HeapID heapId) {
    GF_3DGfxRawResObj *ret;
    void *newResource;
    GF_ASSERT(man != NULL);
    ret = GF_3DGfxResMan_FindNextFreeObjSlot(man);
    ret->headerNeedsLoad = shouldCopyWithoutTex;
    if (ret->headerNeedsLoad == TRUE) {
        newResource = ResFileHeaderCopyWithoutTex(resource, heapId);
        ret->resFileHeader = resource;
    } else {
        newResource = resource;
        ret->resFileHeader = NULL;
    }
    ret->obj = GF2dGfxRawResMan_AllocObj(man->man, newResource, id);
    return ret;
}

GF_3DGfxRawResObj *GF3dGfxRawResMan_AllocObjAndKeys(GF_3DGfxRawResMan *man, void *resource, int id, BOOL shouldCopyWithoutTex, HeapID heapId) {
    GF_3DGfxRawResObj *ret = GF3dGfxRawResMan_AllocObj(man, resource, id, shouldCopyWithoutTex, heapId);
    GF3dGfxRawResObj_AllocVramAndGetKeys(ret);
    return ret;
}

static void GF_3DGfxResMan_FreeObj(GF_3DGfxRawResMan *man, GF_3DGfxRawResObj *obj) {
    GF_ASSERT(man != NULL);
    GF_ASSERT(obj != NULL);
    if (obj->headerNeedsLoad == TRUE && obj->hasLoadedFromHeader == FALSE) {
        Heap_Free(obj->resFileHeader);
        obj->headerNeedsLoad = FALSE;
    }
    if (obj->obj != NULL) {
        GF2dGfxRawResMan_FreeObj(man->man, obj->obj);
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
    GF_3DGfxResObj_Init(obj);
}

void GF3dGfxRawResMan_FreeObjById(GF_3DGfxRawResMan *man, int id) {
    GF_ASSERT(man != NULL);
    GF_3DGfxResMan_FreeObj(man, GF3dGfxRawResMan_GetObjById(man, id));
}

void GF3dGfxRawResMan_FreeAllObjs(GF_3DGfxRawResMan *man) {
    int i;

    GF_ASSERT(man != NULL);
    GF_ASSERT(man->objs != NULL);

    for (i = 0; i < man->man->max; ++i) {
        if (man->objs[i].obj != NULL) {
            GF_3DGfxResMan_FreeObj(man, &man->objs[i]);
        }
    }
}

GF_3DGfxRawResObj *GF3dGfxRawResMan_GetObjById(GF_3DGfxRawResMan *man, int id) {
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

static int Get3DGfxRawResObjId(GF_3DGfxRawResObj *obj) {
    GF_ASSERT(obj != NULL);
    return Get2DGfxRawResObjId(obj->obj);
}

NNSG3dResTex *GF3dGfxRawResObj_GetTex(GF_3DGfxRawResObj *obj) {
    GF_ASSERT(obj != NULL);
    return GF_3DGfxResObj_GetTex_Internal(obj);
}

void GF3dGfxRawResObj_LoadTex(GF_3DGfxRawResObj *obj) {
    GF_ASSERT(obj != NULL);
    GF_ASSERT(!obj->hasLoadedFromHeader);
    if (obj->plttKey == 0) {
        GF_ASSERT(FALSE);
        return;
    }
    ResTexLoad(GF_3DGfxResObj_GetTex_MaybeFromSecondaryHeader(obj), obj);
}

void GF3dGfxRawResMan_LoadObjTexById(GF_3DGfxRawResMan *man, int id) {
    GF_ASSERT(man != NULL);
    GF3dGfxRawResObj_LoadTex(GF3dGfxRawResMan_GetObjById(man, id));
}

void GF3dGfxRawResObj_FreeVramAndSecondaryHeader(GF_3DGfxRawResObj *obj) {
    GF_ASSERT(obj != NULL);
    if (!obj->headerNeedsLoad) {
        GF_ASSERT(FALSE);
        return;
    }
    if (obj->hasLoadedFromHeader) {
        GF_ASSERT(FALSE);
        return;
    }
    ResTexReleaseKeys(GF_3DGfxResObj_GetTex_MaybeFromSecondaryHeader(obj));
    ResTexSetKeys(GF_3DGfxResObj_GetTex_Internal(obj), obj->texKey, obj->tex4x4Key, obj->plttKey);
    Heap_Free(obj->resFileHeader);
    obj->resFileHeader = NULL;
    obj->hasLoadedFromHeader = TRUE;
}

void GF3dGfxRawResMan_FreeObjVramAndSecondaryHeaderById(GF_3DGfxRawResMan *obj, int id) {
    GF_ASSERT(obj != NULL);
    GF3dGfxRawResObj_FreeVramAndSecondaryHeader(GF3dGfxRawResMan_GetObjById(obj, id));
}

void GF3dGfxRawResObj_AllocVramAndGetKeys(GF_3DGfxRawResObj *obj) {
    GF_ASSERT(obj != NULL);
    GF_ASSERT(!obj->hasLoadedFromHeader);
    if (obj->plttKey != 0) {
        GF_ASSERT(FALSE);
        return;
    }
    ResTexAllocVramAndGetKeys(GF_3DGfxResObj_GetTex_MaybeFromSecondaryHeader(obj), &obj->texKey, &obj->tex4x4Key, &obj->plttKey);
}

NNSG3dTexKey GF3dGfxRawResObj_GetTexKey(GF_3DGfxRawResObj *obj) {
    GF_ASSERT(obj != NULL);
    return obj->texKey;
}

NNSG3dTexKey GF3dGfxRawResObj_GetTex4x4Key(GF_3DGfxRawResObj *obj) {
    GF_ASSERT(obj != NULL);
    return obj->tex4x4Key;
}

NNSG3dPlttKey GF3dGfxRawResObj_GetPlttKey(GF_3DGfxRawResObj *obj) {
    GF_ASSERT(obj != NULL);
    return obj->plttKey;
}

u32 G3dResFileHeader_GetSizeWithoutTex(const NNSG3dResFileHeader *header) {
    return ResFileHeaderGetSizeWithoutTex(header);
}

static GF_3DGfxRawResObj *GF_3DGfxResMan_FindNextFreeObjSlot(const GF_3DGfxRawResMan *obj) {
    for (int i = 0; i < obj->man->max; ++i) {
        if (obj->objs[i].obj == NULL) {
            return &obj->objs[i];
        }
    }

    return NULL;
}

static void GF_3DGfxResObj_Init(GF_3DGfxRawResObj *obj) {
    obj->obj = NULL;
    obj->texKey = 0;
    obj->tex4x4Key = 0;
    obj->plttKey = 0;
    obj->hasLoadedFromHeader = FALSE;
    obj->resFileHeader = NULL;
    obj->hasLoadedFromHeader = FALSE; // BUG: should be headerNeedsLoad?
}

static NNSG3dResTex *GF_3DGfxResObj_GetTex_Internal(GF_3DGfxRawResObj *obj) {
    return NNS_G3dGetTex(GF2dGfxRawResObj_GetData(obj->obj));
}

static NNSG3dResTex *GF_3DGfxResObj_GetTex_MaybeFromSecondaryHeader(GF_3DGfxRawResObj *obj) {
    return NNS_G3dGetTex(!obj->headerNeedsLoad ? GF2dGfxRawResObj_GetData(obj->obj) : obj->resFileHeader);
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

static void ResTexLoad(NNSG3dResTex *tex, GF_3DGfxRawResObj *obj) {
    ResTexSetKeys(tex, obj->texKey, obj->tex4x4Key, obj->plttKey);
    DC_FlushRange(tex, tex->header.size);
    GF3dRender_LoadTexture(tex, TRUE);
    GF3dRender_LoadPalette(tex, TRUE);
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
