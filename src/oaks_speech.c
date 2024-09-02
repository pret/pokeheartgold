#include "oaks_speech.h"

#include "global.h"

#include "constants/species.h"

#include "demo/intro/intro.naix"
#include "msgdata/msg.naix"
#include "msgdata/msg/msg_0219.h"

#include "brightness.h"
#include "font.h"
#include "gf_gfx_loader.h"
#include "launch_application.h"
#include "main.h"
#include "math_util.h"
#include "oaks_speech_internal.h"
#include "overlay_36.h"
#include "overlay_manager.h"
#include "player_data.h"
#include "render_text.h"
#include "render_window.h"
#include "sound.h"
#include "sound_02004A44.h"
#include "text.h"
#include "touchscreen.h"
#include "unk_02005D10.h"
#include "unk_0200FA24.h"
#include "unk_02082908.h"
#include "yes_no_prompt.h"

FS_EXTERN_OVERLAY(OVY_36);

// In Diamond and Pearl, the player pics were animated.
// Vestiges of that system remain here.
typedef enum OakSpeechPic {
    OAK_SPEECH_PIC_NONE  = 0,
    OAK_SPEECH_PIC_OAK   = 1,
    OAK_SPEECH_PIC_ETHAN = 2,
    OAK_SPEECH_PIC_LYRA  = 6,
} OakSpeechPic;

static void OakSpeech_VBlankCB(void *cbArg);
static void OakSpeech_InitBgs(OakSpeechData *data);
static void ov53_021E5DE0(OakSpeechData *data);
static void ov53_021E5E6C(OakSpeechData *data);
static void ov53_021E5EB8(OakSpeechData *data);
static BOOL OakSpeech_BlendLayer(OakSpeechData *data, int param, BOOL isFadeOut);
static BOOL OakSpeech_WaitFrames(OakSpeechData *data, int delay);
static void OakSpeech_FillBgLayerWithPalette(OakSpeechData *data, int bgId, int palette);
static BOOL OakSpeech_PrintDialogMsg(OakSpeechData *data, int msgNum, int waitButtonMode);
static BOOL OakSpeech_PrintAndFadeFullScreenText(OakSpeechData *data, int msgNum, int kind, int y, int height);
static BOOL OakSpeech_PrintAndFadeCenteredFullScreenText(OakSpeechData *data, int msgNum, int kind);
static void OakSpeech_PrintMultichoiceMenu(OakSpeechData *data, int msg1, int msg2, int msg3, int numChoices);
static void OakSpeech_FreeWindows(OakSpeechData *data);
static void OakSpeech_LoadButtonTutorialGfx(OakSpeechData *data);
static void OakSpeech_SetButtonTutorialScreenLayout(OakSpeechData *data, int a1);
static void OakSpeech_DrawPicOnBgLayer(OakSpeechData *data, int a1, int a2);
static void ov53_021E67C4(OakSpeechData *data, int a1);
static void ov53_021E6824(OakSpeechData *data, int a1);
static void OakSpeech_InitMultichoiceMenu(OakSpeechMultichoice *dest, int a1);
static void OakSpeech_InitMultichoiceMenuWithFrameFlash(OakSpeechData *data, int a1);
static int OakSpeech_MultichoiceMenuHandleInputVertical(OakSpeechData *data, int a1);
static u16 OakSpeech_AdditiveTransformColor(u16 a0, s8 a1);
static void OakSpeech_BlinkHighlightedGenderFrame(OakSpeechData *data, int a1);
static void OakSpeech_StopHighlightedGenderFrameBlink(OakSpeechData *data);
static BOOL OakSpeech_GenderSelectHandleInput(OakSpeechData *data);
static void ov53_021E6DF0(OakSpeechData *data);
static BOOL OakSpeech_PlayerPicShrinkAnim(OakSpeechData *data);
static int OakSpeech_GetTimeOfDayIntroMsg(void);
static BOOL ov53_021E6F00(OakSpeechData *data, int a1, int a2);
static BOOL OakSpeech_DoMainTask(OakSpeechData *data);
static void ov53_021E7D04(OakSpeechData *data);
static void ov53_021E7D58(OakSpeechData *data);
static void ov53_021E7D70(OakSpeechData *data);
static void ov53_021E7DDC(OakSpeechData *data);
static void ov53_021E7E08(OakSpeechData *data, int a1);
static BOOL ov53_021E7E94(OakSpeechData *data);
static BOOL ov53_021E7EAC(OakSpeechData *data);
static void ov53_021E7ECC(OakSpeechData *data);

static const int ov53_021E84F8[1] = {
    4,
};

static const int ov53_021E84FC[1] = {
    4,
};

static const WindowTemplate ov53_021E8518 = {
    .bgId     = GF_BG_LYR_SUB_0,
    .left     = 24,
    .top      = 20,
    .width    = 7,
    .height   = 2,
    .palette  = 14,
    .baseTile = 0x0A3,
};

static const WindowTemplate sWindowTemplate_DialogMsg = {
    .bgId     = GF_BG_LYR_MAIN_0,
    .left     = 2,
    .top      = 19,
    .width    = 27,
    .height   = 4,
    .palette  = 6,
    .baseTile = 0x36D,
};

static const WindowTemplate ov53_021E8528 = {
    .bgId     = GF_BG_LYR_MAIN_0,
    .left     = 4,
    .top      = 0,
    .width    = 24,
    .height   = 24,
    .palette  = 5,
    .baseTile = 0x12D,
};

static const int sButtonBlinkPalOffsets[] = {
    12,
    14,
};

static const TouchscreenHitbox ov53_021E8510[] = {
    {
     .rect = {
            144,
            191,
            168,
            255,
        },
     },
    {
     .rect = {
            TOUCHSCREEN_RECTLIST_END,
        },
     },
};

static const WindowTemplate ov53_021E8520 = {
    .bgId     = GF_BG_LYR_MAIN_0,
    .left     = 4,
    .top      = 0,
    .width    = 24,
    .height   = 24,
    .palette  = 5,
    .baseTile = 0x12D,
};

static const GraphicsBanks ov53_021E8628 = {
    GX_VRAM_BG_128_A,
    GX_VRAM_BGEXTPLTT_NONE,
    GX_VRAM_SUB_BG_128_C,
    GX_VRAM_SUB_BGEXTPLTT_NONE,
    GX_VRAM_OBJ_128_B,
    GX_VRAM_OBJEXTPLTT_NONE,
    GX_VRAM_SUB_OBJ_16_I,
    GX_VRAM_SUB_OBJEXTPLTT_NONE,
    GX_VRAM_TEX_NONE,
    GX_VRAM_TEXPLTT_NONE,
};

static const s16 ov53_021E853C[][3] = {
    {
     0,
     -52,
     -2,
     },
    {
     -52,
     0,
     2,
     },
};

static const TouchscreenHitbox sTouchscreenHitboxes_GenderSelect[3] = {
    {
     .rect = {
            25,
            173,
            18,
            111,
        },
     },
    {
     .rect = {
            25,
            173,
            144,
            239,
        },
     },
    {
     .rect = {
            TOUCHSCREEN_RECTLIST_END,
        },
     },
};

static const GraphicsModes ov53_021E8548 = {
    GX_DISPMODE_GRAPHICS,
    GX_BGMODE_0,
    GX_BGMODE_0,
    GX_BG0_AS_2D,
};

static const int ov53_021E8558[5] = {
    NARC_intro_intro_00000044_NSCR,
    NARC_intro_intro_00000043_NSCR,
    NARC_intro_intro_00000043_NSCR,
    NARC_intro_intro_00000045_NSCR,
    NARC_intro_intro_00000051_NSCR,
};

static const int sButtonTutorialNSCR[6] = {
    NARC_intro_intro_00000003_NSCR,
    NARC_intro_intro_00000004_NSCR,
    NARC_intro_intro_00000005_NSCR,
    NARC_intro_intro_00000006_NSCR,
    NARC_intro_intro_00000007_NSCR,
    NARC_intro_intro_00000008_NSCR,
};

static const int ov53_021E8584[3][2] = {
    {
     NARC_intro_intro_00000047_NSCR,
     NARC_intro_intro_00000037_NCGR,
     },
    {
     NARC_intro_intro_00000048_NSCR,
     NARC_intro_intro_00000037_NCGR,
     },
    {
     NARC_intro_intro_00000046_NSCR,
     NARC_intro_intro_00000037_NCGR,
     },
};

static const int sPlayerPicShrinkGfx_Male[6] = {
    NARC_intro_intro_00000012_NCGR,
    NARC_intro_intro_00000022_NCGR,
    NARC_intro_intro_00000023_NCGR,
    NARC_intro_intro_00000024_NCGR,
    NARC_intro_intro_00000025_NCGR,
    0xFF,
};

static const int sPlayerPicShrinkGfx_Female[6] = {
    NARC_intro_intro_00000017_NCGR,
    NARC_intro_intro_00000026_NCGR,
    NARC_intro_intro_00000027_NCGR,
    NARC_intro_intro_00000028_NCGR,
    NARC_intro_intro_00000029_NCGR,
    0xFF,
};

static const BgTemplate ov53_021E85CC = {
    .x          = 0,
    .y          = 0,
    .bufferSize = GF_BG_BUF_SIZE_256x256_4BPP,
    .baseTile   = 0,
    .size       = GF_BG_SCR_SIZE_256x256,
    .colorMode  = GX_BG_COLORMODE_16,
    .screenBase = GX_BG_SCRBASE_0x0000,
    .charBase   = GX_BG_CHARBASE_0x00000,
    .bgExtPltt  = GX_BG_EXTPLTT_01,
    .priority   = 1,
    .areaOver   = GX_BG_AREAOVER_XLU,
    .mosaic     = 0,
};

static const BgTemplate ov53_021E85E8 = {
    .x          = 0,
    .y          = 0,
    .bufferSize = GF_BG_BUF_SIZE_256x256_4BPP,
    .baseTile   = 0,
    .size       = GF_BG_SCR_SIZE_256x256,
    .colorMode  = GX_BG_COLORMODE_16,
    .screenBase = GX_BG_SCRBASE_0x0000,
    .charBase   = GX_BG_CHARBASE_0x00000,
    .bgExtPltt  = GX_BG_EXTPLTT_01,
    .priority   = 0,
    .areaOver   = GX_BG_AREAOVER_XLU,
    .mosaic     = 0,
};

static const int ov53_021E8604[][3] = {
    {
     0,
     0x1c7,
     0x18f,
     },
    {
     0,
     0x1af,
     0,
     },
    {
     0,
     0x1af,
     0,
     },
};

static const TouchscreenHitbox ov53_021E8650[3][4] = {
    {
     {
            .rect = {
                20,
                50,
                50,
                213,
            },
        },
     {
            .rect = {
                76,
                106,
                50,
                213,
            },
        },
     {
            .rect = {
                132,
                162,
                50,
                213,
            },
        },
     {
            {
                TOUCHSCREEN_RECTLIST_END,
            },
        },
     },
    {
     {
            .rect = {
                26,
                83,
                138,
                253,
            },
        },
     {
            .rect = {
                108,
                164,
                138,
                253,
            },
        },
     {
            .rect = {
                TOUCHSCREEN_RECTLIST_END,
            },
        },
     },
    {
     {
            .rect = {
                26,
                83,
                10,
                125,
            },
        },
     {
            .rect = {
                108,
                164,
                10,
                125,
            },
        },
     {
            .rect = {
                TOUCHSCREEN_RECTLIST_END,
            },
        },
     },
};

