#ifndef POKEHEARTGOLD_UNK_020755E8_H
#define POKEHEARTGOLD_UNK_020755E8_H

#include "pokemon.h"
#include "party.h"
#include "heap.h"

//This file is related to handling evolutions of Pokemon

void sub_02075D4C(void *);
void *sub_02075A7C(Party *party, Pokemon *mon, int species, Options *options, u32 a4, Pokedex *dex, Bag *bag, GAME_STATS *stats, u32 evolutionCondition, u32 a9, HeapID heapId);
BOOL sub_02075D3C(void *);
void sub_02075D4C(void *);

#endif //POKEHEARTGOLD_UNK_020755E8_H
