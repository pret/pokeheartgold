#include "global.h"

#include "demo/opening/gs_opening.naix"

#include "gf_gfx_loader.h"
#include "intro_movie_internal.h"
#include "math_util.h"
#include "obj_char_transfer.h"
#include "obj_pltt_transfer.h"
#include "sys_task_api.h"
#include "system.h"
#include "unk_0200ACF0.h"
#include "unk_0200B150.h"
#include "unk_0200FA24.h"
#include "unk_02026E30.h"

enum IntroScene4State {
    INTRO_SCENE4_FADE_IN,
    INTRO_SCENE4_WAIT_FADE_IN,
    INTRO_SCENE4_SLIDE_IN_PLAYERS,
    INTRO_SCENE4_WAIT_SLIDE_IN_PLAYERS,
    INTRO_SCENE4_HOLD_PLAYERS_GFX,
    INTRO_SCENE4_SLIDE_OUT_PLAYERS,
    INTRO_SCENE4_WAIT_SLIDE_OUT_PLAYERS,
    INTRO_SCENE4_APPEAR_CHIKORITA,
    INTRO_SCENE4_START_GRASS_PARTICLES,
    INTRO_SCENE4_RUN_GRASS_PARTICLES,
    INTRO_SCENE4_FINISH_CHIKORITA,
    INTRO_SCENE4_APPEAR_CYNDAQUIL,
    INTRO_SCENE4_START_FIRE_PARTICLES,
    INTRO_SCENE4_RUN_FIRE_PARTICLES,
    INTRO_SCENE4_FINISH_CYNDAQUIL,
    INTRO_SCENE4_APPEAR_TOTODILE,
    INTRO_SCENE4_START_WATER_PARTICLES,
    INTRO_SCENE4_RUN_WATER_PARTICLES,
    INTRO_SCENE4_FINISH_TOTODILE,
    INTRO_SCENE4_SPARKLE,
    INTRO_SCENE4_WAIT_SPARKLE,
};

static void IntroMovie_Scene4_VBlankCB(void *pVoid);
static void IntroMovie_Scene4_Init(IntroMovieOverlayData *data, IntroMovieScene4Data *sceneData);
static BOOL IntroMovie_Scene4_Main(IntroMovieOverlayData *data, IntroMovieScene4Data *sceneData, int totalFrames);
static void IntroMovie_Scene4_Exit(IntroMovieOverlayData *data, IntroMovieScene4Data *sceneData);
static void IntroMovie_Scene4_InitBgs(IntroMovieOverlayData *data);
static void InroMovie_Scene4_LoadBgGfx(BgConfig *bgConfig, IntroMovieScene4Data *sceneData);
static void IntroMovie_Scene4_EnableBgLayers(IntroMovieOverlayData *data, BgConfig *bgConfig);
static void IntroMovie_Scene4_LoadSpriteGfx(IntroMovieOverlayData *data, IntroMovieScene4Data *sceneData);
static void IntroMovie_Scene4_DestroySprites(IntroMovieOverlayData *data, IntroMovieScene4Data *sceneData);
static void IntroMovie_Scene4_CreateSprites(IntroMovieOverlayData *data, IntroMovieScene4Data *sceneData);
static u32 IntroMovie_Scene4_TexAlloc(u32 size, BOOL is4x4comp);
static u32 IntroMovie_Scene4_PlttAlloc(u32 size, BOOL is4pltt);
static void IntroMovie_Scene4_SPLEmitterCB(struct SPLEmitter *emitter);
static void IntroMovie_Scene4_3DMain(void);
static void IntroMovie_Scene4_StartParticleEmitters(IntroMovieScene4Data *sceneData, int whichStarter);
static void IntroMovie_Scene4_3DVRamManInit(void);
static void IntroMovie_Scene4_FlipScreensAtNextVBlank(IntroMovieScene4Data *sceneData, int whichScreen);
static void Task_IntroMovie_Scene4_FlipScreens(SysTask *task, void *pVoid);

static const int sStarterParticleResIds[3][3] = {
    { 6, 7, 8 },
    { 3, 4, 5 },
    { 0, 1, 2 }
};

static const u8 sIntroMovieScene4SpriteResCounts[4] = { 4, 4, 4, 4 };

BOOL IntroMovie_Scene4(IntroMovieOverlayData *data, void *pVoid) {
    IntroMovieScene4Data *sceneData = (IntroMovieScene4Data *)pVoid;

    if (IntroMovie_GetIntroSkippedFlag(data)) {
        sceneData->state = INTRO_MOVIE_SCENE_EXIT;
    }

    switch (sceneData->state) {
    case INTRO_MOVIE_SCENE_INIT:
        IntroMovie_Scene4_Init(data, sceneData);
        ++sceneData->state;
        break;
    case INTRO_MOVIE_SCENE_RUN:
        if (IntroMovie_Scene4_Main(data, sceneData, IntroMovie_GetTotalFrameCount(data))) {
            ++sceneData->state;
        }
        break;
    case INTRO_MOVIE_SCENE_EXIT:
        IntroMovie_Scene4_Exit(data, sceneData);
        return TRUE;
    }

    return FALSE;
}

