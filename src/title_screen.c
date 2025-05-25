#include "title_screen.h"

#include "global.h"

#include "constants/sndseq.h"
#include "constants/species.h"

#include "application/check_savedata.h"
#include "application/delete_savedata.h"
#include "demo/title/titledemo.naix"
#include "msgdata/msg.naix"
#include "msgdata/msg/msg_0719.h"

#include "brightness.h"
#include "camera.h"
#include "font.h"
#include "gf_3d_render.h"
#include "gf_gfx_loader.h"
#include "gf_gfx_planes.h"
#include "intro_movie.h"
#include "main.h"
#include "math_util.h"
#include "msgdata.h"
#include "overlay_62.h"
#include "overlay_manager.h"
#include "sound.h"
#include "sound_02004A44.h"
#include "system.h"
#include "text.h"
#include "unk_02005D10.h"
#include "unk_0200FA24.h"
#include "unk_02020B8C.h"
#include "unk_02026E30.h"

#ifdef HEARTGOLD
#define TITLE_SCREEN_SPECIES SPECIES_HO_OH
#else // SOULSILVER
#define TITLE_SCREEN_SPECIES SPECIES_LUGIA
#endif

#define CLEAR_SAVE_KEY_COMBO  (PAD_BUTTON_B | PAD_BUTTON_SELECT | PAD_KEY_UP)
#define MIC_TEST_KEY_COMBO    (PAD_BUTTON_X | PAD_BUTTON_Y | PAD_KEY_DOWN)
#define TITLE_SCREEN_DURATION 2340

enum TitleScreenMainState {
    TITLESCREEN_MAIN_WAIT_FADE,
    TITLESCREEN_MAIN_START_MUSIC,
    TITLESCREEN_MAIN_PLAY,
    TITLESCREEN_MAIN_PROCEED_FLASH,
    TITLESCREEN_MAIN_PROCEED_FLASH_2,
    TITLESCREEN_MAIN_PROCEED_NOFLASH,
    TITLESCREEN_MAIN_FADEOUT,
};

enum TitleScreenModelState {
    TITLESCREEN_MODEL_OFF,
    TITLESCREEN_MODEL_STOP,
    TITLESCREEN_MODEL_RUN,
};

enum TitleScreenModelSubState {
    TITLESCREEN_MODELSUB_STOP,
    TITLESCREEN_MODELSUB_WAIT_STOP,
    TITLESCREEN_MODELSUB_RUN,
};

enum TitleScreenAnimState {
    TITLESCREEN_ANIM_SETUP,
    TITLESCREEN_ANIM_RUN,
};

enum TitleScreenTopScreenGlowState {
    TITLESCREEN_GLOW_SETUP,
    TITLESCREEN_GLOW_IN,
    TITLESCREEN_GLOW_OUT,
    TITLESCREEN_GLOW_PAUSE,
};

struct CameraScript {
    VecFx32 pos;
    int duration;
};

static BOOL TitleScreen_Init(OVY_MANAGER *man, int *state);
static BOOL TitleScreen_Main(OVY_MANAGER *man, int *state);
static BOOL TitleScreen_Exit(OVY_MANAGER *man, int *state);
static void TitleScreen_VBlankCB(void *pVoid);
static void TitleScreen_SetGfxBanks(void);
static void TitleScreen_Create3DVramMan(TitleScreenOverlayData *data);
static void TitleScreen_Delete3DVramMan(TitleScreenOverlayData *data);
static void TitleScreen_Load3DObjects(TitleScreenAnimObject *animObj, int texFileId, int anim1Id, int anim2Id, int anim3Id, int anim4Id, HeapID heapID);
static void TitleScreen_Unload3DObjects(TitleScreenAnimObject *animObj);
static void TitleScreen_AdvanceAnimObjsFrame(NNSG3dAnmObj **ppAnmObj, fx32 a1);
static void TitleScreenAnimObjs_Run(TitleScreenAnimObject *animObj);
static void TitleScreen_InitBgs(TitleScreenOverlayData *data);
static void TitleScreen_ReleaseBgs(TitleScreenOverlayData *data);
static BOOL TitleScreenAnim_InitObjectsAndCamera(TitleScreenAnimData *animData, BgConfig *bgConfig, HeapID heapID);
static BOOL TitleScreenAnim_Run(TitleScreenAnimData *animData, BgConfig *bgConfig, HeapID heapID);
static BOOL TitleScreenAnim_UnloadAndRemoveTopScreenResources(TitleScreenAnimData *animData, BgConfig *bgConfig, HeapID heapID);
static void TitleScreenAnim_Load2dBgGfx(BgConfig *bgConfig, HeapID heapID, TitleScreenAnimData *animData);
static void TitleScreenAnim_RunTopScreenGlow(TitleScreenAnimData *animData);
static void TitleScreen_RemoveTouchToStartWindow(BgConfig *bgConfig, HeapID heapID, TitleScreenAnimData *animData);
static void TitleScreenAnim_SetCameraInitialPos(TitleScreenAnimData *animData);
static fx32 fx32_abs(fx32 x);
static void TitleScreenAnim_GetCameraNextPosition(TitleScreenAnimData *animData);
static void TitleScreenAnim_FadeInGameTitleLayer(TitleScreenAnimData *animData);

const OVY_MGR_TEMPLATE gApplication_TitleScreen = { TitleScreen_Init, TitleScreen_Main, TitleScreen_Exit, FS_OVERLAY_ID_NONE };

