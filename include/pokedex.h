#ifndef POKEHEARTGOLD_POKEDEX_H
#define POKEHEARTGOLD_POKEDEX_H

#include "save.h"
#include "heap.h"
#include "constants/species.h"
#include "constants/pokemon.h"

#define ROUND_UP(x,n)             (((x)+(n)-1)/(n))
#define NUM_DEX_FLAG_WORDS        (ROUND_UP(NATIONAL_DEX_COUNT+DEOXYS_FORME_MAX,32))

typedef struct POKEDEX {
    u32 magic;
    u32 caughtSpecies[NUM_DEX_FLAG_WORDS];
    u32 seenSpecies[NUM_DEX_FLAG_WORDS];
    u32 unk_084[2][NUM_DEX_FLAG_WORDS];
    u32 unk_104;
    u8 shellosFormeOrder;
    u8 gastrodonFormeOrder;
    u8 burmyFormeOrder;
    u8 wormadamFormeOrder;
    u8 unk_10C[28];
    u8 unk_128[28];
    u8 unk_144[0x1F3];
    u8 unk_337;
    u32 rotomFormeOrder;
    u8 shayminFormeOrder;
    u8 giratinaFormeOrder;
    u8 pichuFormeOrder;
    u8 dummy;
} POKEDEX; // size=0x340

u32 Save_Pokedex_sizeof(void);
POKEDEX *Pokedex_new(HeapID heapId);
void Save_Pokedex_init(POKEDEX *pokedex);
POKEDEX *Sav2_Pokedex_get(SAVEDATA *saveData);
BOOL Pokedex_GetNatDexFlag(const POKEDEX *pokedex);
BOOL Pokedex_CheckMonSeenFlag(const POKEDEX *pokedex, u16 species);

#endif //POKEHEARTGOLD_POKEDEX_H
