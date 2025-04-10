#include "unk_0200A090.h"

#include "global.h"

#include "gf_gfx_loader.h"

static void loadAll2DGfxResObjFromHeaderInternal(GF_2DGfxResMan *mgr, const GF_2DGfxResHeader *header, int first, int count, GF_2DGfxResObjList *list, HeapID heapId);
static void destroyAllObjects(GF_2DGfxResMan *mgr);
static SpriteResource *GF2DGfxResMan_GetFreeObject(GF_2DGfxResMan *mgr);
static struct CharResExtraData *GetResourceExtraCharData(void *resource, NNS_G2D_VRAM_TYPE vram, HeapID heapId);
static struct PlttResExtraData *GetResourceExtraPlttData(void *resource, NNS_G2D_VRAM_TYPE vram, int pltt_num, HeapID heapId);
static struct CellResExtraData *GetResourceExtraCellData(void *resource, HeapID heapId);
static struct AnimResExtraData *GetResourceExtraAnimData(void *resource, HeapID heapId);
static struct MulticellResExtraData *GetResourceExtraMulticellData(void *resource, HeapID heapId);
static struct MultianimResExtraData *GetResourceExtraMultianimData(void *resource, HeapID heapId);
static void destroyResObjExtra(SpriteResource *obj);
static void *getResObjExtra(SpriteResource *obj);
static void Add2DGfxResObjFromFile(GF_2DGfxResMan *mgr, SpriteResource *obj, char *name, int id, NNS_G2D_VRAM_TYPE vram, int pltt_num, GfGfxResType type, HeapID heapId);
static void Add2DGfxResObjFromNarc(GF_2DGfxResMan *mgr, SpriteResource *obj, NarcId narcId, int fileId, BOOL compressed, int id, NNS_G2D_VRAM_TYPE vram, int pltt_num, GfGfxResType type, HeapID heapId, BOOL atEnd);
static void Add2DGfxResObjFromOpenNarc(GF_2DGfxResMan *mgr, SpriteResource *obj, NARC *narc, int fileId, BOOL compressed, int id, NNS_G2D_VRAM_TYPE vram, int pltt_num, GfGfxResType type, HeapID heapId, BOOL atEnd);
static int GF2DGfxResHeaderNarc_CountObjects(const GF_2DGfxResHeaderNarc *a0);
static void *loadResourceFromNarc(NARC *narc, int fileId, BOOL compressed, HeapID heapId, BOOL atEnd);

GF_2DGfxResMan *Create2DGfxResObjMan(int num, GfGfxResType type, HeapID heapId) {
    GF_2DGfxResMan *ret = AllocFromHeap(heapId, sizeof(GF_2DGfxResMan));
    ret->resourceMgr = GF2dGfxRawResMan_Create(num, heapId);
    ret->objects = AllocFromHeap(heapId, num * sizeof(SpriteResource));
    memset(ret->objects, 0, num * sizeof(SpriteResource));
    ret->max = num;
    ret->num = 0;
    ret->type = type;
    return ret;
}

void Destroy2DGfxResObjMan(GF_2DGfxResMan *mgr) {
    GF_ASSERT(mgr != NULL);
    GF_ASSERT(mgr->resourceMgr != NULL);
    GF_ASSERT(mgr->objects != NULL);
    destroyAllObjects(mgr);
    GF2dGfxRawResObj_Destroy(mgr->resourceMgr);
    mgr->resourceMgr = NULL;
    FreeToHeap(mgr->objects);
    mgr->objects = NULL;
    FreeToHeap(mgr);
}

