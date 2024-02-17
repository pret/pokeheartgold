#include "gf_gfx_loader.h"
#include "global.h"
#include "intro_movie_internal.h"
#include "math_util.h"
#include "system.h"
#include "sys_task_api.h"
#include "unk_0200ACF0.h"
#include "unk_0200B150.h"
#include "unk_0200FA24.h"
#include "unk_020215A0.h"
#include "unk_02022588.h"
#include "demo/opening/gs_opening.naix"

void IntroMovie_Scene2_VBlankCB(void *pVoid);
void IntroMovie_Scene2_Init(IntroMovieOvyData *data, IntroMovieScene2Data *sceneData);
BOOL IntroMovie_Scene2_Main(IntroMovieOvyData *data, IntroMovieScene2Data *sceneData, int a2);
void IntroMovie_Scene2_Exit(IntroMovieOvyData *data, IntroMovieScene2Data *sceneData);
void IntroMovie_Scene2_InitFlyoverGrassBgScrollAnims(IntroMovieOvyData *data, BgConfig *bgConfig);
void IntroMovie_Scene2_InitBgs(IntroMovieOvyData *data);
void IntroMovie_Scene2_LoadBgGfx(BgConfig *bgConfig);
void IntroMovie_Scene2_LoadSpriteGfx(IntroMovieOvyData *data, IntroMovieScene2Data *sceneData);
void IntroMovie_Scene2_DeleteSprites(IntroMovieOvyData *data, IntroMovieScene2Data *sceneData);
void IntroMovie_Scene2_CreateSprites(IntroMovieOvyData *data, IntroMovieScene2Data *sceneData);
void IntroMovie_Scene2_StartSpritePanEffect(IntroMovieScene2Data *sceneData, int whichSprites, int xSpeed, int ySpeed, int duration);
BOOL IntroMovie_Scene2_WaitSpritePanEffect(IntroMovieScene2Data *sceneData, int whichSprites);
void ov60_021E8B7C(SysTask *task, void *pVoid);

const int sIntroMovie_Scene2_FlowerSpriteAppearTiming[10] = {
    1,
    8,
    16,
    24,
    28,
    32,
    34,
    38,
    42,
    48,
};

const u8 sIntroMovieScene2SpriteResCounts[4] = {2, 2, 2, 2};

BOOL IntroMovie_Scene2(IntroMovieOvyData *data, void *pVoid) {
    IntroMovieScene2Data *sceneData = (IntroMovieScene2Data *)pVoid;

    if (IntroMovie_GetIntroSkippedFlag(data)) {
        sceneData->state = 2;
    }

    switch (sceneData->state) {
    case 0:
        IntroMovie_Scene2_Init(data, sceneData);
        ++sceneData->state;
        break;
    case 1:
        if (IntroMovie_Scene2_Main(data, sceneData, IntroMovie_GetTotalFrameCount(data))) {
            ++sceneData->state;
        }
        break;
    case 2:
        IntroMovie_Scene2_Exit(data, sceneData);
        return TRUE;
    }

    return FALSE;
}

void IntroMovie_Scene2_VBlankCB(void *pVoid) {
    IntroMovieOvyData *data = (IntroMovieOvyData *)pVoid;
    DoScheduledBgGpuUpdates(IntroMovie_GetBgConfig(data));
    OamManager_ApplyAndResetBuffers();
}

void IntroMovie_Scene2_Init(IntroMovieOvyData *data, IntroMovieScene2Data *sceneData) {
    sub_0200FBF4(PM_LCD_TOP, RGB_WHITE);
    sub_0200FBF4(PM_LCD_BOTTOM, RGB_WHITE);
    BgConfig *bgConfig = IntroMovie_GetBgConfig(data);
    sub_020216C8();
    sub_02022638();
    gSystem.screensFlipped = FALSE;
    GfGfx_SwapDisplay();
    IntroMovie_Scene2_InitBgs(data);
    IntroMovie_InitBgAnimGxState(data);
    Main_SetVBlankIntrCB(IntroMovie_Scene2_VBlankCB, data);
    IntroMovie_Scene2_LoadBgGfx(bgConfig);
    IntroMovie_RendererSetSurfaceCoords(data, 0, 0, 0, 192);
    IntroMovie_Scene2_LoadSpriteGfx(data, sceneData);
    IntroMovie_Scene2_CreateSprites(data, sceneData);
    IntroMovie_Scene2_InitFlyoverGrassBgScrollAnims(data, bgConfig);
    sceneData->needFreeGfx = 1;
}