static const int sMultichoiceMenuParam[][4] = {
    {
     NARC_intro_intro_00000049_NSCR,
     3,
     },
    {
     NARC_intro_intro_00000050_NSCR,
     2,
     },
    {
     NARC_intro_intro_00000050_NSCR,
     2,
     },
    {
     NARC_intro_intro_00000052_NSCR,
     2,
     },
};

static const int sBgPicNCGR_NCLR[10][2] = {
    // undefined
    {                             },
    // Oak
    {
     NARC_intro_intro_00000010_NCGR,
     NARC_intro_intro_00000011_NCLR,
     },
    // Ethan 1
    {
     NARC_intro_intro_00000012_NCGR,
     NARC_intro_intro_00000016_NCLR,
     },
    // Ethan 2
    {
     NARC_intro_intro_00000013_NCGR,
     NARC_intro_intro_00000016_NCLR,
     },
    // Ethan 3
    {
     NARC_intro_intro_00000014_NCGR,
     NARC_intro_intro_00000016_NCLR,
     },
    // Ethan 4
    {
     NARC_intro_intro_00000015_NCGR,
     NARC_intro_intro_00000016_NCLR,
     },
    // Lyra 1
    {
     NARC_intro_intro_00000017_NCGR,
     NARC_intro_intro_00000021_NCLR,
     },
    // Lyra 2
    {
     NARC_intro_intro_00000018_NCGR,
     NARC_intro_intro_00000021_NCLR,
     },
    // Lyra 3
    {
     NARC_intro_intro_00000019_NCGR,
     NARC_intro_intro_00000021_NCLR,
     },
    // Lyra 4
    {
     NARC_intro_intro_00000020_NCGR,
     NARC_intro_intro_00000021_NCLR,
     },
};

BOOL OakSpeech_Init(OVY_MANAGER *ovyMan, int *pState) {
    CreateHeap(HEAP_ID_3, HEAP_ID_OAKS_SPEECH, 0x40000);
    OakSpeechData *data = OverlayManager_CreateAndGetData(ovyMan, sizeof(OakSpeechData), HEAP_ID_OAKS_SPEECH);
    memset(data, 0, sizeof(OakSpeechData));
    data->heapId                        = HEAP_ID_OAKS_SPEECH;
    UnkStruct_02111868_sub *mainOvyArgs = OverlayManager_GetArgs(ovyMan);
    data->saveData                      = mainOvyArgs->saveData;
    data->options                       = Save_PlayerData_GetOptionsAddr(data->saveData);
    data->state                         = 0;
    data->unk_010                       = 0;
    data->overlayManager                = NULL;
    data->namingScreenArgs_Player       = NamingScreen_CreateArgs(HEAP_ID_OAKS_SPEECH, NAME_SCREEN_PLAYER, 0, PLAYER_NAME_LENGTH, data->options, NULL);
    data->namingScreenArgs_Rival        = NamingScreen_CreateArgs(HEAP_ID_OAKS_SPEECH, NAME_SCREEN_RIVAL, 0, PLAYER_NAME_LENGTH, data->options, NULL);
    data->lastChosenGender              = 0;
    data->frameDelayCounter             = 0;
    sub_02002B8C(FALSE);
    FontID_Alloc(4, data->heapId);
    return TRUE;
}

BOOL OakSpeech_Main(OVY_MANAGER *ovyMan, int *pState) {
    OakSpeechData *data = OverlayManager_GetData(ovyMan);
    BOOL ret            = FALSE;
    switch (*pState) {
    case 0:
        sub_0200FBF4(PM_LCD_TOP, RGB_BLACK);
        sub_0200FBF4(PM_LCD_BOTTOM, RGB_BLACK);
        Main_SetVBlankIntrCB(NULL, NULL);
        Main_SetHBlankIntrCB(NULL, NULL);
        GfGfx_DisableEngineAPlanes();
        GfGfx_DisableEngineBPlanes();
        GX_SetVisiblePlane(0);
        GXS_SetVisiblePlane(0);
        SetKeyRepeatTimers(4, 8);
        OakSpeech_InitBgs(data);
        ov53_021E5E6C(data);
        BgClearTilemapBufferAndCommit(data->bgConfig, GF_BG_LYR_SUB_0);
        ov53_021E7F24(data);
        ov53_021E8014(data);
        data->unk_178 = ov53_021E80F4(data->bgConfig, data->sprites[4], 6, 4, 14, data->heapId);
        Main_SetVBlankIntrCB(OakSpeech_VBlankCB, data);
        GfGfx_BothDispOn();
        *pState = 1;
        break;
    case 1:
        ov53_021E7ECC(data);
        if (OakSpeech_DoMainTask(data) == TRUE) {
            BeginNormalPaletteFade(0, 0, 0, RGB_BLACK, 6, 1, data->heapId);
            *pState = 2;
        }
        if (data->overlayManager) {
            BeginNormalPaletteFade(0, 0, 0, RGB_BLACK, 6, 1, data->heapId);
            *pState = 3;
        }
        break;
    case 2:
        if (IsPaletteFadeFinished() == TRUE) {
            ov53_021E814C(data->unk_178);
            ov53_021E7FEC(data);
            ov53_021E5EB8(data);
            ov53_021E5DE0(data);
            Main_SetVBlankIntrCB(NULL, NULL);
            ret = TRUE;
        }
        break;
    case 3:
        if (IsPaletteFadeFinished() == TRUE) {
            ov53_021E814C(data->unk_178);
            ov53_021E7FEC(data);
            ov53_021E5EB8(data);
            ov53_021E5DE0(data);
            Main_SetVBlankIntrCB(NULL, NULL);
            *pState = 4;
        }
        break;
    case 4:
        if (OverlayManager_Run(data->overlayManager) == TRUE) {
            OverlayManager_Delete(data->overlayManager);
            data->overlayManager = NULL;
            *pState              = 5;
        }
        break;
    case 5:
        *pState = 0;
        break;
    }

    if (data->overlayManager == NULL && data->spriteGfxHandler != NULL) {
        sub_0200D020(data->spriteGfxHandler);
    }
    return ret;
}

BOOL OakSpeech_Exit(OVY_MANAGER *ovyMan, int *pState) {
    OakSpeechData *data = OverlayManager_GetData(ovyMan);
    HeapID heapId       = data->heapId;
    FontID_Release(4);
    PlayerName_StringToFlat(Save_PlayerData_GetProfileAddr(data->saveData), data->namingScreenArgs_Player->unk18);
    PlayerProfile_SetTrainerGender(Save_PlayerData_GetProfileAddr(data->saveData), data->namingScreenArgs_Player->unk4);
    Save_Misc_RivalName_Set(Save_Misc_Get(data->saveData), data->namingScreenArgs_Rival->unk18);
    sub_0208311C(data->namingScreenArgs_Player);
    sub_0208311C(data->namingScreenArgs_Rival);
    OverlayManager_FreeData(ovyMan);
    DestroyHeap(heapId);
    RegisterMainOverlay(FS_OVERLAY_ID(OVY_36), &ov36_App_InitGameState_AfterOakSpeech);
    sub_02002B8C(FALSE);
    return TRUE;
}

int OakSpeech_DeadstrippedFunction1(int a0) {
    int arr[1];
    ARRAY_ASSIGN(arr, ov53_021E84F8);
    return ov53_021E84F8[a0];
}

int OakSpeech_DeadstrippedFunction2(int a0) {
    int arr[1];
    ARRAY_ASSIGN(arr, ov53_021E84FC);
    return ov53_021E84FC[a0];
}

static void OakSpeech_VBlankCB(void *cbArg) {
    OakSpeechData *data = cbArg;

    DoScheduledBgGpuUpdates(data->bgConfig);
    thunk_OamManager_ApplyAndResetBuffers();
}

static void OakSpeech_InitBgs(OakSpeechData *data) {
    {
        GraphicsBanks graphicsBanks = ov53_021E8628;
        GfGfx_SetBanks(&graphicsBanks);
    }
    data->bgConfig = BgConfig_Alloc(data->heapId);
    {
        GraphicsModes graphicsModes = ov53_021E8548;
        SetBothScreensModesAndDisable(&graphicsModes);
    }
    {
        BgTemplate bgTemplate = ov53_021E85CC;

        bgTemplate.screenBase = GX_BG_SCRBASE_0x7800;
        bgTemplate.charBase   = GX_BG_CHARBASE_0x18000;
        InitBgFromTemplate(data->bgConfig, GF_BG_LYR_MAIN_0, &bgTemplate, GF_BG_TYPE_TEXT);
        BgClearTilemapBufferAndCommit(data->bgConfig, GF_BG_LYR_MAIN_0);

        bgTemplate.screenBase = GX_BG_SCRBASE_0x7000;
        bgTemplate.charBase   = GX_BG_CHARBASE_0x14000;
        InitBgFromTemplate(data->bgConfig, GF_BG_LYR_MAIN_1, &bgTemplate, GF_BG_TYPE_TEXT);
        BgClearTilemapBufferAndCommit(data->bgConfig, GF_BG_LYR_MAIN_1);

        bgTemplate.screenBase = GX_BG_SCRBASE_0x6800;
        bgTemplate.charBase   = GX_BG_CHARBASE_0x10000;
        InitBgFromTemplate(data->bgConfig, GF_BG_LYR_MAIN_2, &bgTemplate, GF_BG_TYPE_TEXT);
        BgClearTilemapBufferAndCommit(data->bgConfig, GF_BG_LYR_MAIN_2);

        bgTemplate.screenBase = GX_BG_SCRBASE_0x6000;
        bgTemplate.charBase   = GX_BG_CHARBASE_0x0c000;
        InitBgFromTemplate(data->bgConfig, GF_BG_LYR_MAIN_3, &bgTemplate, GF_BG_TYPE_TEXT);
        BgClearTilemapBufferAndCommit(data->bgConfig, GF_BG_LYR_MAIN_3);

        LoadUserFrameGfx2(data->bgConfig, GF_BG_LYR_MAIN_0, 0x3E2, 4, 0, data->heapId);
        LoadUserFrameGfx1(data->bgConfig, GF_BG_LYR_MAIN_0, 0x3D9, 3, 0, data->heapId);
        LoadFontPal0(GF_PAL_LOCATION_MAIN_BG, (enum GFPalSlotOffset)0xA0, data->heapId);
        LoadFontPal1(GF_PAL_LOCATION_MAIN_BG, (enum GFPalSlotOffset)0xC0, data->heapId);
    }
    {
        BgTemplate bgTemplate = ov53_021E85E8;

        bgTemplate.screenBase = GX_BG_SCRBASE_0x7800;
        bgTemplate.charBase   = GX_BG_CHARBASE_0x18000;
        InitBgFromTemplate(data->bgConfig, GF_BG_LYR_SUB_0, &bgTemplate, GF_BG_TYPE_TEXT);
        BgClearTilemapBufferAndCommit(data->bgConfig, GF_BG_LYR_SUB_0);

        bgTemplate.screenBase = GX_BG_SCRBASE_0x7000;
        bgTemplate.charBase   = GX_BG_CHARBASE_0x14000;
        InitBgFromTemplate(data->bgConfig, GF_BG_LYR_SUB_1, &bgTemplate, GF_BG_TYPE_TEXT);
        BgClearTilemapBufferAndCommit(data->bgConfig, GF_BG_LYR_SUB_1);

        bgTemplate.screenBase = GX_BG_SCRBASE_0x6800;
        bgTemplate.charBase   = GX_BG_CHARBASE_0x10000;
        InitBgFromTemplate(data->bgConfig, GF_BG_LYR_SUB_2, &bgTemplate, GF_BG_TYPE_TEXT);
        BgClearTilemapBufferAndCommit(data->bgConfig, GF_BG_LYR_SUB_2);

        bgTemplate.screenBase = GX_BG_SCRBASE_0x6000;
        bgTemplate.charBase   = GX_BG_CHARBASE_0x0c000;
        InitBgFromTemplate(data->bgConfig, GF_BG_LYR_SUB_3, &bgTemplate, GF_BG_TYPE_TEXT);
        BgClearTilemapBufferAndCommit(data->bgConfig, GF_BG_LYR_SUB_3);

        SetBgPriority(GF_BG_LYR_SUB_3, 3);
        LoadFontPal0(GF_PAL_LOCATION_SUB_BG, (enum GFPalSlotOffset)0x1C0, data->heapId);
        BG_ClearCharDataRange(GF_BG_LYR_SUB_0, 0x20, 0, data->heapId);
    }

    ToggleBgLayer(GF_BG_LYR_MAIN_0, GF_PLANE_TOGGLE_OFF);
    ToggleBgLayer(GF_BG_LYR_MAIN_1, GF_PLANE_TOGGLE_OFF);
    ToggleBgLayer(GF_BG_LYR_MAIN_2, GF_PLANE_TOGGLE_OFF);
    ToggleBgLayer(GF_BG_LYR_MAIN_3, GF_PLANE_TOGGLE_OFF);
    ToggleBgLayer(GF_BG_LYR_SUB_0, GF_PLANE_TOGGLE_OFF);
    ToggleBgLayer(GF_BG_LYR_SUB_1, GF_PLANE_TOGGLE_OFF);
    ToggleBgLayer(GF_BG_LYR_SUB_2, GF_PLANE_TOGGLE_OFF);
    ToggleBgLayer(GF_BG_LYR_SUB_3, GF_PLANE_TOGGLE_OFF);
    OakSpeech_LoadButtonTutorialGfx(data);
    data->layerBlendState = 0;
}

