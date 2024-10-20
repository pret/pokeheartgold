#include "menu_input_state.h"

#include "global.h"

#include "gf_gfx_loader.h"

MenuInputState MenuInputStateMgr_GetState(MenuInputStateMgr *stateMgr) {
    GF_ASSERT(stateMgr->state == MENU_INPUT_STATE_BUTTONS || stateMgr->state == MENU_INPUT_STATE_TOUCH);
    return stateMgr->state;
}

void MenuInputStateMgr_SetState(MenuInputStateMgr *stateMgr, MenuInputState state) {
    GF_ASSERT(state == MENU_INPUT_STATE_BUTTONS || state == MENU_INPUT_STATE_TOUCH);
    stateMgr->state = state;
}
