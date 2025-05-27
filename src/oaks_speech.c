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
#include "naming_screen.h"
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
#include "yes_no_prompt.h"

FS_EXTERN_OVERLAY(OVY_36);

// In Diamond and Pearl, the player pics were animated.
// Vestiges of that system remain here.
typedef enum OakSpeechPic {
    OAK_SPEECH_PIC_NONE = 0,
    OAK_SPEECH_PIC_OAK = 1,
    OAK_SPEECH_PIC_ETHAN = 2,
    OAK_SPEECH_PIC_LYRA = 6,
} OakSpeechPic;

typedef enum OakSpeechMainState {
    OAK_SPEECH_MAIN_STATE_START_TUTORIAL_MUSIC = 0,
    OAK_SPEECH_MAIN_STATE_WAIT_FADE_IN_TUTORIAL_MENU = 1,
    OAK_SPEECH_MAIN_STATE_PRINT_TUTORIAL_MENU_MESSAGES = 2,
    OAK_SPEECH_MAIN_STATE_TUTORIAL_MENU_HANDLE_INPUT = 3,
    OAK_SPEECH_MAIN_STATE_FADE_OUT_TUTORIAL_MENU = 4,
    OAK_SPEECH_MAIN_STATE_FADE_OUT_TUTORIAL_MENU_BGS = 5,
    OAK_SPEECH_MAIN_STATE_WAIT_FADE_OUT_TUTORIAL_MENU_BGS = 6,
    OAK_SPEECH_MAIN_STATE_FADE_IN_TUTORIAL_MENU = 7,
    OAK_SPEECH_MAIN_STATE_FADE_IN_CONTROL_INFO = 8,
    OAK_SPEECH_MAIN_STATE_WAIT_FADE_IN_CONTROL_INFO = 9,
    OAK_SPEECH_MAIN_STATE_CONTROL_INFO_1 = 11,
    OAK_SPEECH_MAIN_STATE_CONTROL_INFO_2 = 12,
    OAK_SPEECH_MAIN_STATE_CONTROL_INFO_3 = 13,
    OAK_SPEECH_MAIN_STATE_CONTROL_INFO_4 = 14,
    OAK_SPEECH_MAIN_STATE_CONTROL_INFO_5 = 15,
    OAK_SPEECH_MAIN_STATE_CONTROL_INFO_6 = 16,
    OAK_SPEECH_MAIN_STATE_CONTROL_INFO_7 = 17,
    OAK_SPEECH_MAIN_STATE_CONTROL_INFO_8 = 18,
    OAK_SPEECH_MAIN_STATE_CONTROL_INFO_9 = 19,
    OAK_SPEECH_MAIN_STATE_CONTROL_INFO_10 = 20,
    OAK_SPEECH_MAIN_STATE_CONTROL_INFO_11 = 21,
    OAK_SPEECH_MAIN_STATE_CONTROL_INFO_23 = 22,
    OAK_SPEECH_MAIN_STATE_CONTROL_INFO_ASK_UNDERSTOOD = 23,
    OAK_SPEECH_MAIN_STATE_CONTROL_INFO_ASK_UNDERSTOOD_HANDLE_YESNO = 24,
    OAK_SPEECH_MAIN_STATE_CONTROL_INFO_UNDERSTOOD_YES = 27,
    OAK_SPEECH_MAIN_STATE_CONTROL_INFO_UNDERSTOOD_YES_WAIT_FADE = 28,
    OAK_SPEECH_MAIN_STATE_CONTROL_INFO_UNDERSTOOD_NO = 29,
    OAK_SPEECH_MAIN_STATE_FADE_IN_ADVENTURE_INFO = 34,
    OAK_SPEECH_MAIN_STATE_WAIT_FADE_IN_ADVENTURE_INFO = 35,
    OAK_SPEECH_MAIN_STATE_ADVENTURE_INFO_1 = 36,
    OAK_SPEECH_MAIN_STATE_ADVENTURE_INFO_2 = 37,
    OAK_SPEECH_MAIN_STATE_ADVENTURE_INFO_3 = 38,
    OAK_SPEECH_MAIN_STATE_ADVENTURE_INFO_4 = 39,
    OAK_SPEECH_MAIN_STATE_ADVENTURE_INFO_5 = 40,
    OAK_SPEECH_MAIN_STATE_ADVENTURE_INFO_6 = 41,
    OAK_SPEECH_MAIN_STATE_ADVENTURE_INFO_FADE_OUT = 42,
    OAK_SPEECH_MAIN_STATE_WAIT_FADE_OUT_ADVENTURE_INFO = 43,
    OAK_SPEECH_MAIN_STATE_NO_INFO_NEEDED_FADE_IN = 44,
    OAK_SPEECH_MAIN_STATE_WAIT_FADE_IN_NO_INFO_NEEDED = 45,
    OAK_SPEECH_MAIN_STATE_PRINT_TIME_OF_DAY_MSG = 46,
    OAK_SPEECH_MAIN_STATE_SHOW_OAK = 47,
    OAK_SPEECH_MAIN_STATE_WAIT_FADE_IN_OAK = 48,
    OAK_SPEECH_MAIN_STATE_WELCOME_TO_WORLD = 49,
    OAK_SPEECH_MAIN_STATE_SLIDE_OAK_RIGHT = 50,
    OAK_SPEECH_MAIN_STATE_THIS_WORLD_IS_INHABITED = 51,
    OAK_SPEECH_MAIN_STATE_BALL_OPENING_FLASH = 52,
    OAK_SPEECH_MAIN_STATE_APPEAR_MARILL = 53,
    OAK_SPEECH_MAIN_STATE_MARILL_CRY = 54,
    OAK_SPEECH_MAIN_STATE_WAIT_MARILL_CRY = 55,
    OAK_SPEECH_MAIN_STATE_WE_LIVE_ALONGSIDE = 56,
    OAK_SPEECH_MAIN_STATE_HIDE_MARILL = 57,
    OAK_SPEECH_MAIN_STATE_WAIT_AFTER_HIDE_MARILL = 58,
    OAK_SPEECH_MAIN_STATE_SLIDE_OAK_LEFT = 59,
    OAK_SPEECH_MAIN_STATE_TELL_ME_ABOUT_YOURSELF = 60,
    OAK_SPEECH_MAIN_STATE_ARE_YOU_A_GENDER = 61,
    OAK_SPEECH_MAIN_STATE_WAIT_FADE_OUT_TO_ASK_GENDER = 62,
    OAK_SPEECH_MAIN_STATE_SETUP_GENDER_SELECT_MENU = 63,
    OAK_SPEECH_MAIN_STATE_WAIT_FADE_IN_GENDER_SELECT_MENU = 64,
    OAK_SPEECH_MAIN_STATE_GENDER_SELECT_MENU_HANDLE_INPUT = 65,
    OAK_SPEECH_MAIN_STATE_PREPARE_ASK_CONFIRM_GENDER = 66,
    OAK_SPEECH_MAIN_STATE_ASK_CONFIRM_GENDER = 67,
    OAK_SPEECH_MAIN_STATE_CONFIRM_GENDER_YESNO_INIT_MENU = 68,
    OAK_SPEECH_MAIN_STATE_CONFIRM_GENDER_YESNO_HANDLE_INPUT = 69,
    OAK_SPEECH_MAIN_STATE_CONFIRM_GENDER_YESNO_HANDLE_RESULT = 70,
    OAK_SPEECH_MAIN_STATE_CONFIRM_GENDER_NO_WAIT_FADE_OUT = 71,
    OAK_SPEECH_MAIN_STATE_CONFIRM_GENDER_NO_WAIT_FADE_IN = 72,
    OAK_SPEECH_MAIN_STATE_CONFIRM_GENDER_YES = 93,
    OAK_SPEECH_MAIN_STATE_PROMPT_NAME_DELAY_BEFORE = 94,
    OAK_SPEECH_MAIN_STATE_PROMPT_NAME_LAUNCH_NAMING_SCREEN = 95,
    OAK_SPEECH_MAIN_STATE_PROMPT_NAME_RESTORE_GRAPHICS_AFTER = 96,
    OAK_SPEECH_MAIN_STATE_CONFIRM_NAME_YESNO_INIT_MENU = 97,
    OAK_SPEECH_MAIN_STATE_CONFIRM_NAME_YESNO_HANDLE_INPUT = 98,
    OAK_SPEECH_MAIN_STATE_CONFIRM_NAME_YESNO_HANDLE_RESULT = 99,
    OAK_SPEECH_MAIN_STATE_CONFIRM_NAME_YES = 100,
    OAK_SPEECH_MAIN_STATE_CONFIRM_NAME_YES_WAIT_FADE_OUT = 101,
    OAK_SPEECH_MAIN_STATE_CONFIRM_NAME_YES_WAIT_FADE_IN = 102,
    OAK_SPEECH_MAIN_STATE_YOUR_ADVENTURE_UNFOLDS = 103,
    OAK_SPEECH_MAIN_STATE_FADE_OUT_FROM_LAST_OAK_MESSAGE = 110,
    OAK_SPEECH_MAIN_STATE_WAIT_FADE_OUT_FROM_LAST_OAK_MESSAGE = 111,
    OAK_SPEECH_MAIN_STATE_FADE_IN_TO_SHRINK_ANIM = 120,
    OAK_SPEECH_MAIN_STATE_WAIT_FADE_IN_TO_SHRINK_ANIM = 121,
    OAK_SPEECH_MAIN_STATE_NOP_BEFORE_SHRINK_ANIM = 123,
    OAK_SPEECH_MAIN_STATE_INIT_SHRINK_ANIM_STATE = 124,
    OAK_SPEECH_MAIN_STATE_DELAY_BEFORE_SHRINK_ANIM = 125,
    OAK_SPEECH_MAIN_STATE_RUN_SHRINK_ANIM = 126,
} OakSpeechMainState;

