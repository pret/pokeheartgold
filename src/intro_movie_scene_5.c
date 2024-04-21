#include "demo/opening/gs_opening.naix"
#include "gf_gfx_loader.h"
#include "global.h"
#include "intro_movie_internal.h"
#include "system.h"
#include "unk_0200B150.h"
#include "unk_0200FA24.h"

enum IntroScene5State {
    INTRO_SCENE5_WIPE_IN,
    INTRO_SCENE5_WAIT_WIPE,
    INTRO_SCENE5_BEGIN_BG_SCROLL,
    INTRO_SCENE5_WAIT_BG_SCROLL,
    INTRO_SCENE5_WAIT_FADE_OUT,
};

static void IntroMovie_Scene5_VBlankCB(void *pVoid);
static void IntroMovie_Scene5_Init(IntroMovieOverlayData *data, IntroMovieScene5Data *sceneData);
static BOOL IntroMovie_Scene5_Main(IntroMovieOverlayData *data, IntroMovieScene5Data *sceneData, int totalFrames);
static void IntroMovie_Scene5_Exit(IntroMovieOverlayData *data, IntroMovieScene5Data *sceneData);
static void IntroMovie_Scene5_InitBgs(IntroMovieOverlayData *data);
static void IntroMovie_Scene5_LoadBgGfx(BgConfig *bgConfig, IntroMovieScene5Data *sceneData);
static void IntroMovie_Scene5_EnableBgLayers(IntroMovieScene5Data *sceneData, BgConfig *bgConfig);
static void IntroMovie_Scene5_LoadSpriteGfx(IntroMovieOverlayData *data, IntroMovieScene5Data *sceneData);
static void IntroMovie_Scene5_DestroySprites(IntroMovieOverlayData *data, IntroMovieScene5Data *sceneData);
static void IntroMovie_Scene5_CreateSprites(IntroMovieOverlayData *data, IntroMovieScene5Data *sceneData);

BOOL IntroMovie_Scene5(IntroMovieOverlayData *data, void *pVoid) {
    IntroMovieScene5Data *sceneData = (IntroMovieScene5Data *)pVoid;

    if (IntroMovie_GetIntroSkippedFlag(data)) {
        sceneData->state = INTRO_MOVIE_SCENE_EXIT;
    }

    switch (sceneData->state) {
    case INTRO_MOVIE_SCENE_INIT:
        IntroMovie_Scene5_Init(data, sceneData);
        ++sceneData->state;
        break;
    case INTRO_MOVIE_SCENE_RUN:
        if (IntroMovie_Scene5_Main(data, sceneData, IntroMovie_GetTotalFrameCount(data))) {
            ++sceneData->state;
        }
        break;
    case INTRO_MOVIE_SCENE_EXIT:
        IntroMovie_Scene5_Exit(data, sceneData);
        return TRUE;
    }

    return FALSE;
}

static void IntroMovie_Scene5_VBlankCB(void *pVoid) {
    IntroMovieOverlayData *data = (IntroMovieOverlayData *)pVoid;

    DoScheduledBgGpuUpdates(IntroMovie_GetBgConfig(data));
    OamManager_ApplyAndResetBuffers();
}

