#ifndef POKEHEARTGOLD_POKEDEX_H
#define POKEHEARTGOLD_POKEDEX_H

#include "save.h"
#include "heap.h"

typedef struct POKEDEX {
    u8 filler_000[0x340];
} POKEDEX;

u32 Save_Pokedex_sizeof(void);
POKEDEX *Pokedex_new(HeapID heapId);
void Save_Pokedex_init(POKEDEX *pokedex);
POKEDEX *Sav2_Pokedex_get(SAVEDATA *saveData);
BOOL Pokedex_GetNatDexFlag(POKEDEX *pokedex);

#endif //POKEHEARTGOLD_POKEDEX_H
