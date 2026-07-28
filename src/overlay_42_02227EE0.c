#include "overlay_42.h"
#include "sprite_transfer.h"

const UnkStruct_ov42_02227FA4 ov42_02229E04 = { 0xFFFFFFFF };

void ov42_02227D48(UnkStruct_ov42_02227114 *arg0, s32 arg1) {
    arg0->unk10 = arg1;
    Sprite_TryChangeAnimSeq(arg0->unk4, arg1);
}

void ov42_02227D54(UnkStruct_ov42_02227114 *arg0, s32 arg1) {
    arg0->unk10 = arg1;
    Sprite_TryChangeAnimSeq(arg0->unk4, 4);
}

void ov42_02227D64(UnkStruct_ov42_02227114 *arg0, s32 arg1) {
    arg0->unk10 = arg1;
    Sprite_TryChangeAnimSeq(arg0->unk4, arg1 + 5);
}

void ov42_02227D74(UnkStruct_ov42_02227114 *arg0, s32 arg1) {
    Sprite_TryChangeAnimSeq(arg0->unk4, arg0->unk10 + 5);
    arg0->unk10 = arg1;
}

void ov42_02227D88(UnkStruct_ov42_02227114 *arg0, s32 arg1) {
    arg0->unk10 = arg1;
    Sprite_TryChangeAnimSeq(arg0->unk4, arg1 + 9);
}

void ov42_02227D98(UnkStruct_ov42_02227114 *arg0, s32 arg1) {
    arg0->unk10 = arg1;
    Sprite_TryChangeAnimSeq(arg0->unk4, arg1 + 5);
}

void ov42_02227DA8(UnkStruct_ov42_02227114 *arg0, s32 arg1) {
    arg0->unk10 = arg1;
    Sprite_TryChangeAnimSeq(arg0->unk4, arg1 + 5);
}

void ov42_02227DB8(UnkStruct_ov42_02227114 *arg0, s32 arg1) {
    arg0->unk10 = arg1;
    Sprite_TryChangeAnimSeq(arg0->unk4, arg1 + 5);
}

void ov42_02227DC8(UnkStruct_ov42_02227114 *arg0, s32 arg1) {
    arg0->unk10 = arg1;
    Sprite_TryChangeAnimSeq(arg0->unk4, arg1 + 5);
}

void ov42_02227DD8(UnkStruct_ov42_02227114 *arg0) {
    Sprite_UpdateAnim(arg0->unk4, 8192);
}

void ov42_02227DE8(UnkStruct_ov42_02227114 *arg0) {
    Sprite_UpdateAnim(arg0->unk4, 8192);
}

void ov42_02227DF8(UnkStruct_ov42_02227114 *arg0) {
    if (arg0->unk14 == 0) {
        Sprite_SetAnimationFrame(arg0->unk4, 1);
    } else {
        Sprite_SetAnimCtrlSeq(arg0->unk4, arg0->unk10 + 5);
    }
}

void ov42_02227E18(UnkStruct_ov42_02227114 *arg0) {
    Sprite_UpdateAnim(arg0->unk4, 8192);
}

void ov42_02227E28(UnkStruct_ov42_02227114 *arg0) {
    Sprite_UpdateAnim(arg0->unk4, 4096);
}

void ov42_02227E38(UnkStruct_ov42_02227114 *arg0) {
    Sprite_UpdateAnim(arg0->unk4, 4096);
}

void ov42_02227E48(UnkStruct_ov42_02227114 *arg0) {
    Sprite_UpdateAnim(arg0->unk4, 32768);
}

void ov42_02227E58(UnkStruct_ov42_02227114 *arg0) {
    Sprite_UpdateAnim(arg0->unk4, 24576);
}

s32 ov42_02227E68(UnkStruct_ov42_02227114 *arg0) {
    if (arg0->unk4 == NULL) {
        return 1;
    }
    return 0;
}

void ov42_02227E78(UnkStruct_ov42_02227060 *arg0, SpriteResource *arg1, s32 arg2) {
    NNSG2dPaletteData *sp4 = GF2DGfxResObj_GetPlttDataPtr(arg1);
    s32 temp_r7 = SpriteTransfer_GetPlttOffset(arg1, NNS_G2D_VRAM_TYPE_2DMAIN);
    s32 temp_r6 = SpriteTransfer_GetPlttOffset(arg1, NNS_G2D_VRAM_TYPE_2DSUB);
    if (temp_r7 != -1) {
        PaletteData_LoadPalette(arg0->unk4, sp4->pRawData, PLTTBUF_MAIN_OBJ, temp_r7 * 16, arg2 << 5);
    }
    if (temp_r6 != -1) {
        PaletteData_LoadPalette(arg0->unk4, sp4->pRawData, PLTTBUF_SUB_OBJ, temp_r6 * 16, arg2 << 5);
    }
}

void *ov42_02227EE0(u16 arg0, u16 arg1, enum HeapID arg2) {
    UnkStruct_ov42_02227F68 *temp_r0 = Heap_Alloc(arg2, sizeof(UnkStruct_ov42_02227F68));
    GF_ASSERT(temp_r0);
    temp_r0->unk0 = arg0;
    temp_r0->unk2 = arg1;
    void *temp_r0_2 = Heap_Alloc(arg2, temp_r0->unk0 * temp_r0->unk2 * 4);
    temp_r0->unk4 = temp_r0_2;
    GF_ASSERT(temp_r0_2);
    memset(temp_r0->unk4, 0, temp_r0->unk0 * temp_r0->unk2 * 4);
    return temp_r0;
}

void ov42_02227F28(UnkStruct_ov42_02227F68 *arg0) {
    GF_ASSERT(arg0);
    Heap_Free(arg0->unk4);
    Heap_Free(arg0);
}

u16 ov42_02227F40(UnkStruct_ov42_02227F68 *arg0) {
    return arg0->unk0;
}

u16 ov42_02227F44(UnkStruct_ov42_02227F68 *arg0) {
    return arg0->unk2;
}

void ov42_02227F48(UnkStruct_ov42_02227F68 *arg0, void *arg1) {
    GF_ASSERT(arg0);
    memcpy(arg0->unk4, arg1, arg0->unk0 * arg0->unk2 * 4);
}

UnkStruct_ov42_02227FA4 ov42_02227F68(UnkStruct_ov42_02227F68 *arg0, u32 arg1, u32 arg2) {
    UnkStruct_ov42_02227FA4 sp0 = ov42_02229E04;
    GF_ASSERT(arg0);
    if ((arg0->unk0 > arg1) && (arg0->unk2 > arg2)) {
        sp0.unk0 = arg0->unk4[arg0->unk0 * arg2 + arg1];
    }
    return sp0;
}
