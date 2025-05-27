#ifndef POKEHEARTGOLD_OVY_113_H
#define POKEHEARTGOLD_OVY_113_H

#include "menu_input_state.h"
#include "overlay_manager.h"
#include "save.h"

typedef struct UnownReportArgs {
    MenuInputStateMgr *menuInputStatePtr;
    SaveData *saveData;
} UnownReportArgs;

BOOL UnownReport_Init(OverlayManager *man, int *state);
BOOL UnownReport_Main(OverlayManager *man, int *state);
BOOL UnownReport_Exit(OverlayManager *man, int *state);

#endif // POKEHEARTGOLD_OVY_113_H
