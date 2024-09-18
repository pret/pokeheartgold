#ifndef POKEHEARTGOLD_DEX_MON_MEASURES_H
#define POKEHEARTGOLD_DEX_MON_MEASURES_H

#include "filesystem.h"
#include "heap.h"

typedef struct PokedexData {
    u32 *height;
    u32 *weight;
    u32 *unk_08;
    u32 *unk_0C;
    u32 *unk_10;
    u32 *unk_14;
} PokedexData; // size=0x18

struct PokedexData *PokedexData_Create(HeapID heapId);
void PokedexData_Delete(struct PokedexData *zkn);
void PokedexData_LoadAll(struct PokedexData *zkn, int mode, HeapID heapId);
void PokedexData_UnloadAll(struct PokedexData *zkn);
u32 PokedexData_GetHeight(struct PokedexData *zkn, int species);
u32 PokedexData_GetWeight(struct PokedexData *zkn, int species);
void SetDexBanksByGiratinaForm(int form);
NarcId GetPokedexDataNarcID(void);
int GetDexWeightMsgBank(void);
int GetDexHeightMsgBank(void);

static inline u32 SpeciesGetDexHeight(int species, HeapID heapId) {
    u32 ret;
    struct PokedexData *zkn;

    zkn = PokedexData_Create(heapId);
    PokedexData_LoadAll(zkn, 0, heapId);
    ret = PokedexData_GetHeight(zkn, species);
    PokedexData_UnloadAll(zkn);
    PokedexData_Delete(zkn);

    return ret;
}

static inline u32 SpeciesGetDexWeight(int species, HeapID heapId) {
    u32 ret;
    struct PokedexData *zkn;

    zkn = PokedexData_Create(heapId);
    PokedexData_LoadAll(zkn, 0, heapId);
    ret = PokedexData_GetWeight(zkn, species);
    PokedexData_UnloadAll(zkn);
    PokedexData_Delete(zkn);

    return ret;
}

#define LengthConvertToImperial(metric) ((((metric) * 1000) / 254 + 5) / 10)

#endif // POKEHEARTGOLD_DEX_MON_MEASURES_H
