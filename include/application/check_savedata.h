#ifndef POKEHEARTGOLD_APPLICATION_CHECK_SAVEDATA_H
#define POKEHEARTGOLD_APPLICATION_CHECK_SAVEDATA_H

#include "overlay_manager.h"

extern const OVY_MGR_TEMPLATE gApplication_CheckSave;

BOOL CheckSavedataApp_Init(OVY_MANAGER *manager, int *state);
BOOL CheckSavedataApp_Main(OVY_MANAGER *manager, int *state);
BOOL CheckSavedataApp_Exit(OVY_MANAGER *manager, int *state);

#endif // POKEHEARTGOLD_APPLICATION_CHECK_SAVEDATA_H
