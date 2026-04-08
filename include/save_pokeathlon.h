#ifndef POKEHEARTGOLD_SAVE_POKEATHLON_H
#define POKEHEARTGOLD_SAVE_POKEATHLON_H

#include "save.h"

typedef struct Pokeathlon_UnkSubStruct_B00 {
    u32 unk0;
    u32 unk4;
    u32 unk8;
    u32 unkC;
    u32 unk10;
    u32 unk14;
    u32 unk18;
    u32 unk1C;
    u32 unk20;
    u32 unk24;
    u32 unk28;
    u32 unk2C;
    u32 unk30;
    u8 unk34[0x10];
    u32 unk44[10];
    u32 unk6C;
    u32 unk70;
} Pokeathlon_UnkSubStruct_B00; // size: 0x74

typedef struct Pokeathlon_CourseEntry {
    u16 unk_0;
    u8 unk_2[6];
} Pokeathlon_CourseEntry; // size: 0x8

typedef struct Pokeathlon_UnkSubStruct_2C {
    Pokeathlon_CourseEntry entries[5];
    u8 unk_28[0x4];
} Pokeathlon_UnkSubStruct_2C; // size: 0x2C

typedef struct Pokeathlon_UnkSubStruct_A4 {
    Pokeathlon_CourseEntry entries[5];
    u8 unk_28[0x7C];
} Pokeathlon_UnkSubStruct_A4; // size: 0xA4

typedef struct POKEATHLON_SAV {
    u8 unk_0[0xDC];
    u8 unk_DC[0x1F0]; // sub-struct pointed to by sub_02031978; byte[slot-1] holds per-pokemon course bits
    Pokeathlon_UnkSubStruct_2C unk_2CC[10]; // pointed to by sub_0203197C / sub_020319DC
    Pokeathlon_UnkSubStruct_A4 unk_484[10]; // pointed to by sub_02031984 / sub_020319E4
    u8 unk_AEC[0x14]; // pointed to by sub_02031990
    Pokeathlon_UnkSubStruct_B00 unk_B00; // pointed to by sub_0203199C / sub_020319F0
    u32 athletePoints; // 0xB74 - capped at 99999
    u32 unk_B78;       // bitfield, bits 0-26 (sub_02031A78 / sub_02031A98)
    u16 unk_B7C;       // bitfield (sub_02031AB8 / sub_02031ACC / sub_02031AE4)
    u16 unk_B7E;
} POKEATHLON_SAV; // size: 0xB80

BOOL sub_02031A78(POKEATHLON_SAV *pokeathlon, int idx);
BOOL sub_02031AB8(POKEATHLON_SAV *pokeathlon, int idx);
void sub_02031AE4(POKEATHLON_SAV *pokeathlon);
POKEATHLON_SAV *sub_02031974(POKEATHLON_SAV *pokeathlon);

#endif // POKEHEARTGOLD_SAVE_POKEATHLON_H
