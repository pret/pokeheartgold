#include "global.h"
#include "intro_movie_internal.h"
#include "system.h"
#include "gf_gfx_loader.h"
#include "unk_0200ACF0.h"
#include "unk_0200B150.h"
#include "unk_0200FA24.h"
#include "unk_0201F4C4.h"
#include "unk_020215A0.h"
#include "unk_02022588.h"
#include "demo/opening/gs_opening.naix"
#include "unk_02026E30.h"

void IntroMovie_Scene3_VBlankCB(void *pVoid);
void IntroMovie_Scene3_Init(IntroMovieOvyData *data, IntroMovieScene3Data *sceneData);
void ov60_021E8D04(IntroMovieScene3Data *sceneData, BgConfig *bgConfig);
BOOL IntroMovie_Scene3_Main(IntroMovieOvyData *data, IntroMovieScene3Data *sceneData, int a2);
void IntroMovie_Scene3_Exit(IntroMovieOvyData *data, IntroMovieScene3Data *sceneData);
void ov60_021E9580(IntroMovieOvyData *data);
void ov60_021E9638(BgConfig *bgConfig, IntroMovieScene3Data *sceneData);
void ov60_021E9768(IntroMovieOvyData *data, IntroMovieScene3Data *sceneData);
void ov60_021E9878(IntroMovieOvyData *data, IntroMovieScene3Data *sceneData);
void ov60_021E98C0(IntroMovieOvyData *data, IntroMovieScene3Data *sceneData);
void ov60_021E99B8(IntroMovieScene3Data *sceneData);
void ov60_021E9B60(IntroMovieScene3Data *sceneData);
void ov60_021E9BFC(void);
void ov60_021E9C84(u8 a0);

const u8 _021EB1F4[4] = {2, 2, 2, 2};

static const int _021EB22C[3] = {
    NARC_gs_opening_gs_opening_00000103_NSBMD,
    NARC_gs_opening_gs_opening_00000100_NSBMD,
    NARC_gs_opening_gs_opening_00000097_NSBMD,
};

static const int _021EB2C4[3][2] = {
    {
        NARC_gs_opening_gs_opening_00000104_NSBCA,
        NARC_gs_opening_gs_opening_00000105_NSBTA,
    }, {
        NARC_gs_opening_gs_opening_00000101_NSBCA,
        NARC_gs_opening_gs_opening_00000102_NSBTA,
    }, {
        NARC_gs_opening_gs_opening_00000098_NSBCA,
        NARC_gs_opening_gs_opening_00000099_NSBTA,
    }
};

static const CameraParam _021EB298 = {
    FX32_CONST(410.922119140625),
    {
        0xD602,
        0x0000,
        0x0000,
        0
    },
    0,
    0x05C1,
    FALSE,
};

static const GXRgb _021EB278[8] = {
    RGB(0, 0, 0),
    RGB(4, 4, 4),
    RGB(4, 4, 4),
    RGB(4, 4, 4),
    RGB(4, 4, 4),
    RGB(4, 4, 4),
    RGB(4, 4, 4),
    RGB(4, 4, 4),
};

static const VecFx32 _021EB554[3][4] = {
    {
        {FX32_CONST(-0.46923828125), FX32_CONST(-0.8662109375), FX32_CONST(-0.072265625)},
        {0, 0, 0},
        {0, 0, FX32_ONE},
        {0, 0, FX32_ONE},
    }, {
        {FX32_CONST(-0.46728515625), FX32_CONST(-0.8662109375), FX32_CONST(-0.072265625)},
        {0, 0, 0},
        {0, 0, FX32_ONE},
        {0, 0, FX32_ONE},
    }, {
        {FX32_CONST(-0.46728515625), FX32_CONST(-0.8662109375), FX32_CONST(-0.072265625)},
        {0, 0, 0},
        {0, 0, FX32_ONE},
        {0, 0, FX32_ONE},
    },
};

static const GXRgb _021EB2AC[3][4] = {
    {
        RGB(22, 22, 20), RGB(0, 0, 0), RGB(0, 4, 9), RGB(0, 0, 0)
    }, {
        RGB(11, 11, 16), RGB(0, 0, 0), RGB(18, 10, 0), RGB(0, 0, 0)
    }, {
        RGB(19, 16, 12), RGB(0, 0, 0), RGB(16, 6, 0), RGB(0, 0, 0)
    },
};

static const GXRgb _021EB202[3] = {
    RGB(15, 15, 15),
    RGB(14, 14, 16),
    RGB(15, 15, 15),
};

static const GXRgb _021EB208[3] = {
    RGB(9, 11, 11),
    RGB(10, 10, 10),
    RGB(11, 12, 12),
};

static const GXRgb _021EB1FC[3] = {
    RGB(16, 16, 16),
    RGB(14, 14, 16),
    RGB(17, 17, 17),
};

static const GXRgb _021EB20E[3] = {
    RGB(14, 14, 14),
    RGB(8, 8, 11),
    RGB(8, 8, 7),
};

