#ifndef POKEHEARTGOLD_APPLICATION_MAIN_MENU_MAIN_MENU_H
#define POKEHEARTGOLD_APPLICATION_MAIN_MENU_MAIN_MENU_H

#include "overlay_manager.h"

FS_EXTERN_OVERLAY(OVY_74);

extern const OVY_MGR_TEMPLATE gApp_MainMenu;

BOOL MainMenuApp_Init(OVY_MANAGER *manager, int *state);
BOOL MainMenuApp_Main(OVY_MANAGER *manager, int *state);
BOOL MainMenuApp_Exit(OVY_MANAGER *manager, int *state);

#endif
