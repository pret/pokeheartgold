#ifndef GUARD_POKEHEARTGOLD_APPLICATION_POKEGEAR_PHONE_H
#define GUARD_POKEHEARTGOLD_APPLICATION_POKEGEAR_PHONE_H

#include "global.h"

#include "mail_misc.h"
#include "unk_02092BE8.h"

typedef struct PokegearPhoneApp PokegearPhoneApp;
struct PokegearPhoneApp {
    HeapID heapId;                               // 0x000
    u8 unk_004;                                  // 0x004
    u8 unk_005_0 : 7;                            // 0x005
    u8 unk_006;                                  // 0x006
    u8 unk_007;                                  // 0x007
    u8 unk_008;                                  // 0x008
    MenuInputState unk_00C;                      // 0x00C
    MenuInputState unk_010;                      // 0x010
    u8 filler_014[0x8];                          // 0x014
    int unk_01C;                                 // 0x01C
    PokegearArgs *args;                          // 0x020
    SaveData *saveData;                          // 0x024
    SavePokegear *savePokegear;                  // 0x028
    SaveVarsFlags *saveVarsFlags;                // 0x02C
    Options *options;                            // 0x030
    PlayerProfile *profile;                      // 0x034
    u8 unk_038;                                  // 0x038
    u8 filler_039[0x1D];                         // 0x039
    u16 unk_056;                                 // 0x056
    void (*unk_058)(PokegearPhoneApp *, void *); // 0x058
    u8 filler_05C[0x8];                          // 0x05C
    void *unk_064;                               // 0x064
    u8 filler_068[0x4];                          // 0x068
    EasyChatArgs *easyChatArgs;                  // 0x06C;
    OVY_MANAGER *unk_070;                        // 0x070
    BgConfig *bgConfig;                          // 0x074
    PaletteData *plttData;                       // 0x078
    u8 filler_07C[0x10];                         // 0x07C
    int unk_08C;                                 // 0x08C
    int unk_090;                                 // 0x090
    void *unk_094;                               // 0x094
    u8 filler_098[0x34];                         // 0x098
}; // size: 0xCC

BOOL ov100_021E5900(PokegearPhoneApp *phoneApp);
void ov100_021E5BB0(PokegearPhoneApp *phoneApp, int a1);
BOOL ov100_021E5DDC(PokegearPhoneApp *phoneApp);
BOOL ov100_021E5E88(PokegearPhoneApp *phoneApp);
BOOL ov100_021E6408(OVY_MANAGER **ppOvyMan);
void ov100_021E69E8(PokegearPhoneApp *phoneApp);
void ov100_021E6AB0(void *a0);

#endif // GUARD_POKEHEARTGOLD_APPLICATION_POKEGEAR_PHONE_H
