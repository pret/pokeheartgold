#ifndef POKEHEARTGOLD_OVY_43_H
#define POKEHEARTGOLD_OVY_43_H

#include "overlay_manager.h"
#include "save.h"

typedef struct PalPadArgs {
    SaveData *saveData;
    u32 *unk4;
} PalPadArgs;

BOOL PalPad_OvyInit(OVY_MANAGER *man, int *state);
BOOL PalPad_OvyExec(OVY_MANAGER *man, int *state);
BOOL PalPad_OvyExit(OVY_MANAGER *man, int *state);

#endif //POKEHEARTGOLD_OVY_43_H
