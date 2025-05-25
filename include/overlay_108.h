#ifndef POKEHEARTGOLD_OVY_108_H
#define POKEHEARTGOLD_OVY_108_H

#include "menu_input_state.h"
#include "overlay_manager.h"
#include "save.h"

typedef struct SafariAreaCustomizerArgs {
    SaveData *saveData;
    MenuInputStateMgr *menuInputStatePtr;
    u8 unk8[0x1c];
} SafariAreaCustomizerArgs;

BOOL SafariDecoration_Init(OverlayManager *man, int *state);
BOOL SafariDecoration_Main(OverlayManager *man, int *state);
BOOL SafariDecoration_Exit(OverlayManager *man, int *state);

BOOL SafariAreaCustomizer_Init(OverlayManager *man, int *state);
BOOL SafariAreaCustomizer_Main(OverlayManager *man, int *state);
BOOL SafariAreaCustomizer_Exit(OverlayManager *man, int *state);

#endif // POKEHEARTGOLD_OVY_108_H
