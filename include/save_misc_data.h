#ifndef POKEHEARTGOLD_SAVE_MISC_DATA_H
#define POKEHEARTGOLD_SAVE_MISC_DATA_H

#include "save.h"

typedef struct APRICORN_TREE {
    u8 unk_0;
    u8 unk_1;
    u16 unk_2;
} APRICORN_TREE;

#define MAX_APRICORN_TREE 128
#define NUM_APRICORN_TREE 31

typedef struct SAVE_MISC_DATA {
    APRICORN_TREE apricorn_trees[MAX_APRICORN_TREE];
    u8 filler_0200[0x70];
    u16 rivalName[OT_NAME_LENGTH + 1];
    u8 filler_0280[0x60];
} SAVE_MISC_DATA;

const SAVE_MISC_DATA *Sav2_Misc_const_get(SAVEDATA *saveData);
const u16 *Sav2_Misc_RivalName_const_get(const SAVE_MISC_DATA *misc);

#endif //POKEHEARTGOLD_SAVE_MISC_DATA_H
