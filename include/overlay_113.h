#ifndef POKEHEARTGOLD_OVY_113_H
#define POKEHEARTGOLD_OVY_113_H

#include "menu_input_state.h"
#include "overlay_manager.h"
#include "save.h"

typedef struct UnownReportArgs {
    MenuInputStateMgr *menuInputStatePtr;
    SaveData *saveData;
} UnownReportArgs;

BOOL UnownReport_Init(OVY_MANAGER *man, int *state);
BOOL UnownReport_Main(OVY_MANAGER *man, int *state);
BOOL UnownReport_Exit(OVY_MANAGER *man, int *state);

#endif // POKEHEARTGOLD_OVY_113_H