static void IntroMovie_Scene4_VBlankCB(void *pVoid) {
    IntroMovieOverlayData *data = (IntroMovieOverlayData *)pVoid;

    DoScheduledBgGpuUpdates(IntroMovie_GetBgConfig(data));
    OamManager_ApplyAndResetBuffers();
}

static void IntroMovie_Scene4_Init(IntroMovieOverlayData *data, IntroMovieScene4Data *sceneData) {
    BgConfig *bgConfig = IntroMovie_GetBgConfig(data);
    ObjCharTransfer_ClearBuffers();
    ObjPlttTransfer_Reset();
    gSystem.screensFlipped = TRUE;
    GfGfx_SwapDisplay();
    sub_0200FBF4(PM_LCD_TOP, RGB_BLACK);
    sub_0200FBF4(PM_LCD_BOTTOM, RGB_BLACK);
    IntroMovie_Scene4_InitBgs(data);
    IntroMovie_InitBgAnimGxState(data);
    Main_SetVBlankIntrCB(IntroMovie_Scene4_VBlankCB, data);
    InroMovie_Scene4_LoadBgGfx(bgConfig, sceneData);
    IntroMovie_RendererSetSurfaceCoords(data, 0, 0, 0, 256);
    IntroMovie_Scene4_LoadSpriteGfx(data, sceneData);
    IntroMovie_Scene4_CreateSprites(data, sceneData);
    sceneData->gf3dVramMan = GF_3DVramMan_Create(HEAP_ID_INTRO_MOVIE, 0, 1, 0, 4, IntroMovie_Scene4_3DVRamManInit);
    sub_02014DA0();
    sceneData->particleHeap = AllocFromHeap(HEAP_ID_INTRO_MOVIE, 0x4800);
    sceneData->particleSystem = sub_02014DB4(IntroMovie_Scene4_TexAlloc, IntroMovie_Scene4_PlttAlloc, sceneData->particleHeap, 0x4800, TRUE, HEAP_ID_INTRO_MOVIE);
    Camera_SetPerspectiveClippingPlane(FX32_CONST(1), FX32_CONST(900), sub_02015524(sceneData->particleSystem));
    sub_0201526C(sceneData->particleSystem, sub_02015264(NARC_a_0_5_9, 4, HEAP_ID_INTRO_MOVIE), 0x0A, TRUE);
    IntroMovie_Scene4_EnableBgLayers(data, bgConfig);
    G2_SetBlendAlpha(0, 0x3E, 0, 0);
    sceneData->needFreeGfx = TRUE;
}

