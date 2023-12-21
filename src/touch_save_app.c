#include "global.h"
#include <nitro/gx/gx_vramcnt.h>
#include "bg_window.h"
#include "field_system.h"
#include "font.h"
#include "gf_gfx_loader.h"
#include "msgdata/msg.naix"
#include "msgdata/msg/msg_0040.h"
#include "overlay_01.h"
#include "render_text.h"
#include "systask_environment.h"
#include "task.h"
#include "text.h"
#include "touch_save_app.h"
#include "unk_02005D10.h"
#include "unk_0200E320.h"
#include "unk_0201660C.h"
#include "unk_0201F79C.h"
#include "unk_020183F0.h"

FS_EXTERN_OVERLAY(OVY_123);

enum TouchSaveApp_State {
    TOUCHSAVEAPP_STATE_DISPLAY_SAVE_INFORMATION,
    TOUCHSAVEAPP_STATE_ASK_TO_SAVE,
    TOUCHSAVEAPP_STATE_WAIT_FOR_TEXT_PRINTER,
    TOUCHSAVEAPP_STATE_GET_SAVE_CONFIRMATION,
    TOUCHSAVEAPP_STATE_HANDLE_SAVE_CONFIRMATION,
    TOUCHSAVEAPP_STATE_PRINT_OVERWRITE_MESSAGE,
    TOUCHSAVEAPP_STATE_GET_OVERWRITE_CONFIRMATION,
    TOUCHSAVEAPP_STATE_HANDLE_OVERWRITE_CONFIRMATION,
    TOUCHSAVEAPP_STATE_PRINT_NOT_MY_SAVE_MESSAGE,
    TOUCHSAVEAPP_STATE_SAVE_FAILED,
    TOUCHSAVEAPP_STATE_PRINT_SAVING_MESSAGE,
    TOUCHSAVEAPP_STATE_SETUP_WAITING_ICON,
    TOUCHSAVEAPP_STATE_SAVE,
    TOUCHSAVEAPP_STATE_PRINT_SAVED_MESSAGE,
    TOUCHSAVEAPP_STATE_SAVE_SUCCEEDED,
    TOUCHSAVEAPP_STATE_CLOSE,

    TOUCHSAVEAPP_STATE_COUNT,
};

typedef struct TouchSaveAppData {
    u32 unk0;
    BgConfig *bgConfig;
    SysTask *task;
    enum TouchSaveApp_State state;
    enum TouchSaveApp_State stateAfterTextPrint;
    int waitFrames;
    void *unk18;
    FieldSystem *fieldSystem;
    u8 unk20[0x10];
    u32 unk30;
    u8 unk34[4];
    MsgData *msgData;
    MessageFormat *messageFormat;
    UnkStruct_field_021F4360 *unk40;
    Options *options;
    void *unk48;
    Window window;
    String *string;
    u32 textPrinter;
    WaitingIcon *waitingIcon;
    SysTask *savingMovementTask;
} TouchSaveAppData; // size: 0x6C

extern void *ov123_0225F4A8(void(*)(void));
extern void *ov123_0225F520(void(*)(void));
extern void *ov123_0225F610(void(*)(void));