BOOL IntroMovie_Scene3(IntroMovieOvyData *data, void *pVoid) {
    IntroMovieScene3Data *sceneData = (IntroMovieScene3Data *)pVoid;

    if (IntroMovie_GetIntroSkippedFlag(data)) {
        sceneData->state = 2;
    }

    switch (sceneData->state) {
    case 0:
        IntroMovie_Scene3_Init(data, sceneData);
        ++sceneData->state;
        break;
    case 1:
        if (IntroMovie_Scene3_Main(data, sceneData, IntroMovie_GetTotalFrameCount(data))) {
            ++sceneData->state;
        }
        break;
    case 2:
        IntroMovie_Scene3_Exit(data, sceneData);
        return TRUE;
    }

    return FALSE;
}

void IntroMovie_Scene3_VBlankCB(void *pVoid) {
    IntroMovieOvyData *data = (IntroMovieOvyData *)pVoid;

    DoScheduledBgGpuUpdates(IntroMovie_GetBgConfig(data));
    OamManager_ApplyAndResetBuffers();
}

void IntroMovie_Scene3_Init(IntroMovieOvyData *data, IntroMovieScene3Data *sceneData) {
    BgConfig *bgConfig = IntroMovie_GetBgConfig(data);
    sub_020216C8();
    sub_02022638();
    gSystem.screensFlipped = FALSE;
    GfGfx_SwapDisplay();
    ov60_021E9580(data);
    IntroMovie_InitBgAnimGxState(data);
    Main_SetVBlankIntrCB(IntroMovie_Scene3_VBlankCB, data);
    ov60_021E9638(bgConfig, sceneData);
    IntroMovie_RendererSetSurfaceCoords(data, 0, 0, 0, FX32_ONE * 0.125);
    ov60_021E9768(data, sceneData);
    ov60_021E98C0(data, sceneData);
    sceneData->unk_1BC = GF_3DVramMan_Create(HEAP_ID_INTRO_MOVIE, 0, 1, 0, 4, ov60_021E9BFC);
    ov60_021E99B8(sceneData);
    ov60_021E8D04(sceneData, bgConfig);
    sceneData->unk_001 = 1;
}

void ov60_021E8D04(IntroMovieScene3Data *sceneData, BgConfig *bgConfig) {
    IntroMovie_StartSpriteAnimAndMakeVisible(sceneData->unk_064, TRUE);
    GfGfx_EngineBTogglePlanes((GXPlaneMask)(GX_PLANEMASK_BG1 | GX_PLANEMASK_BG2), GF_PLANE_TOGGLE_OFF);
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG0, GF_PLANE_TOGGLE_ON);
    BG_SetMaskColor(GF_BG_LYR_MAIN_0, RGB_BLACK);
    BG_SetMaskColor(GF_BG_LYR_SUB_0, RGB_BLACK);
    sub_0200FBF4(PM_LCD_BOTTOM, RGB_BLACK);
}

