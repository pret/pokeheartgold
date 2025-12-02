#ifndef GUARD_POKEHEARTGOLD_APPLICATION_POKEDEX_POKEDEX_INTERNAL_H
#define GUARD_POKEHEARTGOLD_APPLICATION_POKEDEX_POKEDEX_INTERNAL_H

#include "global.h"

#include "overlay_18.h"

typedef struct PokedexAppData PokedexAppData;

struct PokedexAppData {
    PokedexArgs *unk_0000;
    u8 filler_0004[0x858];
    int unk_085C;
    u8 filler_0860[0xFF8];
    u8 unk_1858;
    u8 filler_1859[3];
    u8 unk_185C;
    int unk_1860;
    u8 filler_1864[0xAC];
}; // size: 0x1910

BOOL ov18_021E8BF4(struct PokedexAppData *appData, int *pState);
u16 ov18_021F8838(struct PokedexAppData *appData);

#endif // GUARD_POKEHEARTGOLD_APPLICATION_POKEDEX_POKEDEX_INTERNAL_H
