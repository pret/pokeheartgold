#include "demo/opening/gs_opening.naix"
#include "gf_gfx_loader.h"
#include "global.h"
#include "intro_movie_internal.h"
#include "math_util.h"
#include "sys_task_api.h"
#include "system.h"
#include "unk_0200ACF0.h"
#include "unk_0200B150.h"
#include "unk_0200FA24.h"
#include "unk_020215A0.h"
#include "unk_02022588.h"
#include "unk_02026E30.h"

void IntroMovie_Scene4_VBlankCB(void *pVoid);
void IntroMovie_Scene4_Init(IntroMovieOvyData *data, IntroMovieScene4Data *sceneData);
BOOL IntroMovie_Scene4_Main(IntroMovieOvyData *data, IntroMovieScene4Data *sceneData, int totalFrames);
void IntroMovie_Scene4_Exit(IntroMovieOvyData *data, IntroMovieScene4Data *sceneData);
void IntroMovie_Scene4_InitBgs(IntroMovieOvyData *data);
void InroMovie_Scene4_LoadBgGfx(BgConfig *bgConfig, IntroMovieScene4Data *sceneData);
void IntroMovie_Scene4_EnableBgLayers(IntroMovieOvyData *data, BgConfig *bgConfig);
void IntroMovie_Scene4_LoadSpriteGfx(IntroMovieOvyData *data, IntroMovieScene4Data *sceneData);
void IntroMovie_Scene4_DestroySprites(IntroMovieOvyData *data, IntroMovieScene4Data *sceneData);
void IntroMovie_Scene4_CreateSprites(IntroMovieOvyData *data, IntroMovieScene4Data *sceneData);
u32 IntroMovie_Scene4_TexAlloc(u32 size, BOOL is4x4comp);
u32 IntroMovie_Scene4_PlttAlloc(u32 size, BOOL is4pltt);
void IntroMovie_Scene4_SPLEmitterCB(struct SPLEmitter *emitter);
void IntroMovie_Scene4_3DMain(void);
void IntroMovie_Scene4_StartParticleEmitters(IntroMovieScene4Data *sceneData, int whichStarter);
void IntroMovie_Scene4_3DVRamManInit(void);
void IntroMovie_Scene4_FlipScreensAtNextVBlank(IntroMovieScene4Data *sceneData, int whichScreen);
void Task_IntroMovie_Scene4_FlipScreens(SysTask *task, void *pVoid);

const int sStarterParticleResIds[3][3] = {
    { 6, 7, 8 },
    { 3, 4, 5 },
    { 0, 1, 2 }
};