BOOL IntroMovie_Scene3_Main(IntroMovieOvyData *data, IntroMovieScene3Data *sceneData, int a2) {
    u8 stepTimer;
    BgConfig *bgConfig = IntroMovie_GetBgConfig(data);  // r7
    IntroMovieBgLinearAnims *bgAnimCnt = IntroMovie_GetBgLinearAnimsController(data);  // r4
    stepTimer = IntroMovie_GetSceneStepTimer(data);  // sp10
    ov60_021E9B60(sceneData);
    switch (IntroMovie_GetSceneStep(data)) {
    case 0:  // Show New Bark
        ov60_021E9C84(sceneData->unk_1D0);
        IntroMovie_BeginCircleWipeEffect(data, 0, TRUE, 8);
        IntroMovie_AdvanceSceneStep(data);
        break;
    case 1:  // Wait New Bark
        if (stepTimer > 40) {
            IntroMovie_BeginCircleWipeEffect(data, 3, TRUE, 8);
            IntroMovie_AdvanceSceneStep(data);
        }
        break;
    case 2:  // Load Goldenrod
        if (IntroMovie_WaitCircleWipeEffect(data)) {
            IntroMovie_BeginCircleWipeEffect(data, 2, TRUE, 8);
            sceneData->unk_1D0 = 1;
            ov60_021E9C84(sceneData->unk_1D0);
            IntroMovie_AdvanceSceneStep(data);
        }
        break;
    case 3:  // Wait Goldenrod
        if (stepTimer > 46) {
            IntroMovie_BeginCircleWipeEffect(data, 3, TRUE, 8);
            IntroMovie_AdvanceSceneStep(data);
        }
        break;
    case 4:  // Load Ecruteak
        if (IntroMovie_WaitCircleWipeEffect(data)) {
            IntroMovie_BeginCircleWipeEffect(data, 2, TRUE, 8);
            sceneData->unk_1D0 = 2;
            ov60_021E9C84(sceneData->unk_1D0);
            IntroMovie_AdvanceSceneStep(data);
        }
        break;
    case 5:  // Wait Ecruteak
        if (stepTimer > 98) {
            IntroMovie_BeginCircleWipeEffect(data, 3, TRUE, 8);
            IntroMovie_AdvanceSceneStep(data);
        }
        break;
    case 6:  // End map render portion
        if (IntroMovie_WaitCircleWipeEffect(data)) {
            sceneData->unk_1D0 = 0xFFFF;
            IntroMovie_AdvanceSceneStep(data);
        }
        break;
    case 7:  // uhhh
        IntroMovie_BeginCircleWipeEffect(data, 2, FALSE, 8);
        IntroMovie_AdvanceSceneStep(data);
        break;
    case 8:  // kill me now
        if (IntroMovie_WaitCircleWipeEffect(data)) {
            IntroMovie_AdvanceSceneStep(data);
        }
        break;
    case 9: {
        int _021EB250[3] = {56, 73, 92};

        if (stepTimer >= _021EB250[sceneData->unk_003]) {
            ++sceneData->unk_003;
            BG_LoadScreenTilemapData(bgConfig, GF_BG_LYR_SUB_0, sceneData->unk_024[sceneData->unk_003]->rawData, sceneData->unk_024[sceneData->unk_003]->szByte);
            ScheduleBgTilemapBufferTransfer(bgConfig, GF_BG_LYR_SUB_0);
            if (sceneData->unk_003 >= 3) {
                IntroMovie_StartSpriteAnimAndMakeVisible(sceneData->unk_064, FALSE);
                IntroMovie_AdvanceSceneStep(data);
            }
        }
        break;
    }
    case 10:
        if (stepTimer >= 10) {
            GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG0, GF_PLANE_TOGGLE_OFF);
            BG_LoadScreenTilemapData(bgConfig, GF_BG_LYR_SUB_0, sceneData->unk_034->rawData, sceneData->unk_034->szByte);
            ScheduleBgTilemapBufferTransfer(bgConfig, GF_BG_LYR_SUB_0);
            IntroMovie_AdvanceSceneStep(data);
        }
        break;
    case 11:
        if (stepTimer == 5) {
            IntroMovieBgWindowAnimParam _021EB3C8 = {
                0x00, 0x00, 0xFF, 0xC0,
                0x00, 0x40, 0xFF, 0x80,
                0x1F, 0x10, 1, 1
            };
            IntroMovie_StartWindowPanEffect(bgAnimCnt->window, 5, 0, &_021EB3C8);
        }
        if (stepTimer >= 44) {
            IntroMovieBgWindowAnimParam _021EB3F4 = {
                0x00, 0x40, 0x01, 0x80,
                0x00, 0x40, 0xFF, 0x80,
                0x1F, 0x10, 1, 1
            };
            IntroMovie_StartWindowPanEffect(bgAnimCnt->window, 7, 0, &_021EB3F4);
            GXS_SetVisibleWnd(1);
            IntroMovie_StartBgScroll_VBlank(bgConfig, bgAnimCnt->scroll, GF_BG_LYR_SUB_0, -256, 0, 7);
            GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG0, GF_PLANE_TOGGLE_ON);
            IntroMovie_AdvanceSceneStep(data);
        }
        break;
    case 12:
        if (IntroMovie_WaitBgScrollAnim(bgAnimCnt->scroll, GF_BG_LYR_SUB_0)) {
            IntroMovieBgWindowAnimParam _021EB420 = {
                0xFE, 0x00, 0xFF, 0x80,
                0x00, 0x00, 0xFF, 0x80,
                0x1F, 0x11, 1, 1
            };
            IntroMovie_StartWindowPanEffect(bgAnimCnt->window, 7, 0, &_021EB420);
            IntroMovie_StartBgScroll_VBlank(bgConfig, bgAnimCnt->scroll, GF_BG_LYR_SUB_1, 256, 0, 7);
            GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG1, GF_PLANE_TOGGLE_ON);
            IntroMovie_AdvanceSceneStep(data);
        }
        break;
    case 13:
        if (IntroMovie_WaitBgScrollAnim(bgAnimCnt->scroll, GF_BG_LYR_SUB_1)) {
            IntroMovieBgWindowAnimParam _021EB44C = {
                0x00, 0x00, 0x01, 0xC0,
                0x00, 0x00, 0xFF, 0xC0,
                0x1F, 0x13, 1, 1
            };
            IntroMovie_StartWindowPanEffect(bgAnimCnt->window, 1, 0, &_021EB44C);
            IntroMovie_StartBgScroll_VBlank(bgConfig, bgAnimCnt->scroll, GF_BG_LYR_SUB_2, -256, 0, 1);
            GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG2, GF_PLANE_TOGGLE_ON);
            IntroMovie_AdvanceSceneStep(data);
        }
        break;
    case 14:
        if (IntroMovie_WaitBgScrollAnim(bgAnimCnt->scroll, GF_BG_LYR_SUB_2)) {
            GX_SetVisibleWnd(0);
            GXS_SetVisibleWnd(0);
            GfGfxLoader_LoadCharData(NARC_demo_opening_gs_opening, NARC_gs_opening_gs_opening_00000041_NCGR_lz, bgConfig, GF_BG_LYR_SUB_3, 0, 0x4000, TRUE, HEAP_ID_INTRO_MOVIE);
            IntroMovie_AdvanceSceneStep(data);
        }
        break;
    case 15:
        if (stepTimer >= 42) {
            IntroMovieBgWindowAnimParam _021EB478 = {
                0x00, 0x00, 0xFF, 0xC0,
                0x46, 0x00, 0xB9, 0xC0,
                0x1F, 0x10, 1, 1
            };
            IntroMovie_StartWindowPanEffect(bgAnimCnt->window, 3, 0, &_021EB478);
            GXS_SetVisibleWnd(1);
            IntroMovie_AdvanceSceneStep(data);
        }
        break;
    case 16:
        if (IntroMovie_WaitWindowPanEffect(bgAnimCnt->window, 0)) {
            IntroMovie_AdvanceSceneStep(data);
        }
        break;
    case 17:
        if (stepTimer == 56) {
            IntroMovie_StartSpriteAnimAndMakeVisible(sceneData->unk_068, TRUE);
        }
        if (stepTimer == 145) {
            IntroMovie_StartSpriteAnimAndMakeVisible(sceneData->unk_06C[0], TRUE);
        }
        if (stepTimer >= 145) {
            IntroMovieBgWindowAnimParam _021EB4A4 = {
                0x46, 0x00, 0xB9, 0xC0,
                0xB9, 0x00, 0xB9, 0xC0,
                0x1F, 0x10, 1, 1
            };
            IntroMovie_StartWindowPanEffect(bgAnimCnt->window, 10, 0, &_021EB4A4);
            G2S_SetWnd1Position(0x46, 0x40, 0xb9, 0xc0);
            G2S_SetWnd1InsidePlane(0x1D, TRUE);
            IntroMovie_StartBgScroll_VBlank(bgConfig, bgAnimCnt->scroll, GF_BG_LYR_SUB_1, -116, 0, 10);
            IntroMovie_AdvanceSceneStep(data);
        }
        break;
    case 18:
        if (IntroMovie_WaitBgScrollAnim(bgAnimCnt->scroll, GF_BG_LYR_SUB_1)) {
            GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG1, GF_PLANE_TOGGLE_OFF);
            IntroMovieBgWindowAnimParam _021EB4D0 = {
                0x46, 0x40, 0xB9, 0xC0,
                0x46, 0x40, 0xB9, 0xC0,
                0x1F, 0x10, 1, 1
            };
            IntroMovie_StartWindowPanEffect(bgAnimCnt->window, 0, 0, &_021EB4D0);
            IntroMovie_AdvanceSceneStep(data);
        }
        break;
    case 19:
        IntroMovie_StartSpriteAnimAndMakeVisible(sceneData->unk_06C[1], TRUE);
        if (stepTimer >= 10) {
            IntroMovieBgWindowAnimParam _021EB4FC = {
                0x46, 0x40, 0xB9, 0xC0,
                0xB9, 0x40, 0xB9, 0xC0,
                0x1F, 0x10, 1, 1
            };
            IntroMovie_StartWindowPanEffect(bgAnimCnt->window, 10, 0, &_021EB4FC);
            G2S_SetWnd1Position(0x46, 0x40, 0xB9, 0x80);
            G2S_SetWnd1InsidePlane(0x19, TRUE);
            IntroMovie_StartBgScroll_VBlank(bgConfig, bgAnimCnt->scroll, GF_BG_LYR_SUB_2, -116, 0, 10);
            IntroMovie_AdvanceSceneStep(data);
        }
        break;
    case 20:
        if (IntroMovie_WaitBgScrollAnim(bgAnimCnt->scroll, GF_BG_LYR_SUB_1) && IntroMovie_WaitBgScrollAnim(bgAnimCnt->scroll, GF_BG_LYR_SUB_2)) {
            GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG2, GF_PLANE_TOGGLE_OFF);
            IntroMovieBgWindowAnimParam _021EB528 = {
                0x46, 0x40, 0xB9, 0x80,
                0x46, 0x40, 0xB9, 0x80,
                0x1F, 0x10, 1, 1
            };
            IntroMovie_StartWindowPanEffect(bgAnimCnt->window, 0, 0, &_021EB528);
            BG_LoadScreenTilemapData(bgConfig, GF_BG_LYR_SUB_1, sceneData->unk_038[0]->rawData, sceneData->unk_038[0]->szByte);
            BG_LoadScreenTilemapData(bgConfig, GF_BG_LYR_SUB_2, sceneData->unk_038[1]->rawData, sceneData->unk_038[1]->szByte);
            BG_LoadScreenTilemapData(bgConfig, GF_BG_LYR_SUB_3, sceneData->unk_038[2]->rawData, sceneData->unk_038[2]->szByte);
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
    case 21:
        IntroMovie_StartSpriteAnimAndMakeVisible(sceneData->unk_06C[2], TRUE);
        if (stepTimer >= 30) {
            IntroMovieBgWindowAnimParam _021EB370 = {
                0x46, 0x40, 0xB9, 0x80,
                0x46, 0x40, 0x46, 0x80,
                0x1F, 0x10, 1, 1
            };
            IntroMovie_StartWindowPanEffect(bgAnimCnt->window, 10, 0, &_021EB370);
            G2S_SetWnd1Position(0x46, 0x40, 0xB9, 0x80);
            G2S_SetWnd1InsidePlane(0x1E, TRUE);
            IntroMovie_StartBgScroll_VBlank(bgConfig, bgAnimCnt->scroll, GF_BG_LYR_SUB_0, 0x74, 0, 10);
            IntroMovie_AdvanceSceneStep(data);
        }
        break;
    case 22:
        if (IntroMovie_WaitBgScrollAnim(bgAnimCnt->scroll, GF_BG_LYR_SUB_0)) {
            GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG0, GF_PLANE_TOGGLE_OFF);
            IntroMovieBgWindowAnimParam _021EB39C = {
                0x46, 0x40, 0xB9, 0x80,
                0x00, 0x00, 0xFF, 0xC0,
                0x1F, 0x10, 1, 1
            };
            IntroMovie_StartWindowPanEffect(bgAnimCnt->window, 253, 0, &_021EB39C);
            IntroMovie_StartBgScroll_VBlank(bgConfig, bgAnimCnt->scroll, GF_BG_LYR_SUB_1, 0, -0x30, 254);
            IntroMovie_StartBgScroll_VBlank(bgConfig, bgAnimCnt->scroll, GF_BG_LYR_SUB_2, 0, -0x20, 254);
            IntroMovie_StartBgScroll_VBlank(bgConfig, bgAnimCnt->scroll, GF_BG_LYR_SUB_3, 0, -0x08, 254);
            IntroMovie_AdvanceSceneStep(data);
        }
        break;
    case 23:
        if (IntroMovie_WaitBgScrollAnim(bgAnimCnt->scroll, GF_BG_LYR_SUB_1)) {
            return TRUE;
        }
    }

    return FALSE;
}

