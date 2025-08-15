#include "application/check_savedata.h"

#include <nitro/spi/ARM9/pm.h>

#include "global.h"

#include "application/main_menu/main_menu.h"
#include "msgdata/msg.naix"
#include "msgdata/msg/msg_0229.h"

#include "bg_window.h"
#include "font.h"
#include "list_menu_2d.h"
#include "main.h"
#include "msgdata.h"
#include "render_text.h"
#include "render_window.h"
#include "sound_02004A44.h"
#include "system.h"
#include "text.h"
#include "unk_02005D10.h"
#include "unk_0200FA24.h"

typedef enum CheckSavedataApp_MainState {
    MAINSTATE_CHECK_SAVE_FLAGS,
    MAINSTATE_GET_ERROR_MESSAGE,
    MAINSTATE_FADE_IN,
    MAINSTATE_WAIT_FOR_FADE_IN,
    MAINSTATE_PRINT_ERROR_MESSAGE_FADE_OUT,
    MAINSTATE_WAIT_FOR_FADE_OUT,
    MAINSTATE_EXIT,
} CheckSavedataApp_MainState;

typedef enum CheckSavedataApp_PrintState {
    PRINTSTATE_PRINT_TEXT,
    PRINTSTATE_WAIT_FOR_PRINTER,
    PRINTSTATE_EXIT,
} CheckSavedataApp_PrintState;

typedef struct CheckSavedataApp_Data {
    enum HeapID heapID;
    CheckSavedataApp_MainState mainState;
    u32 msgNum;
    CheckSavedataApp_PrintState printState;
    u32 textPrinterId;
    String *textString;
    BgConfig *bgConfig;
    MsgData *msgData;
    Window window;
    u32 unk30; // unused
    SaveData *saveData;
    u32 unk38; // unused
    u32 saveStatusFlags;
} CheckSavedataApp_Data;

static const WindowTemplate sCheckSave_WindowTemplate = {
    .bgId = GF_BG_LYR_MAIN_0,
    .left = 2,
    .top = 19,
    .width = 27,
    .height = 4,
    .palette = 1,
    .baseTile = 0x16D,
};

static const GraphicsModes sCheckSave_GraphicsModes = {
    .dispMode = GX_DISPMODE_GRAPHICS,
    .bgMode = GX_BGMODE_0,
    .subMode = GX_BGMODE_0,
    ._2d3dMode = GX_BG0_AS_2D,
};

static const BgTemplate sCheckSave_BgTemplate = {
    .x = 0,
    .y = 0,
    .bufferSize = 0x800,
    .baseTile = 0,
    .size = GF_BG_SCR_SIZE_256x256,
    .colorMode = GX_BG_COLORMODE_16,
    .screenBase = GX_BG_SCRBASE_0x0000,
    .charBase = GX_BG_CHARBASE_0x18000,
    .bgExtPltt = GX_BG_EXTPLTT_01,
    .priority = 1,
    .areaOver = GX_BG_AREAOVER_XLU,
    .mosaic = FALSE,
};

static const GraphicsBanks sCheckSave_GraphicsBanks = {
    .bg = GX_VRAM_BG_256_AB,
    .bgextpltt = GX_VRAM_BGEXTPLTT_NONE,
    .subbg = GX_VRAM_SUB_BG_NONE,
    .subbgextpltt = GX_VRAM_SUB_BGEXTPLTT_NONE,
    .obj = GX_VRAM_OBJ_NONE,
    .objextpltt = GX_VRAM_OBJEXTPLTT_NONE,
    .subobj = GX_VRAM_SUB_OBJ_NONE,
    .subobjextpltt = GX_VRAM_SUB_OBJEXTPLTT_NONE,
    .tex = GX_VRAM_TEX_NONE,
    .texpltt = GX_VRAM_TEXPLTT_NONE,
};

const OverlayManagerTemplate gApplication_CheckSave = {
    .init = CheckSavedataApp_Init,
    .exec = CheckSavedataApp_Main,
    .exit = CheckSavedataApp_Exit,
    .ovy_id = FS_OVERLAY_ID_NONE,
};

