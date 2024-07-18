#ifndef GUARD_POKEHEARTGOLD_UNK_02074944_H
#define GUARD_POKEHEARTGOLD_UNK_02074944_H

#include "dex_mon_measures.h"
#include "pokedex.h"

typedef struct UnkStruct_02074944 UnkStruct_02074944;

PokedexData *sub_02074944(HeapID heapId);
void sub_0207495C(PokedexData *pokedex);
BOOL sub_0207496C(UnkStruct_02074944 *a0, Pokemon *pokemon, PokedexData *pokedex);
int sub_02074A6C(UnkStruct_02074944 *a0, Party *party, PokedexData *pokedex, u8 *a3);
int sub_02074CD0(UnkStruct_02074944 *a0, Party *party, PokedexData *pokedex);

#endif //GUARD_POKEHEARTGOLD_UNK_02074944_H
