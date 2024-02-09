#include "global.h"
#include "intro_movie.h"
#include "intro_movie_internal.h"
#include "constants/sndseq.h"
#include "bg_window.h"
#include "brightness.h"
#include "gf_gfx_planes.h"
#include "main.h"
#include "math_util.h"
#include "sound_02004A44.h"
#include "sys_task_api.h"
#include "system.h"
#include "title_screen.h"
#include "unk_0200B150.h"
#include "unk_0200FA24.h"
#include "unk_020215A0.h"
#include "unk_02022588.h"
#include "unk_02023694.h"

BOOL IntroMovie_Init(OVY_MANAGER *man, int *state);
BOOL IntroMovie_Main(OVY_MANAGER *man, int *state);
BOOL IntroMovie_Exit(OVY_MANAGER *man, int *state);
void ov60_021E6E14(void);
void ov60_021E6E34(IntroMovieOvyData *data);
void ov60_021E6E40(IntroMovieOvyData *data);
void ov60_021E6EC0(IntroMovieOvyData *data);

const OVY_MGR_TEMPLATE gApplication_IntroMovie = {IntroMovie_Init, IntroMovie_Main, IntroMovie_Exit, FS_OVERLAY_ID_NONE};

static BOOL (*sIntroMovieSceneFuncs[])(IntroMovieOvyData *data, void *a1) = {
    IntroMovie_Scene1,
    IntroMovie_Scene2,
    IntroMovie_Scene3,
    IntroMovie_Scene4,
    IntroMovie_Scene5,
};

HeapID _deadstrip_00(int idx);
HeapID _deadstrip_00(int idx) {
    static const HeapID sDeadstrippedRodata[2] = {HEAP_ID_INTRO_MOVIE, HEAP_ID_INTRO_MOVIE};
    return sDeadstrippedRodata[idx];
}

BOOL IntroMovie_Init(OVY_MANAGER *man, int *state) {
    ScreenBrightnessData_InitAll();
    sub_0200FBF4(PM_LCD_TOP, RGB_BLACK);
    sub_0200FBF4(PM_LCD_BOTTOM, RGB_BLACK);
    Main_SetVBlankIntrCB(NULL, NULL);
    Main_SetHBlankIntrCB(NULL, NULL);
    GfGfx_DisableEngineAPlanes();
    GfGfx_DisableEngineBPlanes();
    SetKeyRepeatTimers(4, 8);
    CreateHeap(HEAP_ID_3, HEAP_ID_INTRO_MOVIE, 0x68000);

    IntroMovieOvyData *data = OverlayManager_CreateAndGetData(man, sizeof(IntroMovieOvyData), HEAP_ID_INTRO_MOVIE);
    memset(data, 0, sizeof(IntroMovieOvyData));
    data->heapID = HEAP_ID_INTRO_MOVIE;
    data->introSkipped = FALSE;
    data->skipAllowed = FALSE;
    gSystem.screensFlipped = TRUE;
    GfGfx_SwapDisplay();
    data->unk_14C = GetLCRNGSeed();
    SetLCRNGSeed(0);
    data->bgConfig = BgConfig_Alloc(data->heapID);
    ov60_021E6E14();
    ov60_021E6E40(data);
    return TRUE;
}

BOOL IntroMovie_Main(OVY_MANAGER *man, int *state) {
    IntroMovieOvyData *data = OverlayManager_GetData(man);
    if (data->skipAllowed && ((gSystem.newKeys & PAD_BUTTON_A) || (gSystem.newKeys & PAD_BUTTON_START) || gSystem.touchNew)) {
        data->introSkipped = TRUE;
        gSystem.unk70 = FALSE;
        sub_0200FBF4(PM_LCD_TOP, RGB_WHITE);
        sub_0200FBF4(PM_LCD_BOTTOM, RGB_WHITE);
    }

    switch (*state) {
    case 0:
        data->scene1Data.skipAllowedPtr = &data->skipAllowed;
        sub_02004EC4(2, SEQ_GS_TITLE, 1);
        ++(*state);
        break;
    case 1:
        if (sIntroMovieSceneFuncs[data->sceneNumber](data, IntroMovie_GetSceneDataPtr(data))) {
            ++data->sceneNumber;
            data->sceneStep = 0;
            data->sceneTimer = 0;
            if (data->sceneNumber >= 5) {
                ++(*state);
            }
        } else {
            ++data->sceneTimer;
        }
        break;
    case 2:
        return TRUE;
    default:
        GF_ASSERT(FALSE);
    }

    if (data->introSkipped) {
        return TRUE;
    }

    ov60_021E6E34(data);
    ++data->unk_004;
    return FALSE;
}

