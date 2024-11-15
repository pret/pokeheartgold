#ifndef POKEHEARTGOLD_APPLICATION_DELETE_SAVEDATA_H
#define POKEHEARTGOLD_APPLICATION_DELETE_SAVEDATA_H

#include "overlay_manager.h"

extern const OVY_MGR_TEMPLATE gApplication_DeleteSave;

BOOL DeleteSavedataApp_Init(OVY_MANAGER *manager, int *state);
BOOL DeleteSavedataApp_Main(OVY_MANAGER *manager, int *state);
BOOL DeleteSavedataApp_Exit(OVY_MANAGER *manager, int *state);

#endif
