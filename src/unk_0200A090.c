#include "unk_0200A090.h"
#include "gf_gfx_loader.h"

static void loadAll2DGfxResObjFromHeaderInternal(struct _2DGfxResMan *mgr, const struct _2DGfxResHeader *header, int first, int count, struct _2DGfxResObjList *list, HeapID heapId);
static void destroyAllObjects(struct _2DGfxResMan *mgr);
static struct _2DGfxResObj *sub_0200AA70(struct _2DGfxResMan *mgr);
static struct CharResExtraData *GetResourceExtraCharData(void *resource, int vram, HeapID heapId);
static struct PlttResExtraData *GetResourceExtraPlttData(void *resource, int vram, int pltt_num, HeapID heapId);
static struct CellResExtraData *GetResourceExtraCellData(void *resource, HeapID heapId);
static struct AnimResExtraData *GetResourceExtraAnimData(void *resource, HeapID heapId);
static struct MulticellResExtraData *GetResourceExtraMulticellData(void *resource, HeapID heapId);
static struct MultianimResExtraData *GetResourceExtraMultianimData(void *resource, HeapID heapId);
static void destroyResObjExtra(struct _2DGfxResObj *obj);
static void *getResObjExtra(struct _2DGfxResObj *obj);
static void Add2DGfxResObjFromFile(struct _2DGfxResMan *mgr, struct _2DGfxResObj *obj, char *name, int id, int vram, int pltt_num, GfGfxResType type, HeapID heapId);
static void Add2DGfxResObjFromNarc(struct _2DGfxResMan *mgr, struct _2DGfxResObj *obj, NarcId narcId, int fileId, BOOL compressed, int id, int vram, int pltt_num, GfGfxResType type, HeapID heapId, BOOL atEnd);
static void Add2DGfxResObjFromOpenNarc(struct _2DGfxResMan *mgr, struct _2DGfxResObj *obj, NARC *narc, int fileId, BOOL compressed, int id, int vram, int pltt_num, GfGfxResType type, HeapID heapId, BOOL atEnd);
static int sub_0200AC88(const struct _2DGfxResHeaderNarc *a0);
static void *sub_0200ACA4(NARC *narc, int fileId, BOOL compressed, HeapID heapId, BOOL atEnd);

struct _2DGfxResMan *Create2DGfxResObjMan(int num, GfGfxResType type, HeapID heapId) {
    struct _2DGfxResMan *ret = AllocFromHeap(heapId, sizeof(struct _2DGfxResMan));
    ret->resourceMgr = Create2DGfxResMan(num, heapId);
    ret->objects = AllocFromHeap(heapId, num * sizeof(struct _2DGfxResObj));
    memset(ret->objects, 0, num * sizeof(struct _2DGfxResObj));
    ret->max = num;
    ret->num = 0;
    ret->type = type;
    return ret;
}

void Destroy2DGfxResObjMan(struct _2DGfxResMan *mgr) {
    GF_ASSERT(mgr != NULL);
    GF_ASSERT(mgr->resourceMgr != NULL);
    GF_ASSERT(mgr->objects != NULL);
    destroyAllObjects(mgr);
    Destroy2DGfxResMan(mgr->resourceMgr);
    mgr->resourceMgr = NULL;
    FreeToHeap(mgr->objects);
    mgr->objects = NULL;
    FreeToHeap(mgr);
}

struct _2DGfxResObj *Add2DGfxResObjFromHeader(struct _2DGfxResMan *mgr, const struct _2DGfxResHeader *header, int idx, HeapID heapId) {
    struct _2DGfxResObj *ret;
    struct _2DGfxResHeaderFile *headerFile;
    struct _2DGfxResHeaderNarc *headerNarc;
    
    GF_ASSERT(mgr != NULL);
    GF_ASSERT(header != NULL);
    GF_ASSERT(header->num > idx);
    GF_ASSERT(mgr->type == header->type);

