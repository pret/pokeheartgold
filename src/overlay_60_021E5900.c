#include "global.h"
#include "overlay_60.h"
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
    TITLEPM_LCD_TOP_0,
    TITLEPM_LCD_TOP_1,
    TITLEPM_LCD_TOP_2,
    TITLEPM_LCD_TOP_3,
    TITLEPM_LCD_TOP_4,
    TITLEPM_LCD_TOP_5,
    TITLEPM_LCD_TOP_6,
};

BOOL ov60_021E5900(OVY_MANAGER *man, int *state);
BOOL ov60_021E59C8(OVY_MANAGER *man, int *state);
BOOL ov60_021E5CA4(OVY_MANAGER *man, int *state);

void ov60_021E5D44(void *pVoid);
void ov60_021E5D7C(void);
void ov60_021E5D9C(TitleScreenOverlayData *data);
void ov60_021E5DCC(TitleScreenOverlayData *data);
void ov60_021E5DD8(TitleScreenAnimObject *animObj, int texFileId, int anim1Id, int anim2Id, int anim3Id, int anim4Id, HeapID heapID);
void ov60_021E5F4C(TitleScreenAnimObject *animObj);
void ov60_021E5F7C(NNSG3dAnmObj **ppAnmObj, fx32 a1);
void ov60_021E5FC8(TitleScreenAnimObject *animObj);
void ov60_021E6074(TitleScreenOverlayData *data);
void ov60_021E61C8(TitleScreenOverlayData *data);
BOOL ov60_021E6244(TitleScreenAnimData *animData, BgConfig *bgConfig, HeapID heapID);
BOOL ov60_021E641C(TitleScreenAnimData *animData, BgConfig *bgConfig, HeapID heapID);
BOOL ov60_021E6544(TitleScreenAnimData *animData, BgConfig *bgConfig, HeapID heapID);
void ov60_021E65B4(BgConfig *bgConfig, HeapID heapID, TitleScreenAnimData *animData);
void ov60_021E67E8(TitleScreenAnimData *animData);
void ov60_021E68A0(BgConfig *bgConfig, HeapID heapID, TitleScreenAnimData *animData);
void ov60_021E68B0(TitleScreenAnimData *animData);
void ov60_021E69D4(TitleScreenAnimData *animData);
void ov60_021E6B08(TitleScreenAnimData *animData);

extern const OVY_MGR_TEMPLATE ov60_021EB030;

BOOL ov60_021E5900(OVY_MANAGER *man, int *state) {
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
    data->unk_0CC.plttData = NULL;
    ov60_021E5D7C();
    ov60_021E6074(data);
    ov60_021E5D9C(data);
    Main_SetVBlankIntrCB(ov60_021E5D44, data);
    GfGfx_BothDispOn();
    data->unk_0CC.gameVersion = gGameVersion;
    return TRUE;
}

