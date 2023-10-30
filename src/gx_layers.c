#include "global.h"
#include "gx_layers.h"
#include "system.h"

static u32 sEngineBLayers = 0;
static u32 sEngineALayers = 0;

void GX_SetBanks(const GraphicsBanks *banks) {
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

void GX_DisableEngineALayers(void) {
    (void)sEngineBLayers;
    sEngineALayers = 0;
}

void GX_EngineAToggleLayers(GXPlaneMask planeMask, GXLayerToggle enable) {
    if (enable == GX_LAYER_TOGGLE_ON) {
        if (sEngineALayers & planeMask) {
            return;
        }
    } else {
        if (!(sEngineALayers & planeMask)) {
            return;
        }
    }
    sEngineALayers ^= planeMask;
    GX_SetVisiblePlane(sEngineALayers);
}

void GX_EngineASetLayers(u32 layers) {
    sEngineALayers = layers;
    GX_SetVisiblePlane(sEngineALayers);
}

void GX_DisableEngineBLayers(void) {
    sEngineBLayers = 0;
}

void GX_EngineBToggleLayers(GXPlaneMask planeMask, GXLayerToggle enable) {
    if (enable == GX_LAYER_TOGGLE_ON) {
        if (sEngineBLayers & planeMask) {
            return;
        }
    } else {
        if (!(sEngineBLayers & planeMask)) {
            return;
        }
    }
    sEngineBLayers ^= planeMask;
    GXS_SetVisiblePlane(sEngineBLayers);
}

void GX_EngineBSetLayers(u32 layers) {
    sEngineBLayers = layers;
    GXS_SetVisiblePlane(sEngineBLayers);
}

void GX_BothDispOn(void) {
    GX_DispOn();
    GXS_DispOn();
}

void GX_SwapDisplay(void) {
    if (gSystem.screensFlipped == 0) {
        GX_SetDispSelect(GX_DISP_SELECT_MAIN_SUB);
    } else {
        GX_SetDispSelect(GX_DISP_SELECT_SUB_MAIN);
    }
}

u32 GX_EngineAGetLayers(void) {
    return sEngineALayers;
}