static void ov30_0225D700(SysTask *task, TouchSaveAppData *data);
static void TouchSaveApp_SetupGraphics(TouchSaveAppData *data);
static void TouchSaveApp_DestroyWindow(TouchSaveAppData *data);
static void TouchSaveApp_SetupText(TouchSaveAppData *data, u8 unused);
static void TouchSaveApp_DestroyText(TouchSaveAppData *data);
static void ov30_0225D880(TouchSaveAppData *data);
static void TouchSaveApp_SetupWaitForTextPrinter(TouchSaveAppData *data, enum TouchSaveApp_State nextState);
static BOOL TouchSaveApp_DisplaySaveInformation(TouchSaveAppData *data);
static BOOL TouchSaveApp_AskForSave(TouchSaveAppData *data);
static BOOL TouchSaveApp_WaitForTextPrinter(TouchSaveAppData *data);
static BOOL TouchSaveApp_GetSaveConfirmation(TouchSaveAppData *data);
static BOOL TouchSaveApp_HandleSaveConfirmation(TouchSaveAppData *data);
static BOOL TouchSaveApp_PrintOverwriteMessage(TouchSaveAppData *data);
static BOOL TouchSaveApp_GetOverwriteConfirmation(TouchSaveAppData *data);
static BOOL TouchSaveApp_HandleOverwriteConfirmation(TouchSaveAppData *data);
static BOOL TouchSaveApp_PrintNotMySaveError(TouchSaveAppData *data);
static BOOL TouchSaveApp_SaveFailed(TouchSaveAppData *data);
static BOOL TouchSaveApp_PrintSavingMessage(TouchSaveAppData *data);
static BOOL TouchSaveApp_SetupWaitingIcon(TouchSaveAppData *data);
static BOOL TouchSaveApp_SaveGame(TouchSaveAppData *data);
static BOOL TouchSaveApp_PrintSavedMessage(TouchSaveAppData *data);
static BOOL TouchSaveApp_SaveSucceeded(TouchSaveAppData *data);
static BOOL TouchSaveApp_CloseApp(TouchSaveAppData *data);
static BOOL TouchSaveApp_ShouldPrintAlternateSavingMessage(TouchSaveAppData *data);
static void ov30_0225DC00(u32 *a0, u32 a1);
static void ov30_0225DC08(void);
static void ov30_0225DC18(void);
static void ov30_0225DC28(void);

static const BgTemplate ov30_0225DC64 = {
    .x = 0,
    .y = 0,
    .bufferSize = 0x800,
    .baseTile = 0,
    .size = GF_BG_SCR_SIZE_256x256,
    .colorMode = GX_BG_COLORMODE_16,
    .screenBase = GX_BG_SCRBASE_0x6000,
    .charBase = GX_BG_CHARBASE_0x04000,
    .bgExtPltt = GX_BG_EXTPLTT_01,
    .priority = 1,
    .areaOver = GX_BG_AREAOVER_XLU,
    .dummy = 0,
    .mosaic = FALSE,
};

static const BgTemplate ov30_0225DC48 = {
    .x = 0,
    .y = 0,
    .bufferSize = 0x800,
    .baseTile = 0,
    .size = GF_BG_SCR_SIZE_256x256,
    .colorMode = GX_BG_COLORMODE_16,
    .screenBase = GX_BG_SCRBASE_0x7000,
    .charBase = GX_BG_CHARBASE_0x00000,
    .bgExtPltt = GX_BG_EXTPLTT_01,
    .priority = 0,
    .areaOver = GX_BG_AREAOVER_XLU,
    .dummy = 0,
    .mosaic = FALSE,
};

static const BgTemplate ov30_0225DC2C = {
    .x = 0,
    .y = 0,
    .bufferSize = 0x800,
    .baseTile = 0,
    .size = GF_BG_SCR_SIZE_256x256,
    .colorMode = GX_BG_COLORMODE_16,
    .screenBase = GX_BG_SCRBASE_0x6800,
    .charBase = GX_BG_CHARBASE_0x00000,
    .bgExtPltt = GX_BG_EXTPLTT_01,
    .priority = 2,
    .areaOver = GX_BG_AREAOVER_XLU,
    .dummy = 0,
    .mosaic = FALSE,
};

typedef BOOL (*TouchSaveAppStateFunc)(TouchSaveAppData*);
static TouchSaveAppStateFunc sTouchSaveAppStateFuncs[TOUCHSAVEAPP_STATE_COUNT] = {
    TouchSaveApp_DisplaySaveInformation,
    TouchSaveApp_AskForSave,
    TouchSaveApp_WaitForTextPrinter,
    TouchSaveApp_GetSaveConfirmation,
    TouchSaveApp_HandleSaveConfirmation,
    TouchSaveApp_PrintOverwriteMessage,
    TouchSaveApp_GetOverwriteConfirmation,
    TouchSaveApp_HandleOverwriteConfirmation,
    TouchSaveApp_PrintNotMySaveError,
    TouchSaveApp_SaveFailed,
    TouchSaveApp_PrintSavingMessage,
    TouchSaveApp_SetupWaitingIcon,
    TouchSaveApp_SaveGame,
    TouchSaveApp_PrintSavedMessage,
    TouchSaveApp_SaveSucceeded,
    TouchSaveApp_CloseApp,
};

