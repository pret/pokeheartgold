#ifndef POKEHEARTGOLD_VOLTORB_FLIP_H
#define POKEHEARTGOLD_VOLTORB_FLIP_H

#include "menu_input_state.h"
#include "options.h"
#include "overlay_manager.h"
#include "player_data.h"
#include "save.h"

typedef struct VoltorbFlipArgs {
    Options *options;
    u16 *coins;
    MenuInputStateMgr *menuInputStatePtr;
    PlayerProfile *profile;
    SaveData *saveData;
} VoltorbFlipArgs;

BOOL VoltorbFlip_Init(OverlayManager *man, int *state);
BOOL VoltorbFlip_Exit(OverlayManager *man, int *state);
BOOL VoltorbFlip_Main(OverlayManager *man, int *state);

#endif // POKEHEARTGOLD_VOLTORB_FLIP_H
