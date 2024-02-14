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
void ov60_021E9BFC(void);
void ov60_021E99B8(IntroMovieScene3Data *sceneData);
void ov60_021E9B60(IntroMovieScene3Data *sceneData);
void ov60_021E9C84(u8 a0);

extern const u8 _021EB1F4[4];
extern const int _021EB22C[3];
extern const int _021EB2C4[3][2];
extern const CameraAngle _021EB29C;

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
            IntroMovie_StartSpriteAnimAndMakeVisible(sceneData->unk_06C[0], TRUE);
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
        IntroMovie_StartSpriteAnimAndMakeVisible(sceneData->unk_06C[1], TRUE);
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
        extern const GraphicsModes _021EB268;
        GraphicsModes graphicsModes = _021EB268;
        SetBothScreensModesAndDisable(&graphicsModes);
    }
    {
        extern const BgTemplate _021EB2DC;
        BgTemplate bgTemplate = _021EB2DC;
        InitBgFromTemplate(bgConfig, GF_BG_LYR_SUB_0, &bgTemplate, 0);
    }
    {
        extern const BgTemplate _021EB2F8;
        BgTemplate bgTemplate = _021EB2F8;
        InitBgFromTemplate(bgConfig, GF_BG_LYR_SUB_1, &bgTemplate, 0);
    }
    {
        extern const BgTemplate _021EB314;
        BgTemplate bgTemplate = _021EB314;
        InitBgFromTemplate(bgConfig, GF_BG_LYR_SUB_2, &bgTemplate, 0);
    }
    {
        extern const BgTemplate _021EB330;
        BgTemplate bgTemplate = _021EB330;
        InitBgFromTemplate(bgConfig, GF_BG_LYR_SUB_3, &bgTemplate, 0);
    }
}

void ov60_021E9638(BgConfig *bgConfig, IntroMovieScene3Data *sceneData) {
    int sp20[4];
    {
    extern const int _021EB288[4];
    struct _s {
        int _f[4];
    };
    *(struct _s *)sp20 = *(struct _s *)_021EB288;
    }
    int sp14[3];
    {
    extern const int _021EB25C[3];
    struct _s {
        int _f[3];
    };
    *(struct _s *)sp14 = *(struct _s *)_021EB25C;
    }
    u8 i;

    GfGfxLoader_LoadCharData(NARC_demo_opening_gs_opening, NARC_gs_opening_gs_opening_00000040_NCGR_lz, bgConfig, GF_BG_LYR_SUB_0, 0, 0, TRUE, HEAP_ID_INTRO_MOVIE);
    GfGfxLoader_LoadScrnData(NARC_demo_opening_gs_opening, NARC_gs_opening_gs_opening_00000046_NSCR_lz, bgConfig, GF_BG_LYR_SUB_3, 0, 0, TRUE, HEAP_ID_INTRO_MOVIE);

    for (i = 0; i < 4; ++i) {
        sceneData->unk_004[i] = GfGfxLoader_GetScrnData(NARC_demo_opening_gs_opening, sp20[i], TRUE, &sceneData->unk_024[i], HEAP_ID_INTRO_MOVIE);
    }

    for (i = 0; i < 3; ++i) {
        sceneData->unk_018[i] = GfGfxLoader_GetScrnData(NARC_demo_opening_gs_opening, sp14[i], TRUE, &sceneData->unk_038[i], HEAP_ID_INTRO_MOVIE);
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
    int sp18[3];
    int sp0C[3];

    {
        struct _s {
            int _f[3];
        };
        extern const int _021EB214[3];
        extern const int _021EB220[3];
        *(struct _s *)sp18 = *(struct _s *)_021EB214;
        *(struct _s *)sp0C = *(struct _s *)_021EB220;
    }

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
        template.position.y = sp18[i] * FX32_ONE;
        sceneData->unk_06C[i] = CreateSprite(&template);
        Set2dSpriteAnimActiveFlag(sceneData->unk_06C[i], FALSE);
        Set2dSpriteVisibleFlag(sceneData->unk_06C[i], FALSE);
        Set2dSpriteAnimSeqNo(sceneData->unk_06C[i], sp0C[i]);
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

    extern const VecFx32 _021EB238;
    VecFx32 sp2C = _021EB238;
    Camera_Init_FromTargetDistanceAndAngle(&sp2C, FX32_CONST(410.922119140625), &_021EB29C, 0x5C1, 0, FALSE, sceneData->unk_080);
    Camera_SetPerspectiveAngle(0x981, sceneData->unk_080);
    Camera_SetStaticPtr(sceneData->unk_080);
    NNS_G3dGlbPolygonAttr(5, GX_POLYGONMODE_MODULATE, GX_CULL_BACK, 0, 0x1F, 0x8000);
}

void ov60_021E9B60(IntroMovieScene3Data *sceneData) {
    u8 i, r1;
    extern const MtxFx33 _021EB34C;
    MtxFx33 sp18 = _021EB34C;

    extern const VecFx32 _021EB244;
    VecFx32 sp0C = _021EB244;

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
        Draw3dModel(&sceneData->unk_084[r1].unk_00, &sp00, &sp18, &sp0C);
        sub_02026E50(0, 1);
    }
}