static void ov53_021E5DE0(OakSpeechData *data) {
    ToggleBgLayer(GF_BG_LYR_MAIN_0, GF_PLANE_TOGGLE_OFF);
    ToggleBgLayer(GF_BG_LYR_MAIN_1, GF_PLANE_TOGGLE_OFF);
    ToggleBgLayer(GF_BG_LYR_MAIN_2, GF_PLANE_TOGGLE_OFF);
    ToggleBgLayer(GF_BG_LYR_MAIN_3, GF_PLANE_TOGGLE_OFF);
    ToggleBgLayer(GF_BG_LYR_SUB_0, GF_PLANE_TOGGLE_OFF);
    ToggleBgLayer(GF_BG_LYR_SUB_1, GF_PLANE_TOGGLE_OFF);
    ToggleBgLayer(GF_BG_LYR_SUB_2, GF_PLANE_TOGGLE_OFF);
    ToggleBgLayer(GF_BG_LYR_SUB_3, GF_PLANE_TOGGLE_OFF);
    FreeBgTilemapBuffer(data->bgConfig, GF_BG_LYR_MAIN_0);
    FreeBgTilemapBuffer(data->bgConfig, GF_BG_LYR_MAIN_1);
    FreeBgTilemapBuffer(data->bgConfig, GF_BG_LYR_MAIN_2);
    FreeBgTilemapBuffer(data->bgConfig, GF_BG_LYR_MAIN_3);
    FreeBgTilemapBuffer(data->bgConfig, GF_BG_LYR_SUB_0);
    FreeBgTilemapBuffer(data->bgConfig, GF_BG_LYR_SUB_1);
    FreeBgTilemapBuffer(data->bgConfig, GF_BG_LYR_SUB_2);
    FreeBgTilemapBuffer(data->bgConfig, GF_BG_LYR_SUB_3);
    FreeToHeap(data->bgConfig);
}

static void ov53_021E5E6C(OakSpeechData *data) {
    data->msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0219_bin, data->heapId);
    ResetAllTextPrinters();
    data->unk_114                         = sub_020163E0(NULL, PM_LCD_TOP, 6, data->heapId);
    data->msgFormat                       = MessageFormat_New(data->heapId);
    data->printDialogMsgState             = 0;
    data->printAndFadeFullScreenTextState = 0;
    data->unk_080                         = 0;
}

static void ov53_021E5EB8(OakSpeechData *data) {
    MessageFormat_Delete(data->msgFormat);
    sub_020164C4(data->unk_114);
    DestroyMsgData(data->msgData);
}

static BOOL OakSpeech_BlendLayer(OakSpeechData *data, int param, BOOL isFadeOut) {
    BOOL ret = FALSE;
    GXBlendPlaneMask plane;
    PMLCDTarget screen;

    switch (param) {
    default:
    case GF_BG_LYR_MAIN_0:
        plane  = GX_BLEND_PLANEMASK_BG0;
        screen = PM_LCD_TOP;
        break;
    case GF_BG_LYR_MAIN_1:
        plane  = GX_BLEND_PLANEMASK_BG1;
        screen = PM_LCD_TOP;
        break;
    case GF_BG_LYR_MAIN_2:
        plane  = GX_BLEND_PLANEMASK_BG2;
        screen = PM_LCD_TOP;
        break;
    case GF_BG_LYR_SUB_0:
        plane  = GX_BLEND_PLANEMASK_BG0;
        screen = PM_LCD_BOTTOM;
        break;
    case GF_BG_LYR_SUB_1:
        plane  = GX_BLEND_PLANEMASK_BG1;
        screen = PM_LCD_BOTTOM;
        break;
    case GF_BG_LYR_SUB_2:
        plane  = GX_BLEND_PLANEMASK_BG2;
        screen = PM_LCD_BOTTOM;
        break;
    case 101: // GF_BG_LYR_MAIN_OBJ
        plane  = GX_BLEND_PLANEMASK_OBJ;
        screen = PM_LCD_TOP;
        break;
    case 102: // GF_BG_LYR_SUB_OBJ
        plane  = GX_BLEND_PLANEMASK_OBJ;
        screen = PM_LCD_BOTTOM;
        break;
    }

    switch (data->layerBlendState) {
    case 0:
        if (!isFadeOut) {
            data->layerBlendEv1   = 0;
            data->layerBlendEv2   = 16;
            data->layerBlendState = 1;
            if (screen == 0) {
                G2_SetBlendAlpha(
                    plane,
                    GX_BLEND_PLANEMASK_BG1 | GX_BLEND_PLANEMASK_BG2 | GX_BLEND_PLANEMASK_BG3,
                    data->layerBlendEv1,
                    data->layerBlendEv2);
            } else {
                G2S_SetBlendAlpha(
                    plane,
                    GX_BLEND_PLANEMASK_BG1 | GX_BLEND_PLANEMASK_BG2 | GX_BLEND_PLANEMASK_BG3,
                    data->layerBlendEv1,
                    data->layerBlendEv2);
            }
            if (param == 101) {
                GfGfx_EngineATogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_ON);
            } else if (param == 102) {
                GfGfx_EngineBTogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_ON);
            } else {
                ToggleBgLayer(param, GF_PLANE_TOGGLE_ON);
            }
        } else {
            data->layerBlendEv1   = 16;
            data->layerBlendEv2   = 0;
            data->layerBlendState = 2;
        }
        break;
    case 1:
        if (data->layerBlendEv2 != 0) {
            ++data->layerBlendEv1;
            --data->layerBlendEv2;
            if (screen == 0) {
                G2_SetBlendAlpha(
                    plane,
                    GX_BLEND_PLANEMASK_BG1 | GX_BLEND_PLANEMASK_BG2 | GX_BLEND_PLANEMASK_BG3,
                    data->layerBlendEv1,
                    data->layerBlendEv2);
            } else {
                G2S_SetBlendAlpha(
                    plane,
                    GX_BLEND_PLANEMASK_BG1 | GX_BLEND_PLANEMASK_BG2 | GX_BLEND_PLANEMASK_BG3,
                    data->layerBlendEv1,
                    data->layerBlendEv2);
            }
        } else {
            data->layerBlendState = 3;
        }
        break;
    case 2:
        if (data->layerBlendEv1 != 0) {
            --data->layerBlendEv1;
            ++data->layerBlendEv2;
            if (screen == 0) {
                G2_SetBlendAlpha(
                    plane,
                    GX_BLEND_PLANEMASK_BG1 | GX_BLEND_PLANEMASK_BG2 | GX_BLEND_PLANEMASK_BG3,
                    data->layerBlendEv1,
                    data->layerBlendEv2);
            } else {
                G2S_SetBlendAlpha(
                    plane,
                    GX_BLEND_PLANEMASK_BG1 | GX_BLEND_PLANEMASK_BG2 | GX_BLEND_PLANEMASK_BG3,
                    data->layerBlendEv1,
                    data->layerBlendEv2);
            }
        } else {
            data->layerBlendState = 3;
            if (param == 101) {
                GfGfx_EngineATogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_OFF);
            } else if (param == 102) {
                GfGfx_EngineBTogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_OFF);
            } else {
                ToggleBgLayer(param, GF_PLANE_TOGGLE_OFF);
            }
        }
        break;
    case 3:
        G2_BlendNone();
        G2S_BlendNone();
        ret                   = TRUE;
        data->layerBlendState = 0;
        break;
    }

    return ret;
}

static BOOL OakSpeech_WaitFrames(OakSpeechData *data, int delay) {
    if (data->frameDelayCounter < delay) {
        ++data->frameDelayCounter;
        return FALSE;
    } else {
        data->frameDelayCounter = 0;
        return TRUE;
    }
}

static void OakSpeech_FillBgLayerWithPalette(OakSpeechData *data, int bgId, int palette) {
    BgTilemapRectChangePalette(data->bgConfig, bgId, 0, 0, 32, 24, palette);
    BgCommitTilemapBufferToVram(data->bgConfig, bgId);
}

static BOOL OakSpeech_PrintDialogMsg(OakSpeechData *data, int msgNum, int waitButtonMode) {
    BOOL ret = FALSE;

    switch (data->printDialogMsgState) {
    case 0: {
        AddWindow(data->bgConfig, &data->dialogWindow, &sWindowTemplate_DialogMsg);
        FillWindowPixelRect(&data->dialogWindow, 0xF, 0, 0, 216, 32);
        DrawFrameAndWindow2(&data->dialogWindow, FALSE, 0x3E2, 4);

        TextFlags_SetCanABSpeedUpPrint(TRUE);
        sub_02002B50(FALSE);

        String *temp = String_New(0x400, data->heapId);
        data->string = String_New(0x400, data->heapId);
        ReadMsgDataIntoString(data->msgData, msgNum, temp);
        BufferString(data->msgFormat, 0, data->namingScreenArgs_Player->unk18, data->playerGender, 1, 2);
        BufferString(data->msgFormat, 1, data->namingScreenArgs_Rival->unk18, 0, 1, 2);
        StringExpandPlaceholders(data->msgFormat, data->string, temp);
        String_Delete(temp);

        data->textPrinter         = AddTextPrinterParameterized(&data->dialogWindow, 1, data->string, 0, 0, Options_GetTextFrameDelay(data->options), NULL);
        data->printDialogMsgState = 1;
        break;
    }
    case 1:
        if (!TextPrinterCheckActive(data->textPrinter)) {
            String_Delete(data->string);
            data->printDialogMsgState = 2;
        }
        break;
    case 2:
        if (waitButtonMode == 0) {
            if ((gSystem.newKeys & PAD_BUTTON_A) == TRUE) {
                data->lastInputWasTouch = FALSE;
                PlaySE(SEQ_SE_DP_SELECT);
                ret = TRUE;
            }
        } else {
            ret = TRUE;
        }
        if (ret != FALSE) {
            RemoveWindow(&data->dialogWindow);
            data->printDialogMsgState = 0;
        }
        break;
    }

    return ret;
}

