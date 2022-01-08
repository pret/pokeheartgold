#ifndef POKEHEARTGOLD_POKEDEX_H
#define POKEHEARTGOLD_POKEDEX_H

#include "save.h"
#include "heap.h"
#include "constants/species.h"

#define NUM_DEX_FLAG_WORDS        ((NATIONAL_DEX_COUNT+35)/32)

typedef struct POKEDEX {
    u32 magic;
    u32 unk_004[NUM_DEX_FLAG_WORDS];
    u32 unk_044[NUM_DEX_FLAG_WORDS];
    u32 unk_084[2][NUM_DEX_FLAG_WORDS];
    u32 unk_104;
    u8 unk_108;
    u8 unk_109;
    u8 unk_10A;
    u8 unk_10B;
    u8 unk_10C[28];
    u8 unk_128[28];
    u8 unk_144[0x1F3];
    u8 unk_337;
    u32 unk_338;
    u8 unk_33C;
    u8 unk_33D;
    u8 unk_33E;
    u8 dummy;
} POKEDEX; // size=0x340

u32 Save_Pokedex_sizeof(void);
POKEDEX *Pokedex_new(HeapID heapId);
void Save_Pokedex_init(POKEDEX *pokedex);
POKEDEX *Sav2_Pokedex_get(SAVEDATA *saveData);
BOOL Pokedex_GetNatDexFlag(const POKEDEX *pokedex);
BOOL Pokedex_CheckMonSeenFlag(const POKEDEX *pokedex, u16 species);

#endif //POKEHEARTGOLD_POKEDEX_H