void IntroMovie_Scene3_Exit(IntroMovieOvyData *data, IntroMovieScene3Data *sceneData) {
    u8 i, j;
    BgConfig *bgConfig = IntroMovie_GetBgConfig(data);
    Main_SetVBlankIntrCB(NULL, NULL);
    if (sceneData->unk_001) {
        Camera_UnsetStaticPtr();
        Camera_Delete(sceneData->unk_080);
        for (i = 0; i < 3; ++i) {
            for (j = 0; j < 2; ++j) {
                NNS_G3dFreeAnmObj(&sceneData->unk_1C0, sceneData->unk_084[i].unk_60[j]);
                FreeToHeap(sceneData->unk_084[i].unk_58[j]);
            }
            FreeToHeap(sceneData->unk_084[i].unk_54);
        }
        GF_3DVramMan_Delete(sceneData->unk_1BC);
        for (i = 0; i < 4; ++i) {
            FreeToHeap(sceneData->unk_004[i]);
        }
        for (i = 0; i < 3; ++i) {
            FreeToHeap(sceneData->unk_018[i]);
        }
        FreeToHeap(sceneData->unk_014);
        ov60_021E9878(data, sceneData);
        FreeBgTilemapBuffer(bgConfig, GF_BG_LYR_SUB_0);
        FreeBgTilemapBuffer(bgConfig, GF_BG_LYR_SUB_1);
        FreeBgTilemapBuffer(bgConfig, GF_BG_LYR_SUB_2);
        FreeBgTilemapBuffer(bgConfig, GF_BG_LYR_SUB_3);
        sceneData->unk_001 = FALSE;
    }
}