    ret = sub_0200AA70(mgr);
    GF_ASSERT(ret != NULL);
    if (!header->isNarc) {
        headerFile = &((struct _2DGfxResHeaderFile *)header->table)[idx];
        GF_ASSERT(_2DGfxResObjExistsById(mgr, headerFile->id) == TRUE);
        Add2DGfxResObjFromFile(mgr, ret, headerFile->filename, headerFile->id, headerFile->extra[0], headerFile->extra[1], header->type, heapId);
    } else {
        headerNarc = &((struct _2DGfxResHeaderNarc *)header->table)[idx];
        GF_ASSERT(_2DGfxResObjExistsById(mgr, headerNarc->id) == TRUE);
        Add2DGfxResObjFromNarc(mgr, ret, headerNarc->narcId, headerNarc->fileId, headerNarc->compressed, headerNarc->id, headerNarc->extra[0], headerNarc->extra[1], header->type, heapId, FALSE);
    }
    mgr->num++;
    return ret;
}

struct _2DGfxResObj *AddCharResObjFromNarc(struct _2DGfxResMan *mgr, NarcId narcId, int fileId, BOOL compressed, int id, int vram, HeapID heapId) {
    struct _2DGfxResObj *ret;
    GF_ASSERT(mgr != NULL);
    GF_ASSERT(mgr->type == GF_GFX_RES_TYPE_CHAR);
    ret = sub_0200AA70(mgr);
    GF_ASSERT(ret != NULL);
    Add2DGfxResObjFromNarc(mgr, ret, narcId, fileId, compressed, id, vram, 0, GF_GFX_RES_TYPE_CHAR, heapId, FALSE);
    mgr->num++;
    return ret;
}

struct _2DGfxResObj *AddPlttResObjFromNarc(struct _2DGfxResMan *mgr, NarcId narcId, int fileId, BOOL compressed, int id, int vram, int pltt_num, HeapID heapId) {
    struct _2DGfxResObj *ret;
    GF_ASSERT(mgr != NULL);
    GF_ASSERT(mgr->type == GF_GFX_RES_TYPE_PLTT);
    ret = sub_0200AA70(mgr);
    GF_ASSERT(ret != NULL);
    Add2DGfxResObjFromNarc(mgr, ret, narcId, fileId, compressed, id, vram, pltt_num, GF_GFX_RES_TYPE_PLTT, heapId, FALSE);
    mgr->num++;
    return ret;
}

struct _2DGfxResObj *AddCellOrAnimResObjFromNarc(struct _2DGfxResMan *mgr, NarcId narcId, int fileId, BOOL compressed, int id, int type, HeapID heapId) {
    struct _2DGfxResObj *ret;
    GF_ASSERT(mgr != NULL);
    //GF_ASSERT(mgr->type == type);
    ret = sub_0200AA70(mgr);
    GF_ASSERT(ret != NULL);
    Add2DGfxResObjFromNarc(mgr, ret, narcId, fileId, compressed, id, 0, 0, type, heapId, FALSE);
    mgr->num++;
    return ret;
}

void ReplaceCharResObjFromNarc(struct _2DGfxResMan *mgr, struct _2DGfxResObj *obj, NarcId narcId, int fileId, BOOL compressed, HeapID heapId) {
    int id;
    int vram;
    GF_ASSERT(mgr != NULL);
    GF_ASSERT(mgr->type == GF_GFX_RES_TYPE_CHAR);
    GF_ASSERT(obj != NULL);
    GF_ASSERT(obj->type == GF_GFX_RES_TYPE_CHAR);
    id = sub_0200A7FC(obj);
    vram = sub_0200A8B0(obj);
    DestroySingle2DGfxResObj(mgr, obj);
    Add2DGfxResObjFromNarc(mgr, obj, narcId, fileId, compressed, id, vram, 0, GF_GFX_RES_TYPE_CHAR, heapId, FALSE);
}

void ReplacePlttResObjFromNarc(struct _2DGfxResMan *mgr, struct _2DGfxResObj *obj, NarcId narcId, int fileId, BOOL compressed, HeapID heapId) {
    int id;
    int vram;
    int pltt_num;
    GF_ASSERT(mgr != NULL);
    GF_ASSERT(mgr->type == GF_GFX_RES_TYPE_PLTT);
    GF_ASSERT(obj != NULL);
    GF_ASSERT(obj->type == GF_GFX_RES_TYPE_PLTT);
    id = sub_0200A7FC(obj);
    vram = sub_0200A8B0(obj);
    pltt_num = sub_0200A8DC(obj);
    DestroySingle2DGfxResObj(mgr, obj);
    Add2DGfxResObjFromNarc(mgr, obj, narcId, fileId, compressed, id, vram, pltt_num, GF_GFX_RES_TYPE_PLTT, heapId, FALSE);
}

