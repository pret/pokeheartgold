#ifndef POKEHEARTGOLD_OPTIONS_APP_H
#define POKEHEARTGOLD_OPTIONS_APP_H

#include "menu_input_state.h"
#include "options.h"
#include "overlay_manager.h"

typedef struct OptionsApp_Args {
    u32 unk0;
    Options *options;
    MenuInputStateMgr *menuInputStateMgr;
} OptionsApp_Args;

BOOL OptionsMenu_Init(OverlayManager *manager, int *state);
BOOL OptionsMenu_Main(OverlayManager *manager, int *state);
BOOL OptionsMenu_Exit(OverlayManager *manager, int *state);

#endif
