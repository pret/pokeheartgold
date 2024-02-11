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

void IntroMovie_Scene2_VBlankCB(void *pVoid);
void IntroMovie_Scene2_Init(IntroMovieOvyData *data, IntroMovieScene2Data *sceneData);
BOOL IntroMovie_Scene2_Main(IntroMovieOvyData *data, IntroMovieScene2Data *sceneData, int a2);
void IntroMovie_Scene2_Exit(IntroMovieOvyData *data, IntroMovieScene2Data *sceneData);
void IntroMovie_Scene2_InitFlyoverGrassBgScrollAnims(IntroMovieOvyData *data, BgConfig *bgConfig);
void ov60_021E866C(IntroMovieOvyData *data);
void ov60_021E8724(BgConfig *bgConfig);
void ov60_021E87FC(IntroMovieOvyData *data, IntroMovieScene2Data *sceneData);
void IntroMovie_Scene2_DeleteSprites(IntroMovieOvyData *data, IntroMovieScene2Data *sceneData);
void ov60_021E8978(IntroMovieOvyData *data, IntroMovieScene2Data *sceneData);
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

const u8 _021EB138[4] = {2, 2, 2, 2};

BOOL IntroMovie_Scene2(IntroMovieOvyData *data, void *pVoid) {
    IntroMovieScene2Data *sceneData = (IntroMovieScene2Data *)pVoid;

    if (IntroMovie_GetIntroSkippedFlag(data)) {
        sceneData->unk_000 = 2;
    }

    switch (sceneData->unk_000) {
    case 0:
        IntroMovie_Scene2_Init(data, sceneData);
        ++sceneData->unk_000;
        break;
    case 1:
        if (IntroMovie_Scene2_Main(data, sceneData, IntroMovie_GetTotalFrameCount(data))) {
            ++sceneData->unk_000;
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
    ov60_021E866C(data);
    IntroMovie_InitBgAnimGxState(data);
    Main_SetVBlankIntrCB(IntroMovie_Scene2_VBlankCB, data);
    ov60_021E8724(bgConfig);
    IntroMovie_RendererSetSurfaceCoords(data, 0, 0, 0, 0xC0);
    ov60_021E87FC(data, sceneData);
    ov60_021E8978(data, sceneData);
    IntroMovie_Scene2_InitFlyoverGrassBgScrollAnims(data, bgConfig);
    sceneData->unk_001 = 1;
}

void IntroMovie_Scene2_InitFlyoverGrassBgScrollAnims(IntroMovieOvyData *data, BgConfig *bgConfig) {
    IntroMovieBgLinearAnims *unk_46C = IntroMovie_GetBgLinearAnimsController(data);
    IntroMovie_StartBgScroll_VBlank(bgConfig, unk_46C->scroll, GF_BG_LYR_MAIN_1, 0, 0x140, 0);
    IntroMovie_StartBgScroll_VBlank(bgConfig, unk_46C->scroll, GF_BG_LYR_MAIN_0, 0, 0xC0, 0);
    IntroMovie_StartBgScroll_VBlank(bgConfig, unk_46C->scroll, GF_BG_LYR_MAIN_2, 0, 0x40, -1);
    IntroMovie_StartBgScroll_VBlank(bgConfig, unk_46C->scroll, GF_BG_LYR_SUB_0, 0, 0x40, -1);
}

BOOL IntroMovie_Scene2_Main(IntroMovieOvyData *data, IntroMovieScene2Data *sceneData, int totalFrames) {
    BgConfig *bgConfig = IntroMovie_GetBgConfig(data);
    IntroMovieBgLinearAnims *unk_46C = IntroMovie_GetBgLinearAnimsController(data);
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
            IntroMovie_StartBgScroll_NotVBlank(bgConfig, unk_46C->scroll, GF_BG_LYR_MAIN_1, 0, -0xC0, 5);
            IntroMovie_StartBgScroll_NotVBlank(bgConfig, unk_46C->scroll, GF_BG_LYR_MAIN_0, 0, -0xC0, 5);
            IntroMovie_Scene2_StartSpritePanEffect(sceneData, 0, 0, 0xC0, 5);
            IntroMovie_Scene2_StartSpritePanEffect(sceneData, 1, 0, 0xC0, 5);
            BeginNormalPaletteFade(4, 0, 0, RGB_BLACK, 8, 1, HEAP_ID_INTRO_MOVIE);
            IntroMovie_AdvanceSceneStep(data);
        }
        break;
    case 2:
        if (IntroMovie_WaitBgScrollAnim(unk_46C->scroll, GF_BG_LYR_MAIN_1) && IntroMovie_WaitBgScrollAnim(unk_46C->scroll, GF_BG_LYR_MAIN_0) && IntroMovie_Scene2_WaitSpritePanEffect(sceneData, 0) && IntroMovie_Scene2_WaitSpritePanEffect(sceneData, 1) && IsPaletteFadeFinished()) {
            IntroMovie_StartBgScroll_NotVBlank(bgConfig, unk_46C->scroll, GF_BG_LYR_MAIN_1, 0x20, 0, 0x5A);
            IntroMovie_StartBgScroll_NotVBlank(bgConfig, unk_46C->scroll, GF_BG_LYR_MAIN_0, 0x20, 0, 0x5A);
            IntroMovie_Scene2_StartSpritePanEffect(sceneData, 0, -0x20, 0, 0x5A);
            IntroMovie_Scene2_StartSpritePanEffect(sceneData, 1, -0x20, 0, 0x5A);
            IntroMovie_AdvanceSceneStep(data);
        }
        break;
    case 3:
        if (IntroMovie_WaitBgScrollAnim(unk_46C->scroll, GF_BG_LYR_MAIN_1) && IntroMovie_WaitBgScrollAnim(unk_46C->scroll, GF_BG_LYR_MAIN_0) && IntroMovie_Scene2_WaitSpritePanEffect(sceneData, 0) && IntroMovie_Scene2_WaitSpritePanEffect(sceneData, 1)) {
            IntroMovie_StartBgScroll_NotVBlank(bgConfig, unk_46C->scroll, GF_BG_LYR_MAIN_1, 0x40, 0, 7);
            IntroMovie_StartBgScroll_NotVBlank(bgConfig, unk_46C->scroll, GF_BG_LYR_MAIN_0, 0x40, 0, 7);
            IntroMovie_Scene2_StartSpritePanEffect(sceneData, 0, -0x40, 0, 7);
            IntroMovie_Scene2_StartSpritePanEffect(sceneData, 1, -0x40, 0, 7);
            IntroMovie_AdvanceSceneStep(data);
        }
        break;
    case 4:
        if (IntroMovie_WaitBgScrollAnim(unk_46C->scroll, GF_BG_LYR_MAIN_1) && IntroMovie_WaitBgScrollAnim(unk_46C->scroll, GF_BG_LYR_MAIN_0) && IntroMovie_Scene2_WaitSpritePanEffect(sceneData, 0) && IntroMovie_Scene2_WaitSpritePanEffect(sceneData, 1)) {
            IntroMovie_StartBgScroll_NotVBlank(bgConfig, unk_46C->scroll, GF_BG_LYR_MAIN_1, 0x20, 0, 0x42);
            IntroMovie_StartBgScroll_NotVBlank(bgConfig, unk_46C->scroll, GF_BG_LYR_MAIN_0, 0x20, 0, 0x42);
            IntroMovie_Scene2_StartSpritePanEffect(sceneData, 0, -0x20, 0, 0x42);
            IntroMovie_Scene2_StartSpritePanEffect(sceneData, 1, -0x20, 0, 0x42);
            IntroMovie_AdvanceSceneStep(data);
        }
        break;
    case 5:
        if (IntroMovie_WaitBgScrollAnim(unk_46C->scroll, GF_BG_LYR_MAIN_1) && IntroMovie_WaitBgScrollAnim(unk_46C->scroll, GF_BG_LYR_MAIN_0) && IntroMovie_Scene2_WaitSpritePanEffect(sceneData, 0) && IntroMovie_Scene2_WaitSpritePanEffect(sceneData, 1)) {
            IntroMovie_StartBgScroll_NotVBlank(bgConfig, unk_46C->scroll, GF_BG_LYR_MAIN_1, 0, -0x80, 10);
            IntroMovie_StartBgScroll_NotVBlank(bgConfig, unk_46C->scroll, GF_BG_LYR_MAIN_0, 0, -0x40, 5);
            IntroMovie_Scene2_StartSpritePanEffect(sceneData, 0, 0, 0x80, 10);
            IntroMovie_Scene2_StartSpritePanEffect(sceneData, 1, 0, 0x80, 10);
            IntroMovie_AdvanceSceneStep(data);
        }
        break;
    case 6:
        if (IntroMovie_WaitBgScrollAnim(unk_46C->scroll, GF_BG_LYR_MAIN_1) && IntroMovie_WaitBgScrollAnim(unk_46C->scroll, GF_BG_LYR_MAIN_0) && IntroMovie_Scene2_WaitSpritePanEffect(sceneData, 0) && IntroMovie_Scene2_WaitSpritePanEffect(sceneData, 1)) {
            IntroMovie_BeginCirleWipeEffect(data, 1, 1, 8);
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
    IntroMovieBgLinearAnims *unk_46C;

    unk_46C = IntroMovie_GetBgLinearAnimsController(data);
    bgConfig = IntroMovie_GetBgConfig(data);
    Main_SetVBlankIntrCB(NULL, NULL);
    if (sceneData->unk_001) {
        for (u8 i = 0; i < 2; ++i) {
            if (sceneData->unk_064[i].task != NULL) {
                SysTask_Destroy(sceneData->unk_064[i].task);
                sceneData->unk_064[i].task = NULL;
            }
        }
        IntroMovie_Scene2_DeleteSprites(data, sceneData);
        IntroMovie_CancelBgScrollAnim(unk_46C->scroll, GF_BG_LYR_SUB_0);
        IntroMovie_CancelBgScrollAnim(unk_46C->scroll, GF_BG_LYR_MAIN_2);
        FreeBgTilemapBuffer(bgConfig, GF_BG_LYR_SUB_0);
        FreeBgTilemapBuffer(bgConfig, GF_BG_LYR_MAIN_0);
        FreeBgTilemapBuffer(bgConfig, GF_BG_LYR_MAIN_1);
        FreeBgTilemapBuffer(bgConfig, GF_BG_LYR_MAIN_2);
        sceneData->unk_001 = FALSE;
    }
}

void ov60_021E866C(IntroMovieOvyData *data) {
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

void ov60_021E8724(BgConfig *bgConfig) {
    GfGfxLoader_LoadCharData(NARC_demo_opening_gs_opening, 33, bgConfig, GF_BG_LYR_MAIN_2, 0, 0, TRUE, HEAP_ID_INTRO_MOVIE);
    GfGfxLoader_LoadCharData(NARC_demo_opening_gs_opening, 34, bgConfig, GF_BG_LYR_SUB_0, 0, 0, TRUE, HEAP_ID_INTRO_MOVIE);
    GfGfxLoader_LoadScrnData(NARC_demo_opening_gs_opening, 35, bgConfig, GF_BG_LYR_MAIN_2, 0, 0, TRUE, HEAP_ID_INTRO_MOVIE);
    GfGfxLoader_LoadScrnData(NARC_demo_opening_gs_opening, 36, bgConfig, GF_BG_LYR_SUB_0, 0, 0, TRUE, HEAP_ID_INTRO_MOVIE);
    GfGfxLoader_LoadScrnData(NARC_demo_opening_gs_opening, 37, bgConfig, GF_BG_LYR_MAIN_1, 0, 0, TRUE, HEAP_ID_INTRO_MOVIE);
    GfGfxLoader_LoadScrnData(NARC_demo_opening_gs_opening, 38, bgConfig, GF_BG_LYR_MAIN_0, 0, 0, TRUE, HEAP_ID_INTRO_MOVIE);
    GfGfxLoader_GXLoadPal(NARC_demo_opening_gs_opening, 32, GF_PAL_LOCATION_MAIN_BG, (enum GFPalSlotOffset)0, 0x80, HEAP_ID_INTRO_MOVIE);
    GfGfxLoader_GXLoadPal(NARC_demo_opening_gs_opening, 31, GF_PAL_LOCATION_SUB_BG, (enum GFPalSlotOffset)0, 0x80, HEAP_ID_INTRO_MOVIE);
    OS_WaitIrq(TRUE, OS_IE_V_BLANK);
    GfGfx_BothDispOn();
}

void ov60_021E87FC(IntroMovieOvyData *data, IntroMovieScene2Data *sceneData) {
    IntroMovie_CreateSpriteResourceManagers(data, _021EB138);
    _2DGfxResMan **resMen = IntroMovie_GetSpriteResourceManagersArray(data);
    sceneData->unk_004[0][GF_GFX_RES_TYPE_CHAR] = AddCharResObjFromNarc(resMen[GF_GFX_RES_TYPE_CHAR], NARC_demo_opening_gs_opening, 78, TRUE, 0, 3, HEAP_ID_INTRO_MOVIE);
    sceneData->unk_004[0][GF_GFX_RES_TYPE_PLTT] = AddPlttResObjFromNarc(resMen[GF_GFX_RES_TYPE_PLTT], NARC_demo_opening_gs_opening, 77, FALSE, 0, 3, 1, HEAP_ID_INTRO_MOVIE);
    sceneData->unk_004[0][GF_GFX_RES_TYPE_CELL] = AddCellOrAnimResObjFromNarc(resMen[GF_GFX_RES_TYPE_CELL], NARC_demo_opening_gs_opening, 80, TRUE, 0, GF_GFX_RES_TYPE_CELL, HEAP_ID_INTRO_MOVIE);
    sceneData->unk_004[0][GF_GFX_RES_TYPE_ANIM] = AddCellOrAnimResObjFromNarc(resMen[GF_GFX_RES_TYPE_ANIM], NARC_demo_opening_gs_opening, 79, TRUE, 0, GF_GFX_RES_TYPE_ANIM, HEAP_ID_INTRO_MOVIE);
    sceneData->unk_004[1][GF_GFX_RES_TYPE_CHAR] = AddCharResObjFromNarc(resMen[GF_GFX_RES_TYPE_CHAR], NARC_demo_opening_gs_opening, 74, TRUE, 1, 1, HEAP_ID_INTRO_MOVIE);
    sceneData->unk_004[1][GF_GFX_RES_TYPE_PLTT] = AddPlttResObjFromNarc(resMen[GF_GFX_RES_TYPE_PLTT], NARC_demo_opening_gs_opening, 73, FALSE, 1, 1, 2, HEAP_ID_INTRO_MOVIE);
    sceneData->unk_004[1][GF_GFX_RES_TYPE_CELL] = AddCellOrAnimResObjFromNarc(resMen[GF_GFX_RES_TYPE_CELL], NARC_demo_opening_gs_opening, 76, TRUE, 1, GF_GFX_RES_TYPE_CELL, HEAP_ID_INTRO_MOVIE);
    sceneData->unk_004[1][GF_GFX_RES_TYPE_ANIM] = AddCellOrAnimResObjFromNarc(resMen[GF_GFX_RES_TYPE_ANIM], NARC_demo_opening_gs_opening, 75, TRUE, 1, GF_GFX_RES_TYPE_ANIM, HEAP_ID_INTRO_MOVIE);
    for (u8 i = 0; i < 2; ++i) {
        sub_0200ACF0(sceneData->unk_004[i][GF_GFX_RES_TYPE_CHAR]);
        sub_0200AF94(sceneData->unk_004[i][GF_GFX_RES_TYPE_PLTT]);
    }
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_ON);
    GfGfx_EngineBTogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_ON);
}

void IntroMovie_Scene2_DeleteSprites(IntroMovieOvyData *data, IntroMovieScene2Data *sceneData) {
    Sprite_Delete(sceneData->unk_024);
    Sprite_Delete(sceneData->unk_028);
    Sprite_Delete(sceneData->unk_02C);
    Sprite_Delete(sceneData->unk_030);
    Sprite_Delete(sceneData->unk_034);
    Sprite_Delete(sceneData->unk_038);
    for (u8 i = 0; i < 10; ++i) {
        Sprite_Delete(sceneData->flowerSprites[i]);
    }
    for (u8 i = 0; i < 2; ++i) {
        sub_0200AEB0(sceneData->unk_004[i][GF_GFX_RES_TYPE_CHAR]);
        sub_0200B0A8(sceneData->unk_004[i][GF_GFX_RES_TYPE_PLTT]);
    }
    IntroMovie_DestroySpriteResourceManagers(data);
}

void ov60_021E8978(IntroMovieOvyData *data, IntroMovieScene2Data *sceneData) {
    SpriteResourcesHeader spriteHeader;
    SpriteTemplate spriteTemplate;
    u8 spC[10] = {
        0, 1, 2, 3, 0, 1, 2, 3, 0, 1,
    };

    IntroMovie_BuildSpriteResourcesHeaderAndTemplate(0, data, 0, NNS_G2D_VRAM_TYPE_MAX, &spriteTemplate, &spriteHeader);
    spriteTemplate.position.x = 128 * FX32_ONE;
    spriteTemplate.position.y = 192 * FX32_ONE;

    for (u8 i = 0; i < 10; ++i) {
        sceneData->flowerSprites[i] = CreateSprite(&spriteTemplate);
        Set2dSpriteAnimActiveFlag(sceneData->flowerSprites[i], FALSE);
        Set2dSpriteVisibleFlag(sceneData->flowerSprites[i], FALSE);
        Set2dSpriteAnimSeqNo(sceneData->flowerSprites[i], spC[i]);
    }

    IntroMovie_BuildSpriteResourcesHeaderAndTemplate(1, data, 1, NNS_G2D_VRAM_TYPE_2DMAIN, &spriteTemplate, &spriteHeader);
    spriteTemplate.position.x = 64 * FX32_ONE;
    spriteTemplate.position.y = -96 * FX32_ONE;
    sceneData->unk_024 = CreateSprite(&spriteTemplate);
    Set2dSpriteAnimActiveFlag(sceneData->unk_024, FALSE);
    Set2dSpriteVisibleFlag(sceneData->unk_024, TRUE);
    Set2dSpriteAnimSeqNo(sceneData->unk_024, 0);
    sceneData->unk_02C = CreateSprite(&spriteTemplate);
    Set2dSpriteAnimActiveFlag(sceneData->unk_02C, FALSE);
    Set2dSpriteVisibleFlag(sceneData->unk_02C, TRUE);
    Set2dSpriteAnimSeqNo(sceneData->unk_02C, 1);
    sceneData->unk_034 = CreateSprite(&spriteTemplate);
    Set2dSpriteAnimActiveFlag(sceneData->unk_034, FALSE);
    Set2dSpriteVisibleFlag(sceneData->unk_034, TRUE);
    Set2dSpriteAnimSeqNo(sceneData->unk_034, 2);

    IntroMovie_BuildSpriteResourcesHeaderAndTemplate(1, data, 1, NNS_G2D_VRAM_TYPE_2DMAIN, &spriteTemplate, &spriteHeader);
    spriteTemplate.position.x = 320 * FX32_ONE;
    spriteTemplate.position.y = -96 * FX32_ONE;
    sceneData->unk_028 = CreateSprite(&spriteTemplate);
    Set2dSpriteAnimActiveFlag(sceneData->unk_028, FALSE);
    Set2dSpriteVisibleFlag(sceneData->unk_028, TRUE);
    Set2dSpriteAnimSeqNo(sceneData->unk_028, 3);
    sceneData->unk_030 = CreateSprite(&spriteTemplate);
    Set2dSpriteAnimActiveFlag(sceneData->unk_030, FALSE);
    Set2dSpriteVisibleFlag(sceneData->unk_030, TRUE);
    Set2dSpriteAnimSeqNo(sceneData->unk_030, 4);
    sceneData->unk_038 = CreateSprite(&spriteTemplate);
    Set2dSpriteAnimActiveFlag(sceneData->unk_038, FALSE);
    Set2dSpriteVisibleFlag(sceneData->unk_038, TRUE);
    Set2dSpriteAnimSeqNo(sceneData->unk_038, 5);
}

void IntroMovie_Scene2_StartSpritePanEffect(IntroMovieScene2Data *sceneData, int whichSprites, int xSpeed, int ySpeed, int duration) {
    IntroMovieScene2DataSub_064 *unk_064;

    if (whichSprites == 0) {
        unk_064 = &sceneData->unk_064[0];
        unk_064->unk_01C = sceneData->unk_024;
        unk_064->unk_020 = sceneData->unk_02C;
        unk_064->unk_024 = sceneData->unk_034;
    } else {
        unk_064 = &sceneData->unk_064[1];
        unk_064->unk_01C = sceneData->unk_028;
        unk_064->unk_020 = sceneData->unk_030;
        unk_064->unk_024 = sceneData->unk_038;
    }
    GF_ASSERT(!unk_064->active);
    unk_064->active = TRUE;
    unk_064->duration = duration;
    unk_064->counter = 0;
    unk_064->finished = 0;
    VecFx32 *mtx = Sprite_GetMatrixPtr(unk_064->unk_01C);
    unk_064->xOffset = mtx->x / FX32_ONE;
    unk_064->yOffset = mtx->y / FX32_ONE;
    unk_064->xSpeed = xSpeed;
    unk_064->ySpeed = ySpeed;
    unk_064->task = SysTask_CreateOnMainQueue(ov60_021E8B7C, unk_064, 0);
}

BOOL IntroMovie_Scene2_WaitSpritePanEffect(IntroMovieScene2Data *sceneData, int whichSprites) {
    IntroMovieScene2DataSub_064 *unk_064;
    if (whichSprites == 0) {
        unk_064 = &sceneData->unk_064[0];
    } else {
        unk_064 = &sceneData->unk_064[1];
    }

    if (!unk_064->active) {
        return TRUE;
    }
    if (unk_064->finished) {
        return TRUE;
    }

    return FALSE;
}

void ov60_021E8B7C(SysTask *task, void *pVoid) {
    IntroMovieScene2DataSub_064 *unk_064 = (IntroMovieScene2DataSub_064 *)pVoid;
    VecFx32 sp4 = {0, 0, 0};
    ++unk_064->counter;
    int x = unk_064->xSpeed * unk_064->counter / unk_064->duration;
    int y = unk_064->ySpeed * unk_064->counter / unk_064->duration;
    x += unk_064->xOffset;
    y += unk_064->yOffset;
    if (unk_064->counter >= unk_064->duration) {
        SysTask_Destroy(unk_064->task);
        unk_064->task = NULL;
        unk_064->finished = TRUE;
        unk_064->active = FALSE;
    }
    sp4.x = x * FX32_ONE;
    sp4.y = y * FX32_ONE;
    Sprite_SetMatrix(unk_064->unk_01C, &sp4);
    Sprite_SetMatrix(unk_064->unk_020, &sp4);
    Sprite_SetMatrix(unk_064->unk_024, &sp4);
}

HeapID _deadstrip_02(int idx);
HeapID _deadstrip_02(int idx) {
    static const HeapID sDeadstrippedRodata[1] = {HEAP_ID_INTRO_MOVIE};
    return sDeadstrippedRodata[0];
}
