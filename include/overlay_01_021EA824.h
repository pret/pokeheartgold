#ifndef POKEHEARTGOLD_OVERLAY_01_021EA824_H
#define POKEHEARTGOLD_OVERLAY_01_021EA824_H

#include "global.h"

#include "gf_3d_vramman.h"
#include "gf_gfx_planes.h"

void G3X_SetFogTable(u32 *fogTable);

typedef struct FogData {
    BOOL enable;
    GXFogBlend fogMode;
    GXFogSlope fogSlope;
    int fogOffset;
    u16 unk10;
    u32 unk14;
    u32 fogTable[8];
} FogData;

FogData *Fog_New();
void Fog_Free(FogData **fog);
BOOL ov01_021EA854(FogData *fog);
GXFogSlope ov01_021EA858(FogData *fog);
int ov01_021EA85C(FogData *fog);
u16 ov01_021EA860(FogData *fog);
void ov01_021EA864(FogData *fog, s32 arg1, BOOL enable, GXFogBlend fogMode, GXFogSlope fogSlope, int fogOffset);
void ov01_021EA89C(FogData *fog, u32 arg1, u16 arg2, u32 arg3);
void ov01_021EA8C4(FogData *fog, const u32 *src);

#endif // POKEHEARTGOLD_OVERLAY_01_021EA824_H
