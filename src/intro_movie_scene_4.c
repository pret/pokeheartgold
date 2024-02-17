#include "global.h"
#include "intro_movie_internal.h"
#include "system.h"
#include "unk_0200B150.h"
#include "unk_0200FA24.h"
#include "unk_020215A0.h"
#include "unk_02022588.h"

void IntroMovie_Scene4_VBlankCB(void *pVoid);
void IntroMovie_Scene4_Init(IntroMovieOvyData *data, IntroMovieScene4Data *sceneData);
BOOL IntroMovie_Scene4_Main(IntroMovieOvyData *data, IntroMovieScene4Data *sceneData, int totalFrames);
void IntroMovie_Scene4_Exit(IntroMovieOvyData *data, IntroMovieScene4Data *sceneData);
void ov60_021EA2A0(IntroMovieOvyData *data);
void ov60_021EA3A0(BgConfig *bgConfig, IntroMovieScene4Data *sceneData);
void ov60_021EA4AC(IntroMovieOvyData *data, BgConfig *bgConfig);
void ov60_021EA508(IntroMovieOvyData *data, IntroMovieScene4Data *sceneData);
void ov60_021EA700(IntroMovieOvyData *data, IntroMovieScene4Data *sceneData);
u32 ov60_021EA828(u32 size, BOOL is4x4comp);
u32 ov60_021EA84C(u32 size, BOOL is4pltt);
void ov60_021EA8B0(void);
void ov60_021EA8C8(IntroMovieScene4Data *sceneData, int whichStarter);
void ov60_021EA918(void);
void ov60_021EA990(IntroMovieScene4Data *sceneData, int whichStarter);

BOOL IntroMovie_Scene4(IntroMovieOvyData *data, void *pVoid) {
    IntroMovieScene4Data *sceneData = (IntroMovieScene4Data *)pVoid;

    if (IntroMovie_GetIntroSkippedFlag(data)) {
        sceneData->state = 2;
    }

    switch (sceneData->state) {
    case 0:
        IntroMovie_Scene4_Init(data, sceneData);
        ++sceneData->state;
        break;
    case 1:
        if (IntroMovie_Scene4_Main(data, sceneData, IntroMovie_GetTotalFrameCount(data))) {
            ++sceneData->state;
        }
        break;
    case 2:
        IntroMovie_Scene4_Exit(data, sceneData);
        return TRUE;
    }

    return FALSE;
}

void IntroMovie_Scene4_VBlankCB(void *pVoid) {
    IntroMovieOvyData *data = (IntroMovieOvyData *)pVoid;

    DoScheduledBgGpuUpdates(IntroMovie_GetBgConfig(data));
    OamManager_ApplyAndResetBuffers();
}

void IntroMovie_Scene4_Init(IntroMovieOvyData *data, IntroMovieScene4Data *sceneData) {
    BgConfig *bgConfig = IntroMovie_GetBgConfig(data);
    sub_020216C8();
    sub_02022638();
    gSystem.screensFlipped = TRUE;
    GfGfx_SwapDisplay();
    sub_0200FBF4(PM_LCD_TOP, RGB_BLACK);
    sub_0200FBF4(PM_LCD_BOTTOM, RGB_BLACK);
    ov60_021EA2A0(data);
    IntroMovie_InitBgAnimGxState(data);
    Main_SetVBlankIntrCB(IntroMovie_Scene4_VBlankCB, data);
    ov60_021EA3A0(bgConfig, sceneData);
    IntroMovie_RendererSetSurfaceCoords(data, 0, 0, 0, FX32_CONST(0.0625));
    ov60_021EA508(data, sceneData);
    ov60_021EA700(data, sceneData);
    sceneData->unk_05C = GF_3DVramMan_Create(HEAP_ID_INTRO_MOVIE, 0, 1, 0, 4, ov60_021EA918);
    sub_02014DA0();
    sceneData->unk_060 = AllocFromHeap(HEAP_ID_INTRO_MOVIE, 0x4800);
    sceneData->unk_064 = sub_02014DB4(ov60_021EA828, ov60_021EA84C, sceneData->unk_060, 0x4800, TRUE, HEAP_ID_INTRO_MOVIE);
    Camera_SetPerspectiveClippingPlane(FX32_CONST(1), FX32_CONST(900), sub_02015524(sceneData->unk_064));
    sub_0201526C(sceneData->unk_064, sub_02015264(NARC_a_0_5_9, 4, HEAP_ID_INTRO_MOVIE), 0x0A, TRUE);
    ov60_021EA4AC(data, bgConfig);
    G2_SetBlendAlpha(0, 0x3E, 0, 0);
    sceneData->unk_001 = TRUE;
}

