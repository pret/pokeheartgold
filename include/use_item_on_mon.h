#ifndef POKEHEARTGOLD_USE_ITEM_ON_MON_H
#define POKEHEARTGOLD_USE_ITEM_ON_MON_H

#include "item.h"
#include "pokemon_types_def.h"

BOOL CanUseItemOnPokemon(Pokemon *mon, u16 itemID, s32 moveIdx, HeapID heapID);
BOOL CanUseItemOnMonInParty(Party *party, u16 itemID, s32 partyIdx, s32 moveIdx, HeapID heapID);
BOOL UseItemOnPokemon(Pokemon *mon, u16 itemID, u16 moveIdx, u16 location, HeapID heapID);
BOOL UseItemOnMonInParty(Party *party, u16 itemID, s32 partyIdx, u8 moveIdx, u16 location, HeapID heapID);
BOOL MonMoveCanRestorePP(Pokemon *mon, int moveIdx);
BOOL MonMoveRestorePP(Pokemon *mon, int moveIdx, int ppRestore);
BOOL BoostMonMovePpUpBy(Pokemon *mon, int moveIdx, int nPpUp);
void RestoreMonHPBy(Pokemon *mon, u32 hp, u32 maxHp, u32 restoration);
s32 TryModEV(s32 ev, s32 evSum, s32 by);
BOOL CanItemModFriendship(Pokemon *mon, ItemData *itemData);
BOOL DoItemFriendshipMod(Pokemon *mon, s32 friendship, s32 mod, u16 location, HeapID heapID);
void HealParty(Party *party);

#endif // POKEHEARTGOLD_USE_ITEM_ON_MON_H
