#include "intro_movie.h"

#include "global.h"

#include "constants/sndseq.h"

#include "bg_window.h"
#include "brightness.h"
#include "gf_gfx_planes.h"
#include "intro_movie_internal.h"
#include "main.h"
#include "math_util.h"
#include "obj_char_transfer.h"
#include "obj_pltt_transfer.h"
#include "sound_02004A44.h"
#include "sprite.h"
#include "sys_task_api.h"
#include "system.h"
#include "title_screen.h"
#include "unk_0200B150.h"
#include "unk_0200FA24.h"

enum IntroMovieOverlayState {
    INTRO_MOVIE_INIT,
    INTRO_MOVIE_RUN,
    INTRO_MOVIE_DONE
};

static BOOL IntroMovie_Init(OverlayManager *man, int *state);
static BOOL IntroMovie_Main(OverlayManager *man, int *state);
static BOOL IntroMovie_Exit(OverlayManager *man, int *state);
static void IntroMovie_SetGraphicsBanks(void);
static void IntroMovie_HandleSpriteUpdates(IntroMovieOverlayData *data);
static void IntroMovie_InitSpriteGraphicsHW(IntroMovieOverlayData *data);
static void IntroMovie_TeardownSpritesManager(IntroMovieOverlayData *data);

const OverlayManagerTemplate gApplication_IntroMovie = { IntroMovie_Init, IntroMovie_Main, IntroMovie_Exit, FS_OVERLAY_ID_NONE };

static BOOL (*sIntroMovieSceneFuncs[])(IntroMovieOverlayData *data, void *pVoid) = {
    IntroMovie_Scene1,
    IntroMovie_Scene2,
    IntroMovie_Scene3,
    IntroMovie_Scene4,
    IntroMovie_Scene5,
};

enum HeapID _deadstrip_00(int idx);
enum HeapID _deadstrip_00(int idx) {
    static const enum HeapID sDeadstrippedRodata[2] = { HEAP_ID_INTRO_MOVIE, HEAP_ID_INTRO_MOVIE };
    return sDeadstrippedRodata[idx];
}

static BOOL IntroMovie_Init(OverlayManager *man, int *state) {
    ScreenBrightnessData_InitAll();
    sub_0200FBF4(PM_LCD_TOP, RGB_BLACK);
    sub_0200FBF4(PM_LCD_BOTTOM, RGB_BLACK);
    Main_SetVBlankIntrCB(NULL, NULL);
    Main_SetHBlankIntrCB(NULL, NULL);
    GfGfx_DisableEngineAPlanes();
    GfGfx_DisableEngineBPlanes();
    SetKeyRepeatTimers(4, 8);
    Heap_Create(HEAP_ID_3, HEAP_ID_INTRO_MOVIE, 0x68000);

    IntroMovieOverlayData *data = OverlayManager_CreateAndGetData(man, sizeof(IntroMovieOverlayData), HEAP_ID_INTRO_MOVIE);
    memset(data, 0, sizeof(IntroMovieOverlayData));
    data->heapID = HEAP_ID_INTRO_MOVIE;
    data->introSkipped = FALSE;
    data->skipAllowed = FALSE;
    gSystem.screensFlipped = TRUE;
    GfGfx_SwapDisplay();
    data->savedLCRngSeed = GetLCRNGSeed();
    SetLCRNGSeed(0);
    data->bgConfig = BgConfig_Alloc(data->heapID);
    IntroMovie_SetGraphicsBanks();
    IntroMovie_InitSpriteGraphicsHW(data);
    return TRUE;
}

static BOOL IntroMovie_Main(OverlayManager *man, int *state) {
    IntroMovieOverlayData *data = OverlayManager_GetData(man);
    if (data->skipAllowed && ((gSystem.newKeys & PAD_BUTTON_A) || (gSystem.newKeys & PAD_BUTTON_START) || gSystem.touchNew)) {
        data->introSkipped = TRUE;
        gSystem.unk70 = FALSE;
        sub_0200FBF4(PM_LCD_TOP, RGB_WHITE);
        sub_0200FBF4(PM_LCD_BOTTOM, RGB_WHITE);
    }

    switch (*state) {
    case INTRO_MOVIE_INIT:
        data->scene1Data.skipAllowedPtr = &data->skipAllowed;
        Sound_SetSceneAndPlayBGM(2, SEQ_GS_TITLE, 1);
        ++(*state);
        break;
    case INTRO_MOVIE_RUN:
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
    case INTRO_MOVIE_DONE:
        return TRUE;
    default:
        GF_ASSERT(FALSE);
    }

    if (data->introSkipped) {
        return TRUE;
    }

    IntroMovie_HandleSpriteUpdates(data);
    ++data->totalFrameCount;
    return FALSE;
}

