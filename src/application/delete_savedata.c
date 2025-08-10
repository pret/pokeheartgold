#include "application/delete_savedata.h"

#include "global.h"

#include "msgdata/msg.naix"
#include "msgdata/msg/msg_0007.h"

#include "bg_window.h"
#include "font.h"
#include "list_menu_2d.h"
#include "main.h"
#include "msgdata.h"
#include "render_window.h"
#include "sound_02004A44.h"
#include "system.h"
#include "text.h"
#include "unk_02005D10.h"
#include "unk_0200FA24.h"

typedef enum DeleteSavedataApp_MainState {
    MAINSTATE_ASK_TO_DELETE,
    MAINSTATE_HANDLE_INPUT,
    MAINSTATE_ASK_TO_CONFIRM,
    MAINSTATE_HANDLE_CONFIRMATION,
    MAINSTATE_PRINT_DELETING_MESSAGE,
    MAINSTATE_DELETE_DATA,
    MAINSTATE_EXIT,
} DeleteSavedataApp_MainState;

typedef enum DeleteSavedataApp_PrintState {
    PRINTSTATE_PRINT_TEXT,
    PRINTSTATE_WAIT_FOR_PRINTER,
    PRINTSTATE_EXIT,
} DeleteSavedataApp_PrintState;

typedef struct DeleteSavedataApp_Data {
    HeapID heapId;
    DeleteSavedataApp_MainState mainState;
    DeleteSavedataApp_PrintState printState;
    u32 textPrinterId;
    String *textString;
    BgConfig *bgConfig;
    MsgData *msgData;
    Window window;
    struct ListMenu2D *yesNoMenu;
    SaveData *savedata;
    WaitingIcon *waitingIcon;
} DeleteSavedataApp_Data;

static const WindowTemplate sDeleteSave_WindowTemplate2 = {
    .bgId = GF_BG_LYR_MAIN_0,
    .left = 25,
    .top = 13,
    .width = 6,
    .height = 4,
    .palette = 1,
    .baseTile = 0x155,
};

static const WindowTemplate sDeleteSave_WindowTemplate1 = {
    .bgId = GF_BG_LYR_MAIN_0,
    .left = 2,
    .top = 19,
    .width = 27,
    .height = 4,
    .palette = 1,
    .baseTile = 0x16D,
};

static const GraphicsModes sDeleteSave_GraphicsModes = {
    .dispMode = GX_DISPMODE_GRAPHICS,
    .bgMode = GX_BGMODE_0,
    .subMode = GX_BGMODE_0,
    ._2d3dMode = GX_BG0_AS_2D,
};