static BOOL TitleScreen_Init(OVY_MANAGER *man, int *state) {
    sub_0200FBF4(PM_LCD_TOP, RGB_WHITE);
    sub_0200FBF4(PM_LCD_BOTTOM, RGB_WHITE);
    Main_SetVBlankIntrCB(NULL, NULL);
    Main_SetHBlankIntrCB(NULL, NULL);
    GfGfx_DisableEngineAPlanes();
    GfGfx_DisableEngineBPlanes();
    GX_SetVisiblePlane(0);
    GXS_SetVisiblePlane(0);
    SetKeyRepeatTimers(4, 8);
    CreateHeap(HEAP_ID_3, HEAP_ID_TITLE_SCREEN, 0x50000);
    TitleScreenOverlayData *data = OverlayManager_CreateAndGetData(man, sizeof(TitleScreenOverlayData), HEAP_ID_TITLE_SCREEN);
    memset(data, 0, sizeof(TitleScreenOverlayData));
    data->heapID = HEAP_ID_TITLE_SCREEN;
    data->exitMode = TITLESCREEN_EXIT_UNSET;
    data->timer = 0;
    data->needMasterBrightnessNeutral = FALSE;
    data->animData.plttData = NULL;
    TitleScreen_SetGfxBanks();
    TitleScreen_InitBgs(data);
    TitleScreen_Create3DVramMan(data);
    Main_SetVBlankIntrCB(TitleScreen_VBlankCB, data);
    GfGfx_BothDispOn();
    data->animData.gameVersion = gGameVersion;
    return TRUE;
}

static BOOL TitleScreen_Main(OVY_MANAGER *man, int *state) {
    TitleScreenOverlayData *data = OverlayManager_GetData(man);
    switch (*state) {
    case TITLESCREEN_MAIN_WAIT_FADE:
        if (TitleScreenAnim_InitObjectsAndCamera(&data->animData, data->bgConfig, data->heapID) == TRUE) {
            data->animData.state = 0;
            data->initialDelay = 30;
            gSystem.unk70 = 0;
            *state = (int)TITLESCREEN_MAIN_START_MUSIC;
        }
        break;
    case TITLESCREEN_MAIN_START_MUSIC:
        sub_02004AD8(0);
        Sound_SetSceneAndPlayBGM(1, SEQ_GS_POKEMON_THEME, 1);
        *state = (int)TITLESCREEN_MAIN_PLAY;
        break;
    case TITLESCREEN_MAIN_PLAY:
        if (data->initialDelay != 0) {
            --data->initialDelay;
            data->animData.enableStartInstructionFlash = FALSE;
            TitleScreenAnim_Run(&data->animData, data->bgConfig, data->heapID);
        } else {
            data->animData.enableStartInstructionFlash = TRUE;
            TitleScreenAnim_Run(&data->animData, data->bgConfig, data->heapID);
            ++data->timer;
            if ((gSystem.newKeys & PAD_BUTTON_A) == PAD_BUTTON_A || (gSystem.newKeys & PAD_BUTTON_START) == PAD_BUTTON_START || gSystem.touchNew) {
                data->exitMode = TITLESCREEN_EXIT_MENU;
                GF_SndStartFadeOutBGM(0, 60);
                PlayCry(TITLE_SCREEN_SPECIES, 0);
                GF_SetVolumeBySeqNo(1, 48);
                BeginNormalPaletteFade(0, 0, 0, RGB_WHITE, 5, 1, HEAP_ID_TITLE_SCREEN);
                *state = (int)TITLESCREEN_MAIN_PROCEED_FLASH;
            } else if ((gSystem.heldKeys & CLEAR_SAVE_KEY_COMBO) == CLEAR_SAVE_KEY_COMBO) {
                data->exitMode = TITLESCREEN_EXIT_CLEARSAVE;
                BeginNormalPaletteFade(0, 0, 0, RGB_BLACK, 6, 1, data->heapID);
                *state = (int)TITLESCREEN_MAIN_FADEOUT;
            } else if ((gSystem.heldKeys & MIC_TEST_KEY_COMBO) == MIC_TEST_KEY_COMBO) {
                data->exitMode = TITLESCREEN_EXIT_MIC_TEST;
                BeginNormalPaletteFade(0, 0, 0, RGB_BLACK, 6, 1, data->heapID);
                *state = (int)TITLESCREEN_MAIN_FADEOUT;
            } else if (data->timer > TITLE_SCREEN_DURATION) {
                data->exitMode = TITLESCREEN_EXIT_TIMEOUT;
                gSystem.unk70 = TRUE;
                GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG3, GF_PLANE_TOGGLE_OFF);
                GF_SndStartFadeOutBGM(0, 60);
                *state = (int)TITLESCREEN_MAIN_PROCEED_NOFLASH;
            } else {
                TitleScreenAnim_GetCameraNextPosition(&data->animData);
                TitleScreenAnim_FadeInGameTitleLayer(&data->animData);
            }
        }
        break;
    case TITLESCREEN_MAIN_PROCEED_FLASH:
        TitleScreenAnim_FadeInGameTitleLayer(&data->animData);
        data->animData.enableStartInstructionFlash = FALSE;
        TitleScreenAnim_Run(&data->animData, data->bgConfig, data->heapID);
        if (IsPaletteFadeFinished()) {
            BeginNormalPaletteFade(0, 1, 1, RGB_WHITE, 12, 1, HEAP_ID_TITLE_SCREEN);
            *state = (int)TITLESCREEN_MAIN_PROCEED_FLASH_2;
        }
        if (GF_SndGetFadeTimer() == 0) {
            StopBGM(SEQ_GS_POKEMON_THEME, 0);
            BeginNormalPaletteFade(0, 0, 0, RGB_BLACK, 6, 1, data->heapID);
            *state = (int)TITLESCREEN_MAIN_FADEOUT;
        }
        break;
    case TITLESCREEN_MAIN_PROCEED_FLASH_2:
        TitleScreenAnim_FadeInGameTitleLayer(&data->animData);
        data->animData.enableStartInstructionFlash = FALSE;
        TitleScreenAnim_Run(&data->animData, data->bgConfig, data->heapID);
        if (GF_SndGetFadeTimer() == 0) {
            StopBGM(SEQ_GS_POKEMON_THEME, 0);
            BeginNormalPaletteFade(0, 0, 0, RGB_BLACK, 6, 1, data->heapID);
            *state = (int)TITLESCREEN_MAIN_FADEOUT;
        }
        break;
    case TITLESCREEN_MAIN_PROCEED_NOFLASH:
        TitleScreenAnim_FadeInGameTitleLayer(&data->animData);
        data->animData.enableStartInstructionFlash = FALSE;
        TitleScreenAnim_Run(&data->animData, data->bgConfig, data->heapID);
        if (GF_SndGetFadeTimer() == 0) {
            StopBGM(SEQ_GS_POKEMON_THEME, 0);
            BeginNormalPaletteFade(0, 0, 0, RGB_BLACK, 6, 1, data->heapID);
            *state = (int)TITLESCREEN_MAIN_FADEOUT;
        }
        break;
    case TITLESCREEN_MAIN_FADEOUT:
        TitleScreenAnim_FadeInGameTitleLayer(&data->animData);
        if (IsPaletteFadeFinished() == TRUE && TitleScreenAnim_UnloadAndRemoveTopScreenResources(&data->animData, data->bgConfig, data->heapID) == TRUE) {
            return TRUE;
        }
        break;
    }

    return FALSE;
}

