#include "unk_0200A090.h"

BOOL sub_0200A728(struct UnkStruct_0200A090 *mgr, int a1);
void sub_0200A790(struct UnkStruct_0200A090 *mgr);
int sub_0200A7FC(struct UnkStruct_0200A090_sub4 *obj);
int sub_0200A8B0(struct UnkStruct_0200A090_sub4 *obj);
int sub_0200A8DC(struct UnkStruct_0200A090_sub4 *obj);
struct UnkStruct_0200A090_sub4 *sub_0200AA70(struct UnkStruct_0200A090 *mgr);
void sub_0200ABEC(struct UnkStruct_0200A090 *mgr, struct UnkStruct_0200A090_sub4 *a1, char *a2, int a3, int a4, int a5, int a6, HeapID heapId);
void sub_0200AC18(struct UnkStruct_0200A090 *mgr, struct UnkStruct_0200A090_sub4 *obj, NarcId narcId, int fileId, BOOL compressed, int id, int vram, int pltt_num, int type, HeapID heapId, BOOL atEnd);
void sub_0200AC50(struct UnkStruct_0200A090 *mgr, struct UnkStruct_0200A090_sub4 *obj, NARC *narc, int fileId, BOOL compressed, int tag, int vram, int pltt_num, int type, HeapID heapId, BOOL atEnd);

struct UnkStruct_0200A090 *sub_0200A090(int num, int type, HeapID heapId) {
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
    GF_ASSERT(mgr->type == 0);
    ret = sub_0200AA70(mgr);
    GF_ASSERT(ret != NULL);
    sub_0200AC18(mgr, ret, narcId, fileId, compressed, id, vram, 0, 0, heapId, FALSE);
    mgr->num++;
    return ret;
}

struct UnkStruct_0200A090_sub4 *sub_0200A234(struct UnkStruct_0200A090 *mgr, NarcId narcId, int fileId, BOOL compressed, int id, int vram, int pltt_num, HeapID heapId) {
    struct UnkStruct_0200A090_sub4 *ret;
    GF_ASSERT(mgr != NULL);
    GF_ASSERT(mgr->type == 1);
    ret = sub_0200AA70(mgr);
    GF_ASSERT(ret != NULL);
    sub_0200AC18(mgr, ret, narcId, fileId, compressed, id, vram, pltt_num, 1, heapId, FALSE);
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
    GF_ASSERT(mgr->type == 0);
    GF_ASSERT(obj != NULL);
    GF_ASSERT(obj->type == 0);
    id = sub_0200A7FC(obj);
    vram = sub_0200A8B0(obj);
    sub_0200A75C(mgr, obj);
    sub_0200AC18(mgr, obj, narcId, fileId, compressed, id, vram, 0, 0, heapId, FALSE);
}

void sub_0200A350(struct UnkStruct_0200A090 *mgr, struct UnkStruct_0200A090_sub4 *obj, NarcId narcId, int fileId, BOOL compressed, HeapID heapId) {
    int id;
    int vram;
    int pltt_num;
    GF_ASSERT(mgr != NULL);
    GF_ASSERT(mgr->type == 1);
    GF_ASSERT(obj != NULL);
    GF_ASSERT(obj->type == 1);
    id = sub_0200A7FC(obj);
    vram = sub_0200A8B0(obj);
    pltt_num = sub_0200A8DC(obj);
    sub_0200A75C(mgr, obj);
    sub_0200AC18(mgr, obj, narcId, fileId, compressed, id, vram, pltt_num, 1, heapId, FALSE);
}

struct UnkStruct_0200A090_sub4 *sub_0200A3C8(struct UnkStruct_0200A090 *mgr, NARC *narc, int fileId, BOOL compressed, int tag, int vram, HeapID heapId) {
    struct UnkStruct_0200A090_sub4 *ret;
    GF_ASSERT(mgr != NULL);
    GF_ASSERT(mgr->type == 0);
    ret = sub_0200AA70(mgr);
    GF_ASSERT(ret != NULL);
    sub_0200AC50(mgr, ret, narc, fileId, compressed, tag, vram, 0, 0, heapId, FALSE);
    mgr->num++;
    return ret;
}

struct UnkStruct_0200A090_sub4 *sub_0200A424(struct UnkStruct_0200A090 *mgr, NARC *narc, int fileId, BOOL compressed, int tag, int vram, HeapID heapId, BOOL atEnd) {
    struct UnkStruct_0200A090_sub4 *ret;
    GF_ASSERT(mgr != NULL);
    GF_ASSERT(mgr->type == 0);
    ret = sub_0200AA70(mgr);
    GF_ASSERT(ret != NULL);
    sub_0200AC50(mgr, ret, narc, fileId, compressed, tag, vram, 0, 0, heapId, atEnd);
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
    GF_ASSERT(mgr->type == 1);
    ret = sub_0200AA70(mgr);
    GF_ASSERT(ret != NULL);
    sub_0200AC50(mgr, ret, narc, fileId, compressed, tag, vram, pltt_num, 1, heapId, atEnd);
    mgr->num++;
    return ret;
}

struct UnkStruct_0200A090_sub4 *sub_0200A540(struct UnkStruct_0200A090 *mgr, NARC *narc, int fileId, BOOL compressed, int id, int type, HeapID heapId) {
    struct UnkStruct_0200A090_sub4 *ret;
    GF_ASSERT(mgr != NULL);
    //GF_ASSERT(mgr->type == type);
    ret = sub_0200AA70(mgr);
    GF_ASSERT(ret != NULL);
    sub_0200AC50(mgr, ret, narc, fileId, compressed, id, 0, 0, type, heapId, FALSE);
    mgr->num++;
    return ret;
}

void sub_0200A590(struct UnkStruct_0200A090 *mgr, struct UnkStruct_0200A090_sub4 *obj, NARC *narc, int fileId, BOOL compressed, HeapID heapId) {
    int id;
    int vram;
    GF_ASSERT(mgr != NULL);
    GF_ASSERT(mgr->type == 0);
    GF_ASSERT(obj != NULL);
    GF_ASSERT(obj->type == 0);
    id = sub_0200A7FC(obj);
    vram = sub_0200A8B0(obj);
    sub_0200A75C(mgr, obj);
    sub_0200AC50(mgr, obj, narc, fileId, compressed, id, vram, 0, 0, heapId, FALSE);
}

void sub_0200A5FC(struct UnkStruct_0200A090 *mgr, struct UnkStruct_0200A090_sub4 *obj, NARC *narc, int fileId, BOOL compressed, HeapID heapId) {
    int id;
    int vram;
    int pltt_num;
    GF_ASSERT(mgr != NULL);
    GF_ASSERT(mgr->type == 1);
    GF_ASSERT(obj != NULL);
    GF_ASSERT(obj->type == 1);
    id = sub_0200A7FC(obj);
    vram = sub_0200A8B0(obj);
    pltt_num = sub_0200A8DC(obj);
    sub_0200A75C(mgr, obj);
    sub_0200AC50(mgr, obj, narc, fileId, compressed, id, vram, pltt_num, 1, heapId, FALSE);
}
