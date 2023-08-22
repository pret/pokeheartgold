#ifndef POKEHEARTGOLD_UNK_02088288_H
#define POKEHEARTGOLD_UNK_02088288_H

#include "save_special_ribbons.h"

extern struct OVY_MGR_TEMPLATE _02103A1C;

typedef struct UnkStruct_0204F448 {
    Party *party;
    OPTIONS *options;
    u8 filler08[9];
    u8 unk11;
    u8 unk12;
    u8 partyCount;
    u8 unk14;
    u8 filler15[2];
    u16 unk18;
    BOOL isNatDexEnabled;
    SaveSpecialRibbons* ribbons;
    u8 filler24[8];
    u32 unk2C;
    u8 filler30[4];
    BOOL isFlag982Set;
    u8 filler38[4];
} UnkStruct_0204F448;

u32 sub_02088288(SaveData*);
BOOL sub_0208828C(SaveData*);
void sub_02089D40(void*, const u8*);
void sub_0208AD34(void*, PlayerProfile*);

#endif //POKEHEARTGOLD_UNK_02088288_H