void IntroMovie_Scene2_InitFlyoverGrassBgScrollAnims(IntroMovieOvyData *data, BgConfig *bgConfig) {
    IntroMovieBgLinearAnims *bgAnimCnt = IntroMovie_GetBgLinearAnimsController(data);
    IntroMovie_StartBgScroll_VBlank(bgConfig, bgAnimCnt->scroll, GF_BG_LYR_MAIN_1, 0, 0x140, 0);
    IntroMovie_StartBgScroll_VBlank(bgConfig, bgAnimCnt->scroll, GF_BG_LYR_MAIN_0, 0, 0xC0, 0);
    IntroMovie_StartBgScroll_VBlank(bgConfig, bgAnimCnt->scroll, GF_BG_LYR_MAIN_2, 0, 0x40, -1);
    IntroMovie_StartBgScroll_VBlank(bgConfig, bgAnimCnt->scroll, GF_BG_LYR_SUB_0, 0, 0x40, -1);
}

BOOL IntroMovie_Scene2_Main(IntroMovieOvyData *data, IntroMovieScene2Data *sceneData, int totalFrames) {
    BgConfig *bgConfig = IntroMovie_GetBgConfig(data);
    IntroMovieBgLinearAnims *bgAnimCnt = IntroMovie_GetBgLinearAnimsController(data);
    u8 stepTimer = IntroMovie_GetSceneStepTimer(data);
    switch (IntroMovie_GetSceneStep(data)) {
    case 0:
        BeginNormalPaletteFade(0, 1, 1, RGB_WHITE, 3, 1, HEAP_ID_INTRO_MOVIE);
        sceneData->flowerIndex = 0;
        IntroMovie_AdvanceSceneStep(data);
        break;
    case 1:
        if (sceneData->flowerIndex < NELEMS(sIntroMovie_Scene2_FlowerSpriteAppearTiming) && sIntroMovie_Scene2_FlowerSpriteAppearTiming[sceneData->flowerIndex] == stepTimer) {
            IntroMovie_StartSpriteAnimAndMakeVisible(sceneData->flowerSprites[sceneData->flowerIndex], TRUE);
            ++sceneData->flowerIndex;
        }
        if (stepTimer > 55) {
            IntroMovie_StartBgScroll_NotVBlank(bgConfig, bgAnimCnt->scroll, GF_BG_LYR_MAIN_1, 0, -0xC0, 5);
            IntroMovie_StartBgScroll_NotVBlank(bgConfig, bgAnimCnt->scroll, GF_BG_LYR_MAIN_0, 0, -0xC0, 5);
            IntroMovie_Scene2_StartSpritePanEffect(sceneData, 0, 0, 0xC0, 5);
            IntroMovie_Scene2_StartSpritePanEffect(sceneData, 1, 0, 0xC0, 5);
            BeginNormalPaletteFade(4, 0, 0, RGB_BLACK, 8, 1, HEAP_ID_INTRO_MOVIE);
            IntroMovie_AdvanceSceneStep(data);
        }
        break;
    case 2:
        if (IntroMovie_WaitBgScrollAnim(bgAnimCnt->scroll, GF_BG_LYR_MAIN_1) && IntroMovie_WaitBgScrollAnim(bgAnimCnt->scroll, GF_BG_LYR_MAIN_0) && IntroMovie_Scene2_WaitSpritePanEffect(sceneData, 0) && IntroMovie_Scene2_WaitSpritePanEffect(sceneData, 1) && IsPaletteFadeFinished()) {
            IntroMovie_StartBgScroll_NotVBlank(bgConfig, bgAnimCnt->scroll, GF_BG_LYR_MAIN_1, 0x20, 0, 0x5A);
            IntroMovie_StartBgScroll_NotVBlank(bgConfig, bgAnimCnt->scroll, GF_BG_LYR_MAIN_0, 0x20, 0, 0x5A);
            IntroMovie_Scene2_StartSpritePanEffect(sceneData, 0, -0x20, 0, 0x5A);
            IntroMovie_Scene2_StartSpritePanEffect(sceneData, 1, -0x20, 0, 0x5A);
            IntroMovie_AdvanceSceneStep(data);
        }
        break;
    case 3:
        if (IntroMovie_WaitBgScrollAnim(bgAnimCnt->scroll, GF_BG_LYR_MAIN_1) && IntroMovie_WaitBgScrollAnim(bgAnimCnt->scroll, GF_BG_LYR_MAIN_0) && IntroMovie_Scene2_WaitSpritePanEffect(sceneData, 0) && IntroMovie_Scene2_WaitSpritePanEffect(sceneData, 1)) {
            IntroMovie_StartBgScroll_NotVBlank(bgConfig, bgAnimCnt->scroll, GF_BG_LYR_MAIN_1, 0x40, 0, 7);
            IntroMovie_StartBgScroll_NotVBlank(bgConfig, bgAnimCnt->scroll, GF_BG_LYR_MAIN_0, 0x40, 0, 7);
            IntroMovie_Scene2_StartSpritePanEffect(sceneData, 0, -0x40, 0, 7);
            IntroMovie_Scene2_StartSpritePanEffect(sceneData, 1, -0x40, 0, 7);
            IntroMovie_AdvanceSceneStep(data);
        }
        break;
    case 4:
        if (IntroMovie_WaitBgScrollAnim(bgAnimCnt->scroll, GF_BG_LYR_MAIN_1) && IntroMovie_WaitBgScrollAnim(bgAnimCnt->scroll, GF_BG_LYR_MAIN_0) && IntroMovie_Scene2_WaitSpritePanEffect(sceneData, 0) && IntroMovie_Scene2_WaitSpritePanEffect(sceneData, 1)) {
            IntroMovie_StartBgScroll_NotVBlank(bgConfig, bgAnimCnt->scroll, GF_BG_LYR_MAIN_1, 0x20, 0, 0x42);
            IntroMovie_StartBgScroll_NotVBlank(bgConfig, bgAnimCnt->scroll, GF_BG_LYR_MAIN_0, 0x20, 0, 0x42);
            IntroMovie_Scene2_StartSpritePanEffect(sceneData, 0, -0x20, 0, 0x42);
            IntroMovie_Scene2_StartSpritePanEffect(sceneData, 1, -0x20, 0, 0x42);
            IntroMovie_AdvanceSceneStep(data);
        }
        break;
    case 5:
        if (IntroMovie_WaitBgScrollAnim(bgAnimCnt->scroll, GF_BG_LYR_MAIN_1) && IntroMovie_WaitBgScrollAnim(bgAnimCnt->scroll, GF_BG_LYR_MAIN_0) && IntroMovie_Scene2_WaitSpritePanEffect(sceneData, 0) && IntroMovie_Scene2_WaitSpritePanEffect(sceneData, 1)) {
            IntroMovie_StartBgScroll_NotVBlank(bgConfig, bgAnimCnt->scroll, GF_BG_LYR_MAIN_1, 0, -0x80, 10);
            IntroMovie_StartBgScroll_NotVBlank(bgConfig, bgAnimCnt->scroll, GF_BG_LYR_MAIN_0, 0, -0x40, 5);
            IntroMovie_Scene2_StartSpritePanEffect(sceneData, 0, 0, 0x80, 10);
            IntroMovie_Scene2_StartSpritePanEffect(sceneData, 1, 0, 0x80, 10);
            IntroMovie_AdvanceSceneStep(data);
        }
        break;
    case 6:
        if (IntroMovie_WaitBgScrollAnim(bgAnimCnt->scroll, GF_BG_LYR_MAIN_1) && IntroMovie_WaitBgScrollAnim(bgAnimCnt->scroll, GF_BG_LYR_MAIN_0) && IntroMovie_Scene2_WaitSpritePanEffect(sceneData, 0) && IntroMovie_Scene2_WaitSpritePanEffect(sceneData, 1)) {
            IntroMovie_BeginCircleWipeEffect(data, 1, 1, 8);
            IntroMovie_AdvanceSceneStep(data);
        }
        break;
    case 7:
        if (IntroMovie_WaitCircleWipeEffect(data)) {
            return TRUE;
        }
        break;
    }

    return FALSE;
}

