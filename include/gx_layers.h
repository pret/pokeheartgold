#ifndef POKEHEARTGOLD_GX_LAYERS_H
#define POKEHEARTGOLD_GX_LAYERS_H

typedef enum {
    GX_LAYER_TOGGLE_OFF,
    GX_LAYER_TOGGLE_ON,
} GX_LayerToggle;

enum GFBgLayer {
    GF_BG_LYR_MAIN_0 = 0,
    GF_BG_LYR_MAIN_1,
    GF_BG_LYR_MAIN_2,
    GF_BG_LYR_MAIN_3,
    GF_BG_LYR_SUB_0,
    GF_BG_LYR_SUB_1,
    GF_BG_LYR_SUB_2,
    GF_BG_LYR_SUB_3,
    GF_BG_LYR_MAIN_CNT = 4,
    GF_BG_LYR_SUB_CNT = 4,
    GF_BG_LYR_MAIN_FIRST = GF_BG_LYR_MAIN_0,
    GF_BG_LYR_SUB_FIRST = GF_BG_LYR_SUB_0,
    GF_BG_LYR_MAX = 8,

    GF_BG_LYR_MAIN_0_F = 1 << (GF_BG_LYR_MAIN_0 - GF_BG_LYR_MAIN_FIRST),
    GF_BG_LYR_MAIN_1_F = 1 << (GF_BG_LYR_MAIN_1 - GF_BG_LYR_MAIN_FIRST),
    GF_BG_LYR_MAIN_2_F = 1 << (GF_BG_LYR_MAIN_2 - GF_BG_LYR_MAIN_FIRST),
    GF_BG_LYR_MAIN_3_F = 1 << (GF_BG_LYR_MAIN_3 - GF_BG_LYR_MAIN_FIRST),
    GF_BG_LYR_SUB_0_F = 1 << (GF_BG_LYR_SUB_0 - GF_BG_LYR_SUB_FIRST),
    GF_BG_LYR_SUB_1_F = 1 << (GF_BG_LYR_SUB_1 - GF_BG_LYR_SUB_FIRST),
    GF_BG_LYR_SUB_2_F = 1 << (GF_BG_LYR_SUB_2 - GF_BG_LYR_SUB_FIRST),
    GF_BG_LYR_SUB_3_F = 1 << (GF_BG_LYR_SUB_3 - GF_BG_LYR_SUB_FIRST),

    GF_BG_LYR_UNALLOC = 0xFF,
};

typedef struct GXBanksConfig {
    GXVRamBG bg;
    GXVRamBGExtPltt bgextpltt;
    GXVRamSubBG subbg;
    GXVRamSubBGExtPltt subbgextpltt;
    GXVRamOBJ obj;
    GXVRamOBJExtPltt objextpltt;
    GXVRamSubOBJ subobj;
    GXVRamSubOBJExtPltt subobjextpltt;
    GXVRamTex tex;
    GXVRamTexPltt texpltt;
} GF_GXBanksConfig;

void GX_DisableEngineALayers(void);
void GX_DisableEngineBLayers(void);

void GX_EngineAToggleLayers(u32 layer_mask, GX_LayerToggle enable);
void GX_EngineBToggleLayers(u32 layer_mask, GX_LayerToggle enable);

#endif //POKEHEARTGOLD_GX_LAYERS_H
