#include "msgdata/msg.naix"
#include "filesystem.h"
#include "dex_mon_measures.h"
#include "gf_gfx_loader.h"

static u32 *ZknNarc_LoadHeight(NARC *narc, HeapID heapId);
static u32 *ZknNarc_LoadWeight(NARC *narc, HeapID heapId);
static void sub_02091470(NARC *narc, u32 **a1, u32 **a2, HeapID heapId);
static void sub_02091498(NARC *narc, u32 **a1, u32 **a2, HeapID heapId);
static void sub_020914C0(NARC *narc, u32 **a1, u32 **a2, HeapID heapId);
static void sub_020914E8(NARC *narc, u32 **a1, u32 **a2, HeapID heapId);

static NarcId sDataNarcId = NARC_application_zukanlist_zukan_data_zukan_data;
static int sWeightMsgBank = NARC_msg_msg_0812_bin;
static int sHeightMsgBank = NARC_msg_msg_0814_bin;

struct ZknHeightWeight *ZknData_Create(HeapID heapId) {
    struct ZknHeightWeight *ret;

    ret = AllocFromHeap(heapId, sizeof(struct ZknHeightWeight));
    memset(ret, 0, sizeof(struct ZknHeightWeight));
    return ret;
}

void ZknData_Delete(struct ZknHeightWeight *zkn) {
    GF_ASSERT(zkn != NULL);
    FreeToHeap(zkn);
}

void ZknData_LoadAll(struct ZknHeightWeight *zkn, int mode, HeapID heapId) {
    NARC *narc;

    GF_ASSERT(zkn != NULL);
    GF_ASSERT(zkn->height == NULL);
    GF_ASSERT(zkn->weight == NULL);

    narc = NARC_ctor(GetDexZknDataNarcID(), heapId);
    zkn->height = ZknNarc_LoadHeight(narc, heapId);
    zkn->weight = ZknNarc_LoadWeight(narc, heapId);

    if (mode == 0) {
        sub_02091470(narc, &zkn->unk_08, &zkn->unk_0C, heapId);
        sub_020914C0(narc, &zkn->unk_10, &zkn->unk_14, heapId);
    } else {
        sub_02091498(narc, &zkn->unk_08, &zkn->unk_0C, heapId);
        sub_020914E8(narc, &zkn->unk_10, &zkn->unk_14, heapId);
    }

    NARC_dtor(narc);
}

void ZknData_UnloadAll(struct ZknHeightWeight *zkn) {
    GF_ASSERT(zkn->height != NULL);
    GF_ASSERT(zkn->weight != NULL);
    FreeToHeap(zkn->height);
    FreeToHeap(zkn->weight);
    FreeToHeap(zkn->unk_08);
    FreeToHeap(zkn->unk_0C);
    FreeToHeap(zkn->unk_10);
    FreeToHeap(zkn->unk_14);
    zkn->height = NULL;
    zkn->weight = NULL;
    zkn->unk_08 = NULL;
    zkn->unk_0C = NULL;
    zkn->unk_10 = NULL;
    zkn->unk_14 = NULL;
}

u32 ZknData_GetHeight(struct ZknHeightWeight *zkn, int species) {
    GF_ASSERT(zkn != NULL);
    GF_ASSERT(zkn->height != NULL);
    return zkn->height[species];
}

u32 ZknData_GetWeight(struct ZknHeightWeight *zkn, int species) {
    GF_ASSERT(zkn != NULL);
    GF_ASSERT(zkn->weight != NULL);
    return zkn->weight[species];
}

static u32 *ZknNarc_LoadHeight(NARC *narc, HeapID heapId) {
    return GfGfxLoader_LoadFromOpenNarc(narc, 0, FALSE, heapId, FALSE);
}

static u32 *ZknNarc_LoadWeight(NARC *narc, HeapID heapId) {
    return GfGfxLoader_LoadFromOpenNarc(narc, 1, FALSE, heapId, FALSE);
}

static void sub_02091470(NARC *narc, u32 **a1, u32 **a2, HeapID heapId) {
    *a1 = GfGfxLoader_LoadFromOpenNarc(narc, 9, FALSE, heapId, FALSE);
    *a2 = GfGfxLoader_LoadFromOpenNarc(narc, 10, FALSE, heapId, FALSE);
}

static void sub_02091498(NARC *narc, u32 **a1, u32 **a2, HeapID heapId) {
    *a1 = GfGfxLoader_LoadFromOpenNarc(narc, 7, FALSE, heapId, FALSE);
    *a2 = GfGfxLoader_LoadFromOpenNarc(narc, 8, FALSE, heapId, FALSE);
}

static void sub_020914C0(NARC *narc, u32 **a1, u32 **a2, HeapID heapId) {
    *a1 = GfGfxLoader_LoadFromOpenNarc(narc, 5, FALSE, heapId, FALSE);
    *a2 = GfGfxLoader_LoadFromOpenNarc(narc, 6, FALSE, heapId, FALSE);
}

static void sub_020914E8(NARC *narc, u32 **a1, u32 **a2, HeapID heapId) {
    *a1 = GfGfxLoader_LoadFromOpenNarc(narc, 3, FALSE, heapId, FALSE);
    *a2 = GfGfxLoader_LoadFromOpenNarc(narc, 4, FALSE, heapId, FALSE);
}

void SetDexBanksByGiratinaForme(int forme) {
    if (forme == 0) {
        sDataNarcId = NARC_application_zukanlist_zukan_data_zukan_data_gira;
        sWeightMsgBank = NARC_msg_msg_0813_bin;
        sHeightMsgBank = NARC_msg_msg_0815_bin;
    } else {
        sDataNarcId = NARC_application_zukanlist_zukan_data_zukan_data;
        sWeightMsgBank = NARC_msg_msg_0812_bin;
        sHeightMsgBank = NARC_msg_msg_0814_bin;
    }
}

NarcId GetDexZknDataNarcID(void) {
    return sDataNarcId;
}

int GetDexWeightMsgBank(void) {
    return sWeightMsgBank;
}

int GetDexHeightMsgBank(void) {
    return sHeightMsgBank;
}