void ov60_021E9580(IntroMovieOvyData *data) {
    BgConfig *bgConfig = IntroMovie_GetBgConfig(data);

    {
        // _021EB268
        GraphicsModes graphicsModes = {
            GX_DISPMODE_GRAPHICS,
            GX_BGMODE_0,
            GX_BGMODE_0,
            GX_BG0_AS_3D,
        };
        SetBothScreensModesAndDisable(&graphicsModes);
    }
    {
        // _021EB2DC
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
        InitBgFromTemplate(bgConfig, GF_BG_LYR_SUB_0, &bgTemplate, 0);
    }
    {
        // _021EB2F8
        BgTemplate bgTemplate = {
            0, 0,
            GF_BG_BUF_SIZE_256x256_4BPP,
            0,
            GF_BG_SCR_SIZE_256x256,
            GX_BG_COLORMODE_16,
            01,
            1,
            0,
            1,
            0,
            0,
            0
        };
        InitBgFromTemplate(bgConfig, GF_BG_LYR_SUB_1, &bgTemplate, 0);
    }
    {
        // _021EB314
        BgTemplate bgTemplate = {
            0, 0,
            GF_BG_BUF_SIZE_256x256_4BPP,
            0,
            GF_BG_SCR_SIZE_256x256,
            GX_BG_COLORMODE_16,
            2,
            1,
            0,
            2,
            0,
            0,
            0
        };
        InitBgFromTemplate(bgConfig, GF_BG_LYR_SUB_2, &bgTemplate, 0);
    }
    {
        // _021EB330
        BgTemplate bgTemplate = {
            0, 0,
            GF_BG_BUF_SIZE_256x256_4BPP,
            0,
            GF_BG_SCR_SIZE_256x256,
            GX_BG_COLORMODE_16,
            3,
            1,
            0,
            3,
            0,
            0,
            0
        };
        InitBgFromTemplate(bgConfig, GF_BG_LYR_SUB_3, &bgTemplate, 0);
    }
}

