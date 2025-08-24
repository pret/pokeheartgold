#include "global.h"

#include "demo/opening/gs_opening.naix"

#include "gf_gfx_loader.h"
#include "intro_movie_internal.h"
#include "obj_char_transfer.h"
#include "obj_pltt_transfer.h"
#include "system.h"
#include "unk_0200ACF0.h"
#include "unk_0200B150.h"
#include "unk_0200FA24.h"

enum IntroScene1State {
    INTRO_SCENE1_APPEAR_COPYRIGHT,
    INTRO_SCENE1_WAIT_COPYRIGHT,
    INTRO_SCENE1_WAIT_FADEOUT_COPYRIGHT,
    INTRO_SCENE1_WAIT_APPEAR_GAMEFREAK,
    INTRO_SCENE1_WAIT_GAMEFREAK,
    INTRO_SCENE1_APPEAR_BG_IMAGE,
    INTRO_SCENE1_WAIT_START_BG_SCROLL,
    INTRO_SCENE1_WAIT_BG_SCROLL,
    INTRO_SCENE1_WAIT_APPEAR_BIRD,
    INTRO_SCENE1_DELAY90_START_FADEOUT,
    INTRO_SCENE1_WAIT_FADEOUT,
};

// Copyright, Gamefreak logo, and sunrise

static void IntroMovie_Scene1_VBlankCB(void *pVoid);
static void IntroMovie_Scene1_Init(IntroMovieOverlayData *data, IntroMovieScene1Data *sceneData);
static BOOL IntroMovie_Scene1_Main(IntroMovieOverlayData *data, IntroMovieScene1Data *sceneData, int a2);
static void IntroMovie_Scene1_Exit(IntroMovieOverlayData *data, IntroMovieScene1Data *sceneData);
static void IntroMovie_Scene1_InitBgs(IntroMovieOverlayData *data);
static void IntroMovie_Scene1_LoadBgGfx(BgConfig *bgConfig);
static void IntroMovie_Scene1_SetBrightnessAndBgMaskColor(IntroMovieOverlayData *data);
static void IntroMovie_Scene1_LoadSpriteGfx(IntroMovieOverlayData *data, IntroMovieScene1Data *sceneData);
static void IntroMovie_Scene1_DestroySpritesAndObjectGfx(IntroMovieOverlayData *data, IntroMovieScene1Data *sceneData);
static void IntroMovie_Scene1_CreateSprites(IntroMovieOverlayData *data, IntroMovieScene1Data *sceneData);

static const u8 sIntroMovieScene1SpriteResCounts[4] = { 1, 1, 1, 1 };

BOOL IntroMovie_Scene1(IntroMovieOverlayData *data, void *pVoid) {
    IntroMovieScene1Data *sceneData = (IntroMovieScene1Data *)pVoid;

    if (IntroMovie_GetIntroSkippedFlag(data)) {
        sceneData->state = INTRO_MOVIE_SCENE_EXIT;
    }

    switch (sceneData->state) {
    case INTRO_MOVIE_SCENE_INIT:
        IntroMovie_Scene1_Init(data, sceneData);
        ++sceneData->state;
        break;
    case INTRO_MOVIE_SCENE_RUN:
        if (IntroMovie_Scene1_Main(data, sceneData, IntroMovie_GetTotalFrameCount(data))) {
            ++sceneData->state;
        }
        break;
    case INTRO_MOVIE_SCENE_EXIT:
        IntroMovie_Scene1_Exit(data, sceneData);
        return TRUE;
    }

    return FALSE;
}

static void IntroMovie_Scene1_VBlankCB(void *pVoid) {
    IntroMovieOverlayData *data = (IntroMovieOverlayData *)pVoid;

    DoScheduledBgGpuUpdates(IntroMovie_GetBgConfig(data));
    OamManager_ApplyAndResetBuffers();
}

static void IntroMovie_Scene1_Init(IntroMovieOverlayData *data, IntroMovieScene1Data *sceneData) {
    BgConfig *bgConfig = IntroMovie_GetBgConfig(data);
    ObjCharTransfer_ClearBuffers();
    ObjPlttTransfer_Reset();
    gSystem.screensFlipped = TRUE;
    GfGfx_SwapDisplay();
    IntroMovie_Scene1_InitBgs(data);
    IntroMovie_InitBgAnimGxState(data);
    Main_SetVBlankIntrCB(IntroMovie_Scene1_VBlankCB, data);
    IntroMovie_Scene1_LoadBgGfx(bgConfig);
    IntroMovie_Scene1_LoadSpriteGfx(data, sceneData);
    IntroMovie_Scene1_CreateSprites(data, sceneData);
    IntroMovie_Scene1_SetBrightnessAndBgMaskColor(data);
    sceneData->needFreeGfx = TRUE;
}