void IntroMovie_Scene2_Exit(IntroMovieOvyData *data, IntroMovieScene2Data *sceneData) {
    BgConfig *bgConfig;
    IntroMovieBgLinearAnims *bgAnimCnt;

    bgAnimCnt = IntroMovie_GetBgLinearAnimsController(data);
    bgConfig = IntroMovie_GetBgConfig(data);
    Main_SetVBlankIntrCB(NULL, NULL);
    if (sceneData->needFreeGfx) {
        for (u8 i = 0; i < 2; ++i) {
            if (sceneData->spritePanCnt[i].task != NULL) {
                SysTask_Destroy(sceneData->spritePanCnt[i].task);
                sceneData->spritePanCnt[i].task = NULL;
            }
        }
        IntroMovie_Scene2_DeleteSprites(data, sceneData);
        IntroMovie_CancelBgScrollAnim(bgAnimCnt->scroll, GF_BG_LYR_SUB_0);
        IntroMovie_CancelBgScrollAnim(bgAnimCnt->scroll, GF_BG_LYR_MAIN_2);
        FreeBgTilemapBuffer(bgConfig, GF_BG_LYR_SUB_0);
        FreeBgTilemapBuffer(bgConfig, GF_BG_LYR_MAIN_0);
        FreeBgTilemapBuffer(bgConfig, GF_BG_LYR_MAIN_1);
        FreeBgTilemapBuffer(bgConfig, GF_BG_LYR_MAIN_2);
        sceneData->needFreeGfx = FALSE;
    }
}