SpriteResource *Add2DGfxResObjFromHeader(GF_2DGfxResMan *mgr, const GF_2DGfxResHeader *header, int idx, HeapID heapId) {
    SpriteResource *ret;
    GF_2DGfxResHeaderFile *headerFile;
    GF_2DGfxResHeaderNarc *headerNarc;

    GF_ASSERT(mgr != NULL);
    GF_ASSERT(header != NULL);
    GF_ASSERT(header->num > idx);
    GF_ASSERT(mgr->type == header->type);

    ret = GF2DGfxResMan_GetFreeObject(mgr);
    GF_ASSERT(ret != NULL);
    if (!header->isNarc) {
        headerFile = &((GF_2DGfxResHeaderFile *)header->table)[idx];
        GF_ASSERT(GF2DGfxResObjExistsById(mgr, headerFile->id) == TRUE);
        Add2DGfxResObjFromFile(mgr, ret, headerFile->filename, headerFile->id, (NNS_G2D_VRAM_TYPE)headerFile->extra[0], headerFile->extra[1], header->type, heapId);
    } else {
        headerNarc = &((GF_2DGfxResHeaderNarc *)header->table)[idx];
        GF_ASSERT(GF2DGfxResObjExistsById(mgr, headerNarc->id) == TRUE);
        Add2DGfxResObjFromNarc(mgr, ret, (NarcId)headerNarc->narcId, headerNarc->fileId, headerNarc->compressed, headerNarc->id, (NNS_G2D_VRAM_TYPE)headerNarc->extra[0], headerNarc->extra[1], header->type, heapId, FALSE);
    }
    mgr->num++;
    return ret;
}

SpriteResource *AddCharResObjFromNarc(GF_2DGfxResMan *mgr, NarcId narcId, int fileId, BOOL compressed, int id, NNS_G2D_VRAM_TYPE vram, HeapID heapId) {
    SpriteResource *ret;
    GF_ASSERT(mgr != NULL);
    GF_ASSERT(mgr->type == GF_GFX_RES_TYPE_CHAR);
    ret = GF2DGfxResMan_GetFreeObject(mgr);
    GF_ASSERT(ret != NULL);
    Add2DGfxResObjFromNarc(mgr, ret, narcId, fileId, compressed, id, vram, 0, GF_GFX_RES_TYPE_CHAR, heapId, FALSE);
    mgr->num++;
    return ret;
}

SpriteResource *AddPlttResObjFromNarc(GF_2DGfxResMan *mgr, NarcId narcId, int fileId, BOOL compressed, int id, NNS_G2D_VRAM_TYPE vram, int pltt_num, HeapID heapId) {
    SpriteResource *ret;
    GF_ASSERT(mgr != NULL);
    GF_ASSERT(mgr->type == GF_GFX_RES_TYPE_PLTT);
    ret = GF2DGfxResMan_GetFreeObject(mgr);
    GF_ASSERT(ret != NULL);
    Add2DGfxResObjFromNarc(mgr, ret, narcId, fileId, compressed, id, vram, pltt_num, GF_GFX_RES_TYPE_PLTT, heapId, FALSE);
    mgr->num++;
    return ret;
}

SpriteResource *AddCellOrAnimResObjFromNarc(GF_2DGfxResMan *mgr, NarcId narcId, int fileId, BOOL compressed, int id, GfGfxResType type, HeapID heapId) {
    SpriteResource *ret;
    GF_ASSERT(mgr != NULL);
#ifdef UBFIX
    GF_ASSERT(mgr->type == type);
#endif // UBFIX
    ret = GF2DGfxResMan_GetFreeObject(mgr);
    GF_ASSERT(ret != NULL);
    Add2DGfxResObjFromNarc(mgr, ret, narcId, fileId, compressed, id, NNS_G2D_VRAM_TYPE_NEITHER, 0, type, heapId, FALSE);
    mgr->num++;
    return ret;
}

void ReplaceCharResObjFromNarc(GF_2DGfxResMan *mgr, SpriteResource *obj, NarcId narcId, int fileId, BOOL compressed, HeapID heapId) {
    int id;
    NNS_G2D_VRAM_TYPE vram;
    GF_ASSERT(mgr != NULL);
    GF_ASSERT(mgr->type == GF_GFX_RES_TYPE_CHAR);
    GF_ASSERT(obj != NULL);
    GF_ASSERT(obj->type == GF_GFX_RES_TYPE_CHAR);
    id = GF2DGfxResObj_GetResID(obj);
    vram = GF2DGfxResObj_GetLoadAddress(obj);
    DestroySingle2DGfxResObj(mgr, obj);
    Add2DGfxResObjFromNarc(mgr, obj, narcId, fileId, compressed, id, vram, 0, GF_GFX_RES_TYPE_CHAR, heapId, FALSE);
}

