#ifndef POKEHEARTGOLD_OVY_43_H
#define POKEHEARTGOLD_OVY_43_H

#include "menu_input_state.h"
#include "overlay_manager.h"
#include "save.h"

typedef struct PalPadArgs {
    SaveData *saveData;
    MenuInputStateMgr *menuInputStatePtr;
} PalPadArgs;

BOOL PalPad_Init(OverlayManager *man, int *state);
BOOL PalPad_Main(OverlayManager *man, int *state);
BOOL PalPad_Exit(OverlayManager *man, int *state);

#endif // POKEHEARTGOLD_OVY_43_H