static BOOL IntroMovie_Scene4_Main(IntroMovieOverlayData *data, IntroMovieScene4Data *sceneData, int totalFrames) {
    BgConfig *bgConfig = IntroMovie_GetBgConfig(data);
    IntroMovieBgLinearAnims *animCnt = IntroMovie_GetBgLinearAnimsController(data);
    u8 stepTimer = IntroMovie_GetSceneStepTimer(data);
    switch (IntroMovie_GetSceneStep(data)) {
    case INTRO_SCENE4_FADE_IN:
        BeginNormalPaletteFade(0, 9, 9, RGB_BLACK, 10, 1, HEAP_ID_INTRO_MOVIE);
        IntroMovie_AdvanceSceneStep(data);
        break;
    case INTRO_SCENE4_WAIT_FADE_IN:
        if (IsPaletteFadeFinished()) {
            IntroMovie_AdvanceSceneStep(data);
        }
        break;
    case INTRO_SCENE4_SLIDE_IN_PLAYERS: {
        IntroMovieBgWindowAnimParam windowPan_widenRightToLeft = {
            255, 0, 255, 192, 0, 0, 255, 192, 30, 28, 1, 1
        };
        IntroMovie_StartWindowPanEffect(animCnt->window, 10, PM_LCD_TOP, &windowPan_widenRightToLeft);

        IntroMovieBgWindowAnimParam windowPan_widenLeftToRight = {
            0, 0, 0, 192, 0, 0, 255, 192, 30, 28, 1, 1
        };
        IntroMovie_StartWindowPanEffect(animCnt->window, 10, PM_LCD_BOTTOM, &windowPan_widenLeftToRight);

        IntroMovie_StartBgScroll_VBlank(bgConfig, animCnt->scroll, GF_BG_LYR_SUB_1, 0xC0, 0, 10);
        IntroMovie_StartBgScroll_VBlank(bgConfig, animCnt->scroll, GF_BG_LYR_MAIN_1, -0xC0, 0, 10);
        IntroMovie_StartSpriteAnimAndMakeVisible(sceneData->hand1Sprite, TRUE);
        IntroMovie_StartSpriteAnimAndMakeVisible(sceneData->hand2Sprite, TRUE);
        GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG1, GF_PLANE_TOGGLE_ON);
        GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG1, GF_PLANE_TOGGLE_ON);
        IntroMovie_AdvanceSceneStep(data);
        break;
    }
    case INTRO_SCENE4_WAIT_SLIDE_IN_PLAYERS:
        if (IntroMovie_WaitBgScrollAnim(animCnt->scroll, GF_BG_LYR_SUB_1) && IntroMovie_WaitBgScrollAnim(animCnt->scroll, GF_BG_LYR_MAIN_1)) {
            IntroMovie_AdvanceSceneStep(data);
        }
        break;
    case INTRO_SCENE4_HOLD_PLAYERS_GFX:
        if (stepTimer > 25) {
            IntroMovie_AdvanceSceneStep(data);
        }
        break;
    case INTRO_SCENE4_SLIDE_OUT_PLAYERS: {
        IntroMovieBgWindowAnimParam windowPan_narrowRightToLeft = {
            0, 0, 255, 192, 0, 0, 0, 192, 30, 28, 1, 1
        };
        IntroMovie_StartWindowPanEffect(animCnt->window, 10, PM_LCD_TOP, &windowPan_narrowRightToLeft);

        IntroMovieBgWindowAnimParam windowPan_narrowLeftToRight = {
            0, 0, 255, 192, 255, 0, 255, 192, 30, 28, 1, 1
        };
        IntroMovie_StartWindowPanEffect(animCnt->window, 10, PM_LCD_BOTTOM, &windowPan_narrowLeftToRight);

        IntroMovie_StartBgScroll_VBlank(bgConfig, animCnt->scroll, GF_BG_LYR_SUB_1, 0xC0, 0, 10);
        IntroMovie_StartBgScroll_VBlank(bgConfig, animCnt->scroll, GF_BG_LYR_MAIN_1, -0xC0, 0, 10);
        IntroMovie_AdvanceSceneStep(data);
        break;
    }
    case INTRO_SCENE4_WAIT_SLIDE_OUT_PLAYERS:
        if (IntroMovie_WaitBgScrollAnim(animCnt->scroll, GF_BG_LYR_SUB_1) && IntroMovie_WaitBgScrollAnim(animCnt->scroll, GF_BG_LYR_MAIN_1)) {
            IntroMovie_StartSpriteAnimAndMakeVisible(sceneData->hand1Sprite, FALSE);
            IntroMovie_StartSpriteAnimAndMakeVisible(sceneData->hand2Sprite, FALSE);
            GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG1, GF_PLANE_TOGGLE_OFF);
            GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG1, GF_PLANE_TOGGLE_OFF);
            GX_SetVisibleWnd(GX_WNDMASK_NONE);
            GXS_SetVisibleWnd(0);
            IntroMovie_AdvanceSceneStep(data);
        }
        break;
    case INTRO_SCENE4_APPEAR_CHIKORITA:
        IntroMovie_StartSpriteAnimAndMakeVisible(sceneData->starterSprites[0], TRUE);
        IntroMovie_AdvanceSceneStep(data);
        break;
    case INTRO_SCENE4_START_GRASS_PARTICLES:
        IntroMovie_Scene4_StartParticleEmitters(sceneData, 0);
        IntroMovie_AdvanceSceneStep(data);
        break;
    case INTRO_SCENE4_RUN_GRASS_PARTICLES:
        if (!sub_020154B0(sceneData->particleSystem)) {
            IntroMovie_AdvanceSceneStep(data);
        }
        break;
    case INTRO_SCENE4_FINISH_CHIKORITA:
        IntroMovie_Scene4_FlipScreensAtNextVBlank(sceneData, 0);
        IntroMovie_AdvanceSceneStep(data);
        break;
    case INTRO_SCENE4_APPEAR_CYNDAQUIL:
        IntroMovie_StartSpriteAnimAndMakeVisible(sceneData->starterSprites[1], TRUE);
        IntroMovie_AdvanceSceneStep(data);
        break;
    case INTRO_SCENE4_START_FIRE_PARTICLES:
        IntroMovie_Scene4_StartParticleEmitters(sceneData, 1);
        IntroMovie_AdvanceSceneStep(data);
        break;
    case INTRO_SCENE4_RUN_FIRE_PARTICLES:
        if (!sub_020154B0(sceneData->particleSystem)) {
            IntroMovie_AdvanceSceneStep(data);
        }
        break;
    case INTRO_SCENE4_FINISH_CYNDAQUIL:
        IntroMovie_Scene4_FlipScreensAtNextVBlank(sceneData, 1);
        IntroMovie_AdvanceSceneStep(data);
        break;
    case INTRO_SCENE4_APPEAR_TOTODILE:
        IntroMovie_StartSpriteAnimAndMakeVisible(sceneData->starterSprites[2], TRUE);
        IntroMovie_AdvanceSceneStep(data);
        break;
    case INTRO_SCENE4_START_WATER_PARTICLES:
        IntroMovie_Scene4_StartParticleEmitters(sceneData, 2);
        IntroMovie_AdvanceSceneStep(data);
        break;
    case INTRO_SCENE4_RUN_WATER_PARTICLES:
        if (!sub_020154B0(sceneData->particleSystem)) {
            BeginNormalPaletteFade(0, 8, 8, RGB_BLACK, 26, 1, HEAP_ID_INTRO_MOVIE);
            IntroMovie_AdvanceSceneStep(data);
        }
        break;
    case INTRO_SCENE4_FINISH_TOTODILE:
        if (IsPaletteFadeFinished()) {
            GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG0, GF_PLANE_TOGGLE_OFF);
            GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG1, GF_PLANE_TOGGLE_OFF);
            GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG2, GF_PLANE_TOGGLE_OFF);
            GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG3, GF_PLANE_TOGGLE_OFF);
            GfGfx_EngineATogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_ON);
            for (u8 i = 0; i < 3; ++i) {
                IntroMovie_StartSpriteAnimAndMakeVisible(sceneData->starterSprites[i], FALSE);
            }
            IntroMovie_AdvanceSceneStep(data);
        }
        break;
    case INTRO_SCENE4_SPARKLE:
        SetMasterBrightnessNeutral(PM_LCD_TOP);
        IntroMovie_StartSpriteAnimAndMakeVisible(sceneData->sparklesSprite, TRUE);
        IntroMovie_AdvanceSceneStep(data);
        break;
    case INTRO_SCENE4_WAIT_SPARKLE:
        if (!Sprite_IsAnimated(sceneData->sparklesSprite)) {
            return TRUE;
        }
        break;
    }

    IntroMovie_Scene4_3DMain();
    return FALSE;
}

