#ifndef GUARD_POKEHEARTGOLD_APPLICATION_POKEGEAR_CONFIGURE_POKEGEAR_CONFIGURE_INTERNAL_H
#define GUARD_POKEHEARTGOLD_APPLICATION_POKEGEAR_CONFIGURE_POKEGEAR_CONFIGURE_INTERNAL_H

#include "application/pokegear/pokegear_internal.h"

typedef struct PokegearConfigureAppData {
    HeapID unk_00;
    int unk_04;
    int unk_08;
    PokegearAppData *unk_0C;
    u8 filler_10[0x3C];
} PokegearConfigureAppData;

#endif // GUARD_POKEHEARTGOLD_APPLICATION_POKEGEAR_CONFIGURE_POKEGEAR_CONFIGURE_INTERNAL_H