SysTask *ov30_0225D520(BgConfig *bgConfig, void* a1, FieldSystem *fieldSystem, void* a3) {
    CreateHeap(HEAP_ID_3, HEAP_ID_8, 0x18000);

    GXS_SetGraphicsMode(GX_BGMODE_0);
    GX_SetBankForSubBG(GX_VRAM_SUB_BG_32_H);
    GX_SetBankForSubOBJ(GX_VRAM_SUB_OBJ_16_I);
    // FIXME: Make an inline function for this.
    reg_GXS_DB_DISPCNT = (reg_GXS_DB_DISPCNT & ~(REG_GXS_DB_DISPCNT_EXOBJ_CH_MASK | REG_GXS_DB_DISPCNT_OBJMAP_CH_MASK)) | REG_GXS_DB_DISPCNT_OBJMAP_CH_MASK;

    InitBgFromTemplate(bgConfig, GF_BG_LYR_SUB_0, &ov30_0225DC2C, GF_BG_TYPE_TEXT);
    InitBgFromTemplate(bgConfig, GF_BG_LYR_SUB_1, &ov30_0225DC48, GF_BG_TYPE_TEXT);
    InitBgFromTemplate(bgConfig, GF_BG_LYR_SUB_2, &ov30_0225DC64, GF_BG_TYPE_TEXT);
    BG_ClearCharDataRange(GF_BG_LYR_SUB_2, 0x20, 0, HEAP_ID_4);
    BgClearTilemapBufferAndCommit(bgConfig, GF_BG_LYR_SUB_2);
    BgClearTilemapBufferAndCommit(bgConfig, GF_BG_LYR_SUB_1);

    GXS_SetVisibleWnd(0);
    GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG0, GF_PLANE_TOGGLE_OFF);
    GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG1, GF_PLANE_TOGGLE_OFF);
    GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG2, GF_PLANE_TOGGLE_OFF);
    GfGfx_EngineBTogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_OFF);

    SysTask *task = CreateSysTaskAndEnvironment((SysTaskFunc)ov30_0225D700, sizeof(TouchSaveAppData), 10, HEAP_ID_8);
    TouchSaveAppData *data = sub_0201F988(task);
    data->task = task;
    data->unk0 = 0;
    data->bgConfig = bgConfig;
    data->unk18 = a1;
    data->fieldSystem = fieldSystem;
    data->unk30 = 0;
    data->options = Save_PlayerData_GetOptionsAddr(data->fieldSystem->saveData);
    data->state = TOUCHSAVEAPP_STATE_DISPLAY_SAVE_INFORMATION;

    TouchSaveApp_SetupGraphics(data);
    TouchSaveApp_SetupText(data, data->fieldSystem->unkD2_0);

    GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG0, GF_PLANE_TOGGLE_ON);
    GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG1, GF_PLANE_TOGGLE_ON);
    GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG2, GF_PLANE_TOGGLE_ON);
    GfGfx_EngineBTogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_ON);

    sub_02002B8C(TRUE);

    return task;
}

void ov30_0225D64C(BgConfig *bgConfig, SysTask *task) {
    TouchSaveAppData *data = sub_0201F988(task);

    FS_LoadOverlay(MI_PROCESSOR_ARM9, FS_OVERLAY_ID(OVY_123));

    if (!ov123_0225F4A8(ov30_0225DC28)) {
        AllocFromHeapAtEnd(HEAP_ID_3, 1000);
    }

    ov01_021F434C(data->unk40);
    ov01_021F43D0(data->unk40);

    sub_02002B8C(FALSE);

    if (ov123_0225F520(ov30_0225DC08)) {
        AllocFromHeapAtEnd(HEAP_ID_3, 1000);
    }

    TouchSaveApp_DestroyWindow(data);
    TouchSaveApp_DestroyText(data);

    DestroySysTaskAndEnvironment(task);

    FreeBgTilemapBuffer(bgConfig, GF_BG_LYR_SUB_2);
    FreeBgTilemapBuffer(bgConfig, GF_BG_LYR_SUB_1);
    FreeBgTilemapBuffer(bgConfig, GF_BG_LYR_SUB_0);

    DestroyHeap(HEAP_ID_8);

    if (ov123_0225F610(ov30_0225DC18)) {
        AllocFromHeapAtEnd(HEAP_ID_3, 1000);
    }

    FS_UnloadOverlay(MI_PROCESSOR_ARM9, FS_OVERLAY_ID(OVY_123));
}

