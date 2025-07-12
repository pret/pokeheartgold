#include "global.h"

#include "demo/opening/gs_opening.naix"

#include "gf_3d_render.h"
#include "gf_gfx_loader.h"
#include "intro_movie_internal.h"
#include "obj_char_transfer.h"
#include "obj_pltt_transfer.h"
#include "system.h"
#include "unk_0200ACF0.h"
#include "unk_0200B150.h"
#include "unk_0200FA24.h"
#include "unk_02026E30.h"

enum IntroScene3State {
    INTRO_SCENE3_LOAD_NEWBARK,
    INTRO_SCENE3_SHOW_NEWBARK,
    INTRO_SCENE3_LOAD_GOLDENROD,
    INTRO_SCENE3_SHOW_GOLDENROD,
    INTRO_SCENE3_LOAD_ECRUTEAK,
    INTRO_SCENE3_WAIT_ECRUTEAK,
    INTRO_SCENE3_END_3DRENDER,
    INTRO_SCENE3_APPEAR_RIVAL,
    INTRO_SCENE3_WAIT_APPEAR_RIVAL,
    INTRO_SCENE3_DRAMATIC_RIVAL_PANELS,
    INTRO_SCENE3_REMOVE_RIVAL_PANEL_BORDERS,
    INTRO_SCENE3_CINEMATIC_ASPECT_RIVAL,
    INTRO_SCENE3_APPEAR_ENTEI,
    INTRO_SCENE3_APPEAR_RAIKOU,
    INTRO_SCENE3_LOAD_ROCKETS,
    INTRO_SCENE3_NARROW_WINDOWS,
    INTRO_SCENE3_WAIT_NARROW,
    INTRO_SCENE3_SPRITES_VISIBLE,
    INTRO_SCENE3_WAIT_ENTEI_EXIT,
    INTRO_SCENE3_UNOWN_RAIKOU_EXIT,
    INTRO_SCENE3_LOAD_ROCKET_SCRNDATA,
    INTRO_SCENE3_UNOWN_SUICUNE_EXIT,
    INTRO_SCENE3_EXPAND_ROCKET_VIEWPORT,
    INTRO_SCENE3_WAIT_ADMINS,
};

static void IntroMovie_Scene3_VBlankCB(void *pVoid);
static void IntroMovie_Scene3_Init(IntroMovieOverlayData *data, IntroMovieScene3Data *sceneData);
static void IntroMovie_Scene3_Show2DGfx(IntroMovieScene3Data *sceneData, BgConfig *bgConfig);
static BOOL IntroMovie_Scene3_Main(IntroMovieOverlayData *data, IntroMovieScene3Data *sceneData, int totalFrames);
static void IntroMovie_Scene3_Exit(IntroMovieOverlayData *data, IntroMovieScene3Data *sceneData);
static void IntroMovie_Scene3_InitBGLayers(IntroMovieOverlayData *data);
static void IntroMovie_Scene3_LoadBGGraphics(BgConfig *bgConfig, IntroMovieScene3Data *sceneData);
static void IntroMovie_Scene3_LoadOBJGraphics(IntroMovieOverlayData *data, IntroMovieScene3Data *sceneData);
static void IntroMovie_Scene3_UnloadOBJGraphics(IntroMovieOverlayData *data, IntroMovieScene3Data *sceneData);
static void IntroMovie_Scene3_CreateSprites(IntroMovieOverlayData *data, IntroMovieScene3Data *sceneData);
static void IntroMovie_Scene3_Load3dGfxData(IntroMovieScene3Data *sceneData);
static void IntroMovie_Scene3_Animate3DMap(IntroMovieScene3Data *sceneData);
static void IntroMovie_Scene3_3DVRamManInit(void);
static void IntroMovie_Scene3_SetMapLightingAndColorParams(u8 a0);

static const u8 sIntroMovieScene3SpriteResCounts[4] = { 2, 2, 2, 2 };

static const int sMap3dResHeaderFileIds[3] = {
    NARC_gs_opening_gs_opening_00000103_NSBMD,
    NARC_gs_opening_gs_opening_00000100_NSBMD,
    NARC_gs_opening_gs_opening_00000097_NSBMD,
};

static const int sMap3dObjFileIds[3][2] = {
    {
     NARC_gs_opening_gs_opening_00000104_NSBCA,
     NARC_gs_opening_gs_opening_00000105_NSBTA,
     },
    {
     NARC_gs_opening_gs_opening_00000101_NSBCA,
     NARC_gs_opening_gs_opening_00000102_NSBTA,
     },
    {
     NARC_gs_opening_gs_opening_00000098_NSBCA,
     NARC_gs_opening_gs_opening_00000099_NSBTA,
     }
};

static const CameraParam sCameraParam = {
    FX32_CONST(410.922119140625),
    { 0xD602,
                        0x0000,
                        0x0000,
                        0 },
    0,
    0x05C1,
    FALSE,
};

static const GXRgb sEdgeColors[8] = {
    RGB(0, 0, 0),
    RGB(4, 4, 4),
    RGB(4, 4, 4),
    RGB(4, 4, 4),
    RGB(4, 4, 4),
    RGB(4, 4, 4),
    RGB(4, 4, 4),
    RGB(4, 4, 4),
};

static const VecFx32 sLightVectors[3][4] = {
    {
     { FX32_CONST(-0.46923828125), FX32_CONST(-0.8662109375), FX32_CONST(-0.072265625) },
     { 0, 0, 0 },
     { 0, 0, FX32_ONE },
     { 0, 0, FX32_ONE },
     },
    {
     { FX32_CONST(-0.46728515625), FX32_CONST(-0.8662109375), FX32_CONST(-0.072265625) },
     { 0, 0, 0 },
     { 0, 0, FX32_ONE },
     { 0, 0, FX32_ONE },
     },
    {
     { FX32_CONST(-0.46728515625), FX32_CONST(-0.8662109375), FX32_CONST(-0.072265625) },
     { 0, 0, 0 },
     { 0, 0, FX32_ONE },
     { 0, 0, FX32_ONE },
     },
};

