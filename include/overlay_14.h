#ifndef POKEHEARTGOLD_OVY_14_H
#define POKEHEARTGOLD_OVY_14_H

#include "overlay_manager.h"
#include "save.h"

typedef struct PCBoxArgs {
    SaveData *saveData;
    void *fieldSystemUnk10C;
    int unk8;
} PCBoxArgs;

BOOL PCBox_OvyInit(OVY_MANAGER *man, int *state);
BOOL PCBox_OvyExec(OVY_MANAGER *man, int *state);
BOOL PCBox_OvyExit(OVY_MANAGER *man, int *state);

#endif //POKEHEARTGOLD_OVY_14_H
