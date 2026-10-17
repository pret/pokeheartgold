#include "unk_02026DE0.h"

#include "global.h"

// NOTE: If same as pokeplat should rename this file to billboard_gfx_sequence.c

// Modified from https://github.com/pret/pokeplatinum/pull/979/changes
// BillboardGfxSequence_GetTexPlttIndexAt
BillboardTexPlttIndex sub_02026DE0(const BillboardGfxSequence *gfxSequence, const u16 index) {
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

// BillboardGfxSequence_SetData
void sub_02026E18(const u32 *data, BillboardGfxSequence *gfxSequence) {
    gfxSequence->seqCount = *data;
    gfxSequence->startFrame = (u16 *)(data + 1);
    gfxSequence->textureIdx = (u8 *)(gfxSequence->startFrame + gfxSequence->seqCount);
    gfxSequence->plttIdx = gfxSequence->textureIdx + gfxSequence->seqCount;
}