static const GXRgb sLightColors[3][4] = {
    { RGB(22, 22, 20), RGB(0, 0, 0), RGB(0,  4,  9), RGB(0, 0, 0) },
    { RGB(11, 11, 16), RGB(0, 0, 0), RGB(18, 10, 0), RGB(0, 0, 0) },
    { RGB(19, 16, 12), RGB(0, 0, 0), RGB(16, 6,  0), RGB(0, 0, 0) },
};

static const GXRgb sDiffUse[3] = {
    RGB(15, 15, 15),
    RGB(14, 14, 16),
    RGB(15, 15, 15),
};

static const GXRgb sAmbient[3] = {
    RGB(9, 11, 11),
    RGB(10, 10, 10),
    RGB(11, 12, 12),
};

static const GXRgb sMaterialSpecular[3] = {
    RGB(16, 16, 16),
    RGB(14, 14, 16),
    RGB(17, 17, 17),
};

static const GXRgb sMaterialEmission[3] = {
    RGB(14, 14, 14),
    RGB(8, 8, 11),
    RGB(8, 8, 7),
};

BOOL IntroMovie_Scene3(IntroMovieOverlayData *data, void *pVoid) {
    IntroMovieScene3Data *sceneData = (IntroMovieScene3Data *)pVoid;

    if (IntroMovie_GetIntroSkippedFlag(data)) {
        sceneData->state = INTRO_MOVIE_SCENE_EXIT;
    }

    switch (sceneData->state) {
    case INTRO_MOVIE_SCENE_INIT:
        IntroMovie_Scene3_Init(data, sceneData);
        ++sceneData->state;
        break;
    case INTRO_MOVIE_SCENE_RUN:
        if (IntroMovie_Scene3_Main(data, sceneData, IntroMovie_GetTotalFrameCount(data))) {
            ++sceneData->state;
        }
        break;
    case INTRO_MOVIE_SCENE_EXIT:
        IntroMovie_Scene3_Exit(data, sceneData);
        return TRUE;
    }

    return FALSE;
}

static void IntroMovie_Scene3_VBlankCB(void *pVoid) {
    IntroMovieOverlayData *data = (IntroMovieOverlayData *)pVoid;

    DoScheduledBgGpuUpdates(IntroMovie_GetBgConfig(data));
    OamManager_ApplyAndResetBuffers();
}

static void IntroMovie_Scene3_Init(IntroMovieOverlayData *data, IntroMovieScene3Data *sceneData) {
    BgConfig *bgConfig = IntroMovie_GetBgConfig(data);
    ObjCharTransfer_ClearBuffers();
    ObjPlttTransfer_Reset();
    gSystem.screensFlipped = FALSE;
    GfGfx_SwapDisplay();
    IntroMovie_Scene3_InitBGLayers(data);
    IntroMovie_InitBgAnimGxState(data);
    Main_SetVBlankIntrCB(IntroMovie_Scene3_VBlankCB, data);
    IntroMovie_Scene3_LoadBGGraphics(bgConfig, sceneData);
    IntroMovie_RendererSetSurfaceCoords(data, 0, 0, 0, 512);
    IntroMovie_Scene3_LoadOBJGraphics(data, sceneData);
    IntroMovie_Scene3_CreateSprites(data, sceneData);
    sceneData->gf3dVramMan = GF_3DVramMan_Create(HEAP_ID_INTRO_MOVIE, 0, 1, 0, 4, IntroMovie_Scene3_3DVRamManInit);
    IntroMovie_Scene3_Load3dGfxData(sceneData);
    IntroMovie_Scene3_Show2DGfx(sceneData, bgConfig);
    sceneData->needFreeGfx = TRUE;
}

static void IntroMovie_Scene3_Show2DGfx(IntroMovieScene3Data *sceneData, BgConfig *bgConfig) {
    IntroMovie_StartSpriteAnimAndMakeVisible(sceneData->silverSilhouetteSprite, TRUE);
    GfGfx_EngineBTogglePlanes((GXPlaneMask)(GX_PLANEMASK_BG1 | GX_PLANEMASK_BG2), GF_PLANE_TOGGLE_OFF);
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG0, GF_PLANE_TOGGLE_ON);
    BG_SetMaskColor(GF_BG_LYR_MAIN_0, RGB_BLACK);
    BG_SetMaskColor(GF_BG_LYR_SUB_0, RGB_BLACK);
    sub_0200FBF4(PM_LCD_BOTTOM, RGB_BLACK);
}

