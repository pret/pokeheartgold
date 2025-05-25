#ifndef POKEHEARTGOLD_OVY_73_H
#define POKEHEARTGOLD_OVY_73_H

#include "game_stats.h"
#include "menu_input_state.h"
#include "options.h"
#include "overlay_manager.h"
#include "save.h"
#include "script.h"

typedef struct UnkStruct_0203F4F8 {
    SaveData *saveData;
    struct UnkStruct_0205AC88 *unk4;
    Options *options;
    GameStats *gameStats;
    MenuInputStateMgr *menuInputStatePtr;
} UnkStruct_0203F4F8;

BOOL ov73_021E5900(OverlayManager *man, int *state);
BOOL ov73_021E5AB8(OverlayManager *man, int *state);
BOOL ov73_021E5BAC(OverlayManager *man, int *state);

BOOL ov73_021E7E4C(OverlayManager *man, int *state);
BOOL ov73_021E7FB8(OverlayManager *man, int *state);
BOOL ov73_021E808C(OverlayManager *man, int *state);

#endif // POKEHEARTGOLD_OVY_73_H
