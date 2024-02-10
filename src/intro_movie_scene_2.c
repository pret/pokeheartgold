#include "global.h"
#include "intro_movie_internal.h"
#include "system.h"
#include "unk_0200B150.h"
#include "unk_0200FA24.h"
#include "unk_020215A0.h"
#include "unk_02022588.h"

void IntroMovie_Scene2_VBlankCB(void *pVoid);
void IntroMovie_Scene2_Init(IntroMovieOvyData *data, IntroMovieScene2Data *sceneData);
BOOL IntroMovie_Scene2_Main(IntroMovieOvyData *data, IntroMovieScene2Data *sceneData, int a2);
void IntroMovie_Scene2_Exit(IntroMovieOvyData *data, IntroMovieScene2Data *sceneData);
void ov60_021E81D8(IntroMovieOvyData *data, BgConfig *bgConfig);
void ov60_021E866C(IntroMovieOvyData *data);
void ov60_021E8724(BgConfig *bgConfig);
void ov60_021E87FC(IntroMovieOvyData *data, IntroMovieScene2Data *sceneData);
void ov60_021E8978(IntroMovieOvyData *data, IntroMovieScene2Data *sceneData);

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
    ov60_021E76A0(data);
    Main_SetVBlankIntrCB(IntroMovie_Scene2_VBlankCB, data);
    ov60_021E8724(bgConfig);
    ov60_021E6FAC(data, 0, 0, 0, 0xC0);
    ov60_021E87FC(data, sceneData);
    ov60_021E8978(data, sceneData);
    ov60_021E81D8(data, bgConfig);
    sceneData->unk_001 = 1;
}

void ov60_021E81D8(IntroMovieOvyData *data, BgConfig *bgConfig) {
    IntroMovieSub_46C *unk_46C = ov60_021E768C(data);
    ov60_021E7074(bgConfig, unk_46C->unk_030, GF_BG_LYR_MAIN_1, 0, 0x140, 0);
    ov60_021E7074(bgConfig, unk_46C->unk_030, GF_BG_LYR_MAIN_0, 0, 0xC0, 0);
    ov60_021E7074(bgConfig, unk_46C->unk_030, GF_BG_LYR_MAIN_2, 0, 0x40, -1);
    ov60_021E7074(bgConfig, unk_46C->unk_030, GF_BG_LYR_SUB_0, 0, 0x40, -1);
}