void IntroMovie_Scene2_InitBgs(IntroMovieOvyData *data) {
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
            0,
            0,
            0,
            0
        };
        InitBgFromTemplate(bgConfig, GF_BG_LYR_SUB_0, &bgTemplate, GX_BGMODE_0);
    }

    {
        BgTemplate bgTemplate = {
            0, 0,
            GF_BG_BUF_SIZE_256x256_4BPP,
            0,
            GF_BG_SCR_SIZE_256x256,
            GX_BG_COLORMODE_16,
            0,
            2,
            0,
            0,
            0,
            0,
            0
        };
        InitBgFromTemplate(bgConfig, GF_BG_LYR_MAIN_0, &bgTemplate, GX_BGMODE_0);
    }

    {
        BgTemplate bgTemplate = {
            0, 0,
            GF_BG_BUF_SIZE_512x512_4BPP,
            0,
            GF_BG_SCR_SIZE_512x512,
            GX_BG_COLORMODE_16,
            1,
            2,
            0,
            1,
            0,
            0,
            0
        };
        InitBgFromTemplate(bgConfig, GF_BG_LYR_MAIN_1, &bgTemplate, GX_BGMODE_0);
    }

    {
        BgTemplate bgTemplate = {
            0, 0,
            GF_BG_BUF_SIZE_256x256_4BPP,
            0,
            GF_BG_SCR_SIZE_256x256,
            GX_BG_COLORMODE_16,
            5,
            2,
            0,
            2,
            0,
            0,
            0
        };
        InitBgFromTemplate(bgConfig, GF_BG_LYR_MAIN_2, &bgTemplate, GX_BGMODE_0);
    }
}

void IntroMovie_Scene2_LoadBgGfx(BgConfig *bgConfig) {
    GfGfxLoader_LoadCharData(NARC_demo_opening_gs_opening, NARC_gs_opening_gs_opening_00000033_NCGR_lz, bgConfig, GF_BG_LYR_MAIN_2, 0, 0, TRUE, HEAP_ID_INTRO_MOVIE);
    GfGfxLoader_LoadCharData(NARC_demo_opening_gs_opening, NARC_gs_opening_gs_opening_00000034_NCGR_lz, bgConfig, GF_BG_LYR_SUB_0, 0, 0, TRUE, HEAP_ID_INTRO_MOVIE);
    GfGfxLoader_LoadScrnData(NARC_demo_opening_gs_opening, NARC_gs_opening_gs_opening_00000035_NSCR_lz, bgConfig, GF_BG_LYR_MAIN_2, 0, 0, TRUE, HEAP_ID_INTRO_MOVIE);
    GfGfxLoader_LoadScrnData(NARC_demo_opening_gs_opening, NARC_gs_opening_gs_opening_00000036_NSCR_lz, bgConfig, GF_BG_LYR_SUB_0, 0, 0, TRUE, HEAP_ID_INTRO_MOVIE);
    GfGfxLoader_LoadScrnData(NARC_demo_opening_gs_opening, NARC_gs_opening_gs_opening_00000037_NSCR_lz, bgConfig, GF_BG_LYR_MAIN_1, 0, 0, TRUE, HEAP_ID_INTRO_MOVIE);
    GfGfxLoader_LoadScrnData(NARC_demo_opening_gs_opening, NARC_gs_opening_gs_opening_00000038_NSCR_lz, bgConfig, GF_BG_LYR_MAIN_0, 0, 0, TRUE, HEAP_ID_INTRO_MOVIE);
    GfGfxLoader_GXLoadPal(NARC_demo_opening_gs_opening, NARC_gs_opening_gs_opening_00000032_NCLR, GF_PAL_LOCATION_MAIN_BG, (enum GFPalSlotOffset)0, 0x80, HEAP_ID_INTRO_MOVIE);
    GfGfxLoader_GXLoadPal(NARC_demo_opening_gs_opening, NARC_gs_opening_gs_opening_00000031_NCLR, GF_PAL_LOCATION_SUB_BG, (enum GFPalSlotOffset)0, 0x80, HEAP_ID_INTRO_MOVIE);
    OS_WaitIrq(TRUE, OS_IE_V_BLANK);
    GfGfx_BothDispOn();
}