static BOOL TitleScreen_Exit(OVY_MANAGER *man, int *state) {
    TitleScreenOverlayData *data = OverlayManager_GetData(man);
    HeapID heapID = data->heapID;
    int exitMode = data->exitMode;

    Main_SetVBlankIntrCB(NULL, NULL);
    TitleScreen_Delete3DVramMan(data);
    TitleScreen_ReleaseBgs(data);
    OverlayManager_FreeData(man);
    DestroyHeap(heapID);

    switch (exitMode) {
    default:
    case TITLESCREEN_EXIT_MENU:
        RegisterMainOverlay(FS_OVERLAY_ID_NONE, &gApplication_CheckSave);
        break;
    case TITLESCREEN_EXIT_CLEARSAVE:
        RegisterMainOverlay(FS_OVERLAY_ID_NONE, &gApplication_DeleteSave);
        break;
    case TITLESCREEN_EXIT_TIMEOUT:
        sub_02004AD8(0);
        RegisterMainOverlay(FS_OVERLAY_ID(intro_title), &gApplication_IntroMovie);
        break;
    case TITLESCREEN_EXIT_MIC_TEST:
        sub_02004AD8(0);
        RegisterMainOverlay(FS_OVERLAY_ID(OVY_62), &gApplication_MicTest);
        break;
    }

    return TRUE;
}

static void TitleScreen_VBlankCB(void *pVoid) {
    TitleScreenOverlayData *data = (TitleScreenOverlayData *)pVoid;

    if (data->needMasterBrightnessNeutral) {
        SetMasterBrightnessNeutral(PM_LCD_TOP);
        SetMasterBrightnessNeutral(PM_LCD_BOTTOM);
        data->needMasterBrightnessNeutral = FALSE;
    }

    if (data->animData.plttData != NULL) {
        PaletteData_PushTransparentBuffers(data->animData.plttData);
    }

    DoScheduledBgGpuUpdates(data->bgConfig);
}

static void TitleScreen_SetGfxBanks(void) {
    GraphicsBanks graphicsBanks = {
        GX_VRAM_BG_128_B,
        GX_VRAM_BGEXTPLTT_NONE,
        GX_VRAM_SUB_BG_128_C,
        GX_VRAM_SUB_BGEXTPLTT_NONE,
        GX_VRAM_OBJ_NONE,
        GX_VRAM_OBJEXTPLTT_NONE,
        GX_VRAM_SUB_OBJ_NONE,
        GX_VRAM_SUB_OBJEXTPLTT_NONE,
        GX_VRAM_TEX_0_A,
        GX_VRAM_TEXPLTT_0_G,
    };
    GfGfx_SetBanks(&graphicsBanks);
}

static void TitleScreen_Create3DVramMan(TitleScreenOverlayData *data) {
    data->_3dVramMan = GF_3DVramMan_Create(data->heapID, 0, 1, 0, 4, NULL);
    G2_SetBG0Priority(1);
}

static void TitleScreen_Delete3DVramMan(TitleScreenOverlayData *data) {
    GF_3DVramMan_Delete(data->_3dVramMan);
}

static void TitleScreen_Load3DObjects(TitleScreenAnimObject *animObj, int texFileId, int nsbcaId, int nsbta, int nsbtp, int nsbma, HeapID heapID) {
    for (int i = 0; i < 4; ++i) {
        animObj->_3dResObjsArc[i] = animObj->_3dAnmObjs[i] = NULL;
    }

    GF_ExpHeap_FndInitAllocator(&animObj->allocator, heapID, 4);
    void *pAnim;
    animObj->resFileHeader = AllocAndReadWholeNarcMemberByIdPair(NARC_demo_title_titledemo, texFileId, heapID);
    GF3dRender_InitObjFromHeader(&animObj->renderObj, &animObj->resModel, &animObj->resFileHeader);
    NNSG3dResTex *tex = NNS_G3dGetTex(animObj->resFileHeader);

    if (nsbcaId > 0) {
        animObj->_3dResObjsArc[0] = AllocAndReadWholeNarcMemberByIdPair(NARC_demo_title_titledemo, nsbcaId, heapID);
        pAnim = NNS_G3dGetAnmByIdx(animObj->_3dResObjsArc[0], 0);
        animObj->_3dAnmObjs[0] = NNS_G3dAllocAnmObj(&animObj->allocator, pAnim, animObj->resModel);
        NNS_G3dAnmObjInit(animObj->_3dAnmObjs[0], pAnim, animObj->resModel, tex);
        NNS_G3dRenderObjAddAnmObj(&animObj->renderObj, animObj->_3dAnmObjs[0]);
    }

    if (nsbta > 0) {
        animObj->_3dResObjsArc[1] = AllocAndReadWholeNarcMemberByIdPair(NARC_demo_title_titledemo, nsbta, heapID);
        pAnim = NNS_G3dGetAnmByIdx(animObj->_3dResObjsArc[1], 0);
        animObj->_3dAnmObjs[1] = NNS_G3dAllocAnmObj(&animObj->allocator, pAnim, animObj->resModel);
        NNS_G3dAnmObjInit(animObj->_3dAnmObjs[1], pAnim, animObj->resModel, tex);
        NNS_G3dRenderObjAddAnmObj(&animObj->renderObj, animObj->_3dAnmObjs[1]);
    }

    if (nsbtp > 0) {
        animObj->_3dResObjsArc[2] = AllocAndReadWholeNarcMemberByIdPair(NARC_demo_title_titledemo, nsbtp, heapID);
        pAnim = NNS_G3dGetAnmByIdx(animObj->_3dResObjsArc[2], 0);
        animObj->_3dAnmObjs[2] = NNS_G3dAllocAnmObj(&animObj->allocator, pAnim, animObj->resModel);
        NNS_G3dAnmObjInit(animObj->_3dAnmObjs[2], pAnim, animObj->resModel, tex);
        NNS_G3dRenderObjAddAnmObj(&animObj->renderObj, animObj->_3dAnmObjs[2]);
    }

    if (nsbma > 0) {
        animObj->_3dResObjsArc[3] = AllocAndReadWholeNarcMemberByIdPair(NARC_demo_title_titledemo, nsbma, heapID);
        pAnim = NNS_G3dGetAnmByIdx(animObj->_3dResObjsArc[3], 0);
        animObj->_3dAnmObjs[3] = NNS_G3dAllocAnmObj(&animObj->allocator, pAnim, animObj->resModel);
        NNS_G3dAnmObjInit(animObj->_3dAnmObjs[3], pAnim, animObj->resModel, tex);
        NNS_G3dRenderObjAddAnmObj(&animObj->renderObj, animObj->_3dAnmObjs[3]);
    }

    VecFx32 zero = { 0, 0, 0 };
    animObj->translation = (VecFx32) { 30 * FX32_ONE, 95 * FX32_ONE, 0 };
    animObj->scale = (VecFx32) { FX32_ONE, FX32_ONE, FX32_ONE };
    animObj->rotationVec = zero;
    animObj->subState = TITLESCREEN_MODELSUB_STOP;
}