static void IntroMovie_Scene4_Exit(IntroMovieOverlayData *data, IntroMovieScene4Data *sceneData) {
    BgConfig *bgConfig = IntroMovie_GetBgConfig(data);
    Main_SetVBlankIntrCB(NULL, NULL);
    if (sceneData->needFreeGfx) {
        G2_BlendNone();
        sub_02014EBC(sceneData->particleSystem);
        Heap_Free(sceneData->particleHeap);
        GF_3DVramMan_Delete(sceneData->gf3dVramMan);
        IntroMovie_Scene4_DestroySprites(data, sceneData);
        FreeBgTilemapBuffer(bgConfig, GF_BG_LYR_MAIN_1);
        FreeBgTilemapBuffer(bgConfig, GF_BG_LYR_MAIN_2);
        FreeBgTilemapBuffer(bgConfig, GF_BG_LYR_MAIN_3);
        FreeBgTilemapBuffer(bgConfig, GF_BG_LYR_SUB_1);
        FreeBgTilemapBuffer(bgConfig, GF_BG_LYR_SUB_2);
        FreeBgTilemapBuffer(bgConfig, GF_BG_LYR_SUB_3);
        sceneData->needFreeGfx = FALSE;
    }
    if (sceneData->flipScreensTask != NULL) {
        SysTask_Destroy(sceneData->flipScreensTask);
        sceneData->flipScreensTask = NULL;
    }
}