void ReplacePlttResObjFromNarc(GF_2DGfxResMan *mgr, SpriteResource *obj, NarcId narcId, int fileId, BOOL compressed, HeapID heapId) {
    int id;
    NNS_G2D_VRAM_TYPE vram;
    int pltt_num;
    GF_ASSERT(mgr != NULL);
    GF_ASSERT(mgr->type == GF_GFX_RES_TYPE_PLTT);
    GF_ASSERT(obj != NULL);
    GF_ASSERT(obj->type == GF_GFX_RES_TYPE_PLTT);
    id = GF2DGfxResObj_GetResID(obj);
    vram = GF2DGfxResObj_GetLoadAddress(obj);
    pltt_num = GF2DGfxResObj_GetPlttNum(obj);
    DestroySingle2DGfxResObj(mgr, obj);
    Add2DGfxResObjFromNarc(mgr, obj, narcId, fileId, compressed, id, vram, pltt_num, GF_GFX_RES_TYPE_PLTT, heapId, FALSE);
}

SpriteResource *AddCharResObjFromOpenNarc(GF_2DGfxResMan *mgr, NARC *narc, int fileId, BOOL compressed, int id, NNS_G2D_VRAM_TYPE vram, HeapID heapId) {
    SpriteResource *ret;
    GF_ASSERT(mgr != NULL);
    GF_ASSERT(mgr->type == GF_GFX_RES_TYPE_CHAR);
    ret = GF2DGfxResMan_GetFreeObject(mgr);
    GF_ASSERT(ret != NULL);
    Add2DGfxResObjFromOpenNarc(mgr, ret, narc, fileId, compressed, id, vram, 0, GF_GFX_RES_TYPE_CHAR, heapId, FALSE);
    mgr->num++;
    return ret;
}

SpriteResource *AddCharResObjFromOpenNarcWithAtEndFlag(GF_2DGfxResMan *mgr, NARC *narc, int fileId, BOOL compressed, int id, NNS_G2D_VRAM_TYPE vram, HeapID heapId, BOOL atEnd) {
    SpriteResource *ret;
    GF_ASSERT(mgr != NULL);
    GF_ASSERT(mgr->type == GF_GFX_RES_TYPE_CHAR);
    ret = GF2DGfxResMan_GetFreeObject(mgr);
    GF_ASSERT(ret != NULL);
    Add2DGfxResObjFromOpenNarc(mgr, ret, narc, fileId, compressed, id, vram, 0, GF_GFX_RES_TYPE_CHAR, heapId, atEnd);
    mgr->num++;
    return ret;
}

SpriteResource *AddPlttResObjFromOpenNarc(GF_2DGfxResMan *mgr, NARC *narc, int fileId, BOOL compressed, int id, NNS_G2D_VRAM_TYPE vram, int pltt_num, HeapID heapId) {
    SpriteResource *ret;
    GF_ASSERT(mgr != NULL);
    GF_ASSERT(mgr->type == GF_GFX_RES_TYPE_PLTT);
    ret = GF2DGfxResMan_GetFreeObject(mgr);
    GF_ASSERT(ret != NULL);
    Add2DGfxResObjFromOpenNarc(mgr, ret, narc, fileId, compressed, id, vram, pltt_num, GF_GFX_RES_TYPE_PLTT, heapId, FALSE);
    mgr->num++;
    return ret;
}