struct _2DGfxResObj *AddCharResObjFromOpenNarc(struct _2DGfxResMan *mgr, NARC *narc, int fileId, BOOL compressed, int id, int vram, HeapID heapId) {
    struct _2DGfxResObj *ret;
    GF_ASSERT(mgr != NULL);
    GF_ASSERT(mgr->type == GF_GFX_RES_TYPE_CHAR);
    ret = sub_0200AA70(mgr);
    GF_ASSERT(ret != NULL);
    Add2DGfxResObjFromOpenNarc(mgr, ret, narc, fileId, compressed, id, vram, 0, GF_GFX_RES_TYPE_CHAR, heapId, FALSE);
    mgr->num++;
    return ret;
}

struct _2DGfxResObj *AddCharResObjFromOpenNarcWithAtEndFlag(struct _2DGfxResMan *mgr, NARC *narc, int fileId, BOOL compressed, int id, int vram, HeapID heapId, BOOL atEnd) {
    struct _2DGfxResObj *ret;
    GF_ASSERT(mgr != NULL);
    GF_ASSERT(mgr->type == GF_GFX_RES_TYPE_CHAR);
    ret = sub_0200AA70(mgr);
    GF_ASSERT(ret != NULL);
    Add2DGfxResObjFromOpenNarc(mgr, ret, narc, fileId, compressed, id, vram, 0, GF_GFX_RES_TYPE_CHAR, heapId, atEnd);
    mgr->num++;
    return ret;
}

struct _2DGfxResObj *AddPlttResObjFromOpenNarc(struct _2DGfxResMan *mgr, NARC *narc, int fileId, BOOL compressed, int id, int vram, int pltt_num, HeapID heapId) {
    struct _2DGfxResObj *ret;
    GF_ASSERT(mgr != NULL);
    GF_ASSERT(mgr->type == GF_GFX_RES_TYPE_PLTT);
    ret = sub_0200AA70(mgr);
    GF_ASSERT(ret != NULL);
    Add2DGfxResObjFromOpenNarc(mgr, ret, narc, fileId, compressed, id, vram, pltt_num, 1, heapId, FALSE);
    mgr->num++;
    return ret;
}

struct _2DGfxResObj *AddPlttResObjFromOpenNarcWithAtEndFlag(struct _2DGfxResMan *mgr, NARC *narc, int fileId, BOOL compressed, int id, int vram, int pltt_num, HeapID heapId, BOOL atEnd) {
    struct _2DGfxResObj *ret;
    GF_ASSERT(mgr != NULL);
    GF_ASSERT(mgr->type == GF_GFX_RES_TYPE_PLTT);
    ret = sub_0200AA70(mgr);
    GF_ASSERT(ret != NULL);
    Add2DGfxResObjFromOpenNarc(mgr, ret, narc, fileId, compressed, id, vram, pltt_num, GF_GFX_RES_TYPE_PLTT, heapId, atEnd);
    mgr->num++;
    return ret;
}

struct _2DGfxResObj *AddCellOrAnimResObjFromOpenNarc(struct _2DGfxResMan *resMan, NARC *narc, int fileId, BOOL compressed, int id, GfGfxResType type, HeapID heapId) {
    struct _2DGfxResObj *ret;
    GF_ASSERT(resMan != NULL);
    //GF_ASSERT(mgr->type == type);
    ret = sub_0200AA70(resMan);
    GF_ASSERT(ret != NULL);
    Add2DGfxResObjFromOpenNarc(resMan, ret, narc, fileId, compressed, id, 0, 0, type, heapId, FALSE);
    resMan->num++;
    return ret;
}

void ReplaceCharResObjFromOpenNarc(struct _2DGfxResMan *mgr, struct _2DGfxResObj *obj, NARC *narc, int fileId, BOOL compressed, HeapID heapId) {
    int id;
    int vram;
    GF_ASSERT(mgr != NULL);
    GF_ASSERT(mgr->type == GF_GFX_RES_TYPE_CHAR);
    GF_ASSERT(obj != NULL);
    GF_ASSERT(obj->type == GF_GFX_RES_TYPE_CHAR);
    id = sub_0200A7FC(obj);
    vram = sub_0200A8B0(obj);
    DestroySingle2DGfxResObj(mgr, obj);
    Add2DGfxResObjFromOpenNarc(mgr, obj, narc, fileId, compressed, id, vram, 0, GF_GFX_RES_TYPE_CHAR, heapId, FALSE);
}