static void IntroMovie_Scene4_InitBgs(IntroMovieOverlayData *data) {
    BgConfig *bgConfig = IntroMovie_GetBgConfig(data);

    {
        GraphicsModes graphicsModes = {
            GX_DISPMODE_GRAPHICS,
            GX_BGMODE_0,
            GX_BGMODE_0,
            GX_BG0_AS_3D,
        };
        SetBothScreensModesAndDisable(&graphicsModes);
    }

    {
        BgTemplate bgTemplate = {
            .x = 0, .y = 0, .bufferSize = GF_BG_BUF_SIZE_256x256_4BPP, .baseTile = 0, .size = GF_BG_SCR_SIZE_256x256, .colorMode = GX_BG_COLORMODE_16, .screenBase = GX_BG_SCRBASE_0x0000, .charBase = GX_BG_CHARBASE_0x04000, .bgExtPltt = GX_BG_EXTPLTT_01, .priority = 1, .areaOver = GX_BG_AREAOVER_XLU, .mosaic = FALSE
        };
        InitBgFromTemplate(bgConfig, GF_BG_LYR_MAIN_1, &bgTemplate, 0);
    }

    {
        BgTemplate bgTemplate = {
            .x = 0, .y = 0, .bufferSize = GF_BG_BUF_SIZE_256x256_4BPP, .baseTile = 0, .size = GF_BG_SCR_SIZE_256x256, .colorMode = GX_BG_COLORMODE_16, .screenBase = GX_BG_SCRBASE_0x0800, .charBase = GX_BG_CHARBASE_0x04000, .bgExtPltt = GX_BG_EXTPLTT_01, .priority = 2, .areaOver = GX_BG_AREAOVER_XLU, .mosaic = FALSE
        };
        InitBgFromTemplate(bgConfig, GF_BG_LYR_MAIN_2, &bgTemplate, 0);
    }

    {
        BgTemplate bgTemplate = {
            .x = 0, .y = 0, .bufferSize = GF_BG_BUF_SIZE_256x256_4BPP, .baseTile = 0, .size = GF_BG_SCR_SIZE_256x256, .colorMode = GX_BG_COLORMODE_16, .screenBase = GX_BG_SCRBASE_0x1000, .charBase = GX_BG_CHARBASE_0x04000, .bgExtPltt = GX_BG_EXTPLTT_01, .priority = 3, .areaOver = GX_BG_AREAOVER_XLU, .mosaic = FALSE
        };
        InitBgFromTemplate(bgConfig, GF_BG_LYR_MAIN_3, &bgTemplate, 0);
    }

    {
        BgTemplate bgTemplate = {
            .x = 0, .y = 0, .bufferSize = GF_BG_BUF_SIZE_256x256_4BPP, .baseTile = 0, .size = GF_BG_SCR_SIZE_256x256, .colorMode = GX_BG_COLORMODE_16, .screenBase = GX_BG_SCRBASE_0x0000, .charBase = GX_BG_CHARBASE_0x04000, .bgExtPltt = GX_BG_EXTPLTT_01, .priority = 1, .areaOver = GX_BG_AREAOVER_XLU, .mosaic = FALSE
        };
        InitBgFromTemplate(bgConfig, GF_BG_LYR_SUB_1, &bgTemplate, 0);
    }

    {
        BgTemplate bgTemplate = {
            .x = 0, .y = 0, .bufferSize = GF_BG_BUF_SIZE_256x256_4BPP, .baseTile = 0, .size = GF_BG_SCR_SIZE_256x256, .colorMode = GX_BG_COLORMODE_16, .screenBase = GX_BG_SCRBASE_0x0800, .charBase = GX_BG_CHARBASE_0x04000, .bgExtPltt = GX_BG_EXTPLTT_01, .priority = 2, .areaOver = GX_BG_AREAOVER_XLU, .mosaic = FALSE
        };
        InitBgFromTemplate(bgConfig, GF_BG_LYR_SUB_2, &bgTemplate, 0);
    }

    {
        BgTemplate bgTemplate = {
            .x = 0, .y = 0, .bufferSize = GF_BG_BUF_SIZE_256x256_4BPP, .baseTile = 0, .size = GF_BG_SCR_SIZE_256x256, .colorMode = GX_BG_COLORMODE_16, .screenBase = GX_BG_SCRBASE_0x1000, .charBase = GX_BG_CHARBASE_0x04000, .bgExtPltt = GX_BG_EXTPLTT_01, .priority = 3, .areaOver = GX_BG_AREAOVER_XLU, .mosaic = FALSE
        };
        InitBgFromTemplate(bgConfig, GF_BG_LYR_SUB_3, &bgTemplate, 0);
    }
}

static void InroMovie_Scene4_LoadBgGfx(BgConfig *bgConfig, IntroMovieScene4Data *sceneData) {
    GfGfxLoader_LoadCharData(NARC_demo_opening_gs_opening, NARC_gs_opening_gs_opening_00000054_NCGR_lz, bgConfig, GF_BG_LYR_MAIN_1, 0, 0, TRUE, HEAP_ID_INTRO_MOVIE);
    GfGfxLoader_LoadCharData(NARC_demo_opening_gs_opening, NARC_gs_opening_gs_opening_00000054_NCGR_lz, bgConfig, GF_BG_LYR_SUB_1, 0, 0, TRUE, HEAP_ID_INTRO_MOVIE);
    GfGfxLoader_LoadScrnData(NARC_demo_opening_gs_opening, NARC_gs_opening_gs_opening_00000058_NSCR_lz, bgConfig, GF_BG_LYR_MAIN_1, 0, 0, TRUE, HEAP_ID_INTRO_MOVIE);
    GfGfxLoader_LoadScrnData(NARC_demo_opening_gs_opening, NARC_gs_opening_gs_opening_00000055_NSCR_lz, bgConfig, GF_BG_LYR_MAIN_2, 0, 0, TRUE, HEAP_ID_INTRO_MOVIE);
    GfGfxLoader_LoadScrnData(NARC_demo_opening_gs_opening, NARC_gs_opening_gs_opening_00000056_NSCR_lz, bgConfig, GF_BG_LYR_MAIN_3, 0, 0, TRUE, HEAP_ID_INTRO_MOVIE);
    GfGfxLoader_LoadScrnData(NARC_demo_opening_gs_opening, NARC_gs_opening_gs_opening_00000057_NSCR_lz, bgConfig, GF_BG_LYR_SUB_1, 0, 0, TRUE, HEAP_ID_INTRO_MOVIE);
    GfGfxLoader_LoadScrnData(NARC_demo_opening_gs_opening, NARC_gs_opening_gs_opening_00000055_NSCR_lz, bgConfig, GF_BG_LYR_SUB_2, 0, 0, TRUE, HEAP_ID_INTRO_MOVIE);
    GfGfxLoader_LoadScrnData(NARC_demo_opening_gs_opening, NARC_gs_opening_gs_opening_00000056_NSCR_lz, bgConfig, GF_BG_LYR_SUB_3, 0, 0, TRUE, HEAP_ID_INTRO_MOVIE);
    GfGfxLoader_GXLoadPal(NARC_demo_opening_gs_opening, NARC_gs_opening_gs_opening_00000053_NCLR, GF_PAL_LOCATION_MAIN_BG, (enum GFPalSlotOffset)0, 0x80, HEAP_ID_INTRO_MOVIE);
    GfGfxLoader_GXLoadPal(NARC_demo_opening_gs_opening, NARC_gs_opening_gs_opening_00000053_NCLR, GF_PAL_LOCATION_SUB_BG, (enum GFPalSlotOffset)0, 0x80, HEAP_ID_INTRO_MOVIE);
    OS_WaitIrq(TRUE, OS_IE_V_BLANK);
    GfGfx_BothDispOn();
}

