#include "gx_layers.h"
#include "system.h"

u32 _021D21FC = 0;
u32 _021D2200 = 0;

void GX_SetBanks(const GF_GXBanksConfig *banks) {
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
    (void)_021D21FC;
    _021D2200 = 0;
}

void GX_EngineAToggleLayers(u32 layer_mask, GX_LayerToggle enable) {
    if (enable == GX_LAYER_TOGGLE_ON) {
        if (_021D2200 & layer_mask) {
            return;
        }
    } else {
        if (!(_021D2200 & layer_mask)) {
            return;
        }
    }
    _021D2200 ^= layer_mask;
    GX_SetVisiblePlane(_021D2200);
}

void GX_EngineASetLayers(u32 layers) {
    _021D2200 = layers;
    GX_SetVisiblePlane(_021D2200);
}

void GX_DisableEngineBLayers(void) {
    _021D21FC = 0;
}

void GX_EngineBToggleLayers(u32 layer_mask, GX_LayerToggle enable) {
    if (enable == GX_LAYER_TOGGLE_ON) {
        if (_021D21FC & layer_mask) {
            return;
        }
    } else {
        if (!(_021D21FC & layer_mask)) {
            return;
        }
    }
    _021D21FC ^= layer_mask;
    GXS_SetVisiblePlane(_021D21FC);
}

void GX_EngineBSetLayers(u32 layers) {
    _021D21FC = layers;
    GXS_SetVisiblePlane(_021D21FC);
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
    return _021D2200;
}