const u8 sIntroMovieScene4SpriteResCounts[4] = {4, 4, 4, 4};

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
        IntroMovieBgWindowAnimParam sp94 = {  // 021EB73C
            255, 0, 255, 192,
            0, 0, 255, 192,
            30, 28, 1, 1
        };
        IntroMovie_StartWindowPanEffect(animCnt->window, 10, PM_LCD_TOP, &sp94);

        IntroMovieBgWindowAnimParam sp68 = {  // 021EB768
            0, 0, 0, 192,
            0, 0, 255, 192,
            30, 28, 1, 1
        };
        IntroMovie_StartWindowPanEffect(animCnt->window, 10, PM_LCD_BOTTOM, &sp68);

        IntroMovie_StartBgScroll_VBlank(bgConfig, animCnt->scroll, GF_BG_LYR_SUB_1, 0xC0, 0, 10);
        IntroMovie_StartBgScroll_VBlank(bgConfig, animCnt->scroll, GF_BG_LYR_MAIN_1, -0xC0, 0, 10);
        IntroMovie_StartSpriteAnimAndMakeVisible(sceneData->hand1Sprite, TRUE);
        IntroMovie_StartSpriteAnimAndMakeVisible(sceneData->hand2Sprite, TRUE);
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
        IntroMovieBgWindowAnimParam sp3C = {  // 021EB794
            0, 0, 255, 192,
            0, 0, 0, 192,
            30, 28, 1, 1
        };
        IntroMovie_StartWindowPanEffect(animCnt->window, 10, PM_LCD_TOP, &sp3C);

        IntroMovieBgWindowAnimParam sp10 = {  // 021EB710
            0, 0, 255, 192,
            255, 0, 255, 192,
            30, 28, 1, 1
        };
        IntroMovie_StartWindowPanEffect(animCnt->window, 10, PM_LCD_BOTTOM, &sp10);

        IntroMovie_StartBgScroll_VBlank(bgConfig, animCnt->scroll, GF_BG_LYR_SUB_1, 0xC0, 0, 10);
        IntroMovie_StartBgScroll_VBlank(bgConfig, animCnt->scroll, GF_BG_LYR_MAIN_1, -0xC0, 0, 10);
        IntroMovie_AdvanceSceneStep(data);
        break;
    }
    case 6:
        if (IntroMovie_WaitBgScrollAnim(animCnt->scroll, GF_BG_LYR_SUB_1) && IntroMovie_WaitBgScrollAnim(animCnt->scroll, GF_BG_LYR_MAIN_1)) {
            IntroMovie_StartSpriteAnimAndMakeVisible(sceneData->hand1Sprite, FALSE);
            IntroMovie_StartSpriteAnimAndMakeVisible(sceneData->hand2Sprite, FALSE);
            GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG1, GF_PLANE_TOGGLE_OFF);
            GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG1, GF_PLANE_TOGGLE_OFF);
            GX_SetVisibleWnd(0);
            GXS_SetVisibleWnd(0);
            IntroMovie_AdvanceSceneStep(data);
        }
        break;
    case 7:
        IntroMovie_StartSpriteAnimAndMakeVisible(sceneData->starterSprites[0], TRUE);
        IntroMovie_AdvanceSceneStep(data);
        break;
    case 8:
        IntroMovie_Scene4_StartParticleEmitters(sceneData, 0);
        IntroMovie_AdvanceSceneStep(data);
        break;
    case 9:
        if (!sub_020154B0(sceneData->particleSystem)) {
            IntroMovie_AdvanceSceneStep(data);
        }
        break;
    case 10:
        IntroMovie_Scene4_FlipScreensAtNextVBlank(sceneData, 0);
        IntroMovie_AdvanceSceneStep(data);
        break;
    case 11:
        IntroMovie_StartSpriteAnimAndMakeVisible(sceneData->starterSprites[1], TRUE);
        IntroMovie_AdvanceSceneStep(data);
        break;
    case 12:
        IntroMovie_Scene4_StartParticleEmitters(sceneData, 1);
        IntroMovie_AdvanceSceneStep(data);
        break;
    case 13:
        if (!sub_020154B0(sceneData->particleSystem)) {
            IntroMovie_AdvanceSceneStep(data);
        }
        break;
    case 14:
        IntroMovie_Scene4_FlipScreensAtNextVBlank(sceneData, 1);
        IntroMovie_AdvanceSceneStep(data);
        break;
    case 15:
        IntroMovie_StartSpriteAnimAndMakeVisible(sceneData->starterSprites[2], TRUE);
        IntroMovie_AdvanceSceneStep(data);
        break;
    case 16:
        IntroMovie_Scene4_StartParticleEmitters(sceneData, 2);
        IntroMovie_AdvanceSceneStep(data);
        break;
    case 17:
        if (!sub_020154B0(sceneData->particleSystem)) {
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
                IntroMovie_StartSpriteAnimAndMakeVisible(sceneData->starterSprites[i], FALSE);
            }
            IntroMovie_AdvanceSceneStep(data);
        }
        break;
    case 19:
        SetMasterBrightnessNeutral(PM_LCD_TOP);
        IntroMovie_StartSpriteAnimAndMakeVisible(sceneData->sparklesSprite, TRUE);
        IntroMovie_AdvanceSceneStep(data);
        break;
    case 20:
        if (!Sprite_IsCellAnimationRunning(sceneData->sparklesSprite)) {
            return TRUE;
        }
        break;
    }

    IntroMovie_Scene4_3DMain();
    return FALSE;
}

