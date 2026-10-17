
#include "application/capsule_menu/defs.h"

void ov57_02237CA8(enum HeapID heapId) {
    Main_SetVBlankIntrCB(NULL, NULL);
    HBlankInterruptDisable();
    GfGfx_DisableEngineAPlanes();
    GfGfx_DisableEngineBPlanes();
    GX_SetVisiblePlane(GX_PLANEMASK_NONE);
    GXS_SetVisiblePlane(GX_PLANEMASK_NONE);
}

void ov57_02237CDC(enum HeapID heapId) {
    Main_SetVBlankIntrCB(NULL, NULL);
    HBlankInterruptDisable();
}

void ov57_02237CEC(BgConfig *bgConfig) {
    GfGfx_DisableEngineAPlanes();

    GraphicsBanks sp10 = {
        GX_VRAM_BG_128_A,
        GX_VRAM_BGEXTPLTT_NONE,
        GX_VRAM_SUB_BG_32_H,
        GX_VRAM_SUB_BGEXTPLTT_NONE,
        GX_VRAM_OBJ_64_E,
        GX_VRAM_OBJEXTPLTT_NONE,
        GX_VRAM_SUB_OBJ_16_I,
        GX_VRAM_SUB_OBJEXTPLTT_NONE,
        GX_VRAM_TEX_01_BC,
        GX_VRAM_TEXPLTT_01_FG,
    };
    GfGfx_SetBanks(&sp10);

    MI_CpuClear32((void *)HW_BG_VRAM, HW_BG_VRAM_SIZE);
    MI_CpuClear32((void *)HW_DB_BG_VRAM, HW_DB_BG_VRAM_SIZE);
    MI_CpuClear32((void *)HW_OBJ_VRAM, HW_OBJ_VRAM_SIZE);
    MI_CpuClear32((void *)HW_DB_OBJ_VRAM, HW_DB_OBJ_VRAM_SIZE);

    GraphicsModes sp00 = {
        GX_DISPMODE_GRAPHICS,
        GX_BGMODE_0,
        GX_BGMODE_0,
        GX_BG0_AS_3D,
    };
    SetBothScreensModesAndDisable(&sp00);

    BgTemplate spA8[3] = {
        {
         .x = 0,
         .y = 0,
         .bufferSize = 0x800,
         .baseTile = 0,
         .size = GF_BG_SCR_SIZE_256x256,
         .colorMode = GX_BG_COLORMODE_16,
         .screenBase = GX_BG_SCRBASE_0x0000,
         .charBase = GX_BG_CHARBASE_0x04000,
         .bgExtPltt = GX_BG_EXTPLTT_01,
         .priority = 0,
         .areaOver = 0,
         .mosaic = FALSE,
         },
        {
         .x = 0,
         .y = 0,
         .bufferSize = 0x2000,
         .baseTile = 0,
         .size = GF_BG_SCR_SIZE_256x256,
         .colorMode = GX_BG_COLORMODE_16,
         .screenBase = GX_BG_SCRBASE_0x1000,
         .charBase = GX_BG_CHARBASE_0x0c000,
         .bgExtPltt = GX_BG_EXTPLTT_01,
         .priority = 2,
         .areaOver = 0,
         .mosaic = FALSE,
         },
        {
         .x = 0,
         .y = 0,
         .bufferSize = 0x1000,
         .baseTile = 0,
         .size = GF_BG_SCR_SIZE_256x256,
         .colorMode = GX_BG_COLORMODE_16,
         .screenBase = GX_BG_SCRBASE_0x3000,
         .charBase = GX_BG_CHARBASE_0x10000,
         .bgExtPltt = GX_BG_EXTPLTT_01,
         .priority = 3,
         .areaOver = 0,
         .mosaic = FALSE,
         },
    };
    InitBgFromTemplate(bgConfig, GF_BG_LYR_MAIN_1, &spA8[0], GF_BG_TYPE_TEXT);
    InitBgFromTemplate(bgConfig, GF_BG_LYR_MAIN_2, &spA8[1], GF_BG_TYPE_TEXT);
    InitBgFromTemplate(bgConfig, GF_BG_LYR_MAIN_3, &spA8[2], GF_BG_TYPE_TEXT);
    BgClearTilemapBufferAndCommit(bgConfig, GF_BG_LYR_MAIN_1);
    BgClearTilemapBufferAndCommit(bgConfig, GF_BG_LYR_MAIN_2);
    BgClearTilemapBufferAndCommit(bgConfig, GF_BG_LYR_MAIN_3);
    G2_SetBG0Priority(1);
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG0, GF_PLANE_TOGGLE_ON);

    BgTemplate sp38[4] = {
        {
         .x = 0,
         .y = 0,
         .bufferSize = 0x800,
         .baseTile = 0,
         .size = GF_BG_SCR_SIZE_256x256,
         .colorMode = GX_BG_COLORMODE_16,
         .screenBase = GX_BG_SCRBASE_0x6800,
         .charBase = GX_BG_CHARBASE_0x00000,
         .bgExtPltt = GX_BG_EXTPLTT_01,
         .priority = 0,
         .areaOver = 0,
         .mosaic = FALSE,
         },
        {
         .x = 0,
         .y = 0,
         .bufferSize = 0x800,
         .baseTile = 0,
         .size = GF_BG_SCR_SIZE_256x256,
         .colorMode = GX_BG_COLORMODE_16,
         .screenBase = GX_BG_SCRBASE_0x7000,
         .charBase = GX_BG_CHARBASE_0x04000,
         .bgExtPltt = GX_BG_EXTPLTT_01,
         .priority = 2,
         .areaOver = 0,
         .mosaic = FALSE,
         },
        {
         .x = 0,
         .y = 0,
         .bufferSize = 0x800,
         .baseTile = 0,
         .size = GF_BG_SCR_SIZE_256x256,
         .colorMode = GX_BG_COLORMODE_16,
         .screenBase = GX_BG_SCRBASE_0x6000,
         .charBase = GX_BG_CHARBASE_0x00000,
         .bgExtPltt = GX_BG_EXTPLTT_01,
         .priority = 1,
         .areaOver = 0,
         .mosaic = FALSE,
         },
        {
         .x = 0,
         .y = 0,
         .bufferSize = 0x800,
         .baseTile = 0,
         .size = GF_BG_SCR_SIZE_256x256,
         .colorMode = GX_BG_COLORMODE_16,
         .screenBase = GX_BG_SCRBASE_0x7800,
         .charBase = GX_BG_CHARBASE_0x04000,
         .bgExtPltt = GX_BG_EXTPLTT_01,
         .priority = 3,
         .areaOver = 0,
         .mosaic = FALSE,
         },
    };
    InitBgFromTemplate(bgConfig, GF_BG_LYR_SUB_0, &sp38[0], GF_BG_TYPE_TEXT);
    InitBgFromTemplate(bgConfig, GF_BG_LYR_SUB_1, &sp38[1], GF_BG_TYPE_TEXT);
    InitBgFromTemplate(bgConfig, GF_BG_LYR_SUB_2, &sp38[2], GF_BG_TYPE_TEXT);
    InitBgFromTemplate(bgConfig, GF_BG_LYR_SUB_3, &sp38[3], GF_BG_TYPE_TEXT);
    BgClearTilemapBufferAndCommit(bgConfig, GF_BG_LYR_SUB_0);
    BgClearTilemapBufferAndCommit(bgConfig, GF_BG_LYR_SUB_1);
    BgClearTilemapBufferAndCommit(bgConfig, GF_BG_LYR_SUB_2);
    BgClearTilemapBufferAndCommit(bgConfig, GF_BG_LYR_SUB_3);
    GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG2, GF_PLANE_TOGGLE_OFF);
}
