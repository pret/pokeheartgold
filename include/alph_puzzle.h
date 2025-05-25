#ifndef POKEHEARTGOLD_ALPH_PUZZLE_H
#define POKEHEARTGOLD_ALPH_PUZZLE_H

#include "bg_window.h"
#include "menu_input_state.h"
#include "message_format.h"
#include "msgdata.h"
#include "overlay_manager.h"
#include "palette.h"
#include "save.h"
#include "sprite_system.h"
#include "task.h"
#include "yes_no_prompt.h"

typedef enum AlphPuzzles {
    ALPH_PUZZLE_KABUTO,
    ALPH_PUZZLE_AEROACTYL,
    ALPH_PUZZLE_OMANYTE,
    ALPH_PUZZLE_HO_OH,
    ALPH_PUZZLE_MAX
} AlphPuzzles;

typedef struct AlphPuzzleArgs {
    void *unk_00; // unused
    u8 unk4;      // unused
    u8 puzzle;
    u8 unk6; // unused
    u8 unk7; // unused
    MenuInputStateMgr *menuInputStatePtr;
    SaveData *saveData;
} AlphPuzzleArgs;

BOOL AlphPuzzle_Init(OverlayManager *man, int *state);
BOOL AlphPuzzle_Main(OverlayManager *man, int *state);
BOOL AlphPuzzle_Exit(OverlayManager *man, int *state);

#endif // POKEHEARTGOLD_ALPH_PUZZLE_H
