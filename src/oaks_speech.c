#include "oaks_speech.h"

#include "global.h"

#include "constants/species.h"

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

static void ov53_021E5BCC(void *cbArg);
static void ov53_021E5BDC(OaksSpeechData *data);
static void ov53_021E5DE0(OaksSpeechData *data);
static void ov53_021E5E6C(OaksSpeechData *data);
static void ov53_021E5EB8(OaksSpeechData *data);
static BOOL ov53_021E5EDC(OaksSpeechData *data, int param, BOOL isFadeOut);
static BOOL OakSpeech_WaitFrames(OaksSpeechData *data, int a1);
static void ov53_021E60E8(OaksSpeechData *data, int bgId, int palette);
static BOOL ov53_021E611C(OaksSpeechData *data, int msgNum, int waitButtonMode);
static BOOL ov53_021E628C(OaksSpeechData *data, int msgNum, int a2, int a3, int a4);
static BOOL ov53_021E64B4(OaksSpeechData *data, int msgNum, int a2);
static void ov53_021E64C4(OaksSpeechData *data, int msg1, int msg2, int msg3, int a4);
static void OakSpeech_FreeWindows(OaksSpeechData *data);
static void ov53_021E65E0(OaksSpeechData *data);
static void ov53_021E66A8(OaksSpeechData *data, int a1);
static void ov53_021E66E8(OaksSpeechData *data, int a1, int a2);
static void ov53_021E67C4(OaksSpeechData *data, int a1);
static void ov53_021E6824(OaksSpeechData *data, int a1);
static void ov53_021E6908(OakSpeechData_Sub160 *dest, int a1);
static void ov53_021E6928(OaksSpeechData *data, int a1);
static int ov53_021E6988(OaksSpeechData *data, int a1);
static u16 ov53_021E6B9C(u16 a0, s8 a1);
static void ov53_021E6BEC(OaksSpeechData *data, int a1);
static void ov53_021E6CB0(OaksSpeechData *data);
static BOOL ov53_021E6CE0(OaksSpeechData *data);
static void ov53_021E6DF0(OaksSpeechData *data);
static BOOL ov53_021E6E00(OaksSpeechData *data);
static int ov53_021E6E7C(void);
static BOOL ov53_021E6F00(OaksSpeechData *data, int a1, int a2);
static BOOL ov53_021E6F9C(OaksSpeechData *data);
static void ov53_021E7D04(OaksSpeechData *data);
static void ov53_021E7D58(OaksSpeechData *data);
static void ov53_021E7D70(OaksSpeechData *data);
static void ov53_021E7DDC(OaksSpeechData *data);
static void ov53_021E7E08(OaksSpeechData *data, int a1);
static BOOL ov53_021E7E94(OaksSpeechData *data);
static BOOL ov53_021E7EAC(OaksSpeechData *data);
static void ov53_021E7ECC(OaksSpeechData *data);

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

