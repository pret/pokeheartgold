#ifndef GUARD_PARTY_H
#define GUARD_PARTY_H

#include "pokemon_types_def.h"

u32 SavArray_Party_sizeof(void);
u32 sub_020744B4(void);
PARTY * SavArray_Party_alloc(HeapID heapId);
void SavArray_Party_init(PARTY *party);
void InitPartyWithMaxSize(PARTY *party, int maxSize);
BOOL AddMonToParty(PARTY *party, const POKEMON *pokemon);
BOOL RemoveMonFromParty(PARTY *party, int slot);
int GetPartyMaxCount(const PARTY *party);
int GetPartyCount(const PARTY *party);
POKEMON *GetPartyMonByIndex(PARTY *party, int slot);
void sub_02074670(const PARTY *party, PARTY_EXTRA_SUB *dest, int slot);
void sub_020746BC(PARTY *party, const PARTY_EXTRA_SUB *src, int slot);
void sub_02074708(PARTY *party, int slot);
void sub_02074740(PARTY *party, int slot, POKEMON *src);
BOOL sub_020747BC(PARTY *party, int slotA, int slotB);
void sub_020748B8(const PARTY *src, PARTY *dest);
BOOL PartyHasMon(PARTY *party, u16 species);
PARTY *SavArray_PlayerParty_get(SAVEDATA *saveData);

#endif //GUARD_PARTY_H