static void IntroMovie_Scene4_EnableBgLayers(IntroMovieOverlayData *data, BgConfig *bgConfig) {
    IntroMovieBgLinearAnims *animCnt = IntroMovie_GetBgLinearAnimsController(data);
    IntroMovie_StartBgScroll_VBlank(bgConfig, animCnt->scroll, GF_BG_LYR_SUB_1, -0xC0, 0, 0);
    IntroMovie_StartBgScroll_VBlank(bgConfig, animCnt->scroll, GF_BG_LYR_MAIN_1, 0xC0, 0, 0);
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG2, GF_PLANE_TOGGLE_OFF);
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG1, GF_PLANE_TOGGLE_OFF);
    GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG1, GF_PLANE_TOGGLE_OFF);
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG0, GF_PLANE_TOGGLE_ON);
}

static void IntroMovie_Scene4_LoadSpriteGfx(IntroMovieOverlayData *data, IntroMovieScene4Data *sceneData) {
    int monSpritePltt[3] = {
        NARC_gs_opening_gs_opening_00000085_NCLR,
        NARC_gs_opening_gs_opening_00000093_NCLR,
        NARC_gs_opening_gs_opening_00000089_NCLR,
    };
    int monSpriteChar[3] = {
        NARC_gs_opening_gs_opening_00000086_NCGR_lz,
        NARC_gs_opening_gs_opening_00000094_NCGR_lz,
        NARC_gs_opening_gs_opening_00000090_NCGR_lz,
    };
    int monSpriteAnim[3] = {
        NARC_gs_opening_gs_opening_00000087_NANR_lz,
        NARC_gs_opening_gs_opening_00000095_NANR_lz,
        NARC_gs_opening_gs_opening_00000091_NANR_lz,
    };
    int monSpriteCell[3] = {
        NARC_gs_opening_gs_opening_00000088_NCER_lz,
        NARC_gs_opening_gs_opening_00000096_NCER_lz,
        NARC_gs_opening_gs_opening_00000092_NCER_lz,
    };
    int sp18[3] = { 1, 2, 3 };
    u8 i;
    GF_2DGfxResMan **resMen;

    IntroMovie_CreateSpriteResourceManagers(data, sIntroMovieScene4SpriteResCounts);
    resMen = IntroMovie_GetSpriteResourceManagersArray(data);
    sceneData->spriteResObjs[0][GF_GFX_RES_TYPE_CHAR] = AddCharResObjFromNarc(resMen[GF_GFX_RES_TYPE_CHAR], NARC_demo_opening_gs_opening, NARC_gs_opening_gs_opening_00000082_NCGR_lz, TRUE, 0, NNS_G2D_VRAM_TYPE_2DBOTH, HEAP_ID_INTRO_MOVIE);
    sceneData->spriteResObjs[0][GF_GFX_RES_TYPE_PLTT] = AddPlttResObjFromNarc(resMen[GF_GFX_RES_TYPE_PLTT], NARC_demo_opening_gs_opening, NARC_gs_opening_gs_opening_00000081_NCLR, FALSE, 0, NNS_G2D_VRAM_TYPE_2DBOTH, 2, HEAP_ID_INTRO_MOVIE);
    sceneData->spriteResObjs[0][GF_GFX_RES_TYPE_CELL] = AddCellOrAnimResObjFromNarc(resMen[GF_GFX_RES_TYPE_CELL], NARC_demo_opening_gs_opening, NARC_gs_opening_gs_opening_00000084_NCER_lz, TRUE, 0, GF_GFX_RES_TYPE_CELL, HEAP_ID_INTRO_MOVIE);
    sceneData->spriteResObjs[0][GF_GFX_RES_TYPE_ANIM] = AddCellOrAnimResObjFromNarc(resMen[GF_GFX_RES_TYPE_ANIM], NARC_demo_opening_gs_opening, NARC_gs_opening_gs_opening_00000083_NANR_lz, TRUE, 0, GF_GFX_RES_TYPE_ANIM, HEAP_ID_INTRO_MOVIE);

    for (i = 0; i < 3; ++i) {
        s32 id = sp18[i];
        sceneData->spriteResObjs[i + 1][GF_GFX_RES_TYPE_CHAR] = AddCharResObjFromNarc(resMen[GF_GFX_RES_TYPE_CHAR], NARC_demo_opening_gs_opening, monSpriteChar[i], TRUE, id, NNS_G2D_VRAM_TYPE_2DMAIN, HEAP_ID_INTRO_MOVIE);
        sceneData->spriteResObjs[i + 1][GF_GFX_RES_TYPE_PLTT] = AddPlttResObjFromNarc(resMen[GF_GFX_RES_TYPE_PLTT], NARC_demo_opening_gs_opening, monSpritePltt[i], FALSE, id, NNS_G2D_VRAM_TYPE_2DMAIN, 1, HEAP_ID_INTRO_MOVIE);
        sceneData->spriteResObjs[i + 1][GF_GFX_RES_TYPE_CELL] = AddCellOrAnimResObjFromNarc(resMen[GF_GFX_RES_TYPE_CELL], NARC_demo_opening_gs_opening, monSpriteCell[i], TRUE, id, GF_GFX_RES_TYPE_CELL, HEAP_ID_INTRO_MOVIE);
        sceneData->spriteResObjs[i + 1][GF_GFX_RES_TYPE_ANIM] = AddCellOrAnimResObjFromNarc(resMen[GF_GFX_RES_TYPE_ANIM], NARC_demo_opening_gs_opening, monSpriteAnim[i], TRUE, id, GF_GFX_RES_TYPE_ANIM, HEAP_ID_INTRO_MOVIE);
    }

    for (i = 0; i < 4; ++i) {
        sub_0200ACF0(sceneData->spriteResObjs[i][GF_GFX_RES_TYPE_CHAR]);
        sub_0200AF94(sceneData->spriteResObjs[i][GF_GFX_RES_TYPE_PLTT]);
    }

    GfGfx_EngineATogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_ON);
    GfGfx_EngineBTogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_ON);
}

