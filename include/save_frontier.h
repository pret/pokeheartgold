#ifndef POKEHEARTGOLD_SAVE_FRONTIER_H
#define POKEHEARTGOLD_SAVE_FRONTIER_H

#include "global.h"

typedef struct FrontierSave {
    u16 unk_000[112];
    u16 unk_0E0[5][32]; // just guessing here
    u8 filler_220[0x1408];
} FrontierSave; // size: 0x1628

#endif
