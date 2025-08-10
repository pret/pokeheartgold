#ifndef GUARD_POKEHEARTGOLD_APPLICATION_POKEGEAR_POKEGEAR_MAIN_H
#define GUARD_POKEHEARTGOLD_APPLICATION_POKEGEAR_POKEGEAR_MAIN_H

#include "global.h"

#include "overlay_manager.h"

BOOL Pokegear_Init(OverlayManager *man, int *state);
BOOL Pokegear_Main(OverlayManager *man, int *state);
BOOL Pokegear_Exit(OverlayManager *man, int *state);

#endif // GUARD_POKEHEARTGOLD_APPLICATION_POKEGEAR_POKEGEAR_MAIN_H
