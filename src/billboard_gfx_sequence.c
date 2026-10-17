#include "billboard_gfx_sequence.h"

#include "global.h"

// Modified from https://github.com/pret/pokeplatinum/pull/979/changes
BillboardTexPlttIndex BillboardGfxSequence_GetTexPlttIndexAt(const BillboardGfxSequence *gfxSequence, const u16 index) {
    int i;
    for (i = 0; i < gfxSequence->seqCount - 1; i++) {
        if (gfxSequence->startFrame[i + 1] > index) {
            break;
        }
    }

    BillboardTexPlttIndex outIndexes;
    outIndexes.textureIdx = gfxSequence->textureIdx[i];
    outIndexes.plttIdx = gfxSequence->plttIdx[i];

    return outIndexes;
}

void BillboardGfxSequence_SetData(const u32 *data, BillboardGfxSequence *gfxSequence) {
    gfxSequence->seqCount = *data;
    gfxSequence->startFrame = (u16 *)(data + 1);
    gfxSequence->textureIdx = (u8 *)(gfxSequence->startFrame + gfxSequence->seqCount);
    gfxSequence->plttIdx = gfxSequence->textureIdx + gfxSequence->seqCount;
}
