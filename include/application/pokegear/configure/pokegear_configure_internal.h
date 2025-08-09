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

BOOL ov101_021EED44(PokegearConfigureAppData *configureApp);
BOOL ov101_021EED98(PokegearConfigureAppData *configureApp);
int ov101_021EEDC4(PokegearConfigureAppData *configureApp);
BOOL ov101_021EEE80(PokegearConfigureAppData *configureApp);
void ov101_021EF4B0(void *appData);
int ov101_021EF6E4(PokegearConfigureAppData *configureApp);
int ov101_021EF7D4(PokegearConfigureAppData *configureApp);

#endif // GUARD_POKEHEARTGOLD_APPLICATION_POKEGEAR_CONFIGURE_POKEGEAR_CONFIGURE_INTERNAL_H
