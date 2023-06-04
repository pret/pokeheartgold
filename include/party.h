#ifndef GUARD_PARTY_H
#define GUARD_PARTY_H

#include "pokemon_types_def.h"

u32 SavArray_Party_sizeof(void);
u32 PartyCore_sizeof(void);
PARTY * SavArray_Party_Alloc(HeapID heapId);
void SavArray_Party_init(PARTY *party);
void InitPartyWithMaxSize(PARTY *party, int maxSize);
BOOL AddMonToParty(PARTY *party, const Pokemon *mon);
BOOL RemoveMonFromParty(PARTY *party, int slot);
int GetPartyMaxCount(const PARTY *party);
int GetPartyCount(const PARTY *party);
Pokemon *GetPartyMonByIndex(PARTY *party, int slot);
void Party_GetUnkSubSlot(const PARTY *party, PARTY_EXTRA_SUB *dest, int slot);
void Party_SetUnkSubSlot(PARTY *party, const PARTY_EXTRA_SUB *src, int slot);
void Party_ResetUnkSubSlot(PARTY *party, int slot);
void Party_SafeCopyMonToSlot_ResetUnkSub(PARTY *party, int slot, Pokemon *src);
BOOL Party_SwapSlots(PARTY *party, int slotA, int slotB);
void Party_Copy(const PARTY *src, PARTY *dest);
BOOL PartyHasMon(PARTY *party, u16 species);
PARTY *SavArray_PlayerParty_get(SAVEDATA *saveData);

#endif //GUARD_PARTY_H
