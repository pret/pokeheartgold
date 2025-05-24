#ifndef GUARD_POKEHEARGOLD_APPLICATION_POKEGEAR_RADIO_RADIO_INTERNAL_H
#define GUARD_POKEHEARGOLD_APPLICATION_POKEGEAR_RADIO_RADIO_INTERNAL_H

#include "application/pokegear/pokegear_internal.h"

typedef struct PokegearRadioAppData {
    HeapID heapId;             // 0x00
    int unk_04;                // 0x04
    int unk_08;                // 0x08
    PokegearAppData *pokegear; // 0x0C
    u8 filler_10[0x5C];        // 0x10
} PokegearRadioAppData;        // size: 0x6C

#endif // GUARD_POKEHEARGOLD_APPLICATION_POKEGEAR_RADIO_RADIO_INTERNAL_H