static void TitleScreen_Unload3DObjects(TitleScreenAnimObject *animObj) {
    for (int i = 0; i < 4; ++i) {
        if (animObj->_3dAnmObjs[i] != NULL) {
            NNS_G3dFreeAnmObj(&animObj->allocator, animObj->_3dAnmObjs[i]);
            FreeToHeap(animObj->_3dResObjsArc[i]);
        }
    }
    FreeToHeap(animObj->resFileHeader);
}

static void TitleScreen_AdvanceAnimObjsFrame(NNSG3dAnmObj **ppAnmObj, fx32 frameBy) {
    if (frameBy == 0) {
        for (int i = 0; i < 4; ++i) {
            if (ppAnmObj[i] != NULL) {
                NNS_G3dAnmObjSetFrame(ppAnmObj[i], 0);
            }
        }
    } else {
        for (int i = 0; i < 4; ++i) {
            if (ppAnmObj[i] != NULL) {
                NNS_G3dAnmObjSetFrame(ppAnmObj[i], ppAnmObj[i]->frame + frameBy);
                if (ppAnmObj[i]->frame == NNS_G3dAnmObjGetNumFrame(ppAnmObj[i])) {
                    NNS_G3dAnmObjSetFrame(ppAnmObj[i], 0);
                }
            }
        }
    }
}

static void TitleScreenAnimObjs_Run(TitleScreenAnimObject *animObj) {
    MtxFx33 mtx = {
        .m = {
              { FX32_ONE, 0, 0 },
              { 0, FX32_ONE, 0 },
              { 0, 0, FX32_ONE },
              },
    };

    switch (animObj->state) {
    case TITLESCREEN_MODEL_OFF:
        break;
    case TITLESCREEN_MODEL_STOP:
        Thunk_G3X_Reset();
        RequestSwap3DBuffers(GX_SORTMODE_AUTO, GX_BUFFERMODE_W);
        animObj->state = TITLESCREEN_MODEL_OFF;
        break;
    case TITLESCREEN_MODEL_RUN:
        Thunk_G3X_Reset();
        Camera_PushLookAtToNNSGlb();
        sub_02020D2C(&mtx, &animObj->rotationVec);
        GF3dRender_DrawModel(&animObj->renderObj, &animObj->translation, &mtx, &animObj->scale);
        switch (animObj->subState) {
        case TITLESCREEN_MODELSUB_STOP:
            TitleScreen_AdvanceAnimObjsFrame(animObj->_3dAnmObjs, 0);
            break;
        case TITLESCREEN_MODELSUB_WAIT_STOP:
            if (animObj->_3dAnmObjs[0]->frame == 0) {
                animObj->subState = TITLESCREEN_MODELSUB_STOP;
                break;
            }
            // fallthrough
        case TITLESCREEN_MODELSUB_RUN:
            TitleScreen_AdvanceAnimObjsFrame(animObj->_3dAnmObjs, FX32_ONE);
            break;
        }
    }
}