BOOL ov60_021E59C8(OVY_MANAGER *man, int *state) {
    TitleScreenOverlayData *data = OverlayManager_GetData(man);
    switch (*state) {
    case TITLEPM_LCD_TOP_0:
        if (ov60_021E6244(&data->unk_0CC, data->bgConfig, data->heapID) == TRUE) {
            data->unk_0CC.unk_000 = 0;
            data->unk_2E4 = 30;
            gSystem.unk70 = 0;
            *state = (int)TITLEPM_LCD_TOP_1;
        }
        break;
    case TITLEPM_LCD_TOP_1:
        sub_02004AD8(0);
        sub_02004EC4(1, SEQ_GS_POKEMON_THEME, 1);
        *state = (int)TITLEPM_LCD_TOP_2;
        break;
    case TITLEPM_LCD_TOP_2:
        if (data->unk_2E4 != 0) {
            --data->unk_2E4;
            data->unk_0CC.unk_1A8 = FALSE;
            ov60_021E641C(&data->unk_0CC, data->bgConfig, data->heapID);
        } else {
            data->unk_0CC.unk_1A8 = TRUE;
            ov60_021E641C(&data->unk_0CC, data->bgConfig, data->heapID);
            ++data->timer;
            if ((gSystem.newKeys & PAD_BUTTON_A) == PAD_BUTTON_A || (gSystem.newKeys & PAD_BUTTON_START) == PAD_BUTTON_START || gSystem.touchNew) {
                data->exitMode = TITLESCREEN_EXIT_MENU;
                GF_SndStartFadeOutBGM(0, 60);
                PlayCry(TITLE_SCREEN_SPECIES, 0);
                GF_SetVolumeBySeqNo(1, 48);
                BeginNormalPaletteFade(0, 0, 0, RGB_WHITE, 5, 1, HEAP_ID_30);
                *state = (int)TITLEPM_LCD_TOP_3;
            } else if ((gSystem.heldKeys & CLEAR_SAVE_KEY_COMBO) == CLEAR_SAVE_KEY_COMBO) {
                data->exitMode = TITLESCREEN_EXIT_CLEARSAVE;
                BeginNormalPaletteFade(0, 0, 0, RGB_BLACK, 6, 1, data->heapID);
                *state = (int)TITLEPM_LCD_TOP_6;
            } else if ((gSystem.heldKeys & MIC_TEST_KEY_COMBO) == MIC_TEST_KEY_COMBO) {
                data->exitMode = TITLESCREEN_EXIT_MIC_TEST;
                BeginNormalPaletteFade(0, 0, 0, RGB_BLACK, 6, 1, data->heapID);
                *state = (int)TITLEPM_LCD_TOP_6;
            } else if (data->timer > TITLE_SCREEN_DURATION) {
                data->exitMode = TITLESCREEN_EXIT_TIMEOUT;
                gSystem.unk70 = TRUE;
                GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG3, GF_PLANE_TOGGLE_OFF);
                GF_SndStartFadeOutBGM(0, 60);
                *state = (int)TITLEPM_LCD_TOP_5;
            } else {
                ov60_021E69D4(&data->unk_0CC);
                ov60_021E6B08(&data->unk_0CC);
            }
        }
        break;
    case TITLEPM_LCD_TOP_3:
        ov60_021E6B08(&data->unk_0CC);
        data->unk_0CC.unk_1A8 = 0;
        ov60_021E641C(&data->unk_0CC, data->bgConfig, data->heapID);
        if (IsPaletteFadeFinished()) {
            BeginNormalPaletteFade(0, 1, 1, RGB_WHITE, 12, 1, HEAP_ID_30);
            *state = (int)TITLEPM_LCD_TOP_4;
        }
        if (GF_SndGetFadeTimer() == 0) {
            StopBGM(SEQ_GS_POKEMON_THEME, 0);
            BeginNormalPaletteFade(0, 0, 0, RGB_BLACK, 6, 1, data->heapID);
            *state = (int)TITLEPM_LCD_TOP_6;
        }
        break;
    case TITLEPM_LCD_TOP_4:
        ov60_021E6B08(&data->unk_0CC);
        data->unk_0CC.unk_1A8 = 0;
        ov60_021E641C(&data->unk_0CC, data->bgConfig, data->heapID);
        if (GF_SndGetFadeTimer() == 0) {
            StopBGM(SEQ_GS_POKEMON_THEME, 0);
            BeginNormalPaletteFade(0, 0, 0, RGB_BLACK, 6, 1, data->heapID);
            *state = (int)TITLEPM_LCD_TOP_6;
        }
        break;
    case TITLEPM_LCD_TOP_5:
        ov60_021E6B08(&data->unk_0CC);
        data->unk_0CC.unk_1A8 = 0;
        ov60_021E641C(&data->unk_0CC, data->bgConfig, data->heapID);
        if (GF_SndGetFadeTimer() == 0) {
            StopBGM(SEQ_GS_POKEMON_THEME, 0);
            BeginNormalPaletteFade(0, 0, 0, RGB_BLACK, 6, 1, data->heapID);
            *state = (int)TITLEPM_LCD_TOP_6;
        }
        break;
    case TITLEPM_LCD_TOP_6:
        ov60_021E6B08(&data->unk_0CC);
        if (IsPaletteFadeFinished() == TRUE && ov60_021E6544(&data->unk_0CC, data->bgConfig, data->heapID) == TRUE) {
            return TRUE;
        }
        break;
    }

    return FALSE;
}

