#ifndef GUARD_POKEHEARTGOLD_APPLICATION_POKEGEAR_PHONE_H
#define GUARD_POKEHEARTGOLD_APPLICATION_POKEGEAR_PHONE_H

#include "global.h"

typedef struct PokegearPhoneApp {
    u8 filler_000[0xC];
    int unk_00C;
    int unk_010;
} PokegearPhoneApp;

BOOL ov100_021E5900(PokegearPhoneApp *phoneApp);

#endif // GUARD_POKEHEARTGOLD_APPLICATION_POKEGEAR_PHONE_H