static BOOL IntroMovie_Scene3_Main(IntroMovieOverlayData *data, IntroMovieScene3Data *sceneData, int totalFrames) {
    u8 stepTimer;
    BgConfig *bgConfig = IntroMovie_GetBgConfig(data);
    IntroMovieBgLinearAnims *bgAnimCnt = IntroMovie_GetBgLinearAnimsController(data);
    stepTimer = IntroMovie_GetSceneStepTimer(data);
    IntroMovie_Scene3_Animate3DMap(sceneData);
    switch (IntroMovie_GetSceneStep(data)) {
    case INTRO_SCENE3_LOAD_NEWBARK:
        IntroMovie_Scene3_SetMapLightingAndColorParams(sceneData->whichMap);
        IntroMovie_BeginCircleWipeEffect(data, 0, TRUE, 8);
        IntroMovie_AdvanceSceneStep(data);
        break;
    case INTRO_SCENE3_SHOW_NEWBARK:
        if (stepTimer > 40) {
            IntroMovie_BeginCircleWipeEffect(data, 3, TRUE, 8);
            IntroMovie_AdvanceSceneStep(data);
        }
        break;
    case INTRO_SCENE3_LOAD_GOLDENROD:
        if (IntroMovie_WaitCircleWipeEffect(data)) {
            IntroMovie_BeginCircleWipeEffect(data, 2, TRUE, 8);
            sceneData->whichMap = 1;
            IntroMovie_Scene3_SetMapLightingAndColorParams(sceneData->whichMap);
            IntroMovie_AdvanceSceneStep(data);
        }
        break;
    case INTRO_SCENE3_SHOW_GOLDENROD:
        if (stepTimer > 46) {
            IntroMovie_BeginCircleWipeEffect(data, 3, TRUE, 8);
            IntroMovie_AdvanceSceneStep(data);
        }
        break;
    case INTRO_SCENE3_LOAD_ECRUTEAK:
        if (IntroMovie_WaitCircleWipeEffect(data)) {
            IntroMovie_BeginCircleWipeEffect(data, 2, TRUE, 8);
            sceneData->whichMap = 2;
            IntroMovie_Scene3_SetMapLightingAndColorParams(sceneData->whichMap);
            IntroMovie_AdvanceSceneStep(data);
        }
        break;
    case INTRO_SCENE3_WAIT_ECRUTEAK:
        if (stepTimer > 98) {
            IntroMovie_BeginCircleWipeEffect(data, 3, TRUE, 8);
            IntroMovie_AdvanceSceneStep(data);
        }
        break;
    case INTRO_SCENE3_END_3DRENDER:
        if (IntroMovie_WaitCircleWipeEffect(data)) {
            sceneData->whichMap = 0xFFFF;
            IntroMovie_AdvanceSceneStep(data);
        }
        break;
    case INTRO_SCENE3_APPEAR_RIVAL:
        IntroMovie_BeginCircleWipeEffect(data, 2, FALSE, 8);
        IntroMovie_AdvanceSceneStep(data);
        break;
    case INTRO_SCENE3_WAIT_APPEAR_RIVAL:
        if (IntroMovie_WaitCircleWipeEffect(data)) {
            IntroMovie_AdvanceSceneStep(data);
        }
        break;
    case INTRO_SCENE3_DRAMATIC_RIVAL_PANELS: { // Rival bg effects
        int silver_bg_appear_frame_delays[3] = { 56, 73, 92 };

        if (stepTimer >= silver_bg_appear_frame_delays[sceneData->silverBgAppearCounter]) {
            ++sceneData->silverBgAppearCounter;
            BG_LoadScreenTilemapData(bgConfig, GF_BG_LYR_SUB_0, sceneData->rivalGraphicSectionsScrnData[sceneData->silverBgAppearCounter]->rawData, sceneData->rivalGraphicSectionsScrnData[sceneData->silverBgAppearCounter]->szByte);
            ScheduleBgTilemapBufferTransfer(bgConfig, GF_BG_LYR_SUB_0);
            if (sceneData->silverBgAppearCounter >= 3) {
                IntroMovie_StartSpriteAnimAndMakeVisible(sceneData->silverSilhouetteSprite, FALSE);
                IntroMovie_AdvanceSceneStep(data);
            }
        }
        break;
    }
    case INTRO_SCENE3_REMOVE_RIVAL_PANEL_BORDERS:
        if (stepTimer >= 10) {
            GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG0, GF_PLANE_TOGGLE_OFF);
            BG_LoadScreenTilemapData(bgConfig, GF_BG_LYR_SUB_0, sceneData->rivalGraphicWholeScrnData->rawData, sceneData->rivalGraphicWholeScrnData->szByte);
            ScheduleBgTilemapBufferTransfer(bgConfig, GF_BG_LYR_SUB_0);
            IntroMovie_AdvanceSceneStep(data);
        }
        break;
    case INTRO_SCENE3_CINEMATIC_ASPECT_RIVAL:
        if (stepTimer == 5) {
            IntroMovieBgWindowAnimParam windowPan_narrowY = {
                0x00, 0x00, 0xFF, 0xC0, 0x00, 0x40, 0xFF, 0x80, 0x1F, 0x10, 1, 1
            };
            IntroMovie_StartWindowPanEffect(bgAnimCnt->window, 5, 0, &windowPan_narrowY);
        }
        if (stepTimer >= 44) {
            IntroMovieBgWindowAnimParam windowPan_widenLeftToRight = {
                0x00, 0x40, 0x01, 0x80, 0x00, 0x40, 0xFF, 0x80, 0x1F, 0x10, 1, 1
            };
            IntroMovie_StartWindowPanEffect(bgAnimCnt->window, 7, 0, &windowPan_widenLeftToRight);
            GXS_SetVisibleWnd(1);
            IntroMovie_StartBgScroll_VBlank(bgConfig, bgAnimCnt->scroll, GF_BG_LYR_SUB_0, -256, 0, 7);
            GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG0, GF_PLANE_TOGGLE_ON);
            IntroMovie_AdvanceSceneStep(data);
        }
        break;
    case INTRO_SCENE3_APPEAR_ENTEI:
        if (IntroMovie_WaitBgScrollAnim(bgAnimCnt->scroll, GF_BG_LYR_SUB_0)) {
            IntroMovieBgWindowAnimParam windowPan_widenRightToLeft = {
                0xFE, 0x00, 0xFF, 0x80, 0x00, 0x00, 0xFF, 0x80, 0x1F, 0x11, 1, 1
            };
            IntroMovie_StartWindowPanEffect(bgAnimCnt->window, 7, 0, &windowPan_widenRightToLeft);
            IntroMovie_StartBgScroll_VBlank(bgConfig, bgAnimCnt->scroll, GF_BG_LYR_SUB_1, 256, 0, 7);
            GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG1, GF_PLANE_TOGGLE_ON);
            IntroMovie_AdvanceSceneStep(data);
        }
        break;
    case INTRO_SCENE3_APPEAR_RAIKOU:
        if (IntroMovie_WaitBgScrollAnim(bgAnimCnt->scroll, GF_BG_LYR_SUB_1)) {
            IntroMovieBgWindowAnimParam windowPan_widenLeftToRight = {
                0x00, 0x00, 0x01, 0xC0, 0x00, 0x00, 0xFF, 0xC0, 0x1F, 0x13, 1, 1
            };
            IntroMovie_StartWindowPanEffect(bgAnimCnt->window, 1, 0, &windowPan_widenLeftToRight);
            IntroMovie_StartBgScroll_VBlank(bgConfig, bgAnimCnt->scroll, GF_BG_LYR_SUB_2, -256, 0, 1);
            GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG2, GF_PLANE_TOGGLE_ON);
            IntroMovie_AdvanceSceneStep(data);
        }
        break;
    case INTRO_SCENE3_LOAD_ROCKETS:
        if (IntroMovie_WaitBgScrollAnim(bgAnimCnt->scroll, GF_BG_LYR_SUB_2)) {
            GX_SetVisibleWnd(GX_WNDMASK_NONE);
            GXS_SetVisibleWnd(0);
            GfGfxLoader_LoadCharData(NARC_demo_opening_gs_opening, NARC_gs_opening_gs_opening_00000041_NCGR_lz, bgConfig, GF_BG_LYR_SUB_3, 0, 0x4000, TRUE, HEAP_ID_INTRO_MOVIE);
            IntroMovie_AdvanceSceneStep(data);
        }
        break;
    case INTRO_SCENE3_NARROW_WINDOWS:
        if (stepTimer >= 42) {
            IntroMovieBgWindowAnimParam windowPan_narrowX = {
                0x00, 0x00, 0xFF, 0xC0, 0x46, 0x00, 0xB9, 0xC0, 0x1F, 0x10, 1, 1
            };
            IntroMovie_StartWindowPanEffect(bgAnimCnt->window, 3, 0, &windowPan_narrowX);
            GXS_SetVisibleWnd(1);
            IntroMovie_AdvanceSceneStep(data);
        }
        break;
    case INTRO_SCENE3_WAIT_NARROW:
        if (IntroMovie_WaitWindowPanEffect(bgAnimCnt->window, 0)) {
            IntroMovie_AdvanceSceneStep(data);
        }
        break;
    case INTRO_SCENE3_SPRITES_VISIBLE:
        if (stepTimer == 56) { // Eusine appear
            IntroMovie_StartSpriteAnimAndMakeVisible(sceneData->eusineSprite, TRUE);
        }
        if (stepTimer == 145) { // Unown slide
            IntroMovie_StartSpriteAnimAndMakeVisible(sceneData->unownSprites[0], TRUE);
        }
        if (stepTimer >= 145) { // Entei slide out
            IntroMovieBgWindowAnimParam windowPan_narrowLeftToRight = {
                0x46, 0x00, 0xB9, 0xC0, 0xB9, 0x00, 0xB9, 0xC0, 0x1F, 0x10, 1, 1
            };
            IntroMovie_StartWindowPanEffect(bgAnimCnt->window, 10, 0, &windowPan_narrowLeftToRight);
            G2S_SetWnd1Position(0x46, 0x40, 0xb9, 0xc0);
            G2S_SetWnd1InsidePlane(0x1D, TRUE);
            IntroMovie_StartBgScroll_VBlank(bgConfig, bgAnimCnt->scroll, GF_BG_LYR_SUB_1, -116, 0, 10);
            IntroMovie_AdvanceSceneStep(data);
        }
        break;
    case INTRO_SCENE3_WAIT_ENTEI_EXIT:
        if (IntroMovie_WaitBgScrollAnim(bgAnimCnt->scroll, GF_BG_LYR_SUB_1)) {
            GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG1, GF_PLANE_TOGGLE_OFF);
            IntroMovieBgWindowAnimParam windowPan_nop = {
                0x46, 0x40, 0xB9, 0xC0, 0x46, 0x40, 0xB9, 0xC0, 0x1F, 0x10, 1, 1
            };
            IntroMovie_StartWindowPanEffect(bgAnimCnt->window, 0, 0, &windowPan_nop);
            IntroMovie_AdvanceSceneStep(data);
        }
        break;
    case INTRO_SCENE3_UNOWN_RAIKOU_EXIT:
        IntroMovie_StartSpriteAnimAndMakeVisible(sceneData->unownSprites[1], TRUE);
        if (stepTimer >= 10) {
            IntroMovieBgWindowAnimParam windowPan_narrowLeftToRight = {
                0x46, 0x40, 0xB9, 0xC0, 0xB9, 0x40, 0xB9, 0xC0, 0x1F, 0x10, 1, 1
            };
            IntroMovie_StartWindowPanEffect(bgAnimCnt->window, 10, 0, &windowPan_narrowLeftToRight);
            G2S_SetWnd1Position(0x46, 0x40, 0xB9, 0x80);
            G2S_SetWnd1InsidePlane(0x19, TRUE);
            IntroMovie_StartBgScroll_VBlank(bgConfig, bgAnimCnt->scroll, GF_BG_LYR_SUB_2, -116, 0, 10);
            IntroMovie_AdvanceSceneStep(data);
        }
        break;
    case INTRO_SCENE3_LOAD_ROCKET_SCRNDATA:
        if (IntroMovie_WaitBgScrollAnim(bgAnimCnt->scroll, GF_BG_LYR_SUB_1) && IntroMovie_WaitBgScrollAnim(bgAnimCnt->scroll, GF_BG_LYR_SUB_2)) {
            GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG2, GF_PLANE_TOGGLE_OFF);
            IntroMovieBgWindowAnimParam windowPan_nop = {
                0x46, 0x40, 0xB9, 0x80, 0x46, 0x40, 0xB9, 0x80, 0x1F, 0x10, 1, 1
            };
            IntroMovie_StartWindowPanEffect(bgAnimCnt->window, 0, 0, &windowPan_nop);
            BG_LoadScreenTilemapData(bgConfig, GF_BG_LYR_SUB_1, sceneData->beastGraphicScrnData[0]->rawData, sceneData->beastGraphicScrnData[0]->szByte);
            BG_LoadScreenTilemapData(bgConfig, GF_BG_LYR_SUB_2, sceneData->beastGraphicScrnData[1]->rawData, sceneData->beastGraphicScrnData[1]->szByte);
            BG_LoadScreenTilemapData(bgConfig, GF_BG_LYR_SUB_3, sceneData->beastGraphicScrnData[2]->rawData, sceneData->beastGraphicScrnData[2]->szByte);
            ScheduleBgTilemapBufferTransfer(bgConfig, GF_BG_LYR_SUB_1);
            ScheduleBgTilemapBufferTransfer(bgConfig, GF_BG_LYR_SUB_2);
            ScheduleBgTilemapBufferTransfer(bgConfig, GF_BG_LYR_SUB_3);
            BgSetPosTextAndCommit(bgConfig, GF_BG_LYR_SUB_1, BG_POS_OP_SET_X, 0);
            BgSetPosTextAndCommit(bgConfig, GF_BG_LYR_SUB_1, BG_POS_OP_SET_Y, 0);
            BgSetPosTextAndCommit(bgConfig, GF_BG_LYR_SUB_2, BG_POS_OP_SET_X, 0);
            BgSetPosTextAndCommit(bgConfig, GF_BG_LYR_SUB_2, BG_POS_OP_SET_Y, 0);
            BgSetPosTextAndCommit(bgConfig, GF_BG_LYR_SUB_3, BG_POS_OP_SET_X, 0);
            BgSetPosTextAndCommit(bgConfig, GF_BG_LYR_SUB_3, BG_POS_OP_SET_Y, 0);
            GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG1, GF_PLANE_TOGGLE_ON);
            GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG2, GF_PLANE_TOGGLE_ON);
            IntroMovie_AdvanceSceneStep(data);
        }
        break;
    case INTRO_SCENE3_UNOWN_SUICUNE_EXIT:
        IntroMovie_StartSpriteAnimAndMakeVisible(sceneData->unownSprites[2], TRUE);
        if (stepTimer >= 30) {
            IntroMovieBgWindowAnimParam windowPan_narrowRightToLeft = {
                0x46, 0x40, 0xB9, 0x80, 0x46, 0x40, 0x46, 0x80, 0x1F, 0x10, 1, 1
            };
            IntroMovie_StartWindowPanEffect(bgAnimCnt->window, 10, 0, &windowPan_narrowRightToLeft);
            G2S_SetWnd1Position(0x46, 0x40, 0xB9, 0x80);
            G2S_SetWnd1InsidePlane(0x1E, TRUE);
            IntroMovie_StartBgScroll_VBlank(bgConfig, bgAnimCnt->scroll, GF_BG_LYR_SUB_0, 0x74, 0, 10);
            IntroMovie_AdvanceSceneStep(data);
        }
        break;
    case INTRO_SCENE3_EXPAND_ROCKET_VIEWPORT:
        if (IntroMovie_WaitBgScrollAnim(bgAnimCnt->scroll, GF_BG_LYR_SUB_0)) {
            GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG0, GF_PLANE_TOGGLE_OFF);
            IntroMovieBgWindowAnimParam windowPan_expandFromCenter = {
                0x46, 0x40, 0xB9, 0x80, 0x00, 0x00, 0xFF, 0xC0, 0x1F, 0x10, 1, 1
            };
            IntroMovie_StartWindowPanEffect(bgAnimCnt->window, 253, 0, &windowPan_expandFromCenter);
            IntroMovie_StartBgScroll_VBlank(bgConfig, bgAnimCnt->scroll, GF_BG_LYR_SUB_1, 0, -0x30, 254);
            IntroMovie_StartBgScroll_VBlank(bgConfig, bgAnimCnt->scroll, GF_BG_LYR_SUB_2, 0, -0x20, 254);
            IntroMovie_StartBgScroll_VBlank(bgConfig, bgAnimCnt->scroll, GF_BG_LYR_SUB_3, 0, -0x08, 254);
            IntroMovie_AdvanceSceneStep(data);
        }
        break;
    case INTRO_SCENE3_WAIT_ADMINS:
        if (IntroMovie_WaitBgScrollAnim(bgAnimCnt->scroll, GF_BG_LYR_SUB_1)) {
            return TRUE;
        }
    }

    return FALSE;
}

