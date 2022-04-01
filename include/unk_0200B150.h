#ifndef POKEHEARTGOLD_UNK_0200B150_H
#define POKEHEARTGOLD_UNK_0200B150_H

#include "heap.h"

void sub_0200B528(void);
void sub_0200B594(void);
void SetBlendBrightness(int brightness, int plane, int screenBit);
void OamManager_ApplyAndResetBuffers(void);
void OamManager_Free(void);
void OamManager_Create(int, int, int, int, int, int, int, int, HeapID);

#endif //POKEHEARTGOLD_UNK_0200B150_H
