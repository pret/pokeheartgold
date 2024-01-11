#ifndef POKEHEARTGOLD_ALPH_PUZZLE_H
#define POKEHEARTGOLD_ALPH_PUZZLE_H

#include "bg_window.h"
#include "overlay_manager.h"
#include "unk_0200CF18.h"
#include "palette.h"
#include "message_format.h"
#include "msgdata.h"
#include "task.h"
#include "yes_no_prompt.h"

typedef enum AlphPuzzles {
    ALPH_PUZZLE_KABUTO,
    ALPH_PUZZLE_AEROACTYL,
    ALPH_PUZZLE_OMANYTE,
    ALPH_PUZZLE_HO_OH,
    ALPH_PUZZLE_MAX
} AlphPuzzles;

typedef struct UnkAlphSub_10 {
    void *unk_00; // unused
    u8 unk4; // unused
    u8 puzzleIndex;
    u8 unk6; // unused
    u8 unk7; // unused
    u32 *fieldSystemUnk10Cpointer;
    SaveData *savedata;
} UnkAlphSub_10;

BOOL ov110_AlphPuzzle_OvyInit(OVY_MANAGER *man, int *state);
BOOL ov110_AlphPuzzle_OvyExec(OVY_MANAGER *man, int *state);
BOOL ov110_AlphPuzzle_OvyExit(OVY_MANAGER *man, int *state);

#endif //POKEHEARTGOLD_ALPH_PUZZLE_H
