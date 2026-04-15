#ifndef POKEHEARTGOLD_POKEATHLON_BOX_H
#define POKEHEARTGOLD_POKEATHLON_BOX_H

#include "global.h"

#include "overlay_manager.h"

typedef struct PokeathlonBox {
    u32 unk0;
    u32 unk4;
    u32 unk8;
    u32 unkC;
    u8 filler10[24];
    BOOL unk28;
} PokeathlonBox;

BOOL ov97_0221E5C0();
BOOL ov97_0221E5D4(OverlayManager *manager);

u32 ov97_0221E6DC();

#endif // POKEHEARTGOLD_POKEATHLON_BOX_H
