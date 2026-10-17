#ifndef POKEHEARTGOLD_BILLBOARD_GFX_SEQUENCE_H
#define POKEHEARTGOLD_BILLBOARD_GFX_SEQUENCE_H

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

void BillboardGfxSequence_SetData(const u32 *data, BillboardGfxSequence *gfxSequence);

BillboardTexPlttIndex BillboardGfxSequence_GetTexPlttIndexAt(const BillboardGfxSequence *gfxSequence, const u16 index);

#endif // POKEHEARTGOLD_BILLBOARD_GFX_SEQUENCE_H
