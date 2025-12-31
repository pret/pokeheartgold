#include "dex_mon_measures.h"

#include "global.h"

#include "constants/pokemon.h"

#include "application/zukanlist/zkn_data/zukan_data.naix"
#include "msgdata/msg.naix"

#include "filesystem.h"
#include "gf_gfx_loader.h"
#include "trainer_data.h"

static u32 *ZknNarc_LoadHeight(NARC *narc, enum HeapID heapID);
static u32 *ZknNarc_LoadWeight(NARC *narc, enum HeapID heapID);
static void ZknNarc_LoadYPosM(NARC *narc, s16 **pPlayerYPos, s16 **pMonYPos, enum HeapID heapID);
static void ZknNarc_LoadYPosF(NARC *narc, s16 **pPlayerYPos, s16 **pMonYPos, enum HeapID heapID);
static void ZknNarc_LoadScaleM(NARC *narc, s16 **pPlayerScale, s16 **pMonScale, enum HeapID heapID);
static void ZknNarc_LoadScaleF(NARC *narc, s16 **pPlayerScale, s16 **pMonScale, enum HeapID heapID);

static NarcId sDataNarcId = NARC_application_zukanlist_zkn_data_zukan_data;
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

void PokedexData_LoadAll(struct PokedexData *zkn, int playerGender, enum HeapID heapID) {
    NARC *narc;

    GF_ASSERT(zkn != NULL);
    GF_ASSERT(zkn->height == NULL);
    GF_ASSERT(zkn->weight == NULL);

    narc = NARC_New(GetPokedexDataNarcID(), heapID);
    zkn->height = ZknNarc_LoadHeight(narc, heapID);
    zkn->weight = ZknNarc_LoadWeight(narc, heapID);

    if (playerGender == TRAINER_MALE) {
        ZknNarc_LoadYPosM(narc, &zkn->playerYPos, &zkn->monYPos, heapID);
        ZknNarc_LoadScaleM(narc, &zkn->playerScale, &zkn->monScale, heapID);
    } else {
        ZknNarc_LoadYPosF(narc, &zkn->playerYPos, &zkn->monYPos, heapID);
        ZknNarc_LoadScaleF(narc, &zkn->playerScale, &zkn->monScale, heapID);
    }

    NARC_Delete(narc);
}

void PokedexData_UnloadAll(struct PokedexData *zkn) {
    GF_ASSERT(zkn->height != NULL);
    GF_ASSERT(zkn->weight != NULL);
    Heap_Free(zkn->height);
    Heap_Free(zkn->weight);
    Heap_Free(zkn->playerYPos);
    Heap_Free(zkn->monYPos);
    Heap_Free(zkn->playerScale);
    Heap_Free(zkn->monScale);
    zkn->height = NULL;
    zkn->weight = NULL;
    zkn->playerYPos = NULL;
    zkn->monYPos = NULL;
    zkn->playerScale = NULL;
    zkn->monScale = NULL;
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
    return GfGfxLoader_LoadFromOpenNarc(narc, NARC_zukan_data_mon_stats_height, FALSE, heapID, FALSE);
}

static u32 *ZknNarc_LoadWeight(NARC *narc, enum HeapID heapID) {
    return GfGfxLoader_LoadFromOpenNarc(narc, NARC_zukan_data_mon_stats_weight, FALSE, heapID, FALSE);
}

static void ZknNarc_LoadYPosM(NARC *narc, s16 **pPlayerYPos, s16 **pMonYPos, enum HeapID heapID) {
    *pPlayerYPos = GfGfxLoader_LoadFromOpenNarc(narc, NARC_zukan_data_mon_stats_player_ypos_m, FALSE, heapID, FALSE);
    *pMonYPos = GfGfxLoader_LoadFromOpenNarc(narc, NARC_zukan_data_mon_stats_mon_ypos_m, FALSE, heapID, FALSE);
}

static void ZknNarc_LoadYPosF(NARC *narc, s16 **pPlayerYPos, s16 **pMonYPos, enum HeapID heapID) {
    *pPlayerYPos = GfGfxLoader_LoadFromOpenNarc(narc, NARC_zukan_data_mon_stats_player_ypos_f, FALSE, heapID, FALSE);
    *pMonYPos = GfGfxLoader_LoadFromOpenNarc(narc, NARC_zukan_data_mon_stats_mon_ypos_f, FALSE, heapID, FALSE);
}

static void ZknNarc_LoadScaleM(NARC *narc, s16 **pPlayerScale, s16 **pMonScale, enum HeapID heapID) {
    *pPlayerScale = GfGfxLoader_LoadFromOpenNarc(narc, NARC_zukan_data_mon_stats_player_scale_m, FALSE, heapID, FALSE);
    *pMonScale = GfGfxLoader_LoadFromOpenNarc(narc, NARC_zukan_data_mon_stats_mon_scale_m, FALSE, heapID, FALSE);
}

static void ZknNarc_LoadScaleF(NARC *narc, s16 **pPlayerScale, s16 **pMonScale, enum HeapID heapID) {
    *pPlayerScale = GfGfxLoader_LoadFromOpenNarc(narc, NARC_zukan_data_mon_stats_player_scale_f, FALSE, heapID, FALSE);
    *pMonScale = GfGfxLoader_LoadFromOpenNarc(narc, NARC_zukan_data_mon_stats_mon_scale_f, FALSE, heapID, FALSE);
}

void SetDexBanksByGiratinaForm(int form) {
    if (form == GIRATINA_ALTERED) {
        sDataNarcId = NARC_application_zukanlist_zkn_data_zukan_data_gira;
        sWeightMsgBank = NARC_msg_msg_0813_bin;
        sHeightMsgBank = NARC_msg_msg_0815_bin;
    } else {
        sDataNarcId = NARC_application_zukanlist_zkn_data_zukan_data;
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
