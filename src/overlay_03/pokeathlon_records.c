#include "overlay_03.h"

#include "field_system.h"
#include "font.h"
#include "global.h"
#include "task.h"
#include "text.h"
#include "touchscreen.h"
#include "unk_02005D10.h"

#include "msgdata/msg.naix"
#include "msgdata/msg/msg_0277.h"

typedef struct UnkStruct_02258CFC {
    int state;
    enum PokeathlonData pokeathlonDataType;
    FieldSystem *fieldSystem;
    BgConfig *bgConfig;
    Window window;
    PokeathlonSave *pokeathlonSave;
    Pokeathlon_UnkSubStruct_B00 *pokeathlonStruct;
    MsgData *msgData;
    MessageFormat *messageFormat;
    String *strings[4];
} UnkStruct_02258CFC;

static BOOL ov03_02258D3C(TaskManager *taskManager);
static BOOL ov03_02258D88(UnkStruct_02258CFC *data);
static void ov03_02258DE8(UnkStruct_02258CFC *data);
static void ov03_02258E88(UnkStruct_02258CFC *data);
static void ov03_02258EE8(UnkStruct_02258CFC *data, enum PokeathlonData dataType);
static void ov03_02258F48(UnkStruct_02258CFC *data, int y);
static void ov03_02258F8C(UnkStruct_02258CFC *data, int y, int strno);
static u32 ov03_02259070(Pokeathlon_UnkSubStruct_B00 *pokeathlonStruct, int strno);

void ov03_02258CFC(TaskManager *taskManager, enum PokeathlonData dataType) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    UnkStruct_02258CFC *data = Heap_Alloc(HEAP_ID_FIELD2, sizeof(UnkStruct_02258CFC));
    data->state = 0;
    data->pokeathlonDataType = dataType;
    data->bgConfig = fieldSystem->bgConfig;
    data->fieldSystem = fieldSystem;
    data->pokeathlonSave = Save_Pokeathlon_Get(fieldSystem->saveData);
    data->pokeathlonStruct = PokeathlonSave_GetUnkB00(data->pokeathlonSave);
    TaskManager_Call(fieldSystem->taskman, &ov03_02258D3C, data);
}

static BOOL ov03_02258D3C(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    UnkStruct_02258CFC *data = (UnkStruct_02258CFC *)TaskManager_GetEnvironment(taskManager);
    switch (data->state) {
    case 0:
        ov03_02258DE8(data);
        ov03_02258EE8(data, data->pokeathlonDataType);
        data->state++;
        break;
    case 1:
        if (ov03_02258D88(data)) {
            ov03_02258E88(data);
            Heap_Free(data);
            return TRUE;
        }
        break;
    }
    return FALSE;
}

static BOOL ov03_02258D88(UnkStruct_02258CFC *data) {
    if (System_GetTouchNew()) {
        PlaySE(SEQ_SE_DP_DECIDE);
        MenuInputStateMgr_SetState(&data->fieldSystem->menuInputState, MENU_INPUT_STATE_TOUCH);
        return TRUE;
    }
    if ((PAD_BUTTON_A | PAD_BUTTON_B | PAD_KEY_DOWN | PAD_KEY_UP | PAD_KEY_LEFT | PAD_KEY_RIGHT | PAD_BUTTON_Y | PAD_BUTTON_X) & gSystem.newKeys) {
        MenuInputStateMgr_SetState(&data->fieldSystem->menuInputState, MENU_INPUT_STATE_BUTTONS);
    }
    if ((PAD_BUTTON_A | PAD_BUTTON_B) & gSystem.newKeys) {
        PlaySE(SEQ_SE_DP_DECIDE);
        return TRUE;
    }
    return FALSE;
}

static void ov03_02258DE8(UnkStruct_02258CFC *data) {
    AddWindowParameterized(data->bgConfig, &data->window, 3, 2, 1, 28, 22, 13, 1);
    LoadUserFrameGfx1(data->bgConfig, GF_BG_LYR_MAIN_3, 985, HEAP_ID_FIELD2, 0, HEAP_ID_FIELD1);
    DrawFrameAndWindow1(&data->window, TRUE, 985, HEAP_ID_FIELD2);
    FillWindowPixelBuffer(&data->window, 15);
    data->msgData = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, NARC_msg_msg_0277_bin, HEAP_ID_FIELD1);
    data->messageFormat = MessageFormat_New_Custom(3, 16, HEAP_ID_FIELD1);
    data->strings[0] = String_New(128, HEAP_ID_FIELD1);
    data->strings[1] = String_New(128, HEAP_ID_FIELD1);
    data->strings[2] = NewString_ReadMsgData(data->msgData, 1);
    data->strings[3] = NewString_ReadMsgData(data->msgData, 3);
}

static void ov03_02258E88(UnkStruct_02258CFC *data) {
    String_Delete(data->strings[3]);
    String_Delete(data->strings[2]);
    String_Delete(data->strings[1]);
    String_Delete(data->strings[0]);
    MessageFormat_Delete(data->messageFormat);
    DestroyMsgData(data->msgData);
    sub_0200E5D4(&data->window, TRUE);
    RemoveWindow(&data->window);
    ScheduleBgTilemapBufferTransfer(data->bgConfig, 3);
}