void ov60_021E9638(BgConfig *bgConfig, IntroMovieScene3Data *sceneData) {
    int _021EB288[4] = {
        NARC_gs_opening_gs_opening_00000042_NSCR_lz,
        NARC_gs_opening_gs_opening_00000043_NSCR_lz,
        NARC_gs_opening_gs_opening_00000044_NSCR_lz,
        NARC_gs_opening_gs_opening_00000045_NSCR_lz,
    };
    int _021EB25C[3] = {
        NARC_gs_opening_gs_opening_00000050_NSCR_lz,
        NARC_gs_opening_gs_opening_00000051_NSCR_lz,
        NARC_gs_opening_gs_opening_00000052_NSCR_lz,
    };
    u8 i;

    GfGfxLoader_LoadCharData(NARC_demo_opening_gs_opening, NARC_gs_opening_gs_opening_00000040_NCGR_lz, bgConfig, GF_BG_LYR_SUB_0, 0, 0, TRUE, HEAP_ID_INTRO_MOVIE);
    GfGfxLoader_LoadScrnData(NARC_demo_opening_gs_opening, NARC_gs_opening_gs_opening_00000046_NSCR_lz, bgConfig, GF_BG_LYR_SUB_3, 0, 0, TRUE, HEAP_ID_INTRO_MOVIE);

    for (i = 0; i < 4; ++i) {
        sceneData->unk_004[i] = GfGfxLoader_GetScrnData(NARC_demo_opening_gs_opening, _021EB288[i], TRUE, &sceneData->unk_024[i], HEAP_ID_INTRO_MOVIE);
    }

    for (i = 0; i < 3; ++i) {
        sceneData->unk_018[i] = GfGfxLoader_GetScrnData(NARC_demo_opening_gs_opening, _021EB25C[i], TRUE, &sceneData->unk_038[i], HEAP_ID_INTRO_MOVIE);
    }

    sceneData->unk_014 = GfGfxLoader_GetScrnData(NARC_demo_opening_gs_opening, NARC_gs_opening_gs_opening_00000047_NSCR_lz, TRUE, &sceneData->unk_034, HEAP_ID_INTRO_MOVIE);
    BgCopyOrUncompressTilemapBufferRangeToVram(bgConfig, GF_BG_LYR_SUB_0, sceneData->unk_024[0]->rawData, sceneData->unk_024[0]->szByte, 0);
    GfGfxLoader_LoadScrnData(NARC_demo_opening_gs_opening, NARC_gs_opening_gs_opening_00000048_NSCR_lz, bgConfig, GF_BG_LYR_SUB_1, 0, 0, TRUE, HEAP_ID_INTRO_MOVIE);
    GfGfxLoader_LoadScrnData(NARC_demo_opening_gs_opening, NARC_gs_opening_gs_opening_00000049_NSCR_lz, bgConfig, GF_BG_LYR_SUB_2, 0, 0, TRUE, HEAP_ID_INTRO_MOVIE);
    GfGfxLoader_GXLoadPal(NARC_demo_opening_gs_opening, NARC_gs_opening_gs_opening_00000039_NCLR, GF_PAL_LOCATION_SUB_BG, (enum GFPalSlotOffset)0, 0x200, HEAP_ID_INTRO_MOVIE);
    OS_WaitIrq(TRUE, OS_IE_V_BLANK);
    GfGfx_BothDispOn();
}

void ov60_021E9768(IntroMovieOvyData *data, IntroMovieScene3Data *sceneData) {
    IntroMovie_CreateSpriteResourceManagers(data, _021EB1F4);
    _2DGfxResMan **resMen = IntroMovie_GetSpriteResourceManagersArray(data);

    sceneData->unk_044[0][GF_GFX_RES_TYPE_CHAR] = AddCharResObjFromNarc(resMen[GF_GFX_RES_TYPE_CHAR], NARC_demo_opening_gs_opening, NARC_gs_opening_gs_opening_00000066_NCGR_lz, TRUE, 2, 2, HEAP_ID_INTRO_MOVIE);
    sceneData->unk_044[0][GF_GFX_RES_TYPE_PLTT] = AddPlttResObjFromNarc(resMen[GF_GFX_RES_TYPE_PLTT], NARC_demo_opening_gs_opening, NARC_gs_opening_gs_opening_00000065_NCLR, FALSE, 2, 2, 1, HEAP_ID_INTRO_MOVIE);
    sceneData->unk_044[0][GF_GFX_RES_TYPE_CELL] = AddCellOrAnimResObjFromNarc(resMen[GF_GFX_RES_TYPE_CELL], NARC_demo_opening_gs_opening, NARC_gs_opening_gs_opening_00000068_NCER_lz, TRUE, 2, GF_GFX_RES_TYPE_CELL, HEAP_ID_INTRO_MOVIE);
    sceneData->unk_044[0][GF_GFX_RES_TYPE_ANIM] = AddCellOrAnimResObjFromNarc(resMen[GF_GFX_RES_TYPE_ANIM], NARC_demo_opening_gs_opening, NARC_gs_opening_gs_opening_00000067_NANR_lz, TRUE, 2, GF_GFX_RES_TYPE_ANIM, HEAP_ID_INTRO_MOVIE);

    sceneData->unk_044[1][GF_GFX_RES_TYPE_CHAR] = AddCharResObjFromNarc(resMen[GF_GFX_RES_TYPE_CHAR], NARC_demo_opening_gs_opening, NARC_gs_opening_gs_opening_00000070_NCGR_lz, TRUE, 3, 2, HEAP_ID_INTRO_MOVIE);
    sceneData->unk_044[1][GF_GFX_RES_TYPE_PLTT] = AddPlttResObjFromNarc(resMen[GF_GFX_RES_TYPE_PLTT], NARC_demo_opening_gs_opening, NARC_gs_opening_gs_opening_00000069_NCLR, FALSE, 3, 2, 2, HEAP_ID_INTRO_MOVIE);
    sceneData->unk_044[1][GF_GFX_RES_TYPE_CELL] = AddCellOrAnimResObjFromNarc(resMen[GF_GFX_RES_TYPE_CELL], NARC_demo_opening_gs_opening, NARC_gs_opening_gs_opening_00000072_NCER_lz, TRUE, 3, GF_GFX_RES_TYPE_CELL, HEAP_ID_INTRO_MOVIE);
    sceneData->unk_044[1][GF_GFX_RES_TYPE_ANIM] = AddCellOrAnimResObjFromNarc(resMen[GF_GFX_RES_TYPE_ANIM], NARC_demo_opening_gs_opening, NARC_gs_opening_gs_opening_00000071_NANR_lz, TRUE, 3, GF_GFX_RES_TYPE_ANIM, HEAP_ID_INTRO_MOVIE);

    for (u8 i = 0; i < 2; ++i) {
        sub_0200ACF0(sceneData->unk_044[i][GF_GFX_RES_TYPE_CHAR]);
        sub_0200AF94(sceneData->unk_044[i][GF_GFX_RES_TYPE_PLTT]);
    }

    GfGfx_EngineBTogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_ON);
}