static BOOL IntroMovie_Scene1_Main(IntroMovieOverlayData *data, IntroMovieScene1Data *sceneData, int totalFrames) {
    BgConfig *bgConfig = IntroMovie_GetBgConfig(data);
    IntroMovieBgLinearAnims *bgAnimCnt = IntroMovie_GetBgLinearAnimsController(data);
    u8 timer = IntroMovie_GetSceneStepTimer(data);
    switch (IntroMovie_GetSceneStep(data)) {
    case INTRO_SCENE1_APPEAR_COPYRIGHT: // Copyright appear
        BgSetPosTextAndCommit(bgConfig, GF_BG_LYR_MAIN_0, BG_POS_OP_SET_Y, 128);
        GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG0, GF_PLANE_TOGGLE_ON);
        GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG0, GF_PLANE_TOGGLE_ON);
        IntroMovie_AdvanceSceneStep(data);
        break;
    case INTRO_SCENE1_WAIT_COPYRIGHT: // Wait 30 frames then start fade out
        if (timer >= 30) {
            IntroMovie_StartBlendFadeEffect(&bgAnimCnt->blend[0], 1, 0x20, 60, 1, 0);
            IntroMovie_StartBlendFadeEffect(&bgAnimCnt->blend[1], 1, 0x20, 60, 1, 1);
            IntroMovie_AdvanceSceneStep(data);
        }
        break;
    case INTRO_SCENE1_WAIT_FADEOUT_COPYRIGHT: // Wait for fade out (60 frames)
        if (bgAnimCnt->blend[0].finished && bgAnimCnt->blend[1].finished) {
            IntroMovie_AdvanceSceneStep(data);
        }
        break;
    case INTRO_SCENE1_WAIT_APPEAR_GAMEFREAK: // Delay 20 frames then appear GameFreak logo
        if (timer >= 20) {
            *sceneData->skipAllowedPtr = TRUE;
            GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG0, GF_PLANE_TOGGLE_OFF);
            GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG1, GF_PLANE_TOGGLE_ON);
            BgSetPosTextAndCommit(bgConfig, GF_BG_LYR_MAIN_0, BG_POS_OP_SET_Y, 0);
            G2_SetBlendAlpha(1, 0x20, 0x1F, 0);
            IntroMovie_AdvanceSceneStep(data);
        }
        break;
    case INTRO_SCENE1_WAIT_GAMEFREAK: // Delay 110 frames
        if (timer >= 110) {
            IntroMovie_AdvanceSceneStep(data);
        }
        break;
    case INTRO_SCENE1_APPEAR_BG_IMAGE: // Appear sunrise or sunset background
        GfGfx_EngineATogglePlanes((GXPlaneMask)(GX_PLANEMASK_BG1 | GX_PLANEMASK_BG2 | GX_PLANEMASK_BG3), GF_PLANE_TOGGLE_ON);
        GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG3, GF_PLANE_TOGGLE_ON);
        Sprite_SetDrawFlag(sceneData->sunSprite, TRUE);
        IntroMovie_AdvanceSceneStep(data);
        break;
    case INTRO_SCENE1_WAIT_START_BG_SCROLL: // Start scrolling background
        if (timer >= 1) {
            IntroMovie_StartBlendFadeEffect(&bgAnimCnt->blend[0], 1, 0x1E, 80, 1, 1);
            IntroMovie_StartBlendFadeEffect(&bgAnimCnt->blend[1], 2, 0x1E, 80, 1, 0);
            IntroMovie_StartBgScroll_VBlank(bgConfig, bgAnimCnt->scroll, GF_BG_LYR_MAIN_1, 0, -0x20, 0xF0);
            IntroMovie_StartBgScroll_VBlank(bgConfig, bgAnimCnt->scroll, GF_BG_LYR_MAIN_2, 0, -0x10, 0xF0);
            IntroMovie_StartSpriteAnimAndMakeVisible(sceneData->sunSprite, TRUE);
            IntroMovie_AdvanceSceneStep(data);
        }
        break;
    case INTRO_SCENE1_WAIT_BG_SCROLL: // Wait blend and scroll effects (240 frames)
        if (bgAnimCnt->blend[0].finished && bgAnimCnt->blend[1].finished && IntroMovie_WaitBgScrollAnim(bgAnimCnt->scroll, GF_BG_LYR_MAIN_1) && IntroMovie_WaitBgScrollAnim(bgAnimCnt->scroll, GF_BG_LYR_MAIN_2)) {
            IntroMovie_AdvanceSceneStep(data);
        }
        break;
    case INTRO_SCENE1_WAIT_APPEAR_BIRD: // Delay 128 frames then start box legendary anim
        if (timer >= 128) {
            IntroMovie_StartSpriteAnimAndMakeVisible(sceneData->birdSprite, TRUE);
            IntroMovie_AdvanceSceneStep(data);
        }
        break;
    case INTRO_SCENE1_DELAY90_START_FADEOUT: // Run anim 90 frames then start fade to white
        if (timer >= 90) {
            BeginNormalPaletteFade(0, 0, 0, RGB_WHITE, 65, 1, HEAP_ID_INTRO_MOVIE);
            IntroMovie_AdvanceSceneStep(data);
        }
        break;
    case INTRO_SCENE1_WAIT_FADEOUT: // Wait fade to white (65 frames)
        if (IsPaletteFadeFinished()) {
            return TRUE;
        }
    }

    return FALSE;
}

