#ifndef POKEHEARTGOLD_DEX_MON_MEASURES_H
#define POKEHEARTGOLD_DEX_MON_MEASURES_H

#include "filesystem.h"
#include "heap.h"

typedef struct PokedexData {
    u32 *height;
    u32 *weight;
    s16 *playerYPos;
    s16 *monYPos;
    s16 *playerScale;
    s16 *monScale;
} PokedexData; // size=0x18

PokedexData *PokedexData_Create(enum HeapID heapID);
void PokedexData_Delete(PokedexData *pokedexData);
void PokedexData_LoadAll(PokedexData *pokedexData, int playerGender, enum HeapID heapID);
void PokedexData_UnloadAll(PokedexData *pokedexData);
u32 PokedexData_GetHeight(PokedexData *pokedexData, int species);
u32 PokedexData_GetWeight(PokedexData *pokedexData, int species);
void SetDexBanksByGiratinaForm(int form);
NarcId GetPokedexDataNarcID(void);
int GetDexWeightMsgBank(void);
int GetDexHeightMsgBank(void);

static inline u32 SpeciesGetDexHeight(int species, enum HeapID heapID) {
    u32 ret;
    PokedexData *pokedexData;

    pokedexData = PokedexData_Create(heapID);
    PokedexData_LoadAll(pokedexData, 0, heapID);
    ret = PokedexData_GetHeight(pokedexData, species);
    PokedexData_UnloadAll(pokedexData);
    PokedexData_Delete(pokedexData);

    return ret;
}

static inline u32 SpeciesGetDexWeight(int species, enum HeapID heapID) {
    u32 ret;
    PokedexData *pokedexData;

    pokedexData = PokedexData_Create(heapID);
    PokedexData_LoadAll(pokedexData, 0, heapID);
    ret = PokedexData_GetWeight(pokedexData, species);
    PokedexData_UnloadAll(pokedexData);
    PokedexData_Delete(pokedexData);

    return ret;
}

#define LengthConvertToImperial(metric) ((((metric) * 1000) / 254 + 5) / 10)

#endif // POKEHEARTGOLD_DEX_MON_MEASURES_H
