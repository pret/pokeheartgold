#include "global.h"
#include "gf_gfx_planes.h"
#include "system.h"

static u32 sEngineBPlanes = 0;
static u32 sEngineAPlanes = 0;

void GfGfx_SetBanks(const GraphicsBanks *banks) {
    GX_ResetBankForBG();
    GX_ResetBankForBGExtPltt();
    GX_ResetBankForSubBG();
    GX_ResetBankForSubBGExtPltt();
    GX_ResetBankForOBJ();
    GX_ResetBankForOBJExtPltt();
    GX_ResetBankForSubOBJ();
    GX_ResetBankForSubOBJExtPltt();
    GX_ResetBankForTex();
    GX_ResetBankForTexPltt();

    GX_SetBankForBG(banks->bg);
    GX_SetBankForBGExtPltt(banks->bgextpltt);
    GX_SetBankForSubBG(banks->subbg);
    GX_SetBankForSubBGExtPltt(banks->subbgextpltt);
    GX_SetBankForOBJ(banks->obj);
    GX_SetBankForOBJExtPltt(banks->objextpltt);
    GX_SetBankForSubOBJ(banks->subobj);
    GX_SetBankForSubOBJExtPltt(banks->subobjextpltt);
    GX_SetBankForTex(banks->tex);
    GX_SetBankForTexPltt(banks->texpltt);
}

void GfGfx_DisableEngineAPlanes(void) {
    (void)sEngineBPlanes;
    sEngineAPlanes = 0;
}

void GfGfx_EngineATogglePlanes(GXPlaneMask planeMask, GFPlaneToggle enable) {
    if (enable == GF_PLANE_TOGGLE_ON) {
        if (sEngineAPlanes & planeMask) {
            return;
        }
    } else {
        if (!(sEngineAPlanes & planeMask)) {
            return;
        }
    }
    sEngineAPlanes ^= planeMask;
    GX_SetVisiblePlane(sEngineAPlanes);
}

void GfGfx_EngineASetPlanes(u32 planes) {
    sEngineAPlanes = planes;
    GX_SetVisiblePlane(sEngineAPlanes);
}

void GfGfx_DisableEngineBPlanes(void) {
    sEngineBPlanes = 0;
}

void GfGfx_EngineBTogglePlanes(GXPlaneMask planeMask, GFPlaneToggle enable) {
    if (enable == GF_PLANE_TOGGLE_ON) {
        if (sEngineBPlanes & planeMask) {
            return;
        }
    } else {
        if (!(sEngineBPlanes & planeMask)) {
            return;
        }
    }
    sEngineBPlanes ^= planeMask;
    GXS_SetVisiblePlane(sEngineBPlanes);
}

void GfGfx_EngineBSetPlanes(u32 planes) {
    sEngineBPlanes = planes;
    GXS_SetVisiblePlane(sEngineBPlanes);
}

void GfGfx_BothDispOn(void) {
    GX_DispOn();
    GXS_DispOn();
}

void GfGfx_SwapDisplay(void) {
    if (gSystem.screensFlipped == 0) {
        GX_SetDispSelect(GX_DISP_SELECT_MAIN_SUB);
    } else {
        GX_SetDispSelect(GX_DISP_SELECT_SUB_MAIN);
    }
}

u32 GfGfx_EngineAGetPlanes(void) {
    return sEngineAPlanes;
}
