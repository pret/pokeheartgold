#ifndef POKEHEARTGOLD_POKEMON_STORAGE_SYSTEM_H
#define POKEHEARTGOLD_POKEMON_STORAGE_SYSTEM_H

#include "pm_string.h"

typedef struct PokemonStorageSystem PC_STORAGE;

void PCStorage_GetBoxName(PC_STORAGE *pcStorage, u32 boxno, STRING *dest);

#endif //POKEHEARTGOLD_POKEMON_STORAGE_SYSTEM_H
