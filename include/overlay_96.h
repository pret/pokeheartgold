#ifndef POKEHEARTGOLD_OVY_96_H
#define POKEHEARTGOLD_OVY_96_H

#include "overlay_manager.h"

typedef struct PokeathlonCourseArgs PokeathlonCourseArgs;

BOOL PokeathlonCourse_Init(OverlayManager *man, int *state);
BOOL PokeathlonCourse_Main(OverlayManager *man, int *state);
BOOL PokeathlonCourse_Exit(OverlayManager *man, int *state);

#endif // POKEHEARTGOLD_OVY_96_H
