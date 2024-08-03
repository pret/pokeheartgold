#ifndef POKEHEARTGOLD_OVY_87_H
#define POKEHEARTGOLD_OVY_87_H

#include "overlay_manager.h"
#include "save.h"

typedef struct ScratchOffCardsArgs {
    SaveData *saveData;
    u8 filler_04[4];
    u16 unk_08[3];
    u16 unk_0E[3];
    u8 filler_14[4];
} ScratchOffCardsArgs;

BOOL ScratchOffCards_Init(OVY_MANAGER *man, int *state);
BOOL ScratchOffCards_Main(OVY_MANAGER *man, int *state);
BOOL ScratchOffCards_Exit(OVY_MANAGER *man, int *state);

#endif // POKEHEARTGOLD_OVY_87_H