static const BgTemplate sDeleteSave_BgTemplate = {
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

static const GraphicsBanks sDeleteSave_GraphicsBanks = {
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

const OverlayManagerTemplate gApplication_DeleteSave = {
    .init = DeleteSavedataApp_Init,
    .exec = DeleteSavedataApp_Main,
    .exit = DeleteSavedataApp_Exit,
    .ovy_id = FS_OVERLAY_ID_NONE,
};

extern void sub_02005AF8(u32 a0);

static void DeleteSavedataApp_OnVBlank(DeleteSavedataApp_Data *data);
static void DeleteSavedataApp_SetupBgConfig(DeleteSavedataApp_Data *data);
static void DeleteSavedataApp_FreeBgConfig(DeleteSavedataApp_Data *data);
static void DeleteSavedataApp_SetupTextAndWindow(DeleteSavedataApp_Data *data);
static void DeleteSavedataApp_FreeTextAndWindow(DeleteSavedataApp_Data *data);
static BOOL DeleteSavedataApp_DoMainTask(DeleteSavedataApp_Data *data);
static BOOL DeleteSavedataApp_PrintMessage(DeleteSavedataApp_Data *data, u32 msgNum, BOOL skipWaitingForAPress, u32 textSpeed);

BOOL DeleteSavedataApp_Init(OverlayManager *manager, int *state) {
    CreateHeap(HEAP_ID_3, HEAP_ID_DELETE_SAVEDATA, 0x20000);

    DeleteSavedataApp_Data *data = OverlayManager_CreateAndGetData(manager, sizeof(DeleteSavedataApp_Data), HEAP_ID_DELETE_SAVEDATA);
    memset(data, 0, sizeof(DeleteSavedataApp_Data));
    data->heapId = HEAP_ID_DELETE_SAVEDATA;
    data->mainState = MAINSTATE_ASK_TO_DELETE;
    UnkStruct_02111868_sub *args = OverlayManager_GetArgs(manager);
    data->savedata = args->saveData;

    return TRUE;
}

BOOL DeleteSavedataApp_Main(OverlayManager *manager, int *state) {
    DeleteSavedataApp_Data *data = OverlayManager_GetData(manager);
    BOOL ret = FALSE;

    enum {
        STATE_SETUP,
        STATE_WAIT_FOR_FADE_IN,
        STATE_DELETE_SAVE,
        STATE_EXIT,
    };

    switch (*state) {
    case STATE_SETUP:
        StopBGM(SEQ_GS_POKEMON_THEME, 0);
        sub_02005AF8(0);
        sub_02004AD8(0);

        sub_0200FBF4(PM_LCD_TOP, RGB_BLACK);
        sub_0200FBF4(PM_LCD_BOTTOM, RGB_BLACK);

        Main_SetVBlankIntrCB(NULL, NULL);
        Main_SetHBlankIntrCB(NULL, NULL);

        GfGfx_DisableEngineAPlanes();
        GfGfx_DisableEngineBPlanes();
        GX_SetVisiblePlane(GX_PLANEMASK_NONE);
        GXS_SetVisiblePlane(GX_PLANEMASK_NONE);

        SetKeyRepeatTimers(4, 8);

        DeleteSavedataApp_SetupBgConfig(data);
        DeleteSavedataApp_SetupTextAndWindow(data);

        Main_SetVBlankIntrCB((GFIntrCB)DeleteSavedataApp_OnVBlank, data);

        GfGfx_BothDispOn();

        BeginNormalPaletteFade(0, 1, 1, RGB_BLACK, 6, 1, data->heapId);

        *state = STATE_WAIT_FOR_FADE_IN;
        break;
    case STATE_WAIT_FOR_FADE_IN:
        if (IsPaletteFadeFinished() == TRUE) {
            *state = STATE_DELETE_SAVE;
        }
        break;
    case STATE_DELETE_SAVE:
        if (DeleteSavedataApp_DoMainTask(data) == TRUE) {
            BeginNormalPaletteFade(0, 0, 0, RGB_BLACK, 6, 1, data->heapId);
            *state = STATE_EXIT;
        }
        break;
    case STATE_EXIT:
        if (IsPaletteFadeFinished() == TRUE) {
            DeleteSavedataApp_FreeTextAndWindow(data);
            DeleteSavedataApp_FreeBgConfig(data);

            Main_SetVBlankIntrCB(NULL, NULL);
            ret = TRUE;
        }
        break;
    }

    return ret;
}

BOOL DeleteSavedataApp_Exit(OverlayManager *manager, int *state) {
    DeleteSavedataApp_Data *data = OverlayManager_GetData(manager);
    HeapID heapId = data->heapId;

    OverlayManager_FreeData(manager);

    DestroyHeap(heapId);

    OS_ResetSystem(0);

    return TRUE;
}

static void DeleteSavedataApp_OnVBlank(DeleteSavedataApp_Data *data) {
    DoScheduledBgGpuUpdates(data->bgConfig);
}

static void DeleteSavedataApp_SetupBgConfig(DeleteSavedataApp_Data *data) {
    GraphicsBanks banks = sDeleteSave_GraphicsBanks;
    GfGfx_SetBanks(&banks);

    data->bgConfig = BgConfig_Alloc(data->heapId);

    GraphicsModes modes = sDeleteSave_GraphicsModes;
    SetBothScreensModesAndDisable(&modes);

    BgTemplate template = sDeleteSave_BgTemplate;
    InitBgFromTemplate(data->bgConfig, GF_BG_LYR_MAIN_0, &template, GX_BGMODE_0);
    BgClearTilemapBufferAndCommit(data->bgConfig, GF_BG_LYR_MAIN_0);
    LoadUserFrameGfx2(data->bgConfig, GF_BG_LYR_MAIN_0, 0x1E2, 2, 0, data->heapId);
    LoadUserFrameGfx1(data->bgConfig, GF_BG_LYR_MAIN_0, 0x1D9, 3, 0, data->heapId);
    LoadFontPal0(GF_PAL_LOCATION_MAIN_BG, GF_PAL_SLOT_1_OFFSET, data->heapId);
    BG_ClearCharDataRange(GF_BG_LYR_MAIN_0, 32, 0, data->heapId);
    BG_SetMaskColor(GF_BG_LYR_MAIN_0, RGB(1, 1, 27));
    BG_SetMaskColor(GF_BG_LYR_SUB_0, RGB(1, 1, 27));
}

static void DeleteSavedataApp_FreeBgConfig(DeleteSavedataApp_Data *data) {
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

static void DeleteSavedataApp_SetupTextAndWindow(DeleteSavedataApp_Data *data) {
    data->msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0007_bin, data->heapId);
    ResetAllTextPrinters();

    data->printState = PRINTSTATE_PRINT_TEXT;

    AddWindow(data->bgConfig, &data->window, &sDeleteSave_WindowTemplate1);
    FillWindowPixelRect(&data->window, 0xF, 0, 0, 216, 32);
}

static void DeleteSavedataApp_FreeTextAndWindow(DeleteSavedataApp_Data *data) {
    RemoveWindow(&data->window);
    DestroyMsgData(data->msgData);
}

static BOOL DeleteSavedataApp_DoMainTask(DeleteSavedataApp_Data *data) {
    BOOL ret = FALSE;

    switch (data->mainState) {
    case MAINSTATE_ASK_TO_DELETE:
        // "Delete all saved data?"
        if (DeleteSavedataApp_PrintMessage(data, msg_0007_00000, TRUE, 4) == TRUE) {
            data->yesNoMenu = CreateYesNoMenu(data->bgConfig, &sDeleteSave_WindowTemplate2, 0x1D9, 3, 1, data->heapId);
            data->mainState = MAINSTATE_HANDLE_INPUT;
        }
        break;
    case MAINSTATE_HANDLE_INPUT: {
        u32 result = Handle2dMenuInput_DeleteOnFinish(data->yesNoMenu, data->heapId);
        switch (result) {
        case LIST_NO_MULTIPLE_SCROLL:
            data->mainState = MAINSTATE_ASK_TO_CONFIRM;
            break;
        case LIST_CANCEL:
            data->mainState = MAINSTATE_EXIT;
            break;
        }
        break;
    }
    case MAINSTATE_ASK_TO_CONFIRM:
        // "Once data has been deleted, there is no way to recover it. [...]"
        if (DeleteSavedataApp_PrintMessage(data, msg_0007_00001, TRUE, 4) == TRUE) {
            data->yesNoMenu = CreateYesNoMenu(data->bgConfig, &sDeleteSave_WindowTemplate2, 0x1D9, 3, 1, data->heapId);
            data->mainState = MAINSTATE_HANDLE_CONFIRMATION;
        }
        break;
    case MAINSTATE_HANDLE_CONFIRMATION: {
        u32 result = Handle2dMenuInput_DeleteOnFinish(data->yesNoMenu, data->heapId);
        switch (result) {
        case LIST_NO_MULTIPLE_SCROLL:
            data->mainState = MAINSTATE_PRINT_DELETING_MESSAGE;
            break;
        case LIST_CANCEL:
            data->mainState = MAINSTATE_EXIT;
            break;
        }
        break;
    }
    case MAINSTATE_PRINT_DELETING_MESSAGE:
        // "Deleting all data. Don't turn off the power."
        if (DeleteSavedataApp_PrintMessage(data, msg_0007_00002, TRUE, TEXT_SPEED_INSTANT) == TRUE) {
            data->waitingIcon = WaitingIcon_New(&data->window, 0x1E2);
            data->mainState = MAINSTATE_DELETE_DATA;
        }
        break;
    case MAINSTATE_DELETE_DATA:
        Save_DeleteAllData(data->savedata);
        sub_0200F450(data->waitingIcon);
        data->mainState = MAINSTATE_EXIT;
        break;
    case MAINSTATE_EXIT:
        BgClearTilemapBufferAndCommit(data->bgConfig, GF_BG_LYR_MAIN_0);
        ret = TRUE;
        break;
    }

    return ret;
}

static BOOL DeleteSavedataApp_PrintMessage(DeleteSavedataApp_Data *data, u32 msgNum, BOOL skipWaitingForAPress, u32 textSpeed) {
    BOOL ret = FALSE;

    switch (data->printState) {
    case PRINTSTATE_PRINT_TEXT:
        FillWindowPixelRect(&data->window, 0xF, 0, 0, 216, 32);
        DrawFrameAndWindow2(&data->window, FALSE, 0x1E2, 2);

        data->textString = String_New(1024, data->heapId);
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
        if (skipWaitingForAPress || (gSystem.newKeys & PAD_BUTTON_A)) {
            data->printState = PRINTSTATE_PRINT_TEXT;
            ret = TRUE;
        }
        break;
    }

    return ret;
}
