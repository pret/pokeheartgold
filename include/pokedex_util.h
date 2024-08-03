#ifndef POKEHEARTGOLD_POKEDEX_UTIL_H
#define POKEHEARTGOLD_POKEDEX_UTIL_H

#include "pokedex.h"
#include "save.h"

BOOL Pokedex_IsNatDexEnabled(const Pokedex *pokedex);
BOOL SaveArray_IsNatDexEnabled(SaveData *saveData);
u32 Pokedex_ConvertToCurrentDexNo(BOOL natDexFlag, u32 species);

#endif // POKEHEARTGOLD_POKEDEX_UTIL_H
