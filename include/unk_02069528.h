#ifndef POKEHEARTGOLD_UNK_02069528_H
#define POKEHEARTGOLD_UNK_02069528_H

#include "global.h"
#include "frontier_data.h"
#include "save.h"

typedef struct UnkStruct_02069528 {
    u8 unk0[0xA8];
    u16* playerName;
    u8 unkAC[0xC];
    u8 gameVersion;
    u8 gameLanguage;
    u8 playerCountry;
    u8 playerRegion;
    u32 trainerId;
    u8 unkC0[0x8];
    u8 unkC8;
    u8 trainerClass;
    u8 unkCA[0x18];
    u16 unkE2;
} UnkStruct_02069528;

void sub_0202D4DC(FRONTIERDATA*, s32, UnkStruct_02069528*);
s16 sub_0202D564(FRONTIERDATA*);
s16 sub_0202D5DC(FRONTIERDATA*, s32, s32);
void* sub_0202D660(SaveData*, s32);
void sub_02069528(SaveData*, s32, UnkStruct_02069528*);

#endif // POKEHEARTGOLD_UNK_02069528_H