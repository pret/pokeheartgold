#ifndef POKEHEARTGOLD_APPLICATION_CHECK_SAVEDATA_H
#define POKEHEARTGOLD_APPLICATION_CHECK_SAVEDATA_H

#include "overlay_manager.h"

extern const OverlayManagerTemplate gApplication_CheckSave;

BOOL CheckSavedataApp_Init(OverlayManager *manager, int *state);
BOOL CheckSavedataApp_Main(OverlayManager *manager, int *state);
BOOL CheckSavedataApp_Exit(OverlayManager *manager, int *state);

#endif // POKEHEARTGOLD_APPLICATION_CHECK_SAVEDATA_H