BOOL ov30_0225D6FC(void *a0) {
    return TRUE;
}

static void ov30_0225D700(SysTask *task, TouchSaveAppData *data) {
    if (!FieldSystem_TaskIsRunning(data->fieldSystem)) {
        if (data->fieldSystem->unkD2_0 == 2) {
            data->fieldSystem->unkD2_0 = 3;
            ov01_021F434C(data->unk40);
        }

        G2S_BlendNone();
    } else {
        if (data->fieldSystem->unkD2_0 == 2 && sTouchSaveAppStateFuncs[data->state](data) == TRUE) {
            data->fieldSystem->unkD2_0 = 3;
            ov01_021F6A9C(data->fieldSystem, 0, 0);
        }
    }
}

static void TouchSaveApp_SetupGraphics(TouchSaveAppData *data) {
    G2S_BlendNone();

    GfGfxLoader_LoadCharData(NARC_a_0_1_4, 76, data->bgConfig, GF_BG_LYR_SUB_0, 0, 0, TRUE, HEAP_ID_8);
    GfGfxLoader_LoadScrnData(NARC_a_0_1_4, 77, data->bgConfig, GF_BG_LYR_SUB_0, 0, 0, TRUE, HEAP_ID_8);
    GfGfxLoader_GXLoadPal(NARC_a_0_1_4, 75, GF_PAL_LOCATION_SUB_BG, GF_PAL_SLOT_0_OFFSET, 0x200, HEAP_ID_8);
    LoadFontPal0(GF_PAL_LOCATION_SUB_BG, GF_PAL_SLOT_4_OFFSET, HEAP_ID_8);

    AddWindowParameterized(data->bgConfig, &data->window, GF_BG_LYR_SUB_1, 2, 19, 27, 4, 4, 0x80);
    FillWindowPixelBuffer(&data->window, 0xFF);

    LoadUserFrameGfx2(data->bgConfig, GF_BG_LYR_SUB_1, 0xEC, 5, Options_GetFrame(data->options), HEAP_ID_4);
}

static void TouchSaveApp_DestroyWindow(TouchSaveAppData *data) {
    RemoveWindow(&data->window);
}

static void TouchSaveApp_SetupText(TouchSaveAppData *data, u8 unused) {
    data->messageFormat = MessageFormat_New(HEAP_ID_8);
    data->msgData = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, NARC_msg_msg_0040_bin, HEAP_ID_8);
    BufferPlayersName(data->messageFormat, 0, Save_PlayerData_GetProfileAddr(data->fieldSystem->saveData));
}

static void TouchSaveApp_DestroyText(TouchSaveAppData *data) {
    DestroyMsgData(data->msgData);
    MessageFormat_Delete(data->messageFormat);
}

static void ov30_0225D880(TouchSaveAppData *data) {
    Unk122_021E6900 unkStruct;
    MI_CpuFill8(&unkStruct, 0, sizeof(Unk122_021E6900));
    unkStruct.bgConfig = data->bgConfig;
    unkStruct.unk8 = 1;
    unkStruct.unkC = 12;
    unkStruct.unk4 = 6;
    unkStruct.unk10 = 26;
    unkStruct.unk11 = 10;
    unkStruct.unk12_0 = 0;
    unkStruct.unk12_4 = 0;

    BgClearTilemapBufferAndCommit(data->bgConfig, GF_BG_LYR_SUB_2);

    void* unk = sub_0201660C(HEAP_ID_4);
    data->unk48 = unk;

    sub_020166FC(unk, &unkStruct);
}

static void TouchSaveApp_SetupWaitForTextPrinter(TouchSaveAppData *data, enum TouchSaveApp_State nextState) {
    data->state = TOUCHSAVEAPP_STATE_WAIT_FOR_TEXT_PRINTER;
    data->stateAfterTextPrint = nextState;
}