void ov60_021E9878(IntroMovieOvyData *data, IntroMovieScene3Data *sceneData) {
    Sprite_Delete(sceneData->unk_064);
    Sprite_Delete(sceneData->unk_068);
    Sprite_Delete(sceneData->unk_06C[0]);
    Sprite_Delete(sceneData->unk_06C[1]);
    Sprite_Delete(sceneData->unk_06C[2]);

    for (u8 i = 0; i < 2; ++i) {
        sub_0200AEB0(sceneData->unk_044[i][GF_GFX_RES_TYPE_CHAR]);
        sub_0200B0A8(sceneData->unk_044[i][GF_GFX_RES_TYPE_PLTT]);
    }
    IntroMovie_DestroySpriteResourceManagers(data);
}

void ov60_021E98C0(IntroMovieOvyData *data, IntroMovieScene3Data *sceneData) {
    SpriteResourcesHeader header;
    SpriteTemplate template;
    int _021EB214[3] = {544, 672, 608};
    int _021EB220[3] = {1, 2, 3};

    IntroMovie_BuildSpriteResourcesHeaderAndTemplate(2, data, 0, NNS_G2D_VRAM_TYPE_2DSUB, &template, &header);
    template.position.x = 128 * FX32_ONE;
    template.position.y = 608 * FX32_ONE;
    sceneData->unk_064 = CreateSprite(&template);
    Set2dSpriteAnimActiveFlag(sceneData->unk_064, FALSE);
    Set2dSpriteVisibleFlag(sceneData->unk_064, FALSE);
    Set2dSpriteAnimSeqNo(sceneData->unk_064, 0);

    IntroMovie_BuildSpriteResourcesHeaderAndTemplate(3, data, 0, NNS_G2D_VRAM_TYPE_2DSUB, &template, &header);
    template.position.x = 32 * FX32_ONE;
    template.position.y = 608 * FX32_ONE;
    sceneData->unk_068 = CreateSprite(&template);
    Set2dSpriteAnimActiveFlag(sceneData->unk_068, FALSE);
    Set2dSpriteVisibleFlag(sceneData->unk_068, FALSE);
    Set2dSpriteAnimSeqNo(sceneData->unk_068, 0);

    for (int i = 0; i < 3; ++i) {
        IntroMovie_BuildSpriteResourcesHeaderAndTemplate(3, data, 0, NNS_G2D_VRAM_TYPE_2DSUB, &template, &header);
        template.position.x = 128 * FX32_ONE;
        template.position.y = _021EB214[i] * FX32_ONE;
        sceneData->unk_06C[i] = CreateSprite(&template);
        Set2dSpriteAnimActiveFlag(sceneData->unk_06C[i], FALSE);
        Set2dSpriteVisibleFlag(sceneData->unk_06C[i], FALSE);
        Set2dSpriteAnimSeqNo(sceneData->unk_06C[i], _021EB220[i]);
    }
}

