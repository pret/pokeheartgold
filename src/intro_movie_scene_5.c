#include "demo/opening/gs_opening.naix"
#include "gf_gfx_loader.h"
#include "global.h"
#include "intro_movie_internal.h"
#include "system.h"
#include "unk_0200B150.h"
#include "unk_0200FA24.h"

void IntroMovie_Scene5_VBlankCB(void *pVoid);
void IntroMovie_Scene5_Init(IntroMovieOvyData *data, IntroMovieScene5Data *sceneData);
BOOL IntroMovie_Scene5_Main(IntroMovieOvyData *data, IntroMovieScene5Data *sceneData, int totalFrames);
void IntroMovie_Scene5_Exit(IntroMovieOvyData *data, IntroMovieScene5Data *sceneData);
void IntroMovie_Scene5_InitBgs(IntroMovieOvyData *data);
void InroMovie_Scene5_LoadBgGfx(BgConfig *bgConfig, IntroMovieScene5Data *sceneData);
void IntroMovie_Scene5_EnableBgLayers(IntroMovieScene5Data *sceneData, BgConfig *bgConfig);
void IntroMovie_Scene5_LoadSpriteGfx(IntroMovieOvyData *data, IntroMovieScene5Data *sceneData);
void IntroMovie_Scene5_DestroySprites(IntroMovieOvyData *data, IntroMovieScene5Data *sceneData);
void IntroMovie_Scene5_CreateSprites(IntroMovieOvyData *data, IntroMovieScene5Data *sceneData);

BOOL IntroMovie_Scene5(IntroMovieOvyData *data, void *pVoid) {
    IntroMovieScene5Data *sceneData = (IntroMovieScene5Data *)pVoid;

    if (IntroMovie_GetIntroSkippedFlag(data)) {
        sceneData->state = 2;
    }

    switch (sceneData->state) {
    case 0:
        IntroMovie_Scene5_Init(data, sceneData);
        ++sceneData->state;
        break;
    case 1:
        if (IntroMovie_Scene5_Main(data, sceneData, IntroMovie_GetTotalFrameCount(data))) {
            ++sceneData->state;
        }
        break;
    case 2:
        IntroMovie_Scene5_Exit(data, sceneData);
        return TRUE;
    }

    return FALSE;
}

void IntroMovie_Scene5_VBlankCB(void *pVoid) {
    IntroMovieOvyData *data = (IntroMovieOvyData *)pVoid;

    DoScheduledBgGpuUpdates(IntroMovie_GetBgConfig(data));
    OamManager_ApplyAndResetBuffers();
}

void IntroMovie_Scene5_Init(IntroMovieOvyData *data, IntroMovieScene5Data *sceneData) {
    BgConfig *bgConfig = IntroMovie_GetBgConfig(data);
    gSystem.screensFlipped = TRUE;
    GfGfx_SwapDisplay();
    sub_0200FBF4(PM_LCD_TOP, RGB_BLACK);
    sub_0200FBF4(PM_LCD_BOTTOM, RGB_BLACK);
    IntroMovie_Scene5_InitBgs(data);
    IntroMovie_InitBgAnimGxState(data);
    Main_SetVBlankIntrCB(IntroMovie_Scene5_VBlankCB, data);
    InroMovie_Scene5_LoadBgGfx(bgConfig, sceneData);
    IntroMovie_RendererSetSurfaceCoords(data, 0, 0, 0, 256);
    IntroMovie_Scene5_LoadSpriteGfx(data, sceneData);
    IntroMovie_Scene5_CreateSprites(data, sceneData);
    IntroMovie_Scene5_EnableBgLayers(sceneData, bgConfig);
    sceneData->needFreeGfx = TRUE;
}

#ifdef HEARTGOLD
#define BG_SCROLL_SPEED -0x40
#else
#define BG_SCROLL_SPEED  0x40
#endif

