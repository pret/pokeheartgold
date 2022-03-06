#include "unk_02026EB4.h"
#include "gx_layers.h"

static void sub_02026F6C(void);
static void sub_02026FE8(u32 szByte, u32 szByteFor4x4, void *pManagementWork, u32 szByteManagementWork, BOOL useAsDefault);
static void sub_02026FF8(u32 szByte, void *pManagementWork, u32 szByteManagementWork, BOOL useAsDefault);
static void sub_02027000(u16 numSlot, BOOL useAsDefault);
static void sub_02027008(u32 numSlot, BOOL useAsDefault);

struct Unk3Dstruct_02026EB4 *sub_02026EB4(HeapID heapId, int r7, int r5, int sp4, int sp20, void (*sp24)(void)) {
    struct Unk3Dstruct_02026EB4 *ret;
    u32 texWorkSz, pltWorkSz;

    ret = AllocFromHeap(heapId, sizeof(struct Unk3Dstruct_02026EB4));
    ret->heapId = heapId;

    NNS_G3dInit();
    G3X_InitMtxStack();
    G3_SwapBuffers(GX_SORTMODE_AUTO, GX_BUFFERMODE_W);
    if (!r7) {
        texWorkSz = NNS_GfdGetLnkTexVramManagerWorkSize(r5 << 7);
        ret->texWork = AllocFromHeap(ret->heapId, texWorkSz);
        sub_02026FE8(r5 << 17, 0, ret->texWork, texWorkSz, TRUE);
    } else {
        sub_02027000(r5, TRUE);
    }
    if (!sp4) {
        pltWorkSz = NNS_GfdGetLnkPlttVramManagerWorkSize(sp20 << 8);
        ret->plttWork = AllocFromHeap(ret->heapId, pltWorkSz);
        sub_02026FF8(sp20 << 13, ret->plttWork, pltWorkSz, TRUE);
    } else {
        sub_02027008(sp20, TRUE);
    }
    if (sp24 != NULL) {
        sp24();
    } else {
        sub_02026F6C();
    }
    return ret;
}

void sub_02026F54(struct Unk3Dstruct_02026EB4 *unk) {
    FreeToHeap(unk->plttWork);
    FreeToHeap(unk->texWork);
    FreeToHeap(unk);
}

static void sub_02026F6C(void) {
    GX_EngineAToggleLayers(GF_BG_LYR_MAIN_0_F, GX_LAYER_TOGGLE_ON);
    G2_SetBG0Priority(0);
    G3X_SetShading(GX_SHADING_TOON);
    G3X_AntiAlias(FALSE);
    G3X_AlphaTest(FALSE, 0);
    G3X_AlphaBlend(FALSE);
    G3X_EdgeMarking(FALSE);
    G3X_SetFog(FALSE, GX_FOGBLEND_COLOR_ALPHA, GX_FOGSLOPE_0x8000, 0 );
    G3X_SetClearColor(RGB_BLACK, 0, 0x7fff, 63, FALSE);
    G3_ViewPort(0, 0, 255, 191);
}

static void sub_02026FE8(u32 szByte, u32 szByteFor4x4, void *pManagementWork, u32 szByteManagementWork, BOOL useAsDefault) {
    NNS_GfdInitLnkTexVramManager(szByte, szByteFor4x4, pManagementWork, szByteManagementWork, useAsDefault);
}

static void sub_02026FF8(u32 szByte, void *pManagementWork, u32 szByteManagementWork, BOOL useAsDefault) {
    NNS_GfdInitLnkPlttVramManager(szByte, pManagementWork, szByteManagementWork, useAsDefault);
}

static void sub_02027000(u16 numSlot, BOOL useAsDefault) {
    NNS_GfdInitFrmTexVramManager(numSlot, useAsDefault);
}

static void sub_02027008(u32 numSlot, BOOL useAsDefault) {
    NNS_GfdInitFrmPlttVramManager(numSlot, useAsDefault);
}