static void IntroMovie_Scene1_Exit(IntroMovieOverlayData *data, IntroMovieScene1Data *sceneData) {
    BgConfig *bgConfig = IntroMovie_GetBgConfig(data);
    Main_SetVBlankIntrCB(NULL, NULL);
    if (sceneData->needFreeGfx) {
        IntroMovie_Scene1_DestroySpritesAndObjectGfx(data, sceneData);
        FreeBgTilemapBuffer(bgConfig, GF_BG_LYR_SUB_0);
        FreeBgTilemapBuffer(bgConfig, GF_BG_LYR_SUB_1);
        FreeBgTilemapBuffer(bgConfig, GF_BG_LYR_SUB_2);
        FreeBgTilemapBuffer(bgConfig, GF_BG_LYR_SUB_3);
        FreeBgTilemapBuffer(bgConfig, GF_BG_LYR_MAIN_0);
        FreeBgTilemapBuffer(bgConfig, GF_BG_LYR_MAIN_1);
        FreeBgTilemapBuffer(bgConfig, GF_BG_LYR_MAIN_2);
        FreeBgTilemapBuffer(bgConfig, GF_BG_LYR_MAIN_3);
        sceneData->needFreeGfx = FALSE;
    }
}

static void IntroMovie_Scene1_InitBgs(IntroMovieOverlayData *data) {
    BgConfig *bgConfig = IntroMovie_GetBgConfig(data);

    {
        GraphicsModes graphicsModes = {
            GX_DISPMODE_GRAPHICS,
            GX_BGMODE_0,
            GX_BGMODE_0,
            GX_BG0_AS_2D
        };
        SetBothScreensModesAndDisable(&graphicsModes);
    }

    {
        BgTemplate bgTemplate = {
            .x = 0, .y = 0, .bufferSize = GF_BG_BUF_SIZE_256x256_4BPP, .baseTile = 0x00000000, .size = GF_BG_SCR_SIZE_256x256, .colorMode = GX_BG_COLORMODE_16, .screenBase = GX_BG_SCRBASE_0x0000, .charBase = GX_BG_CHARBASE_0x04000, .bgExtPltt = GX_BG_EXTPLTT_01, .priority = 0, .areaOver = GX_BG_AREAOVER_XLU, .mosaic = FALSE
        };
        InitBgFromTemplate(bgConfig, GF_BG_LYR_SUB_0, &bgTemplate, 0);
    }

    {
        BgTemplate bgTemplate = {
            .x = 0, .y = 0, .bufferSize = GF_BG_BUF_SIZE_256x256_4BPP, .baseTile = 0x00000000, .size = GF_BG_SCR_SIZE_256x256, .colorMode = GX_BG_COLORMODE_16, .screenBase = GX_BG_SCRBASE_0x0800, .charBase = GX_BG_CHARBASE_0x04000, .bgExtPltt = GX_BG_EXTPLTT_01, .priority = 1, .areaOver = GX_BG_AREAOVER_XLU, .mosaic = FALSE
        };
        InitBgFromTemplate(bgConfig, GF_BG_LYR_SUB_1, &bgTemplate, 0);
    }

    {
        BgTemplate bgTemplate = {
            .x = 0, .y = 0, .bufferSize = GF_BG_BUF_SIZE_256x256_4BPP, .baseTile = 0x00000000, .size = GF_BG_SCR_SIZE_256x256, .colorMode = GX_BG_COLORMODE_16, .screenBase = GX_BG_SCRBASE_0x1000, .charBase = GX_BG_CHARBASE_0x0c000, .bgExtPltt = GX_BG_EXTPLTT_01, .priority = 2, .areaOver = GX_BG_AREAOVER_XLU, .mosaic = FALSE
        };
        InitBgFromTemplate(bgConfig, GF_BG_LYR_SUB_2, &bgTemplate, 0);
    }

    {
        BgTemplate bgTemplate = {
            .x = 0, .y = 0, .bufferSize = GF_BG_BUF_SIZE_256x256_4BPP, .baseTile = 0x00000000, .size = GF_BG_SCR_SIZE_256x256, .colorMode = GX_BG_COLORMODE_16, .screenBase = GX_BG_SCRBASE_0x1800, .charBase = GX_BG_CHARBASE_0x10000, .bgExtPltt = GX_BG_EXTPLTT_01, .priority = 3, .areaOver = GX_BG_AREAOVER_XLU, .mosaic = FALSE
        };
        InitBgFromTemplate(bgConfig, GF_BG_LYR_SUB_3, &bgTemplate, 0);
    }

    {
        BgTemplate bgTemplate = {
            .x = 0, .y = 0, .bufferSize = GF_BG_BUF_SIZE_256x256_4BPP, .baseTile = 0x00000000, .size = GF_BG_SCR_SIZE_256x256, .colorMode = GX_BG_COLORMODE_16, .screenBase = GX_BG_SCRBASE_0x0000, .charBase = GX_BG_CHARBASE_0x04000, .bgExtPltt = GX_BG_EXTPLTT_01, .priority = 0, .areaOver = GX_BG_AREAOVER_XLU, .mosaic = FALSE
        };
        InitBgFromTemplate(bgConfig, GF_BG_LYR_MAIN_0, &bgTemplate, 0);
    }

    {
        BgTemplate bgTemplate = {
            .x = 0, .y = 0, .bufferSize = GF_BG_BUF_SIZE_256x256_4BPP, .baseTile = 0x00000000, .size = GF_BG_SCR_SIZE_256x256, .colorMode = GX_BG_COLORMODE_16, .screenBase = GX_BG_SCRBASE_0x0800, .charBase = GX_BG_CHARBASE_0x08000, .bgExtPltt = GX_BG_EXTPLTT_01, .priority = 1, .areaOver = GX_BG_AREAOVER_XLU, .mosaic = FALSE
        };
        InitBgFromTemplate(bgConfig, GF_BG_LYR_MAIN_1, &bgTemplate, 0);
    }

    {
        BgTemplate bgTemplate = {
            .x = 0, .y = 0, .bufferSize = GF_BG_BUF_SIZE_256x256_4BPP, .baseTile = 0x00000000, .size = GF_BG_SCR_SIZE_256x256, .colorMode = GX_BG_COLORMODE_16, .screenBase = GX_BG_SCRBASE_0x1000, .charBase = GX_BG_CHARBASE_0x08000, .bgExtPltt = GX_BG_EXTPLTT_01, .priority = 2, .areaOver = GX_BG_AREAOVER_XLU, .mosaic = FALSE
        };
        InitBgFromTemplate(bgConfig, GF_BG_LYR_MAIN_2, &bgTemplate, 0);
    }

    {
        BgTemplate bgTemplate = {
            .x = 0, .y = 0, .bufferSize = GF_BG_BUF_SIZE_256x256_4BPP, .baseTile = 0x00000000, .size = GF_BG_SCR_SIZE_256x256, .colorMode = GX_BG_COLORMODE_16, .screenBase = GX_BG_SCRBASE_0x1800, .charBase = GX_BG_CHARBASE_0x08000, .bgExtPltt = GX_BG_EXTPLTT_01, .priority = 3, .areaOver = GX_BG_AREAOVER_XLU, .mosaic = FALSE
        };
        InitBgFromTemplate(bgConfig, GF_BG_LYR_MAIN_3, &bgTemplate, 0);
    }
}