static BOOL OakSpeech_PrintAndFadeFullScreenText(OakSpeechData *data, int msgNum, int kind, int y, int height) {
    BOOL ret = FALSE;
    WindowTemplate windowTemplate;

    switch (data->printAndFadeFullScreenTextState) {
    case 0:
        ToggleBgLayer(GF_BG_LYR_MAIN_0, GF_PLANE_TOGGLE_OFF);
        data->string = String_New(0x400, data->heapId);
        ReadMsgDataIntoString(data->msgData, msgNum, data->string);
        if (y == 0xFFFF) {
            y = (24 - (2 * String_CountLines(data->string))) / 2;
        }
        if (height == 0xFFFF) {
            height = 2 * String_CountLines(data->string);
        }
        switch (kind) {
        case 1:
            windowTemplate        = ov53_021E8520;
            windowTemplate.top    = y;
            windowTemplate.height = height;
            AddWindow(data->bgConfig, &data->fullScreenMsgWindow, &windowTemplate);
            FillWindowPixelRect(&data->fullScreenMsgWindow, 0, 0, 0, 0xC0, 0xC0);
            AddTextPrinterParameterizedWithColor(&data->fullScreenMsgWindow, 0, data->string, 0, 0, TEXT_SPEED_INSTANT, MAKE_TEXT_COLOR(1, 2, 0), NULL);
            break;
        case 0:
        case 2:
        case 3:
            windowTemplate        = ov53_021E8528;
            windowTemplate.top    = y;
            windowTemplate.height = height;
            if (kind == 3) {
                windowTemplate.left += 4;
            }
            AddWindow(data->bgConfig, &data->fullScreenMsgWindow, &windowTemplate);
            FillWindowPixelRect(&data->fullScreenMsgWindow, 0, 0, 0, 0xC0, 0xC0);
            AddTextPrinterParameterizedWithColor(&data->fullScreenMsgWindow, 0, data->string, 0, 0, TEXT_SPEED_INSTANT, MAKE_TEXT_COLOR(15, 2, 0), NULL);
            break;
        }
        String_Delete(data->string);
        data->printAndFadeFullScreenTextState = 1;
        break;
    case 1:
        CopyWindowToVram(&data->fullScreenMsgWindow);
        data->printAndFadeFullScreenTextState = 2;
        break;
    case 2:
        if (OakSpeech_BlendLayer(data, GF_BG_LYR_MAIN_0, FALSE) == TRUE) {
            data->printAndFadeFullScreenTextState = 3;
            if (kind == 2) {
                data->printAndFadeFullScreenTextState = 4;
                ret                                   = TRUE;
            }
        }
        break;
    case 3:
        if ((gSystem.newKeys & PAD_BUTTON_A) == PAD_BUTTON_A || (gSystem.newKeys & PAD_BUTTON_B) == PAD_BUTTON_B) {
            data->lastInputWasTouch = (gSystem.touchNew) ? TRUE : FALSE;
            PlaySE(SEQ_SE_DP_SELECT);
            data->printAndFadeFullScreenTextState = 4;
        }
        break;
    case 4:
        if (OakSpeech_BlendLayer(data, GF_BG_LYR_MAIN_0, TRUE) == TRUE) {
            data->printAndFadeFullScreenTextState = 5;
        }
        break;
    case 5:
        RemoveWindow(&data->fullScreenMsgWindow);
        BgClearTilemapBufferAndCommit(data->bgConfig, GF_BG_LYR_MAIN_0);
        data->printAndFadeFullScreenTextState = 0;
        ret                                   = TRUE;
        break;
    }

    return ret;
}

static BOOL OakSpeech_PrintAndFadeCenteredFullScreenText(OakSpeechData *data, int msgNum, int kind) {
    return OakSpeech_PrintAndFadeFullScreenText(data, msgNum, kind, 0xFFFF, 0xFFFF);
}

static const WindowTemplate sMultichoiceMenuButtonWindowTemplates[][3] = {
    {
     {
            .bgId     = GF_BG_LYR_SUB_0,
            .left     = 2,
            .top      = 6,
            .width    = 13,
            .height   = 3,
            .palette  = 14,
            .baseTile = 0x001,
        },
     {
            .bgId     = GF_BG_LYR_SUB_0,
            .left     = 2,
            .top      = 16,
            .width    = 13,
            .height   = 3,
            .palette  = 14,
            .baseTile = 0x036,
        },
     },
    {
     {
            .bgId     = GF_BG_LYR_SUB_0,
            .left     = 7,
            .top      = 3,
            .width    = 18,
            .height   = 3,
            .palette  = 14,
            .baseTile = 0x001,
        },
     {
            .bgId     = GF_BG_LYR_SUB_0,
            .left     = 7,
            .top      = 10,
            .width    = 18,
            .height   = 3,
            .palette  = 14,
            .baseTile = 0x037,
        },
     {
            .bgId     = GF_BG_LYR_SUB_0,
            .left     = 7,
            .top      = 17,
            .width    = 18,
            .height   = 3,
            .palette  = 14,
            .baseTile = 0x06D,
        },
     },
};

static void OakSpeech_PrintMultichoiceMenu(OakSpeechData *data, int msg1, int msg2, int msg3, int numChoices) {
    int msgIds[3];
    int i;
    int x;
    int y;
    String *string;

    msgIds[0] = msg1;
    msgIds[1] = msg2;
    msgIds[2] = msg3;

    data->numMultichoiceOptions = numChoices;
    if (numChoices == 2) {
        y = 4;
    }
    if (numChoices == 3) {
        y = 8;
    }
    for (i = 0; i < numChoices; ++i) {
        string = String_New(0x400, data->heapId);
        ReadMsgDataIntoString(data->msgData, msgIds[i], string);
        x = FontID_String_GetWidth(0, string, 0);
        AddWindow(data->bgConfig, &data->multichoiceMenuButtonWindows[i], &sMultichoiceMenuButtonWindowTemplates[numChoices - 2][i]);
        FillWindowPixelRect(&data->multichoiceMenuButtonWindows[i], 0, 0, 0, 0xC0, 0xC0);
        AddTextPrinterParameterizedWithColor(&data->multichoiceMenuButtonWindows[i], 4, string, (sMultichoiceMenuButtonWindowTemplates[numChoices - 2][i].width * 8 - x) / 2, y, TEXT_SPEED_INSTANT, MAKE_TEXT_COLOR(15, 1, 0), NULL);
        CopyWindowToVram(&data->multichoiceMenuButtonWindows[i]);
        String_Delete(string);
    }
}

static void OakSpeech_FreeWindows(OakSpeechData *data) {
    for (int i = 0; i < data->numMultichoiceOptions; ++i) {
        RemoveWindow(&data->multichoiceMenuButtonWindows[i]);
    }
    BgClearTilemapBufferAndCommit(data->bgConfig, GF_BG_LYR_MAIN_0);
}

static void OakSpeech_LoadButtonTutorialGfx(OakSpeechData *data) {
    int plttId_Main;
    int plttId_Sub;
    NNSG2dPaletteData *plttData;
    void *plttData_raw;

    GfGfxLoader_LoadCharData(NARC_demo_intro_intro, NARC_intro_intro_00000000_NCGR, data->bgConfig, GF_BG_LYR_MAIN_3, 0, 0, FALSE, data->heapId);
    BG_ClearCharDataRange(GF_BG_LYR_MAIN_0, 0x20, 0, data->heapId);
    GfGfxLoader_LoadCharData(NARC_demo_intro_intro, NARC_intro_intro_00000032_NCGR, data->bgConfig, GF_BG_LYR_SUB_3, 0, 0, FALSE, data->heapId);
    if (gGameVersion == VERSION_HEARTGOLD) {
        plttId_Main = NARC_intro_intro_00000001_NCLR;
        plttId_Sub  = NARC_intro_intro_00000030_NCLR;
    } else {
        plttId_Main = NARC_intro_intro_00000002_NCLR;
        plttId_Sub  = NARC_intro_intro_00000031_NCLR;
    }
    GfGfxLoader_GXLoadPal(NARC_demo_intro_intro, plttId_Main, GF_PAL_LOCATION_MAIN_BG, (enum GFPalSlotOffset)0, 0x60, data->heapId);
    GfGfxLoader_GXLoadPal(NARC_demo_intro_intro, plttId_Sub, GF_PAL_LOCATION_SUB_BG, (enum GFPalSlotOffset)0, 0xA0, data->heapId);

    plttData_raw                          = GfGfxLoader_GetPlttData(NARC_demo_intro_intro, plttId_Sub, &plttData, data->heapId);
    data->genderSelectFrameDefaultPalette = ((const u16 *)plttData->pRawData)[12];
    FreeToHeap(plttData_raw);

    OakSpeech_SetButtonTutorialScreenLayout(data, 1);
    OakSpeech_DrawPicOnBgLayer(data, OAK_SPEECH_PIC_NONE, OAK_SPEECH_PIC_NONE); // effectively a nop
    ov53_021E67C4(data, 0);
    BG_SetMaskColor(GF_BG_LYR_MAIN_0, RGB_BLACK);
    BG_SetMaskColor(GF_BG_LYR_SUB_0, RGB_BLACK);
}

static void OakSpeech_SetButtonTutorialScreenLayout(OakSpeechData *data, int a1) {
    int sp10[6];
    ARRAY_ASSIGN(sp10, sButtonTutorialNSCR);

    if (a1 < 6) {
        GfGfxLoader_LoadScrnData(NARC_demo_intro_intro, sp10[a1], data->bgConfig, GF_BG_LYR_MAIN_3, 0, 0, FALSE, data->heapId);
    }
}

static void OakSpeech_DrawPicOnBgLayer(OakSpeechData *data, int layer1pic, int layer2pic) {
    int sp10[10][2];
    ARRAY_ASSIGN(sp10, sBgPicNCGR_NCLR);

    if (layer1pic != 0 && layer2pic < 12) { // possible typo?
        GfGfxLoader_LoadCharData(NARC_demo_intro_intro, sp10[layer1pic][0], data->bgConfig, GF_BG_LYR_MAIN_1, 0, 0, FALSE, data->heapId);
        GfGfxLoader_GXLoadPal(NARC_demo_intro_intro, sp10[layer1pic][1], GF_PAL_LOCATION_MAIN_BG, (enum GFPalSlotOffset)0xE0, 32, data->heapId);
        GfGfxLoader_LoadScrnData(NARC_demo_intro_intro, 9, data->bgConfig, GF_BG_LYR_MAIN_1, 0, 0, FALSE, data->heapId);
        OakSpeech_FillBgLayerWithPalette(data, GF_BG_LYR_MAIN_1, 7);
    }

    if (layer2pic != 0 && layer2pic < 12) {
        GfGfxLoader_LoadCharData(NARC_demo_intro_intro, sp10[layer2pic][0], data->bgConfig, GF_BG_LYR_MAIN_2, 0, 0, FALSE, data->heapId);
        GfGfxLoader_GXLoadPal(NARC_demo_intro_intro, sp10[layer2pic][1], GF_PAL_LOCATION_MAIN_BG, (enum GFPalSlotOffset)0x100, 32, data->heapId);
        GfGfxLoader_LoadScrnData(NARC_demo_intro_intro, NARC_intro_intro_00000009_NSCR, data->bgConfig, GF_BG_LYR_MAIN_2, 0, 0, FALSE, data->heapId);
        OakSpeech_FillBgLayerWithPalette(data, GF_BG_LYR_MAIN_2, 8);
    }
}

