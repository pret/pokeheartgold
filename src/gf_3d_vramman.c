#include "global.h"
#include "gf_3d_vramman.h"
#include "gx_layers.h"

#define GF_3D_MEM_BLOCK_PER_TEX          128
#define GF_3D_TEX_SLOT_SIZE              0x20000
#define GF_3D_MEM_BLOCK_PER_PLTT         256
#define GF_3D_PLTT_SLOT_SIZE             0x2000


struct GF3DVramMan *GF_3DVramMan_Create(HeapID heapId, int texMode, int numTex, int plttMode, int numPltt, GF3DVramManInitFunc initializer) {
    struct GF3DVramMan *ret;
    u32 texWorkSz, pltWorkSz;

    ret = AllocFromHeap(heapId, sizeof(struct GF3DVramMan));
    ret->heapId = heapId;

    NNS_G3dInit();
    G3X_InitMtxStack();
    G3_SwapBuffers(GX_SORTMODE_AUTO, GX_BUFFERMODE_W);
    if (texMode == GF_3D_TEXALLOC_LNK) {
        texWorkSz = NNS_GfdGetLnkTexVramManagerWorkSize(numTex * GF_3D_MEM_BLOCK_PER_TEX);
        ret->texWork = AllocFromHeap(ret->heapId, texWorkSz);
        GF_3DVramMan_InitLinkedListTexVramManager(numTex * GF_3D_TEX_SLOT_SIZE, 0, ret->texWork, texWorkSz, TRUE);
    } else {
        GF_3DVramMan_InitFrameTexVramManager(numTex, TRUE);
    }
    if (plttMode == GF_3D_PLTTALLOC_LNK) {
        pltWorkSz = NNS_GfdGetLnkPlttVramManagerWorkSize(numPltt * GF_3D_MEM_BLOCK_PER_PLTT);
        ret->plttWork = AllocFromHeap(ret->heapId, pltWorkSz);
        GF_3DVramMan_InitLinkedListPlttVramManager(numPltt * GF_3D_PLTT_SLOT_SIZE, ret->plttWork, pltWorkSz, TRUE);
    } else {
        GF_3DVramMan_InitFramePlttVramManager(numPltt, TRUE);
    }
    if (initializer != NULL) {
        initializer();
    } else {
        GF_3DVramMan_DefaultInitializer();
    }
    return ret;
}

void GF_3DVramMan_Delete(struct GF3DVramMan *vramMan) {
    FreeToHeap(vramMan->plttWork);
    FreeToHeap(vramMan->texWork);
    FreeToHeap(vramMan);
}

void GF_3DVramMan_DefaultInitializer(void) {
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

void GF_3DVramMan_InitLinkedListTexVramManager(u32 szByte, u32 szByteFor4x4, void *pManagementWork, u32 szByteManagementWork, BOOL useAsDefault) {
    NNS_GfdInitLnkTexVramManager(szByte, szByteFor4x4, pManagementWork, szByteManagementWork, useAsDefault);
}

void GF_3DVramMan_InitLinkedListPlttVramManager(u32 szByte, void *pManagementWork, u32 szByteManagementWork, BOOL useAsDefault) {
    NNS_GfdInitLnkPlttVramManager(szByte, pManagementWork, szByteManagementWork, useAsDefault);
}

void GF_3DVramMan_InitFrameTexVramManager(u16 numSlot, BOOL useAsDefault) {
    NNS_GfdInitFrmTexVramManager(numSlot, useAsDefault);
}

void GF_3DVramMan_InitFramePlttVramManager(u32 numSlot, BOOL useAsDefault) {
    NNS_GfdInitFrmPlttVramManager(numSlot, useAsDefault);
}