static void IntroMovie_Scene3_Exit(IntroMovieOverlayData *data, IntroMovieScene3Data *sceneData) {
    u8 i, j;
    BgConfig *bgConfig = IntroMovie_GetBgConfig(data);
    Main_SetVBlankIntrCB(NULL, NULL);
    if (sceneData->needFreeGfx) {
        Camera_UnsetStaticPtr();
        Camera_Delete(sceneData->camera);
        for (i = 0; i < 3; ++i) {
            for (j = 0; j < 2; ++j) {
                NNS_G3dFreeAnmObj(&sceneData->allocator, sceneData->mapRender[i].animObjs[j]);
                Heap_Free(sceneData->mapRender[i].rawData[j]);
            }
            Heap_Free(sceneData->mapRender[i].resFileHeader);
        }
        GF_3DVramMan_Delete(sceneData->gf3dVramMan);
        for (i = 0; i < 4; ++i) {
            Heap_Free(sceneData->rivalGraphicSectionsRawData[i]);
        }
        for (i = 0; i < 3; ++i) {
            Heap_Free(sceneData->beastGraphicRawData[i]);
        }
        Heap_Free(sceneData->rivalGraphicWholeRawData);
        IntroMovie_Scene3_UnloadOBJGraphics(data, sceneData);
        FreeBgTilemapBuffer(bgConfig, GF_BG_LYR_SUB_0);
        FreeBgTilemapBuffer(bgConfig, GF_BG_LYR_SUB_1);
        FreeBgTilemapBuffer(bgConfig, GF_BG_LYR_SUB_2);
        FreeBgTilemapBuffer(bgConfig, GF_BG_LYR_SUB_3);
        sceneData->needFreeGfx = FALSE;
    }
}