static BOOL TouchSaveApp_DisplaySaveInformation(TouchSaveAppData *data) {
    UnkStruct_field_021F4360 *unk = ov01_021F4360(data->fieldSystem, HEAP_ID_4, 5);
    data->unk40 = unk;
    ov01_021F42F8(unk);

    data->state = TOUCHSAVEAPP_STATE_ASK_TO_SAVE;
    return FALSE;
}

static BOOL TouchSaveApp_AskForSave(TouchSaveAppData *data) {
    if (!Save_FileDoesNotBelongToPlayer(data->fieldSystem->saveData)) {
        DrawFrameAndWindow2(&data->window, TRUE, 0xEC, 5);
        data->string = NewString_ReadMsgData(data->msgData, msg_0040_00081);
        data->textPrinter = AddTextPrinterParameterized(&data->window, 1, data->string, 0, 0, Options_GetTextFrameDelay(data->options), NULL);
        TouchSaveApp_SetupWaitForTextPrinter(data, TOUCHSAVEAPP_STATE_GET_SAVE_CONFIRMATION);
    } else {
        data->state = TOUCHSAVEAPP_STATE_PRINT_NOT_MY_SAVE_MESSAGE;
    }

    return FALSE;
}

static BOOL TouchSaveApp_WaitForTextPrinter(TouchSaveAppData *data) {
    if (!TextPrinterCheckActive(data->textPrinter)) {
        String_Delete(data->string);
        data->state = data->stateAfterTextPrint;
    }

    return FALSE;
}

static BOOL TouchSaveApp_GetSaveConfirmation(TouchSaveAppData *data) {
    ov30_0225D880(data);

    data->state = TOUCHSAVEAPP_STATE_HANDLE_SAVE_CONFIRMATION;
    return FALSE;
}

static BOOL TouchSaveApp_HandleSaveConfirmation(TouchSaveAppData *data) {
    switch (sub_02016748(data->unk48)) {
        case 1: // Yes
            ov30_0225DC00(&data->fieldSystem->unk_10C, sub_020169C0(data->unk48));
            sub_02016624(data->unk48);
            if (Save_FileExists(data->fieldSystem->saveData) == TRUE) {
                data->state = TOUCHSAVEAPP_STATE_PRINT_OVERWRITE_MESSAGE;
            } else {
                data->state = TOUCHSAVEAPP_STATE_PRINT_SAVING_MESSAGE;
            }
            break;
        case 2: // No
            ov30_0225DC00(&data->fieldSystem->unk_10C, sub_020169C0(data->unk48));
            sub_02016624(data->unk48);
            return TRUE;
    }

    return FALSE;
}

static BOOL TouchSaveApp_PrintOverwriteMessage(TouchSaveAppData *data) {
    FillWindowPixelBuffer(&data->window, 0xFF);
    data->string = NewString_ReadMsgData(data->msgData, msg_0040_00082);
    data->textPrinter = AddTextPrinterParameterized(&data->window, 1, data->string, 0, 0, Options_GetTextFrameDelay(data->options), NULL);
    TouchSaveApp_SetupWaitForTextPrinter(data, TOUCHSAVEAPP_STATE_GET_OVERWRITE_CONFIRMATION);

    return FALSE;
}

static BOOL TouchSaveApp_GetOverwriteConfirmation(TouchSaveAppData *data) {
    ov30_0225D880(data);

    data->state = TOUCHSAVEAPP_STATE_HANDLE_OVERWRITE_CONFIRMATION;
    return FALSE;
}

static BOOL TouchSaveApp_HandleOverwriteConfirmation(TouchSaveAppData *data) {
    switch (sub_02016748(data->unk48)) {
        case 1: // Yes
            ov30_0225DC00(&data->fieldSystem->unk_10C, sub_020169C0(data->unk48));
            sub_02016624(data->unk48);
            data->state = TOUCHSAVEAPP_STATE_PRINT_SAVING_MESSAGE;
            break;
        case 2: // No
            ov30_0225DC00(&data->fieldSystem->unk_10C, sub_020169C0(data->unk48));
            sub_02016624(data->unk48);
            return TRUE;
    }

    return FALSE;
}

