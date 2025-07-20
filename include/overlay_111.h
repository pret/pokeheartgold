#ifndef POKEHEARTGOLD_OVY_111_H
#define POKEHEARTGOLD_OVY_111_H

#include "options.h"
#include "overlay_manager.h"
#include "pokemon_types_def.h"

typedef struct BugContestSwapMonArgs {
    Pokemon *newlyCaughtMon;
    Pokemon *currentMon;
    BOOL noPokemonCaught;
    Options *options;
    Pokemon *unk10;
} BugContestSwapMonArgs;

BOOL BugContestSwapMon_Init(OverlayManager *man, int *state);
BOOL BugContestSwapMon_Main(OverlayManager *man, int *state);
BOOL BugContestSwapMon_Exit(OverlayManager *man, int *state);

#endif // POKEHEARTGOLD_OVY_111_H
