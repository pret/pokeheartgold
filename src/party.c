#include "global.h"
#include "pokemon.h"
#include "heap.h"
#include "save.h"
#include "party.h"

#define PARTY_ASSERT_SLOT(party, slot) ({             \
    GF_ASSERT(slot >= 0);                             \
    GF_ASSERT(slot < (party)->core.curCount);        \
    GF_ASSERT(slot < (party)->core.maxCount);        \
})

u32 SaveArray_Party_sizeof(void) {
    return sizeof(Party);
}

u32 PartyCore_sizeof(void) {
    return sizeof(PartyCore);
}

Party * SaveArray_Party_Alloc(HeapID heapId) {
    Party *ret = AllocFromHeap(heapId, sizeof(Party));
    SaveArray_Party_Init(ret);
    return ret;
}

void SaveArray_Party_Init(Party *party) {
    Party_InitWithMaxSize(party, PARTY_SIZE);
}

void Party_InitWithMaxSize(Party *party, int maxSize) {
    int i;

    GF_ASSERT(maxSize <= PARTY_SIZE);
    memset(party, 0, sizeof(Party));
    party->core.curCount = 0;
    party->core.maxCount = maxSize;
    for (i = 0; i < PARTY_SIZE; i++) {
        ZeroMonData(&party->core.mons[i]);
    }
    MI_CpuClear8(&party->extra, 5 * party->core.maxCount);
}

BOOL Party_AddMon(Party *party, const Pokemon *mon) {
    if (party->core.curCount >= party->core.maxCount) {
        return FALSE;
    }
    party->core.mons[party->core.curCount] = *mon;
    MI_CpuClear8(&party->extra.unk_00[party->core.curCount], sizeof(PartyExtraSub));
    party->core.curCount++;
    return TRUE;
}

BOOL Party_RemoveMon(Party *party, int slot) {
    PARTY_ASSERT_SLOT(party, slot);
    GF_ASSERT(party->core.curCount > 0);
    for (; slot < party->core.curCount - 1; slot++) {
        party->core.mons[slot] = party->core.mons[slot + 1];
        party->extra.unk_00[slot] = party->extra.unk_00[slot + 1];
    }
    ZeroMonData(&party->core.mons[slot]);
    MI_CpuClear8(&party->extra.unk_00[slot], sizeof(PartyExtraSub));
    party->core.curCount--;
    return TRUE;
}

int Party_GetMaxCount(const Party *party) {
    return party->core.maxCount;
}

int Party_GetCount(const Party *party) {
    return party->core.curCount;
}

Pokemon *Party_GetMonByIndex(Party *party, int slot) {
    PARTY_ASSERT_SLOT(party, slot);
    return &party->core.mons[slot];
}

void Party_GetUnkSubSlot(const Party *party, PartyExtraSub *dest, int slot) {
    PARTY_ASSERT_SLOT(party, slot);
    *dest = party->extra.unk_00[slot];
}

void Party_SetUnkSubSlot(Party *party, const PartyExtraSub *src, int slot) {
    PARTY_ASSERT_SLOT(party, slot);
    party->extra.unk_00[slot] = *src;
}

void Party_ResetUnkSubSlot(Party *party, int slot) {
    PARTY_ASSERT_SLOT(party, slot);
    MI_CpuClear8(&party->extra.unk_00[slot], sizeof(PartyExtraSub));
}

void Party_SafeCopyMonToSlot_ResetUnkSub(Party *party, int slot, Pokemon *src) {
    PARTY_ASSERT_SLOT(party, slot);
    {
        BOOL valid = GetMonData(&party->core.mons[slot], MON_DATA_SPECIES_EXISTS, NULL) - GetMonData(src, MON_DATA_SPECIES_EXISTS, NULL);
        party->core.mons[slot] = *src;
        MI_CpuClear8(&party->extra.unk_00[slot], sizeof(PartyExtraSub));
        party->core.curCount += valid;
    }
}

BOOL Party_SwapSlots(Party *party, int slotA, int slotB) {
    PartyExtraSub tmp_PartyExtraSub;
    Pokemon *tmp_POKEMON;

    PARTY_ASSERT_SLOT(party, slotA);
    PARTY_ASSERT_SLOT(party, slotB);
    tmp_POKEMON = AllocFromHeap(HEAP_ID_DEFAULT, sizeof(Pokemon));
    *tmp_POKEMON = party->core.mons[slotA];
    party->core.mons[slotA] = party->core.mons[slotB];
    party->core.mons[slotB] = *tmp_POKEMON;
    FreeToHeap(tmp_POKEMON);

    tmp_PartyExtraSub = party->extra.unk_00[slotA];
    party->extra.unk_00[slotA] = party->extra.unk_00[slotB];
    party->extra.unk_00[slotB] = tmp_PartyExtraSub;
    return FALSE;
}

void Party_Copy(const Party *src, Party *dest) {
    *dest = *src;
}

BOOL Party_HasMon(Party *party, u16 species) {
    int i;

    for (i = 0; i < party->core.curCount; i++) {
        if (species == GetMonData(&party->core.mons[i], MON_DATA_SPECIES_OR_EGG, NULL)) {
            break;
        }
    }

    return (i != party->core.curCount);
}

Party *SaveArray_Party_Get(SaveData *saveData) {
    return (Party *) SaveArray_Get(saveData, SAVE_PARTY);
}
