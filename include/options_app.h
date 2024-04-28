#ifndef POKEHEARTGOLD_OPTIONS_APP_H
#define POKEHEARTGOLD_OPTIONS_APP_H

#include "overlay_manager.h"

typedef struct OptionsApp_Args {
    u32 unk0;
    Options *options;
    u32 *unk8;
} OptionsApp_Args;

BOOL OptionsMenu_Init(OVY_MANAGER *manager, int *state);
BOOL OptionsMenu_Main(OVY_MANAGER *manager, int *state);
BOOL OptionsMenu_Exit(OVY_MANAGER *manager, int *state);

#endif