#ifdef HEARTGOLD
#define INTRO_MOVIE_SCENE1_PALDATA_SUB    NARC_gs_opening_gs_opening_00000000_NCLR
#define INTRO_MOVIE_SCENE1_PALDATA_MAIN   NARC_gs_opening_gs_opening_00000001_NCLR
#define INTRO_MOVIE_SCENE1_CHARDATA_SUB3  NARC_gs_opening_gs_opening_00000006_NCGR_lz
#define INTRO_MOVIE_SCENE1_CHARDATA_MAIN3 NARC_gs_opening_gs_opening_00000007_NCGR_lz
#define INTRO_MOVIE_SCENE1_SCRNDATA_SUB3  NARC_gs_opening_gs_opening_00000015_NSCR_lz
#define INTRO_MOVIE_SCENE1_SCRNDATA_MAIN1 NARC_gs_opening_gs_opening_00000016_NSCR_lz
#define INTRO_MOVIE_SCENE1_SCRNDATA_MAIN2 NARC_gs_opening_gs_opening_00000017_NSCR_lz
#define INTRO_MOVIE_SCENE1_SCRNDATA_MAIN3 NARC_gs_opening_gs_opening_00000018_NSCR_lz
#define INTRO_MOVIE_SCENE1_BIRD_PLTTRES   NARC_gs_opening_gs_opening_00000023_NCLR
#define INTRO_MOVIE_SCENE1_BIRD_CHARRES   NARC_gs_opening_gs_opening_00000024_NCGR_lz
#define INTRO_MOVIE_SCENE1_BIRD_ANIMRES   NARC_gs_opening_gs_opening_00000025_NANR_lz
#define INTRO_MOVIE_SCENE1_BIRD_CELLRES   NARC_gs_opening_gs_opening_00000026_NCER_lz
#else
#define INTRO_MOVIE_SCENE1_PALDATA_SUB    NARC_gs_opening_gs_opening_00000002_NCLR
#define INTRO_MOVIE_SCENE1_PALDATA_MAIN   NARC_gs_opening_gs_opening_00000003_NCLR
#define INTRO_MOVIE_SCENE1_CHARDATA_SUB3  NARC_gs_opening_gs_opening_00000008_NCGR_lz
#define INTRO_MOVIE_SCENE1_CHARDATA_MAIN3 NARC_gs_opening_gs_opening_00000009_NCGR_lz
#define INTRO_MOVIE_SCENE1_SCRNDATA_SUB3  NARC_gs_opening_gs_opening_00000019_NSCR_lz
#define INTRO_MOVIE_SCENE1_SCRNDATA_MAIN1 NARC_gs_opening_gs_opening_00000020_NSCR_lz
#define INTRO_MOVIE_SCENE1_SCRNDATA_MAIN2 NARC_gs_opening_gs_opening_00000021_NSCR_lz
#define INTRO_MOVIE_SCENE1_SCRNDATA_MAIN3 NARC_gs_opening_gs_opening_00000022_NSCR_lz
#define INTRO_MOVIE_SCENE1_BIRD_PLTTRES   NARC_gs_opening_gs_opening_00000027_NCLR
#define INTRO_MOVIE_SCENE1_BIRD_CHARRES   NARC_gs_opening_gs_opening_00000028_NCGR_lz
#define INTRO_MOVIE_SCENE1_BIRD_ANIMRES   NARC_gs_opening_gs_opening_00000029_NANR_lz
#define INTRO_MOVIE_SCENE1_BIRD_CELLRES   NARC_gs_opening_gs_opening_00000030_NCER_lz
#endif // HEARTGOLD

