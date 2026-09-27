#ifndef POKEHEARTGOLD_FIELD_FOG_H
#define POKEHEARTGOLD_FIELD_FOG_H

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
BOOL Fog_CheckActive(FogData *fog);
GXFogSlope Fog_GetSlope(FogData *fog);
int Fog_GetOffset(FogData *fog);
u16 ov01_021EA860(FogData *fog);
void Fog_Set(FogData *fog, s32 arg1, BOOL enable, GXFogBlend fogMode, GXFogSlope fogSlope, int fogOffset);
void ov01_021EA89C(FogData *fog, u32 arg1, u16 arg2, u32 arg3);
void ov01_021EA8C4(FogData *fog, u8 *src);

#endif // POKEHEARTGOLD_FIELD_FOG_H