BOOL ov60_021E5CA4(OVY_MANAGER *man, int *state) {
    TitleScreenOverlayData *data = OverlayManager_GetData(man);
    HeapID heapID = data->heapID;
    int exitMode = data->exitMode;

    Main_SetVBlankIntrCB(NULL, NULL);
    ov60_021E5DCC(data);
    ov60_021E61C8(data);
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

void ov60_021E5D44(void *pVoid) {
    TitleScreenOverlayData *data = (TitleScreenOverlayData *)pVoid;

    if (data->needMasterBrightnessNeutral) {
        SetMasterBrightnessNeutral(PM_LCD_TOP);
        SetMasterBrightnessNeutral(PM_LCD_BOTTOM);
        data->needMasterBrightnessNeutral = FALSE;
    }

    if (data->unk_0CC.plttData != NULL) {
        PaletteData_PushTransparentBuffers(data->unk_0CC.plttData);
    }

    DoScheduledBgGpuUpdates(data->bgConfig);
}

void ov60_021E5D7C(void) {
    extern const GraphicsBanks _021EAF18;

    GraphicsBanks graphicsBanks = _021EAF18;
    GfGfx_SetBanks(&graphicsBanks);
}

void ov60_021E5D9C(TitleScreenOverlayData *data) {
    data->_3dVramMan = GF_3DVramMan_Create(data->heapID, 0, 1, 0, 4, NULL);
    G2_SetBG0Priority(1);
}

void ov60_021E5DCC(TitleScreenOverlayData *data) {
    GF_3DVramMan_Delete(data->_3dVramMan);
}

void ov60_021E5DD8(TitleScreenAnimObject *animObj, int texFileId, int anim1Id, int anim2Id, int anim3Id, int anim4Id, HeapID heapID) {
    extern const VecFx32 _021EAE30;
    extern const VecFx32 _021EAE24;

    for (int i = 0; i < 4; ++i) {
        animObj->unk_60[i] = animObj->unk_70[i] = NULL;
    }

    GF_ExpHeap_FndInitAllocator(&animObj->allocator, heapID, 4);
    void *pAnim;
    animObj->resFileHeader = AllocAndReadWholeNarcMemberByIdPair(NARC_a_0_4_6, texFileId, heapID);
    sub_0201F51C(&animObj->renderObj, &animObj->resModel, &animObj->resFileHeader);
    NNSG3dResTex *tex = NNS_G3dGetTex(animObj->resFileHeader);

    if (anim1Id > 0) {
        animObj->unk_60[0] = AllocAndReadWholeNarcMemberByIdPair(NARC_a_0_4_6, anim1Id, heapID);
        pAnim = NNS_G3dGetAnmByIdx(animObj->unk_60[0], 0);
        animObj->unk_70[0] = NNS_G3dAllocAnmObj(&animObj->allocator, pAnim, animObj->resModel);
        NNS_G3dAnmObjInit(animObj->unk_70[0], pAnim, animObj->resModel, tex);
        NNS_G3dRenderObjAddAnmObj(&animObj->renderObj, animObj->unk_70[0]);
    }

    if (anim2Id > 0) {
        animObj->unk_60[1] = AllocAndReadWholeNarcMemberByIdPair(NARC_a_0_4_6, anim2Id, heapID);
        pAnim = NNS_G3dGetAnmByIdx(animObj->unk_60[1], 0);
        animObj->unk_70[1] = NNS_G3dAllocAnmObj(&animObj->allocator, pAnim, animObj->resModel);
        NNS_G3dAnmObjInit(animObj->unk_70[1], pAnim, animObj->resModel, tex);
        NNS_G3dRenderObjAddAnmObj(&animObj->renderObj, animObj->unk_70[1]);
    }

    if (anim3Id > 0) {
        animObj->unk_60[2] = AllocAndReadWholeNarcMemberByIdPair(NARC_a_0_4_6, anim3Id, heapID);
        pAnim = NNS_G3dGetAnmByIdx(animObj->unk_60[2], 0);
        animObj->unk_70[2] = NNS_G3dAllocAnmObj(&animObj->allocator, pAnim, animObj->resModel);
        NNS_G3dAnmObjInit(animObj->unk_70[2], pAnim, animObj->resModel, tex);
        NNS_G3dRenderObjAddAnmObj(&animObj->renderObj, animObj->unk_70[2]);
    }

    if (anim4Id > 0) {
        animObj->unk_60[3] = AllocAndReadWholeNarcMemberByIdPair(NARC_a_0_4_6, anim4Id, heapID);
        pAnim = NNS_G3dGetAnmByIdx(animObj->unk_60[3], 0);
        animObj->unk_70[3] = NNS_G3dAllocAnmObj(&animObj->allocator, pAnim, animObj->resModel);
        NNS_G3dAnmObjInit(animObj->unk_70[3], pAnim, animObj->resModel, tex);
        NNS_G3dRenderObjAddAnmObj(&animObj->renderObj, animObj->unk_70[3]);
    }

    VecFx32 zero = {0, 0, 0};
    animObj->translation = _021EAE30;
    animObj->scale = _021EAE24;
    animObj->unk_A8 = zero;
    animObj->unk_B8 = 0;
}

void ov60_021E5F4C(TitleScreenAnimObject *animObj) {
    for (int i = 0; i < 4; ++i) {
        if (animObj->unk_70[i] != NULL) {
            NNS_G3dFreeAnmObj(&animObj->allocator, animObj->unk_70[i]);
            FreeToHeap(animObj->unk_60[i]);
        }
    }
    FreeToHeap(animObj->resFileHeader);
}

void ov60_021E5F7C(NNSG3dAnmObj **ppAnmObj, fx32 a1) {
    if (a1 == 0) {
        for (int i = 0; i < 4; ++i) {
            if (ppAnmObj[i] != NULL) {
                NNS_G3dAnmObjSetFrame(ppAnmObj[i], 0);
            }
        }
    } else {
        for (int i = 0; i < 4; ++i) {
            if (ppAnmObj[i] != NULL) {
                NNS_G3dAnmObjSetFrame(ppAnmObj[i], ppAnmObj[i]->frame + a1);
                if (ppAnmObj[i]->frame == NNS_G3dAnmObjGetNumFrame(ppAnmObj[i])) {
                    NNS_G3dAnmObjSetFrame(ppAnmObj[i], 0);
                }
            }
        }
    }
}

void ov60_021E5FC8(TitleScreenAnimObject *animObj) {
    extern const MtxFx33 _021EAEF4;

    MtxFx33 mtx = _021EAEF4;

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
        sub_02020D2C(&mtx, &animObj->unk_A8);
        Draw3dModel(&animObj->renderObj, &animObj->translation, &mtx, &animObj->scale);
        switch (animObj->unk_B8) {
        case 0:
            ov60_021E5F7C(animObj->unk_70, 0);
            break;
        case 1:
            if (animObj->unk_70[0]->frame == 0) {
                animObj->unk_B8 = 0;
                break;
            }
            // fallthrough
        case 2:
            ov60_021E5F7C(animObj->unk_70, FX32_ONE);
        }
    }
}