BOOL IntroMovie_Scene4_Main(IntroMovieOvyData *data, IntroMovieScene4Data *sceneData, int totalFrames) {
    BgConfig *bgConfig = IntroMovie_GetBgConfig(data);
    IntroMovieBgLinearAnims *animCnt = IntroMovie_GetBgLinearAnimsController(data);
    u8 stepTimer = IntroMovie_GetSceneStepTimer(data);
    switch (IntroMovie_GetSceneStep(data)) {
    case 0:
        BeginNormalPaletteFade(0, 9, 9, RGB_BLACK, 10, 1, HEAP_ID_INTRO_MOVIE);
        IntroMovie_AdvanceSceneStep(data);
        break;
    case 1:
        if (IsPaletteFadeFinished()) {
            IntroMovie_AdvanceSceneStep(data);
        }
        break;
    case 2: {
        extern const IntroMovieBgWindowAnimParam _021EB73C;
        IntroMovieBgWindowAnimParam sp94 = _021EB73C;
        IntroMovie_StartWindowPanEffect(animCnt->window, 10, PM_LCD_TOP, &sp94);

        extern const IntroMovieBgWindowAnimParam _021EB768;
        IntroMovieBgWindowAnimParam sp68 = _021EB768;
        IntroMovie_StartWindowPanEffect(animCnt->window, 10, PM_LCD_BOTTOM, &sp68);

        IntroMovie_StartBgScroll_VBlank(bgConfig, animCnt->scroll, GF_BG_LYR_SUB_1, 0xC0, 0, 10);
        IntroMovie_StartBgScroll_VBlank(bgConfig, animCnt->scroll, GF_BG_LYR_MAIN_1, -0xC0, 0, 10);
        IntroMovie_StartSpriteAnimAndMakeVisible(sceneData->unk_044, TRUE);
        IntroMovie_StartSpriteAnimAndMakeVisible(sceneData->unk_048, TRUE);
        GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG1, GF_PLANE_TOGGLE_ON);
        GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG1, GF_PLANE_TOGGLE_ON);
        IntroMovie_AdvanceSceneStep(data);
        break;
    }
    case 3:
        if (IntroMovie_WaitBgScrollAnim(animCnt->scroll, GF_BG_LYR_SUB_1) && IntroMovie_WaitBgScrollAnim(animCnt->scroll, GF_BG_LYR_MAIN_1)) {
            IntroMovie_AdvanceSceneStep(data);
        }
        break;
    case 4:
        if (stepTimer > 25) {
            IntroMovie_AdvanceSceneStep(data);
        }
        break;
    case 5: {
        extern const IntroMovieBgWindowAnimParam _021EB794;
        IntroMovieBgWindowAnimParam sp3C = _021EB794;
        IntroMovie_StartWindowPanEffect(animCnt->window, 10, PM_LCD_TOP, &sp3C);

        extern const IntroMovieBgWindowAnimParam _021EB710;
        IntroMovieBgWindowAnimParam sp10 = _021EB710;
        IntroMovie_StartWindowPanEffect(animCnt->window, 10, PM_LCD_BOTTOM, &sp10);

        IntroMovie_StartBgScroll_VBlank(bgConfig, animCnt->scroll, GF_BG_LYR_SUB_1, 0xC0, 0, 10);
        IntroMovie_StartBgScroll_VBlank(bgConfig, animCnt->scroll, GF_BG_LYR_MAIN_1, -0xC0, 0, 10);
        IntroMovie_AdvanceSceneStep(data);
        break;
    }
    case 6:
        if (IntroMovie_WaitBgScrollAnim(animCnt->scroll, GF_BG_LYR_SUB_1) && IntroMovie_WaitBgScrollAnim(animCnt->scroll, GF_BG_LYR_MAIN_1)) {
            IntroMovie_StartSpriteAnimAndMakeVisible(sceneData->unk_044, FALSE);
            IntroMovie_StartSpriteAnimAndMakeVisible(sceneData->unk_048, FALSE);
            GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG1, GF_PLANE_TOGGLE_OFF);
            GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG1, GF_PLANE_TOGGLE_OFF);
            GX_SetVisibleWnd(0);
            GXS_SetVisibleWnd(0);
            IntroMovie_AdvanceSceneStep(data);
        }
        break;
    case 7:
        IntroMovie_StartSpriteAnimAndMakeVisible(sceneData->unk_050[0], TRUE);
        IntroMovie_AdvanceSceneStep(data);
        break;
    case 8:
        ov60_021EA8C8(sceneData, 0);
        IntroMovie_AdvanceSceneStep(data);
        break;
    case 9:
        if (!sub_020154B0(sceneData->unk_064)) {
            IntroMovie_AdvanceSceneStep(data);
        }
        break;
    case 10:
        ov60_021EA990(sceneData, 0);
        IntroMovie_AdvanceSceneStep(data);
        break;
    case 11:
        IntroMovie_StartSpriteAnimAndMakeVisible(sceneData->unk_050[1], TRUE);
        IntroMovie_AdvanceSceneStep(data);
        break;
    case 12:
        ov60_021EA8C8(sceneData, 1);
        IntroMovie_AdvanceSceneStep(data);
        break;
    case 13:
        if (!sub_020154B0(sceneData->unk_064)) {
            IntroMovie_AdvanceSceneStep(data);
        }
        break;
    case 14:
        ov60_021EA990(sceneData, 1);
        IntroMovie_AdvanceSceneStep(data);
        break;
    case 15:
        IntroMovie_StartSpriteAnimAndMakeVisible(sceneData->unk_050[2], TRUE);
        IntroMovie_AdvanceSceneStep(data);
        break;
    case 16:
        ov60_021EA8C8(sceneData, 2);
        IntroMovie_AdvanceSceneStep(data);
        break;
    case 17:
        if (!sub_020154B0(sceneData->unk_064)) {
            BeginNormalPaletteFade(0, 8, 8, RGB_BLACK, 26, 1, HEAP_ID_INTRO_MOVIE);
            IntroMovie_AdvanceSceneStep(data);
        }
        break;
    case 18:
        if (IsPaletteFadeFinished()) {
            GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG0, GF_PLANE_TOGGLE_OFF);
            GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG1, GF_PLANE_TOGGLE_OFF);
            GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG2, GF_PLANE_TOGGLE_OFF);
            GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG3, GF_PLANE_TOGGLE_OFF);
            GfGfx_EngineATogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_ON);
            for (u8 i = 0; i < 3; ++i) {
                IntroMovie_StartSpriteAnimAndMakeVisible(sceneData->unk_050[i], FALSE);
            }
            IntroMovie_AdvanceSceneStep(data);
        }
        break;
    case 19:
        SetMasterBrightnessNeutral(PM_LCD_TOP);
        IntroMovie_StartSpriteAnimAndMakeVisible(sceneData->unk_04C, TRUE);
        IntroMovie_AdvanceSceneStep(data);
        break;
    case 20:
        if (!Sprite_IsCellAnimationRunning(sceneData->unk_04C)) {
            return TRUE;
        }
        break;
    }

    ov60_021EA8B0();
    return FALSE;
}