SpriteResource *AddPlttResObjFromOpenNarcWithAtEndFlag(GF_2DGfxResMan *mgr, NARC *narc, int fileId, BOOL compressed, int id, NNS_G2D_VRAM_TYPE vram, int pltt_num, HeapID heapId, BOOL atEnd) {
    SpriteResource *ret;
    GF_ASSERT(mgr != NULL);
    GF_ASSERT(mgr->type == GF_GFX_RES_TYPE_PLTT);
    ret = GF2DGfxResMan_GetFreeObject(mgr);
    GF_ASSERT(ret != NULL);
    Add2DGfxResObjFromOpenNarc(mgr, ret, narc, fileId, compressed, id, vram, pltt_num, GF_GFX_RES_TYPE_PLTT, heapId, atEnd);
    mgr->num++;
    return ret;
}

SpriteResource *AddCellOrAnimResObjFromOpenNarc(GF_2DGfxResMan *resMan, NARC *narc, int fileId, BOOL compressed, int id, GfGfxResType type, HeapID heapId) {
    SpriteResource *ret;
    GF_ASSERT(resMan != NULL);
#ifdef UBFIX
    GF_ASSERT(mgr->type == type);
#endif // UBFIX
    ret = GF2DGfxResMan_GetFreeObject(resMan);
    GF_ASSERT(ret != NULL);
    Add2DGfxResObjFromOpenNarc(resMan, ret, narc, fileId, compressed, id, NNS_G2D_VRAM_TYPE_NEITHER, 0, type, heapId, FALSE);
    resMan->num++;
    return ret;
}

void ReplaceCharResObjFromOpenNarc(GF_2DGfxResMan *mgr, SpriteResource *obj, NARC *narc, int fileId, BOOL compressed, HeapID heapId) {
    int id;
    NNS_G2D_VRAM_TYPE vram;
    GF_ASSERT(mgr != NULL);
    GF_ASSERT(mgr->type == GF_GFX_RES_TYPE_CHAR);
    GF_ASSERT(obj != NULL);
    GF_ASSERT(obj->type == GF_GFX_RES_TYPE_CHAR);
    id = GF2DGfxResObj_GetResID(obj);
    vram = GF2DGfxResObj_GetLoadAddress(obj);
    DestroySingle2DGfxResObj(mgr, obj);
    Add2DGfxResObjFromOpenNarc(mgr, obj, narc, fileId, compressed, id, vram, 0, GF_GFX_RES_TYPE_CHAR, heapId, FALSE);
}

void ReplacePlttResObjFromOpenNarc(GF_2DGfxResMan *mgr, SpriteResource *obj, NARC *narc, int fileId, BOOL compressed, HeapID heapId) {
    int id;
    NNS_G2D_VRAM_TYPE vram;
    int pltt_num;
    GF_ASSERT(mgr != NULL);
    GF_ASSERT(mgr->type == GF_GFX_RES_TYPE_PLTT);
    GF_ASSERT(obj != NULL);
    GF_ASSERT(obj->type == GF_GFX_RES_TYPE_PLTT);
    id = GF2DGfxResObj_GetResID(obj);
    vram = GF2DGfxResObj_GetLoadAddress(obj);
    pltt_num = GF2DGfxResObj_GetPlttNum(obj);
    DestroySingle2DGfxResObj(mgr, obj);
    Add2DGfxResObjFromOpenNarc(mgr, obj, narc, fileId, compressed, id, vram, pltt_num, GF_GFX_RES_TYPE_PLTT, heapId, FALSE);
}

int LoadAll2DGfxResObjsFromHeader(GF_2DGfxResMan *mgr, const GF_2DGfxResHeader *header, GF_2DGfxResObjList *list, HeapID heapId) {
    GF_ASSERT(mgr != NULL);
    GF_ASSERT(header != NULL);
    loadAll2DGfxResObjFromHeaderInternal(mgr, header, 0, header->num, list, heapId);
    return header->num;
}

static void loadAll2DGfxResObjFromHeaderInternal(GF_2DGfxResMan *mgr, const GF_2DGfxResHeader *header, int first, int count, GF_2DGfxResObjList *list, HeapID heapId) {
    int i;
    SpriteResource *obj;

    for (i = first; i < first + count; i++) {
        obj = Add2DGfxResObjFromHeader(mgr, header, i, heapId);
        if (list != NULL) {
            if (list->max > list->num) {
                list->obj[list->num] = obj;
                list->num++;
            }
        }
    }
}

