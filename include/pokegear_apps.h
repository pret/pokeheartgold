#ifndef POKEHEARTGOLD_OVY_101_H
#define POKEHEARTGOLD_OVY_101_H

#include "overlay_manager.h"

BOOL TownMap_Init(OVY_MANAGER *man, int *state);
BOOL TownMap_Main(OVY_MANAGER *man, int *state);
BOOL TownMap_Exit(OVY_MANAGER *man, int *state);

BOOL PokegearMap_Init(OVY_MANAGER *man, int *state);
BOOL PokegearMap_Main(OVY_MANAGER *man, int *state);
BOOL PokegearMap_Exit(OVY_MANAGER *man, int *state);

BOOL PokegearConfigure_Init(OVY_MANAGER *man, int *state);
BOOL PokegearConfigure_Main(OVY_MANAGER *man, int *state);
BOOL PokegearConfigure_Exit(OVY_MANAGER *man, int *state);

BOOL PokegearPhone_Init(OVY_MANAGER *man, int *state);
BOOL PokegearPhone_Main(OVY_MANAGER *man, int *state);
BOOL PokegearPhone_Exit(OVY_MANAGER *man, int *state);

BOOL PokegearRadio_Init(OVY_MANAGER *man, int *state);
BOOL PokegearRadio_Main(OVY_MANAGER *man, int *state);
BOOL PokegearRadio_Exit(OVY_MANAGER *man, int *state);

#endif // POKEHEARTGOLD_OVY_101_H