static void IntroMovie_Scene4_DestroySprites(IntroMovieOverlayData *data, IntroMovieScene4Data *sceneData) {
    Sprite_Delete(sceneData->hand1Sprite);
    Sprite_Delete(sceneData->hand2Sprite);
    Sprite_Delete(sceneData->sparklesSprite);
    for (u8 i = 0; i < 3; ++i) {
        Sprite_Delete(sceneData->starterSprites[i]);
    }
    for (u8 i = 0; i < 4; ++i) {
        sub_0200AEB0(sceneData->spriteResObjs[i][GF_GFX_RES_TYPE_CHAR]);
        sub_0200B0A8(sceneData->spriteResObjs[i][GF_GFX_RES_TYPE_PLTT]);
    }
    IntroMovie_DestroySpriteResourceManagers(data);
}

static void IntroMovie_Scene4_CreateSprites(IntroMovieOverlayData *data, IntroMovieScene4Data *sceneData) {
    SpriteResourcesHeader header;
    SpriteTemplate template;
    int monSpriteResIds[3] = { 1, 2, 3 };

    IntroMovie_BuildSpriteResourcesHeaderAndTemplate(0, data, 0, NNS_G2D_VRAM_TYPE_2DSUB, &template, &header);
    template.position.x = FX32_ONE * 128;
    template.position.y = FX32_ONE * (0x100 + 96);
    sceneData->hand1Sprite = Sprite_CreateAffine(&template);
    Sprite_SetAnimActiveFlag(sceneData->hand1Sprite, FALSE);
    Sprite_SetDrawFlag(sceneData->hand1Sprite, FALSE);
    Sprite_SetAnimCtrlSeq(sceneData->hand1Sprite, 0);

    IntroMovie_BuildSpriteResourcesHeaderAndTemplate(0, data, 0, NNS_G2D_VRAM_TYPE_2DMAIN, &template, &header);
    template.position.x = FX32_ONE * 128;
    template.position.y = FX32_ONE * 96;
    sceneData->hand2Sprite = Sprite_CreateAffine(&template);
    Sprite_SetAnimActiveFlag(sceneData->hand2Sprite, FALSE);
    Sprite_SetDrawFlag(sceneData->hand2Sprite, FALSE);
    Sprite_SetAnimCtrlSeq(sceneData->hand2Sprite, 1);

    IntroMovie_BuildSpriteResourcesHeaderAndTemplate(0, data, 0, NNS_G2D_VRAM_TYPE_2DMAIN, &template, &header);
    template.position.x = FX32_ONE * 128;
    template.position.y = FX32_ONE * 96;
    sceneData->sparklesSprite = Sprite_CreateAffine(&template);
    Sprite_SetAnimActiveFlag(sceneData->sparklesSprite, FALSE);
    Sprite_SetDrawFlag(sceneData->sparklesSprite, FALSE);
    Sprite_SetAnimCtrlSeq(sceneData->sparklesSprite, 2);

    for (u8 i = 0; i < 3; ++i) {
        IntroMovie_BuildSpriteResourcesHeaderAndTemplate(monSpriteResIds[i], data, 0, NNS_G2D_VRAM_TYPE_2DMAIN, &template, &header);
        template.position.x = FX32_ONE * 128;
        template.position.y = FX32_ONE * 96;
        sceneData->starterSprites[i] = Sprite_CreateAffine(&template);
        Sprite_SetAnimActiveFlag(sceneData->starterSprites[i], FALSE);
        Sprite_SetDrawFlag(sceneData->starterSprites[i], FALSE);
        Sprite_SetAnimCtrlSeq(sceneData->starterSprites[i], 0);
    }
}