GF_2DGfxResObjList *Create2DGfxResObjList(int num, HeapID heapId) {
    GF_2DGfxResObjList *ret = AllocFromHeap(heapId, sizeof(GF_2DGfxResObjList));
    ret->obj = AllocFromHeap(heapId, num * sizeof(SpriteResource *));
    ret->max = num;
    ret->num = 0;
    return ret;
}

void Delete2DGfxResObjList(GF_2DGfxResObjList *list) {
    FreeToHeap(list->obj);
    FreeToHeap(list);
}

BOOL GF2DGfxResObjExistsById(GF_2DGfxResMan *mgr, int a1) {
    GF_ASSERT(mgr != NULL);
    return GF2dGfxRawResMan_DoesNotHaveObjWithId(mgr->resourceMgr, a1);
}

void sub_0200A740(SpriteResource *obj) {
    GF_ASSERT(obj != NULL);
    destroyResObjExtra(obj);
    GF2dGfxRawResObj_ReplaceData(obj->resource, NULL);
}

void DestroySingle2DGfxResObj(GF_2DGfxResMan *a0, SpriteResource *a1) {
    GF_ASSERT(a0 != NULL);
    GF_ASSERT(a0->objects != NULL);
    destroyResObjExtra(a1);
    GF2dGfxRawResMan_FreeObj(a0->resourceMgr, a1->resource);
    a1->resource = NULL;
    a0->num--;
}

static void destroyAllObjects(GF_2DGfxResMan *mgr) {
    int i;

    for (i = 0; i < mgr->max; i++) {
        if (mgr->objects[i].resource != NULL) {
            DestroySingle2DGfxResObj(mgr, &mgr->objects[i]);
        }
    }
}

SpriteResource *SpriteResourceCollection_Find(GF_2DGfxResMan *mgr, int id) {
    int i, tmp;
    GF_ASSERT(mgr != NULL);
    for (i = 0; i < mgr->max; i++) {
        if (mgr->objects[i].resource != NULL) {
            tmp = Get2DGfxRawResObjId(mgr->objects[i].resource);
            if (tmp == id) {
                return &mgr->objects[i];
            }
        }
    }
    return NULL;
}

int GF2DGfxResObj_GetResID(SpriteResource *obj) {
    GF_ASSERT(obj != NULL);
    return Get2DGfxRawResObjId(obj->resource);
}

NNSG2dCharacterData *GF2DGfxResObj_GetCharDataPtr(SpriteResource *obj) {
    struct CharResExtraData *res;
    GF_ASSERT(obj->type == GF_GFX_RES_TYPE_CHAR);
    res = getResObjExtra(obj);
    return res->charData;
}

NNSG2dPaletteData *GF2DGfxResObj_GetPlttDataPtr(SpriteResource *obj) {
    struct PlttResExtraData *res;
    GF_ASSERT(obj->type == GF_GFX_RES_TYPE_PLTT);
    res = getResObjExtra(obj);
    return res->plttData;
}

NNSG2dCellDataBank *GF2DGfxResObj_GetCellDataPtr(SpriteResource *obj) {
    struct CellResExtraData *res;
    GF_ASSERT(obj->type == GF_GFX_RES_TYPE_CELL);
    res = getResObjExtra(obj);
    return res->cellDataBank;
}

NNSG2dAnimBankData *GF2DGfxResObj_GetAnimDataPtr(SpriteResource *obj) {
    struct AnimResExtraData *res;
    GF_ASSERT(obj->type == GF_GFX_RES_TYPE_ANIM);
    res = getResObjExtra(obj);
    return res->animBankData;
}