static void IntroMovie_Scene1_LoadBgGfx(BgConfig *bgConfig) {
    GfGfxLoader_LoadCharData(NARC_demo_opening_gs_opening, 4, bgConfig, GF_BG_LYR_SUB_1, 0, 0, TRUE, HEAP_ID_INTRO_MOVIE);
    GfGfxLoader_LoadCharData(NARC_demo_opening_gs_opening, 5, bgConfig, GF_BG_LYR_MAIN_0, 0, 0, TRUE, HEAP_ID_INTRO_MOVIE);
    GfGfxLoader_LoadScrnData(NARC_demo_opening_gs_opening, 12, bgConfig, GF_BG_LYR_SUB_1, 0, 0, TRUE, HEAP_ID_INTRO_MOVIE);
    GfGfxLoader_LoadScrnData(NARC_demo_opening_gs_opening, 13, bgConfig, GF_BG_LYR_MAIN_0, 0, 0, FALSE, HEAP_ID_INTRO_MOVIE);
    GfGfxLoader_LoadScrnData(NARC_demo_opening_gs_opening, 14, bgConfig, GF_BG_LYR_SUB_0, 0, 0, TRUE, HEAP_ID_INTRO_MOVIE);
    GfGfxLoader_LoadCharData(NARC_demo_opening_gs_opening, INTRO_MOVIE_SCENE1_CHARDATA_SUB3, bgConfig, GF_BG_LYR_SUB_3, 0, 0, TRUE, HEAP_ID_INTRO_MOVIE);
    GfGfxLoader_LoadCharData(NARC_demo_opening_gs_opening, INTRO_MOVIE_SCENE1_CHARDATA_MAIN3, bgConfig, GF_BG_LYR_MAIN_3, 0, 0, TRUE, HEAP_ID_INTRO_MOVIE);
    GfGfxLoader_LoadScrnData(NARC_demo_opening_gs_opening, INTRO_MOVIE_SCENE1_SCRNDATA_SUB3, bgConfig, GF_BG_LYR_SUB_3, 0, 0, TRUE, HEAP_ID_INTRO_MOVIE);
    GfGfxLoader_LoadScrnData(NARC_demo_opening_gs_opening, INTRO_MOVIE_SCENE1_SCRNDATA_MAIN3, bgConfig, GF_BG_LYR_MAIN_3, 0, 0, TRUE, HEAP_ID_INTRO_MOVIE);
    GfGfxLoader_LoadScrnData(NARC_demo_opening_gs_opening, INTRO_MOVIE_SCENE1_SCRNDATA_MAIN2, bgConfig, GF_BG_LYR_MAIN_2, 0, 0, TRUE, HEAP_ID_INTRO_MOVIE);
    GfGfxLoader_LoadScrnData(NARC_demo_opening_gs_opening, INTRO_MOVIE_SCENE1_SCRNDATA_MAIN1, bgConfig, GF_BG_LYR_MAIN_1, 0, 0, TRUE, HEAP_ID_INTRO_MOVIE);
    GfGfxLoader_GXLoadPal(NARC_demo_opening_gs_opening, INTRO_MOVIE_SCENE1_PALDATA_SUB, GF_PAL_LOCATION_SUB_BG, (enum GFPalSlotOffset)0, 0x140, HEAP_ID_INTRO_MOVIE);
    GfGfxLoader_GXLoadPal(NARC_demo_opening_gs_opening, INTRO_MOVIE_SCENE1_PALDATA_MAIN, GF_PAL_LOCATION_MAIN_BG, (enum GFPalSlotOffset)0, 0x140, HEAP_ID_INTRO_MOVIE);
    GfGfx_EngineATogglePlanes((GXPlaneMask)(GX_PLANEMASK_BG0 | GX_PLANEMASK_BG1 | GX_PLANEMASK_BG2 | GX_PLANEMASK_BG3), GF_PLANE_TOGGLE_OFF);
    GfGfx_EngineBTogglePlanes((GXPlaneMask)(GX_PLANEMASK_BG0 | GX_PLANEMASK_BG1 | GX_PLANEMASK_BG2 | GX_PLANEMASK_BG3), GF_PLANE_TOGGLE_OFF);
    OS_WaitIrq(TRUE, OS_IE_V_BLANK);
    GfGfx_BothDispOn();
}