void ov60_021E6074(TitleScreenOverlayData *data) {
    extern const GraphicsModes _021EAE3C;
    extern const BgTemplate _021EAEA0;
    extern const BgTemplate _021EAEBC;
    extern const BgTemplate _021EAE4C;
    extern const BgTemplate _021EAE68;
    extern const BgTemplate _021EAE84;
    extern const BgTemplate _021EAED8;

    data->bgConfig = BgConfig_Alloc(data->heapID);

    {
        GraphicsModes stack_data = _021EAE3C;
        SetBothScreensModesAndDisable(&stack_data);
    }
    {
        BgTemplate stack_data = _021EAEA0;
        InitBgFromTemplate(data->bgConfig, GF_BG_LYR_SUB_1, &stack_data, 0);
    }
    {
        BgTemplate stack_data = _021EAEBC;
        InitBgFromTemplate(data->bgConfig, GF_BG_LYR_SUB_2, &stack_data, 0);
    }
    {
        BgTemplate stack_data = _021EAE4C;
        InitBgFromTemplate(data->bgConfig, GF_BG_LYR_SUB_3, &stack_data, 0);
    }
    {
        BgTemplate stack_data = _021EAE68;
        InitBgFromTemplate(data->bgConfig, GF_BG_LYR_MAIN_1, &stack_data, 0);
    }
    {
        BgTemplate stack_data = _021EAE84;
        InitBgFromTemplate(data->bgConfig, GF_BG_LYR_MAIN_2, &stack_data, 0);
    }
    {
        BgTemplate stack_data = _021EAED8;
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

void ov60_021E61C8(TitleScreenOverlayData *data) {
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

BOOL ov60_021E6244(TitleScreenAnimData *animData, BgConfig *bgConfig, HeapID heapID) {
    ov60_021E68B0(animData);
    ov60_021E65B4(bgConfig, heapID, animData);
    if (animData->gameVersion == VERSION_HEARTGOLD) {
        ov60_021E5DD8(&animData->unk_004, 25, 26, 27, 29, 28, heapID);
        ov60_021E5DD8(&animData->unk_0C0, 38, 39, -1, 40, -1, heapID);
    } else {
        ov60_021E5DD8(&animData->unk_004, 20, 21, 22, 23, 24, heapID);
        ov60_021E5DD8(&animData->unk_0C0, 41, 42, -1, 43, -1, heapID);
    }
    G3X_AntiAlias(TRUE);
    G3X_AlphaBlend(TRUE);
    animData->unk_190.x = animData->unk_1C4.x;
    animData->unk_190.y = animData->unk_1C4.y;
    animData->unk_190.z = animData->unk_1C4.z;
    animData->unk_19C.x = animData->unk_1AC.x;
    animData->unk_19C.y = animData->unk_1AC.y;
    animData->unk_19C.z = animData->unk_1AC.z;
    animData->unk_004.camera = Camera_New(heapID);
    Camera_Init_FromTargetAndPos(&animData->unk_190, &animData->unk_19C, 0xB60, 0, FALSE, animData->unk_004.camera);
    Camera_SetPerspectiveClippingPlane(0, FX32_CONST(0.5), animData->unk_004.camera);
    Camera_ApplyPerspectiveType(0, animData->unk_004.camera);
    Camera_SetStaticPtr(animData->unk_004.camera);
    NNS_G3dGlbLightVector(GX_LIGHTID_0, animData->unk_1DC.x, animData->unk_1DC.y, animData->unk_1DC.z);
    NNS_G3dGlbLightColor(GX_LIGHTID_0, RGB_WHITE);
    NNS_G3dGlbLightVector(GX_LIGHTID_1, animData->unk_1E2.x, animData->unk_1E2.y, animData->unk_1E2.z);
    NNS_G3dGlbLightColor(GX_LIGHTID_1, RGB_WHITE);
    G3X_AntiAlias(TRUE);
    gSystem.screensFlipped = TRUE;
    GfGfx_SwapDisplay();
    animData->unk_004.unk_00 = 2;
    animData->unk_0C0.unk_00 = 2;
    animData->unk_1FC = 0;
    animData->unk_1F8 = 0;
    animData->plttData = PaletteData_Init(HEAP_ID_30);
    PaletteData_AllocBuffers(animData->plttData, PLTTBUF_SUB_BG, 0x200, HEAP_ID_30);
    PaletteData_LoadPaletteSlotFromHardware(animData->plttData, PLTTBUF_SUB_BG, 0, 0x200);
    animData->unk_208 = 0;
    return TRUE;
}

BOOL ov60_021E641C(TitleScreenAnimData *animData, BgConfig *bgConfig, HeapID heapID) {
    BOOL ret = FALSE;

    switch (animData->unk_000) {
    case 0:
        Camera_SetLookAtCamTarget(&animData->unk_1D0, animData->unk_004.camera);
        Camera_SetLookAtCamPos(&animData->unk_1B8, animData->unk_004.camera);
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
        animData->unk_004.unk_B8 = 2;
        animData->unk_0C0.unk_B8 = 2;
        NNS_G3dGlbLightColor(GX_LIGHTID_1, RGB_WHITE);
        animData->unk_17C = 0;
        animData->unk_000 = 1;
        break;
    case 1:
        if (animData->unk_1A8 == 1) {
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
    ov60_021E5FC8(&animData->unk_004);
    ov60_021E5FC8(&animData->unk_0C0);
    sub_02026E50(0, 1);
    ov60_021E67E8(animData);
    return ret;
}

BOOL ov60_021E6544(TitleScreenAnimData *animData, BgConfig *bgConfig, HeapID heapID) {
    PaletteData_FreeBuffers(animData->plttData, PLTTBUF_SUB_BG);
    PaletteData_Free(animData->plttData);
    animData->plttData = NULL;
    Camera_Delete(animData->unk_004.camera);
    ov60_021E5F4C(&animData->unk_004);
    ov60_021E5F4C(&animData->unk_0C0);
    ov60_021E68A0(bgConfig, heapID, animData);
    G2_BlendNone();
    G3X_EdgeMarking(FALSE);
    gSystem.screensFlipped = FALSE;
    GfGfx_SwapDisplay();
    return TRUE;
}

void ov60_021E65B4(BgConfig *bgConfig, HeapID heapID, TitleScreenAnimData *animData) {
    s32 res1, res2;
    extern const WindowTemplate _021EAE1C;

    if (animData->gameVersion == VERSION_HEARTGOLD) {
        GfGfxLoader_LoadCharData(NARC_a_0_4_6, 34, bgConfig, GF_BG_LYR_SUB_3, 0, 0, FALSE, heapID);
        GfGfxLoader_LoadScrnData(NARC_a_0_4_6, 35, bgConfig, GF_BG_LYR_SUB_3, 0, 0, FALSE, heapID);
    } else {
        GfGfxLoader_LoadCharData(NARC_a_0_4_6, 36, bgConfig, GF_BG_LYR_SUB_3, 0, 0, FALSE, heapID);
        GfGfxLoader_LoadScrnData(NARC_a_0_4_6, 37, bgConfig, GF_BG_LYR_SUB_3, 0, 0, FALSE, heapID);
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
    GfGfxLoader_GXLoadPal(NARC_a_0_4_6, res1, GF_PAL_LOCATION_SUB_BG, GF_PAL_SLOT_0_OFFSET, 0, heapID);
    GfGfxLoader_GXLoadPal(NARC_a_0_4_6, res2, GF_PAL_LOCATION_MAIN_BG, GF_PAL_SLOT_0_OFFSET, 0, heapID);

    if (animData->gameVersion == VERSION_HEARTGOLD) {
        res1 = 3;
        res2 = 4;
    } else {
        res1 = 1;
        res2 = 2;
    }
    GfGfxLoader_LoadCharData(NARC_a_0_4_6, res1, bgConfig, GF_BG_LYR_SUB_2, 0, 0, FALSE, heapID);
    GfGfxLoader_GXLoadPal(NARC_a_0_4_6, res2, GF_PAL_LOCATION_SUB_BGEXT, (enum GFPalSlotOffset)0x4000, 0, heapID);
    GfGfxLoader_LoadScrnData(NARC_a_0_4_6, 0, bgConfig, GF_BG_LYR_SUB_2, 0, 0, FALSE, heapID);

    GfGfxLoader_LoadCharData(NARC_a_0_4_6, 15, bgConfig, GF_BG_LYR_SUB_1, 0, 0, FALSE, heapID);
    GfGfxLoader_LoadScrnData(NARC_a_0_4_6, 17, bgConfig, GF_BG_LYR_SUB_1, 0, 0, FALSE, heapID);

    BG_SetMaskColor(GF_BG_LYR_MAIN_0, RGB_BLACK);
    BG_SetMaskColor(GF_BG_LYR_SUB_1, RGB_BLACK);
    BG_ClearCharDataRange(GF_BG_LYR_MAIN_3, 0x20, 0, heapID);

    MsgData *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0719_bin, heapID);
    String *string = String_New(64, heapID);
    AddWindow(bgConfig, &animData->window, &_021EAE1C);
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

void ov60_021E67E8(TitleScreenAnimData *animData) {
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

void ov60_021E68A0(BgConfig *bgConfig, HeapID heapID, TitleScreenAnimData *animData) {
    RemoveWindow(&animData->window);
}
