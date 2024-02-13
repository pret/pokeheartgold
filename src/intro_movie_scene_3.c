#include "gf_gfx_loader.h"
#include "global.h"
#include "intro_movie_internal.h"
#include "system.h"
#include "unk_0200B150.h"
#include "unk_0200FA24.h"
#include "unk_020215A0.h"
#include "unk_02022588.h"
#include "demo/opening/gs_opening.naix"

void IntroMovie_Scene3_VBlankCB(void *pVoid);
void IntroMovie_Scene3_Init(IntroMovieOvyData *data, IntroMovieScene3Data *sceneData);
BOOL IntroMovie_Scene3_Main(IntroMovieOvyData *data, IntroMovieScene3Data *sceneData, int a2);
void IntroMovie_Scene3_Exit(IntroMovieOvyData *data, IntroMovieScene3Data *sceneData);
void ov60_021E8D04(IntroMovieScene3Data *sceneData, BgConfig *bgConfig);
void ov60_021E9580(IntroMovieOvyData *data);
void ov60_021E9638(BgConfig *bgConfig, IntroMovieScene3Data *sceneData);
void ov60_021E9768(IntroMovieOvyData *data, IntroMovieScene3Data *sceneData);
void ov60_021E98C0(IntroMovieOvyData *data, IntroMovieScene3Data *sceneData);
void ov60_021E9BFC(void);
void ov60_021E99B8(IntroMovieScene3Data *sceneData);
void ov60_021E9B60(IntroMovieScene3Data *sceneData);
void ov60_021E9C84(u8 a0);

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
    case 7:
        IntroMovie_BeginCircleWipeEffect(data, 2, FALSE, 8);
        IntroMovie_AdvanceSceneStep(data);
        break;
    case 8:
        if (IntroMovie_WaitCircleWipeEffect(data)) {
            IntroMovie_AdvanceSceneStep(data);
        }
        break;
    case 9: {
        // temporary
        // mwccarm the big dumb
        // TODO: inline rodata
        extern const int _021EB250[3];  // = {56, 73, 92}
        int sp1F8[3];
        struct _s {
            int _f[3];
        };
        *(struct _s *)sp1F8 = *(struct _s *)_021EB250;

        if (stepTimer >= sp1F8[sceneData->unk_003]) {
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
            extern const IntroMovieBgWindowAnimParam _021EB3C8;
            IntroMovieBgWindowAnimParam sp1CC = _021EB3C8;
            IntroMovie_StartWindowPanEffect(bgAnimCnt->window, 5, 0, &sp1CC);
        }
        if (stepTimer >= 44) {
            extern const IntroMovieBgWindowAnimParam _021EB3F4;
            IntroMovieBgWindowAnimParam sp1A0 = _021EB3F4;
            IntroMovie_StartWindowPanEffect(bgAnimCnt->window, 7, 0, &sp1A0);
            GXS_SetVisibleWnd(1);
            IntroMovie_StartBgScroll_VBlank(bgConfig, bgAnimCnt->scroll, GF_BG_LYR_SUB_0, -256, 0, 7);
            GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG0, GF_PLANE_TOGGLE_ON);
            IntroMovie_AdvanceSceneStep(data);
        }
        break;
    case 12:
        if (IntroMovie_WaitBgScrollAnim(bgAnimCnt->scroll, GF_BG_LYR_SUB_0)) {
            extern const IntroMovieBgWindowAnimParam _021EB420;
            IntroMovieBgWindowAnimParam sp174 = _021EB420;
            IntroMovie_StartWindowPanEffect(bgAnimCnt->window, 7, 0, &sp174);
            IntroMovie_StartBgScroll_VBlank(bgConfig, bgAnimCnt->scroll, GF_BG_LYR_SUB_1, 256, 0, 7);
            GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG1, GF_PLANE_TOGGLE_ON);
            IntroMovie_AdvanceSceneStep(data);
        }
        break;
    case 13:
        if (IntroMovie_WaitBgScrollAnim(bgAnimCnt->scroll, GF_BG_LYR_SUB_1)) {
            extern const IntroMovieBgWindowAnimParam _021EB44C;
            IntroMovieBgWindowAnimParam sp148 = _021EB44C;
            IntroMovie_StartWindowPanEffect(bgAnimCnt->window, 1, 0, &sp148);
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
            extern const IntroMovieBgWindowAnimParam _021EB478;
            IntroMovieBgWindowAnimParam sp11C = _021EB478;
            IntroMovie_StartWindowPanEffect(bgAnimCnt->window, 3, 0, &sp11C);
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
            IntroMovie_StartSpriteAnimAndMakeVisible(sceneData->unk_06C, TRUE);
        }
        if (stepTimer >= 145) {
            extern const IntroMovieBgWindowAnimParam _021EB4A4;
            IntroMovieBgWindowAnimParam sp0F0 = _021EB4A4;
            IntroMovie_StartWindowPanEffect(bgAnimCnt->window, 10, 0, &sp0F0);
            G2S_SetWnd1Position(0x46, 0x40, 0xb9, 0xc0);
            G2S_SetWnd1InsidePlane(0x1D, TRUE);
            IntroMovie_StartBgScroll_VBlank(bgConfig, bgAnimCnt->scroll, GF_BG_LYR_SUB_1, -116, 0, 10);
            IntroMovie_AdvanceSceneStep(data);
        }
        break;
    case 18:
        if (IntroMovie_WaitBgScrollAnim(bgAnimCnt->scroll, GF_BG_LYR_SUB_1)) {
            GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG1, GF_PLANE_TOGGLE_OFF);
            extern const IntroMovieBgWindowAnimParam _021EB4D0;
            IntroMovieBgWindowAnimParam sp0C4 = _021EB4D0;
            IntroMovie_StartWindowPanEffect(bgAnimCnt->window, 0, 0, &sp0C4);
            IntroMovie_AdvanceSceneStep(data);
        }
        break;
    case 19:
        IntroMovie_StartSpriteAnimAndMakeVisible(sceneData->unk_070, TRUE);
        if (stepTimer >= 10) {
            extern const IntroMovieBgWindowAnimParam _021EB4FC;
            IntroMovieBgWindowAnimParam sp098 = _021EB4FC;
            IntroMovie_StartWindowPanEffect(bgAnimCnt->window, 10, 0, &sp098);
            G2S_SetWnd1Position(0x46, 0x40, 0xB9, 0x80);
            G2S_SetWnd1InsidePlane(0x19, TRUE);
            IntroMovie_StartBgScroll_VBlank(bgConfig, bgAnimCnt->scroll, GF_BG_LYR_SUB_2, -116, 0, 10);
            IntroMovie_AdvanceSceneStep(data);
        }
        break;
    case 20:
        if (IntroMovie_WaitBgScrollAnim(bgAnimCnt->scroll, GF_BG_LYR_SUB_1) && IntroMovie_WaitBgScrollAnim(bgAnimCnt->scroll, GF_BG_LYR_SUB_2)) {
            GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG2, GF_PLANE_TOGGLE_OFF);
            extern const IntroMovieBgWindowAnimParam _021EB528;
            IntroMovieBgWindowAnimParam sp06C = _021EB528;
            IntroMovie_StartWindowPanEffect(bgAnimCnt->window, 0, 0, &sp06C);
            BG_LoadScreenTilemapData(bgConfig, GF_BG_LYR_SUB_1, sceneData->unk_038->rawData, sceneData->unk_038->szByte);
            BG_LoadScreenTilemapData(bgConfig, GF_BG_LYR_SUB_2, sceneData->unk_03C->rawData, sceneData->unk_03C->szByte);
            BG_LoadScreenTilemapData(bgConfig, GF_BG_LYR_SUB_3, sceneData->unk_040->rawData, sceneData->unk_040->szByte);
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
        IntroMovie_StartSpriteAnimAndMakeVisible(sceneData->unk_074, TRUE);
        if (stepTimer >= 30) {
            extern const IntroMovieBgWindowAnimParam _021EB370;
            IntroMovieBgWindowAnimParam sp040 = _021EB370;
            IntroMovie_StartWindowPanEffect(bgAnimCnt->window, 10, 0, &sp040);
            G2S_SetWnd1Position(0x46, 0x40, 0xB9, 0x80);
            G2S_SetWnd1InsidePlane(0x1E, TRUE);
            IntroMovie_StartBgScroll_VBlank(bgConfig, bgAnimCnt->scroll, GF_BG_LYR_SUB_0, 0x74, 0, 10);
            IntroMovie_AdvanceSceneStep(data);
        }
        break;
    case 22:
        if (IntroMovie_WaitBgScrollAnim(bgAnimCnt->scroll, GF_BG_LYR_SUB_0)) {
            GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG0, GF_PLANE_TOGGLE_OFF);
            extern const IntroMovieBgWindowAnimParam _021EB39C;
            IntroMovieBgWindowAnimParam sp014 = _021EB39C;
            IntroMovie_StartWindowPanEffect(bgAnimCnt->window, 253, 0, &sp014);
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
