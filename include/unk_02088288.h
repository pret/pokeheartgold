#ifndef POKEHEARTGOLD_UNK_02088288_H
#define POKEHEARTGOLD_UNK_02088288_H

#include "options.h"
#include "pokemon_types_def.h"
#include "save_special_ribbons.h"

extern struct OVY_MGR_TEMPLATE gOverlayTemplate_PokemonSummary;

typedef struct PokemonSummaryArgs {
    Party *party;
    Options *options;
    u8 unk8[0x8];
    u8 unk10;
    u8 unk11;
    u8 unk12;
    u8 partyCount;
    u8 unk14;
    u8 unk15[0x3];
    u16 unk18;
    u8 unk1A[0x2];
    BOOL natDexEnabled;
    SaveSpecialRibbons *ribbons;
    u8 unk24[0x4];
    int unk28;
    int unk2C;
    u32 *unk30;
    BOOL isFlag982Set;
    u8 unk38[0x4];
} PokemonSummaryArgs;

u32 sub_02088288(SaveData*);
BOOL sub_0208828C(SaveData*);
void sub_02089D40(void*, const u8*);
void sub_0208AD34(void*, PlayerProfile*);

#endif //POKEHEARTGOLD_UNK_02088288_H

