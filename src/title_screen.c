#include "global.h"
#include "title_screen.h"
#include "overlay_manager.h"
#include "unk_0200FA24.h"
#include "main.h"
#include "system.h"
#include "gf_gfx_planes.h"
#include "sound_02004A44.h"
#include "unk_02005D10.h"
#include "sound.h"
#include "unk_020921A4.h"
#include "unk_02091CDC.h"
#include "unk_0201F4C4.h"
#include "unk_02026E30.h"
#include "camera.h"
#include "unk_02020B8C.h"
#include "brightness.h"
#include "gf_gfx_loader.h"
#include "font.h"
#include "msgdata.h"
#include "overlay_62.h"
#include "text.h"
#include "math_util.h"
#include "constants/species.h"
#include "constants/sndseq.h"
#include "msgdata/msg.naix"
#include "msgdata/msg/msg_0719.h"

#ifdef HEARTGOLD
#define TITLE_SCREEN_SPECIES SPECIES_HO_OH
#else //SOULSILVER
#define TITLE_SCREEN_SPECIES SPECIES_LUGIA
#endif

#define CLEAR_SAVE_KEY_COMBO  (PAD_BUTTON_B | PAD_BUTTON_SELECT | PAD_KEY_UP)
#define MIC_TEST_KEY_COMBO    (PAD_BUTTON_X | PAD_BUTTON_Y | PAD_KEY_DOWN)
#define TITLE_SCREEN_DURATION 2340

enum TitleScreenMainState {
    TITLESCREEN_MAIN_WAIT_FADE,
    START_MUSIC,
    TITLESCREEN_MAIN_PLAY,
    TITLESCREEN_MAIN_PROCEED_FLASH,
    TITLESCREEN_MAIN_PROCEED_FLASH_2,
    TITLESCREEN_MAIN_PROCEED_NOFLASH,
    TITLESCREEN_MAIN_FADEOUT,
};

struct UnkTitleScreenStruct_021EAF90 {
    VecFx32 unk_00;
    int unk_0C;
};

static BOOL TitleScreen_Init(OVY_MANAGER *man, int *state);
static BOOL TitleScreen_Exec(OVY_MANAGER *man, int *state);
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
static void TitleScreen_DeinitBgs(TitleScreenOverlayData *data);
static BOOL TitleScreenAnim_InitObjectsAndCamera(TitleScreenAnimData *animData, BgConfig *bgConfig, HeapID heapID);
static BOOL ov60_021E641C(TitleScreenAnimData *animData, BgConfig *bgConfig, HeapID heapID);
static BOOL ov60_021E6544(TitleScreenAnimData *animData, BgConfig *bgConfig, HeapID heapID);
static void ov60_021E65B4(BgConfig *bgConfig, HeapID heapID, TitleScreenAnimData *animData);
static void ov60_021E67E8(TitleScreenAnimData *animData);
static void ov60_021E68A0(BgConfig *bgConfig, HeapID heapID, TitleScreenAnimData *animData);
static void ov60_021E68B0(TitleScreenAnimData *animData);
static fx32 ov60_021E69CC(fx32 x);
static void ov60_021E69D4(TitleScreenAnimData *animData);
static void ov60_021E6B08(TitleScreenAnimData *animData);

extern const OVY_MGR_TEMPLATE ov60_021EB030;

const OVY_MGR_TEMPLATE gApplication_TitleScreen = {
    TitleScreen_Init,
    TitleScreen_Exec,
    TitleScreen_Exit,
    (FSOverlayID)-1
};

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
    CreateHeap(HEAP_ID_3, HEAP_ID_30, 0x50000);
    TitleScreenOverlayData *data = OverlayManager_CreateAndGetData(man, sizeof(TitleScreenOverlayData), HEAP_ID_30);
    memset(data, 0, sizeof(TitleScreenOverlayData));
    data->heapID = HEAP_ID_30;
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

