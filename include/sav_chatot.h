#ifndef POKEHEARTGOLD_SAV_CHATOT_H
#define POKEHEARTGOLD_SAV_CHATOT_H

#include "save.h"

typedef struct SOUND_CHATOT {
    BOOL exists;
    s8 data[1000];
} SOUND_CHATOT;

u32 Sav2_Chatot_sizeof(void);
void Sav2_Chatot_init(SOUND_CHATOT *chatot);
SOUND_CHATOT *Chatot_new(HeapID heapId);
SOUND_CHATOT *Sav2_Chatot_get(SAVEDATA *saveData);
BOOL Chatot_exists(SOUND_CHATOT *chatot);
void Chatot_invalidate(SOUND_CHATOT *chatot);
s8 *Chatot_GetData(SOUND_CHATOT *chatot);
void Chatot_Decode(s8 *dest, const s8 *data);
void Chatot_Encode(SOUND_CHATOT *chatot, const s8 *data);
void Chatot_copy(SOUND_CHATOT *dst, SOUND_CHATOT *src);

#endif //POKEHEARTGOLD_SAV_CHATOT_H