static BOOL IntroMovie_Exit(OverlayManager *man, int *state) {
    int i;

    IntroMovieOverlayData *data = OverlayManager_GetData(man);
    sub_0200FBF4(PM_LCD_TOP, RGB_WHITE);
    sub_0200FBF4(PM_LCD_BOTTOM, RGB_WHITE);
    IntroMovie_TeardownSpritesManager(data);
    Heap_Free(data->bgConfig);
    if (data->bgAnimCnt.blend[0].task != NULL) {
        SysTask_Destroy(data->bgAnimCnt.blend[0].task);
        data->bgAnimCnt.blend[0].task = NULL;
    }
    if (data->bgAnimCnt.blend[1].task != NULL) {
        SysTask_Destroy(data->bgAnimCnt.blend[1].task);
        data->bgAnimCnt.blend[1].task = NULL;
    }
    for (i = 0; i < 8; ++i) {
        if (data->bgAnimCnt.scroll[i].task != NULL) {
            SysTask_Destroy(data->bgAnimCnt.scroll[i].task);
            data->bgAnimCnt.scroll[i].task = NULL;
        }
    }
    for (i = 0; i < 2; ++i) {
        if (data->bgAnimCnt.window[i].task != NULL) {
            SysTask_Destroy(data->bgAnimCnt.window[i].task);
            data->bgAnimCnt.window[i].task = NULL;
        }
    }
    if (data->circleWipeEffect.task != NULL) {
        SysTask_Destroy(data->circleWipeEffect.task);
        data->circleWipeEffect.task = NULL;
    }
    Main_SetVBlankIntrCB(NULL, NULL);
    Main_SetHBlankIntrCB(NULL, NULL);
    G2_BlendNone();
    G2S_BlendNone();
    GX_SetVisibleWnd(GX_WNDMASK_NONE);
    GXS_SetVisibleWnd(0);
    sub_0200FB70();
    SetLCRNGSeed(data->savedLCRngSeed);
    OverlayManager_FreeData(man);
    Heap_Destroy(HEAP_ID_INTRO_MOVIE);
    RegisterMainOverlay(FS_OVERLAY_ID(intro_title), &gApplication_TitleScreen);
    return TRUE;
}

static void IntroMovie_SetGraphicsBanks(void) {
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

static void IntroMovie_HandleSpriteUpdates(IntroMovieOverlayData *data) {
    SpriteList_RenderAndAnimateSprites(data->spriteList);
}

static void IntroMovie_InitSpriteGraphicsHW(IntroMovieOverlayData *data) {
    GX_SetOBJVRamModeChar(GX_OBJVRAMMODE_CHAR_1D_32K);
    GXS_SetOBJVRamModeChar(GX_OBJVRAMMODE_CHAR_1D_32K);

    ObjCharTransferTemplate template = { 10, 0, 0, HEAP_ID_INTRO_MOVIE };
    ObjCharTransfer_Init(&template);
    ObjPlttTransfer_Init(10, HEAP_ID_INTRO_MOVIE);
    ObjCharTransfer_ClearBuffers();
    ObjPlttTransfer_Reset();
    NNS_G2dInitOamManagerModule();
    OamManager_Create(0, 0x80, 0, 0x20, 0, 0x80, 0, 0x20, HEAP_ID_INTRO_MOVIE);
    data->spriteList = G2dRenderer_Init(20, &data->spriteRenderer, HEAP_ID_INTRO_MOVIE);
}

static void IntroMovie_TeardownSpritesManager(IntroMovieOverlayData *data) {
    SpriteList_Delete(data->spriteList);
    OamManager_Free();
    ObjCharTransfer_Destroy();
    ObjPlttTransfer_Destroy();
}