static void TitleScreen_InitBgs(TitleScreenOverlayData *data) {
    data->bgConfig = BgConfig_Alloc(data->heapID);

    {
        GraphicsModes stack_data = { GX_DISPMODE_GRAPHICS, GX_BGMODE_0, GX_BGMODE_0, GX_BG0_AS_3D };
        SetBothScreensModesAndDisable(&stack_data);
    }
    {
        BgTemplate stack_data = { 0, 0, 0x800, 0, GF_BG_SCR_SIZE_256x256, GX_BG_COLORMODE_16, 18, 3, 0, 0, 0, 0, 0 };
        InitBgFromTemplate(data->bgConfig, GF_BG_LYR_SUB_1, &stack_data, 0);
    }
    {
        BgTemplate stack_data = { 0, 0, 0x800, 0, GF_BG_SCR_SIZE_256x256, GX_BG_COLORMODE_256, 16, 0, 0, 0, 0, 0, 0 };
        InitBgFromTemplate(data->bgConfig, GF_BG_LYR_SUB_2, &stack_data, 0);
    }
    {
        BgTemplate stack_data = { 0, 0, 0x800, 0, GF_BG_SCR_SIZE_256x256, GX_BG_COLORMODE_256, 20, 4, 0, 3, 0, 0, 0 };
        InitBgFromTemplate(data->bgConfig, GF_BG_LYR_SUB_3, &stack_data, 0);
    }
    {
        BgTemplate stack_data = { 0, 0, 0x800, 0, GF_BG_SCR_SIZE_256x256, GX_BG_COLORMODE_16, 7, 1, 0, 1, 0, 0, 0 };
        InitBgFromTemplate(data->bgConfig, GF_BG_LYR_MAIN_1, &stack_data, 0);
    }
    {
        BgTemplate stack_data = { 0, 0, 0x800, 0, GF_BG_SCR_SIZE_256x256, GX_BG_COLORMODE_16, 5, 4, 0, 3, 0, 0, 0 };
        InitBgFromTemplate(data->bgConfig, GF_BG_LYR_MAIN_2, &stack_data, 0);
    }
    {
        // TOUCH TO START
        BgTemplate stack_data = { 0, 0, 0x800, 0, GF_BG_SCR_SIZE_256x256, GX_BG_COLORMODE_16, 4, 0, 0, 0, 0, 0, 0 };
        InitBgFromTemplate(data->bgConfig, GF_BG_LYR_MAIN_3, &stack_data, 0);
    }
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG0, GF_PLANE_TOGGLE_OFF);
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG1, GF_PLANE_TOGGLE_OFF);
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG2, GF_PLANE_TOGGLE_OFF);
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG3, GF_PLANE_TOGGLE_OFF);
    GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG0, GF_PLANE_TOGGLE_OFF);
    GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG1, GF_PLANE_TOGGLE_OFF);
    GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG2, GF_PLANE_TOGGLE_OFF);
    GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG3, GF_PLANE_TOGGLE_OFF);
    BG_SetMaskColor(GF_BG_LYR_MAIN_0, RGB_BLACK);
    BG_SetMaskColor(GF_BG_LYR_SUB_0, RGB_BLACK);
}

static void TitleScreen_ReleaseBgs(TitleScreenOverlayData *data) {
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG0, GF_PLANE_TOGGLE_OFF);
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG1, GF_PLANE_TOGGLE_OFF);
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG2, GF_PLANE_TOGGLE_OFF);
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG3, GF_PLANE_TOGGLE_OFF);
    GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG0, GF_PLANE_TOGGLE_OFF);
    GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG1, GF_PLANE_TOGGLE_OFF);
    GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG2, GF_PLANE_TOGGLE_OFF);
    GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG3, GF_PLANE_TOGGLE_OFF);
    FreeBgTilemapBuffer(data->bgConfig, GF_BG_LYR_MAIN_3);
    FreeBgTilemapBuffer(data->bgConfig, GF_BG_LYR_SUB_1);
    FreeBgTilemapBuffer(data->bgConfig, GF_BG_LYR_SUB_2);
    FreeBgTilemapBuffer(data->bgConfig, GF_BG_LYR_MAIN_1);
    FreeBgTilemapBuffer(data->bgConfig, GF_BG_LYR_MAIN_2);
    FreeBgTilemapBuffer(data->bgConfig, GF_BG_LYR_SUB_3);
    FreeToHeap(data->bgConfig);
}

static const WindowTemplate sTouchToStartWindow = { GF_BG_LYR_MAIN_3, 0, 18, 32, 2, 2, 0x001 };

static BOOL TitleScreenAnim_InitObjectsAndCamera(TitleScreenAnimData *animData, BgConfig *bgConfig, HeapID heapID) {
    TitleScreenAnim_SetCameraInitialPos(animData);
    TitleScreenAnim_Load2dBgGfx(bgConfig, heapID, animData);
    if (animData->gameVersion == VERSION_HEARTGOLD) {
        TitleScreen_Load3DObjects(&animData->hooh_lugia, NARC_titledemo_titledemo_00000025_NSBMD, NARC_titledemo_titledemo_00000026_NSBCA, NARC_titledemo_titledemo_00000027_NSBTA, NARC_titledemo_titledemo_00000029_NSBTP, NARC_titledemo_titledemo_00000028_NSBMA, heapID);
        TitleScreen_Load3DObjects(&animData->sparkles, NARC_titledemo_titledemo_00000038_NSBMD, NARC_titledemo_titledemo_00000039_NSBCA, -1, NARC_titledemo_titledemo_00000040_NSBTP, -1, heapID);
    } else {
        TitleScreen_Load3DObjects(&animData->hooh_lugia, NARC_titledemo_titledemo_00000020_NSBMD, NARC_titledemo_titledemo_00000021_NSBCA, NARC_titledemo_titledemo_00000022_NSBTA, NARC_titledemo_titledemo_00000023_NSBTP, NARC_titledemo_titledemo_00000024_NSBMA, heapID);
        TitleScreen_Load3DObjects(&animData->sparkles, NARC_titledemo_titledemo_00000041_NSBMD, NARC_titledemo_titledemo_00000042_NSBCA, -1, NARC_titledemo_titledemo_00000043_NSBTP, -1, heapID);
    }
    G3X_AntiAlias(TRUE);
    G3X_AlphaBlend(TRUE);
    animData->cameraTarget.x = animData->cameraTargetStart.x;
    animData->cameraTarget.y = animData->cameraTargetStart.y;
    animData->cameraTarget.z = animData->cameraTargetStart.z;
    animData->cameraPos.x = animData->cameraPosStart.x;
    animData->cameraPos.y = animData->cameraPosStart.y;
    animData->cameraPos.z = animData->cameraPosStart.z;
    animData->hooh_lugia.camera = Camera_New(heapID);
    Camera_Init_FromTargetAndPos(&animData->cameraTarget, &animData->cameraPos, 0xB60, 0, FALSE, animData->hooh_lugia.camera);
    Camera_SetPerspectiveClippingPlane(0, FX32_CONST(0.5), animData->hooh_lugia.camera);
    Camera_ApplyPerspectiveType(0, animData->hooh_lugia.camera);
    Camera_SetStaticPtr(animData->hooh_lugia.camera);
    NNS_G3dGlbLightVector(GX_LIGHTID_0, animData->light0Vec.x, animData->light0Vec.y, animData->light0Vec.z);
    NNS_G3dGlbLightColor(GX_LIGHTID_0, RGB_WHITE);
    NNS_G3dGlbLightVector(GX_LIGHTID_1, animData->light1Vec.x, animData->light1Vec.y, animData->light1Vec.z);
    NNS_G3dGlbLightColor(GX_LIGHTID_1, RGB_WHITE);
    G3X_AntiAlias(TRUE);
    gSystem.screensFlipped = TRUE;
    GfGfx_SwapDisplay();
    animData->hooh_lugia.state = TITLESCREEN_MODEL_RUN;
    animData->sparkles.state = TITLESCREEN_MODEL_RUN;
    animData->gameTitleDelayTimer = 0;
    animData->gameTitleFadeInTimer = 0;
    animData->plttData = PaletteData_Init(HEAP_ID_TITLE_SCREEN);
    PaletteData_AllocBuffers(animData->plttData, PLTTBUF_SUB_BG, 0x200, HEAP_ID_TITLE_SCREEN);
    PaletteData_LoadPaletteSlotFromHardware(animData->plttData, PLTTBUF_SUB_BG, 0, 0x200);
    animData->glowState = 0;
    return TRUE;
}

