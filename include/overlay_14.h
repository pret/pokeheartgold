#ifndef POKEHEARTGOLD_OVY_14_H
#define POKEHEARTGOLD_OVY_14_H

#include "menu_input_state.h"
#include "overlay_manager.h"
#include "save.h"

typedef struct PCBoxArgs {
    SaveData *saveData;
    MenuInputStateMgr *menuInputStatePtr;
    int unk8;
} PCBoxArgs;

BOOL PCBox_Init(OverlayManager *man, int *state);
BOOL PCBox_Main(OverlayManager *man, int *state);
BOOL PCBox_Exit(OverlayManager *man, int *state);

#endif // POKEHEARTGOLD_OVY_14_H
