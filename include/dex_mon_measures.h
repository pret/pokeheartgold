#ifndef POKEHEARTGOLD_DEX_MON_MEASURES_H
#define POKEHEARTGOLD_DEX_MON_MEASURES_H

#include "heap.h"

struct ZknHeightWeight {
    u32 *height;
    u32 *weight;
    u32 *unk_08;
    u32 *unk_0C;
    u32 *unk_10;
    u32 *unk_14;
}; // size=0x18

struct ZknHeightWeight *ZknData_Create(HeapID heapId);
void ZknData_Delete(struct ZknHeightWeight *zkn);
void ZknData_LoadAll(struct ZknHeightWeight *zkn, int mode, HeapID heapId);
void ZknData_UnloadAll(struct ZknHeightWeight *zkn);
u32 ZknData_GetHeight(struct ZknHeightWeight *zkn, int species);
u32 ZknData_GetWeight(struct ZknHeightWeight *zkn, int species);
void SetDexBanksByGiratinaForme(int forme);
NarcId GetDexZknDataNarcID(void);
int GetDexWeightMsgBank(void);
int GetDexHeightMsgBank(void);

static inline u32 SpeciesGetDexHeight(int species, HeapID heapId) {
    u32 ret;
    struct ZknHeightWeight *zkn;

    zkn = ZknData_Create(heapId);
    ZknData_LoadAll(zkn, 0, heapId);
    ret = ZknData_GetHeight(zkn, species);
    ZknData_UnloadAll(zkn);
    ZknData_Delete(zkn);

    return ret;
}

static inline u32 SpeciesGetDexWeight(int species, HeapID heapId) {
    u32 ret;
    struct ZknHeightWeight *zkn;

    zkn = ZknData_Create(heapId);
    ZknData_LoadAll(zkn, 0, heapId);
    ret = ZknData_GetWeight(zkn, species);
    ZknData_UnloadAll(zkn);
    ZknData_Delete(zkn);

    return ret;
}

#define LengthConvertToImperial(metric) ((((metric) * 1000) / 254 + 5) / 10)

#endif //POKEHEARTGOLD_DEX_MON_MEASURES_H