void IntroMovie_Scene4_Exit(IntroMovieOvyData *data, IntroMovieScene4Data *sceneData) {
    BgConfig *bgConfig = IntroMovie_GetBgConfig(data);
    Main_SetVBlankIntrCB(NULL, NULL);
    if (sceneData->needFreeGfx) {
        G2_BlendNone();
        sub_02014EBC(sceneData->particleSystem);
        FreeToHeap(sceneData->particleHeap);
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

void IntroMovie_Scene4_InitBgs(IntroMovieOvyData *data) {
    BgConfig *bgConfig = IntroMovie_GetBgConfig(data);

    {
        GraphicsModes spA8 = {  // 021EB634
            GX_DISPMODE_GRAPHICS,
            GX_BGMODE_0,
            GX_BGMODE_0,
            GX_BG0_AS_3D,
        };
        SetBothScreensModesAndDisable(&spA8);
    }

    {
        BgTemplate sp8C = {  // 021EB644
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
            0
        };
        InitBgFromTemplate(bgConfig, GF_BG_LYR_MAIN_1, &sp8C, 0);
    }

    {
        BgTemplate sp70 = {  // 021EB660
            0, 0,
            GF_BG_BUF_SIZE_256x256_4BPP,
            0,
            GF_BG_SCR_SIZE_256x256,
            GX_BG_COLORMODE_16,
            1,
            1,
            0,
            2,
            0,
            0,
            0
        };
        InitBgFromTemplate(bgConfig, GF_BG_LYR_MAIN_2, &sp70, 0);
    }

    {
        BgTemplate sp54 = {  // 021EB67C
            0, 0,
            GF_BG_BUF_SIZE_256x256_4BPP,
            0,
            GF_BG_SCR_SIZE_256x256,
            GX_BG_COLORMODE_16,
            2,
            1,
            0,
            3,
            0,
            0,
            0
        };
        InitBgFromTemplate(bgConfig, GF_BG_LYR_MAIN_3, &sp54, 0);
    }

    {
        BgTemplate sp38 = {  // 021EB698
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
            0
        };
        InitBgFromTemplate(bgConfig, GF_BG_LYR_SUB_1, &sp38, 0);
    }

    {
        BgTemplate sp1C = {  // 021EB6B4
            0, 0,
            GF_BG_BUF_SIZE_256x256_4BPP,
            0,
            GF_BG_SCR_SIZE_256x256,
            GX_BG_COLORMODE_16,
            1,
            1,
            0,
            2,
            0,
            0,
            0
        };
        InitBgFromTemplate(bgConfig, GF_BG_LYR_SUB_2, &sp1C, 0);
    }

    {
        BgTemplate sp00 = {  // 021EB6D0
            0, 0,
            GF_BG_BUF_SIZE_256x256_4BPP,
            0,
            GF_BG_SCR_SIZE_256x256,
            GX_BG_COLORMODE_16,
            2,
            1,
            0,
            3,
            0,
            0,
            0
        };
        InitBgFromTemplate(bgConfig, GF_BG_LYR_SUB_3, &sp00, 0);
    }
}

void InroMovie_Scene4_LoadBgGfx(BgConfig *bgConfig, IntroMovieScene4Data *sceneData) {
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

void IntroMovie_Scene4_EnableBgLayers(IntroMovieOvyData *data, BgConfig *bgConfig) {
    IntroMovieBgLinearAnims *animCnt = IntroMovie_GetBgLinearAnimsController(data);
    IntroMovie_StartBgScroll_VBlank(bgConfig, animCnt->scroll, GF_BG_LYR_SUB_1, -0xC0, 0, 0);
    IntroMovie_StartBgScroll_VBlank(bgConfig, animCnt->scroll, GF_BG_LYR_MAIN_1, 0xC0, 0, 0);
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG2, GF_PLANE_TOGGLE_OFF);
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG1, GF_PLANE_TOGGLE_OFF);
    GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG1, GF_PLANE_TOGGLE_OFF);
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG0, GF_PLANE_TOGGLE_ON);
}

