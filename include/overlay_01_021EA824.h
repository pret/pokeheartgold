#ifndef POKEHEARTGOLD_OVERLAY_01_021EA824_H
#define POKEHEARTGOLD_OVERLAY_01_021EA824_H

#include "global.h"
#include "gf_3d_vramman.h"
#include "gf_gfx_planes.h"

void G3X_SetFogTable(u32 *fogTable);

typedef struct {
    BOOL enable;
    GXFogBlend fogMode;
    GXFogSlope fogSlope;
    int fogOffset;
    u16 unk10;
    u32 unk14;
    u32 fogTable[8];
} UnkStruct_Ov01_021EA824;

void* ov01_021EA824();
void ov01_021EA840(s32* arg0);
BOOL ov01_021EA854(UnkStruct_Ov01_021EA824* arg0);
GXFogSlope ov01_021EA858(UnkStruct_Ov01_021EA824* arg0);
int ov01_021EA85C(UnkStruct_Ov01_021EA824* arg0);
u16 ov01_021EA860(UnkStruct_Ov01_021EA824 *arg0);
void ov01_021EA864(UnkStruct_Ov01_021EA824* arg0, s32 arg1, BOOL enable, GXFogBlend fogMode, GXFogSlope fogSlope, int fogOffset);
void ov01_021EA89C(UnkStruct_Ov01_021EA824* arg0, u32 arg1, u16 arg2, u32 arg3);
void ov01_021EA8C4(UnkStruct_Ov01_021EA824 *arg0, const u32 *src);

#endif // POKEHEARTGOLD_OVERLAY_01_021EA824_H