BOOL IntroMovie_Scene5_Main(IntroMovieOvyData *data, IntroMovieScene5Data *sceneData, int totalFrames) {
    BgConfig *bgConfig = IntroMovie_GetBgConfig(data);
    IntroMovieBgLinearAnims *animCnt = IntroMovie_GetBgLinearAnimsController(data);
    u8 stepTimer = IntroMovie_GetSceneStepTimer(data);
    switch (IntroMovie_GetSceneStep(data)) {
    case 0:
        BeginNormalPaletteFade(1, 9, 5, RGB_BLACK, 18, 1, HEAP_ID_INTRO_MOVIE);
        IntroMovie_AdvanceSceneStep(data);
        break;
    case 1:
        if (IsPaletteFadeFinished()) {
            IntroMovie_AdvanceSceneStep(data);
        }
        break;
    case 2:
        IntroMovie_StartBgScroll_VBlank(bgConfig, animCnt->scroll, GF_BG_LYR_MAIN_1, 0, -0x40, 73);
        IntroMovie_StartBgScroll_VBlank(bgConfig, animCnt->scroll, GF_BG_LYR_MAIN_2, 0, BG_SCROLL_SPEED, 73);
        IntroMovie_StartBgScroll_VBlank(bgConfig, animCnt->scroll, GF_BG_LYR_SUB_1, 0, BG_SCROLL_SPEED, 73);
        IntroMovie_StartBgScroll_VBlank(bgConfig, animCnt->scroll, GF_BG_LYR_SUB_2, 0, BG_SCROLL_SPEED, 73);
        IntroMovie_AdvanceSceneStep(data);
        break;
    case 3:
        if (stepTimer >= 20) {
            BeginNormalPaletteFade(0, 0, 0, RGB_WHITE, 50, 1, HEAP_ID_INTRO_MOVIE);
            IntroMovie_AdvanceSceneStep(data);
        }
        break;
    case 4:
        if (IsPaletteFadeFinished()) {
            return TRUE;
        }
        break;
    }

    return FALSE;
}

#undef BG_SCROLL_SPEED

void IntroMovie_Scene5_Exit(IntroMovieOvyData *data, IntroMovieScene5Data *sceneData) {
    BgConfig *bgConfig = IntroMovie_GetBgConfig(data);
    Main_SetVBlankIntrCB(NULL, NULL);
    if (sceneData->needFreeGfx) {
        IntroMovie_Scene5_DestroySprites(data, sceneData);
        FreeBgTilemapBuffer(bgConfig, GF_BG_LYR_MAIN_1);
        FreeBgTilemapBuffer(bgConfig, GF_BG_LYR_MAIN_2);
        FreeBgTilemapBuffer(bgConfig, GF_BG_LYR_SUB_1);
        FreeBgTilemapBuffer(bgConfig, GF_BG_LYR_SUB_2);
        sceneData->needFreeGfx = FALSE;
    }
}

void IntroMovie_Scene5_InitBgs(IntroMovieOvyData *data) {
    BgConfig *bgConfig = IntroMovie_GetBgConfig(data);

    {
        GraphicsModes graphicsModes = {
            GX_DISPMODE_GRAPHICS,
            GX_BGMODE_0,
            GX_BGMODE_0,
            GX_BG0_AS_2D,
        };
        SetBothScreensModesAndDisable(&graphicsModes);
    }

    {
        BgTemplate bgTemplate = {
            0, 0,
            GF_BG_BUF_SIZE_256x256_4BPP,
            0,
            GF_BG_SCR_SIZE_256x256,
            GX_BG_COLORMODE_16,
            0,
            1,
            0,
            1,
            0,
            0,
            0,
        };
        InitBgFromTemplate(bgConfig, GF_BG_LYR_MAIN_1, &bgTemplate, 0);
    }

    {
        BgTemplate bgTemplate = {
            0, 0,
            GF_BG_BUF_SIZE_256x512_4BPP,
            0,
            GF_BG_SCR_SIZE_256x512,
            GX_BG_COLORMODE_16,
            1,
            1,
            0,
            2,
            0,
            0,
            0,
        };
        InitBgFromTemplate(bgConfig, GF_BG_LYR_MAIN_2, &bgTemplate, 0);
    }

    {
        BgTemplate bgTemplate = {
            0, 0,
            GF_BG_BUF_SIZE_256x256_4BPP,
            0,
            GF_BG_SCR_SIZE_256x256,
            GX_BG_COLORMODE_16,
            0,
            1,
            0,
            1,
            0,
            0,
            0,
        };
        InitBgFromTemplate(bgConfig, GF_BG_LYR_SUB_1, &bgTemplate, 0);
    }

    {
        BgTemplate bgTemplate = {
            0, 0,
            GF_BG_BUF_SIZE_256x512_4BPP,
            0,
            GF_BG_SCR_SIZE_256x512,
            GX_BG_COLORMODE_16,
            1,
            1,
            0,
            2,
            0,
            0,
            0,
        };
        InitBgFromTemplate(bgConfig, GF_BG_LYR_SUB_2, &bgTemplate, 0);
    }
}

