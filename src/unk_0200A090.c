#include "unk_0200A090.h"

void sub_0200A6A8(struct UnkStruct_0200A090 *mgr, const struct UnkStruct_0200A110 *header, int first, int count, struct UnkStruct_0200A674 *a4, HeapID heapId);
BOOL sub_0200A728(struct UnkStruct_0200A090 *mgr, int a1);
void sub_0200A790(struct UnkStruct_0200A090 *mgr);
int sub_0200A7FC(struct UnkStruct_0200A090_sub4 *obj);
int sub_0200A8B0(struct UnkStruct_0200A090_sub4 *obj);
int sub_0200A8DC(struct UnkStruct_0200A090_sub4 *obj);
struct UnkStruct_0200A090_sub4 *sub_0200AA70(struct UnkStruct_0200A090 *mgr);
int sub_0200ABC0(struct UnkStruct_0200A090_sub4 *obj);
void *sub_0200ABD4(struct UnkStruct_0200A090_sub4 *obj);
void sub_0200ABEC(struct UnkStruct_0200A090 *mgr, struct UnkStruct_0200A090_sub4 *obj, char *name, int id, int vram, int pltt_num, GfGfxResType type, HeapID heapId);
void sub_0200AC18(struct UnkStruct_0200A090 *mgr, struct UnkStruct_0200A090_sub4 *obj, NarcId narcId, int fileId, BOOL compressed, int id, int vram, int pltt_num, GfGfxResType type, HeapID heapId, BOOL atEnd);
void sub_0200AC50(struct UnkStruct_0200A090 *mgr, struct UnkStruct_0200A090_sub4 *obj, NARC *narc, int fileId, BOOL compressed, int tag, int vram, int pltt_num, GfGfxResType type, HeapID heapId, BOOL atEnd);
int sub_0200AC88(const struct UnkStruct_0200A110_sub2 *a0);

struct UnkStruct_0200A090 *sub_0200A090(int num, GfGfxResType type, HeapID heapId) {
    struct UnkStruct_0200A090 *ret = AllocFromHeap(heapId, sizeof(struct UnkStruct_0200A090));
    ret->resourceMgr = sub_02025534(num, heapId);
    ret->objects = AllocFromHeap(heapId, num * sizeof(struct UnkStruct_0200A090_sub4));
    memset(ret->objects, 0, num * sizeof(struct UnkStruct_0200A090_sub4));
    ret->max = num;
    ret->num = 0;
    ret->type = type;
    return ret;
}

void sub_0200A0D0(struct UnkStruct_0200A090 *mgr) {
    GF_ASSERT(mgr != NULL);
    GF_ASSERT(mgr->resourceMgr != NULL);
    GF_ASSERT(mgr->objects != NULL);
    sub_0200A790(mgr);
    sub_02025580(mgr->resourceMgr);
    mgr->resourceMgr = NULL;
    FreeToHeap(mgr->objects);
    mgr->objects = 0;
    FreeToHeap(mgr);
}

struct UnkStruct_0200A090_sub4 *sub_0200A110(struct UnkStruct_0200A090 *mgr, const struct UnkStruct_0200A110 *header, int idx, HeapID heapId) {
    struct UnkStruct_0200A090_sub4 *ret;
    struct UnkStruct_0200A110_sub *r6;
    struct UnkStruct_0200A110_sub2 *r6_2;
    
    GF_ASSERT(mgr != NULL);
    GF_ASSERT(header != NULL);
    GF_ASSERT(header->num > idx);
    GF_ASSERT(mgr->type == header->type);

    ret = sub_0200AA70(mgr);
    GF_ASSERT(ret != NULL);
    if (!header->isNarc) {
        r6 = &((struct UnkStruct_0200A110_sub *)header->table)[idx];
        GF_ASSERT(sub_0200A728(mgr, r6->id) == TRUE);
        sub_0200ABEC(mgr, ret, r6->filename, r6->id, r6->extra[0], r6->extra[1], header->type, heapId);
    } else {
        r6_2 = &((struct UnkStruct_0200A110_sub2 *)header->table)[idx];
        GF_ASSERT(sub_0200A728(mgr, r6_2->id) == TRUE);
        sub_0200AC18(mgr, ret, r6_2->narcId, r6_2->fileId, r6_2->compressed, r6_2->id, r6_2->extra[0], r6_2->extra[1], header->type, heapId, FALSE);
    }
    mgr->num++;
    return ret;
}

