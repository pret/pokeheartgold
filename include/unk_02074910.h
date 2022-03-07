#ifndef POKEHEARTGOLD_UNK_02074910_H
#define POKEHEARTGOLD_UNK_02074910_H

#include "pokedex.h"
#include "save.h"

BOOL Pokedex_IsNatDexEnabled(const POKEDEX* pokedex);
BOOL SavArray_IsNatDexEnabled(SAVEDATA* savedata);
u32 sub_02074930(BOOL natDexFlag, u32 species);

#endif //POKEHEARTGOLD_UNK_02074910_H

