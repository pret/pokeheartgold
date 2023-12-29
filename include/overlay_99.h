#ifndef POKEHEARTGOLD_OVY_99_H
#define POKEHEARTGOLD_OVY_99_H

#include "overlay_manager.h"

BOOL PokeathlonMedals_OvyInit(OVY_MANAGER *man, int *state);
BOOL PokeathlonMedals_OvyExec(OVY_MANAGER *man, int *state);
BOOL PokeathlonMedals_OvyExit(OVY_MANAGER *man, int *state);

BOOL PokeathlonEventRecord_OvyInit(OVY_MANAGER *man, int *state);
BOOL PokeathlonEventRecord_OvyExec(OVY_MANAGER *man, int *state);
BOOL PokeathlonEventRecord_OvyExit(OVY_MANAGER *man, int *state);

BOOL PokeathlonCourseRecord_OvyInit(OVY_MANAGER *man, int *state);
BOOL PokeathlonCourseRecord_OvyExec(OVY_MANAGER *man, int *state);
BOOL PokeathlonCourseRecord_OvyExit(OVY_MANAGER *man, int *state);

BOOL ov99_021E677C(OVY_MANAGER *man, int *state);
BOOL ov99_021E6888(OVY_MANAGER *man, int *state);
BOOL ov99_021E6840(OVY_MANAGER *man, int *state);

#endif //POKEHEARTGOLD_OVY_99_H
