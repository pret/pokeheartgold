#ifndef POKEHEARTGOLD_OVY_54_H
#define POKEHEARTGOLD_OVY_54_H

#include "options.h"
#include "overlay_manager.h"

typedef struct OptionsMenuArgs {
    u8 unk0[0x4];
    Options *options;
    u32 *unk8;
} OptionsMenuArgs;

BOOL OptionsMenu_OvyInit(OVY_MANAGER *man, int *state);
BOOL OptionsMenu_OvyExec(OVY_MANAGER *man, int *state);
BOOL OptionsMenu_OvyExit(OVY_MANAGER *man, int *state);

#endif //POKEHEARTGOLD_OVY_54_H
