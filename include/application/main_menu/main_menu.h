#ifndef POKEHEARTGOLD_APPLICATION_MAIN_MENU_MAIN_MENU_H
#define POKEHEARTGOLD_APPLICATION_MAIN_MENU_MAIN_MENU_H

#include "overlay_manager.h"

FS_EXTERN_OVERLAY(OVY_74);

extern const OverlayManagerTemplate gApp_MainMenu;

BOOL MainMenuApp_Init(OverlayManager *manager, int *state);
BOOL MainMenuApp_Main(OverlayManager *manager, int *state);
BOOL MainMenuApp_Exit(OverlayManager *manager, int *state);

#endif
