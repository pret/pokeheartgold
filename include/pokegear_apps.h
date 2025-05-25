#ifndef POKEHEARTGOLD_OVY_101_H
#define POKEHEARTGOLD_OVY_101_H

#include "overlay_manager.h"

BOOL TownMap_Init(OverlayManager *man, int *state);
BOOL TownMap_Main(OverlayManager *man, int *state);
BOOL TownMap_Exit(OverlayManager *man, int *state);

BOOL PokegearMap_Init(OverlayManager *man, int *state);
BOOL PokegearMap_Main(OverlayManager *man, int *state);
BOOL PokegearMap_Exit(OverlayManager *man, int *state);

BOOL PokegearConfigure_Init(OverlayManager *man, int *state);
BOOL PokegearConfigure_Main(OverlayManager *man, int *state);
BOOL PokegearConfigure_Exit(OverlayManager *man, int *state);

BOOL PokegearPhone_Init(OverlayManager *man, int *state);
BOOL PokegearPhone_Main(OverlayManager *man, int *state);
BOOL PokegearPhone_Exit(OverlayManager *man, int *state);

BOOL PokegearRadio_Init(OverlayManager *man, int *state);
BOOL PokegearRadio_Main(OverlayManager *man, int *state);
BOOL PokegearRadio_Exit(OverlayManager *man, int *state);

#endif // POKEHEARTGOLD_OVY_101_H