static BOOL TitleScreen_Exec(OVY_MANAGER *man, int *state) {
    TitleScreenOverlayData *data = OverlayManager_GetData(man);
    switch (*state) {
    case TITLESCREEN_MAIN_WAIT_FADE:
        if (TitleScreenAnim_InitObjectsAndCamera(&data->animData, data->bgConfig, data->heapID) == TRUE) {
            data->animData.unk_000 = 0;
            data->initialDelay = 30;
            gSystem.unk70 = 0;
            *state = (int)START_MUSIC;
        }
        break;
    case START_MUSIC:
        sub_02004AD8(0);
        sub_02004EC4(1, SEQ_GS_POKEMON_THEME, 1);
        *state = (int)TITLESCREEN_MAIN_PLAY;
        break;
    case TITLESCREEN_MAIN_PLAY:
        if (data->initialDelay != 0) {
            --data->initialDelay;
            data->animData.unk_1A8 = FALSE;
            ov60_021E641C(&data->animData, data->bgConfig, data->heapID);
        } else {
            data->animData.unk_1A8 = TRUE;
            ov60_021E641C(&data->animData, data->bgConfig, data->heapID);
            ++data->timer;
            if ((gSystem.newKeys & PAD_BUTTON_A) == PAD_BUTTON_A || (gSystem.newKeys & PAD_BUTTON_START) == PAD_BUTTON_START || gSystem.touchNew) {
                data->exitMode = TITLESCREEN_EXIT_MENU;
                GF_SndStartFadeOutBGM(0, 60);
                PlayCry(TITLE_SCREEN_SPECIES, 0);
                GF_SetVolumeBySeqNo(1, 48);
                BeginNormalPaletteFade(0, 0, 0, RGB_WHITE, 5, 1, HEAP_ID_30);
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
                ov60_021E69D4(&data->animData);
                ov60_021E6B08(&data->animData);
            }
        }
        break;
    case TITLESCREEN_MAIN_PROCEED_FLASH:
        ov60_021E6B08(&data->animData);
        data->animData.unk_1A8 = FALSE;
        ov60_021E641C(&data->animData, data->bgConfig, data->heapID);
        if (IsPaletteFadeFinished()) {
            BeginNormalPaletteFade(0, 1, 1, RGB_WHITE, 12, 1, HEAP_ID_30);
            *state = (int)TITLESCREEN_MAIN_PROCEED_FLASH_2;
        }
        if (GF_SndGetFadeTimer() == 0) {
            StopBGM(SEQ_GS_POKEMON_THEME, 0);
            BeginNormalPaletteFade(0, 0, 0, RGB_BLACK, 6, 1, data->heapID);
            *state = (int)TITLESCREEN_MAIN_FADEOUT;
        }
        break;
    case TITLESCREEN_MAIN_PROCEED_FLASH_2:
        ov60_021E6B08(&data->animData);
        data->animData.unk_1A8 = FALSE;
        ov60_021E641C(&data->animData, data->bgConfig, data->heapID);
        if (GF_SndGetFadeTimer() == 0) {
            StopBGM(SEQ_GS_POKEMON_THEME, 0);
            BeginNormalPaletteFade(0, 0, 0, RGB_BLACK, 6, 1, data->heapID);
            *state = (int)TITLESCREEN_MAIN_FADEOUT;
        }
        break;
    case TITLESCREEN_MAIN_PROCEED_NOFLASH:
        ov60_021E6B08(&data->animData);
        data->animData.unk_1A8 = FALSE;
        ov60_021E641C(&data->animData, data->bgConfig, data->heapID);
        if (GF_SndGetFadeTimer() == 0) {
            StopBGM(SEQ_GS_POKEMON_THEME, 0);
            BeginNormalPaletteFade(0, 0, 0, RGB_BLACK, 6, 1, data->heapID);
            *state = (int)TITLESCREEN_MAIN_FADEOUT;
        }
        break;
    case TITLESCREEN_MAIN_FADEOUT:
        ov60_021E6B08(&data->animData);
        if (IsPaletteFadeFinished() == TRUE && ov60_021E6544(&data->animData, data->bgConfig, data->heapID) == TRUE) {
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
    TitleScreen_DeinitBgs(data);
    OverlayManager_FreeData(man);
    DestroyHeap(heapID);

    switch (exitMode) {
    default:
    case TITLESCREEN_EXIT_MENU:
        RegisterMainOverlay((FSOverlayID)-1, &_02108278);
        break;
    case TITLESCREEN_EXIT_CLEARSAVE:
        RegisterMainOverlay((FSOverlayID)-1, &_0210820C);
        break;
    case TITLESCREEN_EXIT_TIMEOUT:
        sub_02004AD8(0);
        RegisterMainOverlay(FS_OVERLAY_ID(OVY_60), &ov60_021EB030);
        break;
    case TITLESCREEN_EXIT_MIC_TEST:
        sub_02004AD8(0);
        RegisterMainOverlay(FS_OVERLAY_ID(OVY_62), &ov62_021E68CC);
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

static void TitleScreen_Load3DObjects(TitleScreenAnimObject *animObj, int texFileId, int anim1Id, int anim2Id, int anim3Id, int anim4Id, HeapID heapID) {
    for (int i = 0; i < 4; ++i) {
        animObj->_3dResObjsArc[i] = animObj->_3dAnmObjs[i] = NULL;
    }

    GF_ExpHeap_FndInitAllocator(&animObj->allocator, heapID, 4);
    void *pAnim;
    animObj->resFileHeader = AllocAndReadWholeNarcMemberByIdPair(NARC_demo_title_titledemo, texFileId, heapID);
    sub_0201F51C(&animObj->renderObj, &animObj->resModel, &animObj->resFileHeader);
    NNSG3dResTex *tex = NNS_G3dGetTex(animObj->resFileHeader);

    if (anim1Id > 0) {
        animObj->_3dResObjsArc[0] = AllocAndReadWholeNarcMemberByIdPair(NARC_demo_title_titledemo, anim1Id, heapID);
        pAnim = NNS_G3dGetAnmByIdx(animObj->_3dResObjsArc[0], 0);
        animObj->_3dAnmObjs[0] = NNS_G3dAllocAnmObj(&animObj->allocator, pAnim, animObj->resModel);
        NNS_G3dAnmObjInit(animObj->_3dAnmObjs[0], pAnim, animObj->resModel, tex);
        NNS_G3dRenderObjAddAnmObj(&animObj->renderObj, animObj->_3dAnmObjs[0]);
    }

    if (anim2Id > 0) {
        animObj->_3dResObjsArc[1] = AllocAndReadWholeNarcMemberByIdPair(NARC_demo_title_titledemo, anim2Id, heapID);
        pAnim = NNS_G3dGetAnmByIdx(animObj->_3dResObjsArc[1], 0);
        animObj->_3dAnmObjs[1] = NNS_G3dAllocAnmObj(&animObj->allocator, pAnim, animObj->resModel);
        NNS_G3dAnmObjInit(animObj->_3dAnmObjs[1], pAnim, animObj->resModel, tex);
        NNS_G3dRenderObjAddAnmObj(&animObj->renderObj, animObj->_3dAnmObjs[1]);
    }

    if (anim3Id > 0) {
        animObj->_3dResObjsArc[2] = AllocAndReadWholeNarcMemberByIdPair(NARC_demo_title_titledemo, anim3Id, heapID);
        pAnim = NNS_G3dGetAnmByIdx(animObj->_3dResObjsArc[2], 0);
        animObj->_3dAnmObjs[2] = NNS_G3dAllocAnmObj(&animObj->allocator, pAnim, animObj->resModel);
        NNS_G3dAnmObjInit(animObj->_3dAnmObjs[2], pAnim, animObj->resModel, tex);
        NNS_G3dRenderObjAddAnmObj(&animObj->renderObj, animObj->_3dAnmObjs[2]);
    }

    if (anim4Id > 0) {
        animObj->_3dResObjsArc[3] = AllocAndReadWholeNarcMemberByIdPair(NARC_demo_title_titledemo, anim4Id, heapID);
        pAnim = NNS_G3dGetAnmByIdx(animObj->_3dResObjsArc[3], 0);
        animObj->_3dAnmObjs[3] = NNS_G3dAllocAnmObj(&animObj->allocator, pAnim, animObj->resModel);
        NNS_G3dAnmObjInit(animObj->_3dAnmObjs[3], pAnim, animObj->resModel, tex);
        NNS_G3dRenderObjAddAnmObj(&animObj->renderObj, animObj->_3dAnmObjs[3]);
    }

    VecFx32 zero = {0, 0, 0};
    animObj->translation = (VecFx32){30 * FX32_ONE, 95 * FX32_ONE, 0};
    animObj->scale = (VecFx32){FX32_ONE, FX32_ONE, FX32_ONE};
    animObj->rotationVec = zero;
    animObj->unk_B8 = 0;
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
        FX32_ONE, 0, 0,
        0, FX32_ONE, 0,
        0, 0, FX32_ONE,
    };

    switch (animObj->unk_00) {
    case 0:
        break;
    case 1:
        Thunk_G3X_Reset();
        sub_02026E50(0, 1);
        animObj->unk_00 = 0;
        break;
    case 2:
        Thunk_G3X_Reset();
        Camera_PushLookAtToNNSGlb();
        sub_02020D2C(&mtx, &animObj->rotationVec);
        Draw3dModel(&animObj->renderObj, &animObj->translation, &mtx, &animObj->scale);
        switch (animObj->unk_B8) {
        case 0:
            TitleScreen_AdvanceAnimObjsFrame(animObj->_3dAnmObjs, 0);
            break;
        case 1:
            if (animObj->_3dAnmObjs[0]->frame == 0) {
                animObj->unk_B8 = 0;
                break;
            }
            // fallthrough
        case 2:
            TitleScreen_AdvanceAnimObjsFrame(animObj->_3dAnmObjs, FX32_ONE);
            break;
        }
    }
}

static void TitleScreen_InitBgs(TitleScreenOverlayData *data) {
    data->bgConfig = BgConfig_Alloc(data->heapID);

    {
        GraphicsModes stack_data = {
            GX_DISPMODE_GRAPHICS,
            GX_BGMODE_0,
            GX_BGMODE_0,
            GX_BG0_AS_3D
        };
        SetBothScreensModesAndDisable(&stack_data);
    }
    {
        BgTemplate stack_data = {
            0, 0,
            0x800,
            0,
            GF_BG_SCR_SIZE_256x256,
            GX_BG_COLORMODE_16,
            18,
            3,
            0, 0, 0, 0, 0
        };
        InitBgFromTemplate(data->bgConfig, GF_BG_LYR_SUB_1, &stack_data, 0);
    }
    {
        BgTemplate stack_data = {
            0, 0,
            0x800,
            0,
            GF_BG_SCR_SIZE_256x256,
            GX_BG_COLORMODE_256,
            16,
            0,
            0, 0, 0, 0, 0
        };
        InitBgFromTemplate(data->bgConfig, GF_BG_LYR_SUB_2, &stack_data, 0);
    }
    {
        BgTemplate stack_data = {
            0, 0,
            0x800,
            0,
            GF_BG_SCR_SIZE_256x256,
            GX_BG_COLORMODE_256,
            20,
            4,
            0, 3, 0, 0, 0
        };
        InitBgFromTemplate(data->bgConfig, GF_BG_LYR_SUB_3, &stack_data, 0);
    }
    {
        BgTemplate stack_data = {
            0, 0,
            0x800,
            0,
            GF_BG_SCR_SIZE_256x256,
            GX_BG_COLORMODE_16,
            7,
            1,
            0, 1, 0, 0, 0
        };
        InitBgFromTemplate(data->bgConfig, GF_BG_LYR_MAIN_1, &stack_data, 0);
    }
    {
        BgTemplate stack_data = {
            0, 0,
            0x800,
            0,
            GF_BG_SCR_SIZE_256x256,
            GX_BG_COLORMODE_16,
            5,
            4,
            0, 3, 0, 0, 0
        };
        InitBgFromTemplate(data->bgConfig, GF_BG_LYR_MAIN_2, &stack_data, 0);
    }
    {
        BgTemplate stack_data = {
            0, 0,
            0x800,
            0,
            GF_BG_SCR_SIZE_256x256,
            GX_BG_COLORMODE_16,
            4,
            0,
            0, 0, 0, 0, 0
        };
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

static void TitleScreen_DeinitBgs(TitleScreenOverlayData *data) {
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

static const WindowTemplate sTouchToStartWindow = {
    GF_BG_LYR_MAIN_3,
    0, 18, 32, 2, 2, 0x001
};

static BOOL TitleScreenAnim_InitObjectsAndCamera(TitleScreenAnimData *animData, BgConfig *bgConfig, HeapID heapID) {
    ov60_021E68B0(animData);
    ov60_021E65B4(bgConfig, heapID, animData);
    if (animData->gameVersion == VERSION_HEARTGOLD) {
        TitleScreen_Load3DObjects(&animData->hooh_lugia, 25, 26, 27, 29, 28, heapID);
        TitleScreen_Load3DObjects(&animData->unk_0C0, 38, 39, -1, 40, -1, heapID);
    } else {
        TitleScreen_Load3DObjects(&animData->hooh_lugia, 20, 21, 22, 23, 24, heapID);
        TitleScreen_Load3DObjects(&animData->unk_0C0, 41, 42, -1, 43, -1, heapID);
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
    NNS_G3dGlbLightVector(GX_LIGHTID_0, animData->light0vec.x, animData->light0vec.y, animData->light0vec.z);
    NNS_G3dGlbLightColor(GX_LIGHTID_0, RGB_WHITE);
    NNS_G3dGlbLightVector(GX_LIGHTID_1, animData->light1vec.x, animData->light1vec.y, animData->light1vec.z);
    NNS_G3dGlbLightColor(GX_LIGHTID_1, RGB_WHITE);
    G3X_AntiAlias(TRUE);
    gSystem.screensFlipped = TRUE;
    GfGfx_SwapDisplay();
    animData->hooh_lugia.unk_00 = 2;
    animData->unk_0C0.unk_00 = 2;
    animData->unk_1FC = 0;
    animData->unk_1F8 = 0;
    animData->plttData = PaletteData_Init(HEAP_ID_30);
    PaletteData_AllocBuffers(animData->plttData, PLTTBUF_SUB_BG, 0x200, HEAP_ID_30);
    PaletteData_LoadPaletteSlotFromHardware(animData->plttData, PLTTBUF_SUB_BG, 0, 0x200);
    animData->unk_208 = 0;
    return TRUE;
}

static BOOL ov60_021E641C(TitleScreenAnimData *animData, BgConfig *bgConfig, HeapID heapID) {
    BOOL ret = FALSE;

    switch (animData->unk_000) {
    case 0:
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
        animData->hooh_lugia.unk_B8 = 2;
        animData->unk_0C0.unk_B8 = 2;
        NNS_G3dGlbLightColor(GX_LIGHTID_1, RGB_WHITE);
        animData->unk_17C = 0;
        animData->unk_000 = 1;
        break;
    case 1:
        if (animData->unk_1A8 == TRUE) {
            if (animData->unk_17C == 0) {
                GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG3, GF_PLANE_TOGGLE_ON);
            } else if (animData->unk_17C == 30) {
                GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG3, GF_PLANE_TOGGLE_OFF);
            }
        } else {
            GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG3, GF_PLANE_TOGGLE_OFF);
        }
        ++animData->unk_17C;
        if (animData->unk_17C >= 45) {
            animData->unk_17C = 0;
        }
        ret = TRUE;
        break;
    }
    TitleScreenAnimObjs_Run(&animData->hooh_lugia);
    TitleScreenAnimObjs_Run(&animData->unk_0C0);
    sub_02026E50(0, 1);
    ov60_021E67E8(animData);
    return ret;
}

static BOOL ov60_021E6544(TitleScreenAnimData *animData, BgConfig *bgConfig, HeapID heapID) {
    PaletteData_FreeBuffers(animData->plttData, PLTTBUF_SUB_BG);
    PaletteData_Free(animData->plttData);
    animData->plttData = NULL;
    Camera_Delete(animData->hooh_lugia.camera);
    TitleScreen_Unload3DObjects(&animData->hooh_lugia);
    TitleScreen_Unload3DObjects(&animData->unk_0C0);
    ov60_021E68A0(bgConfig, heapID, animData);
    G2_BlendNone();
    G3X_EdgeMarking(FALSE);
    gSystem.screensFlipped = FALSE;
    GfGfx_SwapDisplay();
    return TRUE;
}

static void ov60_021E65B4(BgConfig *bgConfig, HeapID heapID, TitleScreenAnimData *animData) {
    s32 res1, res2;

    if (animData->gameVersion == VERSION_HEARTGOLD) {
        GfGfxLoader_LoadCharData(NARC_demo_title_titledemo, 34, bgConfig, GF_BG_LYR_SUB_3, 0, 0, FALSE, heapID);
        GfGfxLoader_LoadScrnData(NARC_demo_title_titledemo, 35, bgConfig, GF_BG_LYR_SUB_3, 0, 0, FALSE, heapID);
    } else {
        GfGfxLoader_LoadCharData(NARC_demo_title_titledemo, 36, bgConfig, GF_BG_LYR_SUB_3, 0, 0, FALSE, heapID);
        GfGfxLoader_LoadScrnData(NARC_demo_title_titledemo, 37, bgConfig, GF_BG_LYR_SUB_3, 0, 0, FALSE, heapID);
    }
    BG_ClearCharDataRange(3, 0x20, 0, heapID);
    BgClearTilemapBufferAndCommit(bgConfig, 3);

    if (animData->gameVersion == VERSION_HEARTGOLD) {
        res1 = 4;
        res2 = 13;
    } else {
        res1 = 2;
        res2 = 14;
    }
    GfGfxLoader_GXLoadPal(NARC_demo_title_titledemo, res1, GF_PAL_LOCATION_SUB_BG, GF_PAL_SLOT_0_OFFSET, 0, heapID);
    GfGfxLoader_GXLoadPal(NARC_demo_title_titledemo, res2, GF_PAL_LOCATION_MAIN_BG, GF_PAL_SLOT_0_OFFSET, 0, heapID);

    if (animData->gameVersion == VERSION_HEARTGOLD) {
        res1 = 3;
        res2 = 4;
    } else {
        res1 = 1;
        res2 = 2;
    }
    GfGfxLoader_LoadCharData(NARC_demo_title_titledemo, res1, bgConfig, GF_BG_LYR_SUB_2, 0, 0, FALSE, heapID);
    GfGfxLoader_GXLoadPal(NARC_demo_title_titledemo, res2, GF_PAL_LOCATION_SUB_BGEXT, (enum GFPalSlotOffset)0x4000, 0, heapID);
    GfGfxLoader_LoadScrnData(NARC_demo_title_titledemo, 0, bgConfig, GF_BG_LYR_SUB_2, 0, 0, FALSE, heapID);

    GfGfxLoader_LoadCharData(NARC_demo_title_titledemo, 15, bgConfig, GF_BG_LYR_SUB_1, 0, 0, FALSE, heapID);
    GfGfxLoader_LoadScrnData(NARC_demo_title_titledemo, 17, bgConfig, GF_BG_LYR_SUB_1, 0, 0, FALSE, heapID);

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
        AddTextPrinterParameterizedWithColorAndSpacing(&animData->window, 0, string, 0, 0, 0, MAKE_TEXT_COLOR(1, 1, 0), 1, 0, NULL);
    } else {
        AddTextPrinterParameterizedWithColorAndSpacing(&animData->window, 0, string, 0, 0, 0, MAKE_TEXT_COLOR(2, 2, 0), 1, 0, NULL);
    }
    String_Delete(string);
    DestroyMsgData(msgData);

    u16 color1 = RGB(27, 8, 0);
    u16 color2 = RGB(0, 28, 31);
    BG_LoadPlttData(3, &color1, sizeof(u16), 0x42);
    BG_LoadPlttData(3, &color2, sizeof(u16), 0x44);
}

static void ov60_021E67E8(TitleScreenAnimData *animData) {
    switch (animData->unk_208) {
    case 0:
        animData->unk_208 = 1;
        animData->unk_20C = 0;
        animData->unk_210 = 0;
        break;
    case 1:
        ++animData->unk_210;
        if (animData->unk_210 > 60) {
            animData->unk_20C = 0;
            animData->unk_208 = 2;
        }
        break;
    case 2:
        --animData->unk_210;
        if (animData->unk_210 == 0) {
            animData->unk_208 = 3;
            animData->unk_20C = 0;
        }
        break;
    case 3:
        ++animData->unk_20C;
        if (animData->unk_20C > 20) {
            animData->unk_208 = 0;
            animData->unk_20C = 0;
        }
        break;
    }
    PaletteData_FadePalettesTowardsColorStep(animData->plttData, 2, 0xFF00, 160, animData->unk_210, RGB(12, 12, 12));
}

static void ov60_021E68A0(BgConfig *bgConfig, HeapID heapID, TitleScreenAnimData *animData) {
    RemoveWindow(&animData->window);
}

static void ov60_021E68B0(TitleScreenAnimData *animData) {
    if (animData->gameVersion == VERSION_HEARTGOLD) {
        SetVec(animData->cameraPosStart, FX32_CONST(0), FX32_CONST(65), FX32_CONST(72));
        SetVec(animData->cameraPosEnd, FX32_CONST(625), FX32_CONST(152), FX32_CONST(256));
        SetVec(animData->cameraTargetStart, FX32_CONST(0), FX32_CONST(90), FX32_CONST(0));
        SetVec(animData->cameraTargetEnd, FX32_CONST(-2), FX32_CONST(124), FX32_CONST(-38));
        SetVec(animData->light0vec, FX16_CONST(0), FX16_CONST(0.635498), FX16_CONST(0));
        SetVec(animData->light1vec, FX16_CONST(0), FX16_CONST(0.476807), FX16_CONST(0));
        animData->unused_1EC = FX32_CONST(3);
    } else {
        SetVec(animData->cameraPosStart, FX32_CONST(0), FX32_CONST(65), FX32_CONST(72));
        SetVec(animData->cameraPosEnd, FX32_CONST(420), FX32_CONST(87), FX32_CONST(331));
        SetVec(animData->cameraTargetStart, FX32_CONST(0), FX32_CONST(90), FX32_CONST(0));
        SetVec(animData->cameraTargetEnd, FX32_CONST(-2), FX32_CONST(124), FX32_CONST(-38));
        SetVec(animData->light0vec, FX16_CONST(0), FX16_CONST(0.635498), FX16_CONST(0));
        SetVec(animData->light1vec, FX16_CONST(0), FX16_CONST(0.476807), FX16_CONST(0));
        animData->unused_1EC = FX32_CONST(3);

    }

    {
    VecFx32 spC;
    VecFx32 sp0;

    SetVec(spC, FX32_CONST(0), FX32_CONST(0.635498), FX32_CONST(0));
    VEC_Normalize(&spC, &sp0);
    animData->light0vec.x = sp0.x;
    animData->light0vec.y = sp0.y;
    animData->light0vec.z = sp0.z;
    }
}

fx32 ov60_021E69CC(fx32 x) {
    return x < 0 ? -x : x;
}

static const struct UnkTitleScreenStruct_021EAF90 _021EAF40[5] = {
    {{FX32_CONST(180), FX32_CONST(177), FX32_CONST(301)}, 10},
    {{FX32_CONST(335), FX32_CONST(-293), FX32_CONST(296)}, 5},
    {{FX32_CONST(180), FX32_CONST(177), FX32_CONST(301)}, 5},
    {{FX32_CONST(625), FX32_CONST(152), FX32_CONST(256)}, 10},
    {{FX32_CONST(0), FX32_CONST(0), FX32_CONST(0)}, 0},
};

static const struct UnkTitleScreenStruct_021EAF90 _021EAF90[5] = {
    {{FX32_CONST(105), FX32_CONST(162), FX32_CONST(291)}, 10},
    {{FX32_CONST(395), FX32_CONST(432), FX32_CONST(191)}, 5},
    {{FX32_CONST(105), FX32_CONST(162), FX32_CONST(291)}, 5},
    {{FX32_CONST(420), FX32_CONST(87), FX32_CONST(331)}, 10},
    {{FX32_CONST(0), FX32_CONST(0), FX32_CONST(0)}, 0},
};

static void ov60_021E69D4(TitleScreenAnimData *animData) {
    const struct UnkTitleScreenStruct_021EAF90 *r4 = animData->gameVersion == VERSION_HEARTGOLD ? _021EAF40 : _021EAF90;
    ++animData->unk_1F4;
    if (animData->unk_1F4 > r4[animData->unk_1F0].unk_0C * 30) {
        VecFx32 sp0;
        VEC_Subtract(&r4[animData->unk_1F0].unk_00, &animData->cameraPosEnd, &sp0);
        if (sp0.x > FX32_ONE) {
            animData->cameraPosEnd.x += 5 * FX32_ONE;
        }
        if (sp0.x < -FX32_ONE) {
            animData->cameraPosEnd.x -= 5 * FX32_ONE;
        }
        if (sp0.y > FX32_ONE) {
            animData->cameraPosEnd.y += 5 * FX32_ONE;
        }
        if (sp0.y < -FX32_ONE) {
            animData->cameraPosEnd.y -= 5 * FX32_ONE;
        }
        if (sp0.z > FX32_ONE) {
            animData->cameraPosEnd.z += 5 * FX32_ONE;
        }
        if (sp0.z < -FX32_ONE) {
            animData->cameraPosEnd.z -= 5 * FX32_ONE;
        }
        Camera_SetLookAtCamPos(&animData->cameraPosEnd, animData->hooh_lugia.camera);
        if (ov60_021E69CC(sp0.x) <= FX32_ONE && ov60_021E69CC(sp0.y) <= FX32_ONE && ov60_021E69CC(sp0.z) <= FX32_ONE) {
            animData->unk_1F4 = 0;
            ++animData->unk_1F0;
            if (r4[animData->unk_1F0].unk_00.x == 0) {
                animData->unk_1F0 = 0;
            }
        }
    }
}

static void ov60_021E6B08(TitleScreenAnimData *animData) {
    ++animData->unk_1FC;
    if (animData->unk_1FC > 3) {
        G2S_SetBG2Offset(0, animData->unk_1F8 / 2);
        ++animData->unk_1F8;
        if (animData->unk_1F8 > 31) {
            animData->unk_1F8 = 31;
        }
        G2S_SetBlendAlpha(4, 0x39, animData->unk_1F8, 31 - animData->unk_1F8);
    }
}
