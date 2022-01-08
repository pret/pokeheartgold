#ifndef POKEHEARTGOLD_POKEDEX_H
#define POKEHEARTGOLD_POKEDEX_H

#include "save.h"
#include "heap.h"
#include "constants/species.h"
#include "constants/pokemon.h"

#define ROUND_UP(x,n)             (((x)+(n)-1)&~((n)-1))
#define CEILDIV(x,n)              (((x)+(n)-1)/(n))
#define NUM_DEX_FLAG_WORDS        (CEILDIV(NATIONAL_DEX_COUNT+DEOXYS_FORME_MAX,32))

typedef struct POKEDEX {
    u32 magic;
    u32 caughtSpecies[NUM_DEX_FLAG_WORDS];
    u32 seenSpecies[NUM_DEX_FLAG_WORDS];
    u32 seenGenders[2][NUM_DEX_FLAG_WORDS];
    u32 spindaPersonality;
    u8 shellosFormeOrder;
    u8 gastrodonFormeOrder;
    u8 burmyFormeOrder;
    u8 wormadamFormeOrder;
    u8 unownSeenOrder[28];
    u8 unownCaughtOrder[28];
    u8 caughtLanguages[ROUND_UP(NATIONAL_DEX_COUNT,4)];
    u8 unk_334;
    u8 enabledInternational;
    u8 dexEnabled;
    u8 nationalDex;
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
BOOL Pokedex_CheckMonCaughtFlag(const POKEDEX *pokedex, u16 species);
BOOL Pokedex_CheckMonSeenFlag(const POKEDEX *pokedex, u16 species);
u16 Pokedex_CountNationalDexOwned(POKEDEX *pokedex);
u16 Pokedex_CountNationalOwned_ExcludeMythical(POKEDEX *pokedex);
u16 Pokedex_CountNationalDexSeen(POKEDEX *pokedex);
u16 Pokedex_CountJohtoDexOwned(POKEDEX *pokedex);
u16 Pokedex_CountJohtoOwned_ExcludeMythical(POKEDEX *pokedex);
u16 Pokedex_CountJohtoDexSeen(POKEDEX *pokedex);

#endif //POKEHEARTGOLD_POKEDEX_H
