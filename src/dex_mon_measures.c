#include "dex_mon_measures.h"

#include "global.h"

#include "msgdata/msg.naix"

#include "filesystem.h"
#include "gf_gfx_loader.h"

static u32 *ZknNarc_LoadHeight(NARC *narc, enum HeapID heapID);
static u32 *ZknNarc_LoadWeight(NARC *narc, enum HeapID heapID);
static void sub_02091470(NARC *narc, u32 **a1, u32 **a2, enum HeapID heapID);
static void sub_02091498(NARC *narc, u32 **a1, u32 **a2, enum HeapID heapID);
static void sub_020914C0(NARC *narc, u32 **a1, u32 **a2, enum HeapID heapID);
static void sub_020914E8(NARC *narc, u32 **a1, u32 **a2, enum HeapID heapID);

static NarcId sDataNarcId = NARC_application_zukanlist_zukan_data_zukan_data;
static int sWeightMsgBank = NARC_msg_msg_0812_bin;
static int sHeightMsgBank = NARC_msg_msg_0814_bin;

struct PokedexData *PokedexData_Create(enum HeapID heapID) {
    struct PokedexData *ret;

    ret = Heap_Alloc(heapID, sizeof(struct PokedexData));
    memset(ret, 0, sizeof(struct PokedexData));
    return ret;
}

void PokedexData_Delete(struct PokedexData *zkn) {
    GF_ASSERT(zkn != NULL);
    Heap_Free(zkn);
}

void PokedexData_LoadAll(struct PokedexData *zkn, int mode, enum HeapID heapID) {
    NARC *narc;

    GF_ASSERT(zkn != NULL);
    GF_ASSERT(zkn->height == NULL);
    GF_ASSERT(zkn->weight == NULL);

    narc = NARC_New(GetPokedexDataNarcID(), heapID);
    zkn->height = ZknNarc_LoadHeight(narc, heapID);
    zkn->weight = ZknNarc_LoadWeight(narc, heapID);

    if (mode == 0) {
        sub_02091470(narc, &zkn->unk_08, &zkn->unk_0C, heapID);
        sub_020914C0(narc, &zkn->unk_10, &zkn->unk_14, heapID);
    } else {
        sub_02091498(narc, &zkn->unk_08, &zkn->unk_0C, heapID);
        sub_020914E8(narc, &zkn->unk_10, &zkn->unk_14, heapID);
    }

    NARC_Delete(narc);
}

void PokedexData_UnloadAll(struct PokedexData *zkn) {
    GF_ASSERT(zkn->height != NULL);
    GF_ASSERT(zkn->weight != NULL);
    Heap_Free(zkn->height);
    Heap_Free(zkn->weight);
    Heap_Free(zkn->unk_08);
    Heap_Free(zkn->unk_0C);
    Heap_Free(zkn->unk_10);
    Heap_Free(zkn->unk_14);
    zkn->height = NULL;
    zkn->weight = NULL;
    zkn->unk_08 = NULL;
    zkn->unk_0C = NULL;
    zkn->unk_10 = NULL;
    zkn->unk_14 = NULL;
}

u32 PokedexData_GetHeight(struct PokedexData *zkn, int species) {
    GF_ASSERT(zkn != NULL);
    GF_ASSERT(zkn->height != NULL);
    return zkn->height[species];
}

u32 PokedexData_GetWeight(struct PokedexData *zkn, int species) {
    GF_ASSERT(zkn != NULL);
    GF_ASSERT(zkn->weight != NULL);
    return zkn->weight[species];
}

static u32 *ZknNarc_LoadHeight(NARC *narc, enum HeapID heapID) {
    return GfGfxLoader_LoadFromOpenNarc(narc, 0, FALSE, heapID, FALSE);
}

static u32 *ZknNarc_LoadWeight(NARC *narc, enum HeapID heapID) {
    return GfGfxLoader_LoadFromOpenNarc(narc, 1, FALSE, heapID, FALSE);
}

static void sub_02091470(NARC *narc, u32 **a1, u32 **a2, enum HeapID heapID) {
    *a1 = GfGfxLoader_LoadFromOpenNarc(narc, 9, FALSE, heapID, FALSE);
    *a2 = GfGfxLoader_LoadFromOpenNarc(narc, 10, FALSE, heapID, FALSE);
}

static void sub_02091498(NARC *narc, u32 **a1, u32 **a2, enum HeapID heapID) {
    *a1 = GfGfxLoader_LoadFromOpenNarc(narc, 7, FALSE, heapID, FALSE);
    *a2 = GfGfxLoader_LoadFromOpenNarc(narc, 8, FALSE, heapID, FALSE);
}

static void sub_020914C0(NARC *narc, u32 **a1, u32 **a2, enum HeapID heapID) {
    *a1 = GfGfxLoader_LoadFromOpenNarc(narc, 5, FALSE, heapID, FALSE);
    *a2 = GfGfxLoader_LoadFromOpenNarc(narc, 6, FALSE, heapID, FALSE);
}

static void sub_020914E8(NARC *narc, u32 **a1, u32 **a2, enum HeapID heapID) {
    *a1 = GfGfxLoader_LoadFromOpenNarc(narc, 3, FALSE, heapID, FALSE);
    *a2 = GfGfxLoader_LoadFromOpenNarc(narc, 4, FALSE, heapID, FALSE);
}

void SetDexBanksByGiratinaForm(int form) {
    if (form == 0) {
        sDataNarcId = NARC_application_zukanlist_zukan_data_zukan_data_gira;
        sWeightMsgBank = NARC_msg_msg_0813_bin;
        sHeightMsgBank = NARC_msg_msg_0815_bin;
    } else {
        sDataNarcId = NARC_application_zukanlist_zukan_data_zukan_data;
        sWeightMsgBank = NARC_msg_msg_0812_bin;
        sHeightMsgBank = NARC_msg_msg_0814_bin;
    }
}

NarcId GetPokedexDataNarcID(void) {
    return sDataNarcId;
}

int GetDexWeightMsgBank(void) {
    return sWeightMsgBank;
}

int GetDexHeightMsgBank(void) {
    return sHeightMsgBank;
}