static void OakSpeech_VBlankCB(void *cbArg);
static void OakSpeech_InitBgs(OakSpeechData *data);
static void OakSpeech_CleanupBgs(OakSpeechData *data);
static void OakSpeech_InitMsgPrinter(OakSpeechData *data);
static void OakSpeech_CleanupMsgPrinter(OakSpeechData *data);
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
static void OakSpeech_InitPlayerPicShrinkAnim(OakSpeechData *data);
static BOOL OakSpeech_PlayerPicShrinkAnim(OakSpeechData *data);
static int OakSpeech_GetTimeOfDayIntroMsg(void);
static BOOL OakSpeech_TranslateOakPicHorizontally(OakSpeechData *data, int bgId, int direction);
static BOOL OakSpeech_DoMainTask(OakSpeechData *data);
static void OakSpeech_CreateMultichoiceYesNoMenu(OakSpeechData *data);
static void OakSpeech_ClearBgLayer0TopBottomAndCommit(OakSpeechData *data);
static void OakSpeech_ShowTutorialTouchMsg(OakSpeechData *data);
static void OakSpeech_HideTutorialTouchMsg(OakSpeechData *data);
static void OakSpeech_TouchToAdvanceButtonAction(OakSpeechData *data, int a1);
static BOOL OakSpeech_IsTouchToAdvanceButtonDepressed(OakSpeechData *data);
static BOOL OakSpeech_IsTouchToAdvanceButtonActive(OakSpeechData *data);
static void OakSpeech_HandleTouchToAdvanceButton(OakSpeechData *data);

// These two arrays are needed to match.
// They appear in the final ROM but are left unused.
// This is due to deadstripping.
// See OakSpeech_DeadstrippedFunction1 and
// OakSpeech_DeadstrippedFunction2.
static const int ov53_021E84F8[1] = {
    4,
};

static const int ov53_021E84FC[1] = {
    4,
};

static const WindowTemplate ov53_021E8518 = {
    .bgId = GF_BG_LYR_SUB_0,
    .left = 24,
    .top = 20,
    .width = 7,
    .height = 2,
    .palette = 14,
    .baseTile = 0x0A3,
};

static const WindowTemplate sWindowTemplate_DialogMsg = {
    .bgId = GF_BG_LYR_MAIN_0,
    .left = 2,
    .top = 19,
    .width = 27,
    .height = 4,
    .palette = 6,
    .baseTile = 0x36D,
};

