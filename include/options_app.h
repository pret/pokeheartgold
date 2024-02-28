#ifndef POKEHEARTGOLD_OPTIONS_APP_H
#define POKEHEARTGOLD_OPTIONS_APP_H

#include "overlay_manager.h"

typedef struct OptionsApp_Args {
    u32 unk0;
    Options *options;
    u32 *unk8;
} OptionsApp_Args;

BOOL OptionsMenu_OvyInit(OVY_MANAGER *manager, int *state);
BOOL OptionsMenu_OvyExec(OVY_MANAGER *manager, int *state);
BOOL OptionsMenu_OvyExit(OVY_MANAGER *manager, int *state);

#endif
