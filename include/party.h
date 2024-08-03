#ifndef GUARD_PARTY_H
#define GUARD_PARTY_H

#include "pokemon_types_def.h"

u32 SaveArray_Party_sizeof(void);
u32 PartyCore_sizeof(void);
Party *SaveArray_Party_Alloc(HeapID heapId);
void SaveArray_Party_Init(Party *party);
void Party_InitWithMaxSize(Party *party, int maxSize);
BOOL Party_AddMon(Party *party, const Pokemon *mon);
BOOL Party_RemoveMon(Party *party, int slot);
int Party_GetMaxCount(const Party *party);
int Party_GetCount(const Party *party);
Pokemon *Party_GetMonByIndex(Party *party, int slot);
void Party_GetUnkSubSlot(const Party *party, PartyExtraSub *dest, int slot);
void Party_SetUnkSubSlot(Party *party, const PartyExtraSub *src, int slot);
void Party_ResetUnkSubSlot(Party *party, int slot);
void Party_SafeCopyMonToSlot_ResetUnkSub(Party *party, int slot, Pokemon *src);
BOOL Party_SwapSlots(Party *party, int slotA, int slotB);
void Party_Copy(const Party *src, Party *dest);
BOOL Party_HasMon(Party *party, u16 species);
Party *SaveArray_Party_Get(SaveData *saveData);

#endif // GUARD_PARTY_H
