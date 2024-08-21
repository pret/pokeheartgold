#ifndef POKEHEARTGOLD_OVY_14_H
#define POKEHEARTGOLD_OVY_14_H

#include "overlay_manager.h"
#include "save.h"

typedef struct PCBoxArgs {
    SaveData *saveData;
    BOOL *menuInputStatePtr;
    int unk8;
} PCBoxArgs;

BOOL PCBox_Init(OVY_MANAGER *man, int *state);
BOOL PCBox_Main(OVY_MANAGER *man, int *state);
BOOL PCBox_Exit(OVY_MANAGER *man, int *state);

#endif //POKEHEARTGOLD_OVY_14_H
