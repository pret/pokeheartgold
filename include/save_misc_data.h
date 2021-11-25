#ifndef POKEHEARTGOLD_SAVE_MISC_DATA_H
#define POKEHEARTGOLD_SAVE_MISC_DATA_H

#include "save.h"

typedef struct SAVE_MISC_DATA {
    u8 filler_0000[0x270];
    u16 rivalName[OT_NAME_LENGTH + 1];
    u8 filler_0280[0x60];
} SAVE_MISC_DATA;

const SAVE_MISC_DATA *Sav2_Misc_const_get(SAVEDATA *saveData);
const u16 *Sav2_Misc_RivalName_const_get(const SAVE_MISC_DATA *misc);

#endif //POKEHEARTGOLD_SAVE_MISC_DATA_H