static BOOL TitleScreenAnim_Run(TitleScreenAnimData *animData, BgConfig *bgConfig, HeapID heapID) {
    BOOL ret = FALSE;

    switch (animData->state) {
    case TITLESCREEN_ANIM_SETUP:
        Camera_SetLookAtCamTarget(&animData->cameraTargetEnd, animData->hooh_lugia.camera);
        Camera_SetLookAtCamPos(&animData->cameraPosEnd, animData->hooh_lugia.camera);
        GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG0, GF_PLANE_TOGGLE_ON);
        GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG2, GF_PLANE_TOGGLE_ON);
        GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG3, GF_PLANE_TOGGLE_ON);
        GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG2, GF_PLANE_TOGGLE_ON);
        GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG1, GF_PLANE_TOGGLE_ON);
        GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG1, GF_PLANE_TOGGLE_ON);
        SetMasterBrightnessNeutral(0);
        SetMasterBrightnessNeutral(1);
        SetBlendBrightness(0, (GXBlendPlaneMask)(GX_BLEND_PLANEMASK_BG1 | GX_BLEND_PLANEMASK_BG2), SCREEN_MASK_MAIN);
        SetBlendBrightness(0, (GXBlendPlaneMask)(GX_BLEND_PLANEMASK_BG0 | GX_BLEND_PLANEMASK_BG1 | GX_BLEND_PLANEMASK_BG2), SCREEN_MASK_SUB);
        G2S_SetBlendAlpha(4, 0x39, 0, 0x1F);
        animData->hooh_lugia.subState = TITLESCREEN_MODELSUB_RUN;
        animData->sparkles.subState = TITLESCREEN_MODELSUB_RUN;
        NNS_G3dGlbLightColor(GX_LIGHTID_1, RGB_WHITE);
        animData->startInstructionFlashTimer = 0;
        animData->state = TITLESCREEN_ANIM_RUN;
        break;
    case TITLESCREEN_ANIM_RUN:
        if (animData->enableStartInstructionFlash == TRUE) {
            if (animData->startInstructionFlashTimer == 0) {
                GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG3, GF_PLANE_TOGGLE_ON);
            } else if (animData->startInstructionFlashTimer == 30) {
                GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG3, GF_PLANE_TOGGLE_OFF);
            }
        } else {
            GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG3, GF_PLANE_TOGGLE_OFF);
        }
        ++animData->startInstructionFlashTimer;
        if (animData->startInstructionFlashTimer >= 45) {
            animData->startInstructionFlashTimer = 0;
        }
        ret = TRUE;
        break;
    }
    TitleScreenAnimObjs_Run(&animData->hooh_lugia);
    TitleScreenAnimObjs_Run(&animData->sparkles);
    RequestSwap3DBuffers(GX_SORTMODE_AUTO, GX_BUFFERMODE_W);
    TitleScreenAnim_RunTopScreenGlow(animData);
    return ret;
}

static BOOL TitleScreenAnim_UnloadAndRemoveTopScreenResources(TitleScreenAnimData *animData, BgConfig *bgConfig, HeapID heapID) {
    PaletteData_FreeBuffers(animData->plttData, PLTTBUF_SUB_BG);
    PaletteData_Free(animData->plttData);
    animData->plttData = NULL;
    Camera_Delete(animData->hooh_lugia.camera);
    TitleScreen_Unload3DObjects(&animData->hooh_lugia);
    TitleScreen_Unload3DObjects(&animData->sparkles);
    TitleScreen_RemoveTouchToStartWindow(bgConfig, heapID, animData);
    G2_BlendNone();
    G3X_EdgeMarking(FALSE);
    gSystem.screensFlipped = FALSE;
    GfGfx_SwapDisplay();
    return TRUE;
}

