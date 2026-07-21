#include "overlay_01.h"
#include "overlay_03.h"

#include "bag.h"
#include "bag_types_def.h"
#include "bag_view.h"
#include "field_system.h"
#include "gf_gfx_loader.h"
#include "global.h"
#include "launch_application.h"
#include "mart.h"
#include "render_text.h"
#include "render_window.h"
#include "scrcmd.h"
#include "sys_flags.h"
#include "sys_vars.h"
#include "task.h"
#include "text.h"
#include "unk_02005D10.h"
#include "unk_0200ACF0.h"
#include "unk_0200FA24.h"
#include "unk_02058034.h"
#include "unk_02091054.h"
#include "unk_02092B04.h"

#include "field/overlay_01_021E8744.h"
#include "field/ov01_021E7FDC.h"
#include "field/overlay_01_02204004.h"

#include "msgdata/msg.naix"

static void ov03_02256BA8(FieldSystem *fieldSystem, u8 index);
static void MartTask_InitMartMessageData(MartData *data);
static void MartData_InitMessageData(MartData *data);
static void MartData_InitCamera(FieldSystem *fieldSystem, MartData *data);
static void MartData_AddWindows(MartData *data);
static u8 ov03_02257334(FieldSystem *fieldSystem, MartData *data);
static void ov03_022573D4(MartData *data, u32 arg1);
static int ov03_02257510(MartData *data);
static u8 ov03_0225761C(MartData *data, u32 arg1);
static u8 ov03_022576F8(MartData *data);
static u8 ov03_02257728(MartData *data);
static void ov03_02257758(MartData *data, int arg1, u8 arg2);
static u8 ov03_022577D0(MartData *data);
static u8 ov03_02257874(MartData *data, u16 itemID);
static u8 ov03_02257944(MartData *data);
static u8 ov03_022579E0(MartData *data);
static u8 ov03_02257A70(MartData *data);
static u8 ov03_02257ADC(MartData *data);
static u8 ov03_02257B4C(MartData *data, u32 arg1);
static u8 ov03_02257CA0(MartData *data);
static u8 ov03_02257D6C(MartData *data);
static u8 ov03_02257D90(MartData *data, u32 arg1);
static u8 MartData_PerformTransaction(MartData *data);
static u8 ov03_02257F24(MartData *data);
static u8 ov03_02257FF8(MartData *data);
static u8 ov03_02258078(MartData *data);
static void ov03_02258164(FieldSystem *fieldSystem, MartData *data_unused);
static u8 ov03_02258170(FieldSystem *fieldSystem, MartData *data);
static void ov03_02258288(MartData *data);
static void ov03_02258560(MartData *data, BOOL arg1);
static void ov03_022586BC(MartData *data, int flag);
static u8 ov03_022586CC(MartData *data, u8 arg1, u8 arg2);
static u8 ov03_022586E0(MartData *data);
static void ov03_0225874C(FieldSystem *fieldSystem_unused, MartData *data);
static void ov03_02258764(TaskManager *taskManager);
static u8 ov03_022587D4(FieldSystem *fieldSystem_unused, MartData *data_unused);
static void MartData_RestoreBgPriorities(MartData *data);
static BOOL ov03_0225709C(FieldSystem *fieldSystem_unused, MartData *data);
static void ov03_022582C0(MartData *data, int arg1);
static void ov03_022585A4(MartData *data, u16 itemID);
static void ov03_02258648(MartData *data, int charID, int paletteID, u16 item);
static int ov03_022587E8(s16 currentQuantity, u16 arg1, s16 modifier);

static const u16 ov03_0225945C[4] = {
    149,
    152,
    153,
    0
};

static const WindowTemplate ov03_022594C6[6] = {
    {
        .bgId = GF_BG_LYR_MAIN_2,
        .left = 13,
        .top = 2,
        .width = 18,
        .height = 14,
        .palette = 13,
        .baseTile = 1,
    },
    {
        .bgId = GF_BG_LYR_MAIN_2,
        .left = 5,
        .top = 18,
        .width = 27,
        .height = 6,
        .palette = 13,
        .baseTile = 253,
    },
    {
        .bgId = GF_BG_LYR_MAIN_3,
        .left = 1,
        .top = 1,
        .width = 10,
        .height = 4,
        .palette = 13,
        .baseTile = 40,
    },
    {
        .bgId = GF_BG_LYR_MAIN_3,
        .left = 19,
        .top = 13,
        .width = 12,
        .height = 4,
        .palette = 13,
        .baseTile = 80,
    },
    {
        .bgId = GF_BG_LYR_MAIN_3,
        .left = 1,
        .top = 15,
        .width = 14,
        .height = 2,
        .palette = 13,
        .baseTile = 128,
    },
    {
        .bgId = GF_BG_LYR_MAIN_3,
        .left = 2,
        .top = 19,
        .width = 27,
        .height = 4,
        .palette = 12,
        .baseTile = 156,
    }
};

static const WindowTemplate ov03_02259464 = {
    .bgId = GF_BG_LYR_MAIN_2,
    .left = 1,
    .top = 18,
    .width = 27,
    .height = 6,
    .palette = 13,
    .baseTile = 253,
};

BOOL ScrCmd_710(ScriptContext *ctx) {
    for (int i = 0; i < 3; i++) {
        ov03_02256BA8(ctx->fieldSystem, i);
    }
    return FALSE;
}

static void ov03_02256BA8(FieldSystem *fieldSystem, u8 index) {
    u16 modelID = ov03_0225945C[index];
    UnkStruct_FieldSysC0_SubC *renderObject = Field3dObjectList_GetRenderObjectByID(fieldSystem->unkC0, modelID);
    if (renderObject == NULL) {
        GF_AssertFail();
    } else {
        ov01_021E8970(modelID, sub_020669B4(Save_VarsFlags_Get(fieldSystem->saveData), index), 1, renderObject, fieldSystem->unk54); 
    }
}

static u32 ov03_02256BEC(const u16 *items, u16 *priceOverrides, u32 martType) {
    int i;
    if (martType == MART_TYPE_3 || martType == MART_TYPE_4) {
        for (i = 0; i < 256; i++) {
            if (*priceOverrides != 0xFFFF) {
                priceOverrides += 2;
            } else {
                break;
            }
        }
    } else {
        for (i = 0; i < 256; i++) {
            if (*items != 0xFFFF) {
                items++;
            } else {
                break;
            }
        }
    }
    return i;
}

static void ov03_02256C2C(MartData *data, const u16 *items, BOOL flag09A) {
    int max = data->unk270;
    int i;
    int k = 0;
    for (i = 0; i < max; i++) {
        if (flag09A == FALSE) {
            if(items[i] == 4) {
                data->unk270--;
            } else {
                data->unk268[k] = items[i];
                k++;
            }
        } else {
            data->unk268[k] = items[i];
            k++;
        }
    }
}

static void ov03_02256C84(MartData *data, u16 *priceOverrides) {
    for (int i = 0, j = 0; i < data->unk270; i++, j += 2) {
        data->unk268[i] = priceOverrides[j]; // martItem->cost?
    }
}

static void ov03_02256CB4(MartData *data, const u16 *items, BOOL flag09A, const struct MartItem *priceOverrides) {
    data->unk270 = ov03_02256BEC(items, (u16 *)priceOverrides, data->martType);
    if (data->unk270 >= 0xFF) {
        GF_AssertFail();
    }
    data->unk268 = Heap_Alloc(HEAP_ID_FIELD2, data->unk270 * 2);
    if (data->martType == MART_TYPE_3 || data->martType == MART_TYPE_4) {
        ov03_02256C84(data, (u16 *)priceOverrides);
    } else {
        ov03_02256C2C(data, items, flag09A);
    }
}

