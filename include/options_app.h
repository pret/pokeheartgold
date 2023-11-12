#ifndef POKEHEARTGOLD_OPTIONS_APP_H
#define POKEHEARTGOLD_OPTIONS_APP_H

#include "overlay_manager.h"

BOOL OptionsApp_Init(OVY_MANAGER *manager, int *state);
BOOL OptionsApp_Run(OVY_MANAGER *manager, int *state);
BOOL OptionsApp_Exit(OVY_MANAGER *manager, int *state);

#endif
