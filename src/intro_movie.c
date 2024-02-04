#include "global.h"
#include "intro_movie.h"
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
#include "unk_0200FA24.h"
#include "unk_02023694.h"

struct IntroMovieSub_150 {
    u8 unk_000;
    u8 *unk_004;
    u8 filler_008[0x10];
    Sprite *unk_018;
    void *unk_01C;
};

struct IntroMovieSub_170_Sub_064 {
    BOOL unk_000;
    u16 unk_004;
    u8 unk_006;
    u8 unk_007;
    SysTask *unk_008;
    int unk_00C;
    int unk_010;
    int unk_014;
    int unk_018;
    Sprite *unk_01C;
    Sprite *unk_020;
    Sprite *unk_024;
};

struct IntroMovieSub_170 {
    u8 unk_000;
    u8 unk_001;
    u8 unk_002;
    u8 unk_003;
    _2DGfxResObj *unk_004[2][4];
    Sprite *unk_024;
    Sprite *unk_028;
    Sprite *unk_02C;
    Sprite *unk_030;
    Sprite *unk_034;
    Sprite *unk_038;
    Sprite *unk_03C[10];
    struct IntroMovieSub_170_Sub_064 unk_064;
    struct IntroMovieSub_170_Sub_064 unk_08C;
};

struct IntroMovieSub_224 {
    u8 unk_000;
    u8 padding_001[3];
    u8 filler_004[0x1D0];
};

struct IntroMovieSub_3F8 {
    u8 unk_000;
    u8 padding_001[3];
    u8 filler_004[0x6C];
};

struct IntroMovieSub_468 {
    u8 unk_000;
    u8 unk_001;
};

struct IntroMovieSub_494 {
    u8 filler_00[0x18];
    SysTask *unk_18;
};

struct IntroMovieSub_574 {
    u8 filler_00[0x14];
    SysTask *unk_14;
    u8 filler_18[0x34];
};

typedef struct IntroMovieOvyData {
    HeapID heapID;
    int unk_004;
    BOOL unk_008;
    BgConfig *bgConfig;
    u8 filler_010[0x13C];
    u32 unk_14C;
    struct IntroMovieSub_150 unk_150;
    struct IntroMovieSub_170 unk_170;
    struct IntroMovieSub_224 unk_224;
    struct IntroMovieSub_3F8 unk_3F8;
    struct IntroMovieSub_468 unk_468;
    u8 filler_46C[4];
    SysTask *unk_470;
    u8 filler_unk_474[0x14];
    SysTask *unk_488;
    u8 filler_48C[0x8];
    struct IntroMovieSub_494 unk_494[8];
    struct IntroMovieSub_574 unk_574[2];
    u8 filler_60C[0x10];
    SysTask *unk_61C;
    u8 filler_620[8];
    u8 unk_628;
    u8 unk_629;
    u8 unk_62A;
    u8 unk_62B;
} IntroMovieOvyData; // size: 0x62C

BOOL IntroMovie_Init(OVY_MANAGER *man, int *state);
BOOL IntroMovie_Exec(OVY_MANAGER *man, int *state);
BOOL IntroMovie_Exit(OVY_MANAGER *man, int *state);
void ov60_021E6E14(void);
void ov60_021E6E34(IntroMovieOvyData *data);
void ov60_021E6E40(IntroMovieOvyData *data);
void ov60_021E6EC0(IntroMovieOvyData *data);
void *ov60_021E7900(IntroMovieOvyData *data);
BOOL ov60_021E7984(IntroMovieOvyData *data, void *a1);
BOOL ov60_021E80E0(IntroMovieOvyData *data, void *a1);
BOOL ov60_021E8BF8(IntroMovieOvyData *data, void *a1);
BOOL ov60_021E9D08(IntroMovieOvyData *data, void *a1);
BOOL ov60_021EAA14(IntroMovieOvyData *data, void *a1);

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