static const WindowTemplate sFullScreenMsgWindowTemplate_copy2 = {
    .bgId = GF_BG_LYR_MAIN_0,
    .left = 4,
    .top = 0,
    .width = 24,
    .height = 24,
    .palette = 5,
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

static const WindowTemplate sFullScreenMsgWindowTemplate_copy1 = {
    .bgId = GF_BG_LYR_MAIN_0,
    .left = 4,
    .top = 0,
    .width = 24,
    .height = 24,
    .palette = 5,
    .baseTile = 0x12D,
};

static const GraphicsBanks sGraphicsBank = {
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

static const s16 sOakPicTranslationParam[][3] = {
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

static const GraphicsModes sGraphicsModes = {
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

static const BgTemplate sBgTemplate_Main = {
    .x = 0,
    .y = 0,
    .bufferSize = GF_BG_BUF_SIZE_256x256_4BPP,
    .baseTile = 0,
    .size = GF_BG_SCR_SIZE_256x256,
    .colorMode = GX_BG_COLORMODE_16,
    .screenBase = GX_BG_SCRBASE_0x0000,
    .charBase = GX_BG_CHARBASE_0x00000,
    .bgExtPltt = GX_BG_EXTPLTT_01,
    .priority = 1,
    .areaOver = GX_BG_AREAOVER_XLU,
    .mosaic = 0,
};

static const BgTemplate sBgTemplate_Sub = {
    .x = 0,
    .y = 0,
    .bufferSize = GF_BG_BUF_SIZE_256x256_4BPP,
    .baseTile = 0,
    .size = GF_BG_SCR_SIZE_256x256,
    .colorMode = GX_BG_COLORMODE_16,
    .screenBase = GX_BG_SCRBASE_0x0000,
    .charBase = GX_BG_CHARBASE_0x00000,
    .bgExtPltt = GX_BG_EXTPLTT_01,
    .priority = 0,
    .areaOver = GX_BG_AREAOVER_XLU,
    .mosaic = 0,
};

static const int sMultichoiceMenuBgCursorCoords[][3] = {
    {
     0,
     0x1c7,
     0x18f,
     },
    {
     0,
     0x1af,
     },
    {
     0,
     0x1af,
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

BOOL OakSpeech_Init(OverlayManager *ovyMan, int *pState) {
    CreateHeap(HEAP_ID_3, HEAP_ID_OAKS_SPEECH, 0x40000);
    OakSpeechData *data = OverlayManager_CreateAndGetData(ovyMan, sizeof(OakSpeechData), HEAP_ID_OAKS_SPEECH);
    memset(data, 0, sizeof(OakSpeechData));
    data->heapId = HEAP_ID_OAKS_SPEECH;
    UnkStruct_02111868_sub *mainOvyArgs = OverlayManager_GetArgs(ovyMan);
    data->saveData = mainOvyArgs->saveData;
    data->options = Save_PlayerData_GetOptionsAddr(data->saveData);
    data->state = OAK_SPEECH_MAIN_STATE_START_TUTORIAL_MUSIC;
    data->unk_010 = 0;
    data->overlayManager = NULL;
    data->namingScreenArgs_Player = NamingScreen_CreateArgs(HEAP_ID_OAKS_SPEECH, NAME_SCREEN_PLAYER, 0, PLAYER_NAME_LENGTH, data->options, NULL);
    data->namingScreenArgs_Rival = NamingScreen_CreateArgs(HEAP_ID_OAKS_SPEECH, NAME_SCREEN_RIVAL, 0, PLAYER_NAME_LENGTH, data->options, NULL);
    data->lastChosenGender = 0;
    data->frameDelayCounter = 0;
    TextFlags_SetCanTouchSpeedUpPrint(FALSE);
    FontID_Alloc(4, data->heapId);
    return TRUE;
}

BOOL OakSpeech_Main(OverlayManager *ovyMan, int *pState) {
    OakSpeechData *data = OverlayManager_GetData(ovyMan);
    BOOL ret = FALSE;
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
        OakSpeech_InitMsgPrinter(data);
        BgClearTilemapBufferAndCommit(data->bgConfig, GF_BG_LYR_SUB_0);
        OakSpeech_InitSpriteEngine(data);
        OakSpeech_CreateSprites(data);
        data->yesnoMenu = OakSpeechYesNo_Create(data->bgConfig, data->sprites[4], 6, 4, 14, data->heapId);
        Main_SetVBlankIntrCB(OakSpeech_VBlankCB, data);
        GfGfx_BothDispOn();
        *pState = 1;
        break;
    case 1:
        OakSpeech_HandleTouchToAdvanceButton(data);
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
            OakSpeechYesNo_Delete(data->yesnoMenu);
            OakSpeech_CleanupSpriteEngine(data);
            OakSpeech_CleanupMsgPrinter(data);
            OakSpeech_CleanupBgs(data);
            Main_SetVBlankIntrCB(NULL, NULL);
            ret = TRUE;
        }
        break;
    case 3:
        if (IsPaletteFadeFinished() == TRUE) {
            OakSpeechYesNo_Delete(data->yesnoMenu);
            OakSpeech_CleanupSpriteEngine(data);
            OakSpeech_CleanupMsgPrinter(data);
            OakSpeech_CleanupBgs(data);
            Main_SetVBlankIntrCB(NULL, NULL);
            *pState = 4;
        }
        break;
    case 4:
        if (OverlayManager_Run(data->overlayManager) == TRUE) {
            OverlayManager_Delete(data->overlayManager);
            data->overlayManager = NULL;
            *pState = 5;
        }
        break;
    case 5:
        *pState = 0;
        break;
    }

    if (data->overlayManager == NULL && data->spriteGfxHandler != NULL) {
        SpriteSystem_DrawSprites(data->spriteGfxHandler);
    }
    return ret;
}

BOOL OakSpeech_Exit(OverlayManager *ovyMan, int *pState) {
    OakSpeechData *data = OverlayManager_GetData(ovyMan);
    HeapID heapId = data->heapId;
    FontID_Release(4);
    PlayerName_StringToFlat(Save_PlayerData_GetProfile(data->saveData), data->namingScreenArgs_Player->nameInputString);
    PlayerProfile_SetTrainerGender(Save_PlayerData_GetProfile(data->saveData), data->namingScreenArgs_Player->playerGenderOrMonSpecies);
    Save_Misc_RivalName_Set(Save_Misc_Get(data->saveData), data->namingScreenArgs_Rival->nameInputString);
    NamingScreen_DeleteArgs(data->namingScreenArgs_Player);
    NamingScreen_DeleteArgs(data->namingScreenArgs_Rival);
    OverlayManager_FreeData(ovyMan);
    DestroyHeap(heapId);
    RegisterMainOverlay(FS_OVERLAY_ID(OVY_36), &ov36_App_InitGameState_AfterOakSpeech);
    TextFlags_SetCanTouchSpeedUpPrint(FALSE);
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
    SpriteSystem_TransferOam();
}

static void OakSpeech_InitBgs(OakSpeechData *data) {
    {
        GraphicsBanks graphicsBanks = sGraphicsBank;
        GfGfx_SetBanks(&graphicsBanks);
    }
    data->bgConfig = BgConfig_Alloc(data->heapId);
    {
        GraphicsModes graphicsModes = sGraphicsModes;
        SetBothScreensModesAndDisable(&graphicsModes);
    }
    {
        BgTemplate bgTemplate = sBgTemplate_Main;

        bgTemplate.screenBase = GX_BG_SCRBASE_0x7800;
        bgTemplate.charBase = GX_BG_CHARBASE_0x18000;
        InitBgFromTemplate(data->bgConfig, GF_BG_LYR_MAIN_0, &bgTemplate, GF_BG_TYPE_TEXT);
        BgClearTilemapBufferAndCommit(data->bgConfig, GF_BG_LYR_MAIN_0);

        bgTemplate.screenBase = GX_BG_SCRBASE_0x7000;
        bgTemplate.charBase = GX_BG_CHARBASE_0x14000;
        InitBgFromTemplate(data->bgConfig, GF_BG_LYR_MAIN_1, &bgTemplate, GF_BG_TYPE_TEXT);
        BgClearTilemapBufferAndCommit(data->bgConfig, GF_BG_LYR_MAIN_1);

        bgTemplate.screenBase = GX_BG_SCRBASE_0x6800;
        bgTemplate.charBase = GX_BG_CHARBASE_0x10000;
        InitBgFromTemplate(data->bgConfig, GF_BG_LYR_MAIN_2, &bgTemplate, GF_BG_TYPE_TEXT);
        BgClearTilemapBufferAndCommit(data->bgConfig, GF_BG_LYR_MAIN_2);

        bgTemplate.screenBase = GX_BG_SCRBASE_0x6000;
        bgTemplate.charBase = GX_BG_CHARBASE_0x0c000;
        InitBgFromTemplate(data->bgConfig, GF_BG_LYR_MAIN_3, &bgTemplate, GF_BG_TYPE_TEXT);
        BgClearTilemapBufferAndCommit(data->bgConfig, GF_BG_LYR_MAIN_3);

        LoadUserFrameGfx2(data->bgConfig, GF_BG_LYR_MAIN_0, 0x3E2, 4, 0, data->heapId);
        LoadUserFrameGfx1(data->bgConfig, GF_BG_LYR_MAIN_0, 0x3D9, 3, 0, data->heapId);
        LoadFontPal0(GF_PAL_LOCATION_MAIN_BG, (enum GFPalSlotOffset)0xA0, data->heapId);
        LoadFontPal1(GF_PAL_LOCATION_MAIN_BG, (enum GFPalSlotOffset)0xC0, data->heapId);
    }
    {
        BgTemplate bgTemplate = sBgTemplate_Sub;

        bgTemplate.screenBase = GX_BG_SCRBASE_0x7800;
        bgTemplate.charBase = GX_BG_CHARBASE_0x18000;
        InitBgFromTemplate(data->bgConfig, GF_BG_LYR_SUB_0, &bgTemplate, GF_BG_TYPE_TEXT);
        BgClearTilemapBufferAndCommit(data->bgConfig, GF_BG_LYR_SUB_0);

        bgTemplate.screenBase = GX_BG_SCRBASE_0x7000;
        bgTemplate.charBase = GX_BG_CHARBASE_0x14000;
        InitBgFromTemplate(data->bgConfig, GF_BG_LYR_SUB_1, &bgTemplate, GF_BG_TYPE_TEXT);
        BgClearTilemapBufferAndCommit(data->bgConfig, GF_BG_LYR_SUB_1);

        bgTemplate.screenBase = GX_BG_SCRBASE_0x6800;
        bgTemplate.charBase = GX_BG_CHARBASE_0x10000;
        InitBgFromTemplate(data->bgConfig, GF_BG_LYR_SUB_2, &bgTemplate, GF_BG_TYPE_TEXT);
        BgClearTilemapBufferAndCommit(data->bgConfig, GF_BG_LYR_SUB_2);

        bgTemplate.screenBase = GX_BG_SCRBASE_0x6000;
        bgTemplate.charBase = GX_BG_CHARBASE_0x0c000;
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

static void OakSpeech_CleanupBgs(OakSpeechData *data) {
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

static void OakSpeech_InitMsgPrinter(OakSpeechData *data) {
    data->msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0219_bin, data->heapId);
    ResetAllTextPrinters();
    data->unk_114 = sub_020163E0(NULL, PM_LCD_TOP, 6, data->heapId);
    data->msgFormat = MessageFormat_New(data->heapId);
    data->printDialogMsgState = 0;
    data->printAndFadeFullScreenTextState = 0;
    data->unk_080 = 0;
}

static void OakSpeech_CleanupMsgPrinter(OakSpeechData *data) {
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
        plane = GX_BLEND_PLANEMASK_BG0;
        screen = PM_LCD_TOP;
        break;
    case GF_BG_LYR_MAIN_1:
        plane = GX_BLEND_PLANEMASK_BG1;
        screen = PM_LCD_TOP;
        break;
    case GF_BG_LYR_MAIN_2:
        plane = GX_BLEND_PLANEMASK_BG2;
        screen = PM_LCD_TOP;
        break;
    case GF_BG_LYR_SUB_0:
        plane = GX_BLEND_PLANEMASK_BG0;
        screen = PM_LCD_BOTTOM;
        break;
    case GF_BG_LYR_SUB_1:
        plane = GX_BLEND_PLANEMASK_BG1;
        screen = PM_LCD_BOTTOM;
        break;
    case GF_BG_LYR_SUB_2:
        plane = GX_BLEND_PLANEMASK_BG2;
        screen = PM_LCD_BOTTOM;
        break;
    case 101: // GF_BG_LYR_MAIN_OBJ
        plane = GX_BLEND_PLANEMASK_OBJ;
        screen = PM_LCD_TOP;
        break;
    case 102: // GF_BG_LYR_SUB_OBJ
        plane = GX_BLEND_PLANEMASK_OBJ;
        screen = PM_LCD_BOTTOM;
        break;
    }

    switch (data->layerBlendState) {
    case 0:
        if (!isFadeOut) {
            data->layerBlendEv1 = 0;
            data->layerBlendEv2 = 16;
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
            data->layerBlendEv1 = 16;
            data->layerBlendEv2 = 0;
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
        ret = TRUE;
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
        TextFlags_SetAutoScrollParam(AUTO_SCROLL_OFF);

        String *temp = String_New(0x400, data->heapId);
        data->string = String_New(0x400, data->heapId);
        ReadMsgDataIntoString(data->msgData, msgNum, temp);
        BufferString(data->msgFormat, 0, data->namingScreenArgs_Player->nameInputString, data->playerGender, 1, 2);
        BufferString(data->msgFormat, 1, data->namingScreenArgs_Rival->nameInputString, 0, 1, 2);
        StringExpandPlaceholders(data->msgFormat, data->string, temp);
        String_Delete(temp);

        data->textPrinter = AddTextPrinterParameterized(&data->dialogWindow, 1, data->string, 0, 0, Options_GetTextFrameDelay(data->options), NULL);
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
            windowTemplate = sFullScreenMsgWindowTemplate_copy1;
            windowTemplate.top = y;
            windowTemplate.height = height;
            AddWindow(data->bgConfig, &data->fullScreenMsgWindow, &windowTemplate);
            FillWindowPixelRect(&data->fullScreenMsgWindow, 0, 0, 0, 0xC0, 0xC0);
            AddTextPrinterParameterizedWithColor(&data->fullScreenMsgWindow, 0, data->string, 0, 0, TEXT_SPEED_INSTANT, MAKE_TEXT_COLOR(1, 2, 0), NULL);
            break;
        case 0:
        case 2:
        case 3:
            windowTemplate = sFullScreenMsgWindowTemplate_copy2;
            windowTemplate.top = y;
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
                ret = TRUE;
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
        ret = TRUE;
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
            .bgId = GF_BG_LYR_SUB_0,
            .left = 2,
            .top = 6,
            .width = 13,
            .height = 3,
            .palette = 14,
            .baseTile = 0x001,
        },
     {
            .bgId = GF_BG_LYR_SUB_0,
            .left = 2,
            .top = 16,
            .width = 13,
            .height = 3,
            .palette = 14,
            .baseTile = 0x036,
        },
     },
    {
     {
            .bgId = GF_BG_LYR_SUB_0,
            .left = 7,
            .top = 3,
            .width = 18,
            .height = 3,
            .palette = 14,
            .baseTile = 0x001,
        },
     {
            .bgId = GF_BG_LYR_SUB_0,
            .left = 7,
            .top = 10,
            .width = 18,
            .height = 3,
            .palette = 14,
            .baseTile = 0x037,
        },
     {
            .bgId = GF_BG_LYR_SUB_0,
            .left = 7,
            .top = 17,
            .width = 18,
            .height = 3,
            .palette = 14,
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
        plttId_Sub = NARC_intro_intro_00000030_NCLR;
    } else {
        plttId_Main = NARC_intro_intro_00000002_NCLR;
        plttId_Sub = NARC_intro_intro_00000031_NCLR;
    }
    GfGfxLoader_GXLoadPal(NARC_demo_intro_intro, plttId_Main, GF_PAL_LOCATION_MAIN_BG, (enum GFPalSlotOffset)0, 0x60, data->heapId);
    GfGfxLoader_GXLoadPal(NARC_demo_intro_intro, plttId_Sub, GF_PAL_LOCATION_SUB_BG, (enum GFPalSlotOffset)0, 0xA0, data->heapId);

    plttData_raw = GfGfxLoader_GetPlttData(NARC_demo_intro_intro, plttId_Sub, &plttData, data->heapId);
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
    dest->cursorPos = 0;
    dest->unk_0 = 0;
    dest->numOptions = sMultichoiceMenuParam[menuId][1];
    dest->pressDelay = 0;
    dest->flashDelay = 0;
    dest->flashFramesPer = 16;
    dest->inPadMode = 0;
}

static void OakSpeech_InitMultichoiceMenuWithFrameFlash(OakSpeechData *data, int menuId) {
    data->menuData.unk_0 = 0;
    data->menuData.numOptions = sMultichoiceMenuParam[menuId][1];
    data->menuData.flashDelay = 0;
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
            ret = data->menuData.cursorPos;
        }
    } else if (gSystem.touchNew) {
        hitbox = TouchscreenHitbox_FindRectAtTouchNew(hitboxes[menuId]);
        if (hitbox != -1) {
            OakSpeech_InitMultichoiceMenuWithFrameFlash(data, menuId);
            ToggleBgLayer(GF_BG_LYR_SUB_1, GF_PLANE_TOGGLE_ON);
            data->menuData.cursorPos = hitbox;
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_SUB_1, BG_POS_OP_SET_Y, sMultichoiceMenuBgCursorCoords[menuId][data->menuData.cursorPos]);
            data->menuData.pressDelay = 1;
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
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_SUB_1, BG_POS_OP_SET_Y, sMultichoiceMenuBgCursorCoords[menuId][data->menuData.cursorPos]);
            PlaySE(SEQ_SE_DP_SELECT);
        }
    } else if (gSystem.newKeys & PAD_KEY_DOWN) {
        if (data->menuData.cursorPos != data->menuData.numOptions - 1) {
            ++data->menuData.cursorPos;
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_SUB_1, BG_POS_OP_SET_Y, sMultichoiceMenuBgCursorCoords[menuId][data->menuData.cursorPos]);
            PlaySE(SEQ_SE_DP_SELECT);
        }
    } else if (gSystem.newKeys & PAD_BUTTON_A) {
        data->menuData.pressDelay = 1;
        data->menuData.flashFramesPer = 2;
        PlaySE(SEQ_SE_DP_SELECT);
    } else if (gSystem.newKeys & PAD_BUTTON_B) {
        data->menuData.cursorPos = data->menuData.numOptions - 1;
        data->menuData.pressDelay = 1;
        data->menuData.flashFramesPer = 2;
        ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_SUB_1, BG_POS_OP_SET_Y, sMultichoiceMenuBgCursorCoords[menuId][data->menuData.cursorPos]);
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
            data->menuData.cursorPos = hitbox;
            data->menuData.pressDelay = 1;
            data->menuData.flashFramesPer = 2;
            OakSpeech_BlinkHighlightedGenderFrame(data, 1);
            PlaySE(SEQ_SE_DP_SELECT);
            data->lastChosenGender = hitbox;
            ret = TRUE;
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
            data->menuData.inPadMode = 0;
            data->menuData.pressDelay = 1;
            data->menuData.flashFramesPer = 2;
            OakSpeech_BlinkHighlightedGenderFrame(data, 1);
            PlaySE(SEQ_SE_DP_SELECT);
            ret = TRUE;
            data->lastChosenGender = data->menuData.cursorPos;
        }
    }

    return ret;
}

