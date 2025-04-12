#ifndef GUARD_POKEHEARTGOLD_APPLICATION_POKEGEAR_PHONE_H
#define GUARD_POKEHEARTGOLD_APPLICATION_POKEGEAR_PHONE_H

#include "global.h"

#include "unk_02092BE8.h"

typedef struct PokegearPhoneApp {
    HeapID heapId;                // 0x000
    u8 unk_004;                   // 0x004
    u8 unk_005_0 : 7;             // 0x005
    u8 unk_006;                   // 0x006
    u8 unk_007;                   // 0x007
    u8 unk_008;                   // 0x008
    int unk_00C;                  // 0x00C
    int unk_010;                  // 0x010
    u8 filler_014[0xC];           // 0x014
    PokegearArgs *args;           // 0x020
    SaveData *saveData;           // 0x024
    SavePokegear *savePokegear;   // 0x028
    SaveVarsFlags *saveVarsFlags; // 0x02C
    Options *options;             // 0x030
    PlayerProfile *profile;       // 0x034
    u8 unk_038;                   // 0x038
    u8 filler_039[0x1D];          // 0x039
    u16 unk_056;                  // 0x056
    u8 filler_058[0x74];          // 0x058
} PokegearPhoneApp;               // size: 0xCC

BOOL ov100_021E5900(PokegearPhoneApp *phoneApp);

#endif // GUARD_POKEHEARTGOLD_APPLICATION_POKEGEAR_PHONE_H
