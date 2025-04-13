#ifndef GUARD_POKEHEARTGOLD_APPLICATION_POKEGEAR_PHONE_H
#define GUARD_POKEHEARTGOLD_APPLICATION_POKEGEAR_PHONE_H

#include "global.h"

#include "mail_misc.h"
#include "unk_02092BE8.h"

typedef struct PokegearPhoneApp_UnkSub07C_Sub4 {
    u8 filler_00[0x20];
} PokegearPhoneApp_UnkSub07C_Sub4;

typedef struct PokegearPhoneApp_UnkSub07C_Sub8_Sub4 {
    u16 unk_00;
    u8 filler_02[10];
} PokegearPhoneApp_UnkSub07C_Sub8_Sub4;

typedef struct PokegearPhoneApp_UnkSub07C_Sub8 {
    u8 unk_00;
    u8 unk_01;
    PokegearPhoneApp_UnkSub07C_Sub8_Sub4 *unk_04;
} PokegearPhoneApp_UnkSub07C_Sub8;

typedef struct PokegearPhoneApp_UnkSub07C {
    u16 unk_00;
    PokegearPhoneApp_UnkSub07C_Sub4 *unk_04;
    PokegearPhoneApp_UnkSub07C_Sub8 *unk_08;
} PokegearPhoneApp_UnkSub07C;

typedef struct PokegearPhoneApp_UnkSub0C8 {
    u16 unk_00;
    u16 unk_02;
    u8 filler_04[8];
    u8 unk_0C[0];
} PokegearPhoneApp_UnkSub0C8;

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
    void (*unk_05C)(void *);                     // 0x05C
    u8 filler_05C[0x4];                          // 0x060
    void *unk_064;                               // 0x064
    u8 filler_068[0x4];                          // 0x068
    EasyChatArgs *easyChatArgs;                  // 0x06C;
    OVY_MANAGER *childApplication;               // 0x070
    BgConfig *bgConfig;                          // 0x074
    PaletteData *plttData;                       // 0x078
    PokegearPhoneApp_UnkSub07C *unk_07C;         // 0x07C
    u8 filler_080[0xC];                          // 0x080
    int unk_08C;                                 // 0x08C
    int unk_090;                                 // 0x090
    void *unk_094;                               // 0x094
    u8 filler_098[0x30];                         // 0x098
    PokegearPhoneApp_UnkSub0C8 *unk_0C8;         // 0x0C8
}; // size: 0xCC

BOOL ov100_021E5900(PokegearPhoneApp *phoneApp);
int ov100_021E5924(PokegearPhoneApp *phoneApp);
void ov100_021E5BB0(PokegearPhoneApp *phoneApp, int a1);
BOOL ov100_021E5DDC(PokegearPhoneApp *phoneApp);
BOOL ov100_021E5E88(PokegearPhoneApp *phoneApp);
BOOL ov100_021E6408(OVY_MANAGER **ppOvyMan);
void ov100_021E69E8(PokegearPhoneApp *phoneApp);
void ov100_021E6AB0(void *a0);

#endif // GUARD_POKEHEARTGOLD_APPLICATION_POKEGEAR_PHONE_H
