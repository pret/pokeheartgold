#ifndef POKEHEARTGOLD_GF_GFX_PLANES_H
#define POKEHEARTGOLD_GF_GFX_PLANES_H

#include "system.h"

typedef enum {
    GF_PLANE_TOGGLE_OFF,
    GF_PLANE_TOGGLE_ON,
} GFPlaneToggle;

typedef enum GFBgLayer {
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
} GFBgLayer;

typedef struct GraphicsBanks {
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
} GraphicsBanks;

void GfGfx_SetBanks(const GraphicsBanks *banks);
void GfGfx_DisableEngineAPlanes(void);
void GfGfx_EngineATogglePlanes(u8 planeMask, u8 enable);
void GfGfx_EngineASetPlanes(u32 planes);
void GfGfx_DisableEngineBPlanes(void);
void GfGfx_EngineBTogglePlanes(u8 planeMask, u8 enable);
void GfGfx_EngineBSetPlanes(u32 planes);
void GfGfx_BothDispOn(void);
void GfGfx_SwapDisplay(void);
u32 GfGfx_EngineAGetPlanes(void);

static inline void GfGfx_SetMainDisplay(PMLCDTarget screen) {
    gSystem.screensFlipped = (BOOL)screen;
    GfGfx_SwapDisplay();
}

#endif // POKEHEARTGOLD_GF_GFX_PLANES_H