static void ov53_021E67C4(OakSpeechData *data, int a1) {
    int sp10[5];
    ARRAY_ASSIGN(sp10, ov53_021E8558);

    if (a1 < 5) {
        GfGfxLoader_LoadScrnData(NARC_demo_intro_intro, sp10[a1], data->bgConfig, GF_BG_LYR_SUB_3, 0, 0, FALSE, data->heapId);
        if (a1 == 1) {
            OakSpeech_FillBgLayerWithPalette(data, GF_BG_LYR_SUB_3, 3);
        } else if (a1 == 2) {
            OakSpeech_FillBgLayerWithPalette(data, GF_BG_LYR_SUB_3, 2);
        }
    }
}

static void ov53_021E6824(OakSpeechData *data, int a1) {
    int sp10[3][2];
    ARRAY_ASSIGN(sp10, ov53_021E8584);

    GfGfxLoader_LoadScrnData(NARC_demo_intro_intro, sp10[a1][0], data->bgConfig, GF_BG_LYR_SUB_2, 0, 0, FALSE, data->heapId);
    OakSpeech_FillBgLayerWithPalette(data, GF_BG_LYR_SUB_2, 7);
    GfGfxLoader_GXLoadPal(NARC_demo_intro_intro, NARC_intro_intro_00000033_NCLR, GF_PAL_LOCATION_SUB_BG, (enum GFPalSlotOffset)0xE0, 0x60, data->heapId);
    BG_ClearCharDataRange(GF_BG_LYR_SUB_2, 0x20, 0, data->heapId);
    GfGfxLoader_LoadCharData(NARC_demo_intro_intro, sp10[a1][1], data->bgConfig, GF_BG_LYR_SUB_2, 0, 0, FALSE, data->heapId);
    ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_SUB_1, BG_POS_OP_SET_Y, 0);
    if (a1 == 1) {
        if (data->playerGender == PLAYER_GENDER_MALE) {
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_SUB_0, BG_POS_OP_SET_X, 0x88);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_SUB_2, BG_POS_OP_SET_X, 0x88);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_SUB_1, BG_POS_OP_SET_X, 0x88);
        } else {
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_SUB_0, BG_POS_OP_SET_X, 0x00);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_SUB_2, BG_POS_OP_SET_X, 0x00);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_SUB_1, BG_POS_OP_SET_X, 0x00);
        }
    }
}

static void OakSpeech_InitMultichoiceMenu(OakSpeechMultichoice *dest, int menuId) {
    dest->cursorPos      = 0;
    dest->unk_0          = 0;
    dest->numOptions     = sMultichoiceMenuParam[menuId][1];
    dest->pressDelay     = 0;
    dest->flashDelay     = 0;
    dest->flashFramesPer = 16;
    dest->inPadMode      = 0;
}

static void OakSpeech_InitMultichoiceMenuWithFrameFlash(OakSpeechData *data, int menuId) {
    data->menuData.unk_0          = 0;
    data->menuData.numOptions     = sMultichoiceMenuParam[menuId][1];
    data->menuData.flashDelay     = 0;
    data->menuData.flashFramesPer = 16;
    GfGfxLoader_LoadScrnData(NARC_demo_intro_intro, sMultichoiceMenuParam[menuId][0], data->bgConfig, GF_BG_LYR_SUB_1, 0, 0, FALSE, data->heapId);
    GfGfxLoader_LoadCharData(NARC_demo_intro_intro, NARC_intro_intro_00000042_NCGR, data->bgConfig, GF_BG_LYR_SUB_1, 0, 0, FALSE, data->heapId);
}

static int OakSpeech_MultichoiceMenuHandleInputVertical(OakSpeechData *data, int menuId) {
    int ret = -1;
    int hitbox;

    TouchscreenHitbox hitboxes[3][4];
    ARRAY_ASSIGN(hitboxes, ov53_021E8650);

    if (data->menuData.pressDelay != 0) {
        ++data->menuData.pressDelay;
        if (data->menuData.pressDelay > 20) {
            data->menuData.pressDelay = 0;
            ret                       = data->menuData.cursorPos;
        }
    } else if (gSystem.touchNew) {
        hitbox = TouchscreenHitbox_FindRectAtTouchNew(hitboxes[menuId]);
        if (hitbox != -1) {
            OakSpeech_InitMultichoiceMenuWithFrameFlash(data, menuId);
            ToggleBgLayer(GF_BG_LYR_SUB_1, GF_PLANE_TOGGLE_ON);
            data->menuData.cursorPos = hitbox;
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_SUB_1, BG_POS_OP_SET_Y, ov53_021E8604[menuId][data->menuData.cursorPos]);
            data->menuData.pressDelay     = 1;
            data->menuData.flashFramesPer = 2;
            PlaySE(SEQ_SE_DP_SELECT);
        }
    } else if (data->menuData.inPadMode == 0) {
        if (gSystem.newKeys & (PAD_BUTTON_A | PAD_BUTTON_B | PAD_KEY_UP | PAD_KEY_DOWN)) {
            PlaySE(SEQ_SE_DP_SELECT);
            OakSpeech_InitMultichoiceMenuWithFrameFlash(data, menuId);
            ToggleBgLayer(GF_BG_LYR_SUB_1, GF_PLANE_TOGGLE_ON);
            data->menuData.inPadMode = 1;
        }
    } else if (gSystem.newKeys & PAD_KEY_UP) {
        if (data->menuData.cursorPos != 0) {
            --data->menuData.cursorPos;
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_SUB_1, BG_POS_OP_SET_Y, ov53_021E8604[menuId][data->menuData.cursorPos]);
            PlaySE(SEQ_SE_DP_SELECT);
        }
    } else if (gSystem.newKeys & PAD_KEY_DOWN) {
        if (data->menuData.cursorPos != data->menuData.numOptions - 1) {
            ++data->menuData.cursorPos;
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_SUB_1, BG_POS_OP_SET_Y, ov53_021E8604[menuId][data->menuData.cursorPos]);
            PlaySE(SEQ_SE_DP_SELECT);
        }
    } else if (gSystem.newKeys & PAD_BUTTON_A) {
        data->menuData.pressDelay     = 1;
        data->menuData.flashFramesPer = 2;
        PlaySE(SEQ_SE_DP_SELECT);
    } else if (gSystem.newKeys & PAD_BUTTON_B) {
        data->menuData.cursorPos      = data->menuData.numOptions - 1;
        data->menuData.pressDelay     = 1;
        data->menuData.flashFramesPer = 2;
        ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_SUB_1, BG_POS_OP_SET_Y, ov53_021E8604[menuId][data->menuData.cursorPos]);
        PlaySE(SEQ_SE_DP_SELECT);
    }
    if (data->menuData.pressDelay) {
        ++data->menuData.flashDelay;
        if (data->menuData.flashDelay > data->menuData.flashFramesPer) {
            data->menuData.flashState ^= 1;
            data->menuData.flashDelay = 0;
            if (data->menuData.flashState != 0) {
                ToggleBgLayer(GF_BG_LYR_SUB_1, GF_PLANE_TOGGLE_ON);
            } else {
                ToggleBgLayer(GF_BG_LYR_SUB_1, GF_PLANE_TOGGLE_OFF);
            }
        }
    }

    return ret;
}

static u16 OakSpeech_AdditiveTransformColor(u16 pltt, s8 delta) {
    int r = pltt & 0x1F;
    int g = (pltt >> 5) & 0x1F;
    int b = (pltt >> 10);

    r += delta;
    g += delta;
    b += delta;

    if (r > 31) {
        r = 31;
    } else if (r < 0) {
        r = 0;
    }
    if (g > 31) {
        g = 31;
    } else if (g < 0) {
        g = 0;
    }
    if (b > 31) {
        b = 31;
    } else if (b < 0) {
        b = 0;
    }
    return (b << 10) | (g << 5) | r;
}

static void OakSpeech_BlinkHighlightedGenderFrame(OakSpeechData *data, int reset) {
    int brightnessMod = 0;
    u16 plttBuf[2];

    GF_ASSERT(data->menuData.cursorPos == 0 || data->menuData.cursorPos == 1);
    if (reset == 0) {
        brightnessMod = (GF_SinDeg((data->genderSelectFrameBlinkTimer++) * 10) * 8) >> FX32_SHIFT;
    } else {
        data->genderSelectFrameBlinkTimer = 0;
    }
    plttBuf[0] = OakSpeech_AdditiveTransformColor(data->genderSelectFrameDefaultPalette, brightnessMod);
    plttBuf[1] = OakSpeech_AdditiveTransformColor(RGB(31, 7, 7), 0);
    BG_LoadPlttData(GF_BG_LYR_SUB_2, plttBuf, sizeof(plttBuf), sButtonBlinkPalOffsets[data->menuData.cursorPos] * 2);
    plttBuf[0] = data->genderSelectFrameDefaultPalette;
    plttBuf[1] = RGB(27, 28, 28);
    BG_LoadPlttData(GF_BG_LYR_SUB_2, plttBuf, sizeof(plttBuf), sButtonBlinkPalOffsets[!data->menuData.cursorPos] * 2);
}

static void OakSpeech_StopHighlightedGenderFrameBlink(OakSpeechData *data) {
    u16 plttBuf[2];

    plttBuf[0] = data->genderSelectFrameDefaultPalette;
    plttBuf[1] = RGB(27, 28, 28);
    BG_LoadPlttData(GF_BG_LYR_SUB_2, plttBuf, sizeof(plttBuf), sButtonBlinkPalOffsets[0] * 2);
    BG_LoadPlttData(GF_BG_LYR_SUB_2, plttBuf, sizeof(plttBuf), sButtonBlinkPalOffsets[1] * 2);
}

