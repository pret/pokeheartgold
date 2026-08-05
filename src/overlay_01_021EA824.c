#include "overlay_01_021EA824.h"

#include "global.h"

FogData *Fog_New() {
    FogData *dst = Heap_Alloc(HEAP_ID_FIELD1, sizeof(FogData));
    MIi_CpuClear32(0, (void *)dst, sizeof(FogData));
    return dst;
}

void Fog_Free(FogData **fog) {
    Heap_FreeExplicit(HEAP_ID_FIELD1, *fog);
    *fog = NULL;
}

BOOL ov01_021EA854(FogData *fog) {
    return fog->enable;
}

GXFogSlope ov01_021EA858(FogData *fog) {
    return fog->fogSlope;
}

int ov01_021EA85C(FogData *fog) {
    return fog->fogOffset;
}

u16 ov01_021EA860(FogData *fog) {
    return fog->unk10;
}

void ov01_021EA864(FogData *fog, s32 arg1, BOOL enable, GXFogBlend fogMode, GXFogSlope fogSlope, int fogOffset) {
    if (arg1 & 1 << 0) {
        fog->enable = enable;
    }
    if (arg1 & 1 << 1) {
        fog->fogMode = fogMode;
    }
    if (arg1 & 1 << 2) {
        fog->fogSlope = fogSlope;
    }
    if (arg1 & 1 << 3) {
        fog->fogOffset = fogOffset;
    }
    G3X_SetFog(fog->enable, fog->fogMode, fog->fogSlope, fog->fogOffset);
}

void ov01_021EA89C(FogData *fog, u32 arg1, u16 arg2, u32 arg3) {
    if (arg1 & 1 << 4) {
        fog->unk10 = arg2;
    }
    if (arg1 & 1 << 5) {
        fog->unk14 = arg3;
    }
    reg_G3X_FOG_COLOR = fog->unk10 | (fog->unk14 << 16);
}

void ov01_021EA8C4(FogData *fog, const u32 *src) {
    MIi_CpuCopy32(src, fog->fogTable, 32);
    G3X_SetFogTable(fog->fogTable);
}
