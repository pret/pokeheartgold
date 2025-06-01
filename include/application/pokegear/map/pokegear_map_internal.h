#ifndef POKEHEARTGOLD_APPLICATION_POKEGEAR_MAP_POKEGEAR_MAP_INTERNAL_H
#define POKEHEARTGOLD_APPLICATION_POKEGEAR_MAP_POKEGEAR_MAP_INTERNAL_H

#include "constants/roamer.h"

#include "application/pokegear/pokegear_internal.h"

typedef struct PokegearMapAppData {
    HeapID heapId;                     // 0x000
    int state;                         // 0x004
    int substate;                      // 0x008
    u8 unk_00C;                        // 0x00C
    PokegearAppData *pokegear;         // 0x010
    PokegearUnkSub03C unk_014;         // 0x014
    int unk_030;                       // 0x030
    u8 filler_034[4];                  // 0x034
    MAPDATA *unk_038;                  // 0x038
    u8 filler_03C[0xC4];               // 0x03C
    u16 unk_100;                       // 0x100
    u16 unk_102;                       // 0x102
    u16 unk_104;                       // 0x104
    u16 unk_106;                       // 0x106
    u16 unk_108;                       // 0x108
    u16 unk_10A;                       // 0x10A
    u16 unk_10C;                       // 0x10C
    u16 unk_10E;                       // 0x10E
    u16 unk_110;                       // 0x110
    u16 unk_112;                       // 0x112
    u8 filler_114[0x10];               // 0x10C
    PhoneCallPersistentState *unk_124; // 0x124
    PhoneBook *unk_128;                // 0x128
    PhoneContact *unk_12C;             // 0x12C
    u8 unk_130;                        // 0x130
    u8 unk_131;                        // 0x131
    u8 unk_132;                        // 0x132
    u8 unk_133;                        // 0x133
    u8 unk_134;                        // 0x134
    u8 unk_135;                        // 0x135
    u8 unk_136;                        // 0x136
    u8 unk_137;                        // 0x137
    u8 unk_138_0 : 1;                  // 0x138
    u8 unk_138_1 : 3;                  // 0x138
    u8 unk_138_4 : 1;                  // 0x138
    u8 unk_138_5 : 2;                  // 0x138
    u8 filler_139[3];                  // 0x139
    u8 unk_13C_0 : 7;                  // 0x13C
    u8 unk_13C_7 : 1;                  // 0x13C
    u8 unk_13D_0 : 1;                  // 0x13D
    u8 unk_13D_1 : 1;                  // 0x13D
    u8 unk_13D_2 : 1;                  // 0x13D
    u8 unk_13D_3 : 1;                  // 0x13D
    u8 filler_13E[0xD6];               // 0x13E
    const u8 (*unk_214)[16];           // 0x214
    u8 filler_218[0x7D0];              // 0x218
    u16 unk_9E8[ROAMER_MAX];           // 0x9E8
    u8 filler_9F0[4];                  // 0x9F0
} PokegearMapAppData;                  // size: 0x9F4

BOOL ov101_021E7FF4(PokegearMapAppData *mapApp);
BOOL ov101_021E8070(PokegearMapAppData *mapApp);
BOOL ov101_021E80B4(PokegearMapAppData *mapApp);
BOOL ov101_021E818C(PokegearMapAppData *mapApp);
void ov101_021E9270(PokegearAppData *pokegear, void *appData);
BOOL ov101_021E9CD4(PokegearMapAppData *mapApp, int a1);
void ov101_021E9D74(PokegearMapAppData *mapApp, int a1);
BOOL ov101_021E9E90(PokegearMapAppData *mapApp, int a1);
void ov101_021EB2FC(void *appData);
void ov101_021EB338(void *appData);
void ov101_021EB364(PokegearMapAppData *mapApp);
void ov101_021EB378(PokegearMapAppData *mapApp);
int ov101_021ECAF0(PokegearMapAppData *mapApp);
int ov101_021ECEA8(PokegearMapAppData *mapApp);
int ov101_021ED158(PokegearMapAppData *mapApp);
int ov101_021ECC58(PokegearMapAppData *mapApp, BOOL *a1);
int ov101_021ECF98(PokegearMapAppData *mapApp);
int ov101_021ED2C0(PokegearMapAppData *mapApp);
void ov101_021ED4E0(PokegearMapAppData *mapApp);
void ov101_021ED5AC(PokegearMapAppData *mapApp);
PokegearReturnCode ov101_021EB5DC(PokegearMapAppData *mapApp, BOOL *pRetIsTouch);
PokegearReturnCode ov101_021EB568(PokegearMapAppData *mapApp);
u8 ov101_021ED614(PokegearMapAppData *mapApp, u16 a1);
u8 ov101_021ED64C(PokegearMapAppData *mapApp, u16 a1);
void ov101_021ED79C(u8 a0, u8 a1, u16 a2);

extern const u8 ov101_021F7372[][16];

#endif // POKEHEARTGOLD_APPLICATION_POKEGEAR_MAP_POKEGEAR_MAP_INTERNAL_H
