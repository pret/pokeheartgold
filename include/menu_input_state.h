#ifndef POKEHEARTGOLD_MENU_INPUT_STATE_H
#define POKEHEARTGOLD_MENU_INPUT_STATE_H

#include "global.h"

typedef enum MenuInputState {
    MENU_INPUT_STATE_BUTTONS,
    MENU_INPUT_STATE_TOUCH,
} MenuInputState;

typedef struct MenuInputStateMgr {
    MenuInputState state;
} MenuInputStateMgr;

MenuInputState MenuInputStateMgr_GetState(MenuInputStateMgr *stateMgr);
void MenuInputStateMgr_SetState(MenuInputStateMgr *stateMgr, MenuInputState state);

#endif // POKEHEARTGOLD_MENU_INPUT_STATE_H
