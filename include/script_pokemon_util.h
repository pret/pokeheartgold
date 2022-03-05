#ifndef POKEHEARTGOLD_SCRIPT_POKEMON_UTIL_H
#define POKEHEARTGOLD_SCRIPT_POKEMON_UTIL_H

#include "pokemon.h"
#include "map_section.h"

BOOL GiveMon(HeapID heapId, SAVEDATA *saveData, int species, int level, int forme, u8 ability, u16 heldItem, int ball, int encounterType);
BOOL GiveEgg(HeapID heapId, SAVEDATA *saveData, int species, u8 metLocation, MapsecType sp20, int sp24);
void PartyMonSetMoveInSlot(PARTY *party, int mon_slot, int move_slot, u16 moveId);
int GetIdxOfFirstPartyMonWithMove(PARTY *party, u16 move);
int CountAlivePokemon(PARTY *party);
POKEMON *GetFirstAliveMonInParty_CrashIfNone(PARTY *party);
u8 GetIdxOfFirstAliveMonInParty_CrashIfNone(PARTY *party);
POKEMON *GetFirstNonEggInParty(PARTY *party);
BOOL HasEnoughAlivePokemonForDoubleBattle(PARTY *party);
BOOL ApplyPoisonStep(PARTY *party, u16 location);
BOOL SurvivePoisoning(POKEMON *pokemon);

#endif //POKEHEARTGOLD_SCRIPT_POKEMON_UTIL_H