void ov60_021E99B8(IntroMovieScene3Data *sceneData) {
    u8 j, i;
    NARC *narc = NARC_New(NARC_demo_opening_gs_opening, HEAP_ID_INTRO_MOVIE);
    GF_ExpHeap_FndInitAllocator(&sceneData->unk_1C0, HEAP_ID_INTRO_MOVIE, 4);
    for (i = 0; i < 3; ++i) {
        NNSG3dResMdl *sp28;
        sceneData->unk_084[i].unk_54 = NARC_AllocAndReadWholeMember(narc, _021EB22C[i], HEAP_ID_INTRO_MOVIE);
        sub_0201F51C(&sceneData->unk_084[i].unk_00, &sp28, &sceneData->unk_084[i].unk_54);
        NNSG3dResTex *sp14 = NNS_G3dGetTex(sceneData->unk_084[i].unk_54);
        NNS_G3dMdlUseGlbDiff(sp28);
        NNS_G3dMdlUseGlbAmb(sp28);
        NNS_G3dMdlUseGlbSpec(sp28);
        NNS_G3dMdlUseGlbEmi(sp28);
        NNS_G3dMdlUseGlbLightEnableFlag(sp28);
        for (j = 0; j < 2; ++j) {
            sceneData->unk_084[i].unk_58[j] = NARC_AllocAndReadWholeMember(narc, _021EB2C4[i][j], HEAP_ID_INTRO_MOVIE);
            NNSG3dAnmObj *sp24 = NNS_G3dGetAnmByIdx(sceneData->unk_084[i].unk_58[j], 0);
            sceneData->unk_084[i].unk_60[j] = NNS_G3dAllocAnmObj(&sceneData->unk_1C0, sp24, sp28);
            NNS_G3dAnmObjInit(sceneData->unk_084[i].unk_60[j], sp24, sp28, sp14);
            NNS_G3dRenderObjAddAnmObj(&sceneData->unk_084[i].unk_00, sceneData->unk_084[i].unk_60[j]);
        }
    }
    NARC_Delete(narc);

    sceneData->unk_080 = Camera_New(HEAP_ID_INTRO_MOVIE);

    VecFx32 _021EB238 = {0, 0, 96 * FX32_ONE};

    Camera_Init_FromTargetDistanceAndAngle(
        &_021EB238,
        _021EB298.distance,
        &_021EB298.angle,
        _021EB298.perspective,
        _021EB298.perspectiveType,
        _021EB298.setReference,
        sceneData->unk_080
    );
    Camera_SetPerspectiveAngle(0x981, sceneData->unk_080);
    Camera_SetStaticPtr(sceneData->unk_080);
    NNS_G3dGlbPolygonAttr(5, GX_POLYGONMODE_MODULATE, GX_CULL_BACK, 0, 0x1F, 0x8000);
}

void ov60_021E9B60(IntroMovieScene3Data *sceneData) {
    u8 i, r1;
    MtxFx33 _021EB34C = {
        FX32_ONE,        0,        0,
               0, FX32_ONE,        0,
               0,        0, FX32_ONE,
    };

    VecFx32 _021EB244 = {FX32_ONE, FX32_ONE, FX32_ONE};

    VecFx32 sp00 = {0, 0, 0};

    int r4 = sceneData->unk_1D0;
    if (r4 != 0xFFFF) {
        Thunk_G3X_Reset();
        Camera_PushLookAtToNNSGlb();
        r1 = (u8)r4; // todo: is this an inline?
        for (i = 0; i < 2; ++i) {
            fx32 frame = sceneData->unk_084[r1].unk_60[i]->frame + FX32_ONE;
            if (frame < NNS_G3dAnmObjGetNumFrame(sceneData->unk_084[r1].unk_60[i])) {
                sceneData->unk_084[r1].unk_60[i]->frame = frame;
            }
        }
        Draw3dModel(&sceneData->unk_084[r1].unk_00, &sp00, &_021EB34C, &_021EB244);
        sub_02026E50(0, 1);
    }
}

void ov60_021E9BFC(void) {
    G2_SetBG0Priority(0);
    G3X_SetShading(GX_SHADING_TOON);
    G3X_AntiAlias(TRUE);
    G3X_AlphaTest(FALSE, 0);
    G3X_AlphaBlend(TRUE);
    G3X_EdgeMarking(TRUE);
    G3X_SetEdgeColorTable(_021EB278);
    G3X_SetFog(FALSE, GX_FOGBLEND_COLOR_ALPHA, GX_FOGSLOPE_0x8000, 0);
    G3X_SetClearColor(RGB_BLACK, 0, 0x7FFF, 0x3F, FALSE);
    G3_ViewPort(0, 0, 255, 191);
}

void ov60_021E9C84(u8 a0) {
    for (u8 i = 0; i < 4; ++i) {
        NNS_G3dGlbLightVector((GXLightId)i, _021EB554[a0][i].x, _021EB554[a0][i].y, _021EB554[a0][i].z);
        NNS_G3dGlbLightColor((GXLightId)i, _021EB2AC[a0][i]);
    }
    NNS_G3dGlbMaterialColorDiffAmb(_021EB202[a0], _021EB208[a0], FALSE);
    NNS_G3dGlbMaterialColorSpecEmi(_021EB1FC[a0], _021EB20E[a0], FALSE);
}

HeapID _deadstrip_03(int idx);
HeapID _deadstrip_03(int idx) {
    static const HeapID sDeadstrippedRodata_021EB1F8[1] = {HEAP_ID_INTRO_MOVIE};
    return sDeadstrippedRodata_021EB1F8[idx];
}