static MartData *Mart_Alloc() {
    MartData *data = Heap_Alloc(HEAP_ID_FIELD2, sizeof(MartData));
    memset(data, 0, sizeof(MartData));
    return data;
}

void Mart_Init(TaskManager *taskManager, FieldSystem *fieldSystem, const u16 *items, int kind, u8 buy_sell, int deco_which, const struct MartItem *priceOverrides) {
    MartData *martData = Mart_Alloc();
    martData->bgConfig = fieldSystem->bgConfig;
    martData->string = String_New(96, HEAP_ID_FIELD2);
    martData->playerProfile = Save_PlayerData_GetProfile(fieldSystem->saveData);
    martData->options = Save_PlayerData_GetOptionsAddr(fieldSystem->saveData);
    martData->gameStats = Save_GameStats_Get(fieldSystem->saveData);
    martData->varsFlags = Save_VarsFlags_Get(fieldSystem->saveData);
    martData->apricornBox = Save_ApricornBox_Get(fieldSystem->saveData);
    martData->unk264 = deco_which;
    martData->martType = kind;
    martData->unk271 = 0;
    martData->unk290 = 0;
    martData->unk294 = -1;
    martData->unk298 = 0;
    martData->pokeathlonSave = Save_Pokeathlon_Get(fieldSystem->saveData);
    martData->priceOverrides = priceOverrides;
    martData->unk273 = buy_sell;
    if (martData->martType == MART_TYPE_NORMAL || martData->martType == MART_TYPE_3 || martData->martType == MART_TYPE_4) {
        martData->inventory = Save_Bag_Get(fieldSystem->saveData);
    } else {
        martData->inventory = Save_SealCase_Get(fieldSystem->saveData);
    }
    // Mart_SetItemsForSale?
    ov03_02256CB4(martData, items, CheckFlag09A(martData->varsFlags), priceOverrides);
    TaskManager_Call(taskManager, Task_Mart, martData);
}

enum MartTaskStates {
    TASK_MART_START,
    TASK_MART_1,
    TASK_MART_2,
    TASK_MART_3,
    TASK_MART_4,
    TASK_MART_5,
    TASK_MART_6,
    TASK_MART_7,
    TASK_MART_8,
    TASK_MART_9,
    TASK_MART_10,
    TASK_MART_11,
    TASK_MART_12,
    TASK_MART_13,
    TASK_MART_14,
    TASK_MART_15,
    TASK_MART_16,
    TASK_MART_17,
    TASK_MART_18,
    TASK_MART_19,
    TASK_MART_20,
    TASK_MART_21,
    TASK_MART_22,
    TASK_MART_23,
    TASK_MART_24,
    TASK_MART_25,
    TASK_MART_26,
    TASK_MART_27
};

BOOL Task_Mart(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    MartData *data = TaskManager_GetEnvironment(taskManager);
    
    switch (data->state) {
    case TASK_MART_START:
        MartTask_InitMartMessageData(data);
        if (data->unk273 == 0) {
            data->state = TASK_MART_1;
        } else {
            data->state = 22;
        }
        break;
    case TASK_MART_1:
        MartData_InitCamera(fieldSystem, data);
        ov01_021F6A9C(fieldSystem, 2, data);
        data->state = TASK_MART_2;
        break;
    case TASK_MART_2:
        data->state = ov03_02257334(fieldSystem, data); // Returns 2 or 3.
        break;
    case TASK_MART_3: 
        if (data->unk294 == -1) {
            data->state = ov03_02257510(data);
        } else {
            data->state = ov03_0225761C(data, data->unk294);
            data->unk294 = -1;
        }
        break;
    case TASK_MART_4:
        data->state = TASK_MART_3;
        break;
    case TASK_MART_6:
        if (!Sprite_IsAnimated(data->sprites[10])) {
            data->state = ov03_02257874(data, data->unk268[data->unk290 + data->unk271]);
        }
        break;
    case TASK_MART_5:
        data->state = ov03_02257944(data); // Returns 5 or 7.
        break;
    case TASK_MART_7:
        if (data->unk294 == -1) {
            data->state = ov03_02257ADC(data);
        } else {
            data->state = ov03_02257B4C(data, data->unk294);
            data->unk294 = -1;
        }
        break;
    case TASK_MART_8:
        data->state = ov03_022579E0(data);
        break;
    case TASK_MART_9:
        data->state = ov03_02257A70(data); // Always returns 3.
        break;
    case TASK_MART_10:
        data->state = ov03_02257D6C(data);
        break;
    case TASK_MART_11:
        if (data->unk294 != -1) {
            data->state = ov03_02257D90(data, data->unk294);
            data->unk294 = -1;
        }
        break;
    case TASK_MART_12:
        data->state = MartData_PerformTransaction(data);
        break;
    case TASK_MART_13:
        data->state = ov03_02257F24(data);
        break;
    case TASK_MART_14:
        data->state = ov03_02257FF8(data);
        break;
    case TASK_MART_15:
        data->state = ov03_02258078(data);
        break;
    case TASK_MART_16:
        data->state = ov03_022577D0(data); // Always returns 17.
        break;
    case TASK_MART_17:
        MartData_RestoreBgPriorities(data);
        ov03_02258164(fieldSystem, data);
        data->state = TASK_MART_18;
        break;
    case TASK_MART_18:
        data->state = ov03_02258170(fieldSystem, data);
        break;
    case TASK_MART_19:
        data->state = ov03_022576F8(data); // Always returns 3.
        break;
    case TASK_MART_20:
        data->state = ov03_02257728(data); // Always returns 3.
        break;
    case TASK_MART_21:
        data->state = ov03_022586E0(data);
        break;
    case TASK_MART_22:
        ov03_0225874C(fieldSystem, data); // Always sets state to 23.
        break;
    case TASK_MART_23:
        ov03_02258764(taskManager);
        break;
    case TASK_MART_26:
        data->state = ov03_022587D4(fieldSystem, data);
        break;
    case TASK_MART_27:
        return ov03_0225709C(fieldSystem, data);
    }

    for (int i = 0; i < 19; i++) {
        if (data->sprites[i]) {
            Sprite_UpdateAnim(data->sprites[i], 0x1000);
        }
    }
    if (data->unk_ov01_021E7FDC.spriteList) {
        SpriteList_RenderAndAnimateSprites(data->unk_ov01_021E7FDC.spriteList);
    }
    return FALSE;
}

static void MartTask_InitMartMessageData(MartData *data) {
    MartData_InitMessageData(data);
}

static void MartData_InitMessageData(MartData *data) {
    data->messageData = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, NARC_msg_msg_0435_bin, HEAP_ID_FIELD2);
    data->messageFormat = MessageFormat_New(HEAP_ID_FIELD2);
}

static BOOL ov03_0225709C(FieldSystem *fieldSystem_unused, MartData *data) {
    DestroyMsgData(data->messageData);
    MessageFormat_Delete(data->messageFormat);
    String_Delete(data->string);
    Heap_Free(data->unk268);
    Heap_Free(data);
    return TRUE;
}

static void MartData_InitCamera(FieldSystem *fieldSystem, MartData *data) {
    FillBgTilemapRect(data->bgConfig, 3, 0, 0, 18, 32, 6, 0);
    ScheduleBgTilemapBufferTransfer(data->bgConfig, 3);
    MartData_AddWindows(data);
    data->camera = Camera_New(HEAP_ID_FIELD2);
    Camera_Copy(fieldSystem->camera, data->camera);
    Camera_SetStaticPtr(data->camera);
    data->unk281 = 0;
}

