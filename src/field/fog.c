#include "field/fog.h"

#include "global.h"

FogData *Fog_New() {
    FogData *dst = Heap_Alloc(HEAP_ID_FIELD1, sizeof(FogData));
    MI_CpuClear32((void *)dst, sizeof(FogData));
    return dst;
}

void Fog_Free(FogData **fog) {
    Heap_FreeExplicit(HEAP_ID_FIELD1, *fog);
    *fog = NULL;
}

BOOL Fog_CheckActive(FogData *fog) {
    return fog->enable;
}

GXFogSlope Fog_GetSlope(FogData *fog) {
    return fog->fogSlope;
}

int Fog_GetOffset(FogData *fog) {
    return fog->fogOffset;
}

u16 Fog_GetColorRGB(FogData *fog) {
    return fog->colorRGB;
}

void Fog_Set(FogData *fog, s32 fogSetFlags, BOOL enable, GXFogBlend fogMode, GXFogSlope fogSlope, int fogOffset) {
    if (fogSetFlags & FOG_SET_ENABLE) {
        fog->enable = enable;
    }
    if (fogSetFlags & FOG_SET_MODE) {
        fog->fogMode = fogMode;
    }
    if (fogSetFlags & FOG_SET_SLOPE) {
        fog->fogSlope = fogSlope;
    }
    if (fogSetFlags & FOG_SET_OFFSET) {
        fog->fogOffset = fogOffset;
    }
    G3X_SetFog(fog->enable, fog->fogMode, fog->fogSlope, fog->fogOffset);
}

void Fog_SetColor(FogData *fog, u32 fogSetFlags, u16 colorRGB, u32 arg3) {
    if (fogSetFlags & FOG_SET_COLOR_RGB) {
        fog->colorRGB = colorRGB;
    }
    if (fogSetFlags & FOG_SET_COLOR2) {
        fog->unk14 = arg3;
    }
    reg_G3X_FOG_COLOR = fog->colorRGB | (fog->unk14 << 16);
}

void Fog_SetFogTable(FogData *fog, u8 *src) {
    MI_CpuCopy32(src, fog->fogTable, 32);
    G3X_SetFogTable(fog->fogTable);
}