static void IntroMovie_Scene3_InitBGLayers(IntroMovieOverlayData *data) {
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
            .x = 0, .y = 0, .bufferSize = GF_BG_BUF_SIZE_256x256_4BPP, .baseTile = 0, .size = GF_BG_SCR_SIZE_256x256, .colorMode = GX_BG_COLORMODE_16, .screenBase = GX_BG_SCRBASE_0x0000, .charBase = GX_BG_CHARBASE_0x04000, .bgExtPltt = GX_BG_EXTPLTT_01, .priority = 0, .areaOver = GX_BG_AREAOVER_XLU, .mosaic = FALSE
        };
        InitBgFromTemplate(bgConfig, GF_BG_LYR_SUB_0, &bgTemplate, 0);
    }
    {
        BgTemplate bgTemplate = {
            .x = 0, .y = 0, .bufferSize = GF_BG_BUF_SIZE_256x256_4BPP, .baseTile = 0, .size = GF_BG_SCR_SIZE_256x256, .colorMode = GX_BG_COLORMODE_16, .screenBase = GX_BG_SCRBASE_0x0800, .charBase = GX_BG_CHARBASE_0x04000, .bgExtPltt = GX_BG_EXTPLTT_01, .priority = 1, .areaOver = GX_BG_AREAOVER_XLU, .mosaic = FALSE
        };
        InitBgFromTemplate(bgConfig, GF_BG_LYR_SUB_1, &bgTemplate, 0);
    }
    {
        BgTemplate bgTemplate = {
            .x = 0, .y = 0, .bufferSize = GF_BG_BUF_SIZE_256x256_4BPP, .baseTile = 0, .size = GF_BG_SCR_SIZE_256x256, .colorMode = GX_BG_COLORMODE_16, .screenBase = GX_BG_SCRBASE_0x1000, .charBase = GX_BG_CHARBASE_0x04000, .bgExtPltt = GX_BG_EXTPLTT_01, .priority = 2, .areaOver = GX_BG_AREAOVER_XLU, .mosaic = FALSE
        };
        InitBgFromTemplate(bgConfig, GF_BG_LYR_SUB_2, &bgTemplate, 0);
    }
    {
        BgTemplate bgTemplate = {
            .x = 0, .y = 0, .bufferSize = GF_BG_BUF_SIZE_256x256_4BPP, .baseTile = 0, .size = GF_BG_SCR_SIZE_256x256, .colorMode = GX_BG_COLORMODE_16, .screenBase = GX_BG_SCRBASE_0x1800, .charBase = GX_BG_CHARBASE_0x04000, .bgExtPltt = GX_BG_EXTPLTT_01, .priority = 3, .areaOver = GX_BG_AREAOVER_XLU, .mosaic = FALSE
        };
        InitBgFromTemplate(bgConfig, GF_BG_LYR_SUB_3, &bgTemplate, 0);
    }
}