static void MartData_AddWindows(MartData *data) {
    for (u32 i = 0; i < 6; i++) {
        if (data->martType != MART_TYPE_NORMAL && data->martType != MART_TYPE_3 && data->martType != MART_TYPE_4 && i == 1) {
            AddWindow(data->bgConfig, &data->windows[i], &ov03_02259464);
        } else {
            AddWindow(data->bgConfig, &data->windows[i], &ov03_022594C6[i]);
        }
    }
}

static void ov03_02257184(MartData *data) {
    sub_0200E5D4(&data->windows[2], TRUE);
    for (u32 i = 0; i < 6; i++) {
        ClearWindowTilemapAndScheduleTransfer(&data->windows[i]);
        RemoveWindow(&data->windows[i]);
    };
}

static void ov03_022571AC(MartData *data) { // MartData_LoadGraphics?
    GfGfxLoader_LoadCharData(NARC_a_0_6_0, 0, data->bgConfig, GF_BG_LYR_MAIN_1, 0, 0, FALSE, HEAP_ID_FIELD2);
    if (data->martType == MART_TYPE_NORMAL || data->martType == MART_TYPE_3 || data->martType == MART_TYPE_4) {
        GfGfxLoader_LoadScrnData(NARC_a_0_6_0, 2, data->bgConfig, GF_BG_LYR_MAIN_1, 0, 0, FALSE, HEAP_ID_FIELD2);
    } else {
        GfGfxLoader_LoadScrnData(NARC_a_0_6_0, 3, data->bgConfig, GF_BG_LYR_MAIN_1, 0, 0, FALSE, HEAP_ID_FIELD2);
    }
    GfGfxLoader_GXLoadPal(NARC_a_0_6_0, 1, GF_PAL_LOCATION_MAIN_BG, GF_PAL_SLOT_0_OFFSET, 32, HEAP_ID_FIELD2);
    LoadUserFrameGfx1(data->bgConfig, GF_BG_LYR_MAIN_3, 31, 11, 0, HEAP_ID_FIELD2);
    LoadUserFrameGfx2(data->bgConfig, GF_BG_LYR_MAIN_3, 1, 10, Options_GetFrame(data->options), HEAP_ID_FIELD2);
}

static void ov03_0225725C(MartData *data) { // MartData_ToggleBgOn?
    data->engineAPlanes = GfGfx_EngineAGetPlanes();
    data->bgPriority[0] = GetBgPriority(data->bgConfig, 0);
    data->bgPriority[1] = GetBgPriority(data->bgConfig, 1);
    data->bgPriority[2] = GetBgPriority(data->bgConfig, 2);
    data->bgPriority[3] = GetBgPriority(data->bgConfig, 3);
    SetBgPriority(0, 3);
    SetBgPriority(1, 2);
    SetBgPriority(2, 1);
    SetBgPriority(3, 0);
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG0, TRUE);
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG1, TRUE);
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG2, TRUE);
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG3, TRUE);
}

static void MartData_RestoreBgPriorities(MartData *data) {
    SetBgPriority(0, data->bgPriority[0]);
    SetBgPriority(1, data->bgPriority[1]);
    SetBgPriority(2, data->bgPriority[2]);
    SetBgPriority(3, data->bgPriority[3]);
    GfGfx_EngineASetPlanes(data->engineAPlanes);
}

static u8 ov03_02257334(FieldSystem *fieldSystem, MartData *data) {
    if (ov01_021F6B10(fieldSystem) != TRUE) {
        return TASK_MART_2;
    }
    data->unk281 = 0;
    ov03_022571AC(data); // MartData_InitFrames?
    ov03_0225725C(data); // MartData_ToggleBgOn?
    ov03_022573D4(data, data->unk290);
    Sprite_SetDrawFlag(data->sprites[3], TRUE);
    return TASK_MART_3;
}

static const u8 ov03_0225949E[10][4] = {
    {48, 56, 0, 7},
    {176, 56, 0, 7},
    {48, 96, 0, 7},
    {176, 96, 0, 7},
    {48, 136, 0, 7},
    {176, 136, 0, 7},
    {24, 176, 4, 7},
    {64, 176, 4, 7},
    {224, 176, 7, 7},
    {160, 176, 7, 7}
};

static void ov03_02257378(MartData *data, int index, int arg2) {
    switch (arg2) {
    case 0:
        Sprite_SetAnimCtrlSeq(data->sprites[10], ov03_0225949E[data->unk290][2]);
        thunk_Sprite_SetPaletteOverride(data->sprites[10], ov03_0225949E[index][3]);
        Sprite_SetPositionXY(data->sprites[10], ov03_0225949E[index][0], ov03_0225949E[index][1]);
    case 1:
    case 2:
        break;
    }
}

static void ov03_022573D4(MartData *data, u32 arg1) {
    MsgData *msgData;
    String *string;
    u16 itemID = data->unk268[data->unk290 + data->unk271];
    switch (arg1) {
        case 0:
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:
            FillWindowPixelBuffer(&data->windows[1], 0);
            if (data->unk290 + data->unk271 < data->unk270) {
                if (data->martType == MART_TYPE_NORMAL || data->martType == MART_TYPE_3 || data->martType == MART_TYPE_4) {
                    string = String_New(130, HEAP_ID_FIELD2);
                    GetItemDescIntoString(string, itemID, HEAP_ID_FIELD2);
                } else if (data->martType == MART_TYPE_1) {
                    msgData = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, NARC_msg_msg_0737_bin, HEAP_ID_FIELD2);
                    string = NewString_ReadMsgData(msgData, itemID + 138);
                    DestroyMsgData(msgData);
                } else {
                    msgData = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, NARC_msg_msg_0434_bin, HEAP_ID_FIELD2);
                    string = NewString_ReadMsgData(msgData, sub_020910B8((u8)itemID));
                    DestroyMsgData(msgData);
                }
                AddTextPrinterParameterizedWithColor(&data->windows[1], 0, string, 0, 0, 0xFF, 0xF0E00, 0);
                String_Delete(string);
                ov03_022585A4(data, itemID);
            } else {
                Sprite_SetDrawFlag(data->sprites[3], 0);
            }
            ScheduleWindowCopyToVram(&data->windows[1]);
            break;
        case 8:
            FillWindowPixelBuffer(&data->windows[1], 0);
            ov03_022585A4(data, 0xFFFF);
            ScheduleWindowCopyToVram(&data->windows[1]);
        case 6:
        case 7:
            break;
    }
}

static const u8 ov03_0225947A[9][4] = {
    {4, 2, 6, 1},
    {8, 3, 0, 7},
    {0, 4, 6, 3},
    {1, 5, 2, 7},
    {2, 0, 6, 5},
    {3, 8, 4, 7},
    {4, 0, 8, 8},
    {4, 0, 8, 8},
    {5, 1, 8, 8}
};