static const WindowTemplate ov53_021E8500 = {
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

static const int ov53_021E8508[] = {
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

static const TouchscreenHitbox ov53_021E8530[3] = {
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
    44,
    43,
    43,
    45,
    51,
};

static const int ov53_021E856C[6] = {
    3,
    4,
    5,
    6,
    7,
    8,
};

static const int ov53_021E8584[3][2] = {
    {
     47,
     37,
     },
    {
     48,
     37,
     },
    {
     46,
     37,
     },
};

static const int ov53_021E859C[6] = {
    12,
    22,
    23,
    24,
    25,
    0xFF,
};

static const int ov53_021E85B4[6] = {
    17,
    26,
    27,
    28,
    29,
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

static const int ov53_021E86B0[][4] = {
    {
     49,
     3,
     },
    {
     50,
     2,
     },
    {
     50,
     2,
     },
    {
     52,
     2,
     },
};

static const int ov53_021E86F0[10][2] = {
    {
     0,
     0,
     },
    {
     10,
     11,
     },
    {
     12,
     16,
     },
    {
     13,
     16,
     },
    {
     14,
     16,
     },
    {
     15,
     16,
     },
    {
     17,
     21,
     },
    {
     18,
     21,
     },
    {
     19,
     21,
     },
    {
     20,
     21,
     },
};

BOOL OakSpeech_Init(OVY_MANAGER *ovyMan, int *pState) {
    CreateHeap(HEAP_ID_3, HEAP_ID_OAKS_SPEECH, 0x40000);
    OaksSpeechData *data = OverlayManager_CreateAndGetData(ovyMan, sizeof(OaksSpeechData), HEAP_ID_OAKS_SPEECH);
    memset(data, 0, sizeof(OaksSpeechData));
    data->heapId                        = HEAP_ID_OAKS_SPEECH;
    UnkStruct_02111868_sub *mainOvyArgs = OverlayManager_GetArgs(ovyMan);
    data->saveData                      = mainOvyArgs->saveData;
    data->options                       = Save_PlayerData_GetOptionsAddr(data->saveData);
    data->state                         = 0;
    data->unk_010                       = 0;
    data->overlayManager                = NULL;
    data->namingScreenArgs_Player       = NamingScreen_CreateArgs(HEAP_ID_OAKS_SPEECH, NAME_SCREEN_PLAYER, 0, PLAYER_NAME_LENGTH, data->options, NULL);
    data->namingScreenArgs_Rival        = NamingScreen_CreateArgs(HEAP_ID_OAKS_SPEECH, NAME_SCREEN_RIVAL, 0, PLAYER_NAME_LENGTH, data->options, NULL);
    data->unk_17C                       = 0;
    data->unk_13C                       = 0;
    sub_02002B8C(FALSE);
    FontID_Alloc(4, data->heapId);
    return TRUE;
}

BOOL OakSpeech_Main(OVY_MANAGER *ovyMan, int *pState) {
    OaksSpeechData *data = OverlayManager_GetData(ovyMan);
    BOOL ret             = FALSE;
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
        ov53_021E5BDC(data);
        ov53_021E5E6C(data);
        BgClearTilemapBufferAndCommit(data->bgConfig, GF_BG_LYR_SUB_0);
        ov53_021E7F24(data);
        ov53_021E8014(data);
        data->unk_178 = ov53_021E80F4(data->bgConfig, data->sprites[4], 6, 4, 14, data->heapId);
        Main_SetVBlankIntrCB(ov53_021E5BCC, data);
        GfGfx_BothDispOn();
        *pState = 1;
        break;
    case 1:
        ov53_021E7ECC(data);
        if (ov53_021E6F9C(data) == TRUE) {
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
    OaksSpeechData *data = OverlayManager_GetData(ovyMan);
    HeapID heapId        = data->heapId;
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

int OaksSpeech_DeadstrippedFunction1(int a0) {
    int arr[1];
    ARRAY_ASSIGN(arr, ov53_021E84F8);
    return ov53_021E84F8[a0];
}

int OaksSpeech_DeadstrippedFunction2(int a0) {
    int arr[1];
    ARRAY_ASSIGN(arr, ov53_021E84FC);
    return ov53_021E84FC[a0];
}

static void ov53_021E5BCC(void *cbArg) {
    OaksSpeechData *data = cbArg;

    DoScheduledBgGpuUpdates(data->bgConfig);
    thunk_OamManager_ApplyAndResetBuffers();
}

static void ov53_021E5BDC(OaksSpeechData *data) {
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
    ov53_021E65E0(data);
    data->unk_128 = 0;
}

static void ov53_021E5DE0(OaksSpeechData *data) {
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

static void ov53_021E5E6C(OaksSpeechData *data) {
    data->msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0219_bin, data->heapId);
    ResetAllTextPrinters();
    data->unk_114   = sub_020163E0(NULL, PM_LCD_TOP, 6, data->heapId);
    data->msgFormat = MessageFormat_New(data->heapId);
    data->unk_104   = 0;
    data->unk_108   = 0;
    data->unk_080   = 0;
}

static void ov53_021E5EB8(OaksSpeechData *data) {
    MessageFormat_Delete(data->msgFormat);
    sub_020164C4(data->unk_114);
    DestroyMsgData(data->msgData);
}

static BOOL ov53_021E5EDC(OaksSpeechData *data, int param, BOOL isFadeOut) {
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

    switch (data->unk_128) {
    case 0:
        if (!isFadeOut) {
            data->unk_12C = 0;
            data->unk_130 = 16;
            data->unk_128 = 1;
            if (screen == 0) {
                G2_SetBlendAlpha(
                    plane,
                    GX_BLEND_PLANEMASK_BG1 | GX_BLEND_PLANEMASK_BG2 | GX_BLEND_PLANEMASK_BG3,
                    data->unk_12C,
                    data->unk_130);
            } else {
                G2S_SetBlendAlpha(
                    plane,
                    GX_BLEND_PLANEMASK_BG1 | GX_BLEND_PLANEMASK_BG2 | GX_BLEND_PLANEMASK_BG3,
                    data->unk_12C,
                    data->unk_130);
            }
            if (param == 101) {
                GfGfx_EngineATogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_ON);
            } else if (param == 102) {
                GfGfx_EngineBTogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_ON);
            } else {
                ToggleBgLayer(param, GF_PLANE_TOGGLE_ON);
            }
        } else {
            data->unk_12C = 16;
            data->unk_130 = 0;
            data->unk_128 = 2;
        }
        break;
    case 1:
        if (data->unk_130 != 0) {
            ++data->unk_12C;
            --data->unk_130;
            if (screen == 0) {
                G2_SetBlendAlpha(
                    plane,
                    GX_BLEND_PLANEMASK_BG1 | GX_BLEND_PLANEMASK_BG2 | GX_BLEND_PLANEMASK_BG3,
                    data->unk_12C,
                    data->unk_130);
            } else {
                G2S_SetBlendAlpha(
                    plane,
                    GX_BLEND_PLANEMASK_BG1 | GX_BLEND_PLANEMASK_BG2 | GX_BLEND_PLANEMASK_BG3,
                    data->unk_12C,
                    data->unk_130);
            }
        } else {
            data->unk_128 = 3;
        }
        break;
    case 2:
        if (data->unk_12C != 0) {
            --data->unk_12C;
            ++data->unk_130;
            if (screen == 0) {
                G2_SetBlendAlpha(
                    plane,
                    GX_BLEND_PLANEMASK_BG1 | GX_BLEND_PLANEMASK_BG2 | GX_BLEND_PLANEMASK_BG3,
                    data->unk_12C,
                    data->unk_130);
            } else {
                G2S_SetBlendAlpha(
                    plane,
                    GX_BLEND_PLANEMASK_BG1 | GX_BLEND_PLANEMASK_BG2 | GX_BLEND_PLANEMASK_BG3,
                    data->unk_12C,
                    data->unk_130);
            }
        } else {
            data->unk_128 = 3;
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
        ret           = TRUE;
        data->unk_128 = 0;
        break;
    }

    return ret;
}

static BOOL OakSpeech_WaitFrames(OaksSpeechData *data, int a1) {
    if (data->unk_13C < a1) {
        ++data->unk_13C;
        return FALSE;
    } else {
        data->unk_13C = 0;
        return TRUE;
    }
}

static void ov53_021E60E8(OaksSpeechData *data, int bgId, int palette) {
    BgTilemapRectChangePalette(data->bgConfig, bgId, 0, 0, 32, 24, palette);
    BgCommitTilemapBufferToVram(data->bgConfig, bgId);
}

static BOOL ov53_021E611C(OaksSpeechData *data, int msgNum, int waitButtonMode) {
    BOOL ret = FALSE;

    switch (data->unk_104) {
    case 0: {
        AddWindow(data->bgConfig, &data->window_1, &ov53_021E8500);
        FillWindowPixelRect(&data->window_1, 0xF, 0, 0, 216, 32);
        DrawFrameAndWindow2(&data->window_1, FALSE, 0x3E2, 4);

        TextFlags_SetCanABSpeedUpPrint(TRUE);
        sub_02002B50(FALSE);

        String *temp = String_New(0x400, data->heapId);
        data->string = String_New(0x400, data->heapId);
        ReadMsgDataIntoString(data->msgData, msgNum, temp);
        BufferString(data->msgFormat, 0, data->namingScreenArgs_Player->unk18, data->playerGender, 1, 2);
        BufferString(data->msgFormat, 1, data->namingScreenArgs_Rival->unk18, 0, 1, 2);
        StringExpandPlaceholders(data->msgFormat, data->string, temp);
        String_Delete(temp);

        data->textPrinter = AddTextPrinterParameterized(&data->window_1, 1, data->string, 0, 0, Options_GetTextFrameDelay(data->options), NULL);
        data->unk_104     = 1;
        break;
    }
    case 1:
        if (!TextPrinterCheckActive(data->textPrinter)) {
            String_Delete(data->string);
            data->unk_104 = 2;
        }
        break;
    case 2:
        if (waitButtonMode == 0) {
            if ((gSystem.newKeys & PAD_BUTTON_A) == TRUE) {
                data->unk_16C = 0;
                PlaySE(SEQ_SE_DP_SELECT);
                ret = TRUE;
            }
        } else {
            ret = TRUE;
        }
        if (ret != FALSE) {
            RemoveWindow(&data->window_1);
            data->unk_104 = 0;
        }
        break;
    }

    return ret;
}

static BOOL ov53_021E628C(OaksSpeechData *data, int msgNum, int a2, int a3, int a4) {
    BOOL ret = FALSE;
    WindowTemplate sp18;

    switch (data->unk_108) {
    case 0:
        ToggleBgLayer(GF_BG_LYR_MAIN_0, GF_PLANE_TOGGLE_OFF);
        data->string = String_New(0x400, data->heapId);
        ReadMsgDataIntoString(data->msgData, msgNum, data->string);
        if (a3 == 0xFFFF) {
            a3 = (24 - (2 * String_CountLines(data->string))) / 2;
        }
        if (a4 == 0xFFFF) {
            a4 = 2 * String_CountLines(data->string);
        }
        switch (a2) {
        case 1:
            sp18        = ov53_021E8520;
            sp18.top    = a3;
            sp18.height = a4;
            AddWindow(data->bgConfig, &data->window_0, &sp18);
            FillWindowPixelRect(&data->window_0, 0, 0, 0, 0xC0, 0xC0);
            AddTextPrinterParameterizedWithColor(&data->window_0, 0, data->string, 0, 0, TEXT_SPEED_INSTANT, MAKE_TEXT_COLOR(1, 2, 0), NULL);
            break;
        case 0:
        case 2:
        case 3:
            sp18        = ov53_021E8528;
            sp18.top    = a3;
            sp18.height = a4;
            if (a2 == 3) {
                sp18.left += 4;
            }
            AddWindow(data->bgConfig, &data->window_0, &sp18);
            FillWindowPixelRect(&data->window_0, 0, 0, 0, 0xC0, 0xC0);
            AddTextPrinterParameterizedWithColor(&data->window_0, 0, data->string, 0, 0, TEXT_SPEED_INSTANT, MAKE_TEXT_COLOR(15, 2, 0), NULL);
            break;
        }
        String_Delete(data->string);
        data->unk_108 = 1;
        break;
    case 1:
        CopyWindowToVram(&data->window_0);
        data->unk_108 = 2;
        break;
    case 2:
        if (ov53_021E5EDC(data, GF_BG_LYR_MAIN_0, FALSE) == TRUE) {
            data->unk_108 = 3;
            if (a2 == 2) {
                data->unk_108 = 4;
                ret           = TRUE;
            }
        }
        break;
    case 3:
        if ((gSystem.newKeys & PAD_BUTTON_A) == PAD_BUTTON_A || (gSystem.newKeys & PAD_BUTTON_B) == PAD_BUTTON_B) {
            data->unk_16C = (gSystem.touchNew) ? TRUE : FALSE;
            PlaySE(SEQ_SE_DP_SELECT);
            data->unk_108 = 4;
        }
        break;
    case 4:
        if (ov53_021E5EDC(data, GF_BG_LYR_MAIN_0, TRUE) == TRUE) {
            data->unk_108 = 5;
        }
        break;
    case 5:
        RemoveWindow(&data->window_0);
        BgClearTilemapBufferAndCommit(data->bgConfig, GF_BG_LYR_MAIN_0);
        data->unk_108 = 0;
        ret           = TRUE;
        break;
    }

    return ret;
}

static BOOL ov53_021E64B4(OaksSpeechData *data, int msgNum, int a2) {
    return ov53_021E628C(data, msgNum, a2, 0xFFFF, 0xFFFF);
}

static const WindowTemplate ov53_021E8680[][3] = {
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

static void ov53_021E64C4(OaksSpeechData *data, int msg1, int msg2, int msg3, int numChoices) {
    int msgIds[3];
    int i;
    int x;
    int y;
    String *string;

    msgIds[0] = msg1;
    msgIds[1] = msg2;
    msgIds[2] = msg3;

    data->unk_07C = numChoices;
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
        AddWindow(data->bgConfig, &data->windows_2thru4[i], &ov53_021E8680[numChoices - 2][i]);
        FillWindowPixelRect(&data->windows_2thru4[i], 0, 0, 0, 0xC0, 0xC0);
        AddTextPrinterParameterizedWithColor(&data->windows_2thru4[i], 4, string, (ov53_021E8680[numChoices - 2][i].width * 8 - x) / 2, y, TEXT_SPEED_INSTANT, MAKE_TEXT_COLOR(15, 1, 0), NULL);
        CopyWindowToVram(&data->windows_2thru4[i]);
        String_Delete(string);
    }
}

static void OakSpeech_FreeWindows(OaksSpeechData *data) {
    for (int i = 0; i < data->unk_07C; ++i) {
        RemoveWindow(&data->windows_2thru4[i]);
    }
    BgClearTilemapBufferAndCommit(data->bgConfig, GF_BG_LYR_MAIN_0);
}

static void ov53_021E65E0(OaksSpeechData *data) {
    int plttId_Main;
    int plttId_Sub;
    NNSG2dPaletteData *plttData;
    void *plttData_raw;

    GfGfxLoader_LoadCharData(NARC_a_1_2_0, 0, data->bgConfig, GF_BG_LYR_MAIN_3, 0, 0, FALSE, data->heapId);
    BG_ClearCharDataRange(GF_BG_LYR_MAIN_0, 0x20, 0, data->heapId);
    GfGfxLoader_LoadCharData(NARC_a_1_2_0, 32, data->bgConfig, GF_BG_LYR_SUB_3, 0, 0, FALSE, data->heapId);
    if (gGameVersion == VERSION_HEARTGOLD) {
        plttId_Main = 1;
        plttId_Sub  = 30;
    } else {
        plttId_Main = 2;
        plttId_Sub  = 31;
    }
    GfGfxLoader_GXLoadPal(NARC_a_1_2_0, plttId_Main, GF_PAL_LOCATION_MAIN_BG, (enum GFPalSlotOffset)0, 0x60, data->heapId);
    GfGfxLoader_GXLoadPal(NARC_a_1_2_0, plttId_Sub, GF_PAL_LOCATION_SUB_BG, (enum GFPalSlotOffset)0, 0xA0, data->heapId);

    plttData_raw  = GfGfxLoader_GetPlttData(NARC_a_1_2_0, plttId_Sub, &plttData, data->heapId);
    data->unk_136 = ((const u16 *)plttData->pRawData)[12];
    FreeToHeap(plttData_raw);

    ov53_021E66A8(data, 1);
    ov53_021E66E8(data, 0, 0);
    ov53_021E67C4(data, 0);
    BG_SetMaskColor(GF_BG_LYR_MAIN_0, RGB_BLACK);
    BG_SetMaskColor(GF_BG_LYR_SUB_0, RGB_BLACK);
}

static void ov53_021E66A8(OaksSpeechData *data, int a1) {
    int sp10[6];
    ARRAY_ASSIGN(sp10, ov53_021E856C);

    if (a1 < 6) {
        GfGfxLoader_LoadScrnData(NARC_a_1_2_0, sp10[a1], data->bgConfig, GF_BG_LYR_MAIN_3, 0, 0, FALSE, data->heapId);
    }
}

static void ov53_021E66E8(OaksSpeechData *data, int a1, int a2) {
    int sp10[10][2];
    ARRAY_ASSIGN(sp10, ov53_021E86F0);

    if (a1 != 0 && a2 < 12) { // possible typo?
        GfGfxLoader_LoadCharData(NARC_a_1_2_0, sp10[a1][0], data->bgConfig, GF_BG_LYR_MAIN_1, 0, 0, FALSE, data->heapId);
        GfGfxLoader_GXLoadPal(NARC_a_1_2_0, sp10[a1][1], GF_PAL_LOCATION_MAIN_BG, (enum GFPalSlotOffset)0xE0, 32, data->heapId);
        GfGfxLoader_LoadScrnData(NARC_a_1_2_0, 9, data->bgConfig, GF_BG_LYR_MAIN_1, 0, 0, FALSE, data->heapId);
        ov53_021E60E8(data, GF_BG_LYR_MAIN_1, 7);
    }

    if (a2 != 0 && a2 < 12) {
        GfGfxLoader_LoadCharData(NARC_a_1_2_0, sp10[a2][0], data->bgConfig, GF_BG_LYR_MAIN_2, 0, 0, FALSE, data->heapId);
        GfGfxLoader_GXLoadPal(NARC_a_1_2_0, sp10[a2][1], GF_PAL_LOCATION_MAIN_BG, (enum GFPalSlotOffset)0x100, 32, data->heapId);
        GfGfxLoader_LoadScrnData(NARC_a_1_2_0, 9, data->bgConfig, GF_BG_LYR_MAIN_2, 0, 0, FALSE, data->heapId);
        ov53_021E60E8(data, GF_BG_LYR_MAIN_2, 8);
    }
}

static void ov53_021E67C4(OaksSpeechData *data, int a1) {
    int sp10[5];
    ARRAY_ASSIGN(sp10, ov53_021E8558);

    if (a1 < 5) {
        GfGfxLoader_LoadScrnData(NARC_a_1_2_0, sp10[a1], data->bgConfig, GF_BG_LYR_SUB_3, 0, 0, FALSE, data->heapId);
        if (a1 == 1) {
            ov53_021E60E8(data, GF_BG_LYR_SUB_3, 3);
        } else if (a1 == 2) {
            ov53_021E60E8(data, GF_BG_LYR_SUB_3, 2);
        }
    }
}

static void ov53_021E6824(OaksSpeechData *data, int a1) {
    int sp10[3][2];
    ARRAY_ASSIGN(sp10, ov53_021E8584);

    GfGfxLoader_LoadScrnData(NARC_a_1_2_0, sp10[a1][0], data->bgConfig, GF_BG_LYR_SUB_2, 0, 0, FALSE, data->heapId);
    ov53_021E60E8(data, GF_BG_LYR_SUB_2, 7);
    GfGfxLoader_GXLoadPal(NARC_a_1_2_0, 33, GF_PAL_LOCATION_SUB_BG, (enum GFPalSlotOffset)0xE0, 0x60, data->heapId);
    BG_ClearCharDataRange(GF_BG_LYR_SUB_2, 0x20, 0, data->heapId);
    GfGfxLoader_LoadCharData(NARC_a_1_2_0, sp10[a1][1], data->bgConfig, GF_BG_LYR_SUB_2, 0, 0, FALSE, data->heapId);
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

static void ov53_021E6908(OakSpeechData_Sub160 *dest, int a1) {
    dest->unk_3 = 0;
    dest->unk_0 = 0;
    dest->unk_1 = ov53_021E86B0[a1][1];
    dest->unk_6 = 0;
    dest->unk_4 = 0;
    dest->unk_5 = 16;
    dest->unk_2 = 0;
}

static void ov53_021E6928(OaksSpeechData *data, int a1) {
    data->unk_160.unk_0 = 0;
    data->unk_160.unk_1 = ov53_021E86B0[a1][1];
    data->unk_160.unk_4 = 0;
    data->unk_160.unk_5 = 16;
    GfGfxLoader_LoadScrnData(NARC_a_1_2_0, ov53_021E86B0[a1][0], data->bgConfig, GF_BG_LYR_SUB_1, 0, 0, FALSE, data->heapId);
    GfGfxLoader_LoadCharData(NARC_a_1_2_0, 42, data->bgConfig, GF_BG_LYR_SUB_1, 0, 0, FALSE, data->heapId);
}

static int ov53_021E6988(OaksSpeechData *data, int a1) {
    int ret = -1;
    int r6;

    TouchscreenHitbox sp0[3][4];
    ARRAY_ASSIGN(sp0, ov53_021E8650);

    if (data->unk_160.unk_6 != 0) {
        ++data->unk_160.unk_6;
        if (data->unk_160.unk_6 > 20) {
            data->unk_160.unk_6 = 0;
            ret                 = data->unk_160.unk_3;
        }
    } else if (gSystem.touchNew) {
        r6 = TouchscreenHitbox_FindRectAtTouchNew(sp0[a1]);
        if (r6 != -1) {
            ov53_021E6928(data, a1);
            ToggleBgLayer(GF_BG_LYR_SUB_1, GF_PLANE_TOGGLE_ON);
            data->unk_160.unk_3 = r6;
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_SUB_1, BG_POS_OP_SET_Y, ov53_021E8604[a1][data->unk_160.unk_3]);
            data->unk_160.unk_6 = 1;
            data->unk_160.unk_5 = 2;
            PlaySE(SEQ_SE_DP_SELECT);
        }
    } else if (data->unk_160.unk_2 == 0) {
        if (gSystem.newKeys & (PAD_BUTTON_A | PAD_BUTTON_B | PAD_KEY_UP | PAD_KEY_DOWN)) {
            PlaySE(SEQ_SE_DP_SELECT);
            ov53_021E6928(data, a1);
            ToggleBgLayer(GF_BG_LYR_SUB_1, GF_PLANE_TOGGLE_ON);
            data->unk_160.unk_2 = 1;
        }
    } else if (gSystem.newKeys & PAD_KEY_UP) {
        if (data->unk_160.unk_3 != 0) {
            --data->unk_160.unk_3;
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_SUB_1, BG_POS_OP_SET_Y, ov53_021E8604[a1][data->unk_160.unk_3]);
            PlaySE(SEQ_SE_DP_SELECT);
        }
    } else if (gSystem.newKeys & PAD_KEY_DOWN) {
        if (data->unk_160.unk_3 != data->unk_160.unk_1 - 1) {
            ++data->unk_160.unk_3;
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_SUB_1, BG_POS_OP_SET_Y, ov53_021E8604[a1][data->unk_160.unk_3]);
            PlaySE(SEQ_SE_DP_SELECT);
        }
    } else if (gSystem.newKeys & PAD_BUTTON_A) {
        data->unk_160.unk_6 = 1;
        data->unk_160.unk_5 = 2;
        PlaySE(SEQ_SE_DP_SELECT);
    } else if (gSystem.newKeys & PAD_BUTTON_B) {
        data->unk_160.unk_3 = data->unk_160.unk_1 - 1;
        data->unk_160.unk_6 = 1;
        data->unk_160.unk_5 = 2;
        ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_SUB_1, BG_POS_OP_SET_Y, ov53_021E8604[a1][data->unk_160.unk_3]);
        PlaySE(SEQ_SE_DP_SELECT);
    }
    if (data->unk_160.unk_6) {
        ++data->unk_160.unk_4;
        if (data->unk_160.unk_4 > data->unk_160.unk_5) {
            data->unk_160.unk_7 ^= 1;
            data->unk_160.unk_4 = 0;
            if (data->unk_160.unk_7 != 0) {
                ToggleBgLayer(GF_BG_LYR_SUB_1, GF_PLANE_TOGGLE_ON);
            } else {
                ToggleBgLayer(GF_BG_LYR_SUB_1, GF_PLANE_TOGGLE_OFF);
            }
        }
    }

    return ret;
}

static u16 ov53_021E6B9C(u16 a0, s8 a1) {
    int r = a0 & 0x1F;
    int g = (a0 >> 5) & 0x1F;
    int b = (a0 >> 10);

    r += a1;
    g += a1;
    b += a1;

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

static void ov53_021E6BEC(OaksSpeechData *data, int a1) {
    int r4 = 0;
    u16 sp0[2];

    GF_ASSERT(data->unk_160.unk_3 == 0 || data->unk_160.unk_3 == 1);
    if (a1 == 0) {
        r4 = (GF_SinDeg((data->unk_168++) * 10) * 8) >> FX32_SHIFT;
    } else {
        data->unk_168 = 0;
    }
    sp0[0] = ov53_021E6B9C(data->unk_136, r4);
    sp0[1] = ov53_021E6B9C(RGB(31, 7, 7), 0);
    BG_LoadPlttData(6, sp0, 4, ov53_021E8508[data->unk_160.unk_3] * 2);
    sp0[0] = data->unk_136;
    sp0[1] = RGB(27, 28, 28);
    BG_LoadPlttData(6, sp0, 4, ov53_021E8508[!data->unk_160.unk_3] * 2);
}

static void ov53_021E6CB0(OaksSpeechData *data) {
    u16 sp0[2];

    sp0[0] = data->unk_136;
    sp0[1] = RGB(27, 28, 28);
    BG_LoadPlttData(6, sp0, 4, 0x18);
    BG_LoadPlttData(6, sp0, 4, 0x1C);
}

static BOOL ov53_021E6CE0(OaksSpeechData *data) {
    BOOL ret = FALSE;
    int r6;

    TouchscreenHitbox sp0[3];
    ARRAY_ASSIGN(sp0, ov53_021E8530);

    if (gSystem.touchNew) {
        r6 = TouchscreenHitbox_FindRectAtTouchNew(sp0);
        if (r6 != -1) {
            data->unk_160.unk_3 = r6;
            data->unk_160.unk_6 = 1;
            data->unk_160.unk_5 = 2;
            ov53_021E6BEC(data, 1);
            PlaySE(SEQ_SE_DP_SELECT);
            data->unk_17C = r6;
            ret           = TRUE;
        }
    } else if (!data->unk_160.unk_2) {
        if (gSystem.newKeys & (PAD_BUTTON_A | PAD_KEY_LEFT | PAD_KEY_RIGHT)) {
            PlaySE(SEQ_SE_DP_SELECT);
            data->unk_160.unk_2 = 1;
            ov53_021E6BEC(data, 1);
        }
    } else {
        ov53_021E6BEC(data, 0);
        if (gSystem.newKeys & PAD_KEY_LEFT) {
            if (data->unk_160.unk_3 != 0) {
                --data->unk_160.unk_3;
                PlaySE(SEQ_SE_DP_SELECT);
            }
        } else if (gSystem.newKeys & PAD_KEY_RIGHT) {
            if (data->unk_160.unk_3 != data->unk_160.unk_1 - 1) {
                ++data->unk_160.unk_3;
                PlaySE(SEQ_SE_DP_SELECT);
            }
        } else if (gSystem.newKeys & PAD_BUTTON_A) {
            data->unk_160.unk_2 = 0;
            data->unk_160.unk_6 = 1;
            data->unk_160.unk_5 = 2;
            ov53_021E6BEC(data, 1);
            PlaySE(SEQ_SE_DP_SELECT);
            ret           = TRUE;
            data->unk_17C = data->unk_160.unk_3;
        }
    }

    return ret;
}

static void ov53_021E6DF0(OaksSpeechData *data) {
    data->unk_140 = 0;
    data->unk_144 = 0;
}

static BOOL ov53_021E6E00(OaksSpeechData *data) {
    BOOL ret = FALSE;
    int r1;

    if (data->unk_144 != 0) {
        --data->unk_144;
    } else {
        ++data->unk_140;
        data->unk_144 = 8;
    }
    if (data->playerGender == PLAYER_GENDER_MALE) {
        int sp28[6];
        ARRAY_ASSIGN(sp28, ov53_021E859C);
        r1 = sp28[data->unk_140];
    } else {
        int sp10[6];
        ARRAY_ASSIGN(sp10, ov53_021E85B4);
        r1 = sp10[data->unk_140];
    }
    if (r1 == 0xFF) {
        ret = TRUE;
    } else {
        GfGfxLoader_LoadCharData(NARC_a_1_2_0, r1, data->bgConfig, GF_BG_LYR_MAIN_1, 0, 0, FALSE, data->heapId);
    }

    return ret;
}

static int ov53_021E6E7C(void) {
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

static BOOL ov53_021E6F00(OaksSpeechData *data, int a1, int a2) {
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

static BOOL ov53_021E6F9C(OaksSpeechData *data) {
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
        ov53_021E66A8(data, 1);
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
        if (ov53_021E64B4(data, msg_0219_00007, 2) == TRUE) {
            ToggleBgLayer(GF_BG_LYR_SUB_2, GF_PLANE_TOGGLE_ON);
            data->state = 3;
            ov53_021E64C4(data, msg_0219_00044, msg_0219_00045, msg_0219_00046, 3);
            data->unk_160.unk_2 = 0;
            data->unk_160.unk_3 = 0;
        }
        break;
    case 3:
        if (ov53_021E6988(data, 0) != -1) {
            data->state = 4;
        }
        break;
    case 4:
        if (ov53_021E64B4(data, msg_0219_00007, 2) == TRUE) {
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
            switch (data->unk_160.unk_3) {
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
        ov53_021E66A8(data, 1);
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
        if (ov53_021E64B4(data, msg_0219_00009, 0) == TRUE) {
            data->state = 12;
        }
        break;
    case 12:
        if (ov53_021E64B4(data, msg_0219_00010, 0) == TRUE) {
            data->state = 13;
        }
        break;
    case 13:
        if (ov53_021E64B4(data, msg_0219_00011, 0) == TRUE) {
            data->state = 14;
        }
        break;
    case 14:
        if (ov53_021E64B4(data, msg_0219_00012, 0) == TRUE) {
            data->state = 15;
        }
        break;
    case 15:
        if (ov53_021E64B4(data, msg_0219_00023, 2) == TRUE) {
            ToggleBgLayer(GF_BG_LYR_MAIN_0, GF_PLANE_TOGGLE_ON);
            data->state = 16;
        }
        break;
    case 16:
        if (ov53_021E611C(data, msg_0219_00025, 0) == TRUE) {
            data->state = 17;
        }
        break;
    case 17:
        if (ov53_021E64B4(data, msg_0219_00013, 0) == TRUE) {
            ov53_021E66A8(data, 2);
            data->state = 18;
        }
        break;
    case 18:
        if (ov53_021E64B4(data, msg_0219_00014, 3) == TRUE) {
            ov53_021E66A8(data, 1);
            data->state = 19;
        }
        break;
    case 19:
        if (ov53_021E64B4(data, msg_0219_00015, 0) == TRUE) {
            ov53_021E66A8(data, 3);
            data->state = 20;
        }
        break;
    case 20:
        if (ov53_021E64B4(data, msg_0219_00016, 3) == TRUE) {
            ov53_021E66A8(data, 4);
            data->state = 21;
        }
        break;
    case 21:
        if (ov53_021E64B4(data, msg_0219_00017, 3) == TRUE) {
            data->state = 22;
            ToggleBgLayer(GF_BG_LYR_MAIN_0, GF_PLANE_TOGGLE_ON);
            ov53_021E66A8(data, 1);
        }
        break;
    case 22:
        if (ov53_021E611C(data, msg_0219_00026, 1) == TRUE) {
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
        if (ov53_021E5EDC(data, GF_BG_LYR_SUB_2, TRUE) == TRUE) {
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
        if (ov53_021E5EDC(data, GF_BG_LYR_SUB_2, TRUE) == TRUE) {
            ov53_021E7E08(data, 3);
            ToggleBgLayer(GF_BG_LYR_SUB_2, GF_PLANE_TOGGLE_OFF);
            ov53_021E7D58(data);
            data->state = 8;
        }
        break;

    // ADVENTURE INFO
    case 34:
        ov53_021E66A8(data, 5);
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
        if (ov53_021E64B4(data, msg_0219_00028, 1) == TRUE) {
            data->state = 37;
        }
        break;
    case 37:
        if (ov53_021E64B4(data, msg_0219_00029, 1) == TRUE) {
            data->state = 38;
        }
        break;
    case 38:
        if (ov53_021E64B4(data, msg_0219_00030, 1) == TRUE) {
            data->state = 39;
        }
        break;
    case 39:
        if (ov53_021E64B4(data, msg_0219_00031, 1) == TRUE) {
            data->state = 40;
        }
        break;
    case 40:
        if (ov53_021E64B4(data, msg_0219_00032, 1) == TRUE) {
            data->state = 41;
        }
        break;
    case 41:
        if (ov53_021E64B4(data, msg_0219_00033, 1) == TRUE) {
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
        ov53_021E66A8(data, 0);
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
            data->queuedMsgId = ov53_021E6E7C();
        }
        break;
    case 46:
        if (ov53_021E611C(data, data->queuedMsgId, 1) == TRUE) {
            GF_SndStartFadeOutBGM(0, 6);
            data->state = 47;
        }
        break;
    case 47:
        if (GF_SndGetFadeTimer() == 0) {
            StopBGM(SEQ_GS_STARTING, 0);
            PlayBGM(SEQ_GS_STARTING2);
            ov53_021E66E8(data, 1, 0);
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
        if (ov53_021E611C(data, msg_0219_00006, 1) == TRUE) {
            data->state = 50;
        }
        break;
    case 50:
        if (ov53_021E6F00(data, 1, 0) == TRUE) {
            data->state = 51;
        }
        break;
    case 51:
        if (ov53_021E611C(data, msg_0219_00034, 1) == TRUE) {
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
            data->unk_140 = 0;
            data->state   = 53;
        }
        break;
    case 53:
        if (IsBrightnessTransitionActive(SCREEN_MASK_MAIN) == TRUE && IsBrightnessTransitionActive(SCREEN_MASK_SUB) == TRUE) {
            Set2dSpriteAnimSeqNo(data->sprites[5], 1);
            Sprite_SetPalIndex(data->sprites[5], 4);
            data->unk_140 = 16;
            G2_SetBlendBrightness(GX_BLEND_PLANEMASK_OBJ, data->unk_140);
            data->state = 54;
        }
        break;
    case 54:
        if (!Sprite_IsCellAnimationRunning(data->sprites[5])) {
            --data->unk_140;
            G2_SetBlendBrightness(GX_BLEND_PLANEMASK_OBJ, data->unk_140);
            if (data->unk_140 == 0) {
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
        if (ov53_021E611C(data, msg_0219_00035, 1) == TRUE) {
            data->state = 57;
        }
        break;
    case 57:
        if (ov53_021E5EDC(data, 101, TRUE) == TRUE) {
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
        if (ov53_021E611C(data, msg_0219_00036, 1) == TRUE) {
            data->state         = 61;
            data->unk_160.unk_3 = 0;
            data->unk_160.unk_1 = 2;
        }
        break;
    case 61:
        if (ov53_021E611C(data, msg_0219_00037, 1) == TRUE) {
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
            data->unk_160.unk_3 = data->unk_17C;
            data->state         = 65;
        }
        break;
    case 65:
        if (ov53_021E6CE0(data)) {
            data->state        = 66;
            data->playerGender = data->unk_160.unk_3;
        }
        break;
    case 66:
        FillBgTilemapRect(data->bgConfig, GF_BG_LYR_SUB_3, 1, 16 * (data->unk_160.unk_3 ^ 1), 0, 16, 23, 0);
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
        if (ov53_021E611C(data, data->queuedMsgId, 1) == TRUE) {
            data->state = 68;
        }
        break;
    case 68:
        ov53_021E6908(&data->unk_160, 1);
        ov53_021E6824(data, 1);
        ov53_021E64C4(data, msg_0219_00047, msg_0219_00048, msg_0219_00000, 2);
        data->state         = 69;
        data->unk_160.unk_3 = 0;
        break;

    case 69:
        ToggleBgLayer(GF_BG_LYR_SUB_0, GF_PLANE_TOGGLE_ON);
        ToggleBgLayer(GF_BG_LYR_SUB_2, GF_PLANE_TOGGLE_ON);
        if (ov53_021E6988(data, data->playerGender + 1) != -1) {
            OakSpeech_FreeWindows(data);
            data->state = 70;
        }
        break;
    case 70:
        switch (data->unk_160.unk_3) {
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
            ov53_021E6CB0(data);
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
    case 93:
        if (ov53_021E611C(data, msg_0219_00040, 1) == TRUE) {
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
        ov53_021E66E8(data, 1, 0);
        ov53_021E80B8(data, data->playerGender);
        if (data->playerGender == 0) {
            data->queuedMsgId = msg_0219_00041;
        } else {
            data->queuedMsgId = msg_0219_00042;
        }
        break;

    case 97:
        if (ov53_021E611C(data, data->queuedMsgId, 1) == TRUE) {
            data->state = 98;
            ov53_021E6908(&data->unk_160, 1);
        }
        break;

    case 98:
        if (ov53_021E6988(data, data->playerGender + 1) != -1) {
            OakSpeech_FreeWindows(data);
            data->state = 99;
        }
        break;

    case 99:
        switch (data->unk_160.unk_3) {
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
        if (ov53_021E611C(data, msg_0219_00043, 1) == TRUE) {
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
        if (data->playerGender == 0) {
            ov53_021E66E8(data, 2, 0);
        } else {
            ov53_021E66E8(data, 6, 0);
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
        if (ov53_021E6E00(data) == TRUE) {
            ret = TRUE;
        }
        break;
    }

    return ret;
}

static void ov53_021E7D04(OaksSpeechData *data) {
    ov53_021E6824(data, 1);
    ov53_021E67C4(data, 4);
    ov53_021E64C4(data, msg_0219_00047, msg_0219_00048, 0, 2);
    FillBgTilemapRect(data->bgConfig, GF_BG_LYR_SUB_3, 1, 16 * (data->playerGender ^ 1), 0, 16, 23, 0);
    BgCommitTilemapBufferToVram(data->bgConfig, GF_BG_LYR_SUB_3);
}

static void ov53_021E7D58(OaksSpeechData *data) {
    BgClearTilemapBufferAndCommit(data->bgConfig, GF_BG_LYR_MAIN_0);
    BgClearTilemapBufferAndCommit(data->bgConfig, GF_BG_LYR_SUB_0);
}

static void ov53_021E7D70(OaksSpeechData *data) {
    String *string = String_New(0x400, data->heapId);
    Window *window = &data->window_5;

    ReadMsgDataIntoString(data->msgData, msg_0219_00060, string);
    AddWindow(data->bgConfig, window, &ov53_021E8518);
    FillWindowPixelBuffer(window, 0);
    AddTextPrinterParameterizedWithColor(window, 4, string, 0, 0, TEXT_SPEED_INSTANT, MAKE_TEXT_COLOR(15, 1, 0), NULL);
    CopyWindowToVram(window);
    RemoveWindow(window);
    String_Delete(string);
}

static void ov53_021E7DDC(OaksSpeechData *data) {
    Window *window = &data->window_5;
    AddWindow(data->bgConfig, window, &ov53_021E8518);
    FillWindowPixelBuffer(window, 0);
    CopyWindowToVram(window);
    RemoveWindow(window);
}

static void ov53_021E7E08(OaksSpeechData *data, int a1) {
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

static BOOL ov53_021E7E94(OaksSpeechData *data) {
    return Get2dSpriteCurrentAnimSeqNo(data->sprites[3]) == TRUE;
}

static BOOL ov53_021E7EAC(OaksSpeechData *data) {
    GF_ASSERT(data != NULL);
    return Get2dSpriteVisibleFlag(data->sprites[3]) == TRUE;
}

static void ov53_021E7ECC(OaksSpeechData *data) {
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
