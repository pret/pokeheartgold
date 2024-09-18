#ifndef POKEHEARTGOLD_OVY_96_H
#define POKEHEARTGOLD_OVY_96_H

#include "overlay_manager.h"

typedef struct PokeathlonCourseArgs PokeathlonCourseArgs;

BOOL PokeathlonCourse_Init(OVY_MANAGER *man, int *state);
BOOL PokeathlonCourse_Main(OVY_MANAGER *man, int *state);
BOOL PokeathlonCourse_Exit(OVY_MANAGER *man, int *state);

#endif // POKEHEARTGOLD_OVY_96_H
