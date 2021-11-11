#include "pokemon.h"
#include "heap.h"
#include "save.h"
#include "party.h"

#define PARTY_ASSERT_SLOT(party, slot) ({             \
    GF_ASSERT(slot >= 0);                             \
    GF_ASSERT(slot < (party)->party.curCount);        \
    GF_ASSERT(slot < (party)->party.maxCount);        \
})

u32 SavArray_Party_sizeof(void) {
    return sizeof(SAVE_PARTY_T);
}

u32 sub_020744B4(void) {
    return sizeof(PARTY);
}

SAVE_PARTY_T * SavArray_Party_alloc(HeapID heapId) {
    SAVE_PARTY_T *ret = AllocFromHeap(heapId, sizeof(SAVE_PARTY_T));
    SavArray_Party_init(ret);
    return ret;
}

void SavArray_Party_init(SAVE_PARTY_T *party) {
    InitPartyWithMaxSize(party, PARTY_SIZE);
}

void InitPartyWithMaxSize(SAVE_PARTY_T *party, int maxSize) {
    int i;

    GF_ASSERT(maxSize <= PARTY_SIZE);
    memset(party, 0, sizeof(SAVE_PARTY_T));
    party->party.curCount = 0;
    party->party.maxCount = maxSize;
    for (i = 0; i < PARTY_SIZE; i++) {
        ZeroMonData(&party->party.mons[i]);
    }
    MI_CpuFill8(&party->extra, 0, 5 * party->party.maxCount);
}

BOOL AddMonToParty(SAVE_PARTY_T *party, const POKEMON *pokemon) {
    if (party->party.curCount >= party->party.maxCount) {
        return FALSE;
    }
    party->party.mons[party->party.curCount] = *pokemon;
    MI_CpuFill8(party->extra.unk_00[party->party.curCount], 0, 5);
    party->party.curCount++;
    return TRUE;
}

BOOL RemoveMonFromParty(SAVE_PARTY_T *party, int slot) {
    PARTY_ASSERT_SLOT(party, slot);
    GF_ASSERT(party->party.curCount > 0);
    for (; slot < party->party.curCount - 1; slot++) {
        party->party.mons[slot] = party->party.mons[slot + 1];
        party->extra.unk_00[slot][0] = party->extra.unk_00[slot + 1][0];
        party->extra.unk_00[slot][1] = party->extra.unk_00[slot + 1][1];
        party->extra.unk_00[slot][2] = party->extra.unk_00[slot + 1][2];
        party->extra.unk_00[slot][3] = party->extra.unk_00[slot + 1][3];
        party->extra.unk_00[slot][4] = party->extra.unk_00[slot + 1][4];
    }
    ZeroMonData(&party->party.mons[slot]);
    MI_CpuFill8(party->extra.unk_00[slot], 0, 5);
    party->party.curCount--;
    return TRUE;
}

int GetPartyMaxCount(const SAVE_PARTY_T *party) {
    return party->party.maxCount;
};

int GetPartyCount(const SAVE_PARTY_T *party) {
    return party->party.curCount;
};

POKEMON *GetPartyMonByIndex(SAVE_PARTY_T *party, int slot) {
    PARTY_ASSERT_SLOT(party, slot);
    return &party->party.mons[slot];
}

void sub_02074670(const SAVE_PARTY_T *party, u8 *dest, int slot);
void sub_020746BC(SAVE_PARTY_T *party, const u8 *src, int slot);
void sub_02074708(SAVE_PARTY_T *party, int slot);
void sub_02074740(SAVE_PARTY_T *party, int slot, const POKEMON *src);
void sub_020747BC(SAVE_PARTY_T *party, int slotA, int slotB);
void sub_020748B8(const SAVE_PARTY_T *src, SAVE_PARTY_T *dest);
BOOL sub_020748CC(const SAVE_PARTY_T *party, u16 species);
SAVE_PARTY_T *SavArray_PlayerParty_get(SAVEDATA *saveData);
