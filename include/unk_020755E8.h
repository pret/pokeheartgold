#ifndef POKEHEARTGOLD_UNK_020755E8_H
#define POKEHEARTGOLD_UNK_020755E8_H

#include "bag_types_def.h"
#include "game_stats.h"
#include "heap.h"
#include "party.h"
#include "pokedex.h"
#include "pokemon.h"

// This file is related to handling evolutions of Pokemon
typedef struct EvolutionTaskData EvolutionTaskData;

EvolutionTaskData *sub_02075A7C(Party *party, Pokemon *mon, int species, Options *options, u32 a4, Pokedex *dex, Bag *bag, GameStats *stats, u32 evolutionCondition, u32 a9, HeapID heapId);
BOOL sub_02075D3C(EvolutionTaskData *);
void sub_02075D4C(EvolutionTaskData *);

#endif // POKEHEARTGOLD_UNK_020755E8_H
