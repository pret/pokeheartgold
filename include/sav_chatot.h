#ifndef POKEHEARTGOLD_SAV_CHATOT_H
#define POKEHEARTGOLD_SAV_CHATOT_H

#include "save.h"

typedef struct SOUND_CHATOT {
    BOOL exists;
    s8 data[1000];
} SOUND_CHATOT;

u32 Save_Chatot_sizeof(void);
void Save_Chatot_init(SOUND_CHATOT *chatot);
SOUND_CHATOT *Chatot_New(HeapID heapId);
SOUND_CHATOT *Save_Chatot_Get(SAVEDATA *saveData);
BOOL Chatot_exists(SOUND_CHATOT *chatot);
void Chatot_invalidate(SOUND_CHATOT *chatot);
s8 *Chatot_GetData(SOUND_CHATOT *chatot);
void Chatot_Decode(s8 *dest, const s8 *data);
void Chatot_Encode(SOUND_CHATOT *chatot, const s8 *data);
void Chatot_Copy(SOUND_CHATOT *dst, SOUND_CHATOT *src);

#endif //POKEHEARTGOLD_SAV_CHATOT_H
