#ifndef GUARD_POKEHEARGOLD_APPLICATION_POKEGEAR_RADIO_RADIO_INTERNAL_H
#define GUARD_POKEHEARGOLD_APPLICATION_POKEGEAR_RADIO_RADIO_INTERNAL_H

#include "application/pokegear/pokegear_internal.h"

typedef struct PokegearRadioAppData {
    HeapID heapId;             // 0x00
    int unk_04;                // 0x04
    int unk_08;                // 0x08
    PokegearAppData *pokegear; // 0x0C
    u8 filler_10[0x14];        // 0x10
    u8 unk_24_0 : 5;           // 0x24
    u8 unk_24_5 : 3;           // 0x24
    u8 unk_25;                 // 0x25
    u8 unk_26_0 : 4;           // 0x26
    u8 unk_27;                 // 0x27
    s16 unk_28;                // 0x28
    s16 unk_2A;                // 0x2A
    u16 unk_2C;
    u8 filler_2E[0x3E]; // 0x2E
} PokegearRadioAppData; // size: 0x6C

BOOL ov101_021F49F8(PokegearRadioAppData *radioApp);
BOOL ov101_021F4A4C(PokegearRadioAppData *radioApp);
void ov101_021F4FCC(void *cbArg);
void ov101_021F4FDC(void *cbArg);
void ov101_021F5048(PokegearRadioAppData *radioApp);
void ov101_021F5090(PokegearRadioAppData *radioApp);
void ov101_021F50F0(PokegearRadioAppData *radioApp, int a1);
BOOL ov101_021F51C0(PokegearRadioAppData *radioApp, int a1);
int ov101_021F5304(PokegearRadioAppData *radioApp);
int ov101_021F5468(PokegearRadioAppData *radioApp, BOOL *inputWasTouch);

#endif // GUARD_POKEHEARGOLD_APPLICATION_POKEGEAR_RADIO_RADIO_INTERNAL_H
