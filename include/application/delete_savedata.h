#ifndef POKEHEARTGOLD_APPLICATION_DELETE_SAVEDATA_H
#define POKEHEARTGOLD_APPLICATION_DELETE_SAVEDATA_H

#include "overlay_manager.h"

extern const OverlayManagerTemplate gApplication_DeleteSave;

BOOL DeleteSavedataApp_Init(OverlayManager *manager, int *state);
BOOL DeleteSavedataApp_Main(OverlayManager *manager, int *state);
BOOL DeleteSavedataApp_Exit(OverlayManager *manager, int *state);

#endif
