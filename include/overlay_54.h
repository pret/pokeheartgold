#ifndef POKEHEARTGOLD_OVY_54_H
#define POKEHEARTGOLD_OVY_54_H

#include "menu_input_state.h"
#include "options.h"
#include "overlay_manager.h"

typedef struct OptionsMenuArgs {
    u8 unk0[0x4];
    Options *options;
    MenuInputStateMgr *menuInputStatePtr;
} OptionsMenuArgs;

BOOL OptionsMenu_Init(OverlayManager *man, int *state);
BOOL OptionsMenu_Main(OverlayManager *man, int *state);
BOOL OptionsMenu_Exit(OverlayManager *man, int *state);

#endif // POKEHEARTGOLD_OVY_54_H
