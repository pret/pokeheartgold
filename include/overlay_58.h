#ifndef POKEHEARTGOLD_OVY_58_H
#define POKEHEARTGOLD_OVY_58_H

#include "menu_input_state.h"
#include "overlay_manager.h"
#include "save.h"

typedef struct ApricornBoxArgs {
    u8 unk0;
    u8 unk1[0x7];
    u16 *unk8;
    u32 unkC;
    u32 unk10;
    MenuInputStateMgr *menuInputStatePtr;
    SaveData *saveData;
} ApricornBoxArgs;

BOOL ApricornBox_Init(OverlayManager *man, int *state);
BOOL ApricornBox_Main(OverlayManager *man, int *state);
BOOL ApricornBox_Exit(OverlayManager *man, int *state);

#endif // POKEHEARTGOLD_OVY_58_H
