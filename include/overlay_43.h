#ifndef POKEHEARTGOLD_OVY_43_H
#define POKEHEARTGOLD_OVY_43_H

#include "menu_input_state.h"
#include "overlay_manager.h"
#include "save.h"

typedef struct PalPadArgs {
    SaveData *saveData;
    MenuInputStateMgr *menuInputStatePtr;
} PalPadArgs;

BOOL PalPad_Init(OVY_MANAGER *man, int *state);
BOOL PalPad_Main(OVY_MANAGER *man, int *state);
BOOL PalPad_Exit(OVY_MANAGER *man, int *state);

#endif // POKEHEARTGOLD_OVY_43_H
