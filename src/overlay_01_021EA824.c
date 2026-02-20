#include "overlay_01_021EA824.h"

#include "global.h"

void* ov01_021EA824() {
    void* dst = Heap_Alloc(HEAP_ID_FIELD1, 56);
    MIi_CpuClear32(0, dst, 56);
    return dst;
}

void ov01_021EA840(s32* arg0) {
    Heap_FreeExplicit(HEAP_ID_FIELD1, (void*)*arg0);
    *arg0 = 0;
}

BOOL ov01_021EA854(UnkStruct_Ov01_021EA824* arg0) {
    return arg0->enable;
}

GXFogSlope ov01_021EA858(UnkStruct_Ov01_021EA824* arg0) {
    return arg0->fogSlope;
}

int ov01_021EA85C(UnkStruct_Ov01_021EA824* arg0) {
    return arg0->fogOffset;
}

u16 ov01_021EA860(UnkStruct_Ov01_021EA824 *arg0) {
    return arg0->unk10;
}

void ov01_021EA864(UnkStruct_Ov01_021EA824* arg0, s32 arg1, BOOL enable, GXFogBlend fogMode, GXFogSlope fogSlope, int fogOffset) {
    if (1 & arg1) {
        arg0->enable = enable;
    }
    if (2 & arg1) {
        arg0->fogMode = fogMode;
    }
    if (4 & arg1) {
        arg0->fogSlope = fogSlope;
    }
    if (8 & arg1) {
        arg0->fogOffset = fogOffset;
    }
    G3X_SetFog(arg0->enable, arg0->fogMode, arg0->fogSlope, arg0->fogOffset);
}

void ov01_021EA89C(UnkStruct_Ov01_021EA824* arg0, u32 arg1, u16 arg2, u32 arg3) {
    if (16 & arg1) {
        arg0->unk10 = arg2;
    }
    if (arg1 & 32) {
        arg0->unk14 = arg3;
    }
    *(s32* )67109720 = arg0->unk10 | (arg0->unk14 << 16);
}

void ov01_021EA8C4(UnkStruct_Ov01_021EA824 *arg0, const u32 *src) {
    MIi_CpuCopy32(src, arg0->fogTable, 32);
    G3X_SetFogTable(arg0->fogTable);
}
