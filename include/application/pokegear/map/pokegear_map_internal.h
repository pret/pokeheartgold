#ifndef POKEHEARTGOLD_APPLICATION_POKEGEAR_MAP_POKEGEAR_MAP_INTERNAL_H
#define POKEHEARTGOLD_APPLICATION_POKEGEAR_MAP_POKEGEAR_MAP_INTERNAL_H

#include "application/pokegear/pokegear_internal.h"

typedef struct PokegearMapAppData {
    HeapID heapId;
    int state;
    int substate;
    int subsubstate;
    PokegearAppData *pokegear;
    u8 filler_014[0x24];
    MAPDATA *unk_038;
    u8 filler_03C[0xFA];
    u8 unk_136;
    u8 filler_137[0xDD];
    const u8 *unk_214;
    u8 filler_218[0x7DC];
} PokegearMapAppData; // size: 0x9F4

#endif // POKEHEARTGOLD_APPLICATION_POKEGEAR_MAP_POKEGEAR_MAP_INTERNAL_H
