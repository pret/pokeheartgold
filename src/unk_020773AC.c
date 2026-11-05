
#include "unk_020773AC.h"

#include "gf_gfx_planes.h"
#include "unk_02014DA0.h"
#include "unk_02026E30.h"

void sub_0207741C(void);
u32 sub_02077504(u32 size, BOOL is4x4comp);
u32 sub_02077520(u32 size, BOOL is4pltt);
SPLEmitter *sub_0207753C(enum HeapID heapId);
SPLEmitter *sub_02077584(enum HeapID heapId, NarcId narcId, int fileId);
void sub_020775AC(SPLEmitter *emitter);
void sub_020775C4(SPLEmitter *emitter);

void sub_020773AC(void) {
    GfGfx_DisableEngineAPlanes();
    GfGfx_DisableEngineBPlanes();
    GX_SetVisiblePlane(GX_PLANEMASK_NONE);
    GXS_SetVisiblePlane(GX_PLANEMASK_NONE);
}

void sub_020773D4(void) {
    G2_SetBlendAlpha(0, 14, 11, 7);
    G2S_SetBlendAlpha(0, 14, 7, 8);
}

GF3DVramMan *sub_02077400(enum HeapID heapId) {
    return GF_3DVramMan_Create(heapId, 0, 2, 0, 2, sub_0207741C);
}

void sub_0207741C(void) {
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG0, GF_PLANE_TOGGLE_ON);
    G2_SetBG0Priority(1);
    G3X_SetShading(GX_SHADING_TOON);
    G3X_AntiAlias(TRUE);
    G3X_AlphaTest(FALSE, 0);
    G3X_AlphaBlend(TRUE);
    G3X_EdgeMarking(FALSE);
    G3X_SetFog(FALSE, GX_FOGBLEND_COLOR_ALPHA, GX_FOGSLOPE_0x8000, 0);
    G3X_SetClearColor(RGB_BLACK, 0, 0x7FFF, 0x3F, FALSE);
    G3_ViewPort(0, 0, 255, 191);
}

void sub_020774A0(void) {
    NNSGfdTexKey texKey = NNS_GfdAllocTexVram(0x8000, FALSE, 0);
    NNSGfdPlttKey plttKey = NNS_GfdAllocPlttVram(0xA0, 0, 0);

    GF_ASSERT(texKey != 0);
    GF_ASSERT(plttKey != 0);

    sub_02014DA0();
}

void sub_020774E0(void) {
    Thunk_G3X_Reset();
    if (sub_0201543C() > 0) {
        Thunk_G3X_Reset();
        NNS_G2dSetupSoftwareSpriteCamera();
    }
    sub_02015460();
    RequestSwap3DBuffers(GX_SORTMODE_MANUAL, GX_BUFFERMODE_Z);
}

u32 sub_02077504(u32 size, BOOL is4x4comp) {
    NNSGfdTexKey texKey = NNS_GfdAllocTexVram(size, is4x4comp, 0);
    sub_02015354(texKey);
    return ((u16)texKey) * 8;
}

u32 sub_02077520(u32 size, BOOL is4pltt) {
    NNSGfdPlttKey plttKey = NNS_GfdAllocPlttVram(size, is4pltt, 0);
    sub_02015394(plttKey);
    return ((u16)plttKey) * 8;
}

SPLEmitter *sub_0207753C(enum HeapID heapId) {
    SPLEmitter *emitter = sub_02014DB4(sub_02077504, sub_02077520, Heap_Alloc(heapId, 0x4800), 0x4800, TRUE, heapId);
    Camera *camera = sub_02015524(emitter);
    if (camera != NULL) {
        Camera_SetPerspectiveClippingPlane(FX32_CONST(1), FX32_CONST(900), camera);
    }
    return emitter;
}

SPLEmitter *sub_02077584(enum HeapID heapId, NarcId narcId, int fileId) {
    SPLEmitter *emitter = sub_0207753C(heapId);
    sub_0201526C(emitter, sub_02015264(narcId, fileId, heapId), 0xA, TRUE);
    return emitter;
}

void sub_020775AC(SPLEmitter *emitter) {
    void *r4 = sub_020154D0(emitter);
    sub_02014EBC(emitter);
    Heap_Free(r4);
}

void sub_020775C4(SPLEmitter *emitter) {
    VecFx32 sp0 = { 0 };

    VEC_Set(&sp0, 0, FX32_CONST(0.3359375), 0);

    SPL_SetEmitterPosition(emitter, &sp0);
}

UnkStruct_02077604 *sub_02077604(const UnkSplTemplate_02077604 *tmplate) {
    UnkStruct_02077604 *ret = Heap_Alloc(tmplate->heapId, sizeof(UnkStruct_02077604));
    GF_ASSERT(ret != NULL);
    ret->tmplate = *tmplate;
    ret->emitter = sub_02077584(ret->tmplate.heapId, NARC_a_1_1_9, ret->tmplate.fileId);
    sub_02015528(ret->emitter, 1);
    return ret;
}

void sub_02077634(UnkStruct_02077604 *a0, int res_no) {
    sub_02015494(a0->emitter, res_no, sub_020775C4, a0);
    sub_02015528(a0->emitter, 1);
}

BOOL sub_02077650(UnkStruct_02077604 *a0) {
    return sub_020154B0(a0->emitter) != FALSE;
}

void sub_02077664(UnkStruct_02077604 *a0) {
    sub_020775AC(a0->emitter);
    Heap_Free(a0);
}