NNSG2dMultiCellDataBank *GF2DGfxResObj_GetMultiCellDataPtr(SpriteResource *obj) {
    struct MulticellResExtraData *res;
    GF_ASSERT(obj->type == GF_GFX_RES_TYPE_MCEL);
    res = getResObjExtra(obj);
    return res->multiCellDataBank;
}

NNSG2dAnimBankData *GF2DGfxResObj_GetMultiAnimDataPtr(SpriteResource *obj) {
    struct MultianimResExtraData *res;
    GF_ASSERT(obj->type == GF_GFX_RES_TYPE_MANM);
    res = getResObjExtra(obj);
    return res->animBankData;
}

GfGfxResType GF2DGfxResObj_GetResType(SpriteResource *obj) {
    GF_ASSERT(obj != NULL);
    return obj->type;
}

NNS_G2D_VRAM_TYPE GF2DGfxResObj_GetLoadAddress(SpriteResource *obj) {
    GF_ASSERT(obj != NULL);
    if (obj->type == GF_GFX_RES_TYPE_CHAR) {
        struct CharResExtraData *res = getResObjExtra(obj);
        return res->vram;
    } else if (obj->type == GF_GFX_RES_TYPE_PLTT) {
        struct PlttResExtraData *res = getResObjExtra(obj);
        return res->vram;
    } else {
        return NNS_G2D_VRAM_TYPE_NEITHER;
    }
}

int GF2DGfxResObj_GetPlttNum(SpriteResource *obj) {
    GF_ASSERT(obj != NULL);
    if (obj->type == GF_GFX_RES_TYPE_PLTT) {
        struct PlttResExtraData *res = getResObjExtra(obj);
        return res->pltt_num;
    } else {
        return 0;
    }
}

u32 GF2DGfxResHeader_sizeof(void) {
    return sizeof(GF_2DGfxResHeader);
}

GF_2DGfxResHeader *GF2DGfxResHeader_GetByIndex(GF_2DGfxResHeader *headers, int num) {
    return &headers[num];
}

void GF2DGfxResHeader_Init(const GF_2DGfxResHeaderNarcList *narcList, GF_2DGfxResHeader *header, HeapID heapId) {
    GF_ASSERT(header != NULL);
    header->type = narcList->type;
    header->isNarc = TRUE;
    header->num = GF2DGfxResHeaderNarc_CountObjects(narcList->internal);
    if (header->num > 0) {
        header->table = AllocFromHeap(heapId, header->num * sizeof(GF_2DGfxResHeaderNarc));
    } else {
        header->table = NULL;
    }
    if (header->table != NULL) {
        memcpy(header->table, narcList->internal, header->num * sizeof(GF_2DGfxResHeaderNarc));
    }
}

void GF2DGfxResHeader_Reset(GF_2DGfxResHeader *header) {
    if (header->table != NULL) {
        FreeToHeap(header->table);
    }
    header->table = NULL;
    header->num = 0;
}

int GF2dGfxResHeader_GetNumObjects(const GF_2DGfxResHeader *header) {
    GF_ASSERT(header != NULL);
    return header->num;
}

int GF2dGfxResHeader_GetObjIdByIndex(GF_2DGfxResHeader *header, int idx) {
    GF_ASSERT(header != NULL);
    GF_ASSERT(header->num > idx);
    if (!header->isNarc) {
        GF_2DGfxResHeaderFile *sub = header->table;
        return sub[idx].id;
    } else {
        GF_2DGfxResHeaderNarc *sub = header->table;
        return sub[idx].id;
    }
}

int GF2DGfxResHeader_GetNarcMemberIdByIndex(GF_2DGfxResHeader *header, int idx) {
    int ret;
    GF_ASSERT(header != NULL);
    GF_ASSERT(header->num > idx);
    if (header->isNarc == TRUE) {
        GF_2DGfxResHeaderNarc *sub = header->table;
        ret = sub[idx].fileId;
    }
    return ret; // UB: if not narc, this is uninitialized
}