static void OakSpeech_InitPlayerPicShrinkAnim(OakSpeechData *data) {
    data->playerPicShrinkAnimStep = 0;
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

static BOOL OakSpeech_TranslateOakPicHorizontally(OakSpeechData *data, int bgId, int direction) {
    switch (data->oakPicHTranslateState) {
    case 0:
        data->oakPicHTranslateState = 1;
        data->oakPicHTranslatePos = sOakPicTranslationParam[direction][0];
        break;
    case 1:
        data->oakPicHTranslatePos += sOakPicTranslationParam[direction][2];
        if (sOakPicTranslationParam[direction][2] > 0) {
            if (data->oakPicHTranslatePos >= sOakPicTranslationParam[direction][1]) {
                data->oakPicHTranslatePos = sOakPicTranslationParam[direction][1];
                data->oakPicHTranslateState = 2;
            }
        } else {
            if (data->oakPicHTranslatePos <= sOakPicTranslationParam[direction][1]) {
                data->oakPicHTranslatePos = sOakPicTranslationParam[direction][1];
                data->oakPicHTranslateState = 2;
            }
        }
        BgSetPosTextAndCommit(data->bgConfig, bgId, BG_POS_OP_SET_X, data->oakPicHTranslatePos);
        break;
    case 2:
        data->oakPicHTranslateState = 0;
        return TRUE;
    }

    return FALSE;
}

static BOOL OakSpeech_DoMainTask(OakSpeechData *data) {
    BOOL ret = FALSE;

    switch (data->state) {
    case OAK_SPEECH_MAIN_STATE_START_TUTORIAL_MUSIC:
        ToggleBgLayer(GF_BG_LYR_SUB_2, GF_PLANE_TOGGLE_OFF);
        Sound_SetSceneAndPlayBGM(2, SEQ_GS_POKEMON_THEME, 1);
        StopBGM(SEQ_GS_POKEMON_THEME, 0);
        PlayBGM(SEQ_GS_STARTING);
        data->state = OAK_SPEECH_MAIN_STATE_FADE_IN_TUTORIAL_MENU;
        break;
    case OAK_SPEECH_MAIN_STATE_FADE_IN_TUTORIAL_MENU:
        ov53_021E6824(data, 0);
        OakSpeech_SetButtonTutorialScreenLayout(data, 1);
        ov53_021E67C4(data, 0);
        ToggleBgLayer(GF_BG_LYR_MAIN_3, GF_PLANE_TOGGLE_ON);
        ToggleBgLayer(GF_BG_LYR_MAIN_0, GF_PLANE_TOGGLE_ON);
        ToggleBgLayer(GF_BG_LYR_SUB_0, GF_PLANE_TOGGLE_ON);
        ToggleBgLayer(GF_BG_LYR_SUB_3, GF_PLANE_TOGGLE_ON);
        BeginNormalPaletteFade(0, 1, 1, RGB_BLACK, 6, 1, data->heapId);
        data->state = OAK_SPEECH_MAIN_STATE_WAIT_FADE_IN_TUTORIAL_MENU;
        break;
    case OAK_SPEECH_MAIN_STATE_WAIT_FADE_IN_TUTORIAL_MENU:
        if (IsPaletteFadeFinished() == TRUE && OakSpeech_WaitFrames(data, 40) == TRUE) {
            data->state = OAK_SPEECH_MAIN_STATE_PRINT_TUTORIAL_MENU_MESSAGES;
        }
        break;
    case OAK_SPEECH_MAIN_STATE_PRINT_TUTORIAL_MENU_MESSAGES:
        if (OakSpeech_PrintAndFadeCenteredFullScreenText(data, msg_0219_00007, 2) == TRUE) {
            ToggleBgLayer(GF_BG_LYR_SUB_2, GF_PLANE_TOGGLE_ON);
            data->state = OAK_SPEECH_MAIN_STATE_TUTORIAL_MENU_HANDLE_INPUT;
            OakSpeech_PrintMultichoiceMenu(data, msg_0219_00044, msg_0219_00045, msg_0219_00046, 3);
            data->menuData.inPadMode = 0;
            data->menuData.cursorPos = 0;
        }
        break;
    case OAK_SPEECH_MAIN_STATE_TUTORIAL_MENU_HANDLE_INPUT:
        if (OakSpeech_MultichoiceMenuHandleInputVertical(data, 0) != -1) {
            data->state = OAK_SPEECH_MAIN_STATE_FADE_OUT_TUTORIAL_MENU;
        }
        break;
    case OAK_SPEECH_MAIN_STATE_FADE_OUT_TUTORIAL_MENU:
        if (OakSpeech_PrintAndFadeCenteredFullScreenText(data, msg_0219_00007, 2) == TRUE) {
            OakSpeech_FreeWindows(data);
            ToggleBgLayer(GF_BG_LYR_SUB_0, GF_PLANE_TOGGLE_OFF);
            ToggleBgLayer(GF_BG_LYR_SUB_2, GF_PLANE_TOGGLE_OFF);
            ToggleBgLayer(GF_BG_LYR_SUB_1, GF_PLANE_TOGGLE_OFF);
            data->state = OAK_SPEECH_MAIN_STATE_FADE_OUT_TUTORIAL_MENU_BGS;
        }
        break;
    case OAK_SPEECH_MAIN_STATE_FADE_OUT_TUTORIAL_MENU_BGS:
        BeginNormalPaletteFade(0, 0, 0, RGB_BLACK, 6, 1, data->heapId);
        data->state = OAK_SPEECH_MAIN_STATE_WAIT_FADE_OUT_TUTORIAL_MENU_BGS;
        break;
    case OAK_SPEECH_MAIN_STATE_WAIT_FADE_OUT_TUTORIAL_MENU_BGS:
        if (IsPaletteFadeFinished() == TRUE) {
            switch (data->menuData.cursorPos) {
            case 0: // CONTROL INFO
                data->state = OAK_SPEECH_MAIN_STATE_FADE_IN_CONTROL_INFO;
                break;
            case 1: // ADVENTURE INFO
                data->state = OAK_SPEECH_MAIN_STATE_FADE_IN_ADVENTURE_INFO;
                break;
            case 2: // NO INFO NEEDED
                data->state = OAK_SPEECH_MAIN_STATE_NO_INFO_NEEDED_FADE_IN;
                break;
            }
        }
        break;

    // CONTROL INFO
    case OAK_SPEECH_MAIN_STATE_FADE_IN_CONTROL_INFO:
        BgClearTilemapBufferAndCommit(data->bgConfig, GF_BG_LYR_SUB_0);
        OakSpeech_SetButtonTutorialScreenLayout(data, 1);
        ov53_021E67C4(data, 1);
        OakSpeech_TouchToAdvanceButtonAction(data, TOUCHTOADVANCE_SHOW);
        ToggleBgLayer(GF_BG_LYR_SUB_0, GF_PLANE_TOGGLE_ON);
        ToggleBgLayer(GF_BG_LYR_SUB_3, GF_PLANE_TOGGLE_ON);
        BeginNormalPaletteFade(0, 1, 1, RGB_BLACK, 6, 1, data->heapId);
        data->state = OAK_SPEECH_MAIN_STATE_WAIT_FADE_IN_CONTROL_INFO;
        break;
    case OAK_SPEECH_MAIN_STATE_WAIT_FADE_IN_CONTROL_INFO:
        if (IsPaletteFadeFinished() == TRUE) {
            data->state = OAK_SPEECH_MAIN_STATE_CONTROL_INFO_1;
        }
        break;
    case OAK_SPEECH_MAIN_STATE_CONTROL_INFO_1:
        if (OakSpeech_PrintAndFadeCenteredFullScreenText(data, msg_0219_00009, 0) == TRUE) {
            data->state = OAK_SPEECH_MAIN_STATE_CONTROL_INFO_2;
        }
        break;
    case OAK_SPEECH_MAIN_STATE_CONTROL_INFO_2:
        if (OakSpeech_PrintAndFadeCenteredFullScreenText(data, msg_0219_00010, 0) == TRUE) {
            data->state = OAK_SPEECH_MAIN_STATE_CONTROL_INFO_3;
        }
        break;
    case OAK_SPEECH_MAIN_STATE_CONTROL_INFO_3:
        if (OakSpeech_PrintAndFadeCenteredFullScreenText(data, msg_0219_00011, 0) == TRUE) {
            data->state = OAK_SPEECH_MAIN_STATE_CONTROL_INFO_4;
        }
        break;
    case OAK_SPEECH_MAIN_STATE_CONTROL_INFO_4:
        if (OakSpeech_PrintAndFadeCenteredFullScreenText(data, msg_0219_00012, 0) == TRUE) {
            data->state = OAK_SPEECH_MAIN_STATE_CONTROL_INFO_5;
        }
        break;
    case OAK_SPEECH_MAIN_STATE_CONTROL_INFO_5:
        if (OakSpeech_PrintAndFadeCenteredFullScreenText(data, msg_0219_00023, 2) == TRUE) {
            ToggleBgLayer(GF_BG_LYR_MAIN_0, GF_PLANE_TOGGLE_ON);
            data->state = OAK_SPEECH_MAIN_STATE_CONTROL_INFO_6;
        }
        break;
    case OAK_SPEECH_MAIN_STATE_CONTROL_INFO_6:
        if (OakSpeech_PrintDialogMsg(data, msg_0219_00025, 0) == TRUE) {
            data->state = OAK_SPEECH_MAIN_STATE_CONTROL_INFO_7;
        }
        break;
    case OAK_SPEECH_MAIN_STATE_CONTROL_INFO_7:
        if (OakSpeech_PrintAndFadeCenteredFullScreenText(data, msg_0219_00013, 0) == TRUE) {
            OakSpeech_SetButtonTutorialScreenLayout(data, 2);
            data->state = OAK_SPEECH_MAIN_STATE_CONTROL_INFO_8;
        }
        break;
    case OAK_SPEECH_MAIN_STATE_CONTROL_INFO_8:
        if (OakSpeech_PrintAndFadeCenteredFullScreenText(data, msg_0219_00014, 3) == TRUE) {
            OakSpeech_SetButtonTutorialScreenLayout(data, 1);
            data->state = OAK_SPEECH_MAIN_STATE_CONTROL_INFO_9;
        }
        break;
    case OAK_SPEECH_MAIN_STATE_CONTROL_INFO_9:
        if (OakSpeech_PrintAndFadeCenteredFullScreenText(data, msg_0219_00015, 0) == TRUE) {
            OakSpeech_SetButtonTutorialScreenLayout(data, 3);
            data->state = OAK_SPEECH_MAIN_STATE_CONTROL_INFO_10;
        }
        break;
    case OAK_SPEECH_MAIN_STATE_CONTROL_INFO_10:
        if (OakSpeech_PrintAndFadeCenteredFullScreenText(data, msg_0219_00016, 3) == TRUE) {
            OakSpeech_SetButtonTutorialScreenLayout(data, 4);
            data->state = OAK_SPEECH_MAIN_STATE_CONTROL_INFO_11;
        }
        break;
    case OAK_SPEECH_MAIN_STATE_CONTROL_INFO_11:
        if (OakSpeech_PrintAndFadeCenteredFullScreenText(data, msg_0219_00017, 3) == TRUE) {
            data->state = OAK_SPEECH_MAIN_STATE_CONTROL_INFO_23;
            ToggleBgLayer(GF_BG_LYR_MAIN_0, GF_PLANE_TOGGLE_ON);
            OakSpeech_SetButtonTutorialScreenLayout(data, 1);
        }
        break;
    case OAK_SPEECH_MAIN_STATE_CONTROL_INFO_23:
        if (OakSpeech_PrintDialogMsg(data, msg_0219_00026, 1) == TRUE) {
            data->state = OAK_SPEECH_MAIN_STATE_CONTROL_INFO_ASK_UNDERSTOOD;
        }
        break;
    case OAK_SPEECH_MAIN_STATE_CONTROL_INFO_ASK_UNDERSTOOD:
        OakSpeech_TouchToAdvanceButtonAction(data, TOUCHTOADVANCE_HIDE);
        BgClearTilemapBufferAndCommit(data->bgConfig, GF_BG_LYR_SUB_0);
        OakSpeechYesNo_SetBackgroundPalette(data->yesnoMenu, 7);
        OakSpeechYesNo_Start(data->yesnoMenu, NARC_msg_msg_0219_bin, msg_0219_00061, msg_0219_00062);
        data->state = OAK_SPEECH_MAIN_STATE_CONTROL_INFO_ASK_UNDERSTOOD_HANDLE_YESNO;
        break;
    case OAK_SPEECH_MAIN_STATE_CONTROL_INFO_ASK_UNDERSTOOD_HANDLE_YESNO:
        switch (OakSpeechYesNo_Main(data->yesnoMenu)) {
        case YESNORESPONSE_YES:
            data->state = OAK_SPEECH_MAIN_STATE_CONTROL_INFO_UNDERSTOOD_YES;
            break;
        case YESNORESPONSE_NO:
            data->state = OAK_SPEECH_MAIN_STATE_CONTROL_INFO_UNDERSTOOD_NO;
            break;
        }
        break;
    case OAK_SPEECH_MAIN_STATE_CONTROL_INFO_UNDERSTOOD_YES:
        if (OakSpeech_BlendLayer(data, GF_BG_LYR_SUB_2, TRUE) == TRUE) {
            BeginNormalPaletteFade(0, 0, 0, RGB_BLACK, 6, 1, data->heapId);
            data->state = OAK_SPEECH_MAIN_STATE_CONTROL_INFO_UNDERSTOOD_YES_WAIT_FADE;
        }
        break;
    case OAK_SPEECH_MAIN_STATE_CONTROL_INFO_UNDERSTOOD_YES_WAIT_FADE:
        if (IsPaletteFadeFinished() == TRUE) {
            OakSpeech_ClearBgLayer0TopBottomAndCommit(data);
            data->state = OAK_SPEECH_MAIN_STATE_FADE_IN_TUTORIAL_MENU;
        }
        break;
    case OAK_SPEECH_MAIN_STATE_CONTROL_INFO_UNDERSTOOD_NO:
        if (OakSpeech_BlendLayer(data, GF_BG_LYR_SUB_2, TRUE) == TRUE) {
            OakSpeech_TouchToAdvanceButtonAction(data, TOUCHTOADVANCE_RELEASE);
            ToggleBgLayer(GF_BG_LYR_SUB_2, GF_PLANE_TOGGLE_OFF);
            OakSpeech_ClearBgLayer0TopBottomAndCommit(data);
            data->state = OAK_SPEECH_MAIN_STATE_FADE_IN_CONTROL_INFO;
        }
        break;

    // ADVENTURE INFO
    case OAK_SPEECH_MAIN_STATE_FADE_IN_ADVENTURE_INFO:
        OakSpeech_SetButtonTutorialScreenLayout(data, 5);
        ov53_021E67C4(data, 2);
        OakSpeech_ClearBgLayer0TopBottomAndCommit(data);
        OakSpeech_TouchToAdvanceButtonAction(data, TOUCHTOADVANCE_SHOW);
        ToggleBgLayer(GF_BG_LYR_SUB_0, GF_PLANE_TOGGLE_ON);
        ToggleBgLayer(GF_BG_LYR_SUB_3, GF_PLANE_TOGGLE_ON);
        BeginNormalPaletteFade(0, 1, 1, RGB_BLACK, 6, 1, data->heapId);
        data->state = OAK_SPEECH_MAIN_STATE_WAIT_FADE_IN_ADVENTURE_INFO;
        break;
    case OAK_SPEECH_MAIN_STATE_WAIT_FADE_IN_ADVENTURE_INFO:
        if (IsPaletteFadeFinished() == TRUE) {
            data->state = OAK_SPEECH_MAIN_STATE_ADVENTURE_INFO_1;
        }
        break;
    case OAK_SPEECH_MAIN_STATE_ADVENTURE_INFO_1:
        if (OakSpeech_PrintAndFadeCenteredFullScreenText(data, msg_0219_00028, 1) == TRUE) {
            data->state = OAK_SPEECH_MAIN_STATE_ADVENTURE_INFO_2;
        }
        break;
    case OAK_SPEECH_MAIN_STATE_ADVENTURE_INFO_2:
        if (OakSpeech_PrintAndFadeCenteredFullScreenText(data, msg_0219_00029, 1) == TRUE) {
            data->state = OAK_SPEECH_MAIN_STATE_ADVENTURE_INFO_3;
        }
        break;
    case OAK_SPEECH_MAIN_STATE_ADVENTURE_INFO_3:
        if (OakSpeech_PrintAndFadeCenteredFullScreenText(data, msg_0219_00030, 1) == TRUE) {
            data->state = OAK_SPEECH_MAIN_STATE_ADVENTURE_INFO_4;
        }
        break;
    case OAK_SPEECH_MAIN_STATE_ADVENTURE_INFO_4:
        if (OakSpeech_PrintAndFadeCenteredFullScreenText(data, msg_0219_00031, 1) == TRUE) {
            data->state = OAK_SPEECH_MAIN_STATE_ADVENTURE_INFO_5;
        }
        break;
    case OAK_SPEECH_MAIN_STATE_ADVENTURE_INFO_5:
        if (OakSpeech_PrintAndFadeCenteredFullScreenText(data, msg_0219_00032, 1) == TRUE) {
            data->state = OAK_SPEECH_MAIN_STATE_ADVENTURE_INFO_6;
        }
        break;
    case OAK_SPEECH_MAIN_STATE_ADVENTURE_INFO_6:
        if (OakSpeech_PrintAndFadeCenteredFullScreenText(data, msg_0219_00033, 1) == TRUE) {
            data->state = OAK_SPEECH_MAIN_STATE_ADVENTURE_INFO_FADE_OUT;
        }
        break;
    case OAK_SPEECH_MAIN_STATE_ADVENTURE_INFO_FADE_OUT:
        BeginNormalPaletteFade(0, 0, 0, RGB_BLACK, 6, 1, data->heapId);
        data->state = OAK_SPEECH_MAIN_STATE_WAIT_FADE_OUT_ADVENTURE_INFO;
        break;
    case OAK_SPEECH_MAIN_STATE_WAIT_FADE_OUT_ADVENTURE_INFO:
        if (IsPaletteFadeFinished() == TRUE) {
            OakSpeech_ClearBgLayer0TopBottomAndCommit(data);
            OakSpeech_TouchToAdvanceButtonAction(data, TOUCHTOADVANCE_HIDE);
            ToggleBgLayer(GF_BG_LYR_MAIN_0, GF_PLANE_TOGGLE_ON);
            data->state = OAK_SPEECH_MAIN_STATE_FADE_IN_TUTORIAL_MENU;
        }
        break;

    // NO INFO NEEDED
    case OAK_SPEECH_MAIN_STATE_NO_INFO_NEEDED_FADE_IN:
        OakSpeech_ClearBgLayer0TopBottomAndCommit(data);
        OakSpeech_TouchToAdvanceButtonAction(data, TOUCHTOADVANCE_SHOW);
        OakSpeech_SetButtonTutorialScreenLayout(data, 0);
        BgClearTilemapBufferAndCommit(data->bgConfig, GF_BG_LYR_SUB_1);
        ToggleBgLayer(GF_BG_LYR_MAIN_0, GF_PLANE_TOGGLE_ON);
        ToggleBgLayer(GF_BG_LYR_MAIN_3, GF_PLANE_TOGGLE_OFF);
        ToggleBgLayer(GF_BG_LYR_SUB_0, GF_PLANE_TOGGLE_ON);
        ToggleBgLayer(GF_BG_LYR_SUB_3, GF_PLANE_TOGGLE_ON);
        data->state = OAK_SPEECH_MAIN_STATE_WAIT_FADE_IN_NO_INFO_NEEDED;
        BeginNormalPaletteFade(0, 1, 1, RGB_BLACK, 6, 1, data->heapId);
        break;
    case OAK_SPEECH_MAIN_STATE_WAIT_FADE_IN_NO_INFO_NEEDED:
        if (IsPaletteFadeFinished() == TRUE && OakSpeech_WaitFrames(data, 40) == TRUE) {
            data->state = OAK_SPEECH_MAIN_STATE_PRINT_TIME_OF_DAY_MSG;
            data->queuedMsgId = OakSpeech_GetTimeOfDayIntroMsg();
        }
        break;
    case OAK_SPEECH_MAIN_STATE_PRINT_TIME_OF_DAY_MSG:
        if (OakSpeech_PrintDialogMsg(data, data->queuedMsgId, 1) == TRUE) {
            GF_SndStartFadeOutBGM(0, 6);
            data->state = OAK_SPEECH_MAIN_STATE_SHOW_OAK;
        }
        break;
    case OAK_SPEECH_MAIN_STATE_SHOW_OAK:
        if (GF_SndGetFadeTimer() == 0) {
            StopBGM(SEQ_GS_STARTING, 0);
            PlayBGM(SEQ_GS_STARTING2);
            OakSpeech_DrawPicOnBgLayer(data, OAK_SPEECH_PIC_OAK, OAK_SPEECH_PIC_NONE);
            ToggleBgLayer(GF_BG_LYR_MAIN_3, GF_PLANE_TOGGLE_ON);
            ToggleBgLayer(GF_BG_LYR_MAIN_1, GF_PLANE_TOGGLE_ON);
            StartBrightnessTransition(16, 0, -16, (GXBlendPlaneMask)(GX_BLEND_PLANEMASK_BG1 | GX_BLEND_PLANEMASK_BG3 | GX_BLEND_PLANEMASK_OBJ), SCREEN_MASK_MAIN);
            data->state = OAK_SPEECH_MAIN_STATE_WAIT_FADE_IN_OAK;
        }
        break;
    case OAK_SPEECH_MAIN_STATE_WAIT_FADE_IN_OAK:
        if (IsBrightnessTransitionActive(SCREEN_MASK_MAIN)) {
            data->state = OAK_SPEECH_MAIN_STATE_WELCOME_TO_WORLD;
        }
        break;
    case OAK_SPEECH_MAIN_STATE_WELCOME_TO_WORLD:
        if (OakSpeech_PrintDialogMsg(data, msg_0219_00006, 1) == TRUE) {
            data->state = OAK_SPEECH_MAIN_STATE_SLIDE_OAK_RIGHT;
        }
        break;
    case OAK_SPEECH_MAIN_STATE_SLIDE_OAK_RIGHT:
        if (OakSpeech_TranslateOakPicHorizontally(data, GF_BG_LYR_MAIN_1, 0) == TRUE) {
            data->state = OAK_SPEECH_MAIN_STATE_THIS_WORLD_IS_INHABITED;
        }
        break;
    case OAK_SPEECH_MAIN_STATE_THIS_WORLD_IS_INHABITED:
        if (OakSpeech_PrintDialogMsg(data, msg_0219_00034, 1) == TRUE) {
            Sprite_SetAnimCtrlSeq(data->sprites[5], 3);
            Sprite_SetPaletteOverride(data->sprites[5], 5);
            Sprite_SetDrawFlag(data->sprites[5], TRUE);
            data->state = OAK_SPEECH_MAIN_STATE_BALL_OPENING_FLASH;
        }
        break;
    case OAK_SPEECH_MAIN_STATE_BALL_OPENING_FLASH:
        if (OakSpeech_WaitFrames(data, 30) == TRUE) {
            StartBrightnessTransition(4, 0, 16, (GXBlendPlaneMask)(GX_BLEND_PLANEMASK_BG0 | GX_BLEND_PLANEMASK_BG1 | GX_BLEND_PLANEMASK_BG3 | GX_BLEND_PLANEMASK_OBJ), SCREEN_MASK_MAIN);
            StartBrightnessTransition(4, 0, 16, (GXBlendPlaneMask)(GX_BLEND_PLANEMASK_BG0 | GX_BLEND_PLANEMASK_BG2 | GX_BLEND_PLANEMASK_BG3 | GX_BLEND_PLANEMASK_OBJ), SCREEN_MASK_SUB);
            PlaySE(SEQ_SE_DP_BOWA2);
            data->playerPicShrinkAnimStep = 0;
            data->state = OAK_SPEECH_MAIN_STATE_APPEAR_MARILL;
        }
        break;
    case OAK_SPEECH_MAIN_STATE_APPEAR_MARILL:
        if (IsBrightnessTransitionActive(SCREEN_MASK_MAIN) == TRUE && IsBrightnessTransitionActive(SCREEN_MASK_SUB) == TRUE) {
            Sprite_SetAnimCtrlSeq(data->sprites[5], 1);
            Sprite_SetPaletteOverride(data->sprites[5], 4);
            data->playerPicShrinkAnimStep = 16;
            G2_SetBlendBrightness(GX_BLEND_PLANEMASK_OBJ, data->playerPicShrinkAnimStep);
            data->state = OAK_SPEECH_MAIN_STATE_MARILL_CRY;
        }
        break;
    case OAK_SPEECH_MAIN_STATE_MARILL_CRY:
        if (!Sprite_IsAnimated(data->sprites[5])) {
            --data->playerPicShrinkAnimStep;
            G2_SetBlendBrightness(GX_BLEND_PLANEMASK_OBJ, data->playerPicShrinkAnimStep);
            if (data->playerPicShrinkAnimStep == 0) {
                Sprite_SetAnimCtrlSeq(data->sprites[5], 2);
                PlayCry(SPECIES_MARILL, 0);
                data->state = OAK_SPEECH_MAIN_STATE_WAIT_MARILL_CRY;
            }
        }
        break;
    case OAK_SPEECH_MAIN_STATE_WAIT_MARILL_CRY:
        if (OakSpeech_WaitFrames(data, 40) == TRUE) {
            data->state = OAK_SPEECH_MAIN_STATE_WE_LIVE_ALONGSIDE;
        }
        break;
    case OAK_SPEECH_MAIN_STATE_WE_LIVE_ALONGSIDE:
        if (OakSpeech_PrintDialogMsg(data, msg_0219_00035, 1) == TRUE) {
            data->state = OAK_SPEECH_MAIN_STATE_HIDE_MARILL;
        }
        break;
    case OAK_SPEECH_MAIN_STATE_HIDE_MARILL:
        if (OakSpeech_BlendLayer(data, 101, TRUE) == TRUE) {
            data->state = OAK_SPEECH_MAIN_STATE_WAIT_AFTER_HIDE_MARILL;
        }
        break;
    case OAK_SPEECH_MAIN_STATE_WAIT_AFTER_HIDE_MARILL:
        if (OakSpeech_WaitFrames(data, 30) == TRUE) {
            data->state = OAK_SPEECH_MAIN_STATE_SLIDE_OAK_LEFT;
        }
        break;
    case OAK_SPEECH_MAIN_STATE_SLIDE_OAK_LEFT:
        if (OakSpeech_TranslateOakPicHorizontally(data, GF_BG_LYR_MAIN_1, 1) == TRUE) {
            data->state = OAK_SPEECH_MAIN_STATE_TELL_ME_ABOUT_YOURSELF;
        }
        break;
    case OAK_SPEECH_MAIN_STATE_TELL_ME_ABOUT_YOURSELF:
        if (OakSpeech_PrintDialogMsg(data, msg_0219_00036, 1) == TRUE) {
            data->state = OAK_SPEECH_MAIN_STATE_ARE_YOU_A_GENDER;
            data->menuData.cursorPos = 0;
            data->menuData.numOptions = 2;
        }
        break;
    case OAK_SPEECH_MAIN_STATE_ARE_YOU_A_GENDER:
        if (OakSpeech_PrintDialogMsg(data, msg_0219_00037, 1) == TRUE) {
            data->state = OAK_SPEECH_MAIN_STATE_WAIT_FADE_OUT_TO_ASK_GENDER;
            BeginNormalPaletteFade(4, 0, 0, RGB_BLACK, 6, 1, data->heapId);
        }
        break;
    case OAK_SPEECH_MAIN_STATE_WAIT_FADE_OUT_TO_ASK_GENDER:
        if (IsPaletteFadeFinished() == TRUE) {
            data->state = OAK_SPEECH_MAIN_STATE_SETUP_GENDER_SELECT_MENU;
        }
        break;
    case OAK_SPEECH_MAIN_STATE_SETUP_GENDER_SELECT_MENU:
        OakSpeech_TouchToAdvanceButtonAction(data, TOUCHTOADVANCE_HIDE);
        ToggleBgLayer(GF_BG_LYR_SUB_0, GF_PLANE_TOGGLE_OFF);
        ov53_021E67C4(data, 4);
        OakSpeech_SelectedGenderIndicatorSpritesAction(data, GENDER_CURSOR_BOTH);
        BgClearTilemapBufferAndCommit(data->bgConfig, GF_BG_LYR_SUB_2);
        BeginNormalPaletteFade(4, 1, 1, RGB_BLACK, 6, 1, data->heapId);
        data->state = OAK_SPEECH_MAIN_STATE_WAIT_FADE_IN_GENDER_SELECT_MENU;
        break;
    case OAK_SPEECH_MAIN_STATE_WAIT_FADE_IN_GENDER_SELECT_MENU:
        if (IsPaletteFadeFinished() == TRUE) {
            data->menuData.cursorPos = data->lastChosenGender;
            data->state = OAK_SPEECH_MAIN_STATE_GENDER_SELECT_MENU_HANDLE_INPUT;
        }
        break;
    case OAK_SPEECH_MAIN_STATE_GENDER_SELECT_MENU_HANDLE_INPUT:
        if (OakSpeech_GenderSelectHandleInput(data)) {
            data->state = OAK_SPEECH_MAIN_STATE_PREPARE_ASK_CONFIRM_GENDER;
            data->playerGender = data->menuData.cursorPos;
        }
        break;
    case OAK_SPEECH_MAIN_STATE_PREPARE_ASK_CONFIRM_GENDER:
        FillBgTilemapRect(data->bgConfig, GF_BG_LYR_SUB_3, 1, 16 * (data->menuData.cursorPos ^ 1), 0, 16, 23, 0);
        BgCommitTilemapBufferToVram(data->bgConfig, GF_BG_LYR_SUB_2);
        BgCommitTilemapBufferToVram(data->bgConfig, GF_BG_LYR_SUB_3);
        BgClearTilemapBufferAndCommit(data->bgConfig, GF_BG_LYR_SUB_0);
        OakSpeech_SelectedGenderIndicatorSpritesAction(data, data->playerGender);
        if (data->playerGender == PLAYER_GENDER_MALE) {
            data->queuedMsgId = msg_0219_00038;
        } else {
            data->queuedMsgId = msg_0219_00039;
        }
        data->state = OAK_SPEECH_MAIN_STATE_ASK_CONFIRM_GENDER;
        break;
    case OAK_SPEECH_MAIN_STATE_ASK_CONFIRM_GENDER:
        if (OakSpeech_PrintDialogMsg(data, data->queuedMsgId, 1) == TRUE) {
            data->state = OAK_SPEECH_MAIN_STATE_CONFIRM_GENDER_YESNO_INIT_MENU;
        }
        break;
    case OAK_SPEECH_MAIN_STATE_CONFIRM_GENDER_YESNO_INIT_MENU:
        OakSpeech_InitMultichoiceMenu(&data->menuData, 1);
        ov53_021E6824(data, 1);
        OakSpeech_PrintMultichoiceMenu(data, msg_0219_00047, msg_0219_00048, 0, 2);
        data->state = OAK_SPEECH_MAIN_STATE_CONFIRM_GENDER_YESNO_HANDLE_INPUT;
        data->menuData.cursorPos = 0;
        break;

    case OAK_SPEECH_MAIN_STATE_CONFIRM_GENDER_YESNO_HANDLE_INPUT:
        ToggleBgLayer(GF_BG_LYR_SUB_0, GF_PLANE_TOGGLE_ON);
        ToggleBgLayer(GF_BG_LYR_SUB_2, GF_PLANE_TOGGLE_ON);
        if (OakSpeech_MultichoiceMenuHandleInputVertical(data, data->playerGender + 1) != -1) {
            OakSpeech_FreeWindows(data);
            data->state = OAK_SPEECH_MAIN_STATE_CONFIRM_GENDER_YESNO_HANDLE_RESULT;
        }
        break;
    case OAK_SPEECH_MAIN_STATE_CONFIRM_GENDER_YESNO_HANDLE_RESULT:
        switch (data->menuData.cursorPos) {
        case 0: // Yes
            data->state = OAK_SPEECH_MAIN_STATE_CONFIRM_GENDER_YES;
            break;
        case 1: // No
            data->state = OAK_SPEECH_MAIN_STATE_CONFIRM_GENDER_NO_WAIT_FADE_OUT;
            BeginNormalPaletteFade(4, 0, 0, RGB_BLACK, 6, 1, data->heapId);
            break;
        }
        break;

    case OAK_SPEECH_MAIN_STATE_CONFIRM_GENDER_NO_WAIT_FADE_OUT:
        if (IsPaletteFadeFinished() == TRUE) {

            ToggleBgLayer(GF_BG_LYR_SUB_1, GF_PLANE_TOGGLE_OFF);
            ToggleBgLayer(GF_BG_LYR_SUB_2, GF_PLANE_TOGGLE_OFF);
            OakSpeech_SelectedGenderIndicatorSpritesAction(data, GENDER_CURSOR_NEITHER);
            ov53_021E67C4(data, 1);
            BgClearTilemapBufferAndCommit(data->bgConfig, GF_BG_LYR_SUB_0);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_SUB_0, BG_POS_OP_SET_X, 0);
            OakSpeech_StopHighlightedGenderFrameBlink(data);
            BeginNormalPaletteFade(4, 1, 1, RGB_BLACK, 6, 1, data->heapId);
            data->state = OAK_SPEECH_MAIN_STATE_CONFIRM_GENDER_NO_WAIT_FADE_IN;
        }
        break;
    case OAK_SPEECH_MAIN_STATE_CONFIRM_GENDER_NO_WAIT_FADE_IN:
        if (IsPaletteFadeFinished() == TRUE) {
            OakSpeech_TouchToAdvanceButtonAction(data, TOUCHTOADVANCE_SHOW);
            data->state = OAK_SPEECH_MAIN_STATE_ARE_YOU_A_GENDER;
        }
        break;

        // 73-92 don't exist

    case OAK_SPEECH_MAIN_STATE_CONFIRM_GENDER_YES:
        if (OakSpeech_PrintDialogMsg(data, msg_0219_00040, 1) == TRUE) {
            data->state = OAK_SPEECH_MAIN_STATE_PROMPT_NAME_DELAY_BEFORE;
        }
        break;

    case OAK_SPEECH_MAIN_STATE_PROMPT_NAME_DELAY_BEFORE:
        if (OakSpeech_WaitFrames(data, 40)) {
            data->state = OAK_SPEECH_MAIN_STATE_PROMPT_NAME_LAUNCH_NAMING_SCREEN;
        }
        break;

    case OAK_SPEECH_MAIN_STATE_PROMPT_NAME_LAUNCH_NAMING_SCREEN:
        String_SetEmpty(data->namingScreenArgs_Player->nameInputString);
        data->namingScreenArgs_Player->playerGenderOrMonSpecies = data->playerGender;
        data->overlayManager = OverlayManager_New(&gOverlayTemplate_NamingScreen, data->namingScreenArgs_Player, data->heapId);
        data->state = OAK_SPEECH_MAIN_STATE_PROMPT_NAME_RESTORE_GRAPHICS_AFTER;
        break;

    case OAK_SPEECH_MAIN_STATE_PROMPT_NAME_RESTORE_GRAPHICS_AFTER:
        ToggleBgLayer(GF_BG_LYR_MAIN_0, GF_PLANE_TOGGLE_ON);
        ToggleBgLayer(GF_BG_LYR_MAIN_1, GF_PLANE_TOGGLE_ON);
        ToggleBgLayer(GF_BG_LYR_MAIN_3, GF_PLANE_TOGGLE_ON);
        ToggleBgLayer(GF_BG_LYR_SUB_0, GF_PLANE_TOGGLE_ON);
        ToggleBgLayer(GF_BG_LYR_SUB_3, GF_PLANE_TOGGLE_ON);
        ToggleBgLayer(GF_BG_LYR_SUB_2, GF_PLANE_TOGGLE_ON);
        BgSetPosTextAndCommit(data->bgConfig, GF_BG_LYR_MAIN_1, BG_POS_OP_SET_X, 0);
        OakSpeech_CreateMultichoiceYesNoMenu(data);
        BeginNormalPaletteFade(0, 1, 1, RGB_BLACK, 6, 1, data->heapId);
        data->state = OAK_SPEECH_MAIN_STATE_CONFIRM_NAME_YESNO_INIT_MENU;
        OakSpeech_DrawPicOnBgLayer(data, OAK_SPEECH_PIC_OAK, OAK_SPEECH_PIC_NONE);
        OakSpeech_SelectedGenderIndicatorSpritesAction(data, data->playerGender);
        // Vestige of gendered grammar in Japanese
        // Both messages are the same in English
        if (data->playerGender == 0) {
            data->queuedMsgId = msg_0219_00041;
        } else {
            data->queuedMsgId = msg_0219_00042;
        }
        break;

    case OAK_SPEECH_MAIN_STATE_CONFIRM_NAME_YESNO_INIT_MENU:
        if (OakSpeech_PrintDialogMsg(data, data->queuedMsgId, 1) == TRUE) {
            data->state = OAK_SPEECH_MAIN_STATE_CONFIRM_NAME_YESNO_HANDLE_INPUT;
            OakSpeech_InitMultichoiceMenu(&data->menuData, 1);
        }
        break;

    case OAK_SPEECH_MAIN_STATE_CONFIRM_NAME_YESNO_HANDLE_INPUT:
        if (OakSpeech_MultichoiceMenuHandleInputVertical(data, data->playerGender + 1) != -1) {
            OakSpeech_FreeWindows(data);
            data->state = OAK_SPEECH_MAIN_STATE_CONFIRM_NAME_YESNO_HANDLE_RESULT;
        }
        break;

    case OAK_SPEECH_MAIN_STATE_CONFIRM_NAME_YESNO_HANDLE_RESULT:
        switch (data->menuData.cursorPos) {
        case 0: // Yes
            data->state = OAK_SPEECH_MAIN_STATE_CONFIRM_NAME_YES;
            break;
        case 1: // No
            BeginNormalPaletteFade(4, 0, 0, RGB_BLACK, 6, 1, data->heapId);
            data->state = OAK_SPEECH_MAIN_STATE_CONFIRM_GENDER_NO_WAIT_FADE_OUT;
            break;
        }
        break;

    case OAK_SPEECH_MAIN_STATE_CONFIRM_NAME_YES:
        BeginNormalPaletteFade(4, 0, 0, RGB_BLACK, 6, 1, data->heapId);
        data->state = OAK_SPEECH_MAIN_STATE_CONFIRM_NAME_YES_WAIT_FADE_OUT;
        break;

    case OAK_SPEECH_MAIN_STATE_CONFIRM_NAME_YES_WAIT_FADE_OUT:
        if (IsPaletteFadeFinished() == TRUE) {
            ToggleBgLayer(GF_BG_LYR_SUB_2, GF_PLANE_TOGGLE_OFF);
            ToggleBgLayer(GF_BG_LYR_SUB_1, GF_PLANE_TOGGLE_OFF);
            ov53_021E67C4(data, 1);
            OakSpeech_SelectedGenderIndicatorSpritesAction(data, GENDER_CURSOR_NEITHER);
            BgClearTilemapBufferAndCommit(data->bgConfig, GF_BG_LYR_SUB_0);
            ScheduleSetBgPosText(data->bgConfig, GF_BG_LYR_SUB_0, BG_POS_OP_SET_X, 0);
            OakSpeech_TouchToAdvanceButtonAction(data, TOUCHTOADVANCE_SHOW);
            BeginNormalPaletteFade(4, 1, 1, RGB_BLACK, 6, 1, data->heapId);
            data->state = OAK_SPEECH_MAIN_STATE_CONFIRM_NAME_YES_WAIT_FADE_IN;
        }
        break;

    case OAK_SPEECH_MAIN_STATE_CONFIRM_NAME_YES_WAIT_FADE_IN:
        if (IsPaletteFadeFinished() == TRUE) {
            data->state = OAK_SPEECH_MAIN_STATE_YOUR_ADVENTURE_UNFOLDS;
        }
        break;

    case OAK_SPEECH_MAIN_STATE_YOUR_ADVENTURE_UNFOLDS:
        if (OakSpeech_PrintDialogMsg(data, msg_0219_00043, 1) == TRUE) {
            data->state = OAK_SPEECH_MAIN_STATE_FADE_OUT_FROM_LAST_OAK_MESSAGE;
        }
        break;

        // 104-109 don't exist

    case OAK_SPEECH_MAIN_STATE_FADE_OUT_FROM_LAST_OAK_MESSAGE:
        BeginNormalPaletteFade(0, 0, 0, RGB_BLACK, 6, 1, data->heapId);
        data->state = OAK_SPEECH_MAIN_STATE_WAIT_FADE_OUT_FROM_LAST_OAK_MESSAGE;
        break;

    case OAK_SPEECH_MAIN_STATE_WAIT_FADE_OUT_FROM_LAST_OAK_MESSAGE:
        if (IsPaletteFadeFinished() == TRUE) {
            data->state = OAK_SPEECH_MAIN_STATE_FADE_IN_TO_SHRINK_ANIM;
        }
        break;

        // 112-119 don't exist

    case OAK_SPEECH_MAIN_STATE_FADE_IN_TO_SHRINK_ANIM:
        if (data->playerGender == PLAYER_GENDER_MALE) {
            OakSpeech_DrawPicOnBgLayer(data, OAK_SPEECH_PIC_ETHAN, OAK_SPEECH_PIC_NONE);
        } else {
            OakSpeech_DrawPicOnBgLayer(data, OAK_SPEECH_PIC_LYRA, OAK_SPEECH_PIC_NONE);
        }
        BeginNormalPaletteFade(0, 1, 1, RGB_BLACK, 6, 1, data->heapId);
        data->state = OAK_SPEECH_MAIN_STATE_WAIT_FADE_IN_TO_SHRINK_ANIM;
        ToggleBgLayer(GF_BG_LYR_MAIN_0, GF_PLANE_TOGGLE_OFF);
        break;

    case OAK_SPEECH_MAIN_STATE_WAIT_FADE_IN_TO_SHRINK_ANIM:
        if (IsPaletteFadeFinished() == TRUE) {
            data->state = OAK_SPEECH_MAIN_STATE_NOP_BEFORE_SHRINK_ANIM;
        }
        // Fallthrough into case 123

        // 122 doesn't exist

    case OAK_SPEECH_MAIN_STATE_NOP_BEFORE_SHRINK_ANIM:
        data->state = OAK_SPEECH_MAIN_STATE_INIT_SHRINK_ANIM_STATE;
        break;

    case OAK_SPEECH_MAIN_STATE_INIT_SHRINK_ANIM_STATE:
        OakSpeech_TouchToAdvanceButtonAction(data, TOUCHTOADVANCE_HIDE);
        OakSpeech_InitPlayerPicShrinkAnim(data);
        data->state = OAK_SPEECH_MAIN_STATE_DELAY_BEFORE_SHRINK_ANIM;
        break;

    case OAK_SPEECH_MAIN_STATE_DELAY_BEFORE_SHRINK_ANIM:
        if (OakSpeech_WaitFrames(data, 30) == TRUE) {
            PlaySE(SEQ_SE_GS_HERO_SHUKUSHOU);
            data->state = OAK_SPEECH_MAIN_STATE_RUN_SHRINK_ANIM;
        }
        break;

    case OAK_SPEECH_MAIN_STATE_RUN_SHRINK_ANIM:
        if (OakSpeech_PlayerPicShrinkAnim(data) == TRUE) {
            ret = TRUE;
        }
        break;
    }

    return ret;
}

