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

BOOL BugContestSwapMon_Init(OVY_MANAGER *man, int *state);
BOOL BugContestSwapMon_Main(OVY_MANAGER *man, int *state);
BOOL BugContestSwapMon_Exit(OVY_MANAGER *man, int *state);

#endif //POKEHEARTGOLD_OVY_111_H
