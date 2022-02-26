#ifndef POKEHEARTGOLD_SAV_CHATOT_H
#define POKEHEARTGOLD_SAV_CHATOT_H

#include "save.h"

typedef struct SOUND_CHATOT SOUND_CHATOT;

SOUND_CHATOT *Sav2_Chatot_get(SAVEDATA *saveData);
u32 Sav2_Chatot_sizeof(void);
void Sav2_Chatot_init(SOUND_CHATOT *chatot);

#endif //POKEHEARTGOLD_SAV_CHATOT_H