struct UnkStruct_0200A090_sub4 *sub_0200A1D8(struct UnkStruct_0200A090 *mgr, NarcId narcId, int fileId, BOOL compressed, int id, int vram, HeapID heapId) {
    struct UnkStruct_0200A090_sub4 *ret;
    GF_ASSERT(mgr != NULL);
    GF_ASSERT(mgr->type == GF_GFX_RES_TYPE_CHAR);
    ret = sub_0200AA70(mgr);
    GF_ASSERT(ret != NULL);
    sub_0200AC18(mgr, ret, narcId, fileId, compressed, id, vram, 0, GF_GFX_RES_TYPE_CHAR, heapId, FALSE);
    mgr->num++;
    return ret;
}

struct UnkStruct_0200A090_sub4 *sub_0200A234(struct UnkStruct_0200A090 *mgr, NarcId narcId, int fileId, BOOL compressed, int id, int vram, int pltt_num, HeapID heapId) {
    struct UnkStruct_0200A090_sub4 *ret;
    GF_ASSERT(mgr != NULL);
    GF_ASSERT(mgr->type == GF_GFX_RES_TYPE_PLTT);
    ret = sub_0200AA70(mgr);
    GF_ASSERT(ret != NULL);
    sub_0200AC18(mgr, ret, narcId, fileId, compressed, id, vram, pltt_num, GF_GFX_RES_TYPE_PLTT, heapId, FALSE);
    mgr->num++;
    return ret;
}

struct UnkStruct_0200A090_sub4 *sub_0200A294(struct UnkStruct_0200A090 *mgr, NarcId narcId, int fileId, BOOL compressed, int id, int type, HeapID heapId) {
    struct UnkStruct_0200A090_sub4 *ret;
    GF_ASSERT(mgr != NULL);
    //GF_ASSERT(mgr->type == type);
    ret = sub_0200AA70(mgr);
    GF_ASSERT(ret != NULL);
    sub_0200AC18(mgr, ret, narcId, fileId, compressed, id, 0, 0, type, heapId, FALSE);
    mgr->num++;
    return ret;
}

void sub_0200A2E4(struct UnkStruct_0200A090 *mgr, struct UnkStruct_0200A090_sub4 *obj, NarcId narcId, int fileId, BOOL compressed, HeapID heapId) {
    int id;
    int vram;
    GF_ASSERT(mgr != NULL);
    GF_ASSERT(mgr->type == GF_GFX_RES_TYPE_CHAR);
    GF_ASSERT(obj != NULL);
    GF_ASSERT(obj->type == GF_GFX_RES_TYPE_CHAR);
    id = sub_0200A7FC(obj);
    vram = sub_0200A8B0(obj);
    sub_0200A75C(mgr, obj);
    sub_0200AC18(mgr, obj, narcId, fileId, compressed, id, vram, 0, GF_GFX_RES_TYPE_CHAR, heapId, FALSE);
}

void sub_0200A350(struct UnkStruct_0200A090 *mgr, struct UnkStruct_0200A090_sub4 *obj, NarcId narcId, int fileId, BOOL compressed, HeapID heapId) {
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
    sub_0200A75C(mgr, obj);
    sub_0200AC18(mgr, obj, narcId, fileId, compressed, id, vram, pltt_num, GF_GFX_RES_TYPE_PLTT, heapId, FALSE);
}

struct UnkStruct_0200A090_sub4 *sub_0200A3C8(struct UnkStruct_0200A090 *mgr, NARC *narc, int fileId, BOOL compressed, int tag, int vram, HeapID heapId) {
    struct UnkStruct_0200A090_sub4 *ret;
    GF_ASSERT(mgr != NULL);
    GF_ASSERT(mgr->type == GF_GFX_RES_TYPE_CHAR);
    ret = sub_0200AA70(mgr);
    GF_ASSERT(ret != NULL);
    sub_0200AC50(mgr, ret, narc, fileId, compressed, tag, vram, 0, GF_GFX_RES_TYPE_CHAR, heapId, FALSE);
    mgr->num++;
    return ret;
}

struct UnkStruct_0200A090_sub4 *sub_0200A424(struct UnkStruct_0200A090 *mgr, NARC *narc, int fileId, BOOL compressed, int tag, int vram, HeapID heapId, BOOL atEnd) {
    struct UnkStruct_0200A090_sub4 *ret;
    GF_ASSERT(mgr != NULL);
    GF_ASSERT(mgr->type == GF_GFX_RES_TYPE_CHAR);
    ret = sub_0200AA70(mgr);
    GF_ASSERT(ret != NULL);
    sub_0200AC50(mgr, ret, narc, fileId, compressed, tag, vram, 0, GF_GFX_RES_TYPE_CHAR, heapId, atEnd);
    mgr->num++;
    return ret;
}

