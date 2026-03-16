#include "palPark_migration.h"

#include "global.h"

#include "gf_rtc.h"
#include "pokemon.h"

#define MIGRATION_SLOT_COUNT 20

u32 MigratedPokemon_GetSize(void) {
    return sizeof(MigratedPokemon);
}

void MigratedPokemon_Init(MigratedPokemon *mon) {
    MIi_CpuClearFast(0, (u32 *)mon, sizeof(MigratedPokemon));
    for (int i = 0; i < PARTY_SIZE; i++) {
        ZeroMonData(&mon->pokemon[i]);
        GF_ASSERT(GetMonData(&mon->pokemon[i], MON_DATA_SPECIES_EXISTS, NULL) == 0);
    }
}

void MigratedPokemon_InitPokemonOnly(MigratedPokemon *mon) {
    MIi_CpuClearFast(0, (u32 *)mon, sizeof(mon->pokemon));
    for (int i = 0; i < PARTY_SIZE; i++) {
        ZeroMonData(&mon->pokemon[i]);
        GF_ASSERT(GetMonData(&mon->pokemon[i], MON_DATA_SPECIES_EXISTS, NULL) == 0);
    }
}

static int MigratedPokemon_FindSlotIndex(MigratedPokemon *mon, u32 id) {
    int i;
    for (i = 0; i < MIGRATION_SLOT_COUNT; i++) {
        if (id == mon->unk_588[i]) {
            return i;
        }
    }
    for (i = 0; i < MIGRATION_SLOT_COUNT; i++) {
        if (mon->unk_588[i] == 0) {
            return i;
        }
    }
    s64 minTimestamp = 0x7FFFFFFF;
    int oldestIdx;
    for (i = 0; i < MIGRATION_SLOT_COUNT; i++) {
        if (mon->unk_5D8[i] < minTimestamp) {
            minTimestamp = mon->unk_5D8[i];
            oldestIdx = i;
        }
    }
    return oldestIdx;
}

void MigratedPokemon_CopyBoxPokemonToSlot(MigratedPokemon *mon, BoxPokemon *src, int idx) {
    CopyBoxPokemonToPokemon(src, &mon->pokemon[idx]);
}

void MigratedPokemon_RecordMigration(MigratedPokemon *mon, u32 id) {
    int slotIdx = MigratedPokemon_FindSlotIndex(mon, id);
    mon->unk_588[slotIdx] = id;
    mon->unk_5D8[slotIdx] = GF_RTC_DateTimeToSec();
    s64 rtcOffset = OS_GetOwnerRtcOffset();
    mon->unk_678 = (u32)rtcOffset;
    mon->unk_67C = (u32)(rtcOffset >> 32);
    OS_GetMacAddress(mon->macAddress);
}

void MigratedPokemon_ConvertToPokemon(MigratedPokemon *mon, int idx, Pokemon *dest) {
    GF_ASSERT(idx < PARTY_SIZE);
    *dest = mon->pokemon[idx];
}

int MigratedPokemon_CountPokemon(MigratedPokemon *mon) {
    int count = 0;
    for (int i = 0; i < PARTY_SIZE; i++) {
        if (GetMonData(&mon->pokemon[i], MON_DATA_SPECIES_EXISTS, NULL) != 0) {
            count++;
        }
    }
    return count;
}