static void CheckSavedataApp_SetupBgConfig(CheckSavedataApp_Data *data);
static void CheckSavedataApp_FreeBgConfig(CheckSavedataApp_Data *data);
static void CheckSavedataApp_SetupTextAndWindow(CheckSavedataApp_Data *data);
static void CheckSavedataApp_FreeTextAndWindow(CheckSavedataApp_Data *data);
static BOOL CheckSavedataApp_DoMainTask(CheckSavedataApp_Data *data);
static BOOL CheckSavedataApp_PrintMessage(CheckSavedataApp_Data *data, u32 msgNum, BOOL skipWaitingForAPress, u32 textSpeed);

BOOL CheckSavedataApp_Init(OverlayManager *manager, int *state) {
    Heap_Create(HEAP_ID_3, HEAP_ID_DELETE_SAVEDATA, 0x20000);

    CheckSavedataApp_Data *data = OverlayManager_CreateAndGetData(manager, sizeof(CheckSavedataApp_Data), HEAP_ID_DELETE_SAVEDATA);
    memset(data, 0, sizeof(CheckSavedataApp_Data));
    data->heapID = HEAP_ID_DELETE_SAVEDATA;
    data->mainState = MAINSTATE_CHECK_SAVE_FLAGS;
    UnkStruct_02111868_sub *args = OverlayManager_GetArgs(manager);
    data->saveData = args->saveData;

    TextFlags_SetCanTouchSpeedUpPrint(TRUE);

    return TRUE;
}

BOOL CheckSavedataApp_Main(OverlayManager *manager, int *state) {
    CheckSavedataApp_Data *data = OverlayManager_GetData(manager);
    BOOL ret = FALSE;

    enum {
        STATE_SETUP,
        STATE_MAIN_TASK,
        STATE_EXIT,
    };

    switch (*state) {
    case STATE_SETUP:
        sub_0200FBF4(PM_LCD_TOP, RGB_BLACK);
        sub_0200FBF4(PM_LCD_BOTTOM, RGB_BLACK);

        Main_SetVBlankIntrCB(NULL, NULL);
        Main_SetHBlankIntrCB(NULL, NULL);

        GfGfx_DisableEngineAPlanes();
        GfGfx_DisableEngineBPlanes();
        GX_SetVisiblePlane(GX_PLANEMASK_NONE);
        GXS_SetVisiblePlane(GX_PLANEMASK_NONE);

        SetKeyRepeatTimers(4, 8);

        CheckSavedataApp_SetupBgConfig(data);
        CheckSavedataApp_SetupTextAndWindow(data);

        GfGfx_BothDispOn();

        *state = STATE_MAIN_TASK;
        break;
    case STATE_MAIN_TASK:
        if (CheckSavedataApp_DoMainTask(data) == TRUE) {
            *state = STATE_EXIT;
        }
        break;
    case STATE_EXIT:
        CheckSavedataApp_FreeTextAndWindow(data);
        CheckSavedataApp_FreeBgConfig(data);

        Main_SetVBlankIntrCB(NULL, NULL);
        ret = TRUE;
        break;
    }

    return ret;
}

BOOL CheckSavedataApp_Exit(OverlayManager *manager, int *state) {
    CheckSavedataApp_Data *data = OverlayManager_GetData(manager);
    enum HeapID heapID = data->heapID;

    TextFlags_SetCanTouchSpeedUpPrint(FALSE);

    OverlayManager_FreeData(manager);
    Heap_Destroy(heapID);

    RegisterMainOverlay(FS_OVERLAY_ID(OVY_74), &gApp_MainMenu);

    return TRUE;
}

