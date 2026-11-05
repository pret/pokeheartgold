
#include "unk_020773AC.h"

#include "gf_gfx_planes.h"

void sub_0207741C(void);

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