static void IntroMovie_Scene5_Init(IntroMovieOverlayData *data, IntroMovieScene5Data *sceneData) {
    BgConfig *bgConfig = IntroMovie_GetBgConfig(data);
    gSystem.screensFlipped = TRUE;
    GfGfx_SwapDisplay();
    sub_0200FBF4(PM_LCD_TOP, RGB_BLACK);
    sub_0200FBF4(PM_LCD_BOTTOM, RGB_BLACK);
    IntroMovie_Scene5_InitBgs(data);
    IntroMovie_InitBgAnimGxState(data);
    Main_SetVBlankIntrCB(IntroMovie_Scene5_VBlankCB, data);
    IntroMovie_Scene5_LoadBgGfx(bgConfig, sceneData);
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

static BOOL IntroMovie_Scene5_Main(IntroMovieOverlayData *data, IntroMovieScene5Data *sceneData, int totalFrames) {
    BgConfig *bgConfig = IntroMovie_GetBgConfig(data);
    IntroMovieBgLinearAnims *animCnt = IntroMovie_GetBgLinearAnimsController(data);
    u8 stepTimer = IntroMovie_GetSceneStepTimer(data);
    switch (IntroMovie_GetSceneStep(data)) {
    case INTRO_SCENE5_WIPE_IN:
        BeginNormalPaletteFade(1, 9, 5, RGB_BLACK, 18, 1, HEAP_ID_INTRO_MOVIE);
        IntroMovie_AdvanceSceneStep(data);
        break;
    case INTRO_SCENE5_WAIT_WIPE:
        if (IsPaletteFadeFinished()) {
            IntroMovie_AdvanceSceneStep(data);
        }
        break;
    case INTRO_SCENE5_BEGIN_BG_SCROLL:
        IntroMovie_StartBgScroll_VBlank(bgConfig, animCnt->scroll, GF_BG_LYR_MAIN_1, 0, -0x40, 73);
        IntroMovie_StartBgScroll_VBlank(bgConfig, animCnt->scroll, GF_BG_LYR_MAIN_2, 0, BG_SCROLL_SPEED, 73);
        IntroMovie_StartBgScroll_VBlank(bgConfig, animCnt->scroll, GF_BG_LYR_SUB_1, 0, BG_SCROLL_SPEED, 73);
        IntroMovie_StartBgScroll_VBlank(bgConfig, animCnt->scroll, GF_BG_LYR_SUB_2, 0, BG_SCROLL_SPEED, 73);
        IntroMovie_AdvanceSceneStep(data);
        break;
    case INTRO_SCENE5_WAIT_BG_SCROLL:
        if (stepTimer >= 20) {
            BeginNormalPaletteFade(0, 0, 0, RGB_WHITE, 50, 1, HEAP_ID_INTRO_MOVIE);
            IntroMovie_AdvanceSceneStep(data);
        }
        break;
    case INTRO_SCENE5_WAIT_FADE_OUT:
        if (IsPaletteFadeFinished()) {
            return TRUE;
        }
        break;
    }

    return FALSE;
}

#undef BG_SCROLL_SPEED

static void IntroMovie_Scene5_Exit(IntroMovieOverlayData *data, IntroMovieScene5Data *sceneData) {
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

static void IntroMovie_Scene5_InitBgs(IntroMovieOverlayData *data) {
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
            .x = 0, .y = 0,
            .bufferSize = GF_BG_BUF_SIZE_256x256_4BPP,
            .baseTile = 0,
            .size = GF_BG_SCR_SIZE_256x256,
            .colorMode = GX_BG_COLORMODE_16,
            .screenBase = GX_BG_SCRBASE_0x0000,
            .charBase = GX_BG_CHARBASE_0x04000,
            .bgExtPltt = GX_BG_EXTPLTT_01,
            .priority = 1,
            .areaOver = GX_BG_AREAOVER_XLU,
            .mosaic = FALSE,
        };
        InitBgFromTemplate(bgConfig, GF_BG_LYR_MAIN_1, &bgTemplate, 0);
    }

    {
        BgTemplate bgTemplate = {
            .x = 0, .y = 0,
            .bufferSize = GF_BG_BUF_SIZE_256x512_4BPP,
            .baseTile = 0,
            .size = GF_BG_SCR_SIZE_256x512,
            .colorMode = GX_BG_COLORMODE_16,
            .screenBase = GX_BG_SCRBASE_0x0800,
            .charBase = GX_BG_CHARBASE_0x04000,
            .bgExtPltt = GX_BG_EXTPLTT_01,
            .priority = 2,
            .areaOver = GX_BG_AREAOVER_XLU,
            .mosaic = FALSE,
        };
        InitBgFromTemplate(bgConfig, GF_BG_LYR_MAIN_2, &bgTemplate, 0);
    }

    {
        BgTemplate bgTemplate = {
            .x = 0, .y = 0,
            .bufferSize = GF_BG_BUF_SIZE_256x256_4BPP,
            .baseTile = 0,
            .size = GF_BG_SCR_SIZE_256x256,
            .colorMode = GX_BG_COLORMODE_16,
            .screenBase = GX_BG_SCRBASE_0x0000,
            .charBase = GX_BG_CHARBASE_0x04000,
            .bgExtPltt = GX_BG_EXTPLTT_01,
            .priority = 1,
            .areaOver = GX_BG_AREAOVER_XLU,
            .mosaic = FALSE,
        };
        InitBgFromTemplate(bgConfig, GF_BG_LYR_SUB_1, &bgTemplate, 0);
    }

    {
        BgTemplate bgTemplate = {
            .x = 0, .y = 0,
            .bufferSize = GF_BG_BUF_SIZE_256x512_4BPP,
            .baseTile = 0,
            .size = GF_BG_SCR_SIZE_256x512,
            .colorMode = GX_BG_COLORMODE_16,
            .screenBase = GX_BG_SCRBASE_0x0800,
            .charBase = GX_BG_CHARBASE_0x04000,
            .bgExtPltt = GX_BG_EXTPLTT_01,
            .priority = 2,
            .areaOver = GX_BG_AREAOVER_XLU,
            .mosaic = FALSE,
        };
        InitBgFromTemplate(bgConfig, GF_BG_LYR_SUB_2, &bgTemplate, 0);
    }
}

static void IntroMovie_Scene5_LoadBgGfx(BgConfig *bgConfig, IntroMovieScene5Data *sceneData) {
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

static void IntroMovie_Scene5_EnableBgLayers(IntroMovieScene5Data *sceneData, BgConfig *bgConfig) {
    BgSetPosTextAndCommit(bgConfig, GF_BG_LYR_MAIN_2, BG_POS_OP_SET_Y, 0xA0);
    BgSetPosTextAndCommit(bgConfig, GF_BG_LYR_SUB_2, BG_POS_OP_SET_Y, 0xA0);
}

static void IntroMovie_Scene5_LoadSpriteGfx(IntroMovieOverlayData *data, IntroMovieScene5Data *sceneData) {}

static void IntroMovie_Scene5_DestroySprites(IntroMovieOverlayData *data, IntroMovieScene5Data *sceneData) {}

static void IntroMovie_Scene5_CreateSprites(IntroMovieOverlayData *data, IntroMovieScene5Data *sceneData) {}
