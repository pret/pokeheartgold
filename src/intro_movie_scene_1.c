#include "global.h"
#include "intro_movie_internal.h"
#include "unk_0200B150.h"
#include "unk_0200FA24.h"
#include "unk_020215A0.h"
#include "unk_02022588.h"
#include "system.h"

void ov60_021E79E4(void *pVoid);
void IntroMovie_Scene1_Init(IntroMovieOvyData *data, IntroMovieScene1Data *sceneData);
BOOL IntroMovie_Scene1_Main(IntroMovieOvyData *data, IntroMovieScene1Data *sceneData, int a2);
void IntroMovie_Scene1_Exit(IntroMovieOvyData *data, IntroMovieScene1Data *sceneData);
void ov60_021E7CC4(IntroMovieOvyData *data);
void ov60_021E7E0C(BgConfig *bgConfig);
void ov60_021E7F94(IntroMovieOvyData *data, IntroMovieScene1Data *sceneData);
void ov60_021E8050(IntroMovieOvyData *data, IntroMovieScene1Data *sceneData);
void ov60_021E7F74(IntroMovieOvyData *data);

BOOL IntroMovie_Scene1(IntroMovieOvyData *data, void *pVoid) {
    IntroMovieScene1Data *sceneData = (IntroMovieScene1Data *)pVoid;

    if (ov60_021E7698(data)) {
        sceneData->unk_000 = 2;
    }

    switch (sceneData->unk_000) {
    case 0:
        IntroMovie_Scene1_Init(data, sceneData);
        ++sceneData->unk_000;
        break;
    case 1:
        if (IntroMovie_Scene1_Main(data, sceneData, ov60_021E769C(data))) {
            ++sceneData->unk_000;
        }
        break;
    case 2:
        IntroMovie_Scene1_Exit(data, sceneData);
        return TRUE;
    }

    return FALSE;
}

void ov60_021E79E4(void *pVoid) {
    IntroMovieOvyData *data = (IntroMovieOvyData *)pVoid;

    DoScheduledBgGpuUpdates(IntroMovie_GetBgConfig(data));
    OamManager_ApplyAndResetBuffers();
}

void IntroMovie_Scene1_Init(IntroMovieOvyData *data, IntroMovieScene1Data *sceneData) {
    BgConfig *bgConfig = IntroMovie_GetBgConfig(data);
    sub_020216C8();
    sub_02022638();
    gSystem.screensFlipped = TRUE;
    GfGfx_SwapDisplay();
    ov60_021E7CC4(data);
    ov60_021E76A0(data);
    Main_SetVBlankIntrCB(ov60_021E79E4, data);
    ov60_021E7E0C(bgConfig);
    ov60_021E7F94(data, sceneData);
    ov60_021E8050(data, sceneData);
    ov60_021E7F74(data);
    sceneData->unk_001 = 1;
}

BOOL IntroMovie_Scene1_Main(IntroMovieOvyData *data, IntroMovieScene1Data *sceneData, int a2) {
    BgConfig *bgConfig = IntroMovie_GetBgConfig(data);
    IntroMovieSub_46C *r4 = ov60_021E768C(data);
    u8 timer = IntroMovie_GetSceneStepTimer(data);
    switch (IntroMovie_GetSceneStep(data)) {
    case 0:
        BgSetPosTextAndCommit(bgConfig, GF_BG_LYR_MAIN_0, BG_POS_OP_SET_Y, 0x80);
        GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG0, GF_PLANE_TOGGLE_ON);
        GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG0, GF_PLANE_TOGGLE_ON);
        IntroMovie_AdvanceSceneStep(data);
        break;
    case 1:
        if (timer >= 30) {
            ov60_021E6FD0(&r4->unk_000[0], 1, 0x20, 60, 1, 0);
            ov60_021E6FD0(&r4->unk_000[1], 1, 0x20, 60, 1, 1);
            IntroMovie_AdvanceSceneStep(data);
        }
        break;
    case 2:
        if (r4->unk_000[0].stopped && r4->unk_000[1].stopped) {
            IntroMovie_AdvanceSceneStep(data);
        }
        break;
    case 3:
        if (timer >= 20) {
            *sceneData->skipAllowedPtr = TRUE;
            GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG0, GF_PLANE_TOGGLE_OFF);
            GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG1, GF_PLANE_TOGGLE_ON);
            BgSetPosTextAndCommit(bgConfig, GF_BG_LYR_MAIN_0, BG_POS_OP_SET_Y, 0);
            G2_SetBlendAlpha(1, 0x20, 0x1F, 0);
            IntroMovie_AdvanceSceneStep(data);
        }
        break;
    case 4:
        if (timer >= 110) {
            IntroMovie_AdvanceSceneStep(data);
        }
        break;
    case 5:
        GfGfx_EngineATogglePlanes((GXPlaneMask)(GX_PLANEMASK_BG1 | GX_PLANEMASK_BG2 | GX_PLANEMASK_BG3), GF_PLANE_TOGGLE_ON);
        GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG3, GF_PLANE_TOGGLE_ON);
        Set2dSpriteVisibleFlag(sceneData->unk_018, TRUE);
        IntroMovie_AdvanceSceneStep(data);
        break;
    case 6:
        if (timer >= 1) {
            ov60_021E6FD0(&r4->unk_000[0], 1, 0x1E, 0x50, 1, 1);
            ov60_021E6FD0(&r4->unk_000[1], 2, 0x1E, 0x50, 1, 0);
            ov60_021E7074(bgConfig, r4->unk_030, GF_BG_LYR_MAIN_1, 0, -0x20, 0xF0);
            ov60_021E7074(bgConfig, r4->unk_030, GF_BG_LYR_MAIN_2, 0, -0x10, 0xF0);
            ov60_021E6F28(sceneData->unk_018, TRUE);
            IntroMovie_AdvanceSceneStep(data);
        }
        break;
    case 7:
        if (r4->unk_000[0].stopped && r4->unk_000[1].stopped && ov60_021E72FC(r4->unk_030, GF_BG_LYR_MAIN_1) && ov60_021E72FC(r4->unk_030, GF_BG_LYR_MAIN_2)) {
            IntroMovie_AdvanceSceneStep(data);
        }
        break;
    case 8:
        if (timer >= 128) {
            ov60_021E6F28(sceneData->unk_01C, TRUE);
            IntroMovie_AdvanceSceneStep(data);
        }
        break;
    case 9:
        if (timer >= 90) {
            BeginNormalPaletteFade(0, 0, 0, RGB_WHITE, 65, 1, HEAP_ID_INTRO_MOVIE);
            IntroMovie_AdvanceSceneStep(data);
        }
        break;
    case 10:
        if (IsPaletteFadeFinished()) {
            return TRUE;
        }
    }

    return FALSE;
}
