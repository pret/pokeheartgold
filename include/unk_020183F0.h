#ifndef POKEHEARTGOLD_UNK_020183F0_H
#define POKEHEARTGOLD_UNK_020183F0_H

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

#endif // POKEHEARTGOLD_UNK_020183F0_H