static void TitleScreenAnim_Load2dBgGfx(BgConfig *bgConfig, HeapID heapID, TitleScreenAnimData *animData) {
    s32 res1, res2;

    if (animData->gameVersion == VERSION_HEARTGOLD) {
        GfGfxLoader_LoadCharData(NARC_demo_title_titledemo, NARC_titledemo_titledemo_00000034_NCGR, bgConfig, GF_BG_LYR_SUB_3, 0, 0, FALSE, heapID);
        GfGfxLoader_LoadScrnData(NARC_demo_title_titledemo, NARC_titledemo_titledemo_00000035_NSCR, bgConfig, GF_BG_LYR_SUB_3, 0, 0, FALSE, heapID);
    } else {
        GfGfxLoader_LoadCharData(NARC_demo_title_titledemo, NARC_titledemo_titledemo_00000036_NCGR, bgConfig, GF_BG_LYR_SUB_3, 0, 0, FALSE, heapID);
        GfGfxLoader_LoadScrnData(NARC_demo_title_titledemo, NARC_titledemo_titledemo_00000037_NSCR, bgConfig, GF_BG_LYR_SUB_3, 0, 0, FALSE, heapID);
    }
    BG_ClearCharDataRange(GF_BG_LYR_MAIN_3, 0x20, 0, heapID);
    BgClearTilemapBufferAndCommit(bgConfig, 3);

    if (animData->gameVersion == VERSION_HEARTGOLD) {
        res1 = NARC_titledemo_titledemo_00000004_NCLR;
        res2 = NARC_titledemo_titledemo_00000013_NCLR;
    } else {
        res1 = NARC_titledemo_titledemo_00000002_NCLR;
        res2 = NARC_titledemo_titledemo_00000014_NCLR;
    }
    GfGfxLoader_GXLoadPal(NARC_demo_title_titledemo, res1, GF_PAL_LOCATION_SUB_BG, GF_PAL_SLOT_0_OFFSET, 0, heapID);
    GfGfxLoader_GXLoadPal(NARC_demo_title_titledemo, res2, GF_PAL_LOCATION_MAIN_BG, GF_PAL_SLOT_0_OFFSET, 0, heapID);

    if (animData->gameVersion == VERSION_HEARTGOLD) {
        res1 = NARC_titledemo_titledemo_00000003_NCGR;
        res2 = NARC_titledemo_titledemo_00000004_NCLR;
    } else {
        res1 = NARC_titledemo_titledemo_00000001_NCGR;
        res2 = NARC_titledemo_titledemo_00000002_NCLR;
    }
    GfGfxLoader_LoadCharData(NARC_demo_title_titledemo, res1, bgConfig, GF_BG_LYR_SUB_2, 0, 0, FALSE, heapID);
    GfGfxLoader_GXLoadPal(NARC_demo_title_titledemo, res2, GF_PAL_LOCATION_SUB_BGEXT, (enum GFPalSlotOffset)0x4000, 0, heapID);
    GfGfxLoader_LoadScrnData(NARC_demo_title_titledemo, NARC_titledemo_titledemo_00000000_NSCR, bgConfig, GF_BG_LYR_SUB_2, 0, 0, FALSE, heapID);

    GfGfxLoader_LoadCharData(NARC_demo_title_titledemo, NARC_titledemo_titledemo_00000015_NCGR, bgConfig, GF_BG_LYR_SUB_1, 0, 0, FALSE, heapID);
    GfGfxLoader_LoadScrnData(NARC_demo_title_titledemo, NARC_titledemo_titledemo_00000017_NSCR, bgConfig, GF_BG_LYR_SUB_1, 0, 0, FALSE, heapID);

    BG_SetMaskColor(GF_BG_LYR_MAIN_0, RGB_BLACK);
    BG_SetMaskColor(GF_BG_LYR_SUB_1, RGB_BLACK);
    BG_ClearCharDataRange(GF_BG_LYR_MAIN_3, 0x20, 0, heapID);

    MsgData *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0719_bin, heapID);
    String *string = String_New(64, heapID);
    AddWindow(bgConfig, &animData->window, &sTouchToStartWindow);
    FillWindowPixelRect(&animData->window, 0, 0, 0, 0x100, 0x10);
    ReadMsgDataIntoString(msgData, msg_0719_00000, string);
    FontID_String_GetWidth(0, string, 0);
    if (animData->gameVersion == VERSION_HEARTGOLD) {
        AddTextPrinterParameterizedWithColorAndSpacing(&animData->window, 0, string, 0, 0, TEXT_SPEED_INSTANT, MAKE_TEXT_COLOR(1, 1, 0), 1, 0, NULL);
    } else {
        AddTextPrinterParameterizedWithColorAndSpacing(&animData->window, 0, string, 0, 0, TEXT_SPEED_INSTANT, MAKE_TEXT_COLOR(2, 2, 0), 1, 0, NULL);
    }
    String_Delete(string);
    DestroyMsgData(msgData);

    u16 color1 = RGB(27, 8, 0);  // HeartGold
    u16 color2 = RGB(0, 28, 31); // SoulSilver
    BG_LoadPlttData(3, &color1, sizeof(u16), 0x42);
    BG_LoadPlttData(3, &color2, sizeof(u16), 0x44);
}

static void TitleScreenAnim_RunTopScreenGlow(TitleScreenAnimData *animData) {
    switch (animData->glowState) {
    case TITLESCREEN_GLOW_SETUP:
        animData->glowState = TITLESCREEN_GLOW_IN;
        animData->glowTimer = 0;
        animData->glowFadeStep = 0;
        break;
    case TITLESCREEN_GLOW_IN:
        ++animData->glowFadeStep;
        if (animData->glowFadeStep > 60) {
            animData->glowTimer = 0;
            animData->glowState = TITLESCREEN_GLOW_OUT;
        }
        break;
    case TITLESCREEN_GLOW_OUT:
        --animData->glowFadeStep;
        if (animData->glowFadeStep == 0) {
            animData->glowState = TITLESCREEN_GLOW_PAUSE;
            animData->glowTimer = 0;
        }
        break;
    case TITLESCREEN_GLOW_PAUSE:
        ++animData->glowTimer;
        if (animData->glowTimer > 20) {
            animData->glowState = TITLESCREEN_GLOW_SETUP;
            animData->glowTimer = 0;
        }
        break;
    }
    PaletteData_FadePalettesTowardsColorStep(animData->plttData, 0x0002, 0xFF00, 160, animData->glowFadeStep, RGB(12, 12, 12));
}

static void TitleScreen_RemoveTouchToStartWindow(BgConfig *bgConfig, HeapID heapID, TitleScreenAnimData *animData) {
    RemoveWindow(&animData->window);
}