static int ov03_02257510(MartData *data) {
    u8 unkExternVal;
    BOOL unkBool = FALSE;
    if (gSystem.newKeys & PAD_KEY_UP) {
        data->unk290 = ov03_0225947A[data->unk290][0];
        PlaySE(SEQ_SE_DP_SELECT);
        unkBool++;
    }
    else if (gSystem.newKeys & PAD_KEY_DOWN) {
        data->unk290 = ov03_0225947A[data->unk290][1];
        PlaySE(SEQ_SE_DP_SELECT);
        unkBool++;
    }
    else if (gSystem.newKeys & PAD_KEY_LEFT) {
        unkExternVal = ov03_0225947A[data->unk290][2];
        if (unkExternVal == 6) {
            return ov03_0225761C(data, 6);
        }
        if (data->unk290 != 8) {
            data->unk290 = unkExternVal;
            PlaySE(SEQ_SE_DP_SELECT);
            unkBool++;
        }
    }
    else if (gSystem.newKeys & PAD_KEY_RIGHT) {
        unkExternVal = ov03_0225947A[data->unk290][3];
        if (unkExternVal == 7) {
            return ov03_0225761C(data, 7);
        }
        if (data->unk290 != 8) {
            data->unk290 = unkExternVal;
            PlaySE(SEQ_SE_DP_SELECT);
            unkBool++;
        }
    }

    if (unkBool) {
        ov03_02257378(data, data->unk290, 0);
        ov03_022573D4(data, data->unk290);
    }
    if (gSystem.newKeys & PAD_BUTTON_B) {
        PlaySE(SEQ_SE_GS_GEARCANCEL);
        return ov03_022586CC(data, 13, 16);
    }
    if (gSystem.newKeys & PAD_BUTTON_A) {
        return ov03_0225761C(data, data->unk290);
    }
    return TASK_MART_3;
}

static u8 ov03_0225761C(MartData *data, u32 arg1) {
    switch (arg1) {
        case 0:
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:
            if (arg1 + data->unk271 < data->unk270) {
                data->unk290 = arg1;
                ov03_02257378(data, data->unk290, 0);
                Sprite_SetAnimCtrlSeq(data->sprites[10], 19);
                PlaySE(SEQ_SE_DP_SELECT);
                ov03_022573D4(data, data->unk290);
                return TASK_MART_6;
            }
            break;
        case 6:
            if (data->unk271) {
                PlaySE(SEQ_SE_DP_SELECT);
                return ov03_022586CC(data, 11, 19);
            }
            break;
        case 7:
            if (data->unk271 + 6 < data->unk270) {
                PlaySE(SEQ_SE_DP_SELECT);
                return ov03_022586CC(data, 12, 20);
            }
            break;
        case 8:
            ov03_02257378(data, arg1, 0);
            Sprite_SetAnimCtrlSeq(data->sprites[10], 7);
            PlaySE(SEQ_SE_GS_GEARCANCEL);
            ov03_022573D4(data, 8);
            return ov03_022586CC(data, 13, 16);
    }
    return TASK_MART_3;
}

static u8 ov03_022576F8(MartData *data) {
    data->unk271 -= 6;
    ov03_02257758(data, data->unk271, data->unk270);
    data->unk298 = 1;
    ov03_022573D4(data, data->unk290);
    return TASK_MART_3;
}

static u8 ov03_02257728(MartData *data) {
    data->unk271 += 6;
    ov03_02257758(data, data->unk271, data->unk270);
    data->unk298 = 1;
    ov03_022573D4(data, data->unk290);
    return TASK_MART_3;
}

static void ov03_02257758(MartData *data, int arg1, u8 arg2) {
    int temp;
    for (int i = 0; i < 6; i++) {
        if (arg2 - arg1 > 6) {
            temp = 6;
        } else if (arg2 - arg1 < 0) {
            temp = 0;
        } else {
            temp = arg2 - arg1;
        }
        
        if (i < temp) {
            ov03_02258648(data, i + 3, i + 2, data->unk268[i + arg1]);
            Sprite_SetDrawFlag(data->sprites[i + 4], TRUE);
        } else {
            Sprite_SetDrawFlag(data->sprites[i + 4], FALSE);
        }
    };
    ov03_022582C0(data, 0);
}

static u8 ov03_022577D0(MartData *data) {
    ov03_02257184(data);
    BgFillTilemapBufferAndSchedule(data->bgConfig, 1, 0);
    Sprite_SetDrawFlag(data->sprites[3], FALSE);
    return TASK_MART_17;
}

static u32 ov03_022577F4(MartData *data, u32 martType) {
    if (martType == MART_TYPE_3 || martType == MART_TYPE_4) {
        return PokeathlonSave_GetAthletePoints(data->pokeathlonSave);
    } else {
        return PlayerProfile_GetMoney(data->playerProfile);
    }
}

int ov03_02257814(MartData *data, u32 unkAmount) {
    if (data->martType == MART_TYPE_3) {
        if (PokeathlonSave_GetUnkB7C_AtIndex(data->pokeathlonSave, data->unk290 + data->unk271)) {
            return 2;
        }
    }
    else if (data->martType == MART_TYPE_4 && PokeathlonSave_GetUnkB78_AtIndex(data->pokeathlonSave, data->item - 505)) {
        return 3;
    }
    
    return unkAmount < data->cost;
}

static u8 ov03_02257874(MartData *data, u16 itemID) {
    data->spriteDrawn[0] = Sprite_GetDrawFlag(data->sprites[0]);
    data->spriteDrawn[1] = Sprite_GetDrawFlag(data->sprites[1]);
    Sprite_SetDrawFlag(data->sprites[0], FALSE);
    Sprite_SetDrawFlag(data->sprites[1], FALSE);
    ov03_022586BC(data, 1);
    data->item = itemID;
    data->quantity = 1;
    data->cost = ov03_02258120(data, data->item);
    u32 unkAmount = ov03_022577F4(data, data->martType);
    if (ov03_02257814(data, unkAmount)) {
        data->unk298 = 10;
        return TASK_MART_14;
    }
    data->unk288 = unkAmount / data->cost;
    if (data->unk288 > 99) {
        data->unk288 = 99;
    }
    if (data->martType == MART_TYPE_1 || data->martType == MART_TYPE_3 || data->martType == MART_TYPE_4) {
        return ov03_02257CA0(data);
    }
    ov03_022582C0(data, 1);
    data->unk298 = 2;
    return TASK_MART_5;
}

static u8 ov03_02257944(MartData *data) {
    if (IsPrintFinished(data->printerID) == FALSE) {
        return TASK_MART_5;
    }
    Sprite_SetDrawFlag(data->sprites[0], FALSE);
    Sprite_SetDrawFlag(data->sprites[1], FALSE);
    return TASK_MART_7;
}

int ov03_02257978(MartData *data, int itemID) {
    if (data->martType == MART_TYPE_NORMAL || data->martType == MART_TYPE_1 || data->martType == MART_TYPE_3 || data->martType == MART_TYPE_4) {
        if (itemID >= ITEM_RED_APRICORN && itemID <= ITEM_BLK_APRICORN) {
            return ApricornBox_CountApricorn(data->apricornBox, itemID - ITEM_RED_APRICORN);
        }
        return Bag_GetQuantity(data->inventory, data->item, HEAP_ID_FIELD2);
    }
    if (data->martType == MART_TYPE_SEAL) {
        return SealCase_CountSealOccurrenceAnywhere(data->inventory, data->item);
    }
    return 0;
}

static u8 ov03_022579E0(MartData *data) {
    Sprite_SetDrawFlag(data->sprites[0], FALSE);
    Sprite_SetDrawFlag(data->sprites[1], FALSE);
    sub_0200E5D4(&data->windows[4], TRUE);
    sub_0200E5D4(&data->windows[3], TRUE);
    FillWindowPixelBuffer(&data->windows[5], 15);
    data->unk298 = 7;
    Sprite_SetDrawFlag(data->sprites[18], FALSE);
    Sprite_SetDrawFlag(data->sprites[13], FALSE);
    Sprite_SetDrawFlag(data->sprites[14], FALSE);
    Sprite_SetDrawFlag(data->sprites[15], FALSE);
    Sprite_SetDrawFlag(data->sprites[16], FALSE);
    Sprite_SetDrawFlag(data->sprites[17], FALSE);
    return ov03_02257CA0(data);
}

