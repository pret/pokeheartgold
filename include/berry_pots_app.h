#ifndef POKEHEARTGOLD_BERRY_POTS_APP_H
#define POKEHEARTGOLD_BERRY_POTS_APP_H

#include "overlay_manager.h"

void ov17_02201BC0(void);
BOOL BerryPotsApp_Initialize(OVY_MANAGER *manager, int *state);
BOOL BerryPotsApp_Run(OVY_MANAGER *manager, int *state);
BOOL BerryPotsApp_Exit(OVY_MANAGER *manager, int *state);

#endif
