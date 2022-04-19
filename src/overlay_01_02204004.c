#include "overlay_01.h"

static struct UnkStruct_ov01_02004004_sub *ov01_02204168(struct UnkStruct_ov01_02004004 *mgr, const NNSG3dResFileHeader **header, int fileId);
static BOOL ov01_02204144(struct UnkStruct_ov01_02004004 *mgr, int fileId);

struct UnkStruct_ov01_02004004 *ov01_02204004(HeapID heapId, int nmax, int a2, NNSG3dResFileHeader **modelFileHeaders) {
    struct UnkStruct_ov01_02004004 *ret = AllocFromHeap(heapId, sizeof(struct UnkStruct_ov01_02004004));
    int i;

    ret->unk10 = 0;
    ret->unk14 = nmax;
    ret->unk18 = a2;
    ret->modelFileHeaders = modelFileHeaders;
    ret->activeList = AllocFromHeap(heapId, nmax * sizeof(u8));
    for (i = 0; i < nmax; i++) {
        ret->activeList[i] = 0xFF;
    }
    ret->unk8 = AllocFromHeap(heapId, a2 * sizeof(struct UnkStruct_ov01_02004004_sub));
    MI_CpuClearFast(ret->unk8, a2 * sizeof(struct UnkStruct_ov01_02004004_sub));
    ret->unkC = AllocFromHeap(heapId, a2 * sizeof(struct UnkStruct_ov01_02004004_sub *));
    for (i = 0; i < a2; i++) {
        ret->unkC[i] = &ret->unk8[i];
    }
    return ret;
}

void ov01_02204084(struct UnkStruct_ov01_02004004 *unk) {
    FreeToHeap(unk->activeList);
    FreeToHeap(unk->unk8);
    FreeToHeap(unk->unkC);
    FreeToHeap(unk);
}

struct UnkStruct_ov01_02004004_sub *ov01_022040A4(struct UnkStruct_ov01_02004004 *mgr, s32 fileId) {
    const NNSG3dResFileHeader *sp0;
    mgr->activeList[fileId] = mgr->unk10;
    sp0 = mgr->modelFileHeaders[fileId];
    return ov01_02204168(mgr, &sp0, fileId);
}

void ov01_022040C0(struct UnkStruct_ov01_02004004 *mgr, struct UnkStruct_ov01_02004004_sub *mdl) {
    mgr->unkC[--mgr->unk10] = mdl;
}

struct UnkStruct_ov01_02004004_sub *ov01_022040D0(struct UnkStruct_ov01_02004004 *mgr, int idx) {
    if (mgr->activeList[idx] != 0xFF) {
        return mgr->unkC[mgr->activeList[idx]];
    } else {
        return NULL;
    }
}

struct UnkStruct_ov01_02004004_sub *ov01_022040E4(struct UnkStruct_ov01_02004004 *mgr, s32 fileId) {
    const NNSG3dResFileHeader *sp0;
    sp0 = mgr->modelFileHeaders[fileId];
    return ov01_02204168(mgr, &sp0, fileId);
}

struct UnkStruct_ov01_02004004_sub *ov01_022040F8(struct UnkStruct_ov01_02004004 *mgr, s32 fileId) {
    if (ov01_02204144(mgr, fileId)) {
        return ov01_022040D0(mgr, fileId);
    } else {
        return ov01_022040E4(mgr, fileId);
    }
}

BOOL ov01_0220411C(struct UnkStruct_ov01_02004004 *mgr, struct UnkStruct_ov01_02004004_sub *mdl) {
    if (mdl == NULL) {
        return FALSE;
    }
    if (!ov01_02204144(mgr, mdl->fileId)) {
        ov01_022040C0(mgr, mdl);
        return TRUE;
    }
    return FALSE;
}

static BOOL ov01_02204144(struct UnkStruct_ov01_02004004 *mgr, int fileId) {
    return mgr->activeList[fileId] != 0xFF;
}

BOOL ov01_02204154(struct UnkStruct_ov01_02004004 *mgr, int fileId) {
    return mgr->modelFileHeaders[fileId] != NULL;
}

static struct UnkStruct_ov01_02004004_sub *ov01_02204168(struct UnkStruct_ov01_02004004 *mgr, const NNSG3dResFileHeader **header, int fileId) {
    struct UnkStruct_ov01_02004004_sub *ret;
    mgr->unkC[mgr->unk10]->pResMdl = NNS_G3dGetMdlByIdx(NNS_G3dGetMdlSet(*header), 0);
    NNS_G3dRenderObjInit(&mgr->unkC[mgr->unk10]->renderObj, mgr->unkC[mgr->unk10]->pResMdl);
    ret = mgr->unkC[mgr->unk10];
    mgr->unk10++;
    ret->fileId = fileId;
    return ret;
}