static void IntroMovie_Scene1_SetBrightnessAndBgMaskColor(IntroMovieOverlayData *data) {
    BG_SetMaskColor(GF_BG_LYR_MAIN_0, RGB_BLACK);
    BG_SetMaskColor(GF_BG_LYR_SUB_0, RGB_BLACK);
    SetMasterBrightnessNeutral(PM_LCD_BOTTOM);
    SetMasterBrightnessNeutral(PM_LCD_TOP);
}

static void IntroMovie_Scene1_LoadSpriteGfx(IntroMovieOverlayData *data, IntroMovieScene1Data *sceneData) {
    IntroMovie_CreateSpriteResourceManagers(data, sIntroMovieScene1SpriteResCounts);
    GF_2DGfxResMan **ppMgr = IntroMovie_GetSpriteResourceManagersArray(data);
    sceneData->charResObj = AddCharResObjFromNarc(ppMgr[GF_GFX_RES_TYPE_CHAR], NARC_demo_opening_gs_opening, INTRO_MOVIE_SCENE1_BIRD_CHARRES, TRUE, 1, NNS_G2D_VRAM_TYPE_2DMAIN, HEAP_ID_INTRO_MOVIE);
    sceneData->plttResObj = AddPlttResObjFromNarc(ppMgr[GF_GFX_RES_TYPE_PLTT], NARC_demo_opening_gs_opening, INTRO_MOVIE_SCENE1_BIRD_PLTTRES, FALSE, 1, NNS_G2D_VRAM_TYPE_2DMAIN, 2, HEAP_ID_INTRO_MOVIE);
    sceneData->cellResObj = AddCellOrAnimResObjFromNarc(ppMgr[GF_GFX_RES_TYPE_CELL], NARC_demo_opening_gs_opening, INTRO_MOVIE_SCENE1_BIRD_CELLRES, TRUE, 1, GF_GFX_RES_TYPE_CELL, HEAP_ID_INTRO_MOVIE);
    sceneData->animResObj = AddCellOrAnimResObjFromNarc(ppMgr[GF_GFX_RES_TYPE_ANIM], NARC_demo_opening_gs_opening, INTRO_MOVIE_SCENE1_BIRD_ANIMRES, TRUE, 1, GF_GFX_RES_TYPE_ANIM, HEAP_ID_INTRO_MOVIE);
    sub_0200ACF0(sceneData->charResObj);
    sub_0200AF94(sceneData->plttResObj);
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_ON);
}

