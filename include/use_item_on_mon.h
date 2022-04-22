#ifndef POKEHEARTGOLD_USE_ITEM_ON_MON_H
#define POKEHEARTGOLD_USE_ITEM_ON_MON_H

#include "pokemon_types_def.h"

typedef struct ItemData ITEMDATA;

BOOL CanUseItemOnPokemon(POKEMON *pokemon, u16 itemID, s32 moveIdx, HeapID heapID);
BOOL CanUseItemOnMonInParty(PARTY *party, u16 itemID, s32 partyIdx, s32 moveIdx, HeapID heapID);
BOOL UseItemOnPokemon(POKEMON *pokemon, u16 itemID, u16 moveIdx, u16 location, HeapID heapID);
BOOL UseItemOnMonInParty(PARTY *party, u16 itemID, s32 partyIdx, u16 moveIdx, u16 location, HeapID heapID);
BOOL MonMoveCanRestorePP(POKEMON *pokemon, int moveIdx);
BOOL MonMoveRestorePP(POKEMON *pokemon, int moveIdx, int ppRestore);
BOOL BoostMonMovePpUpBy(POKEMON *pokemon, int moveIdx, int nPpUp);
void RestoreMonHPBy(POKEMON *pokemon, u32 hp, u32 maxHp, u32 restoration);
s32 TryModEV(s32 ev, s32 evSum, s32 by);
BOOL CanItemModFriendship(POKEMON *pokemon, ITEMDATA *itemData);
BOOL DoItemFriendshipMod(POKEMON *pokemon, s32 friendship, s32 mod, u16 location, HeapID heapID);
void HealParty(PARTY *party);

#endif //POKEHEARTGOLD_USE_ITEM_ON_MON_H