void ReplacePlttResObjFromOpenNarc(struct _2DGfxResMan *mgr, struct _2DGfxResObj *obj, NARC *narc, int fileId, BOOL compressed, HeapID heapId) {
    int id;
    int vram;
    int pltt_num;
    GF_ASSERT(mgr != NULL);
    GF_ASSERT(mgr->type == GF_GFX_RES_TYPE_PLTT);
    GF_ASSERT(obj != NULL);
    GF_ASSERT(obj->type == GF_GFX_RES_TYPE_PLTT);
    id = sub_0200A7FC(obj);
    vram = sub_0200A8B0(obj);
    pltt_num = sub_0200A8DC(obj);
    DestroySingle2DGfxResObj(mgr, obj);
    Add2DGfxResObjFromOpenNarc(mgr, obj, narc, fileId, compressed, id, vram, pltt_num, GF_GFX_RES_TYPE_PLTT, heapId, FALSE);
}

int LoadAll2DGfxResObjsFromHeader(struct _2DGfxResMan *mgr, const struct _2DGfxResHeader *header, struct _2DGfxResObjList *list, HeapID heapId) {
    GF_ASSERT(mgr != NULL);
    GF_ASSERT(header != NULL);
    loadAll2DGfxResObjFromHeaderInternal(mgr, header, 0, header->num, list, heapId);
    return header->num;
}