static void IntroMovie_Scene1_DestroySpritesAndObjectGfx(IntroMovieOverlayData *data, IntroMovieScene1Data *sceneData) {
    Sprite_Delete(sceneData->sunSprite);
    Sprite_Delete(sceneData->birdSprite);
    sub_0200AEB0(sceneData->charResObj);
    sub_0200B0A8(sceneData->plttResObj);
    IntroMovie_DestroySpriteResourceManagers(data);
}

static void IntroMovie_Scene1_CreateSprites(IntroMovieOverlayData *data, IntroMovieScene1Data *sceneData) {
    SpriteResourcesHeader spriteResourcesHeader;
    SpriteTemplate spriteTemplate;

    IntroMovie_BuildSpriteResourcesHeaderAndTemplate(1, data, 1, NNS_G2D_VRAM_TYPE_2DMAIN, &spriteTemplate, &spriteResourcesHeader);
    spriteTemplate.position.x = 128 * FX32_ONE;
    spriteTemplate.position.y = 96 * FX32_ONE;
    sceneData->sunSprite = Sprite_CreateAffine(&spriteTemplate);
    Sprite_SetAnimActiveFlag(sceneData->sunSprite, FALSE);
    Sprite_SetDrawFlag(sceneData->sunSprite, FALSE);
    Sprite_SetAnimCtrlSeq(sceneData->sunSprite, 0);

    IntroMovie_BuildSpriteResourcesHeaderAndTemplate(1, data, 0, NNS_G2D_VRAM_TYPE_2DMAIN, &spriteTemplate, &spriteResourcesHeader);
    spriteTemplate.position.x = 128 * FX32_ONE;
    spriteTemplate.position.y = 96 * FX32_ONE;
    sceneData->birdSprite = Sprite_CreateAffine(&spriteTemplate);
    Sprite_SetAnimActiveFlag(sceneData->birdSprite, FALSE);
    Sprite_SetDrawFlag(sceneData->birdSprite, FALSE);
    Sprite_SetAnimCtrlSeq(sceneData->birdSprite, 1);
    Sprite_SetAffineOverwriteMode(sceneData->birdSprite, 2);
}

enum HeapID _deadstrip_01(int idx);
enum HeapID _deadstrip_01(int idx) {
    static const enum HeapID sDeadstrippedRodata[1] = { HEAP_ID_INTRO_MOVIE };
    return sDeadstrippedRodata[idx];
}