void IntroMovie_Scene2_LoadSpriteGfx(IntroMovieOvyData *data, IntroMovieScene2Data *sceneData) {
    IntroMovie_CreateSpriteResourceManagers(data, sIntroMovieScene2SpriteResCounts);
    _2DGfxResMan **resMen = IntroMovie_GetSpriteResourceManagersArray(data);
    sceneData->spriteGfxRes[0][GF_GFX_RES_TYPE_CHAR] = AddCharResObjFromNarc(resMen[GF_GFX_RES_TYPE_CHAR], NARC_demo_opening_gs_opening, NARC_gs_opening_gs_opening_00000078_NCGR_lz, TRUE, 0, 3, HEAP_ID_INTRO_MOVIE);
    sceneData->spriteGfxRes[0][GF_GFX_RES_TYPE_PLTT] = AddPlttResObjFromNarc(resMen[GF_GFX_RES_TYPE_PLTT], NARC_demo_opening_gs_opening, NARC_gs_opening_gs_opening_00000077_NCLR, FALSE, 0, 3, 1, HEAP_ID_INTRO_MOVIE);
    sceneData->spriteGfxRes[0][GF_GFX_RES_TYPE_CELL] = AddCellOrAnimResObjFromNarc(resMen[GF_GFX_RES_TYPE_CELL], NARC_demo_opening_gs_opening, NARC_gs_opening_gs_opening_00000080_NCER_lz, TRUE, 0, GF_GFX_RES_TYPE_CELL, HEAP_ID_INTRO_MOVIE);
    sceneData->spriteGfxRes[0][GF_GFX_RES_TYPE_ANIM] = AddCellOrAnimResObjFromNarc(resMen[GF_GFX_RES_TYPE_ANIM], NARC_demo_opening_gs_opening, NARC_gs_opening_gs_opening_00000079_NANR_lz, TRUE, 0, GF_GFX_RES_TYPE_ANIM, HEAP_ID_INTRO_MOVIE);
    sceneData->spriteGfxRes[1][GF_GFX_RES_TYPE_CHAR] = AddCharResObjFromNarc(resMen[GF_GFX_RES_TYPE_CHAR], NARC_demo_opening_gs_opening, NARC_gs_opening_gs_opening_00000074_NCGR_lz, TRUE, 1, 1, HEAP_ID_INTRO_MOVIE);
    sceneData->spriteGfxRes[1][GF_GFX_RES_TYPE_PLTT] = AddPlttResObjFromNarc(resMen[GF_GFX_RES_TYPE_PLTT], NARC_demo_opening_gs_opening, NARC_gs_opening_gs_opening_00000073_NCLR, FALSE, 1, 1, 2, HEAP_ID_INTRO_MOVIE);
    sceneData->spriteGfxRes[1][GF_GFX_RES_TYPE_CELL] = AddCellOrAnimResObjFromNarc(resMen[GF_GFX_RES_TYPE_CELL], NARC_demo_opening_gs_opening, NARC_gs_opening_gs_opening_00000076_NCER_lz, TRUE, 1, GF_GFX_RES_TYPE_CELL, HEAP_ID_INTRO_MOVIE);
    sceneData->spriteGfxRes[1][GF_GFX_RES_TYPE_ANIM] = AddCellOrAnimResObjFromNarc(resMen[GF_GFX_RES_TYPE_ANIM], NARC_demo_opening_gs_opening, NARC_gs_opening_gs_opening_00000075_NANR_lz, TRUE, 1, GF_GFX_RES_TYPE_ANIM, HEAP_ID_INTRO_MOVIE);
    for (u8 i = 0; i < 2; ++i) {
        sub_0200ACF0(sceneData->spriteGfxRes[i][GF_GFX_RES_TYPE_CHAR]);
        sub_0200AF94(sceneData->spriteGfxRes[i][GF_GFX_RES_TYPE_PLTT]);
    }
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_ON);
    GfGfx_EngineBTogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_ON);
}