static void loadAll2DGfxResObjFromHeaderInternal(struct _2DGfxResMan *mgr, const struct _2DGfxResHeader *header, int first, int count, struct _2DGfxResObjList *list, HeapID heapId) {
    int i;
    struct _2DGfxResObj *obj;

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

struct _2DGfxResObjList *Create2DGfxResObjList(int num, HeapID heapId) {
    struct _2DGfxResObjList *ret = AllocFromHeap(heapId, sizeof(struct _2DGfxResObjList));
    ret->obj = AllocFromHeap(heapId, num * sizeof(struct _2DGfxResObj *));
    ret->max = num;
    ret->num = 0;
    return ret;
}

void Delete2DGfxResObjList(struct _2DGfxResObjList *list) {
    FreeToHeap(list->obj);
    FreeToHeap(list);
}

BOOL _2DGfxResObjExistsById(struct _2DGfxResMan *mgr, int a1) {
    GF_ASSERT(mgr != NULL);
    return sub_020255A0(mgr->resourceMgr, a1);
}

void sub_0200A740(struct _2DGfxResObj *obj) {
    GF_ASSERT(obj != NULL);
    destroyResObjExtra(obj);
    sub_0202570C(obj->resource, NULL);
}

void DestroySingle2DGfxResObj(struct _2DGfxResMan *a0, struct _2DGfxResObj *a1) {
    GF_ASSERT(a0 != NULL);
    GF_ASSERT(a0->objects != NULL);
    destroyResObjExtra(a1);
    sub_02025658(a0->resourceMgr, a1->resource);
    a1->resource = NULL;
    a0->num--;
}

static void destroyAllObjects(struct _2DGfxResMan *mgr) {
    int i;

    for (i = 0; i < mgr->max; i++) {
        if (mgr->objects[i].resource != NULL) {
            DestroySingle2DGfxResObj(mgr, &mgr->objects[i]);
        }
    }
}

struct _2DGfxResObj *Get2DGfxResObjById(struct _2DGfxResMan *mgr, int id) {
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

int sub_0200A7FC(struct _2DGfxResObj *obj) {
    GF_ASSERT(obj != NULL);
    return Get2DGfxRawResObjId(obj->resource);
}

NNSG2dCharacterData *sub_0200A810(struct _2DGfxResObj *obj) {
    struct CharResExtraData *res;
    GF_ASSERT(obj->type == GF_GFX_RES_TYPE_CHAR);
    res = getResObjExtra(obj);
    return res->charData;
}

NNSG2dPaletteData *sub_0200A828(struct _2DGfxResObj *obj) {
    struct PlttResExtraData *res;
    GF_ASSERT(obj->type == GF_GFX_RES_TYPE_PLTT);
    res = getResObjExtra(obj);
    return res->plttData;
}

NNSG2dCellDataBank *sub_0200A840(struct _2DGfxResObj *obj) {
    struct CellResExtraData *res;
    GF_ASSERT(obj->type == GF_GFX_RES_TYPE_CELL);
    res = getResObjExtra(obj);
    return res->cellDataBank;
}

NNSG2dAnimBankData *sub_0200A858(struct _2DGfxResObj *obj) {
    struct AnimResExtraData *res;
    GF_ASSERT(obj->type == GF_GFX_RES_TYPE_ANIM);
    res = getResObjExtra(obj);
    return res->animBankData;
}

NNSG2dMultiCellDataBank *sub_0200A870(struct _2DGfxResObj *obj) {
    struct MulticellResExtraData *res;
    GF_ASSERT(obj->type == GF_GFX_RES_TYPE_MCEL);
    res = getResObjExtra(obj);
    return res->multiCellDataBank;
}

NNSG2dAnimBankData *sub_0200A888(struct _2DGfxResObj *obj) {
    struct MultianimResExtraData *res;
    GF_ASSERT(obj->type == GF_GFX_RES_TYPE_MANM);
    res = getResObjExtra(obj);
    return res->animBankData;
}

GfGfxResType sub_0200A8A0(struct _2DGfxResObj *obj) {
    GF_ASSERT(obj != NULL);
    return obj->type;
}

int sub_0200A8B0(struct _2DGfxResObj *obj) {
    GF_ASSERT(obj != NULL);
    if (obj->type == GF_GFX_RES_TYPE_CHAR) {
        struct CharResExtraData *res = getResObjExtra(obj);
        return res->vram;
    } else if (obj->type == GF_GFX_RES_TYPE_PLTT) {
        struct PlttResExtraData *res = getResObjExtra(obj);
        return res->vram;
    } else {
        return 0;
    }
}

int sub_0200A8DC(struct _2DGfxResObj *obj) {
    GF_ASSERT(obj != NULL);
    if (obj->type == GF_GFX_RES_TYPE_PLTT) {
        struct PlttResExtraData *res = getResObjExtra(obj);
        return res->pltt_num;
    } else {
        return 0;
    }
}

u32 sub_0200A8FC(void) {
    return sizeof(struct _2DGfxResHeader);
}

struct _2DGfxResHeader *sub_0200A900(struct _2DGfxResHeader *headers, int num) {
    return &headers[num];
}

void sub_0200A908(const void *a0, struct _2DGfxResHeader *header, HeapID heapId) {
    const int *x;
    GF_ASSERT(header != NULL);
    x = a0;
    header->type = x[0];
    header->isNarc = TRUE;
    header->num = sub_0200AC88((const struct _2DGfxResHeaderNarc *)(x + 1));
    if (header->num > 0) {
        header->table = AllocFromHeap(heapId, header->num * sizeof(struct _2DGfxResHeaderNarc));
    } else {
        header->table = NULL;
    }
    if (header->table != NULL) {
        memcpy(header->table, (const struct _2DGfxResHeaderNarc *)(x + 1), header->num * sizeof(struct _2DGfxResHeaderNarc));
    }
}

void sub_0200A954(struct _2DGfxResHeader *header) {
    if (header->table != NULL) {
        FreeToHeap(header->table);
    }
    header->table = NULL;
    header->num = 0;
}

int sub_0200A96C(const struct _2DGfxResHeader *header) {
    GF_ASSERT(header != NULL);
    return header->num;
}

int sub_0200A97C(struct _2DGfxResHeader *header, int idx) {
    GF_ASSERT(header != NULL);
    GF_ASSERT(header->num > idx);
    if (!header->isNarc) {
        struct _2DGfxResHeaderFile *sub = header->table;
        return sub[idx].id;
    } else {
        struct _2DGfxResHeaderNarc *sub = header->table;
        return sub[idx].id;
    }
}

int sub_0200A9B0(struct _2DGfxResHeader *header, int idx) {
    int ret;
    GF_ASSERT(header != NULL);
    GF_ASSERT(header->num > idx);
    if (header->isNarc == TRUE) {
        struct _2DGfxResHeaderNarc *sub = header->table;
        ret = sub[idx].fileId;
    }
    return ret; // UB: if not narc, this is uninitialized
}

BOOL sub_0200A9DC(struct _2DGfxResHeader *header, int idx) {
    int ret;
    GF_ASSERT(header != NULL);
    GF_ASSERT(header->num > idx);
    if (header->isNarc == TRUE) {
        struct _2DGfxResHeaderNarc *sub = header->table;
        ret = sub[idx].compressed;
    }
    return ret; // UB: if not narc, this is uninitialized
}

int sub_0200AA08(struct _2DGfxResHeader *header, int idx) {
    GF_ASSERT(header != NULL);
    GF_ASSERT(header->num > idx);
    if (!header->isNarc) {
        struct _2DGfxResHeaderFile *sub = header->table;
        return sub[idx].extra[0];
    } else {
        struct _2DGfxResHeaderNarc *sub = header->table;
        return sub[idx].extra[0];
    }
}

int sub_0200AA3C(struct _2DGfxResHeader *header, int idx) {
    GF_ASSERT(header != NULL);
    GF_ASSERT(header->num > idx);
    if (!header->isNarc) {
        struct _2DGfxResHeaderFile *sub = header->table;
        return sub[idx].extra[1];
    } else {
        struct _2DGfxResHeaderNarc *sub = header->table;
        return sub[idx].extra[1];
    }
}

static struct _2DGfxResObj *sub_0200AA70(struct _2DGfxResMan *mgr) {
    int i;

    for (i = 0; i < mgr->max; i++) {
        if (mgr->objects[i].resource == NULL) {
            return &mgr->objects[i];
        }
    }

    return NULL;
}

void sub_0200AA9C(struct _2DGfxResObj *obj, GfGfxResType type, int vram, int pltt_num, HeapID heapId) {
    void *resource = sub_020256FC(obj->resource);
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

static struct CharResExtraData *GetResourceExtraCharData(void *resource, int vram, HeapID heapId) {
    struct CharResExtraData *ret = AllocFromHeap(heapId, sizeof(struct CharResExtraData));
    NNS_G2dGetUnpackedCharacterData(resource, &ret->charData);
    ret->vram = vram;
    return ret;
}

static struct PlttResExtraData *GetResourceExtraPlttData(void *resource, int vram, int pltt_num, HeapID heapId) {
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

static void destroyResObjExtra(struct _2DGfxResObj *obj) {
    if (obj->extra != NULL) {
        FreeToHeap(obj->extra);
    }
    obj->extra = NULL;
}

static void *getResObjExtra(struct _2DGfxResObj *obj) {
    GF_ASSERT(obj != NULL);
    GF_ASSERT(obj->extra != NULL);
    return obj->extra;
}

static void Add2DGfxResObjFromFile(struct _2DGfxResMan *mgr, struct _2DGfxResObj *obj, char *name, int id, int vram, int pltt_num, GfGfxResType type, HeapID heapId) {
    obj->resource = sub_02025600(mgr->resourceMgr, name, id, heapId);
    obj->type = type;
    sub_0200AA9C(obj, type, vram, pltt_num, heapId);
}

static void Add2DGfxResObjFromNarc(struct _2DGfxResMan *mgr, struct _2DGfxResObj *obj, NarcId narcId, int fileId, BOOL compressed, int id, int vram, int pltt_num, GfGfxResType type, HeapID heapId, BOOL atEnd) {
    void *res = GfGfxLoader_LoadFromNarc(narcId, fileId, compressed, heapId, atEnd);
    obj->resource = sub_020255C4(mgr->resourceMgr, res, id);
    obj->type = type;
    sub_0200AA9C(obj, type, vram, pltt_num, heapId);
}

static void Add2DGfxResObjFromOpenNarc(struct _2DGfxResMan *mgr, struct _2DGfxResObj *obj, NARC *narc, int fileId, BOOL compressed, int id, int vram, int pltt_num, GfGfxResType type, HeapID heapId, BOOL atEnd) {
    void *res = sub_0200ACA4(narc, fileId, compressed, heapId, atEnd);
    obj->resource = sub_020255C4(mgr->resourceMgr, res, id);
    obj->type = type;
    sub_0200AA9C(obj, type, vram, pltt_num, heapId);
}

static int sub_0200AC88(const struct _2DGfxResHeaderNarc *a0) {
    int n = 0;
    while (a0[n].narcId != -2) {
        n++;
    }
    return n;
}

static void *sub_0200ACA4(NARC *narc, int fileId, BOOL compressed, HeapID heapId, BOOL atEnd) {
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
            data = uncompData;
        }
    }
    return data;
}