static u8 ov03_02259880[] = { // 32?
    0,
    1,
    2,
    25,
    21,
    22,
    0,
    19,
    20,
    27,
    5,
    7,
    18,
    8,
    9,
    17,
	6,
    16,
    10,
    24,
    26,
    3,
    4,
    14,
    23,
    13,
    11,
    12,
    15,
    0,
    0,
    0
};

static BOOL ov03_02258ECC(UnkStruct_02258CFC *data, int index_02259880) {
    u8 index = ov03_02259880[index_02259880];
    if (index == 0) {
        return TRUE;
    }
    return PokeathlonSave_GetUnkB78_AtIndex(data->pokeathlonSave, index - 1);
}

static const int ov03_0225980C[3] = {
    10,
    10,
    9
};

static void ov03_02258EE8(UnkStruct_02258CFC *data, enum PokeathlonData dataType) {
    for (int i = 0; i < ov03_0225980C[dataType]; i++) {
        int j = dataType * 10 + i;
        int k = 8 + 16 * i;
        if (ov03_02258ECC(data, j)) {
            ov03_02258F8C(data, k, j);
        } else {
            ov03_02258F48(data, k);
        }
    }
    
    ScheduleWindowCopyToVram(&data->window);
    ScheduleBgTilemapBufferTransfer(data->bgConfig, 3);
}

static void ov03_02258F48(UnkStruct_02258CFC *data, int y) {
    AddTextPrinterParameterizedWithColor(&data->window, 0, data->strings[3], 8, y, TEXT_SPEED_NOTRANSFER, 0x1020F, NULL);
    AddTextPrinterParameterizedWithColor(&data->window, 0, data->strings[2], 8, y, TEXT_SPEED_NOTRANSFER, 0x1020F, NULL);
}

static void ov03_02258F8C(UnkStruct_02258CFC *data, int y, int strno) {
    ReadMsgDataIntoString(data->msgData, strno + 4, data->strings[1]);
    AddTextPrinterParameterizedWithColor(&data->window, 0, data->strings[1], 8, y, TEXT_SPEED_NOTRANSFER, 0x1020F, NULL);
    u32 seconds = ov03_02259070(data->pokeathlonStruct, strno);
    if (seconds >= 9999999) {
        seconds = 9999999;
    }
    if (strno == 9) {
        ReadMsgDataIntoString(data->msgData, msg_0277_00002, data->strings[0]); // {STRVAR_1 52, 0, 0}:{STRVAR_1 51, 1, 0}
        u16 minutes = seconds / 60;
        u16 displaySeconds = seconds % 60;
        if (minutes > 999) {
            minutes = 999;
        }
        BufferIntegerAsString(data->messageFormat, 0, minutes, 3, PRINTING_MODE_RIGHT_ALIGN, TRUE);
        BufferIntegerAsString(data->messageFormat, 1, displaySeconds, 2, PRINTING_MODE_LEADING_ZEROS, TRUE);
        StringExpandPlaceholders(data->messageFormat, data->strings[1], data->strings[0]);
    } else {
        String16_FormatInteger(data->strings[1], seconds, 7, PRINTING_MODE_RIGHT_ALIGN, TRUE);
    }
    u32 width = 224 - FontID_String_GetWidth(0, data->strings[1], 0);
    AddTextPrinterParameterizedWithColor(&data->window, 0, data->strings[1], width - 8, y, TEXT_SPEED_NOTRANSFER, 0x1020F, NULL);
}

static u32 ov03_02259070(Pokeathlon_UnkSubStruct_B00 *pokeathlonStruct, int strno) {
    if (strno >= 10 && strno <= 19) {
        strno -= 10;
        return pokeathlonStruct->unk44[strno];
    }
    
    switch (strno) {
    case 0:
        return pokeathlonStruct->unk4;
    case 1:
        return pokeathlonStruct->unk8;
    case 2:
        return pokeathlonStruct->unkC;
    case 3:
        return pokeathlonStruct->unk10;
    case 4:
        int i;
        int var_r3 = 0;
        for (i = 0; i < 10; i++) {
            var_r3 += pokeathlonStruct->unk44[i];
        }
        return var_r3;
    case 5:
        return pokeathlonStruct->unk6C;
    case 6:
        return pokeathlonStruct->unk38;
    case 7:
        return pokeathlonStruct->unk3C;
    case 8:
        return pokeathlonStruct->unk40;
    case 9:
        return pokeathlonStruct->unk0;
    case 20:
        return pokeathlonStruct->unk14;
    case 21:
        return pokeathlonStruct->unk2C;
    case 22:
        return pokeathlonStruct->unk1C;
    case 23:
        return pokeathlonStruct->unk24;
    case 24:
        return pokeathlonStruct->unk30;
    case 25:
        return pokeathlonStruct->unk34;
    case 26:
        return pokeathlonStruct->unk20;
    case 27:
        return pokeathlonStruct->unk18;
    case 28:
        return pokeathlonStruct->unk28;
    default:
        return 0;
    }
}