static BOOL OakSpeech_GenderSelectHandleInput(OakSpeechData *data) {
    BOOL ret = FALSE;
    int hitbox;

    TouchscreenHitbox hitboxes[3];
    ARRAY_ASSIGN(hitboxes, sTouchscreenHitboxes_GenderSelect);

    if (gSystem.touchNew) {
        hitbox = TouchscreenHitbox_FindRectAtTouchNew(hitboxes);
        if (hitbox != -1) {
            data->menuData.cursorPos      = hitbox;
            data->menuData.pressDelay     = 1;
            data->menuData.flashFramesPer = 2;
            OakSpeech_BlinkHighlightedGenderFrame(data, 1);
            PlaySE(SEQ_SE_DP_SELECT);
            data->lastChosenGender = hitbox;
            ret                    = TRUE;
        }
    } else if (!data->menuData.inPadMode) {
        if (gSystem.newKeys & (PAD_BUTTON_A | PAD_KEY_LEFT | PAD_KEY_RIGHT)) {
            PlaySE(SEQ_SE_DP_SELECT);
            data->menuData.inPadMode = 1;
            OakSpeech_BlinkHighlightedGenderFrame(data, 1);
        }
    } else {
        OakSpeech_BlinkHighlightedGenderFrame(data, 0);
        if (gSystem.newKeys & PAD_KEY_LEFT) {
            if (data->menuData.cursorPos != 0) {
                --data->menuData.cursorPos;
                PlaySE(SEQ_SE_DP_SELECT);
            }
        } else if (gSystem.newKeys & PAD_KEY_RIGHT) {
            if (data->menuData.cursorPos != data->menuData.numOptions - 1) {
                ++data->menuData.cursorPos;
                PlaySE(SEQ_SE_DP_SELECT);
            }
        } else if (gSystem.newKeys & PAD_BUTTON_A) {
            data->menuData.inPadMode      = 0;
            data->menuData.pressDelay     = 1;
            data->menuData.flashFramesPer = 2;
            OakSpeech_BlinkHighlightedGenderFrame(data, 1);
            PlaySE(SEQ_SE_DP_SELECT);
            ret                    = TRUE;
            data->lastChosenGender = data->menuData.cursorPos;
        }
    }

    return ret;
}

static void ov53_021E6DF0(OakSpeechData *data) {
    data->playerPicShrinkAnimStep  = 0;
    data->playerPicShrinkAnimDelay = 0;
}

static BOOL OakSpeech_PlayerPicShrinkAnim(OakSpeechData *data) {
    BOOL ret = FALSE;
    int gfxId;

    if (data->playerPicShrinkAnimDelay != 0) {
        --data->playerPicShrinkAnimDelay;
    } else {
        ++data->playerPicShrinkAnimStep;
        data->playerPicShrinkAnimDelay = 8;
    }
    if (data->playerGender == PLAYER_GENDER_MALE) {
        int sp28[6];
        ARRAY_ASSIGN(sp28, sPlayerPicShrinkGfx_Male);
        gfxId = sp28[data->playerPicShrinkAnimStep];
    } else {
        int sp10[6];
        ARRAY_ASSIGN(sp10, sPlayerPicShrinkGfx_Female);
        gfxId = sp10[data->playerPicShrinkAnimStep];
    }
    if (gfxId == 0xFF) {
        ret = TRUE;
    } else {
        GfGfxLoader_LoadCharData(NARC_demo_intro_intro, gfxId, data->bgConfig, GF_BG_LYR_MAIN_1, 0, 0, FALSE, data->heapId);
    }

    return ret;
}

static int OakSpeech_GetTimeOfDayIntroMsg(void) {
    RTCDate date;
    RTCTime time;
    int ret = msg_0219_00001;
    GF_RTC_CopyDateTime(&date, &time);
    u32 time_hhmm = time.minute + time.hour * 100;
    if (time_hhmm >= 400 && time_hhmm <= 1059) {
        ret = msg_0219_00001;
    } else if (time_hhmm >= 1100 && time_hhmm <= 1559) {
        ret = msg_0219_00002;
    } else if (time_hhmm >= 1600 && time_hhmm <= 1859) {
        ret = msg_0219_00003;
    } else if (time_hhmm >= 1900 && time_hhmm <= 2359) {
        ret = msg_0219_00004;
    } else if (time_hhmm >= 0 && time_hhmm <= 359) {
        ret = msg_0219_00005;
    }
    return ret;
}

static BOOL ov53_021E6F00(OakSpeechData *data, int a1, int a2) {
    switch (data->unk_174) {
    case 0:
        data->unk_174 = 1;
        data->unk_176 = ov53_021E853C[a2][0];
        break;
    case 1:
        data->unk_176 += ov53_021E853C[a2][2];
        if (ov53_021E853C[a2][2] > 0) {
            if (data->unk_176 >= ov53_021E853C[a2][1]) {
                data->unk_176 = ov53_021E853C[a2][1];
                data->unk_174 = 2;
            }
        } else {
            if (data->unk_176 <= ov53_021E853C[a2][1]) {
                data->unk_176 = ov53_021E853C[a2][1];
                data->unk_174 = 2;
            }
        }
        BgSetPosTextAndCommit(data->bgConfig, a1, BG_POS_OP_SET_X, data->unk_176);
        break;
    case 2:
        data->unk_174 = 0;
        return TRUE;
    }

    return FALSE;
}