struct UnkStruct_0200A090_sub4 *sub_0200A480(struct UnkStruct_0200A090 *mgr, NARC *narc, int fileId, BOOL compressed, int tag, int vram, int pltt_num, HeapID heapId) {
    struct UnkStruct_0200A090_sub4 *ret;
    GF_ASSERT(mgr != NULL);
    GF_ASSERT(mgr->type == 1);
    ret = sub_0200AA70(mgr);
    GF_ASSERT(ret != NULL);
    sub_0200AC50(mgr, ret, narc, fileId, compressed, tag, vram, pltt_num, 1, heapId, FALSE);
    mgr->num++;
    return ret;
}

struct UnkStruct_0200A090_sub4 *sub_0200A4E0(struct UnkStruct_0200A090 *mgr, NARC *narc, int fileId, BOOL compressed, int tag, int vram, int pltt_num, HeapID heapId, BOOL atEnd) {
    struct UnkStruct_0200A090_sub4 *ret;
    GF_ASSERT(mgr != NULL);
    GF_ASSERT(mgr->type == GF_GFX_RES_TYPE_PLTT);
    ret = sub_0200AA70(mgr);
    GF_ASSERT(ret != NULL);
    sub_0200AC50(mgr, ret, narc, fileId, compressed, tag, vram, pltt_num, GF_GFX_RES_TYPE_PLTT, heapId, atEnd);
    mgr->num++;
    return ret;
}

struct UnkStruct_0200A090_sub4 *sub_0200A540(struct UnkStruct_0200A090 *a0, NARC *narc, int fileId, BOOL compressed, int tag, GfGfxResType type, HeapID heapId) {
    struct UnkStruct_0200A090_sub4 *ret;
    GF_ASSERT(a0 != NULL);
    //GF_ASSERT(mgr->type == type);
    ret = sub_0200AA70(a0);
    GF_ASSERT(ret != NULL);
    sub_0200AC50(a0, ret, narc, fileId, compressed, tag, 0, 0, type, heapId, FALSE);
    a0->num++;
    return ret;
}

void sub_0200A590(struct UnkStruct_0200A090 *mgr, struct UnkStruct_0200A090_sub4 *obj, NARC *narc, int fileId, BOOL compressed, HeapID heapId) {
    int id;
    int vram;
    GF_ASSERT(mgr != NULL);
    GF_ASSERT(mgr->type == GF_GFX_RES_TYPE_CHAR);
    GF_ASSERT(obj != NULL);
    GF_ASSERT(obj->type == GF_GFX_RES_TYPE_CHAR);
    id = sub_0200A7FC(obj);
    vram = sub_0200A8B0(obj);
    sub_0200A75C(mgr, obj);
    sub_0200AC50(mgr, obj, narc, fileId, compressed, id, vram, 0, GF_GFX_RES_TYPE_CHAR, heapId, FALSE);
}

void sub_0200A5FC(struct UnkStruct_0200A090 *mgr, struct UnkStruct_0200A090_sub4 *obj, NARC *narc, int fileId, BOOL compressed, HeapID heapId) {
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
    sub_0200A75C(mgr, obj);
    sub_0200AC50(mgr, obj, narc, fileId, compressed, id, vram, pltt_num, GF_GFX_RES_TYPE_PLTT, heapId, FALSE);
}

int sub_0200A674(struct UnkStruct_0200A090 *mgr, const struct UnkStruct_0200A110 *header, struct UnkStruct_0200A674 *list, HeapID heapId) {
    GF_ASSERT(mgr != NULL);
    GF_ASSERT(header != NULL);
    sub_0200A6A8(mgr, header, 0, header->num, list, heapId);
    return header->num;
}

void sub_0200A6A8(struct UnkStruct_0200A090 *mgr, const struct UnkStruct_0200A110 *header, int first, int count, struct UnkStruct_0200A674 *a4, HeapID heapId) {
    int i;
    struct UnkStruct_0200A090_sub4 *obj;

    for (i = first; i < first + count; i++) {
        obj = sub_0200A110(mgr, header, i, heapId);
        if (a4 != NULL) {
            if (a4->max > a4->num) {
                a4->obj[a4->num] = obj;
                a4->num++;
            }
        }
    }
}