static void IntroMovie_Scene3_LoadBGGraphics(BgConfig *bgConfig, IntroMovieScene3Data *sceneData) {
    int rival_section_nscr[4] = {
        NARC_gs_opening_gs_opening_00000042_NSCR_lz,
        NARC_gs_opening_gs_opening_00000043_NSCR_lz,
        NARC_gs_opening_gs_opening_00000044_NSCR_lz,
        NARC_gs_opening_gs_opening_00000045_NSCR_lz,
    };
    int beast_nscr[3] = {
        NARC_gs_opening_gs_opening_00000050_NSCR_lz,
        NARC_gs_opening_gs_opening_00000051_NSCR_lz,
        NARC_gs_opening_gs_opening_00000052_NSCR_lz,
    };
    u8 i;

    // rival and doggos
    GfGfxLoader_LoadCharData(NARC_demo_opening_gs_opening, NARC_gs_opening_gs_opening_00000040_NCGR_lz, bgConfig, GF_BG_LYR_SUB_0, 0, 0, TRUE, HEAP_ID_INTRO_MOVIE);
    GfGfxLoader_LoadScrnData(NARC_demo_opening_gs_opening, NARC_gs_opening_gs_opening_00000046_NSCR_lz, bgConfig, GF_BG_LYR_SUB_3, 0, 0, TRUE, HEAP_ID_INTRO_MOVIE);

    for (i = 0; i < 4; ++i) {
        sceneData->rivalGraphicSectionsRawData[i] = GfGfxLoader_GetScrnData(NARC_demo_opening_gs_opening, rival_section_nscr[i], TRUE, &sceneData->rivalGraphicSectionsScrnData[i], HEAP_ID_INTRO_MOVIE);
    }

    for (i = 0; i < 3; ++i) {
        sceneData->beastGraphicRawData[i] = GfGfxLoader_GetScrnData(NARC_demo_opening_gs_opening, beast_nscr[i], TRUE, &sceneData->beastGraphicScrnData[i], HEAP_ID_INTRO_MOVIE);
    }

    sceneData->rivalGraphicWholeRawData = GfGfxLoader_GetScrnData(NARC_demo_opening_gs_opening, NARC_gs_opening_gs_opening_00000047_NSCR_lz, TRUE, &sceneData->rivalGraphicWholeScrnData, HEAP_ID_INTRO_MOVIE);
    BgCopyOrUncompressTilemapBufferRangeToVram(bgConfig, GF_BG_LYR_SUB_0, sceneData->rivalGraphicSectionsScrnData[0]->rawData, sceneData->rivalGraphicSectionsScrnData[0]->szByte, 0);
    GfGfxLoader_LoadScrnData(NARC_demo_opening_gs_opening, NARC_gs_opening_gs_opening_00000048_NSCR_lz, bgConfig, GF_BG_LYR_SUB_1, 0, 0, TRUE, HEAP_ID_INTRO_MOVIE);
    GfGfxLoader_LoadScrnData(NARC_demo_opening_gs_opening, NARC_gs_opening_gs_opening_00000049_NSCR_lz, bgConfig, GF_BG_LYR_SUB_2, 0, 0, TRUE, HEAP_ID_INTRO_MOVIE);
    GfGfxLoader_GXLoadPal(NARC_demo_opening_gs_opening, NARC_gs_opening_gs_opening_00000039_NCLR, GF_PAL_LOCATION_SUB_BG, (enum GFPalSlotOffset)0, 0x200, HEAP_ID_INTRO_MOVIE);
    OS_WaitIrq(TRUE, OS_IE_V_BLANK);
    GfGfx_BothDispOn();
}