static void OakSpeech_CreateMultichoiceYesNoMenu(OakSpeechData *data) {
    ov53_021E6824(data, 1);
    ov53_021E67C4(data, 4);
    OakSpeech_PrintMultichoiceMenu(data, msg_0219_00047, msg_0219_00048, 0, 2);
    FillBgTilemapRect(data->bgConfig, GF_BG_LYR_SUB_3, 1, 16 * (data->playerGender ^ 1), 0, 16, 23, 0);
    BgCommitTilemapBufferToVram(data->bgConfig, GF_BG_LYR_SUB_3);
}

static void OakSpeech_ClearBgLayer0TopBottomAndCommit(OakSpeechData *data) {
    BgClearTilemapBufferAndCommit(data->bgConfig, GF_BG_LYR_MAIN_0);
    BgClearTilemapBufferAndCommit(data->bgConfig, GF_BG_LYR_SUB_0);
}

static void OakSpeech_ShowTutorialTouchMsg(OakSpeechData *data) {
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

static void OakSpeech_HideTutorialTouchMsg(OakSpeechData *data) {
    Window *window = &data->controlTutorialTouchMsgWindow;
    AddWindow(data->bgConfig, window, &ov53_021E8518);
    FillWindowPixelBuffer(window, 0);
    CopyWindowToVram(window);
    RemoveWindow(window);
}

static void OakSpeech_TouchToAdvanceButtonAction(OakSpeechData *data, int action) {
    GF_ASSERT(data != NULL);
    switch (action) {
    case TOUCHTOADVANCE_HIDE:
        GF_ASSERT(Sprite_GetDrawFlag(data->sprites[3]) == TRUE);
        OakSpeech_HideTutorialTouchMsg(data);
        Sprite_SetDrawFlag(data->sprites[3], FALSE);
        break;
    case TOUCHTOADVANCE_SHOW:
        GF_ASSERT(Sprite_GetDrawFlag(data->sprites[3]) == FALSE);
        OakSpeech_ShowTutorialTouchMsg(data);
        Sprite_SetDrawFlag(data->sprites[3], TRUE);
        break;
    case TOUCHTOADVANCE_PRESS:
        Sprite_SetAnimCtrlSeq(data->sprites[3], 1);
        break;
    case TOUCHTOADVANCE_RELEASE:
        Sprite_SetAnimCtrlSeq(data->sprites[3], 0);
        break;
    default:
        GF_ASSERT(FALSE);
        break;
    }
}

static BOOL OakSpeech_IsTouchToAdvanceButtonDepressed(OakSpeechData *data) {
    return Sprite_GetAnimationNumber(data->sprites[3]) == 1;
}

static BOOL OakSpeech_IsTouchToAdvanceButtonActive(OakSpeechData *data) {
    GF_ASSERT(data != NULL);
    return Sprite_GetDrawFlag(data->sprites[3]) == TRUE;
}

static void OakSpeech_HandleTouchToAdvanceButton(OakSpeechData *data) {
    int hitbox;
    if (OakSpeech_IsTouchToAdvanceButtonActive(data)) {
        hitbox = TouchscreenHitbox_FindRectAtTouchHeld(ov53_021E8510);
        if (hitbox == 0 && System_GetTouchNew()) {
            gSystem.simulatedInputs = TRUE;
            OakSpeech_TouchToAdvanceButtonAction(data, TOUCHTOADVANCE_PRESS);
        } else if (hitbox == 0 && OakSpeech_IsTouchToAdvanceButtonDepressed(data)) {
            gSystem.simulatedInputs = TRUE;
        } else {
            OakSpeech_TouchToAdvanceButtonAction(data, TOUCHTOADVANCE_RELEASE);
        }
    }
}