void IntroMovie_Scene4_LoadSpriteGfx(IntroMovieOvyData *data, IntroMovieScene4Data *sceneData) {
    int sp48[3] = {  // _021EB610
        NARC_gs_opening_gs_opening_00000085_NCLR,
        NARC_gs_opening_gs_opening_00000093_NCLR,
        NARC_gs_opening_gs_opening_00000089_NCLR,
    };
    int sp3C[3] = {  // _021EB5EC
        NARC_gs_opening_gs_opening_00000086_NCGR_lz,
        NARC_gs_opening_gs_opening_00000094_NCGR_lz,
        NARC_gs_opening_gs_opening_00000090_NCGR_lz,
    };
    int sp30[3] = {  // _021EB604
        NARC_gs_opening_gs_opening_00000087_NANR_lz,
        NARC_gs_opening_gs_opening_00000095_NANR_lz,
        NARC_gs_opening_gs_opening_00000091_NANR_lz,
    };
    int sp24[3] = {  // _021EB628
        NARC_gs_opening_gs_opening_00000088_NCER_lz,
        NARC_gs_opening_gs_opening_00000096_NCER_lz,
        NARC_gs_opening_gs_opening_00000092_NCER_lz,
    };
    int sp18[3] = {1, 2, 3};  // _021EB5F8
    u8 i;
    _2DGfxResMan **resMen;

    IntroMovie_CreateSpriteResourceManagers(data, sIntroMovieScene4SpriteResCounts);
    resMen = IntroMovie_GetSpriteResourceManagersArray(data);
    sceneData->spriteResObjs[0][GF_GFX_RES_TYPE_CHAR] = AddCharResObjFromNarc(resMen[GF_GFX_RES_TYPE_CHAR], NARC_demo_opening_gs_opening, NARC_gs_opening_gs_opening_00000082_NCGR_lz, TRUE, 0, 3, HEAP_ID_INTRO_MOVIE);
    sceneData->spriteResObjs[0][GF_GFX_RES_TYPE_PLTT] = AddPlttResObjFromNarc(resMen[GF_GFX_RES_TYPE_PLTT], NARC_demo_opening_gs_opening, NARC_gs_opening_gs_opening_00000081_NCLR, FALSE, 0, 3, 2, HEAP_ID_INTRO_MOVIE);
    sceneData->spriteResObjs[0][GF_GFX_RES_TYPE_CELL] = AddCellOrAnimResObjFromNarc(resMen[GF_GFX_RES_TYPE_CELL], NARC_demo_opening_gs_opening, NARC_gs_opening_gs_opening_00000084_NCER_lz, TRUE, 0, GF_GFX_RES_TYPE_CELL, HEAP_ID_INTRO_MOVIE);
    sceneData->spriteResObjs[0][GF_GFX_RES_TYPE_ANIM] = AddCellOrAnimResObjFromNarc(resMen[GF_GFX_RES_TYPE_ANIM], NARC_demo_opening_gs_opening, NARC_gs_opening_gs_opening_00000083_NANR_lz, TRUE, 0, GF_GFX_RES_TYPE_ANIM, HEAP_ID_INTRO_MOVIE);

    for (i = 0; i < 3; ++i) {
        s32 id = sp18[i];
        sceneData->spriteResObjs[i + 1][GF_GFX_RES_TYPE_CHAR] = AddCharResObjFromNarc(resMen[GF_GFX_RES_TYPE_CHAR], NARC_demo_opening_gs_opening, sp3C[i], TRUE, id, 1, HEAP_ID_INTRO_MOVIE);
        sceneData->spriteResObjs[i + 1][GF_GFX_RES_TYPE_PLTT] = AddPlttResObjFromNarc(resMen[GF_GFX_RES_TYPE_PLTT], NARC_demo_opening_gs_opening, sp48[i], FALSE, id, 1, 1, HEAP_ID_INTRO_MOVIE);
        sceneData->spriteResObjs[i + 1][GF_GFX_RES_TYPE_CELL] = AddCellOrAnimResObjFromNarc(resMen[GF_GFX_RES_TYPE_CELL], NARC_demo_opening_gs_opening, sp24[i], TRUE, id, GF_GFX_RES_TYPE_CELL, HEAP_ID_INTRO_MOVIE);
        sceneData->spriteResObjs[i + 1][GF_GFX_RES_TYPE_ANIM] = AddCellOrAnimResObjFromNarc(resMen[GF_GFX_RES_TYPE_ANIM], NARC_demo_opening_gs_opening, sp30[i], TRUE, id, GF_GFX_RES_TYPE_ANIM, HEAP_ID_INTRO_MOVIE);
    }

    for (i = 0; i < 4; ++i) {
        sub_0200ACF0(sceneData->spriteResObjs[i][GF_GFX_RES_TYPE_CHAR]);
        sub_0200AF94(sceneData->spriteResObjs[i][GF_GFX_RES_TYPE_PLTT]);
    }

    GfGfx_EngineATogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_ON);
    GfGfx_EngineBTogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_ON);
}

