#ifndef POKEHEARTGOLD_ALPH_PUZZLE_H
#define POKEHEARTGOLD_ALPH_PUZZLE_H

#include "overlay_manager.h"

typedef struct AlphPuzzleData {
    HeapID heapId;
    u32 unk4;
    u32 unk8;
    u32 unkC;
    void *unk10;
    u8 unk14[0x14C];
} AlphPuzzleData;

BOOL ov110_AlphPuzzle_OvyInit(OVY_MANAGER *man, int *state);

//the following functions haven't been decompiled yet
void ov110_021E5A24(void);
BOOL ov110_021E5AD4(AlphPuzzleData *data);
void ov110_021E5A74(AlphPuzzleData *data);

#endif //POKEHEARTGOLD_ALPH_PUZZLE_H