void IntroMovie_Scene2_DeleteSprites(IntroMovieOvyData *data, IntroMovieScene2Data *sceneData) {
    Sprite_Delete(sceneData->ethanSprite0);
    Sprite_Delete(sceneData->lyraSprite0);
    Sprite_Delete(sceneData->ethanSprite1);
    Sprite_Delete(sceneData->lyraSprite1);
    Sprite_Delete(sceneData->ethanSprite2);
    Sprite_Delete(sceneData->lyraSprite2);
    for (u8 i = 0; i < 10; ++i) {
        Sprite_Delete(sceneData->flowerSprites[i]);
    }
    for (u8 i = 0; i < 2; ++i) {
        sub_0200AEB0(sceneData->spriteGfxRes[i][GF_GFX_RES_TYPE_CHAR]);
        sub_0200B0A8(sceneData->spriteGfxRes[i][GF_GFX_RES_TYPE_PLTT]);
    }
    IntroMovie_DestroySpriteResourceManagers(data);
}

void IntroMovie_Scene2_CreateSprites(IntroMovieOvyData *data, IntroMovieScene2Data *sceneData) {
    SpriteResourcesHeader spriteHeader;
    SpriteTemplate spriteTemplate;
    u8 anims[10] = {
        0, 1, 2, 3, 0, 1, 2, 3, 0, 1,
    };

    IntroMovie_BuildSpriteResourcesHeaderAndTemplate(0, data, 0, NNS_G2D_VRAM_TYPE_MAX, &spriteTemplate, &spriteHeader);
    spriteTemplate.position.x = 128 * FX32_ONE;
    spriteTemplate.position.y = 192 * FX32_ONE;

    for (u8 i = 0; i < 10; ++i) {
        sceneData->flowerSprites[i] = CreateSprite(&spriteTemplate);
        Set2dSpriteAnimActiveFlag(sceneData->flowerSprites[i], FALSE);
        Set2dSpriteVisibleFlag(sceneData->flowerSprites[i], FALSE);
        Set2dSpriteAnimSeqNo(sceneData->flowerSprites[i], anims[i]);
    }

    IntroMovie_BuildSpriteResourcesHeaderAndTemplate(1, data, 1, NNS_G2D_VRAM_TYPE_2DMAIN, &spriteTemplate, &spriteHeader);
    spriteTemplate.position.x = 64 * FX32_ONE;
    spriteTemplate.position.y = -96 * FX32_ONE;
    sceneData->ethanSprite0 = CreateSprite(&spriteTemplate);
    Set2dSpriteAnimActiveFlag(sceneData->ethanSprite0, FALSE);
    Set2dSpriteVisibleFlag(sceneData->ethanSprite0, TRUE);
    Set2dSpriteAnimSeqNo(sceneData->ethanSprite0, 0);
    sceneData->ethanSprite1 = CreateSprite(&spriteTemplate);
    Set2dSpriteAnimActiveFlag(sceneData->ethanSprite1, FALSE);
    Set2dSpriteVisibleFlag(sceneData->ethanSprite1, TRUE);
    Set2dSpriteAnimSeqNo(sceneData->ethanSprite1, 1);
    sceneData->ethanSprite2 = CreateSprite(&spriteTemplate);
    Set2dSpriteAnimActiveFlag(sceneData->ethanSprite2, FALSE);
    Set2dSpriteVisibleFlag(sceneData->ethanSprite2, TRUE);
    Set2dSpriteAnimSeqNo(sceneData->ethanSprite2, 2);

    IntroMovie_BuildSpriteResourcesHeaderAndTemplate(1, data, 1, NNS_G2D_VRAM_TYPE_2DMAIN, &spriteTemplate, &spriteHeader);
    spriteTemplate.position.x = 320 * FX32_ONE;
    spriteTemplate.position.y = -96 * FX32_ONE;
    sceneData->lyraSprite0 = CreateSprite(&spriteTemplate);
    Set2dSpriteAnimActiveFlag(sceneData->lyraSprite0, FALSE);
    Set2dSpriteVisibleFlag(sceneData->lyraSprite0, TRUE);
    Set2dSpriteAnimSeqNo(sceneData->lyraSprite0, 3);
    sceneData->lyraSprite1 = CreateSprite(&spriteTemplate);
    Set2dSpriteAnimActiveFlag(sceneData->lyraSprite1, FALSE);
    Set2dSpriteVisibleFlag(sceneData->lyraSprite1, TRUE);
    Set2dSpriteAnimSeqNo(sceneData->lyraSprite1, 4);
    sceneData->lyraSprite2 = CreateSprite(&spriteTemplate);
    Set2dSpriteAnimActiveFlag(sceneData->lyraSprite2, FALSE);
    Set2dSpriteVisibleFlag(sceneData->lyraSprite2, TRUE);
    Set2dSpriteAnimSeqNo(sceneData->lyraSprite2, 5);
}

