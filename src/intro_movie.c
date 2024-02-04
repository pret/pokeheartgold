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
BOOL IntroMovie_Exec(OVY_MANAGER *man, int *state);
BOOL IntroMovie_Exit(OVY_MANAGER *man, int *state);
void ov60_021E6E14(void);
void ov60_021E6E34(IntroMovieOvyData *data);
void ov60_021E6E40(IntroMovieOvyData *data);
void ov60_021E6EC0(IntroMovieOvyData *data);
void *ov60_021E7900(IntroMovieOvyData *data);

BOOL (*_021EB860[])(IntroMovieOvyData *data, void *a1) = {
    ov60_021E7984,
    ov60_021E80E0,
    ov60_021E8BF8,
    ov60_021E9D08,
    ov60_021EAA14,
};

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
    data->unk_008 = FALSE;
    data->unk_628 = 0;
    gSystem.screensFlipped = TRUE;
    GfGfx_SwapDisplay();
    data->unk_14C = GetLCRNGSeed();
    SetLCRNGSeed(0);
    data->bgConfig = BgConfig_Alloc(data->heapID);
    ov60_021E6E14();
    ov60_021E6E40(data);
    return TRUE;
}

BOOL IntroMovie_Exec(OVY_MANAGER *man, int *state) {
    IntroMovieOvyData *data = OverlayManager_GetData(man);
    if (data->unk_628 && ((gSystem.newKeys & PAD_BUTTON_A) || (gSystem.newKeys & PAD_BUTTON_START) || gSystem.touchNew)) {
        data->unk_008 = TRUE;
        gSystem.unk70 = FALSE;
        sub_0200FBF4(PM_LCD_TOP, RGB_WHITE);
        sub_0200FBF4(PM_LCD_BOTTOM, RGB_WHITE);
    }

    switch (*state) {
    case 0:
        data->unk_150.unk_004 = &data->unk_628;
        sub_02004EC4(2, SEQ_GS_TITLE, 1);
        ++(*state);
        break;
    case 1:
        if (_021EB860[data->unk_62B](data, ov60_021E7900(data))) {
            ++data->unk_62B;
            data->unk_629 = 0;
            data->unk_62A = 0;
            if (data->unk_62B >= 5) {
                ++(*state);
            }
        } else {
            ++data->unk_62A;
        }
        break;
    case 2:
        return TRUE;
    default:
        GF_ASSERT(FALSE);
    }

    if (data->unk_008) {
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
    if (data->unk_470 != NULL) {
        SysTask_Destroy(data->unk_470);
        data->unk_470 = NULL;
    }
    if (data->unk_488 != NULL) {
        SysTask_Destroy(data->unk_488);
        data->unk_488 = NULL;
    }
    for (i = 0; i < 8; ++i) {
        if (data->unk_494[i].unk_18 != NULL) {
            SysTask_Destroy(data->unk_494[i].unk_18);
            data->unk_494[i].unk_18 = NULL;
        }
    }
    for (i = 0; i < 2; ++i) {
        if (data->unk_574[i].unk_14 != NULL) {
            SysTask_Destroy(data->unk_574[i].unk_14);
            data->unk_574[i].unk_14 = NULL;
        }
    }
    if (data->unk_61C != NULL) {
        SysTask_Destroy(data->unk_61C);
        data->unk_61C = NULL;
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
    RegisterMainOverlay(FS_OVERLAY_ID(OVY_60), &gApplication_TitleScreen);
    return TRUE;
}

void ov60_021E6E14(void) {
    extern const GraphicsBanks _021EB008;
    GraphicsBanks banks = _021EB008;
    GfGfx_SetBanks(&banks);
}

void ov60_021E6E34(IntroMovieOvyData *data) {
    sub_0202457C(data->unk_010);
}

void ov60_021E6E40(IntroMovieOvyData *data) {
    GX_SetOBJVRamModeChar(GX_OBJVRAMMODE_CHAR_1D_32K);
    GXS_SetOBJVRamModeChar(GX_OBJVRAMMODE_CHAR_1D_32K);

    extern const UnkStruct_020215A0 _021EAFF8;
    UnkStruct_020215A0 sp14 = _021EAFF8;
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