static BOOL OakSpeech_DoMainTask(OakSpeechData *data) {
    BOOL ret = FALSE;

    switch (data->state) {
    case 0:
        ToggleBgLayer(GF_BG_LYR_SUB_2, GF_PLANE_TOGGLE_OFF);
        sub_02004EC4(2, SEQ_GS_POKEMON_THEME, 1);
        StopBGM(SEQ_GS_POKEMON_THEME, 0);
        PlayBGM(SEQ_GS_STARTING);
        data->state = 7;
        break;
    case 7:
        ov53_021E6824(data, 0);
        OakSpeech_SetButtonTutorialScreenLayout(data, 1);
        ov53_021E67C4(data, 0);
        ToggleBgLayer(GF_BG_LYR_MAIN_3, GF_PLANE_TOGGLE_ON);
        ToggleBgLayer(GF_BG_LYR_MAIN_0, GF_PLANE_TOGGLE_ON);
        ToggleBgLayer(GF_BG_LYR_SUB_0, GF_PLANE_TOGGLE_ON);
        ToggleBgLayer(GF_BG_LYR_SUB_3, GF_PLANE_TOGGLE_ON);
        BeginNormalPaletteFade(0, 1, 1, RGB_BLACK, 6, 1, data->heapId);
        data->state = 1;
        break;
    case 1:
        if (IsPaletteFadeFinished() == TRUE && OakSpeech_WaitFrames(data, 40) == TRUE) {
            data->state = 2;
        }
        break;
    case 2:
        if (OakSpeech_PrintAndFadeCenteredFullScreenText(data, msg_0219_00007, 2) == TRUE) {
            ToggleBgLayer(GF_BG_LYR_SUB_2, GF_PLANE_TOGGLE_ON);
            data->state = 3;
            OakSpeech_PrintMultichoiceMenu(data, msg_0219_00044, msg_0219_00045, msg_0219_00046, 3);
            data->menuData.inPadMode = 0;
            data->menuData.cursorPos = 0;
        }
        break;
    case 3:
        if (OakSpeech_MultichoiceMenuHandleInputVertical(data, 0) != -1) {
            data->state = 4;
        }
        break;
    case 4:
        if (OakSpeech_PrintAndFadeCenteredFullScreenText(data, msg_0219_00007, 2) == TRUE) {
            OakSpeech_FreeWindows(data);
            ToggleBgLayer(GF_BG_LYR_SUB_0, GF_PLANE_TOGGLE_OFF);
            ToggleBgLayer(GF_BG_LYR_SUB_2, GF_PLANE_TOGGLE_OFF);
            ToggleBgLayer(GF_BG_LYR_SUB_1, GF_PLANE_TOGGLE_OFF);
            data->state = 5;
        }
        break;
    case 5:
        BeginNormalPaletteFade(0, 0, 0, RGB_BLACK, 6, 1, data->heapId);
        data->state = 6;
        break;
    case 6:
        if (IsPaletteFadeFinished() == TRUE) {
            switch (data->menuData.cursorPos) {
            case 0: // CONTROL INFO
                data->state = 8;
                break;
            case 1: // ADVENTURE INFO
                data->state = 34;
                break;
            case 2: // NO INFO NEEDED
                data->state = 44;
                break;
            }
        }
        break;

    // CONTROL INFO
    case 8:
        BgClearTilemapBufferAndCommit(data->bgConfig, GF_BG_LYR_SUB_0);
        OakSpeech_SetButtonTutorialScreenLayout(data, 1);
        ov53_021E67C4(data, 1);
        ov53_021E7E08(data, 1);
        ToggleBgLayer(GF_BG_LYR_SUB_0, GF_PLANE_TOGGLE_ON);
        ToggleBgLayer(GF_BG_LYR_SUB_3, GF_PLANE_TOGGLE_ON);
        BeginNormalPaletteFade(0, 1, 1, RGB_BLACK, 6, 1, data->heapId);
        data->state = 9;
        break;
    case 9:
        if (IsPaletteFadeFinished() == TRUE) {
            data->state = 11;
        }
        break;
    case 11:
        if (OakSpeech_PrintAndFadeCenteredFullScreenText(data, msg_0219_00009, 0) == TRUE) {
            data->state = 12;
        }
        break;
    case 12:
        if (OakSpeech_PrintAndFadeCenteredFullScreenText(data, msg_0219_00010, 0) == TRUE) {
            data->state = 13;
        }
        break;
    case 13:
        if (OakSpeech_PrintAndFadeCenteredFullScreenText(data, msg_0219_00011, 0) == TRUE) {
            data->state = 14;
        }
        break;
    case 14:
        if (OakSpeech_PrintAndFadeCenteredFullScreenText(data, msg_0219_00012, 0) == TRUE) {
            data->state = 15;
        }
        break;
    case 15:
        if (OakSpeech_PrintAndFadeCenteredFullScreenText(data, msg_0219_00023, 2) == TRUE) {
            ToggleBgLayer(GF_BG_LYR_MAIN_0, GF_PLANE_TOGGLE_ON);
            data->state = 16;
        }
        break;
    case 16:
        if (OakSpeech_PrintDialogMsg(data, msg_0219_00025, 0) == TRUE) {
            data->state = 17;
        }
        break;
    case 17:
        if (OakSpeech_PrintAndFadeCenteredFullScreenText(data, msg_0219_00013, 0) == TRUE) {
            OakSpeech_SetButtonTutorialScreenLayout(data, 2);
            data->state = 18;
        }
        break;
    case 18:
        if (OakSpeech_PrintAndFadeCenteredFullScreenText(data, msg_0219_00014, 3) == TRUE) {
            OakSpeech_SetButtonTutorialScreenLayout(data, 1);
            data->state = 19;
        }
        break;
    case 19:
        if (OakSpeech_PrintAndFadeCenteredFullScreenText(data, msg_0219_00015, 0) == TRUE) {
            OakSpeech_SetButtonTutorialScreenLayout(data, 3);
            data->state = 20;
        }
        break;
    case 20:
        if (OakSpeech_PrintAndFadeCenteredFullScreenText(data, msg_0219_00016, 3) == TRUE) {
            OakSpeech_SetButtonTutorialScreenLayout(data, 4);
            data->state = 21;
        }
        break;
    case 21:
        if (OakSpeech_PrintAndFadeCenteredFullScreenText(data, msg_0219_00017, 3) == TRUE) {
            data->state = 22;
            ToggleBgLayer(GF_BG_LYR_MAIN_0, GF_PLANE_TOGGLE_ON);
            OakSpeech_SetButtonTutorialScreenLayout(data, 1);
        }
        break;
    case 22:
        if (OakSpeech_PrintDialogMsg(data, msg_0219_00026, 1) == TRUE) {
            data->state = 23;
        }
        break;
    case 23:
        ov53_021E7E08(data, 0);
        BgClearTilemapBufferAndCommit(data->bgConfig, GF_BG_LYR_SUB_0);
        ov53_021E816C(data->unk_178, 7);
        ov53_021E81F4(data->unk_178, NARC_msg_msg_0219_bin, msg_0219_00061, msg_0219_00062);
        data->state = 24;
        break;
    case 24:
        switch (ov53_021E8248(data->unk_178)) {
        case YESNORESPONSE_YES:
            data->state = 27;
            break;
        case YESNORESPONSE_NO:
            data->state = 29;
            break;
        }
        break;
    case 27:
        if (OakSpeech_BlendLayer(data, GF_BG_LYR_SUB_2, TRUE) == TRUE) {
            BeginNormalPaletteFade(0, 0, 0, RGB_BLACK, 6, 1, data->heapId);
            data->state = 28;
        }
        break;
    case 28:
        if (IsPaletteFadeFinished() == TRUE) {
            ov53_021E7D58(data);
            data->state = 7;
        }
        break;
    case 29:
        if (OakSpeech_BlendLayer(data, GF_BG_LYR_SUB_2, TRUE) == TRUE) {
            ov53_021E7E08(data, 3);
            ToggleBgLayer(GF_BG_LYR_SUB_2, GF_PLANE_TOGGLE_OFF);
            ov53_021E7D58(data);
            data->state = 8;
        }
        break;

    // ADVENTURE INFO
    case 34:
        OakSpeech_SetButtonTutorialScreenLayout(data, 5);
        ov53_021E67C4(data, 2);
        ov53_021E7D58(data);
        ov53_021E7E08(data, 1);
        ToggleBgLayer(GF_BG_LYR_SUB_0, GF_PLANE_TOGGLE_ON);
        ToggleBgLayer(GF_BG_LYR_SUB_3, GF_PLANE_TOGGLE_ON);
        BeginNormalPaletteFade(0, 1, 1, RGB_BLACK, 6, 1, data->heapId);
        data->state = 35;
        break;
    case 35:
        if (IsPaletteFadeFinished() == TRUE) {
            data->state = 36;
        }
        break;
    case 36:
        if (OakSpeech_PrintAndFadeCenteredFullScreenText(data, msg_0219_00028, 1) == TRUE) {
            data->state = 37;
        }
        break;
    case 37:
        if (OakSpeech_PrintAndFadeCenteredFullScreenText(data, msg_0219_00029, 1) == TRUE) {
            data->state = 38;
        }
        break;
    case 38:
        if (OakSpeech_PrintAndFadeCenteredFullScreenText(data, msg_0219_00030, 1) == TRUE) {
            data->state = 39;
        }
        break;
    case 39:
        if (OakSpeech_PrintAndFadeCenteredFullScreenText(data, msg_0219_00031, 1) == TRUE) {
            data->state = 40;
        }
        break;
    case 40:
        if (OakSpeech_PrintAndFadeCenteredFullScreenText(data, msg_0219_00032, 1) == TRUE) {
            data->state = 41;
        }
        break;
    case 41:
        if (OakSpeech_PrintAndFadeCenteredFullScreenText(data, msg_0219_00033, 1) == TRUE) {
            data->state = 42;
        }
        break;
    case 42:
        BeginNormalPaletteFade(0, 0, 0, RGB_BLACK, 6, 1, data->heapId);
        data->state = 43;
        break;
    case 43:
        if (IsPaletteFadeFinished() == TRUE) {
            ov53_021E7D58(data);
            ov53_021E7E08(data, 0);
            ToggleBgLayer(GF_BG_LYR_MAIN_0, GF_PLANE_TOGGLE_ON);
            data->state = 7;
        }
        break;

    // NO INFO NEEDED
    case 44:
        ov53_021E7D58(data);
        ov53_021E7E08(data, 1);
        OakSpeech_SetButtonTutorialScreenLayout(data, 0);
        BgClearTilemapBufferAndCommit(data->bgConfig, GF_BG_LYR_SUB_1);
        ToggleBgLayer(GF_BG_LYR_MAIN_0, GF_PLANE_TOGGLE_ON);
        ToggleBgLayer(GF_BG_LYR_MAIN_3, GF_PLANE_TOGGLE_OFF);
        ToggleBgLayer(GF_BG_LYR_SUB_0, GF_PLANE_TOGGLE_ON);
        ToggleBgLayer(GF_BG_LYR_SUB_3, GF_PLANE_TOGGLE_ON);
        data->state = 45;
        BeginNormalPaletteFade(0, 1, 1, RGB_BLACK, 6, 1, data->heapId);
        break;
    case 45:
        if (IsPaletteFadeFinished() == TRUE && OakSpeech_WaitFrames(data, 40) == TRUE) {
            data->state       = 46;
            data->queuedMsgId = OakSpeech_GetTimeOfDayIntroMsg();
        }
        break;
    case 46:
        if (OakSpeech_PrintDialogMsg(data, data->queuedMsgId, 1) == TRUE) {
            GF_SndStartFadeOutBGM(0, 6);
            data->state = 47;
        }
        break;
    case 47:
        if (GF_SndGetFadeTimer() == 0) {
            StopBGM(SEQ_GS_STARTING, 0);
            PlayBGM(SEQ_GS_STARTING2);
            OakSpeech_DrawPicOnBgLayer(data, OAK_SPEECH_PIC_OAK, OAK_SPEECH_PIC_NONE);
            ToggleBgLayer(GF_BG_LYR_MAIN_3, GF_PLANE_TOGGLE_ON);
            ToggleBgLayer(GF_BG_LYR_MAIN_1, GF_PLANE_TOGGLE_ON);
            StartBrightnessTransition(16, 0, -16, (GXBlendPlaneMask)(GX_BLEND_PLANEMASK_BG1 | GX_BLEND_PLANEMASK_BG3 | GX_BLEND_PLANEMASK_OBJ), SCREEN_MASK_MAIN);
            data->state = 48;
        }
        break;
    case 48:
        if (IsBrightnessTransitionActive(SCREEN_MASK_MAIN)) {
            data->state = 49;
        }
        break;
    case 49:
        if (OakSpeech_PrintDialogMsg(data, msg_0219_00006, 1) == TRUE) {
            data->state = 50;
        }
        break;
    case 50:
        if (ov53_021E6F00(data, 1, 0) == TRUE) {
            data->state = 51;
        }
        break;
    case 51:
        if (OakSpeech_PrintDialogMsg(data, msg_0219_00034, 1) == TRUE) {
            Set2dSpriteAnimSeqNo(data->sprites[5], 3);
            Sprite_SetPalIndex(data->sprites[5], 5);
            Set2dSpriteVisibleFlag(data->sprites[5], TRUE);
            data->state = 52;
        }
        break;
    case 52:
        if (OakSpeech_WaitFrames(data, 30) == TRUE) {
            StartBrightnessTransition(4, 0, 16, (GXBlendPlaneMask)(GX_BLEND_PLANEMASK_BG0 | GX_BLEND_PLANEMASK_BG1 | GX_BLEND_PLANEMASK_BG3 | GX_BLEND_PLANEMASK_OBJ), SCREEN_MASK_MAIN);
            StartBrightnessTransition(4, 0, 16, (GXBlendPlaneMask)(GX_BLEND_PLANEMASK_BG0 | GX_BLEND_PLANEMASK_BG2 | GX_BLEND_PLANEMASK_BG3 | GX_BLEND_PLANEMASK_OBJ), SCREEN_MASK_SUB);
            PlaySE(SEQ_SE_DP_BOWA2);
            data->playerPicShrinkAnimStep = 0;
            data->state                   = 53;
        }
        break;
    case 53:
        if (IsBrightnessTransitionActive(SCREEN_MASK_MAIN) == TRUE && IsBrightnessTransitionActive(SCREEN_MASK_SUB) == TRUE) {
            Set2dSpriteAnimSeqNo(data->sprites[5], 1);
            Sprite_SetPalIndex(data->sprites[5], 4);
            data->playerPicShrinkAnimStep = 16;
            G2_SetBlendBrightness(GX_BLEND_PLANEMASK_OBJ, data->playerPicShrinkAnimStep);
            data->state = 54;
        }
        break;
    case 54:
        if (!Sprite_IsCellAnimationRunning(data->sprites[5])) {
            --data->playerPicShrinkAnimStep;
            G2_SetBlendBrightness(GX_BLEND_PLANEMASK_OBJ, data->playerPicShrinkAnimStep);
            if (data->playerPicShrinkAnimStep == 0) {
                Set2dSpriteAnimSeqNo(data->sprites[5], 2);
                PlayCry(SPECIES_MARILL, 0);
                data->state = 55;
            }
        }
        break;
    case 55:
        if (OakSpeech_WaitFrames(data, 40) == TRUE) {
            data->state = 56;
        }
        break;
    case 56:
        if (OakSpeech_PrintDialogMsg(data, msg_0219_00035, 1) == TRUE) {
            data->state = 57;
        }
        break;
    case 57:
        if (OakSpeech_BlendLayer(data, 101, TRUE) == TRUE) {
            data->state = 58;
        }
        break;
    case 58:
        if (OakSpeech_WaitFrames(data, 30) == TRUE) {
            data->state = 59;
        }
        break;
    case 59:
        if (ov53_021E6F00(data, 1, 1) == TRUE) {
            data->state = 60;
        }
        break;
    case 60:
        if (OakSpeech_PrintDialogMsg(data, msg_0219_00036, 1) == TRUE) {
            data->state               = 61;
            data->menuData.cursorPos  = 0;
            data->menuData.numOptions = 2;
        }
        break;
    case 61:
        if (OakSpeech_PrintDialogMsg(data, msg_0219_00037, 1) == TRUE) {
            data->state = 62;
            BeginNormalPaletteFade(4, 0, 0, RGB_BLACK, 6, 1, data->heapId);
        }
        break;
    case 62:
        if (IsPaletteFadeFinished() == TRUE) {
            data->state = 63;
        }
        break;
    case 63:
        ov53_021E7E08(data, 0);
        ToggleBgLayer(GF_BG_LYR_SUB_0, GF_PLANE_TOGGLE_OFF);
        ov53_021E67C4(data, 4);
        ov53_021E80B8(data, 2);
        BgClearTilemapBufferAndCommit(data->bgConfig, GF_BG_LYR_SUB_2);
        BeginNormalPaletteFade(4, 1, 1, RGB_BLACK, 6, 1, data->heapId);
        data->state = 64;
        break;
    case 64:
        if (IsPaletteFadeFinished() == TRUE) {
            data->menuData.cursorPos = data->lastChosenGender;
            data->state              = 65;
        }
        break;
    case 65:
        if (OakSpeech_GenderSelectHandleInput(data)) {
            data->state        = 66;
            data->playerGender = data->menuData.cursorPos;
        }
        break;
    case 66:
        FillBgTilemapRect(data->bgConfig, GF_BG_LYR_SUB_3, 1, 16 * (data->menuData.cursorPos ^ 1), 0, 16, 23, 0);
        BgCommitTilemapBufferToVram(data->bgConfig, GF_BG_LYR_SUB_2);
        BgCommitTilemapBufferToVram(data->bgConfig, GF_BG_LYR_SUB_3);
        BgClearTilemapBufferAndCommit(data->bgConfig, GF_BG_LYR_SUB_0);
        ov53_021E80B8(data, data->playerGender);
        if (data->playerGender == PLAYER_GENDER_MALE) {
            data->queuedMsgId = msg_0219_00038;
        } else {
            data->queuedMsgId = msg_0219_00039;
        }
        data->state = 67;
        break;
    case 67:
        if (OakSpeech_PrintDialogMsg(data, data->queuedMsgId, 1) == TRUE) {
            data->state = 68;
        }
        break;
    case 68:
        OakSpeech_InitMultichoiceMenu(&data->menuData, 1);
        ov53_021E6824(data, 1);
        OakSpeech_PrintMultichoiceMenu(data, msg_0219_00047, msg_0219_00048, msg_0219_00000, 2);
        data->state              = 69;
        data->menuData.cursorPos = 0;
        break;

    case 69:
        ToggleBgLayer(GF_BG_LYR_SUB_0, GF_PLANE_TOGGLE_ON);
        ToggleBgLayer(GF_BG_LYR_SUB_2, GF_PLANE_TOGGLE_ON);
        if (OakSpeech_MultichoiceMenuHandleInputVertical(data, data->playerGender + 1) != -1) {
            OakSpeech_FreeWindows(data);
            data->state = 70;
        }
        break;
    case 70:
        switch (data->menuData.cursorPos) {
        case 0: // Yes
            data->state = 93;
            break;
        case 1: // No
            data->state = 71;
            BeginNormalPaletteFade(4, 0, 0, RGB_BLACK, 6, 1, data->heapId);
            break;
        }
        break;

    case 71:
        if (IsPaletteFadeFinished() == TRUE) {

            ToggleBgLayer(GF_BG_LYR_SUB_1, GF_PLANE_TOGGLE_OFF);
            ToggleBgLayer(GF_BG_LYR_SUB_2, GF_PLANE_TOGGLE_OFF);
            ov53_021E80B8(data, 3);
            ov53_021E67C4(data, 1);
            BgClearTilemapBufferAndCommit(data->bgConfig, GF_BG_LYR_SUB_0);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_SUB_0, BG_POS_OP_SET_X, 0);
            OakSpeech_StopHighlightedGenderFrameBlink(data);
            BeginNormalPaletteFade(4, 1, 1, RGB_BLACK, 6, 1, data->heapId);
            data->state = 72;
        }
        break;
    case 72:
        if (IsPaletteFadeFinished() == TRUE) {
            ov53_021E7E08(data, 1);
            data->state = 61;
        }
        break;

        // 73-92 don't exist

    case 93:
        if (OakSpeech_PrintDialogMsg(data, msg_0219_00040, 1) == TRUE) {
            data->state = 94;
        }
        break;

    case 94:
        if (OakSpeech_WaitFrames(data, 40)) {
            data->state = 95;
        }

        break;

    case 95:
        String_SetEmpty(data->namingScreenArgs_Player->unk18);
        data->namingScreenArgs_Player->unk4 = data->playerGender;
        data->overlayManager                = OverlayManager_New(&sOverlayTemplate_NamingScreen, data->namingScreenArgs_Player, data->heapId);
        data->state                         = 96;
        break;

    case 96:
        ToggleBgLayer(GF_BG_LYR_MAIN_0, GF_PLANE_TOGGLE_ON);
        ToggleBgLayer(GF_BG_LYR_MAIN_1, GF_PLANE_TOGGLE_ON);
        ToggleBgLayer(GF_BG_LYR_MAIN_3, GF_PLANE_TOGGLE_ON);
        ToggleBgLayer(GF_BG_LYR_SUB_0, GF_PLANE_TOGGLE_ON);
        ToggleBgLayer(GF_BG_LYR_SUB_3, GF_PLANE_TOGGLE_ON);
        ToggleBgLayer(GF_BG_LYR_SUB_2, GF_PLANE_TOGGLE_ON);
        BgSetPosTextAndCommit(data->bgConfig, GF_BG_LYR_MAIN_1, BG_POS_OP_SET_X, 0);
        ov53_021E7D04(data);
        BeginNormalPaletteFade(0, 1, 1, RGB_BLACK, 6, 1, data->heapId);
        data->state = 97;
        OakSpeech_DrawPicOnBgLayer(data, OAK_SPEECH_PIC_OAK, OAK_SPEECH_PIC_NONE);
        ov53_021E80B8(data, data->playerGender);
        if (data->playerGender == 0) {
            data->queuedMsgId = msg_0219_00041;
        } else {
            data->queuedMsgId = msg_0219_00042;
        }
        break;

    case 97:
        if (OakSpeech_PrintDialogMsg(data, data->queuedMsgId, 1) == TRUE) {
            data->state = 98;
            OakSpeech_InitMultichoiceMenu(&data->menuData, 1);
        }
        break;

    case 98:
        if (OakSpeech_MultichoiceMenuHandleInputVertical(data, data->playerGender + 1) != -1) {
            OakSpeech_FreeWindows(data);
            data->state = 99;
        }
        break;

    case 99:
        switch (data->menuData.cursorPos) {
        case 0: // Yes
            data->state = 100;
            break;
        case 1: // No
            BeginNormalPaletteFade(4, 0, 0, RGB_BLACK, 6, 1, data->heapId);
            data->state = 71;
            break;
        }
        break;

    case 100:
        BeginNormalPaletteFade(4, 0, 0, RGB_BLACK, 6, 1, data->heapId);
        data->state = 101;
        break;

    case 101:
        if (IsPaletteFadeFinished() == TRUE) {
            ToggleBgLayer(GF_BG_LYR_SUB_2, GF_PLANE_TOGGLE_OFF);
            ToggleBgLayer(GF_BG_LYR_SUB_1, GF_PLANE_TOGGLE_OFF);
            ov53_021E67C4(data, 1);
            ov53_021E80B8(data, 3);
            BgClearTilemapBufferAndCommit(data->bgConfig, GF_BG_LYR_SUB_0);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_SUB_0, BG_POS_OP_SET_X, 0);
            ov53_021E7E08(data, 1);
            BeginNormalPaletteFade(4, 1, 1, RGB_BLACK, 6, 1, data->heapId);
            data->state = 102;
        }

        break;

    case 102:
        if (IsPaletteFadeFinished() == TRUE) {
            data->state = 103;
        }
        break;

    case 103:
        if (OakSpeech_PrintDialogMsg(data, msg_0219_00043, 1) == TRUE) {
            data->state = 110;
        }
        break;

        // 104-109 don't exist

    case 110:
        BeginNormalPaletteFade(0, 0, 0, RGB_BLACK, 6, 1, data->heapId);
        data->state = 111;
        break;

    case 111:
        if (IsPaletteFadeFinished() == TRUE) {
            data->state = 120;
        }
        break;

        // 112-119 don't exist

    case 120:
        if (data->playerGender == PLAYER_GENDER_MALE) {
            OakSpeech_DrawPicOnBgLayer(data, OAK_SPEECH_PIC_ETHAN, OAK_SPEECH_PIC_NONE);
        } else {
            OakSpeech_DrawPicOnBgLayer(data, OAK_SPEECH_PIC_LYRA, OAK_SPEECH_PIC_NONE);
        }
        BeginNormalPaletteFade(0, 1, 1, RGB_BLACK, 6, 1, data->heapId);
        data->state = 121;
        ToggleBgLayer(GF_BG_LYR_MAIN_0, GF_PLANE_TOGGLE_OFF);
        break;

    case 121:
        if (IsPaletteFadeFinished() == TRUE) {
            data->state = 123;
        }
        // Fallthrough into case 123

        // 122 doesn't exist

    case 123:
        data->state = 124;
        break;

    case 124:
        ov53_021E7E08(data, 0);
        ov53_021E6DF0(data);
        data->state = 125;
        break;

    case 125:
        if (OakSpeech_WaitFrames(data, 30) == TRUE) {
            PlaySE(SEQ_SE_GS_HERO_SHUKUSHOU);
            data->state = 126;
        }

        break;

    case 126:
        if (OakSpeech_PlayerPicShrinkAnim(data) == TRUE) {
            ret = TRUE;
        }
        break;
    }

    return ret;
}