void IntroMovie_Scene4_DestroySprites(IntroMovieOvyData *data, IntroMovieScene4Data *sceneData) {
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

void IntroMovie_Scene4_CreateSprites(IntroMovieOvyData *data, IntroMovieScene4Data *sceneData) {
    SpriteResourcesHeader header;
    SpriteTemplate template;
    int sp08[3] = {1, 2, 3};  // 021EB61C

    IntroMovie_BuildSpriteResourcesHeaderAndTemplate(0, data, 0, NNS_G2D_VRAM_TYPE_2DSUB, &template, &header);
    template.position.x = FX32_ONE * 128;
    template.position.y = FX32_ONE * (0x100 + 96);
    sceneData->hand1Sprite = CreateSprite(&template);
    Set2dSpriteAnimActiveFlag(sceneData->hand1Sprite, FALSE);
    Set2dSpriteVisibleFlag(sceneData->hand1Sprite, FALSE);
    Set2dSpriteAnimSeqNo(sceneData->hand1Sprite, 0);

    IntroMovie_BuildSpriteResourcesHeaderAndTemplate(0, data, 0, NNS_G2D_VRAM_TYPE_2DMAIN, &template, &header);
    template.position.x = FX32_ONE * 128;
    template.position.y = FX32_ONE * 96;
    sceneData->hand2Sprite = CreateSprite(&template);
    Set2dSpriteAnimActiveFlag(sceneData->hand2Sprite, FALSE);
    Set2dSpriteVisibleFlag(sceneData->hand2Sprite, FALSE);
    Set2dSpriteAnimSeqNo(sceneData->hand2Sprite, 1);

    IntroMovie_BuildSpriteResourcesHeaderAndTemplate(0, data, 0, NNS_G2D_VRAM_TYPE_2DMAIN, &template, &header);
    template.position.x = FX32_ONE * 128;
    template.position.y = FX32_ONE * 96;
    sceneData->sparklesSprite = CreateSprite(&template);
    Set2dSpriteAnimActiveFlag(sceneData->sparklesSprite, FALSE);
    Set2dSpriteVisibleFlag(sceneData->sparklesSprite, FALSE);
    Set2dSpriteAnimSeqNo(sceneData->sparklesSprite, 2);

    for (u8 i = 0; i < 3; ++i) {
        IntroMovie_BuildSpriteResourcesHeaderAndTemplate(sp08[i], data, 0, NNS_G2D_VRAM_TYPE_2DMAIN, &template, &header);
        template.position.x = FX32_ONE * 128;
        template.position.y = FX32_ONE * 96;
        sceneData->starterSprites[i] = CreateSprite(&template);
        Set2dSpriteAnimActiveFlag(sceneData->starterSprites[i], FALSE);
        Set2dSpriteVisibleFlag(sceneData->starterSprites[i], FALSE);
        Set2dSpriteAnimSeqNo(sceneData->starterSprites[i], 0);
    }
}

u32 IntroMovie_Scene4_TexAlloc(u32 size, BOOL is4x4comp) {
    NNSGfdTexKey key = NNS_GfdAllocTexVram(size, is4x4comp, 0);
    sub_02015354(key);
    GF_ASSERT(key != NNS_GFD_ALLOC_ERROR_TEXKEY);
    return NNS_GfdGetTexKeyAddr(key);
}

u32 IntroMovie_Scene4_PlttAlloc(u32 size, BOOL is4pltt) {
    NNSGfdPlttKey key = NNS_GfdAllocPlttVram(size, is4pltt, 1);
    GF_ASSERT(key != NNS_GFD_ALLOC_ERROR_PLTTKEY);
    sub_02015394(key);
    return NNS_GfdGetPlttKeyAddr(key);
}

void IntroMovie_Scene4_SPLEmitterCB(struct SPLEmitter *emitter) {
    VecFx32 pos = {0, 0, 0};
    SetVec(pos, 0, 0, FX32_CONST(0.015625));

    SPL_SetEmitterPositionX(emitter, pos.x);
    SPL_SetEmitterPositionY(emitter, pos.y);
    SPL_SetEmitterPositionZ(emitter, pos.z);
}

void IntroMovie_Scene4_3DMain(void) {
    Thunk_G3X_Reset();
    sub_0201543C();
    sub_02015460();
    sub_02026E50(1, 0);
}

void IntroMovie_Scene4_StartParticleEmitters(IntroMovieScene4Data *sceneData, int whichStarter) {
    sub_02015528(sceneData->particleSystem, 1);
    sub_02015494(sceneData->particleSystem, sStarterParticleResIds[whichStarter][0], IntroMovie_Scene4_SPLEmitterCB, NULL);
    sub_02015494(sceneData->particleSystem, sStarterParticleResIds[whichStarter][1], IntroMovie_Scene4_SPLEmitterCB, NULL);
    sub_02015494(sceneData->particleSystem, sStarterParticleResIds[whichStarter][2], IntroMovie_Scene4_SPLEmitterCB, NULL);
}

void IntroMovie_Scene4_3DVRamManInit(void) {
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

void IntroMovie_Scene4_FlipScreensAtNextVBlank(IntroMovieScene4Data *sceneData, int whichScreen) {
    sceneData->flipScreensTaskArg = whichScreen;
    sceneData->flipScreensTask = SysTask_CreateOnVBlankQueue(Task_IntroMovie_Scene4_FlipScreens, sceneData, 0);
}

void Task_IntroMovie_Scene4_FlipScreens(SysTask *task, void *pVoid) {
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
    static const HeapID sDeadstrippedRodata[1] = {HEAP_ID_INTRO_MOVIE};
    return sDeadstrippedRodata[idx];
}
