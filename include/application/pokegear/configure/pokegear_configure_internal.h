#ifndef GUARD_POKEHEARTGOLD_APPLICATION_POKEGEAR_CONFIGURE_POKEGEAR_CONFIGURE_INTERNAL_H
#define GUARD_POKEHEARTGOLD_APPLICATION_POKEGEAR_CONFIGURE_POKEGEAR_CONFIGURE_INTERNAL_H

#include "application/pokegear/pokegear_internal.h"

typedef struct PokegearConfigureAppData {
    HeapID unk_00;
    int unk_04;
    int unk_08;
    PokegearAppData *unk_0C;
    u8 filler_10[2];
    u16 unk_12_00 : 9;
    u16 unk_12_09 : 7;
    u8 filler_14[0x38];
} PokegearConfigureAppData; // size: 0x4C

void ov101_021EF4B0(void *appData);

#endif // GUARD_POKEHEARTGOLD_APPLICATION_POKEGEAR_CONFIGURE_POKEGEAR_CONFIGURE_INTERNAL_H