static BOOL TouchSaveApp_PrintNotMySaveError(TouchSaveAppData *data) {
    DrawFrameAndWindow2(&data->window, TRUE, 0xEC, 5);
    data->string = NewString_ReadMsgData(data->msgData, msg_0040_00020);
    data->textPrinter = AddTextPrinterParameterized(&data->window, 1, data->string, 0, 0, Options_GetTextFrameDelay(data->options), NULL);
    TouchSaveApp_SetupWaitForTextPrinter(data, TOUCHSAVEAPP_STATE_SAVE_FAILED);

    return FALSE;
}

static BOOL TouchSaveApp_SaveFailed(TouchSaveAppData *data) {
    data->state = TOUCHSAVEAPP_STATE_CLOSE;
    data->waitFrames = 0;

    return FALSE;
}

static BOOL TouchSaveApp_PrintSavingMessage(TouchSaveAppData *data) {
    FillWindowPixelBuffer(&data->window, 0xFF);

    data->savingMovementTask = Field_PlayerMovementSavingSet(data->fieldSystem);

    String *string;
    if (!TouchSaveApp_ShouldPrintAlternateSavingMessage(data)) {
        string = NewString_ReadMsgData(data->msgData, msg_0040_00015);
    } else {
        string = NewString_ReadMsgData(data->msgData, msg_0040_00021);
    }
    data->string = string;
    data->textPrinter = AddTextPrinterParameterized(&data->window, 1, data->string, 0, 0, Options_GetTextFrameDelay(data->options), NULL);
    TouchSaveApp_SetupWaitForTextPrinter(data, TOUCHSAVEAPP_STATE_SETUP_WAITING_ICON);

    return FALSE;
}

static BOOL TouchSaveApp_SetupWaitingIcon(TouchSaveAppData *data) {
    data->waitingIcon = WaitingIcon_New(&data->window, 0xEC);
    data->state = TOUCHSAVEAPP_STATE_SAVE;

    return FALSE;
}

static BOOL TouchSaveApp_SaveGame(TouchSaveAppData *data) {
    Field_SaveGameNormal(data->fieldSystem);
    data->state = TOUCHSAVEAPP_STATE_PRINT_SAVED_MESSAGE;

    return FALSE;
}

static BOOL TouchSaveApp_PrintSavedMessage(TouchSaveAppData *data) {
    Field_PlayerMovementSavingClear(data->savingMovementTask);

    sub_0200F450(data->waitingIcon);

    FillWindowPixelBuffer(&data->window, 0xFF);
    data->string = ReadMsgData_ExpandPlaceholders(data->messageFormat, data->msgData, msg_0040_00016, HEAP_ID_8);
    data->textPrinter = AddTextPrinterParameterized(&data->window, 1, data->string, 0, 0, Options_GetTextFrameDelay(data->options), NULL);
    TouchSaveApp_SetupWaitForTextPrinter(data, TOUCHSAVEAPP_STATE_SAVE_SUCCEEDED);

    return FALSE;
}

static BOOL TouchSaveApp_SaveSucceeded(TouchSaveAppData *data) {
    PlaySE(SEQ_SE_DP_SAVE);
    data->state = TOUCHSAVEAPP_STATE_CLOSE;
    data->waitFrames = 0;

    return FALSE;
}

static BOOL TouchSaveApp_CloseApp(TouchSaveAppData *data) {
    if (++data->waitFrames > 30) {
        return TRUE;
    }

    return FALSE;
}

static BOOL TouchSaveApp_ShouldPrintAlternateSavingMessage(TouchSaveAppData *data) {
    return Save_NumModifiedPCBoxesIsMany(data->fieldSystem->saveData);
}

static void ov30_0225DC00(u32 *a0, u32 a1) {
    sub_02018410(a0, a1);
}

static void ov30_0225DC08(void) {
    AllocFromHeapAtEnd(HEAP_ID_3, 1000);
}

static void ov30_0225DC18(void) {
    AllocFromHeapAtEnd(HEAP_ID_3, 1000);
}

static void ov30_0225DC28(void) {

}