static void CheckSavedataApp_SetupBgConfig(CheckSavedataApp_Data *data) {
    GraphicsBanks banks = sCheckSave_GraphicsBanks;
    GfGfx_SetBanks(&banks);

    data->bgConfig = BgConfig_Alloc(data->heapID);

    GraphicsModes modes = sCheckSave_GraphicsModes;
    SetBothScreensModesAndDisable(&modes);

    BgTemplate template = sCheckSave_BgTemplate;
    InitBgFromTemplate(data->bgConfig, GF_BG_LYR_MAIN_0, &template, GX_BGMODE_0);
    BgClearTilemapBufferAndCommit(data->bgConfig, GF_BG_LYR_MAIN_0);
    LoadUserFrameGfx2(data->bgConfig, GF_BG_LYR_MAIN_0, 0x1E2, 2, 0, data->heapID);
    LoadUserFrameGfx1(data->bgConfig, GF_BG_LYR_MAIN_0, 0x1D9, 3, 0, data->heapID);
    LoadFontPal0(GF_PAL_LOCATION_MAIN_BG, GF_PAL_SLOT_1_OFFSET, data->heapID);
    BG_ClearCharDataRange(GF_BG_LYR_MAIN_0, 32, 0, data->heapID);
    BG_SetMaskColor(GF_BG_LYR_MAIN_0, RGB_BLACK);
    BG_SetMaskColor(GF_BG_LYR_SUB_0, RGB_BLACK);
}

static void CheckSavedataApp_FreeBgConfig(CheckSavedataApp_Data *data) {
    ToggleBgLayer(GF_BG_LYR_MAIN_0, GF_PLANE_TOGGLE_OFF);
    ToggleBgLayer(GF_BG_LYR_MAIN_1, GF_PLANE_TOGGLE_OFF);
    ToggleBgLayer(GF_BG_LYR_MAIN_2, GF_PLANE_TOGGLE_OFF);
    ToggleBgLayer(GF_BG_LYR_MAIN_3, GF_PLANE_TOGGLE_OFF);
    ToggleBgLayer(GF_BG_LYR_SUB_0, GF_PLANE_TOGGLE_OFF);
    ToggleBgLayer(GF_BG_LYR_SUB_1, GF_PLANE_TOGGLE_OFF);
    ToggleBgLayer(GF_BG_LYR_SUB_2, GF_PLANE_TOGGLE_OFF);
    ToggleBgLayer(GF_BG_LYR_SUB_3, GF_PLANE_TOGGLE_OFF);

    FreeBgTilemapBuffer(data->bgConfig, GF_BG_LYR_MAIN_0);
    Heap_Free(data->bgConfig);
}

static void CheckSavedataApp_SetupTextAndWindow(CheckSavedataApp_Data *data) {
    data->msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0229_bin, data->heapID);
    ResetAllTextPrinters();

    data->printState = PRINTSTATE_PRINT_TEXT;

    AddWindow(data->bgConfig, &data->window, &sCheckSave_WindowTemplate);
    FillWindowPixelRect(&data->window, 0xF, 0, 0, 216, 32);
}

static void CheckSavedataApp_FreeTextAndWindow(CheckSavedataApp_Data *data) {
    RemoveWindow(&data->window);
    DestroyMsgData(data->msgData);
}

