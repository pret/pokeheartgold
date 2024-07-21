#ifndef GUARD_POKEHEARTGOLD_UNK_02074944_H
#define GUARD_POKEHEARTGOLD_UNK_02074944_H

#include "dex_mon_measures.h"
#include "pokedex.h"

typedef struct LinkBattleRuleset LinkBattleRuleset;

PokedexData *sub_02074944(HeapID heapId);
void sub_0207495C(PokedexData *pokedex);
BOOL sub_0207496C(LinkBattleRuleset *ruleset, Pokemon *pokemon, PokedexData *pokedex);
int sub_02074A6C(LinkBattleRuleset *ruleset, Party *party, PokedexData *pokedex, u8 *a3);
int sub_02074CD0(LinkBattleRuleset *ruleset, Party *party, PokedexData *pokedex);

#endif //GUARD_POKEHEARTGOLD_UNK_02074944_H