BOOL GF2DGfxResHeader_GetCompressFlagByIndex(GF_2DGfxResHeader *header, int idx) {
    int ret;
    GF_ASSERT(header != NULL);
    GF_ASSERT(header->num > idx);
    if (header->isNarc == TRUE) {
        GF_2DGfxResHeaderNarc *sub = header->table;
        ret = sub[idx].compressed;
    }
    return ret; // UB: if not narc, this is uninitialized
}

int GF2DGfxResHeader_GetExDat0ByIndex(GF_2DGfxResHeader *header, int idx) {
    GF_ASSERT(header != NULL);
    GF_ASSERT(header->num > idx);
    if (!header->isNarc) {
        GF_2DGfxResHeaderFile *sub = header->table;
        return sub[idx].extra[0];
    } else {
        GF_2DGfxResHeaderNarc *sub = header->table;
        return sub[idx].extra[0];
    }
}

int GF2DGfxResHeader_GetExDat1ByIndex(GF_2DGfxResHeader *header, int idx) {
    GF_ASSERT(header != NULL);
    GF_ASSERT(header->num > idx);
    if (!header->isNarc) {
        GF_2DGfxResHeaderFile *sub = header->table;
        return sub[idx].extra[1];
    } else {
        GF_2DGfxResHeaderNarc *sub = header->table;
        return sub[idx].extra[1];
    }
}

static SpriteResource *GF2DGfxResMan_GetFreeObject(GF_2DGfxResMan *mgr) {
    int i;

    for (i = 0; i < mgr->max; i++) {
        if (mgr->objects[i].resource == NULL) {
            return &mgr->objects[i];
        }
    }

    return NULL;
}

void GF2DGfxResObj_LoadExDat(SpriteResource *obj, GfGfxResType type, NNS_G2D_VRAM_TYPE vram, int pltt_num, HeapID heapId) {
    void *resource = GF2dGfxRawResObj_GetData(obj->resource);
    switch (type) {
    case GF_GFX_RES_TYPE_CHAR:
        obj->extra = GetResourceExtraCharData(resource, vram, heapId);
        break;
    case GF_GFX_RES_TYPE_PLTT:
        obj->extra = GetResourceExtraPlttData(resource, vram, pltt_num, heapId);
        break;
    case GF_GFX_RES_TYPE_CELL:
        obj->extra = GetResourceExtraCellData(resource, heapId);
        break;
    case GF_GFX_RES_TYPE_ANIM:
        obj->extra = GetResourceExtraAnimData(resource, heapId);
        break;
    case GF_GFX_RES_TYPE_MCEL:
        obj->extra = GetResourceExtraMulticellData(resource, heapId);
        break;
    case GF_GFX_RES_TYPE_MANM:
        obj->extra = GetResourceExtraMultianimData(resource, heapId);
        break;
    }
}

static struct CharResExtraData *GetResourceExtraCharData(void *resource, NNS_G2D_VRAM_TYPE vram, HeapID heapId) {
    struct CharResExtraData *ret = AllocFromHeap(heapId, sizeof(struct CharResExtraData));
    NNS_G2dGetUnpackedCharacterData(resource, &ret->charData);
    ret->vram = vram;
    return ret;
}

static struct PlttResExtraData *GetResourceExtraPlttData(void *resource, NNS_G2D_VRAM_TYPE vram, int pltt_num, HeapID heapId) {
    struct PlttResExtraData *ret = AllocFromHeap(heapId, sizeof(struct PlttResExtraData));
    NNS_G2dGetUnpackedPaletteData(resource, &ret->plttData);
    ret->vram = vram;
    ret->pltt_num = pltt_num;
    return ret;
}

static struct CellResExtraData *GetResourceExtraCellData(void *resource, HeapID heapId) {
    struct CellResExtraData *ret = AllocFromHeap(heapId, sizeof(struct CellResExtraData));
    NNS_G2dGetUnpackedCellBank(resource, &ret->cellDataBank);
    return ret;
}

static struct AnimResExtraData *GetResourceExtraAnimData(void *resource, HeapID heapId) {
    struct AnimResExtraData *ret = AllocFromHeap(heapId, sizeof(struct AnimResExtraData));
    NNS_G2dGetUnpackedAnimBank(resource, &ret->animBankData);
    return ret;
}