void IntroMovie_Scene2_StartSpritePanEffect(IntroMovieScene2Data *sceneData, int whichSprites, int xSpeed, int ySpeed, int duration) {
    IntroMovieScene2SpritePanController *spritePanEffect;

    if (whichSprites == 0) {
        spritePanEffect = &sceneData->spritePanCnt[0];
        spritePanEffect->sprite0 = sceneData->ethanSprite0;
        spritePanEffect->sprite1 = sceneData->ethanSprite1;
        spritePanEffect->sprite2 = sceneData->ethanSprite2;
    } else {
        spritePanEffect = &sceneData->spritePanCnt[1];
        spritePanEffect->sprite0 = sceneData->lyraSprite0;
        spritePanEffect->sprite1 = sceneData->lyraSprite1;
        spritePanEffect->sprite2 = sceneData->lyraSprite2;
    }
    GF_ASSERT(!spritePanEffect->active);
    spritePanEffect->active = TRUE;
    spritePanEffect->duration = duration;
    spritePanEffect->counter = 0;
    spritePanEffect->finished = 0;
    VecFx32 *mtx = Sprite_GetMatrixPtr(spritePanEffect->sprite0);
    spritePanEffect->xOffset = mtx->x / FX32_ONE;
    spritePanEffect->yOffset = mtx->y / FX32_ONE;
    spritePanEffect->xSpeed = xSpeed;
    spritePanEffect->ySpeed = ySpeed;
    spritePanEffect->task = SysTask_CreateOnMainQueue(ov60_021E8B7C, spritePanEffect, 0);
}

BOOL IntroMovie_Scene2_WaitSpritePanEffect(IntroMovieScene2Data *sceneData, int whichSprites) {
    IntroMovieScene2SpritePanController *spritePanCnt;
    if (whichSprites == 0) {
        spritePanCnt = &sceneData->spritePanCnt[0];
    } else {
        spritePanCnt = &sceneData->spritePanCnt[1];
    }

    if (!spritePanCnt->active) {
        return TRUE;
    }
    if (spritePanCnt->finished) {
        return TRUE;
    }

    return FALSE;
}

void ov60_021E8B7C(SysTask *task, void *pVoid) {
    IntroMovieScene2SpritePanController *spritePanCnt = (IntroMovieScene2SpritePanController *)pVoid;
    VecFx32 sp4 = {0, 0, 0};
    ++spritePanCnt->counter;
    int x = spritePanCnt->xSpeed * spritePanCnt->counter / spritePanCnt->duration;
    int y = spritePanCnt->ySpeed * spritePanCnt->counter / spritePanCnt->duration;
    x += spritePanCnt->xOffset;
    y += spritePanCnt->yOffset;
    if (spritePanCnt->counter >= spritePanCnt->duration) {
        SysTask_Destroy(spritePanCnt->task);
        spritePanCnt->task = NULL;
        spritePanCnt->finished = TRUE;
        spritePanCnt->active = FALSE;
    }
    sp4.x = x * FX32_ONE;
    sp4.y = y * FX32_ONE;
    Sprite_SetMatrix(spritePanCnt->sprite0, &sp4);
    Sprite_SetMatrix(spritePanCnt->sprite1, &sp4);
    Sprite_SetMatrix(spritePanCnt->sprite2, &sp4);
}

HeapID _deadstrip_02(int idx);
HeapID _deadstrip_02(int idx) {
    static const HeapID sDeadstrippedRodata[1] = {HEAP_ID_INTRO_MOVIE};
    return sDeadstrippedRodata[0];
}