struct UnkStruct_0200A674 *sub_0200A6F0(int num, HeapID heapId) {
    struct UnkStruct_0200A674 *ret = AllocFromHeap(heapId, sizeof(struct UnkStruct_0200A674));
    ret->obj = AllocFromHeap(heapId, num * sizeof(struct UnkStruct_0200A090_sub4 *));
    ret->max = num;
    ret->num = 0;
    return ret;
}

void sub_0200A714(struct UnkStruct_0200A674 *list) {
    FreeToHeap(list->obj);
    FreeToHeap(list);
}

BOOL sub_0200A728(struct UnkStruct_0200A090 *mgr, int a1) {
    GF_ASSERT(mgr != NULL);
    return sub_020255A0(mgr->resourceMgr, a1);
}

void sub_0200A740(struct UnkStruct_0200A090_sub4 *obj) {
    GF_ASSERT(obj != NULL);
    sub_0200ABC0(obj);
    sub_0202570C(obj->unk0, NULL);
}

void sub_0200A75C(struct UnkStruct_0200A090 *a0, struct UnkStruct_0200A090_sub4 *a1) {
    GF_ASSERT(a0 != NULL);
    GF_ASSERT(a0->objects != NULL);
    sub_0200ABC0(a1);
    sub_02025658(a0->resourceMgr, a1->unk0);
    a1->unk0 = NULL;
    a0->num--;
}

void sub_0200A790(struct UnkStruct_0200A090 *mgr) {
    int i;

    for (i = 0; i < mgr->max; i++) {
        if (mgr->objects[i].unk0 != NULL) {
            sub_0200A75C(mgr, &mgr->objects[i]);
        }
    }
}

struct UnkStruct_0200A090_sub4 *sub_0200A7BC(struct UnkStruct_0200A090 *mgr, int id) {
    int i, tmp;
    GF_ASSERT(mgr != NULL);
    for (i = 0; i < mgr->max; i++) {
        if (mgr->objects[i].unk0 != NULL) {
            tmp = sub_02025728(mgr->objects[i].unk0);
            if (tmp == id) {
                return &mgr->objects[i];
            }
        }
    }
    return NULL;
}

int sub_0200A7FC(struct UnkStruct_0200A090_sub4 *obj) {
    GF_ASSERT(obj != NULL);
    return sub_02025728(obj->unk0);
}

NNSG2dCharacterData *sub_0200A810(struct UnkStruct_0200A090_sub4 *obj) {
    struct CharResource_0200A090 *res;
    GF_ASSERT(obj->type == GF_GFX_RES_TYPE_CHAR);
    res = sub_0200ABD4(obj);
    return res->charData;
}

NNSG2dPaletteData *sub_0200A828(struct UnkStruct_0200A090_sub4 *obj) {
    struct PlttResource_0200A090 *res;
    GF_ASSERT(obj->type == GF_GFX_RES_TYPE_PLTT);
    res = sub_0200ABD4(obj);
    return res->plttData;
}

NNSG2dCellDataBank *sub_0200A840(struct UnkStruct_0200A090_sub4 *obj) {
    struct CellDataBankResource_0200A090 *res;
    GF_ASSERT(obj->type == GF_GFX_RES_TYPE_CELL);
    res = sub_0200ABD4(obj);
    return res->cellDataBank;
}

NNSG2dAnimBankData *sub_0200A858(struct UnkStruct_0200A090_sub4 *obj) {
    struct AnimBankDataResource_0200A090 *res;
    GF_ASSERT(obj->type == GF_GFX_RES_TYPE_ANIM);
    res = sub_0200ABD4(obj);
    return res->animBankData;
}

NNSG2dMultiCellDataBank *sub_0200A870(struct UnkStruct_0200A090_sub4 *obj) {
    struct MultiCellDataBankResource_0200A090 *res;
    GF_ASSERT(obj->type == GF_GFX_RES_TYPE_MCEL);
    res = sub_0200ABD4(obj);
    return res->multiCellDataBank;
}

NNSG2dAnimBankData *sub_0200A888(struct UnkStruct_0200A090_sub4 *obj) {
    struct MultiAnimBankDataResource_0200A090 *res;
    GF_ASSERT(obj->type == GF_GFX_RES_TYPE_MANM);
    res = sub_0200ABD4(obj);
    return res->animBankData;
}

GfGfxResType sub_0200A8A0(struct UnkStruct_0200A090_sub4 *obj) {
    GF_ASSERT(obj != NULL);
    return obj->type;
}

