#ifndef POKEHEARTGOLD_CHOOSE_STARTER_APP_H
#define POKEHEARTGOLD_CHOOSE_STARTER_APP_H

#include "pokemon_types_def.h"
#include "options.h"
#include "overlay_manager.h"

typedef struct ChooseStarterArgs {
    int cursorPos;
    Options *options;
    Pokemon starters[3];
} ChooseStarterArgs;

BOOL ChooseStarter_Init(OVY_MANAGER *man, int *state);
BOOL ChooseStarter_Main(OVY_MANAGER *man, int *state);
BOOL ChooseStarter_Exit(OVY_MANAGER *man, int *state);

#endif //POKEHEARTGOLD_CHOOSE_STARTER_APP_H
