#ifndef POKEHEARTGOLD_UNK_02026DE0_H
#define POKEHEARTGOLD_UNK_02026DE0_H

#include "heap.h"

typedef struct BillboardGfxSequence {
    const u16 *startFrame;
    const u8 *textureIdx;
    const u8 *plttIdx;
    u32 seqCount;
} BillboardGfxSequence;

typedef struct BillboardTexPlttIndex {
    u8 textureIdx;
    u8 plttIdx;
} BillboardTexPlttIndex;

// BillboardGfxSequence_SetData
void sub_02026E18(const u32 *data, BillboardGfxSequence *gfxSequence);

// BillboardGfxSequence_GetTexPlttIndexAt
BillboardTexPlttIndex sub_02026DE0(const BillboardGfxSequence *gfxSequence, const u16 index);

#endif // POKEHEARTGOLD_UNK_02026DE0_H