static BOOL CheckSavedataApp_DoMainTask(CheckSavedataApp_Data *data) {
    BOOL ret = FALSE;

    switch (data->mainState) {
    case MAINSTATE_CHECK_SAVE_FLAGS:
        data->saveStatusFlags = Save_GetStatusFlags(data->saveData);
        if (data->saveStatusFlags == 0) {
            data->mainState = MAINSTATE_EXIT;
        } else {
            data->mainState = MAINSTATE_GET_ERROR_MESSAGE;
        }
        break;
    case MAINSTATE_GET_ERROR_MESSAGE:
        data->mainState = MAINSTATE_FADE_IN;
        if (data->saveStatusFlags & (1 << 1)) {
            data->saveStatusFlags &= ~((1 << 1) | (1 << 0));
            // "The save file will be erased due to corruption or damage."
            data->msgNum = msg_0229_00001;
        } else if (data->saveStatusFlags & (1 << 0)) {
            data->saveStatusFlags ^= (1 << 0);
            // "The save file is corrupted. The previous save file will be loaded."
            data->msgNum = msg_0229_00000;
        } else if (data->saveStatusFlags & (1 << 3)) {
            data->saveStatusFlags &= ~((1 << 3) | (1 << 2));
            // "The Battle Hall record has been erased."
            data->msgNum = msg_0229_00005;
        } else if (data->saveStatusFlags & (1 << 2)) {
            data->saveStatusFlags ^= (1 << 2);
            // "The most recent Battle Hall record is corrupted. The previously saved record will be loaded instead."
            data->msgNum = msg_0229_00004;
        } else if (data->saveStatusFlags & (1 << 5)) {
            data->saveStatusFlags &= ~((1 << 5) | (1 << 4));
            // "A Battle Video appears to have been erased."
            data->msgNum = msg_0229_00003;
        } else if (data->saveStatusFlags & (1 << 4)) {
            data->saveStatusFlags ^= (1 << 4);
            // "The most recent Battle Video is corrupted. The previously saved Battle Video will be loaded instead."
            data->msgNum = msg_0229_00002;
        } else {
            data->mainState = MAINSTATE_EXIT;
        }
        break;
    case MAINSTATE_FADE_IN:
        BG_SetMaskColor(GF_BG_LYR_MAIN_0, RGB(1, 1, 27));
        BG_SetMaskColor(GF_BG_LYR_SUB_0, RGB(1, 1, 27));
        BeginNormalPaletteFade(0, 1, 1, RGB_BLACK, 6, 1, data->heapID);
        data->mainState = MAINSTATE_WAIT_FOR_FADE_IN;
        break;
    case MAINSTATE_WAIT_FOR_FADE_IN:
        if (IsPaletteFadeFinished() == TRUE) {
            data->mainState = MAINSTATE_PRINT_ERROR_MESSAGE_FADE_OUT;
        }
        break;
    case MAINSTATE_PRINT_ERROR_MESSAGE_FADE_OUT:
        if (CheckSavedataApp_PrintMessage(data, data->msgNum, FALSE, 4) == TRUE) {
            BeginNormalPaletteFade(0, 0, 0, RGB_BLACK, 6, 1, data->heapID);
            data->mainState = MAINSTATE_WAIT_FOR_FADE_OUT;
        }
        break;
    case MAINSTATE_WAIT_FOR_FADE_OUT:
        if (IsPaletteFadeFinished() == TRUE) {
            BG_SetMaskColor(GF_BG_LYR_MAIN_0, RGB_BLACK);
            BG_SetMaskColor(GF_BG_LYR_SUB_0, RGB_BLACK);
            data->mainState = MAINSTATE_GET_ERROR_MESSAGE;
        }
        break;
    case MAINSTATE_EXIT:
        ret = TRUE;
        break;
    }

    return ret;
}

static BOOL CheckSavedataApp_PrintMessage(CheckSavedataApp_Data *data, u32 msgNum, BOOL skipWaitingForAPress, u32 textSpeed) {
    BOOL ret = FALSE;

    switch (data->printState) {
    case PRINTSTATE_PRINT_TEXT:
        FillWindowPixelRect(&data->window, 0xF, 0, 0, 216, 32);
        DrawFrameAndWindow2(&data->window, FALSE, 0x1E2, 2);

        data->textString = String_New(1024, data->heapID);
        ReadMsgDataIntoString(data->msgData, msgNum, data->textString);
        data->textPrinterId = AddTextPrinterParameterized(&data->window, 1, data->textString, 0, 0, textSpeed, NULL);

        if (textSpeed == TEXT_SPEED_INSTANT) {
            String_Delete(data->textString);

            // Skip waiting for the text printer to finish since the speed here was instant
            data->printState++;
        }

        data->printState++;
        break;
    case PRINTSTATE_WAIT_FOR_PRINTER:
        if (TextPrinterCheckActive(data->textPrinterId)) {
            break;
        }

        String_Delete(data->textString);
        data->printState++;
        break;
    case PRINTSTATE_EXIT:
        if (skipWaitingForAPress || (gSystem.newKeys & PAD_BUTTON_A) || gSystem.touchNew != 0) {
            data->printState = PRINTSTATE_PRINT_TEXT;
            ret = TRUE;
        }
        break;
    }

    return ret;
}
