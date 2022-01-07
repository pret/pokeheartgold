#ifndef POKEHEARTGOLD_POKEDEX_H
#define POKEHEARTGOLD_POKEDEX_H

#include "save.h"
#include "heap.h"

typedef struct POKEDEX {
    u32 magic;
    u8 filler_004[0x80];
    u8 unk_084[2][0x40];
    u8 unk_104[0x4];
    u8 unk_108;
    u8 unk_109;
    u8 unk_10A;
    u8 unk_10B;
    u8 unk_10C[0x1C];
    u8 unk_128[0x1C];
    u8 unk_144[0x1F3];
    u8 unk_337;
    int unk_338;
    u8 unk_33C;
    u8 unk_33D;
    u8 unk_33E;
} POKEDEX; // size=0x340

u32 Save_Pokedex_sizeof(void);
POKEDEX *Pokedex_new(HeapID heapId);
void Save_Pokedex_init(POKEDEX *pokedex);
POKEDEX *Sav2_Pokedex_get(SAVEDATA *saveData);
BOOL Pokedex_GetNatDexFlag(POKEDEX *pokedex);
BOOL Pokedex_CheckMonSeenFlag(POKEDEX *pokedex, u16 species);

#endif //POKEHEARTGOLD_POKEDEX_H
