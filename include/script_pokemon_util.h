#ifndef POKEHEARTGOLD_SCRIPT_POKEMON_UTIL_H
#define POKEHEARTGOLD_SCRIPT_POKEMON_UTIL_H

#include "map_section.h"
#include "pokemon.h"

BOOL GiveMon(HeapID heapId, SaveData *saveData, int species, int level, int form, u8 ability, u16 heldItem, int ball, int encounterType);
BOOL GiveEgg(HeapID heapId, SaveData *saveData, int species, u8 metLocation, MapsecType mapsecType, int mapLoc);
void PartyMonSetMoveInSlot(Party *party, int mon_slot, int move_slot, u16 moveId);
int GetIdxOfFirstPartyMonWithMove(Party *party, u16 move);
int CountAlivePokemon(Party *party);
Pokemon *GetFirstAliveMonInParty_CrashIfNone(Party *party);
u8 GetIdxOfFirstAliveMonInParty_CrashIfNone(Party *party);
Pokemon *GetFirstNonEggInParty(Party *party);
BOOL HasEnoughAlivePokemonForDoubleBattle(Party *party);
BOOL ApplyPoisonStep(Party *party, u16 location);
BOOL SurvivePoisoning(Pokemon *mon);

#endif // POKEHEARTGOLD_SCRIPT_POKEMON_UTIL_H
