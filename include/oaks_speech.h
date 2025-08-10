#ifndef GUARD_POKEHEARTGOLD_OAKS_SPEECH_H
#define GUARD_POKEHEARTGOLD_OAKS_SPEECH_H

#include "bg_window.h"
#include "naming_screen.h"
#include "options.h"
#include "overlay_manager.h"
#include "save.h"
#include "sprite_system.h"

BOOL OakSpeech_Init(OverlayManager *ovyMan, int *pState);
BOOL OakSpeech_Main(OverlayManager *ovyMan, int *pState);
BOOL OakSpeech_Exit(OverlayManager *ovyMan, int *pState);

#endif // GUARD_POKEHEARTGOLD_OAKS_SPEECH_H