static void ov53_021E7D04(OakSpeechData *data) {
    ov53_021E6824(data, 1);
    ov53_021E67C4(data, 4);
    OakSpeech_PrintMultichoiceMenu(data, msg_0219_00047, msg_0219_00048, 0, 2);
    FillBgTilemapRect(data->bgConfig, GF_BG_LYR_SUB_3, 1, 16 * (data->playerGender ^ 1), 0, 16, 23, 0);
    BgCommitTilemapBufferToVram(data->bgConfig, GF_BG_LYR_SUB_3);
}

static void ov53_021E7D58(OakSpeechData *data) {
    BgClearTilemapBufferAndCommit(data->bgConfig, GF_BG_LYR_MAIN_0);
    BgClearTilemapBufferAndCommit(data->bgConfig, GF_BG_LYR_SUB_0);
}

static void ov53_021E7D70(OakSpeechData *data) {
    String *string = String_New(0x400, data->heapId);
    Window *window = &data->controlTutorialTouchMsgWindow;

    ReadMsgDataIntoString(data->msgData, msg_0219_00060, string);
    AddWindow(data->bgConfig, window, &ov53_021E8518);
    FillWindowPixelBuffer(window, 0);
    AddTextPrinterParameterizedWithColor(window, 4, string, 0, 0, TEXT_SPEED_INSTANT, MAKE_TEXT_COLOR(15, 1, 0), NULL);
    CopyWindowToVram(window);
    RemoveWindow(window);
    String_Delete(string);
}

static void ov53_021E7DDC(OakSpeechData *data) {
    Window *window = &data->controlTutorialTouchMsgWindow;
    AddWindow(data->bgConfig, window, &ov53_021E8518);
    FillWindowPixelBuffer(window, 0);
    CopyWindowToVram(window);
    RemoveWindow(window);
}

static void ov53_021E7E08(OakSpeechData *data, int a1) {
    GF_ASSERT(data != NULL);
    switch (a1) {
    case 0:
        GF_ASSERT(Get2dSpriteVisibleFlag(data->sprites[3]) == TRUE);
        ov53_021E7DDC(data);
        Set2dSpriteVisibleFlag(data->sprites[3], FALSE);
        break;
    case 1:
        GF_ASSERT(Get2dSpriteVisibleFlag(data->sprites[3]) == FALSE);
        ov53_021E7D70(data);
        Set2dSpriteVisibleFlag(data->sprites[3], TRUE);
        break;
    case 2:
        Set2dSpriteAnimSeqNo(data->sprites[3], 1);
        break;
    case 3:
        Set2dSpriteAnimSeqNo(data->sprites[3], 0);
        break;
    default:
        GF_ASSERT(FALSE);
        break;
    }
}

static BOOL ov53_021E7E94(OakSpeechData *data) {
    return Get2dSpriteCurrentAnimSeqNo(data->sprites[3]) == TRUE;
}

static BOOL ov53_021E7EAC(OakSpeechData *data) {
    GF_ASSERT(data != NULL);
    return Get2dSpriteVisibleFlag(data->sprites[3]) == TRUE;
}

static void ov53_021E7ECC(OakSpeechData *data) {
    int hitbox;
    if (ov53_021E7EAC(data)) {
        hitbox = TouchscreenHitbox_FindRectAtTouchHeld(ov53_021E8510);
        if (hitbox == 0 && System_GetTouchNew()) {
            gSystem.simulatedInputs = TRUE;
            ov53_021E7E08(data, 2);
        } else if (hitbox == 0 && ov53_021E7E94(data)) {
            gSystem.simulatedInputs = TRUE;
        } else {
            ov53_021E7E08(data, 3);
        }
    }
}