int sub_0200A8B0(struct UnkStruct_0200A090_sub4 *obj) {
    GF_ASSERT(obj != NULL);
    if (obj->type == GF_GFX_RES_TYPE_CHAR) {
        struct CharResource_0200A090 *res = sub_0200ABD4(obj);
        return res->vram;
    } else if (obj->type == GF_GFX_RES_TYPE_PLTT) {
        struct PlttResource_0200A090 *res = sub_0200ABD4(obj);
        return res->vram;
    } else {
        return 0;
    }
}

int sub_0200A8DC(struct UnkStruct_0200A090_sub4 *obj) {
    GF_ASSERT(obj != NULL);
    if (obj->type == GF_GFX_RES_TYPE_PLTT) {
        struct PlttResource_0200A090 *res = sub_0200ABD4(obj);
        return res->pltt_num;
    } else {
        return 0;
    }
}

u32 sub_0200A8FC(void) {
    return sizeof(struct UnkStruct_0200A110);
}

struct UnkStruct_0200A110 *sub_0200A900(struct UnkStruct_0200A110 *headers, int num) {
    return &headers[num];
}

void sub_0200A908(const void *a0, struct UnkStruct_0200A110 *header, HeapID heapId) {
    const int *x;
    GF_ASSERT(header != NULL);
    x = a0;
    header->type = x[0];
    header->isNarc = TRUE;
    header->num = sub_0200AC88((const struct UnkStruct_0200A110_sub2 *)(x + 1));
    if (header->num > 0) {
        header->table = AllocFromHeap(heapId, header->num * sizeof(struct UnkStruct_0200A110_sub2));
    } else {
        header->table = NULL;
    }
    if (header->table != NULL) {
        memcpy(header->table, (const struct UnkStruct_0200A110_sub2 *)(x + 1), header->num * sizeof(struct UnkStruct_0200A110_sub2));
    }
}

void sub_0200A954(struct UnkStruct_0200A110 *header) {
    if (header->table != NULL) {
        FreeToHeap(header->table);
    }
    header->table = NULL;
    header->num = 0;
}

int sub_0200A96C(const struct UnkStruct_0200A110 *header) {
    GF_ASSERT(header != NULL);
    return header->num;
}

int sub_0200A97C(struct UnkStruct_0200A110 *header, int idx) {
    GF_ASSERT(header != NULL);
    GF_ASSERT(header->num > idx);
    if (!header->isNarc) {
        struct UnkStruct_0200A110_sub *sub = header->table;
        return sub[idx].id;
    } else {
        struct UnkStruct_0200A110_sub2 *sub = header->table;
        return sub[idx].id;
    }
}

int sub_0200A9B0(struct UnkStruct_0200A110 *header, int idx) {
    int ret;
    GF_ASSERT(header != NULL);
    GF_ASSERT(header->num > idx);
    if (header->isNarc == TRUE) {
        struct UnkStruct_0200A110_sub2 *sub = header->table;
        ret = sub[idx].fileId;
    }
    return ret; // UB: if not narc, this is uninitialized
}

BOOL sub_0200A9DC(struct UnkStruct_0200A110 *header, int idx) {
    int ret;
    GF_ASSERT(header != NULL);
    GF_ASSERT(header->num > idx);
    if (header->isNarc == TRUE) {
        struct UnkStruct_0200A110_sub2 *sub = header->table;
        ret = sub[idx].compressed;
    }
    return ret; // UB: if not narc, this is uninitialized
}

int sub_0200AA08(struct UnkStruct_0200A110 *header, int idx) {
    GF_ASSERT(header != NULL);
    GF_ASSERT(header->num > idx);
    if (!header->isNarc) {
        struct UnkStruct_0200A110_sub *sub = header->table;
        return sub[idx].extra[0];
    } else {
        struct UnkStruct_0200A110_sub2 *sub = header->table;
        return sub[idx].extra[0];
    }
}

int sub_0200AA3C(struct UnkStruct_0200A110 *header, int idx) {
    GF_ASSERT(header != NULL);
    GF_ASSERT(header->num > idx);
    if (!header->isNarc) {
        struct UnkStruct_0200A110_sub *sub = header->table;
        return sub[idx].extra[1];
    } else {
        struct UnkStruct_0200A110_sub2 *sub = header->table;
        return sub[idx].extra[1];
    }
}

struct UnkStruct_0200A090_sub4 *sub_0200AA70(struct UnkStruct_0200A090 *mgr) {
    int i;

    for (i = 0; i < mgr->max; i++) {
        if (mgr->objects[i].unk0 == NULL) {
            return &mgr->objects[i];
        }
    }

    return NULL;
}