static void IntroMovie_Scene3_LoadOBJGraphics(IntroMovieOverlayData *data, IntroMovieScene3Data *sceneData) {
    IntroMovie_CreateSpriteResourceManagers(data, sIntroMovieScene3SpriteResCounts);
    GF_2DGfxResMan **resMen = IntroMovie_GetSpriteResourceManagersArray(data);

    sceneData->spriteResObjs[0][GF_GFX_RES_TYPE_CHAR] = AddCharResObjFromNarc(resMen[GF_GFX_RES_TYPE_CHAR], NARC_demo_opening_gs_opening, NARC_gs_opening_gs_opening_00000066_NCGR_lz, TRUE, 2, NNS_G2D_VRAM_TYPE_2DSUB, HEAP_ID_INTRO_MOVIE);
    sceneData->spriteResObjs[0][GF_GFX_RES_TYPE_PLTT] = AddPlttResObjFromNarc(resMen[GF_GFX_RES_TYPE_PLTT], NARC_demo_opening_gs_opening, NARC_gs_opening_gs_opening_00000065_NCLR, FALSE, 2, NNS_G2D_VRAM_TYPE_2DSUB, 1, HEAP_ID_INTRO_MOVIE);
    sceneData->spriteResObjs[0][GF_GFX_RES_TYPE_CELL] = AddCellOrAnimResObjFromNarc(resMen[GF_GFX_RES_TYPE_CELL], NARC_demo_opening_gs_opening, NARC_gs_opening_gs_opening_00000068_NCER_lz, TRUE, 2, GF_GFX_RES_TYPE_CELL, HEAP_ID_INTRO_MOVIE);
    sceneData->spriteResObjs[0][GF_GFX_RES_TYPE_ANIM] = AddCellOrAnimResObjFromNarc(resMen[GF_GFX_RES_TYPE_ANIM], NARC_demo_opening_gs_opening, NARC_gs_opening_gs_opening_00000067_NANR_lz, TRUE, 2, GF_GFX_RES_TYPE_ANIM, HEAP_ID_INTRO_MOVIE);

    sceneData->spriteResObjs[1][GF_GFX_RES_TYPE_CHAR] = AddCharResObjFromNarc(resMen[GF_GFX_RES_TYPE_CHAR], NARC_demo_opening_gs_opening, NARC_gs_opening_gs_opening_00000070_NCGR_lz, TRUE, 3, NNS_G2D_VRAM_TYPE_2DSUB, HEAP_ID_INTRO_MOVIE);
    sceneData->spriteResObjs[1][GF_GFX_RES_TYPE_PLTT] = AddPlttResObjFromNarc(resMen[GF_GFX_RES_TYPE_PLTT], NARC_demo_opening_gs_opening, NARC_gs_opening_gs_opening_00000069_NCLR, FALSE, 3, NNS_G2D_VRAM_TYPE_2DSUB, 2, HEAP_ID_INTRO_MOVIE);
    sceneData->spriteResObjs[1][GF_GFX_RES_TYPE_CELL] = AddCellOrAnimResObjFromNarc(resMen[GF_GFX_RES_TYPE_CELL], NARC_demo_opening_gs_opening, NARC_gs_opening_gs_opening_00000072_NCER_lz, TRUE, 3, GF_GFX_RES_TYPE_CELL, HEAP_ID_INTRO_MOVIE);
    sceneData->spriteResObjs[1][GF_GFX_RES_TYPE_ANIM] = AddCellOrAnimResObjFromNarc(resMen[GF_GFX_RES_TYPE_ANIM], NARC_demo_opening_gs_opening, NARC_gs_opening_gs_opening_00000071_NANR_lz, TRUE, 3, GF_GFX_RES_TYPE_ANIM, HEAP_ID_INTRO_MOVIE);

    for (u8 i = 0; i < 2; ++i) {
        sub_0200ACF0(sceneData->spriteResObjs[i][GF_GFX_RES_TYPE_CHAR]);
        sub_0200AF94(sceneData->spriteResObjs[i][GF_GFX_RES_TYPE_PLTT]);
    }

    GfGfx_EngineBTogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_ON);
}

static void IntroMovie_Scene3_UnloadOBJGraphics(IntroMovieOverlayData *data, IntroMovieScene3Data *sceneData) {
    Sprite_Delete(sceneData->silverSilhouetteSprite);
    Sprite_Delete(sceneData->eusineSprite);
    Sprite_Delete(sceneData->unownSprites[0]);
    Sprite_Delete(sceneData->unownSprites[1]);
    Sprite_Delete(sceneData->unownSprites[2]);

    for (u8 i = 0; i < 2; ++i) {
        sub_0200AEB0(sceneData->spriteResObjs[i][GF_GFX_RES_TYPE_CHAR]);
        sub_0200B0A8(sceneData->spriteResObjs[i][GF_GFX_RES_TYPE_PLTT]);
    }
    IntroMovie_DestroySpriteResourceManagers(data);
}

static void IntroMovie_Scene3_CreateSprites(IntroMovieOverlayData *data, IntroMovieScene3Data *sceneData) {
    SpriteResourcesHeader header;
    SpriteTemplate template;
    int unownSpriteYcoords[3] = { 544, 672, 608 };
    int unownSpriteAnimSeqNos[3] = { 1, 2, 3 };

    IntroMovie_BuildSpriteResourcesHeaderAndTemplate(2, data, 0, NNS_G2D_VRAM_TYPE_2DSUB, &template, &header);
    template.position.x = 128 * FX32_ONE;
    template.position.y = 608 * FX32_ONE;
    sceneData->silverSilhouetteSprite = Sprite_CreateAffine(&template);
    Sprite_SetAnimActiveFlag(sceneData->silverSilhouetteSprite, FALSE);
    Sprite_SetDrawFlag(sceneData->silverSilhouetteSprite, FALSE);
    Sprite_SetAnimCtrlSeq(sceneData->silverSilhouetteSprite, 0);

    IntroMovie_BuildSpriteResourcesHeaderAndTemplate(3, data, 0, NNS_G2D_VRAM_TYPE_2DSUB, &template, &header);
    template.position.x = 32 * FX32_ONE;
    template.position.y = 608 * FX32_ONE;
    sceneData->eusineSprite = Sprite_CreateAffine(&template);
    Sprite_SetAnimActiveFlag(sceneData->eusineSprite, FALSE);
    Sprite_SetDrawFlag(sceneData->eusineSprite, FALSE);
    Sprite_SetAnimCtrlSeq(sceneData->eusineSprite, 0);

    for (int i = 0; i < 3; ++i) {
        IntroMovie_BuildSpriteResourcesHeaderAndTemplate(3, data, 0, NNS_G2D_VRAM_TYPE_2DSUB, &template, &header);
        template.position.x = 128 * FX32_ONE;
        template.position.y = unownSpriteYcoords[i] * FX32_ONE;
        sceneData->unownSprites[i] = Sprite_CreateAffine(&template);
        Sprite_SetAnimActiveFlag(sceneData->unownSprites[i], FALSE);
        Sprite_SetDrawFlag(sceneData->unownSprites[i], FALSE);
        Sprite_SetAnimCtrlSeq(sceneData->unownSprites[i], unownSpriteAnimSeqNos[i]);
    }
}