static u8 ov03_02257A70(MartData *data) {
    sub_0200E5D4(&data->windows[4], TRUE);
    sub_0200E5D4(&data->windows[3], TRUE);
    ClearFrameAndWindow2(&data->windows[5], FALSE);
    ov03_02258560(data, FALSE);
    Sprite_SetDrawFlag(data->sprites[0], data->spriteDrawn[0]);
    Sprite_SetDrawFlag(data->sprites[1], data->spriteDrawn[1]);
    ov03_022586BC(data, 0);
    ov03_022582C0(data, 0);
    data->unk298 = 4;
    Sprite_SetDrawFlag(data->sprites[13], TRUE);
    return TASK_MART_3;
}

static u8 ov03_02257ADC(MartData *data) {
    if (sub_020881C0(&data->quantity, data->unk288)) {
        PlaySE(SEQ_SE_DP_BAG_004);
        data->unk298 = 6;
        return TASK_MART_7;
    }
    if (PAD_BUTTON_A & gSystem.newKeys) {
        PlaySE(SEQ_SE_DP_SELECT);
        return ov03_022586CC(data, 18, 8);
    }
    if (PAD_BUTTON_B & gSystem.newKeys) {
        PlaySE(SEQ_SE_GS_GEARCANCEL);
        return ov03_022586CC(data, 13, 9);
    }
    return TASK_MART_7;
}

static u8 ov03_02257B4C(MartData *data, u32 arg1) {
    switch (arg1) {
    case 0:
        if (data->unk288 >= 10) {
            data->quantity = ov03_022587E8(data->quantity, data->unk288, 10);
            Sprite_SetAnimationFrame(data->sprites[14], 0);
            Sprite_SetAnimCtrlSeq(data->sprites[14], 13);
            PlaySE(SEQ_SE_DP_BAG_004);
            data->unk298 = 6;
        }
        break;
    case 1:
        if (data->unk288 != 1) {
            data->quantity = ov03_022587E8(data->quantity, data->unk288, 1);
            Sprite_SetAnimationFrame(data->sprites[15], 0);
            Sprite_SetAnimCtrlSeq(data->sprites[15], 13);
            PlaySE(SEQ_SE_DP_BAG_004);
            data->unk298 = 6;
        }
        break;
    case 2:
        if (data->unk288 >= 10) {
            data->quantity = ov03_022587E8(data->quantity, data->unk288, -10);
            Sprite_SetAnimationFrame(data->sprites[16], 0);
            Sprite_SetAnimCtrlSeq(data->sprites[16], 15);
            PlaySE(SEQ_SE_DP_BAG_004);
            data->unk298 = 6;
        }
        break;
    case 3:
        if (data->unk288 != 1) {
            data->quantity = ov03_022587E8(data->quantity, data->unk288, -1);
            Sprite_SetAnimationFrame(data->sprites[17], 0);
            Sprite_SetAnimCtrlSeq(data->sprites[17], 15);
            PlaySE(SEQ_SE_DP_BAG_004);
            data->unk298 = 6;
        }
        break;
    case 4:
        PlaySE(SEQ_SE_DP_SELECT);
        return ov03_022586CC(data, 18, 8);
    case 5:
        PlaySE(SEQ_SE_GS_GEARCANCEL);
        return ov03_022586CC(data, 13, 9);
    }
    return TASK_MART_7;
}

static u8 ov03_02257CA0(MartData *data) {
    int quantity;
    if (data->martType == MART_TYPE_NORMAL) {
        quantity = Bag_HasSpaceForItem(data->inventory, data->item, data->quantity, HEAP_ID_FIELD2);
    } else if (data->martType == MART_TYPE_1) {
        quantity = 0;
    } else if (data->martType == MART_TYPE_3 || data->martType == MART_TYPE_4) {
        if (data->item >= ITEM_RED_APRICORN && data->item <= ITEM_BLK_APRICORN) {
            if (ApricornBox_CountApricorn(data->apricornBox, data->item - ITEM_RED_APRICORN) == 99) {
                data->unk298 = 12;
                return TASK_MART_14;
            }
        } else if (Bag_HasSpaceForItem(data->inventory, data->item, data->quantity, HEAP_ID_FIELD2) == FALSE) {
            data->unk298 = 12;
            return TASK_MART_14;
        }
        ov03_022582C0(data, 2);
        data->unk298 = 3;
        return TASK_MART_10;
    } else {
        quantity = SealCase_CheckSealQuantity(data->inventory, data->item, data->quantity);
    }
    
    if (quantity == 0) {
        data->quantity = 0;
        data->unk298 = 11;
        return TASK_MART_13;
    }
    return TASK_MART_10;
}

static u8 ov03_02257D6C(MartData *data) {
    if (IsPrintFinished(data->printerID) == FALSE) {
        return TASK_MART_10;
    }
    data->unk298 = 8;
    return TASK_MART_11;
}

static u8 ov03_02257D90(MartData *data, u32 arg1) {
    switch (arg1) {
    case 0:
        data->unk298 = 9;
        return TASK_MART_12;
    case 1:
        ClearFrameAndWindow2(&data->windows[5], FALSE);
        ov03_02258560(data, FALSE);
        Sprite_SetDrawFlag(data->sprites[0], data->spriteDrawn[0]);
        Sprite_SetDrawFlag(data->sprites[1], data->spriteDrawn[1]);
        ov03_022586BC(data, 0);
        ov03_022582C0(data, 0);
        data->unk298 = 4;
        return TASK_MART_3;
    default:
        return TASK_MART_11;
    }
}

static void MartData_SubCurrency(MartData *data, int currency) {
    if (data->martType == MART_TYPE_3 || data->martType == MART_TYPE_4) {
        PokeathlonSave_SubAthletePoints(data->pokeathlonSave, currency);
    } else {
        PlayerProfile_SubMoney(data->playerProfile, data->cost * data->quantity);
    }
}

static void MartData_Inventory_AddApricornOrItem(MartData *data, int item) {
    if (item >= ITEM_RED_APRICORN && item <= ITEM_BLK_APRICORN) {
        ApricornBox_GiveApricorn(data->apricornBox, item - ITEM_RED_APRICORN, 1);
    } else {
        Bag_AddItem(data->inventory, data->item, 1, HEAP_ID_FIELD2);
    }
}

static u8 MartData_PerformTransaction(MartData *data) {
    if (IsPrintFinished(data->printerID) == FALSE) {
        return TASK_MART_12;
    }
    if (data->martType == MART_TYPE_NORMAL) {
        Bag_AddItem(data->inventory, data->item, data->quantity, HEAP_ID_FIELD2);
    } else if (data->martType == MART_TYPE_3) {
        MartData_Inventory_AddApricornOrItem(data, data->item);
        PokeathlonSave_SetUnkB7C_AtIndex(data->pokeathlonSave, data->unk290 + data->unk271);
    } else if (data->martType == MART_TYPE_4) {
        PokeathlonSave_SetUnkB78_AtIndex(data->pokeathlonSave, data->item - 505);
    } else {
        GiveOrTakeSeal(data->inventory, data->item, data->quantity);
    }
    MartData_SubCurrency(data, data->cost * data->quantity);
    GameStats_Add(data->gameStats, GAME_STAT_CURRENCY_SPENT, data->cost * data->quantity);
    return TASK_MART_13;
}

