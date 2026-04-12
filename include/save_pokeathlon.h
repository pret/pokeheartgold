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
} Pokeathlon_UnkSubStruct_B00;

typedef struct POKEATHLON_SAV {
    u8 unk_000[0xDC];
    u8 unk_0DC[0x1F0];
    u8 unk_2CC[0x1B8];
    u8 unk_484[0x668];
    u8 unk_AEC[0x14];
    Pokeathlon_UnkSubStruct_B00 unk_B00;
    u32 athletePoints;
    u32 prizeFlags;
    u16 unk_B7C;
    u16 padding_B7E;
} POKEATHLON_SAV; // size: 0xB80

BOOL sub_02031A78(POKEATHLON_SAV *pokeathlonSave, int idx);
BOOL sub_02031AB8(POKEATHLON_SAV *pokeathlonSave, int idx);
void sub_02031AE4(POKEATHLON_SAV *pokeathlonSave);
POKEATHLON_SAV *sub_02031974(POKEATHLON_SAV *pokeathlonSave);

#endif // POKEHEARTGOLD_SAVE_POKEATHLON_H