static u32 IntroMovie_Scene4_TexAlloc(u32 size, BOOL is4x4comp) {
    NNSGfdTexKey key = NNS_GfdAllocTexVram(size, is4x4comp, 0);
    sub_02015354(key);
    GF_ASSERT(key != NNS_GFD_ALLOC_ERROR_TEXKEY);
    return NNS_GfdGetTexKeyAddr(key);
}

static u32 IntroMovie_Scene4_PlttAlloc(u32 size, BOOL is4pltt) {
    NNSGfdPlttKey key = NNS_GfdAllocPlttVram(size, is4pltt, 1);
    GF_ASSERT(key != NNS_GFD_ALLOC_ERROR_PLTTKEY);
    sub_02015394(key);
    return NNS_GfdGetPlttKeyAddr(key);
}

static void IntroMovie_Scene4_SPLEmitterCB(struct SPLEmitter *emitter) {
    VecFx32 pos = { 0, 0, 0 };
    SetVec(pos, 0, 0, FX32_CONST(0.015625));

    SPL_SetEmitterPositionX(emitter, pos.x);
    SPL_SetEmitterPositionY(emitter, pos.y);
    SPL_SetEmitterPositionZ(emitter, pos.z);
}

static void IntroMovie_Scene4_3DMain(void) {
    Thunk_G3X_Reset();
    sub_0201543C();
    sub_02015460();
    RequestSwap3DBuffers(GX_SORTMODE_MANUAL, GX_BUFFERMODE_Z);
}

static void IntroMovie_Scene4_StartParticleEmitters(IntroMovieScene4Data *sceneData, int whichStarter) {
    sub_02015528(sceneData->particleSystem, 1);
    sub_02015494(sceneData->particleSystem, sStarterParticleResIds[whichStarter][0], IntroMovie_Scene4_SPLEmitterCB, NULL);
    sub_02015494(sceneData->particleSystem, sStarterParticleResIds[whichStarter][1], IntroMovie_Scene4_SPLEmitterCB, NULL);
    sub_02015494(sceneData->particleSystem, sStarterParticleResIds[whichStarter][2], IntroMovie_Scene4_SPLEmitterCB, NULL);
}

static void IntroMovie_Scene4_3DVRamManInit(void) {
    G2_SetBG0Priority(0);
    G3X_SetShading(GX_SHADING_TOON);
    G3X_AntiAlias(TRUE);
    G3X_AlphaTest(FALSE, 0);
    G3X_AlphaBlend(TRUE);
    G3X_EdgeMarking(FALSE);
    G3X_SetFog(FALSE, GX_FOGBLEND_COLOR_ALPHA, GX_FOGSLOPE_0x8000, 0);
    G3X_SetClearColor(RGB_BLACK, 0, 0x7FFF, 0x3F, FALSE);
    G3_ViewPort(0, 0, 255, 191);
}

static void IntroMovie_Scene4_FlipScreensAtNextVBlank(IntroMovieScene4Data *sceneData, int whichScreen) {
    sceneData->flipScreensTaskArg = whichScreen;
    sceneData->flipScreensTask = SysTask_CreateOnVBlankQueue(Task_IntroMovie_Scene4_FlipScreens, sceneData, 0);
}

static void Task_IntroMovie_Scene4_FlipScreens(SysTask *task, void *pVoid) {
    IntroMovieScene4Data *sceneData = (IntroMovieScene4Data *)pVoid;

    if (sceneData->flipScreensTaskArg) {
        gSystem.screensFlipped = TRUE;
        GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG2, GF_PLANE_TOGGLE_OFF);
        GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG3, GF_PLANE_TOGGLE_ON);
        GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG2, GF_PLANE_TOGGLE_ON);
        GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG3, GF_PLANE_TOGGLE_OFF);
    } else {
        gSystem.screensFlipped = FALSE;
        GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG2, GF_PLANE_TOGGLE_ON);
        GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG3, GF_PLANE_TOGGLE_OFF);
        GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG2, GF_PLANE_TOGGLE_OFF);
        GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG3, GF_PLANE_TOGGLE_ON);
    }
    GfGfx_SwapDisplay();
    SysTask_Destroy(sceneData->flipScreensTask);
    sceneData->flipScreensTask = NULL;
}

HeapID _deadstrip_04(int idx);
HeapID _deadstrip_04(int idx) {
    static const HeapID sDeadstrippedRodata[1] = { HEAP_ID_INTRO_MOVIE };
    return sDeadstrippedRodata[idx];
}