static u8 ov03_02257F24(MartData *data) {
    if (IsPrintFinished(data->printerID) == FALSE) {
        return TASK_MART_13;
    }
    if ((PAD_BUTTON_A | PAD_BUTTON_B) & gSystem.newKeys || gSystem.touchNew) {
        if (data->unk264 == 1) {
            sub_02066D80(data->varsFlags);
        }
        if (data->martType == MART_TYPE_NORMAL && data->item == ITEM_POKE_BALL && data->quantity >= 10 && Bag_AddItem(data->inventory, ITEM_PREMIER_BALL, 1, HEAP_ID_FIELD2) == TRUE) {
            data->unk298 = 13;
            GameStats_Inc(data->gameStats, GAME_STAT_PREMIER_BALLS_EARNED);
            return TASK_MART_15;
        }
        ClearFrameAndWindow2(&data->windows[5], 0);
        ov03_02258560(data, FALSE);
        Sprite_SetDrawFlag(data->sprites[0], data->spriteDrawn[0]);
        Sprite_SetDrawFlag(data->sprites[1], data->spriteDrawn[1]);
        ov03_022586BC(data, 0);
        ov03_022582C0(data, 0);
        data->unk298 = 4;
        return TASK_MART_4;
    }
    return TASK_MART_13;
}

static u8 ov03_02257FF8(MartData *data) {
    if (IsPrintFinished(data->printerID) == FALSE) {
        return TASK_MART_14;
    }
    if ((PAD_BUTTON_A | PAD_BUTTON_B) & gSystem.newKeys || gSystem.touchNew) {
        ClearFrameAndWindow2(&data->windows[5], FALSE);
        ov03_02258560(data, FALSE);
        Sprite_SetDrawFlag(data->sprites[0], data->spriteDrawn[0]);
        Sprite_SetDrawFlag(data->sprites[1], data->spriteDrawn[1]);
        ov03_022586BC(data, 0);
        ov03_022582C0(data, 0);
        data->unk298 = 5;
        return TASK_MART_4;
    }
    return TASK_MART_14;
}

static u8 ov03_02258078(MartData *data) {
    if (IsPrintFinished(data->printerID) == FALSE) {
        return TASK_MART_15;
    }
    if ((PAD_BUTTON_A | PAD_BUTTON_B) & gSystem.newKeys || gSystem.touchNew) {
        ClearFrameAndWindow2(&data->windows[5], FALSE);
        ov03_02258560(data, FALSE);
        Sprite_SetDrawFlag(data->sprites[0], data->spriteDrawn[0]);
        Sprite_SetDrawFlag(data->sprites[1], data->spriteDrawn[1]);
        ov03_022586BC(data, 0);
        ov03_022582C0(data, 0);
        data->unk298 = 4;
        return TASK_MART_3;
    }
    return TASK_MART_15;
}

static u16 ov03_022580F8(u16 itemID, const struct MartItem *priceOverrides, u8 unk270) {
    for (int i = 0; i < unk270; i++) {
        if (itemID == priceOverrides[i].item_id) {
            return priceOverrides[i].cost;
        }
    }
    GF_AssertFail();
    return 0;
}

u32 ov03_02258120(MartData *data, u16 itemID) {
    if (data->martType == MART_TYPE_NORMAL) {
        return GetItemAttr(itemID, 0, HEAP_ID_FIELD2);
    } else if (data->martType == MART_TYPE_1) {
        return 100;
    } else if (data->martType == MART_TYPE_3 || data->martType == MART_TYPE_4) {
        return ov03_022580F8(itemID, data->priceOverrides, data->unk270);
    }
    return 100;
}

static void ov03_02258164(FieldSystem *fieldSystem, MartData *data_unused) {
    ov01_021F6A9C(fieldSystem, fieldSystem->unk1C, NULL);
}

static u8 ov03_02258170(FieldSystem *fieldSystem, MartData *data) {
    if (ov01_021F6B10(fieldSystem) == FALSE && ov01_021F6B00(fieldSystem) != 1) {
        return TASK_MART_18;
    }
    data->unk281 = 0;
    Camera_Copy(data->camera, fieldSystem->camera);
    Camera_Delete(data->camera);
    Camera_SetStaticPtr(fieldSystem->camera);
    ov03_02258288(data);
    return TASK_MART_27;
}

static const u16 ov03_0225946C[7] = {
    66,
    67,
    65,
    64,
    0xFFFF,
    0xFFFF,
    88
};

static const SpriteTemplate_ov01_021E81F0 ov03_022594F8[19] = {
    {
        .unk_0 = 0, 
        .unk_4 = 177,
        .unk_6 = 8,
        .unk_8 = 0,
        .unk_A = 0,
        .unk_C = 0,
        .unk_10 = 0,
        .unk_14 = 1,
        .unk_18 = 0,
        .filler_1C = 0,
    },
    {
        .unk_0 = 0,
        .unk_4 = 177,
        .unk_6 = 132,
        .unk_8 = 0,
        .unk_A = 1,
        .unk_C = 0,
        .unk_10 = 0,
        .unk_14 = 1,
        .unk_18 = 0,
        .filler_1C = 0,
    },
   
    {
        .unk_0 = 1,
        .unk_4 = 176,
        .unk_6 = 24,
        .unk_8 = 0,
        .unk_A = 0,
        .unk_C = 0,
        .unk_10 = 0,
        .unk_14 = 1,
        .unk_18 = 0,
        .filler_1C = 0,
    },
    {
        .unk_0 = 2,
        .unk_4 = 22,
        .unk_6 = 172,
        .unk_8 = 0,
        .unk_A = 0,
        .unk_C = 0,
        .unk_10 = 0,
        .unk_14 = 1,
        .unk_18 = 0,
        .filler_1C = 0,
    },
    {
        .unk_0 = 3,
        .unk_4 = 22,
        .unk_6 = 59,
        .unk_8 = 0,
        .unk_A = 0,
        .unk_C = 0,
        .unk_10 = 0,
        .unk_14 = 2,
        .unk_18 = 0,
        .filler_1C = 0,
    },
    {
        .unk_0 = 4,
        .unk_4 = 152,
        .unk_6 = 59,
        .unk_8 = 0,
        .unk_A = 0,
        .unk_C = 0,
        .unk_10 = 0,
        .unk_14 = 2,
        .unk_18 = 0,
        .filler_1C = 0,
    },
    {
        .unk_0 = 5,
        .unk_4 = 22,
        .unk_6 = 100,
        .unk_8 = 0,
        .unk_A = 0,
        .unk_C = 0,
        .unk_10 = 0,
        .unk_14 = 2,
        .unk_18 = 0,
        .filler_1C = 0,
    },
    {
        .unk_0 = 6,
        .unk_4 = 152,
        .unk_6 = 100,
        .unk_8 = 0,
        .unk_A = 0,
        .unk_C = 0,
        .unk_10 = 0,
        .unk_14 = 2,
        .unk_18 = 0,
        .filler_1C = 0,
    },
    {
        .unk_0 = 7,
        .unk_4 = 22,
        .unk_6 = 139,
        .unk_8 = 0,
        .unk_A = 0,
        .unk_C = 0,
        .unk_10 = 0,
        .unk_14 = 2,
        .unk_18 = 0,
        .filler_1C = 0,
    },
    {
        .unk_0 = 8,
        .unk_4 = 152,
        .unk_6 = 139,
        .unk_8 = 0,
        .unk_A = 0,
        .unk_C = 0,
        .unk_10 = 0,
        .unk_14 = 2,
        .unk_18 = 0,
        .filler_1C = 0,
    },
    {
        .unk_0 = 9,
        .unk_4 = 0,
        .unk_6 = 0,
        .unk_8 = 0,
        .unk_A = 0,
        .unk_C = 0,
        .unk_10 = 0,
        .unk_14 = 2,
        .unk_18 = 0,
        .filler_1C = 0,
    },
    {
        .unk_0 = 9,
        .unk_4 = 24,
        .unk_6 = 176,
        .unk_8 = 0,
        .unk_A = 2,
        .unk_C = 0,
        .unk_10 = 0,
        .unk_14 = 2,
        .unk_18 = 0,
        .filler_1C = 0,
    },
    {
        .unk_0 = 9,
        .unk_4 = 64,
        .unk_6 = 176,
        .unk_8 = 0,
        .unk_A = 3,
        .unk_C = 0,
        .unk_10 = 0,
        .unk_14 = 2,
        .unk_18 = 0,
        .filler_1C = 0,
    },
    {
        .unk_0 = 9,
        .unk_4 = 224,
        .unk_6 = 176,
        .unk_8 = 0,
        .unk_A = 6,
        .unk_C = 0,
        .unk_10 = 0,
        .unk_14 = 2,
        .unk_18 = 0,
        .filler_1C = 0,
    },
    {
        .unk_0 = 9,
        .unk_4 = 136,
        .unk_6 = 104,
        .unk_8 = 0,
        .unk_A = 12,
        .unk_C = 0,
        .unk_10 = 0,
        .unk_14 = 2,
        .unk_18 = 0,
        .filler_1C = 0,
    },
    {
        .unk_0 = 9,
        .unk_4 = 168,
        .unk_6 = 104,
        .unk_8 = 0,
        .unk_A = 12,
        .unk_C = 0,
        .unk_10 = 0,
        .unk_14 = 2,
        .unk_18 = 0,
        .filler_1C = 0,
    },
    {
        .unk_0 = 9,
        .unk_4 = 136,
        .unk_6 = 152,
        .unk_8 = 0,
        .unk_A = 14,
        .unk_C = 0,
        .unk_10 = 0,
        .unk_14 = 2,
        .unk_18 = 0,
        .filler_1C = 0,
    },
    {
        .unk_0 = 9,
        .unk_4 = 168,
        .unk_6 = 152,
        .unk_8 = 0,
        .unk_A = 14,
        .unk_C = 0,
        .unk_10 = 0,
        .unk_14 = 2,
        .unk_18 = 0,
        .filler_1C = 0,
    },
    {
        .unk_0 = 9,
        .unk_4 = 136,
        .unk_6 = 176,
        .unk_8 = 0,
        .unk_A = 24,
        .unk_C = 0,
        .unk_10 = 0,
        .unk_14 = 2,
        .unk_18 = 0,
        .filler_1C = 0,
    }
};

