#ifndef POKEHEARTGOLD_POKEDEX_H
#define POKEHEARTGOLD_POKEDEX_H

#include "save.h"

typedef struct POKEDEX POKEDEX;

POKEDEX *Sav2_Pokedex_get(SAVEDATA *saveData);
BOOL Pokedex_GetNatDexFlag(POKEDEX *pokedex);

#endif //POKEHEARTGOLD_POKEDEX_H