static struct MulticellResExtraData *GetResourceExtraMulticellData(void *resource, HeapID heapId) {
    struct MulticellResExtraData *ret = AllocFromHeap(heapId, sizeof(struct MulticellResExtraData));
    NNS_G2dGetUnpackedMultiCellBank(resource, &ret->multiCellDataBank);
    return ret;
}

static struct MultianimResExtraData *GetResourceExtraMultianimData(void *resource, HeapID heapId) {
    struct MultianimResExtraData *ret = AllocFromHeap(heapId, sizeof(struct MultianimResExtraData));
    NNS_G2dGetUnpackedMCAnimBank(resource, &ret->animBankData);
    return ret;
}

static void destroyResObjExtra(SpriteResource *obj) {
    if (obj->extra != NULL) {
        FreeToHeap(obj->extra);
    }
    obj->extra = NULL;
}

static void *getResObjExtra(SpriteResource *obj) {
    GF_ASSERT(obj != NULL);
    GF_ASSERT(obj->extra != NULL);
    return obj->extra;
}

static void Add2DGfxResObjFromFile(GF_2DGfxResMan *mgr, SpriteResource *obj, char *name, int id, NNS_G2D_VRAM_TYPE vram, int pltt_num, GfGfxResType type, HeapID heapId) {
    obj->resource = GF2dGfxRawResMan_ReadAndAllocObj(mgr->resourceMgr, name, id, heapId);
    obj->type = type;
    GF2DGfxResObj_LoadExDat(obj, type, vram, pltt_num, heapId);
}

static void Add2DGfxResObjFromNarc(GF_2DGfxResMan *mgr, SpriteResource *obj, NarcId narcId, int fileId, BOOL compressed, int id, NNS_G2D_VRAM_TYPE vram, int pltt_num, GfGfxResType type, HeapID heapId, BOOL atEnd) {
    void *res = GfGfxLoader_LoadFromNarc(narcId, fileId, compressed, heapId, atEnd);
    obj->resource = GF2dGfxRawResMan_AllocObj(mgr->resourceMgr, res, id);
    obj->type = type;
    GF2DGfxResObj_LoadExDat(obj, type, vram, pltt_num, heapId);
}

static void Add2DGfxResObjFromOpenNarc(GF_2DGfxResMan *mgr, SpriteResource *obj, NARC *narc, int fileId, BOOL compressed, int id, NNS_G2D_VRAM_TYPE vram, int pltt_num, GfGfxResType type, HeapID heapId, BOOL atEnd) {
    void *res = loadResourceFromNarc(narc, fileId, compressed, heapId, atEnd);
    obj->resource = GF2dGfxRawResMan_AllocObj(mgr->resourceMgr, res, id);
    obj->type = type;
    GF2DGfxResObj_LoadExDat(obj, type, vram, pltt_num, heapId);
}

static int GF2DGfxResHeaderNarc_CountObjects(const GF_2DGfxResHeaderNarc *a0) {
    int n = 0;
    while (a0[n].narcId != -2) {
        n++;
    }
    return n;
}

static void *loadResourceFromNarc(NARC *narc, int fileId, BOOL compressed, HeapID heapId, BOOL atEnd) {
    void *data = NARC_AllocAndReadWholeMember(narc, fileId, heapId);
    if (data != NULL) {
        if (compressed) {
            void *uncompData;
            if (atEnd == 0) { // explicit comparison to 0 is required to match
                uncompData = AllocFromHeap(heapId, MI_GetUncompressedSize(data));
            } else {
                uncompData = AllocFromHeapAtEnd(heapId, MI_GetUncompressedSize(data));
            }
            if (uncompData != NULL) {
                MI_UncompressLZ8(data, uncompData);
                FreeToHeap(data);
            }
            // Possible memory leak if uncompData == NULL
            data = uncompData;
        }
    }
    return data;
}