void ov03_022581BC(MartData *data) {
    UnkFieldSpriteRenderer_ov01_021E7FDC_Init(&data->unk_ov01_021E7FDC, ov03_0225946C, 19, HEAP_ID_FIELD2);
    for (u32 i = 0; i < 19; i++) {
        data->sprites[i] = ov01_021E81F0(&data->unk_ov01_021E7FDC, &ov03_022594F8[i]);
    }
    Sprite_SetPriority(data->sprites[13], 1);
    Sprite_SetPriority(data->sprites[18], 1);
    Sprite_SetAnimActiveFlag(data->sprites[10], 1);
    Sprite_SetDrawFlag(data->sprites[2], 0);
    Sprite_SetDrawFlag(data->sprites[0], 0);
    Sprite_SetDrawFlag(data->sprites[1], 0);
    Sprite_SetDrawFlag(data->sprites[3], 0);
    GfGfx_EngineATogglePlanes(16, 1);
    GfGfx_EngineBTogglePlanes(16, 1);
    ov03_022582C0(data, 0);
    ov03_02257378(data, data->unk290, 0);
    ov03_02257758(data, data->unk271, data->unk270);
}

static void ov03_02258288(MartData *data) {
    for (u32 i = 0; i < 19; i++) {
        Sprite_Delete(data->sprites[i]);
        data->sprites[i] = NULL;
    }
    UnkFieldSpriteRenderer_ov01_021E7FDC_Release(&data->unk_ov01_021E7FDC);
    data->unk_ov01_021E7FDC.spriteList = NULL;
}

enum OV03_02259850_Data {
    OV03_02259850_SPRITE_INDEX,
    OV03_02259850_DATA_1,
    OV03_02259850_DATA_2,
    OV03_02259850_MAX
};

static u8 ov03_02259850[15][OV03_02259850_MAX] = {
    {4, 5, 2},
    {5, 5, 2},
    {6, 5, 2},
    {7, 5, 2},
    {8, 5, 2},
    {9, 5, 2},
    {10, 1, 0},
    {11, 3, 0},
    {12, 4, 0},
    {13, 1, 1},
    {14, 0, 1},
    {15, 0, 1},
    {16, 0, 1},
    {17, 0, 1},
    {18, 0, 1}
};

static void ov03_022582C0(MartData *data, int arg1) {
    int i;
    int j;
    switch (arg1) {
    case 0:
        for (j = 0; j < 6; j++) {
            VecFx32 vec;
            vec.x = ov03_022594F8[j + 4].unk_4 << 12;
            vec.y = (ov03_022594F8[j + 4].unk_6 << 12) + 0xC0000;
            vec.z = ov03_022594F8[j + 4].unk_8 << 12;
            Sprite_SetMatrix(data->sprites[j + 4], &vec);
        }
        for (i = 0; i < NELEMS(ov03_02259850); i++) {
            if (ov03_02259850[i][OV03_02259850_DATA_1] == 4) {
                if (data->unk271 + 6 < data->unk270) {
                    Sprite_SetDrawFlag(data->sprites[ov03_02259850[i][OV03_02259850_SPRITE_INDEX]], TRUE);
                } else {
                    Sprite_SetDrawFlag(data->sprites[ov03_02259850[i][OV03_02259850_SPRITE_INDEX]], FALSE);
                }
            } else if (ov03_02259850[i][OV03_02259850_DATA_1] == 3){
                if (data->unk271 == 0) {
                    Sprite_SetDrawFlag(data->sprites[ov03_02259850[i][OV03_02259850_SPRITE_INDEX]], FALSE);
                } else {
                    Sprite_SetDrawFlag(data->sprites[ov03_02259850[i][OV03_02259850_SPRITE_INDEX]], TRUE);
                }
            } else if (ov03_02259850[i][OV03_02259850_DATA_1] == 5) {
                if (data->unk271 + i < data->unk270) {
                    Sprite_SetDrawFlag(data->sprites[ov03_02259850[i][OV03_02259850_SPRITE_INDEX]], TRUE);
                } else {
                    Sprite_SetDrawFlag(data->sprites[ov03_02259850[i][OV03_02259850_SPRITE_INDEX]], FALSE);
                }
            } else {
                Sprite_SetDrawFlag(data->sprites[ov03_02259850[i][OV03_02259850_SPRITE_INDEX]], ov03_02259850[i][OV03_02259850_DATA_1]);
            }
        }
        Sprite_SetAnimationFrame(data->sprites[13], 0);
        Sprite_SetAnimCtrlSeq(data->sprites[13], 6);
        break;
    case 1:
        for (i = 0; i < NELEMS(ov03_02259850); i++) {
            if (ov03_02259850[i][OV03_02259850_DATA_2] == 2) {
                if (data->unk290 == i) {
                    VecFx32 vec2;
                    vec2.x = 0x56000;
                    vec2.y = 0x10C000;
                    vec2.z = 0;
                    Sprite_SetMatrix(data->sprites[ov03_02259850[i][OV03_02259850_SPRITE_INDEX]], &vec2);
                    Sprite_SetDrawFlag(data->sprites[ov03_02259850[i][OV03_02259850_SPRITE_INDEX]], TRUE);
                } else {
                    Sprite_SetDrawFlag(data->sprites[ov03_02259850[i][OV03_02259850_SPRITE_INDEX]], FALSE);
                }
            } else {
                if (ov03_02259850[i][OV03_02259850_SPRITE_INDEX] == 14 || ov03_02259850[i][OV03_02259850_SPRITE_INDEX] == 16) {
                    if (data->unk288 < 10) {
                        Sprite_SetDrawFlag(data->sprites[ov03_02259850[i][OV03_02259850_SPRITE_INDEX]], FALSE);
                    } else {
                        Sprite_SetDrawFlag(data->sprites[ov03_02259850[i][OV03_02259850_SPRITE_INDEX]], TRUE);
                    }
                } else if (ov03_02259850[i][OV03_02259850_SPRITE_INDEX] == 15 || ov03_02259850[i][OV03_02259850_SPRITE_INDEX] == 17) {
                    if (data->unk288 == 1) {
                        Sprite_SetDrawFlag(data->sprites[ov03_02259850[i][OV03_02259850_SPRITE_INDEX]], FALSE);
                    } else {
                        Sprite_SetDrawFlag(data->sprites[ov03_02259850[i][OV03_02259850_SPRITE_INDEX]], TRUE);
                    }
                } else {
                    Sprite_SetDrawFlag(data->sprites[ov03_02259850[i][OV03_02259850_SPRITE_INDEX]], ov03_02259850[i][OV03_02259850_DATA_2]);
                }
            }
        }
        Sprite_SetAnimationFrame(data->sprites[13], 0);
        Sprite_SetAnimCtrlSeq(data->sprites[13], 26);
        break;
    case 2:
        for (i = 0; i < NELEMS(ov03_02259850); i++) {
            if (data->unk290 == i) {
                VecFx32 vec3;
                vec3.x = 0x56000;
                vec3.y = 0x10C000;
                vec3.z = 0;
                Sprite_SetMatrix(data->sprites[ov03_02259850[i][OV03_02259850_SPRITE_INDEX]], &vec3);
                Sprite_SetDrawFlag(data->sprites[ov03_02259850[i][OV03_02259850_SPRITE_INDEX]], TRUE);
            } else {
                Sprite_SetDrawFlag(data->sprites[ov03_02259850[i][OV03_02259850_SPRITE_INDEX]], FALSE);
            }
        }
        break;
    
    }
}

