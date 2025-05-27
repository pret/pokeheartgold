#ifndef POKEHEARTGOLD_CHOOSE_STARTER_APP_H
#define POKEHEARTGOLD_CHOOSE_STARTER_APP_H

#include "options.h"
#include "overlay_manager.h"
#include "pokemon_types_def.h"

typedef struct ChooseStarterArgs {
    int cursorPos;
    Options *options;
    Pokemon starters[3];
} ChooseStarterArgs;

BOOL ChooseStarter_Init(OverlayManager *man, int *state);
BOOL ChooseStarter_Main(OverlayManager *man, int *state);
BOOL ChooseStarter_Exit(OverlayManager *man, int *state);

#endif // POKEHEARTGOLD_CHOOSE_STARTER_APP_H