static void TitleScreenAnim_SetCameraInitialPos(TitleScreenAnimData *animData) {
    if (animData->gameVersion == VERSION_HEARTGOLD) {
        SetVec(animData->cameraPosStart, FX32_CONST(0), FX32_CONST(65), FX32_CONST(72));
        SetVec(animData->cameraPosEnd, FX32_CONST(625), FX32_CONST(152), FX32_CONST(256));
        SetVec(animData->cameraTargetStart, FX32_CONST(0), FX32_CONST(90), FX32_CONST(0));
        SetVec(animData->cameraTargetEnd, FX32_CONST(-2), FX32_CONST(124), FX32_CONST(-38));
        SetVec(animData->light0Vec, FX16_CONST(0), FX16_CONST(0.635498), FX16_CONST(0));
        SetVec(animData->light1Vec, FX16_CONST(0), FX16_CONST(0.476807), FX16_CONST(0));
        animData->cameraSpeed = FX32_CONST(3);
    } else {
        SetVec(animData->cameraPosStart, FX32_CONST(0), FX32_CONST(65), FX32_CONST(72));
        SetVec(animData->cameraPosEnd, FX32_CONST(420), FX32_CONST(87), FX32_CONST(331));
        SetVec(animData->cameraTargetStart, FX32_CONST(0), FX32_CONST(90), FX32_CONST(0));
        SetVec(animData->cameraTargetEnd, FX32_CONST(-2), FX32_CONST(124), FX32_CONST(-38));
        SetVec(animData->light0Vec, FX16_CONST(0), FX16_CONST(0.635498), FX16_CONST(0));
        SetVec(animData->light1Vec, FX16_CONST(0), FX16_CONST(0.476807), FX16_CONST(0));
        animData->cameraSpeed = FX32_CONST(3);
    }

    {
        VecFx32 light0vec;
        VecFx32 light0vecNorm;

        SetVec(light0vec, FX32_CONST(0), FX32_CONST(0.635498), FX32_CONST(0));
        VEC_Normalize(&light0vec, &light0vecNorm);
        animData->light0Vec.x = light0vecNorm.x;
        animData->light0Vec.y = light0vecNorm.y;
        animData->light0Vec.z = light0vecNorm.z;
    }
}

static const struct CameraScript sCameraScript_HG[5] = {
    {
     .pos = {
            .x = FX32_CONST(180),
            .y = FX32_CONST(177),
            .z = FX32_CONST(301),
        },
     .duration = 10,
     },
    {
     .pos = {
            .x = FX32_CONST(335),
            .y = FX32_CONST(-293),
            .z = FX32_CONST(296),
        },
     .duration = 5,
     },
    {
     .pos = {
            .x = FX32_CONST(180),
            .y = FX32_CONST(177),
            .z = FX32_CONST(301),
        },
     .duration = 5,
     },
    {
     .pos = {
            .x = FX32_CONST(625),
            .y = FX32_CONST(152),
            .z = FX32_CONST(256),
        },
     .duration = 10,
     },
    {
     .pos = {
            .x = FX32_CONST(0),
            .y = FX32_CONST(0),
            .z = FX32_CONST(0),
        },
     .duration = 0,
     },
};

static const struct CameraScript sCameraScript_SS[5] = {
    {
     .pos = {
            .x = FX32_CONST(105),
            .y = FX32_CONST(162),
            .z = FX32_CONST(291),
        },
     .duration = 10,
     },
    {
     .pos = {
            .x = FX32_CONST(395),
            .y = FX32_CONST(432),
            .z = FX32_CONST(191),
        },
     .duration = 5,
     },
    {
     .pos = {
            .x = FX32_CONST(105),
            .y = FX32_CONST(162),
            .z = FX32_CONST(291),
        },
     .duration = 5,
     },
    {
     .pos = {
            .x = FX32_CONST(420),
            .y = FX32_CONST(87),
            .z = FX32_CONST(331),
        },
     .duration = 10,
     },
    {
     .pos = {
            .x = FX32_CONST(0),
            .y = FX32_CONST(0),
            .z = FX32_CONST(0),
        },
     .duration = 0,
     },
};

static fx32 fx32_abs(fx32 x) {
    return x < 0 ? -x : x;
}

#if 0
// Maybe originally intended, but never used
#define CAMERA_SPEED (animData->cameraSpeed)
#else
#define CAMERA_SPEED (5 * FX32_ONE)
#endif

static void TitleScreenAnim_GetCameraNextPosition(TitleScreenAnimData *animData) {
    const struct CameraScript *cameraScript = animData->gameVersion == VERSION_HEARTGOLD ? sCameraScript_HG : sCameraScript_SS;
    ++animData->cameraSceneTimer;
    if (animData->cameraSceneTimer > cameraScript[animData->cameraScene].duration * 30) {
        VecFx32 pos;
        VEC_Subtract(&cameraScript[animData->cameraScene].pos, &animData->cameraPosEnd, &pos);
        if (pos.x > FX32_ONE) {
            animData->cameraPosEnd.x += CAMERA_SPEED;
        }
        if (pos.x < -FX32_ONE) {
            animData->cameraPosEnd.x -= CAMERA_SPEED;
        }
        if (pos.y > FX32_ONE) {
            animData->cameraPosEnd.y += CAMERA_SPEED;
        }
        if (pos.y < -FX32_ONE) {
            animData->cameraPosEnd.y -= CAMERA_SPEED;
        }
        if (pos.z > FX32_ONE) {
            animData->cameraPosEnd.z += CAMERA_SPEED;
        }
        if (pos.z < -FX32_ONE) {
            animData->cameraPosEnd.z -= CAMERA_SPEED;
        }
        Camera_SetLookAtCamPos(&animData->cameraPosEnd, animData->hooh_lugia.camera);
        if (fx32_abs(pos.x) <= FX32_ONE && fx32_abs(pos.y) <= FX32_ONE && fx32_abs(pos.z) <= FX32_ONE) {
            animData->cameraSceneTimer = 0;
            ++animData->cameraScene;
            if (cameraScript[animData->cameraScene].pos.x == 0) {
                animData->cameraScene = 0;
            }
        }
    }
}

static void TitleScreenAnim_FadeInGameTitleLayer(TitleScreenAnimData *animData) {
    ++animData->gameTitleDelayTimer;
    if (animData->gameTitleDelayTimer > 3) {
        G2S_SetBG2Offset(0, animData->gameTitleFadeInTimer / 2);
        ++animData->gameTitleFadeInTimer;
        if (animData->gameTitleFadeInTimer > 31) {
            animData->gameTitleFadeInTimer = 31;
        }
        G2S_SetBlendAlpha(4, 0x39, animData->gameTitleFadeInTimer, 31 - animData->gameTitleFadeInTimer);
    }
}
