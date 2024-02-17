#include "global.h"
#include "intro_movie_internal.h"
#include "system.h"
#include "unk_0200B150.h"
#include "unk_0200FA24.h"
#include "unk_020215A0.h"
#include "unk_02022588.h"

void IntroMovie_Scene4_VBlankCB(void *pVoid);
void IntroMovie_Scene4_Init(IntroMovieOvyData *data, IntroMovieScene4Data *sceneData);
BOOL IntroMovie_Scene4_Main(IntroMovieOvyData *data, IntroMovieScene4Data *sceneData, int a2);
void IntroMovie_Scene4_Exit(IntroMovieOvyData *data, IntroMovieScene4Data *sceneData);
void ov60_021EA2A0(IntroMovieOvyData *data);
void ov60_021EA3A0(BgConfig *bgConfig, IntroMovieScene4Data *sceneData);
void ov60_021EA508(IntroMovieOvyData *data, IntroMovieScene4Data *sceneData);
void ov60_021EA4AC(IntroMovieOvyData *data, BgConfig *bgConfig);
void ov60_021EA700(IntroMovieOvyData *data, IntroMovieScene4Data *sceneData);
void ov60_021EA918(void);
u32 ov60_021EA828(u32 size, BOOL is4x4comp);
u32 ov60_021EA84C(u32 size, BOOL is4pltt);

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
