#ifndef GUARD_PARTY_H
#define GUARD_PARTY_H

#include "pokemon.h"

typedef struct PARTY_EXTRA_SUB {
    u8 unk_00[5];
} PARTY_EXTRA_SUB;

typedef struct PARTY_EXTRA {
    PARTY_EXTRA_SUB unk_00[PARTY_SIZE];
} PARTY_EXTRA;

typedef struct SAVE_PARTY_T {
    PARTY party;
    PARTY_EXTRA extra;
} SAVE_PARTY_T;

u32 SavArray_Party_sizeof(void);
u32 sub_020744B4(void);
SAVE_PARTY_T * SavArray_Party_alloc(HeapID heapId);
void SavArray_Party_init(SAVE_PARTY_T *party);
void InitPartyWithMaxSize(SAVE_PARTY_T *party, int maxSize);
BOOL AddMonToParty(SAVE_PARTY_T *party, const POKEMON *pokemon);
BOOL RemoveMonFromParty(SAVE_PARTY_T *party, int slot);
int GetPartyMaxCount(const SAVE_PARTY_T *party);
int GetPartyCount(const SAVE_PARTY_T *party);
POKEMON *GetPartyMonByIndex(SAVE_PARTY_T *party, int slot);
void sub_02074670(const SAVE_PARTY_T *party, PARTY_EXTRA_SUB *dest, int slot);
void sub_020746BC(SAVE_PARTY_T *party, const PARTY_EXTRA_SUB *src, int slot);
void sub_02074708(SAVE_PARTY_T *party, int slot);
void sub_02074740(SAVE_PARTY_T *party, int slot, POKEMON *src);
BOOL sub_020747BC(SAVE_PARTY_T *party, int slotA, int slotB);
void sub_020748B8(const SAVE_PARTY_T *src, SAVE_PARTY_T *dest);
BOOL sub_020748CC(SAVE_PARTY_T *party, u16 species);
SAVE_PARTY_T *SavArray_PlayerParty_get(SAVEDATA *saveData);

#endif //GUARD_PARTY_H