static void ov03_02258560(MartData *data, BOOL arg1) {
    if (arg1 == FALSE) {
        Sprite_SetPositionXY(data->sprites[0], 177, 8);
        Sprite_SetPositionXY(data->sprites[1], 177, 132);
    } else { // This is never used.
        Sprite_SetPositionXY(data->sprites[0], 162, 108);
        Sprite_SetPositionXY(data->sprites[1], 162, 132);
    }
}

static void ov03_022585A4(MartData *data, u16 itemID) {
    SpriteResource *spriteResource;
    if (data->martType != 0 && data->martType != 3 && data->martType != 4) {
        Sprite_SetDrawFlag(data->sprites[3], FALSE);
    } else {
        spriteResource = SpriteResourceCollection_Find(data->unk_ov01_021E7FDC.spriteResManagers[0], 2);
        ReplaceCharResObjFromNarc(data->unk_ov01_021E7FDC.spriteResManagers[0], spriteResource, NARC_itemtool_itemdata_item_icon, GetItemIndexMapping(itemID, 1), FALSE, HEAP_ID_FIELD2);
        sub_0200AE8C(spriteResource);
        spriteResource = SpriteResourceCollection_Find(data->unk_ov01_021E7FDC.spriteResManagers[1], 1);
        ReplacePlttResObjFromNarc(data->unk_ov01_021E7FDC.spriteResManagers[1], spriteResource, NARC_itemtool_itemdata_item_icon, GetItemIndexMapping(itemID, 2), FALSE, HEAP_ID_FIELD2);
        sub_0200B084(spriteResource);
        Sprite_SetDrawFlag(data->sprites[3], TRUE);
    }
}

static void ov03_02258648(MartData *data, int charID, int paletteID, u16 item) {
    SpriteResource *charResObj = SpriteResourceCollection_Find(data->unk_ov01_021E7FDC.spriteResManagers[0], charID);
    ReplaceCharResObjFromNarc(data->unk_ov01_021E7FDC.spriteResManagers[0], charResObj, NARC_itemtool_itemdata_item_icon, GetItemIndexMapping(item, 1), FALSE, HEAP_ID_FIELD2);
    sub_0200AE8C(charResObj);
    SpriteResource *plttResObj = SpriteResourceCollection_Find(data->unk_ov01_021E7FDC.spriteResManagers[1], paletteID);
    ReplacePlttResObjFromNarc(data->unk_ov01_021E7FDC.spriteResManagers[1], plttResObj, NARC_itemtool_itemdata_item_icon, GetItemIndexMapping(item, 2), FALSE, HEAP_ID_FIELD2);
    sub_0200B084(plttResObj);
}

static void ov03_022586BC(MartData *data, int flag) {
    thunk_Sprite_SetPaletteOverride(data->sprites[2], flag);
}

static u8 ov03_022586CC(MartData *data, u8 arg1, u8 arg2) {
    UnkMiniStruct *mini = &data->unk29C;
    mini->unk0[0] = arg1;
    mini->unk0[1] = 0;
    mini->unk0[2] = 0;
    mini->unk0[3] = arg2;
    return TASK_MART_21;
}

static u8 ov03_022586E0(MartData *data) {
    UnkMiniStruct *mini = &data->unk29C;
    switch (mini->unk0[1]) {
    case 0:
        thunk_Sprite_SetPaletteOverride(data->sprites[data->unk29C.unk0[0]], 7);
        mini->unk0[1]++;
        break;
    case 1:
        mini->unk0[2]++;
        if (mini->unk0[2] == 4) {
            thunk_Sprite_SetPaletteOverride(data->sprites[data->unk29C.unk0[0]], 6);
            mini->unk0[2] = 0;
            mini->unk0[1]++;
        }
        break;
    case 2:
        mini->unk0[2]++;
        if (mini->unk0[2] == 2) {
            return mini->unk0[3];
        }
        break;
    }
    return TASK_MART_21;
}

static void ov03_0225874C(FieldSystem *fieldSystem_unused, MartData *data) {
    ov01_021E636C(0);
    data->state = TASK_MART_23;
}

static const u8 ov03_022597F0[9] = {
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    0xFF
};

static void ov03_02258764(TaskManager *taskManager) {
    if (IsPaletteFadeFinished()) {
        FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
        MartData *data = TaskManager_GetEnvironment(taskManager);
        data->bagView = Bag_CreateView(Save_Bag_Get(fieldSystem->saveData), ov03_022597F0, HEAP_ID_FIELD2);
        sub_0207789C(data->bagView, fieldSystem->saveData, 2, fieldSystem->bagCursor, &fieldSystem->menuInputState);
        Bag_LaunchApp(fieldSystem, data->bagView);
        TaskManager_Jump(taskManager, sub_02092B04, data);
        data->state = TASK_MART_24;
    }
}

static u8 ov03_022587D4(FieldSystem *fieldSystem_unused, MartData *data_unused) {
    return IsPaletteFadeFinished() == FALSE ? (u8)TASK_MART_26 : (u8)TASK_MART_27;
}

static int ov03_022587E8(s16 currentQuantity, u16 arg1, s16 modifier) {
    int ret;
    if (modifier > 0) {
        if (currentQuantity == arg1) {
            return 1;
        }
        ret = currentQuantity + modifier;
        if (ret > arg1) {
            return arg1;
        }
    } else if (currentQuantity == 1) {
        return arg1;
    } else {
        ret = currentQuantity + modifier;
        if (ret <= 0) {
            ret = 1;
        }
    }
    return ret;
}