static void IntroMovie_Scene3_Load3dGfxData(IntroMovieScene3Data *sceneData) {
    u8 j, i;
    NARC *narc = NARC_New(NARC_demo_opening_gs_opening, HEAP_ID_INTRO_MOVIE);
    HeapExp_FndInitAllocator(&sceneData->allocator, HEAP_ID_INTRO_MOVIE, 4);
    for (i = 0; i < 3; ++i) {
        NNSG3dResMdl *pMdl;
        sceneData->mapRender[i].resFileHeader = NARC_AllocAndReadWholeMember(narc, sMap3dResHeaderFileIds[i], HEAP_ID_INTRO_MOVIE);
        GF3dRender_InitObjFromHeader(&sceneData->mapRender[i].renderObj, &pMdl, &sceneData->mapRender[i].resFileHeader);
        NNSG3dResTex *resTex = NNS_G3dGetTex(sceneData->mapRender[i].resFileHeader);
        NNS_G3dMdlUseGlbDiff(pMdl);
        NNS_G3dMdlUseGlbAmb(pMdl);
        NNS_G3dMdlUseGlbSpec(pMdl);
        NNS_G3dMdlUseGlbEmi(pMdl);
        NNS_G3dMdlUseGlbLightEnableFlag(pMdl);
        for (j = 0; j < 2; ++j) {
            sceneData->mapRender[i].rawData[j] = NARC_AllocAndReadWholeMember(narc, sMap3dObjFileIds[i][j], HEAP_ID_INTRO_MOVIE);
            NNSG3dAnmObj *animObj = NNS_G3dGetAnmByIdx(sceneData->mapRender[i].rawData[j], 0);
            sceneData->mapRender[i].animObjs[j] = NNS_G3dAllocAnmObj(&sceneData->allocator, animObj, pMdl);
            NNS_G3dAnmObjInit(sceneData->mapRender[i].animObjs[j], animObj, pMdl, resTex);
            NNS_G3dRenderObjAddAnmObj(&sceneData->mapRender[i].renderObj, sceneData->mapRender[i].animObjs[j]);
        }
    }
    NARC_Delete(narc);

    sceneData->camera = Camera_New(HEAP_ID_INTRO_MOVIE);

    VecFx32 target = { 0, 0, 96 * FX32_ONE };

    Camera_Init_FromTargetDistanceAndAngle(
        &target,
        sCameraParam.distance,
        &sCameraParam.angle,
        sCameraParam.perspective,
        sCameraParam.perspectiveType,
        FALSE,
        sceneData->camera);
    Camera_SetPerspectiveAngle(0x981, sceneData->camera);
    Camera_SetStaticPtr(sceneData->camera);
    NNS_G3dGlbPolygonAttr(5, GX_POLYGONMODE_MODULATE, GX_CULL_BACK, 0, 0x1F, 0x8000);
}

static void IntroMovie_Scene3_Animate3DMap(IntroMovieScene3Data *sceneData) {
    u8 i, whichMap_u8;
    MtxFx33 iden33 = {
        FX32_ONE,
        0,
        0,
        0,
        FX32_ONE,
        0,
        0,
        0,
        FX32_ONE,
    };
    VecFx32 ones = { FX32_ONE, FX32_ONE, FX32_ONE };
    VecFx32 zeros = { 0, 0, 0 };

    int whichMap_i = sceneData->whichMap;
    if (whichMap_i != 0xFFFF) {
        Thunk_G3X_Reset();
        Camera_PushLookAtToNNSGlb();
        whichMap_u8 = (u8)whichMap_i; // todo: is this an inline?
        for (i = 0; i < 2; ++i) {
            fx32 frame = sceneData->mapRender[whichMap_u8].animObjs[i]->frame + FX32_ONE;
            if (frame < NNS_G3dAnmObjGetNumFrame(sceneData->mapRender[whichMap_u8].animObjs[i])) {
                sceneData->mapRender[whichMap_u8].animObjs[i]->frame = frame;
            }
        }
        GF3dRender_DrawModel(&sceneData->mapRender[whichMap_u8].renderObj, &zeros, &iden33, &ones);
        RequestSwap3DBuffers(GX_SORTMODE_AUTO, GX_BUFFERMODE_W);
    }
}

static void IntroMovie_Scene3_3DVRamManInit(void) {
    G2_SetBG0Priority(0);
    G3X_SetShading(GX_SHADING_TOON);
    G3X_AntiAlias(TRUE);
    G3X_AlphaTest(FALSE, 0);
    G3X_AlphaBlend(TRUE);
    G3X_EdgeMarking(TRUE);
    G3X_SetEdgeColorTable(sEdgeColors);
    G3X_SetFog(FALSE, GX_FOGBLEND_COLOR_ALPHA, GX_FOGSLOPE_0x8000, 0);
    G3X_SetClearColor(RGB_BLACK, 0, 0x7FFF, 0x3F, FALSE);
    G3_ViewPort(0, 0, 255, 191);
}

static void IntroMovie_Scene3_SetMapLightingAndColorParams(u8 mapIdx) {
    for (u8 i = 0; i < 4; ++i) {
        NNS_G3dGlbLightVector((GXLightId)i, sLightVectors[mapIdx][i].x, sLightVectors[mapIdx][i].y, sLightVectors[mapIdx][i].z);
        NNS_G3dGlbLightColor((GXLightId)i, sLightColors[mapIdx][i]);
    }
    NNS_G3dGlbMaterialColorDiffAmb(sDiffUse[mapIdx], sAmbient[mapIdx], FALSE);
    NNS_G3dGlbMaterialColorSpecEmi(sMaterialSpecular[mapIdx], sMaterialEmission[mapIdx], FALSE);
}

enum HeapID _deadstrip_03(int idx);
enum HeapID _deadstrip_03(int idx) {
    static const enum HeapID sDeadstrippedRodata_021EB1F8[1] = { HEAP_ID_INTRO_MOVIE };
    return sDeadstrippedRodata_021EB1F8[idx];
}
