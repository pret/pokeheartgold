#ifndef POKEHEARTGOLD_POKEATHLON_SAVE_H
#define POKEHEARTGOLD_POKEATHLON_SAVE_H

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
    u8 unk_DC[0x1F0]; // sub-struct pointed to by PokeathlonSave_GetUnkDC; byte[slot-1] holds per-pokemon course bits
    Pokeathlon_UnkSubStruct_2C unk_2CC[10]; // pointed to by PokeathlonSave_GetUnk2CC / PokeathlonSave_GetAgainUnk2CC
    Pokeathlon_UnkSubStruct_A4 unk_484[10]; // pointed to by PokeathlonSave_GetUnk484 / PokeathlonSave_GetAgainUnk484
    u8 unk_AEC[0x14]; // pointed to by PokeathlonSave_GetUnkAEC
    Pokeathlon_UnkSubStruct_B00 unk_B00; // pointed to by PokeathlonSave_GetUnkB00 / PokeathlonSave_GetAgainUnkB00
    int athletePoints; // 0xB74 - capped at 99999
    u32 unk_B78;       // bitfield, bits 0-26 (PokeathlonSave_GetUnkB78_AtIndex / PokeathlonSave_SetUnkB78_AtIndex)
    u16 unk_B7C;       // bitfield (PokeathlonSave_GetUnkB7C_AtIndex / PokeathlonSave_SetUnkB7C_AtIndex / PokeathlonSave_ResetUnkB7C)
    u16 unk_B7E;
} POKEATHLON_SAV; // size: 0xB80

u32 PokeathlonSave_sizeof();
void PokeathlonSave_Init(POKEATHLON_SAV *dest);
POKEATHLON_SAV *PokeathlonSave_Get(SaveData *saveData);
POKEATHLON_SAV *PokeathlonSave_dummy1(POKEATHLON_SAV *pokeathlon);
void *PokeathlonSave_GetUnkDC(POKEATHLON_SAV *pokeathlonSave);
Pokeathlon_UnkSubStruct_2C *PokeathlonSave_GetUnk2CC(POKEATHLON_SAV *pokeathlonSave);
Pokeathlon_UnkSubStruct_A4 *PokeathlonSave_GetUnk484(POKEATHLON_SAV *pokeathlonSave);
void *PokeathlonSave_GetUnkAEC(POKEATHLON_SAV *pokeathlonSave);
Pokeathlon_UnkSubStruct_B00 *PokeathlonSave_GetUnkB00(POKEATHLON_SAV *pokeathlonSave);
POKEATHLON_SAV *PokeathlonSave_dummy2(POKEATHLON_SAV *pokeathlon);
BOOL PokeathlonSave_GetUnkDC_AtIndex(POKEATHLON_SAV *pokeathlonSave, int a0, int a1);
Pokeathlon_UnkSubStruct_2C *PokeathlonSave_GetAgainUnk2CC(POKEATHLON_SAV *pokeathlonSave);
Pokeathlon_UnkSubStruct_A4 *PokeathlonSave_GetAgainUnk484(POKEATHLON_SAV *pokeathlonSave);
Pokeathlon_UnkSubStruct_B00 *PokeathlonSave_GetAgainUnkB00(POKEATHLON_SAV *pokeathlonSave);
void PokeathlonSave_SetUnkDC_AtIndex(POKEATHLON_SAV *pokeathlonSave, int a0, int a1);
void PokeathlonSave_AddAthletePoints(POKEATHLON_SAV *pokeathlonSave, u16 amount);
void PokeathlonSave_SubAthletePoints(POKEATHLON_SAV *pokeathlonSave, u16 amount);
u32 PokeathlonSave_GetAthletePoints(POKEATHLON_SAV *pokeathlonSave);
BOOL PokeathlonSave_GetUnkB78_AtIndex(POKEATHLON_SAV *pokeathlon, int idx);
void PokeathlonSave_SetUnkB78_AtIndex(POKEATHLON_SAV *pokeathlon, int idx);
BOOL PokeathlonSave_GetUnkB7C_AtIndex(POKEATHLON_SAV *pokeathlon, int idx);
void PokeathlonSave_SetUnkB7C_AtIndex(POKEATHLON_SAV *pokeathlon, int idx);
void PokeathlonSave_ResetUnkB7C(POKEATHLON_SAV *pokeathlon);

#endif // POKEHEARTGOLD_POKEATHLON_SAVE_H
