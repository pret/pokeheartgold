#ifndef POKEHEARTGOLD_VOLTORB_FLIP_H
#define POKEHEARTGOLD_VOLTORB_FLIP_H

#include "options.h"
#include "overlay_manager.h"
#include "player_data.h"
#include "save.h"

typedef struct VoltorbFlipArgs {
    Options *options;
    u16 *coins;
    u32 *unk8;
    PlayerProfile *profile;
    SaveData *saveData;
} VoltorbFlipArgs;

BOOL VoltorbFlip_OvyInit(OVY_MANAGER *man, int *state);
BOOL VoltorbFlip_OvyExit(OVY_MANAGER *man, int *state);
BOOL VoltorbFlip_OvyExec(OVY_MANAGER *man, int *state);

#endif //POKEHEARTGOLD_VOLTORB_FLIP_H
