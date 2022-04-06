#ifndef POKEHEARTGOLD_SAVE_SPECIAL_RIBBONS_H
#define POKEHEARTGOLD_SAVE_SPECIAL_RIBBONS_H

#include "save.h"

#define NUM_SPECIAL_RIBBONS 14

typedef struct SaveSpecialRibbons {
    u8 ribbons[NUM_SPECIAL_RIBBONS];
} SaveSpecialRibbons;

u32 Save_SpecialRibbons_sizeof(void);
void Save_SpecialRibbons_init(SaveSpecialRibbons* argP);
SaveSpecialRibbons* Save_SpecialRibbons_get(SAVEDATA* data);

#endif //POKEHEARTGOLD_SAVE_SPECIAL_RIBBONS_H
