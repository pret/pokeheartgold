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
    u16 colorRGB;
    u32 unk14;
    u32 fogTable[8];
} FogData;

FogData *Fog_New();
void Fog_Free(FogData **fog);
BOOL Fog_CheckActive(FogData *fog);
GXFogSlope Fog_GetSlope(FogData *fog);
int Fog_GetOffset(FogData *fog);
u16 Fog_GetColorRGB(FogData *fog);
void Fog_Set(FogData *fog, s32 arg1, BOOL enable, GXFogBlend fogMode, GXFogSlope fogSlope, int fogOffset);
void Fog_SetColor(FogData *fog, u32 arg1, u16 arg2, u32 arg3);
void Fog_SetFogTable(FogData *fog, u8 *src);

enum FogSet {
    FOG_SET_ENABLE = (1 << 0),
    FOG_SET_MODE = (1 << 1),
    FOG_SET_SLOPE = (1 << 2),
    FOG_SET_OFFSET = (1 << 3),
    FOG_SET_COLOR_RGB = (1 << 4),
    FOG_SET_COLOR2 = (1 << 5),
    FOG_SET_ALL = -1,
};

#endif // POKEHEARTGOLD_FIELD_FOG_H
