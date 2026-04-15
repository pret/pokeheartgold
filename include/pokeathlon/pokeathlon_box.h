#ifndef POKEHEARTGOLD_POKEATHLON_BOX_H
#define POKEHEARTGOLD_POKEATHLON_BOX_H

#include "global.h"

#include "overlay_manager.h"

typedef struct PokeathlonBox {
    void* unk0;
    u32 state; // 0x4
    u32 unk8;
    u32 unkC;
    u8 filler10[24];
    BOOL unk28;
} PokeathlonBox;

typedef struct PokeathlonBoxArgs {
    PokeathlonBox* ptr;
} PokeathlonBoxArgs;

BOOL ov97_0221E5C0(OverlayManager *manager);
BOOL ov97_0221E5D4(OverlayManager *manager);
BOOL ov97_0221E69C(OverlayManager *manager);
BOOL ov97_0221E6DC(OverlayManager *manager);

u32 ov97_0221E700(OverlayManager *manager);
void ov97_0221E98C(PokeathlonBox*, void*);
void ov97_0221F010(u32);
void ov97_0221F020(u32);

#endif // POKEHEARTGOLD_POKEATHLON_BOX_H