void InroMovie_Scene5_LoadBgGfx(BgConfig *bgConfig, IntroMovieScene5Data *sceneData) {
    GfGfxLoader_LoadCharData(NARC_demo_opening_gs_opening, NARC_gs_opening_gs_opening_00000059_NCGR_lz, bgConfig, GF_BG_LYR_SUB_1, 0, 0, TRUE, HEAP_ID_INTRO_MOVIE);
    GfGfxLoader_LoadCharData(NARC_demo_opening_gs_opening, NARC_gs_opening_gs_opening_00000060_NCGR_lz, bgConfig, GF_BG_LYR_MAIN_1, 0, 0, TRUE, HEAP_ID_INTRO_MOVIE);
    GfGfxLoader_LoadScrnData(NARC_demo_opening_gs_opening, NARC_gs_opening_gs_opening_00000063_NSCR_lz, bgConfig, GF_BG_LYR_SUB_1, 0, 0, TRUE, HEAP_ID_INTRO_MOVIE);
    GfGfxLoader_LoadScrnData(NARC_demo_opening_gs_opening, NARC_gs_opening_gs_opening_00000061_NSCR_lz, bgConfig, GF_BG_LYR_SUB_2, 0, 0, TRUE, HEAP_ID_INTRO_MOVIE);
    GfGfxLoader_LoadScrnData(NARC_demo_opening_gs_opening, NARC_gs_opening_gs_opening_00000062_NSCR_lz, bgConfig, GF_BG_LYR_MAIN_1, 0, 0, TRUE, HEAP_ID_INTRO_MOVIE);
    GfGfxLoader_LoadScrnData(NARC_demo_opening_gs_opening, NARC_gs_opening_gs_opening_00000064_NSCR_lz, bgConfig, GF_BG_LYR_MAIN_2, 0, 0, TRUE, HEAP_ID_INTRO_MOVIE);
    GfGfxLoader_GXLoadPal(NARC_demo_opening_gs_opening, NARC_gs_opening_gs_opening_00000031_NCLR, GF_PAL_LOCATION_MAIN_BG, (enum GFPalSlotOffset)0, 0x200, HEAP_ID_INTRO_MOVIE);
    GfGfxLoader_GXLoadPal(NARC_demo_opening_gs_opening, NARC_gs_opening_gs_opening_00000039_NCLR, GF_PAL_LOCATION_SUB_BG, (enum GFPalSlotOffset)0, 0x200, HEAP_ID_INTRO_MOVIE);
    OS_WaitIrq(TRUE, OS_IE_V_BLANK);
    GfGfx_BothDispOn();
}

void IntroMovie_Scene5_EnableBgLayers(IntroMovieScene5Data *sceneData, BgConfig *bgConfig) {
    BgSetPosTextAndCommit(bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_SET_Y, 0xA0);
    BgSetPosTextAndCommit(bgConfig, GF_BG_LYR_SUB_2, BG_POS_OP_SET_Y, 0xA0);
}

void IntroMovie_Scene5_LoadSpriteGfx(IntroMovieOvyData *data, IntroMovieScene5Data *sceneData) {}

void IntroMovie_Scene5_DestroySprites(IntroMovieOvyData *data, IntroMovieScene5Data *sceneData) {}

void IntroMovie_Scene5_CreateSprites(IntroMovieOvyData *data, IntroMovieScene5Data *sceneData) {}
