#ifndef POKEHEARTGOLD_VOLTORB_FLIP_H
#define POKEHEARTGOLD_VOLTORB_FLIP_H

#include "options.h"
#include "overlay_manager.h"
#include "player_data.h"
#include "save.h"

typedef struct VoltorbFlipAppArgs {
    OPTIONS *options;
    u16 *coins;
    u32 *unk8;
    PlayerProfile *profile;
    SaveData *saveData;
} VoltorbFlipAppArgs;

BOOL VoltorbFlipApp_OvyInit(OVY_MANAGER *man, int *state);
BOOL VoltorbFlipApp_OvyExit(OVY_MANAGER *man, int *state);
BOOL VoltorbFlipApp_OvyExec(OVY_MANAGER *man, int *state);

#endif //POKEHEARTGOLD_VOLTORB_FLIP_H