BOOL IntroMovie_Exit(OVY_MANAGER *man, int *state) {
    int i;

    IntroMovieOvyData *data = OverlayManager_GetData(man);
    sub_0200FBF4(PM_LCD_TOP, RGB_WHITE);
    sub_0200FBF4(PM_LCD_BOTTOM, RGB_WHITE);
    ov60_021E6EC0(data);
    FreeToHeap(data->bgConfig);
    if (data->unk_46C.unk_000[0].task != NULL) {
        SysTask_Destroy(data->unk_46C.unk_000[0].task);
        data->unk_46C.unk_000[0].task = NULL;
    }
    if (data->unk_46C.unk_000[1].task != NULL) {
        SysTask_Destroy(data->unk_46C.unk_000[1].task);
        data->unk_46C.unk_000[1].task = NULL;
    }
    for (i = 0; i < 8; ++i) {
        if (data->unk_46C.unk_030[i].task != NULL) {
            SysTask_Destroy(data->unk_46C.unk_030[i].task);
            data->unk_46C.unk_030[i].task = NULL;
        }
    }
    for (i = 0; i < 2; ++i) {
        if (data->unk_46C.unk_110[i].unk_0C != NULL) {
            SysTask_Destroy(data->unk_46C.unk_110[i].unk_0C);
            data->unk_46C.unk_110[i].unk_0C = NULL;
        }
    }
    if (data->unk_614.task != NULL) {
        SysTask_Destroy(data->unk_614.task);
        data->unk_614.task = NULL;
    }
    Main_SetVBlankIntrCB(NULL, NULL);
    Main_SetHBlankIntrCB(NULL, NULL);
    G2_BlendNone();
    G2S_BlendNone();
    GX_SetVisibleWnd(0);
    GXS_SetVisibleWnd(0);
    sub_0200FB70();
    SetLCRNGSeed(data->unk_14C);
    OverlayManager_FreeData(man);
    DestroyHeap(HEAP_ID_INTRO_MOVIE);
    RegisterMainOverlay(FS_OVERLAY_ID(intro_title), &gApplication_TitleScreen);
    return TRUE;
}

void ov60_021E6E14(void) {
    GraphicsBanks banks = {
        GX_VRAM_BG_128_B,
        GX_VRAM_BGEXTPLTT_NONE,
        GX_VRAM_SUB_BG_128_C,
        GX_VRAM_SUB_BGEXTPLTT_NONE,
        GX_VRAM_OBJ_32_FG,
        GX_VRAM_OBJEXTPLTT_NONE,
        GX_VRAM_SUB_OBJ_16_I,
        GX_VRAM_SUB_OBJEXTPLTT_NONE,
        GX_VRAM_TEX_0_A,
        GX_VRAM_TEXPLTT_0123_E
    };
    GfGfx_SetBanks(&banks);
}

void ov60_021E6E34(IntroMovieOvyData *data) {
    sub_0202457C(data->unk_010);
}

void ov60_021E6E40(IntroMovieOvyData *data) {
    GX_SetOBJVRamModeChar(GX_OBJVRAMMODE_CHAR_1D_32K);
    GXS_SetOBJVRamModeChar(GX_OBJVRAMMODE_CHAR_1D_32K);

    UnkStruct_020215A0 sp14 = {10, 0, 0, HEAP_ID_INTRO_MOVIE};
    sub_020215A0(&sp14);
    sub_02022588(10, HEAP_ID_INTRO_MOVIE);
    sub_020216C8();
    sub_02022638();
    NNS_G2dInitOamManagerModule();
    OamManager_Create(0, 0x80, 0, 0x20, 0, 0x80, 0, 0x20, HEAP_ID_INTRO_MOVIE);
    data->unk_010 = G2dRenderer_Init(20, &data->unk_014, HEAP_ID_INTRO_MOVIE);
}

void ov60_021E6EC0(IntroMovieOvyData *data) {
    SpriteList_Delete(data->unk_010);
    OamManager_Free();
    sub_0202168C();
    sub_02022608();
}
