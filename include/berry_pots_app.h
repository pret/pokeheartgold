#ifndef POKEHEARTGOLD_BERRY_POTS_APP_H
#define POKEHEARTGOLD_BERRY_POTS_APP_H

#include "overlay_manager.h"

void ov17_02201BC0(void);
BOOL BerryPotsApp_Initialize(OverlayManager *manager, int *state);
BOOL BerryPotsApp_Run(OverlayManager *manager, int *state);
BOOL BerryPotsApp_Exit(OverlayManager *manager, int *state);
u8 BerryPots_DeadstrippedFunction(int a1, int a2);

#endif
