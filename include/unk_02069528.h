#ifndef POKEHEARTGOLD_UNK_02069528_H
#define POKEHEARTGOLD_UNK_02069528_H

#include "global.h"

#include "frontier_data.h"
#include "pokemon_types_def.h"
#include "save.h"

typedef struct UnkStruct_02069528 {
    u8 unk0[0xA8];
    u16 *playerName;
    u8 unkAC[0xC];
    u8 gameVersion;
    u8 gameLanguage;
    u8 playerCountry;
    u8 playerRegion;
    u32 trainerId;
    u8 unkC0[0x8];
    u8 unkC8_0 : 1;
    u8 playerGender : 1;
    u8 unkC8_2 : 6;
    u8 trainerClass;
    u8 unkCA[0x18];
    u16 unkE2;
} UnkStruct_02069528;

void sub_02069528(SaveData *saveData, s32 a1, UnkStruct_02069528 *a2);

#endif // POKEHEARTGOLD_UNK_02069528_H
