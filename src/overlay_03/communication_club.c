#include "overlay_01.h"
#include "overlay_03.h"

#include "field_system.h"
#include "global.h"
#include "render_text.h"
#include "task.h"
#include "text.h"

#include "unk_02005D10.h"
#include "unk_02034354.h"
#include "unk_02034B0C.h"
#include "unk_02035900.h"
#include "unk_020379A0.h"
#include "unk_02037C94.h"
#include "unk_02058034.h"

#include "constants/comm_type.h"

#include "msgdata/msg.naix"
#include "msgdata/msg/msg_0182.h"

typedef struct CommClubManager CommClubManager;
typedef void (*CommClubManagerTaskFunc)(SysTask *, void *);
typedef void (*UnkFuncPtr_CommClub)(CommClubManager *);

struct CommClubManager {
    String *string[8];
    Window windows[3];
    MessageFormat *messageFormat[3];
    ListMenu *listMenu;
    u32 menu; // Menu?
    ListMenuItem *items;
    FieldSystem *fieldSystem;
    CommClubManagerTaskFunc commClubTask;
    UnkFuncPtr_CommClub unk70;
    MsgData *msgData;
    PlayerProfile *playerProfile[2];
    u8 unk80[8];
    u32 retCode;
    u16 unk8C;
    u16 connectionIndex;
    u8 connectedCount;
    u8 commType;
    u8 unk92;
    u8 unk93;
    u8 printerID;
    u8 unk95;
    u8 messageDelay;
    u8 unk97;
    u8 unk98;
    u8 unk99;
    u16 unk9A;
    void *unk9C;
    u8 unkA0;
    u8 unkA1;
    u16 unkA2;
    u32 unkA4;
    u32 unkA8;
};

static void ov03_02254150(ListMenu *list, u16 cursorPos_unused, u8 itemsAbove);
static void ov03_022543AC(CommClubManager *commClubManager_unused);
static void ov03_02254100(struct ListMenu *list_unused, s32 index_unused, u8 onInit);
static void ov03_02254120(struct ListMenu *list, s32 index_unused, u8 y_unused);
static void ov03_02254420();
static void ov03_02254500(void *arg0, CommClubManager *commClubManager);
static void ov03_02254600(CommClubManager* commClubManager_unused);
static void ov03_02254660(void *arg0, CommClubManager *commClubManager);
static void ov03_022546B0(void *arg0, CommClubManager *commClubManager);
static BOOL ov03_022547D8(void *arg0, CommClubManager *commClubManager);
static void ov03_022548E0(void *arg0, CommClubManager *commClubManager);
static void ov03_0225499C(void *arg0, CommClubManager *commClubManager);
static void ov03_022549D8(void *arg0, CommClubManager *commClubManager);
static void ov03_02254B44();
static void ov03_02254B4C(void* arg0);
static void ov03_02254D64(SysTask *task, void *arg1);
static void ov03_02254D78(s32 arg0_unused, CommClubManager *commClubManager);
static void ov03_02254E70(void *arg0, CommClubManager *commClubManager);
static void ov03_02255280(void *arg0, CommClubManager *commClubManager);
static void ov03_022552C8(void *arg0, CommClubManager *commClubManager);
static void ov03_0225530C(void *arg0_unused, CommClubManager *commClubManager);
static void ov03_02255388(void *arg0_unused, CommClubManager *commClubManager);
static void ov03_022553C8(void *arg0_unused, CommClubManager *commClubManager);
static void ov03_02255404(void *arg0, CommClubManager *commClubManager);
static void ov03_022554E0(void *arg0, CommClubManager *commClubManager);
static void ov03_0225554C(SysTask *task, void *commClubManager_unused);
static void ov03_0225558C(void *arg0, CommClubManager *commClubManager);
static void ov03_022555F4(void* arg0_unused, CommClubManager* commClubManager);
static void ov03_0225562C(void *arg0, CommClubManager *commClubManager);
static void ov03_022556BC(void *arg0, CommClubManager *commClubManager);
static void ov03_02255714(s32 arg0_unused, CommClubManager *commClubManager);
static void ov03_0225574C(void *task, CommClubManager *commClubManager);
static void ov03_022557CC(CommClubManager *commClubManager);
static void ov03_02255804(CommClubManager *commClubManager);
static void ov03_02255860(u32 arg0_unused, CommClubManager *commClubManager);
static void ov03_022558C4(void *task, CommClubManager *commClubManager);
static void ov03_02255A00();
static void ov03_02255A2C(SysTask *task);
static void ov03_02255A70(CommClubManager *commClubManager);
static void ov03_02255AB0(SysTask *task, void *commClubManager);
static void ov03_02255ADC(void *commClubManager);
static void ov03_02255B04(SysTask *task, void *commClubManager);
static void ov03_02255B44(CommClubManager *commClubManager_unused);
static int ov03_02255B70();
static int ov03_02255B84();
static int ov03_02255B98();
static void ov03_02254BEC();
static BOOL ov03_02255C80();
static void ov03_02255C84(CommClubManager *commClubManager);
static BOOL ov03_02255CA0(CommClubManager *commClubManager);
static BOOL ov03_02255CD0(CommClubManager *commClubManager);
static void ov03_02255CE4(CommClubManager *commClubManager);

static CommClubManager* sCommClubManager = NULL;

static const u32 ov03_0225912C = 335;
static const u32 ov03_02259130 = 334;

static const u32 ov03_0225913C[2] = {
    336,
    334
};

static const u32 ov03_02259134[2] = {
    333,
    334
};

static const ListMenuTemplate ov03_02259164 = {
	.items = NULL,
	.moveCursorFunc = ov03_02254100,
	.itemPrintFunc = ov03_02254120,
	.window = NULL,
	.totalItems = 16,
    .maxShowed = 5,
	.header_X = 0,
	.item_X = 8,
	.cursor_X = 0,
	.upText_Y = 0,
    .cursorPal = 1,
    .fillValue = 15,
    .cursorShadowPal = 2,
    .lettersSpacing = 0,
    .itemVerticalPadding = 16,
    .scrollMultiple = 1,
    .fontId = 0,
    .cursorKind = 0,
	.data = NULL
};

static const ListMenuTemplate ov03_02259144 = {
    .items = NULL,
    .moveCursorFunc = NULL,
    .itemPrintFunc = NULL,
    .window = NULL,
    .totalItems = 5,
    .maxShowed = 5,
    .header_X = 0,
    .item_X = 1,
    .cursor_X = 0,
    .upText_Y = 0,
    .cursorPal = 1,
    .fillValue = 15,
    .cursorShadowPal = 2,
    .lettersSpacing = 0,
    .itemVerticalPadding = 16,
    .scrollMultiple = 1,
    .fontId = 0,
    .cursorKind = 1,
    .data = NULL
};

static void ov03_02253E20(s32 strno, BOOL arg1) {
    if (IsPrintFinished(sCommClubManager->printerID) == FALSE) {
        RemoveTextPrinter(sCommClubManager->printerID);
    }
    if (arg1) {
        ReadMsgDataIntoString(sCommClubManager->msgData, strno, sCommClubManager->string[4]);
        StringExpandPlaceholders(sCommClubManager->messageFormat[2], sCommClubManager->string[5], sCommClubManager->string[4]);
    } else {
        ReadMsgDataIntoString(sCommClubManager->msgData, strno, sCommClubManager->string[5]);
    }
    if (WindowIsInUse(&sCommClubManager->windows[2]) == FALSE) {
        sub_0205B514(sCommClubManager->fieldSystem->bgConfig, &sCommClubManager->windows[2], 3);
    }
    sub_0205B564(&sCommClubManager->windows[2], Save_PlayerData_GetOptionsAddr(sCommClubManager->fieldSystem->saveData));
    sCommClubManager->printerID = sub_0205B5B4(&sCommClubManager->windows[2], sCommClubManager->string[5], Save_PlayerData_GetOptionsAddr(sCommClubManager->fieldSystem->saveData), TRUE);
}

static void ov03_02253ED0(ListMenuTemplate listMenuTemplate, u8 x, u8 y, u8 width, u8 height, u16 baseTile) {
    if (WindowIsInUse(&sCommClubManager->windows[0]) == FALSE) {
        AddWindowParameterized(sCommClubManager->fieldSystem->bgConfig, &sCommClubManager->windows[0], 3, x, y, width, height, 13, baseTile);
    }
    DrawFrameAndWindow1(&sCommClubManager->windows[0], TRUE, 985, HEAP_ID_FIELD2);
    ListMenuTemplate temp = listMenuTemplate;
    temp.items = sCommClubManager->items;
    temp.window = &sCommClubManager->windows[0];
    sCommClubManager->listMenu = ListMenuInit(&temp, 0, 0, HEAP_ID_FIELD1);
    CopyWindowToVram(&sCommClubManager->windows[0]);
}

static void ov03_02253F74(FieldSystem *fieldSystem) {
    if (sCommClubManager) {
        GF_AssertFail();
    }
    CommClubManager *commClubManager = Heap_Alloc(HEAP_ID_FIELD1, sizeof(CommClubManager));
    sCommClubManager = commClubManager;
    MI_CpuFill8(commClubManager, 0, sizeof(CommClubManager));
    sCommClubManager->retCode = 0;
    sCommClubManager->fieldSystem = fieldSystem;
    sCommClubManager->unk97 = 0;
    sCommClubManager->msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0182_bin, HEAP_ID_FIELD1);
    sCommClubManager->playerProfile[0] = Save_PlayerData_GetProfile(FieldSystem_GetSaveData(sCommClubManager->fieldSystem));
    sCommClubManager->playerProfile[1] = PlayerProfile_New(HEAP_ID_FIELD1);
    InitWindow(&sCommClubManager->windows[0]);
    InitWindow(&sCommClubManager->windows[1]);
    InitWindow(&sCommClubManager->windows[2]);
    sCommClubManager->messageFormat[0] = MessageFormat_New(HEAP_ID_FIELD1);
    sCommClubManager->messageFormat[1] = MessageFormat_New(HEAP_ID_FIELD1);
    sCommClubManager->messageFormat[2] = MessageFormat_New(HEAP_ID_FIELD1);
    sCommClubManager->unk98 = 0;
    int i;
    for (i = 0; i < 8; i++) {
        sCommClubManager->unk80[i] = 0;
    }
    for (i = 0; i < 8; i++) {
        sCommClubManager->string[i] = String_New(140, HEAP_ID_FIELD1);
    }
}

static void Unk03_Delete() {
    for (int i = 0; i < 8; i++) {
        String_Delete(sCommClubManager->string[i]);
    };

    Heap_Free(sCommClubManager->playerProfile[1]);

    if (sCommClubManager->messageFormat[0]) {
        MessageFormat_Delete(sCommClubManager->messageFormat[0]);
        sCommClubManager->messageFormat[0] = NULL;
    }
    if (sCommClubManager->messageFormat[1]) {
        MessageFormat_Delete(sCommClubManager->messageFormat[1]);
        sCommClubManager->messageFormat[1] = NULL;
    }
    if (sCommClubManager->messageFormat[2]) {
        MessageFormat_Delete(sCommClubManager->messageFormat[2]);
        sCommClubManager->messageFormat[2] = NULL;
    }
    
    DestroyMsgData(sCommClubManager->msgData);

    if (sCommClubManager->windows[2].pixelBuffer) {
        RemoveWindow(&sCommClubManager->windows[2]);
    }
    
    Heap_Free(sCommClubManager);
    sCommClubManager = NULL;
}

static void ov03_022540E8(CommClubManager *commClubManager) {
    sub_02058124(commClubManager->fieldSystem, commClubManager->commType, ov03_02255B98());
}

static void ov03_02254100(struct ListMenu *list_unused, s32 index_unused, u8 onInit) {
    sCommClubManager->unk98 = 1;
    if (onInit == FALSE) {
        PlaySE(SEQ_SE_DP_SELECT);
    }
}

static void ov03_02254120(struct ListMenu *list, s32 index_unused, u8 y_unused) {
    for (u32 i = 0; i < ListMenuGetTemplateField(list, LISTMENUATTR_MAXSHOWED); i++) {
        ov03_02254150(list, 0, i);
    };
}

static void ov03_02254150(ListMenu *list, u16 cursorPos_unused, u8 itemsAbove) {
    s32 res = sub_0203511C();
    u16 cursorPos = 0;
    if (sCommClubManager->listMenu) {
        ListMenuGetScrollAndRow(sCommClubManager->listMenu, &cursorPos, NULL);
    }
    cursorPos += itemsAbove;
    FillWindowPixelRect(&sCommClubManager->windows[0], 15, 8, itemsAbove * 16, (GetWindowWidth(&sCommClubManager->windows[0]) * 8) - 8, 16);
    if (cursorPos < res) {
        sub_020351DC(cursorPos, sCommClubManager->playerProfile[1]);
        BufferIntegerAsString(sCommClubManager->messageFormat[0], 0, cursorPos + 1, 2, PRINTING_MODE_LEADING_ZEROS, TRUE);
        BufferPlayersName(sCommClubManager->messageFormat[0], 1, sCommClubManager->playerProfile[1]);
        ReadMsgDataIntoString(sCommClubManager->msgData, CommunicationClub_Text_00076, sCommClubManager->string[1]); // {STRVAR_1 51, 0, 0}:{STRVAR_1 3, 1, 0}
        StringExpandPlaceholders(sCommClubManager->messageFormat[0], sCommClubManager->string[0], sCommClubManager->string[1]);
        AddTextPrinterParameterized(&sCommClubManager->windows[0], 0, sCommClubManager->string[0], 8, itemsAbove * 16, TEXT_SPEED_NOTRANSFER, NULL);
        BufferIntegerAsString(sCommClubManager->messageFormat[0], 2, PlayerProfile_GetTrainerID(sCommClubManager->playerProfile[1]) % 0x10000, 5, PRINTING_MODE_LEADING_ZEROS, TRUE);
        ReadMsgDataIntoString(sCommClubManager->msgData, CommunicationClub_Text_ID_1, sCommClubManager->string[3]); // ID{STRVAR_1 54, 2, 0}
        StringExpandPlaceholders(sCommClubManager->messageFormat[0], sCommClubManager->string[2], sCommClubManager->string[3]);
        AddTextPrinterParameterized(&sCommClubManager->windows[0], 0, sCommClubManager->string[2], 88, itemsAbove * 16, TEXT_SPEED_NOTRANSFER, NULL);
    } else {
        BufferIntegerAsString(sCommClubManager->messageFormat[0], 0, cursorPos + 1, 2, PRINTING_MODE_LEADING_ZEROS, TRUE);
        ReadMsgDataIntoString(sCommClubManager->msgData, CommunicationClub_Text_00077, sCommClubManager->string[1]); // {STRVAR_1 51, 0, 0}:
        StringExpandPlaceholders(sCommClubManager->messageFormat[0], sCommClubManager->string[0], sCommClubManager->string[1]);
        AddTextPrinterParameterized(&sCommClubManager->windows[0], 0, sCommClubManager->string[0], 8, itemsAbove * 16, TEXT_SPEED_NOTRANSFER, NULL);
    }
}

static void ov03_022542C8(CommClubManager* commClubManager) {
    if (WindowIsInUse(&sCommClubManager->windows[1]) == FALSE) {
        AddWindowParameterized(sCommClubManager->fieldSystem->bgConfig, &sCommClubManager->windows[1], 3, 23, 2, 8, 4, 13, 201);
    }
    DrawFrameAndWindow1(&sCommClubManager->windows[1], TRUE, 985, HEAP_ID_FIELD2);
    FillWindowPixelBuffer(&sCommClubManager->windows[1], 15);
    CopyWindowToVram(&sCommClubManager->windows[1]);
    commClubManager->unk97 = 1;
    SysTask_CreateOnMainQueue(ov03_02254D64, commClubManager, 0);
    ov03_022543AC(sCommClubManager);
    
    u16 sChooseText[NUM_COMM_TYPES] = {
        CommunicationClub_Text_00048_Dummy,
        CommunicationClub_Text_Choose_SingleBattle,    // Choose the Single Battle you would like to join.
        CommunicationClub_Text_Choose_DoubleBattle,    // Choose the Double Battle you would like to join.
        CommunicationClub_Text_Choose_MixBattle,       // Choose the Mix Battle you would like to join.
        CommunicationClub_Text_Choose_MultiBattle,     // Choose the Multi Battle you would like to join.
        CommunicationClub_Text_Choose_MultiBattle,     // Choose the Multi Battle you would like to join.
        CommunicationClub_Text_00056_Dummy,
        CommunicationClub_Text_00057_Dummy,
        CommunicationClub_Text_00058_Dummy, // Unreachable.
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        CommunicationClub_Text_ChooseFriend_BattleTower,  // Choose the friend you want to take to the Battle Tower.
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        CommunicationClub_Text_ChooseFriend_BattleFactory_Lv50,   // Choose the friend to play with at the Battle Factory--Level 50.
        CommunicationClub_Text_ChooseFriend_BattleFactory_Open,   // Choose the friend to play with at the Battle Factory--Open Level.
        0,
        CommunicationClub_Text_ChooseFriend_BattleHall,           // Choose the friend to play with at the Battle Hall.
        CommunicationClub_Text_ChooseFriend_BattleCastle,         // Choose the friend to play with at the Battle Castle.
        CommunicationClub_Text_ChooseFriend_BattleArcade,         // Choose the friend to play with at the Battle Arcade.
        0,
        0,
        0,
        0,
        CommunicationClub_Text_Choose_FlatBattle,     // Choose the Flat Battle you would like to join.
        CommunicationClub_Text_Choose_FlatBattle,     // Choose the Flat Battle you would like to join.
        CommunicationClub_Text_Choose_SafariZoneLink, // Choose the Safari Zone Link you would like to join.
        CommunicationClub_Text_Choose_Pokeathlon      // Unreachable.
    };

    if (sCommClubManager->commType == COMM_TYPE_8) {
        ov03_02253E20(sCommClubManager->unk92 + 122, FALSE);
    } else if (sCommClubManager->commType == COMM_TYPE_POKEATHLON) {
        ov03_02253E20(sCommClubManager->unk92 + CommunicationClub_Text_ChooseLeader_JumpCourse, FALSE);
    } else {
        ov03_02253E20(sChooseText[sCommClubManager->commType], FALSE);
    }
    ov03_02254B4C(&ov03_02254420);
}

static void ov03_022543AC(CommClubManager* commClubManager_unused) {
    BufferPlayersName(sCommClubManager->messageFormat[1], 0, sCommClubManager->playerProfile[0]);
    BufferIntegerAsString(sCommClubManager->messageFormat[1], 1, PlayerProfile_GetTrainerID(sCommClubManager->playerProfile[0]) % 0x10000, 5, PRINTING_MODE_LEADING_ZEROS, TRUE);
    ReadMsgDataIntoString(sCommClubManager->msgData, CommunicationClub_Text_ID_2, sCommClubManager->string[6]); // {STRVAR_1 3, 0, 0}\nID{STRVAR_1 54, 1, 0}
    StringExpandPlaceholders(sCommClubManager->messageFormat[1], sCommClubManager->string[7], sCommClubManager->string[6]);
    AddTextPrinterParameterized(&sCommClubManager->windows[1], 0, sCommClubManager->string[7], 2, 2, 0, NULL);
}

static void ov03_02254420() {
    if (IsPrintFinished(sCommClubManager->printerID)) {
        sCommClubManager->items = ListMenuItems_New(16, HEAP_ID_FIELD1);
        for (int i = 0; i < 16; i++) {
            BufferIntegerAsString(sCommClubManager->messageFormat[0], 0, i + 1, 2, PRINTING_MODE_LEADING_ZEROS, TRUE);
            ReadMsgDataIntoString(sCommClubManager->msgData, CommunicationClub_Text_00077, sCommClubManager->string[1]); // {STRVAR_1 51, 0, 0}:
            StringExpandPlaceholders(sCommClubManager->messageFormat[0], sCommClubManager->string[0], sCommClubManager->string[1]);
            ListMenuItems_AddItem(sCommClubManager->items, sCommClubManager->string[0], 0);
        };
        
        ov03_02253ED0(ov03_02259164, 1, 2, 20, 10, 1);
        
        sCommClubManager->unk9C = &ov03_02259134;
        sCommClubManager->unkA0 = 2;
        sCommClubManager->unkA2 = 0xFFFF;
        sCommClubManager->unkA1 = 0;
        ov01_021F6A9C(sCommClubManager->fieldSystem, 7, &sCommClubManager->unk9C);
        ov03_02254B4C(&ov03_02254500);
    }
}

static void ov03_02254500(void *arg0, CommClubManager *commClubManager) {
    ov03_022543AC(commClubManager);
    if (ov01_021F6B10(commClubManager->fieldSystem) == TRUE) {
        if (sub_02037700()) {
            sCommClubManager->retCode = 3;
            ov03_02254B44();
            ov03_0225574C(arg0, commClubManager);
            return;
        }
        int listInput;
        if (sub_02035184() == 0) {
            listInput = ListMenu_ProcessInput(sCommClubManager->listMenu);
            if (listInput == -1) {
                if (commClubManager->unkA2 == 0) {
                    u16 currentItem;
                    ListMenuGetCurrentItemArrayId(sCommClubManager->listMenu, &currentItem);
                    listInput = currentItem;
                } else if (commClubManager->unkA2 == 1) {
                    listInput = -2;
                }
            }
        } else {
            listInput = -1;
        }
        switch(listInput) {
        case -1:
            ov03_02254600(commClubManager);
            break;
            
        case -2:
            PlaySE(SEQ_SE_DP_SELECT);
            sCommClubManager->retCode = 1;
            ov03_02254B44();
            ov03_0225574C(arg0, commClubManager);
            break;
        default:
            PlaySE(SEQ_SE_DP_SELECT);
            ListMenuGetCurrentItemArrayId(commClubManager->listMenu, &commClubManager->connectionIndex);
            if (sub_0203511C() > commClubManager->connectionIndex) {
                ov03_02254600(commClubManager);
                commClubManager->connectionIndex = sub_02035150(commClubManager->connectionIndex);
                sub_02058164(commClubManager->connectionIndex);
                sub_02037BC8();
                ov03_02254B4C(&ov03_02254660);
            }
        }
    }
}

static void ov03_02254600(CommClubManager *commClubManager_unused) {
    if (sub_02035184() || sCommClubManager->unk98) {
        sCommClubManager->unk98 = 0;
        sub_02035198();
        FillWindowPixelRect(&sCommClubManager->windows[0], 15, 8, 0, 12, 80);
        ov03_02254120(sCommClubManager->listMenu, LISTMENUATTR_MOVECURSORFUNC, 0);
        CopyWindowToVram(&sCommClubManager->windows[0]);
    }
}

static void ov03_02254660(void *arg0, CommClubManager *commClubManager) {
    if (sub_02037700()) {
        ov03_0225574C(arg0, commClubManager);
        ov03_02253E20(0, FALSE);
        ov03_02255ADC(commClubManager);
        sCommClubManager->unkA1 = 1;
    } else {
        if (sub_02034818(sub_0203769C())) {
            sub_02037BC8();
            ov03_022546B0(arg0, commClubManager);
        }
    }
}

static void ov03_022546B0(void *arg0, CommClubManager *commClubManager) {
    if (sub_02037700()) {
        ov03_0225574C(arg0, commClubManager);
        ov03_02253E20(0, FALSE);
        ov03_02255ADC(commClubManager);
        sCommClubManager->unkA1 = 1;
        return;
    }
    sub_020351DC(commClubManager->connectionIndex, sCommClubManager->playerProfile[1]);
    BufferPlayersName(commClubManager->messageFormat[2], 1, sCommClubManager->playerProfile[1]);
    if (ov03_02255B70() <= 2) {
        ov03_02253E20(1, TRUE);
    } else {
        if (IsPrintFinished(sCommClubManager->printerID) == FALSE) {
            RemoveTextPrinter(sCommClubManager->printerID);
        }
        ReadMsgDataIntoString(sCommClubManager->msgData, CommunicationClub_Text_AskingForRegistration, sCommClubManager->string[4]); // Asking {STRVAR_1 3, 1, 0} to do member\nregistration. Please wait.
        StringExpandPlaceholders(sCommClubManager->messageFormat[2], sCommClubManager->string[5], sCommClubManager->string[4]);
        if (WindowIsInUse(&sCommClubManager->windows[2]) == FALSE) {
            sub_0205B514(sCommClubManager->fieldSystem->bgConfig, &sCommClubManager->windows[2], 3);
        }
        sub_0205B564(&sCommClubManager->windows[2], Save_PlayerData_GetOptionsAddr(sCommClubManager->fieldSystem->saveData));
        TextFlags_SetCanABSpeedUpPrint(TRUE);
        TextFlags_SetAutoScrollParam(0);
        TextFlags_SetCanTouchSpeedUpPrint(FALSE);
        sCommClubManager->printerID = AddTextPrinterParameterized(&sCommClubManager->windows[2], 1, sCommClubManager->string[5], 0, 0, 1, NULL);
    }
    sCommClubManager->unkA8 = 0;
    sCommClubManager->unkA1 = 1;
    ov03_02254B4C(&ov03_022548E0);
}

static BOOL ov03_022547D8(void *arg0, CommClubManager *commClubManager) {
    if (sub_02037700()) {
        ov03_0225574C(arg0, commClubManager);
        ov03_02253E20(0, FALSE);
        ov03_02255ADC(commClubManager);
    } else if (sub_02037BA0(0, 3) == sub_0203769C()) {
        sub_02037BC8();
        ov03_0225574C(arg0, commClubManager);
        ov03_02255A70(commClubManager);
    } else if (sub_02037BA0(0, 5) != -1) {
        sub_02037BC8();
        ov03_0225574C(arg0, commClubManager);
        ov03_02255A70(commClubManager);
    } else if (sub_02037BA0(0, 4) == sub_0203769C()) {
        ov03_02253E20(116, FALSE);
        ov03_02254B4C(&ov03_02255280);
    } else if (sub_02037BA0(0, 2) == sub_0203769C()) {
        sub_02037BC8();
        commClubManager->connectedCount = sub_020347A0();
        if (IsPrintFinished(sCommClubManager->printerID) == FALSE) {
            RemoveTextPrinter(sCommClubManager->printerID);
        }
        ov03_0225574C(arg0, commClubManager);
        ov03_02255804(commClubManager);
    } else if (ov03_02255C80()) {
        ov03_0225574C(arg0, commClubManager);
        ov03_02255A70(commClubManager);
    } else {
        return FALSE;
    }
    return TRUE;
}

static void ov03_022548E0(void *arg0, CommClubManager* unk_ovo3) {
    if (IsPrintFinished(sCommClubManager->printerID)) {
        if (unk_ovo3->unkA8 == 0) {
            sCommClubManager->unk9C = &ov03_0225912C;
            sCommClubManager->unkA0 = 1;
            sCommClubManager->unkA2 = 0xFFFF;
            sCommClubManager->unkA1 = 0;
            ov01_021F6A9C(sCommClubManager->fieldSystem, 7, &sCommClubManager->unk9C);
            unk_ovo3->unkA8 = 1;
        }
        else if (ov01_021F6B10(unk_ovo3->fieldSystem) == TRUE) {
            if (ov03_022547D8(arg0, unk_ovo3)) {
                unk_ovo3->unkA1 = 2;
            }
            else if (PAD_BUTTON_B & gSystem.newKeys || unk_ovo3->unkA2 == 0) {
                PlaySE(SEQ_SE_DP_SELECT);
                unk_ovo3->unkA8 = 0;
                ov03_02253E20(3, FALSE);
                ov03_02254B4C(&ov03_0225499C);
            }
        }
    }
}

static void ov03_0225499C(void *arg0, CommClubManager *commClubManager) {
    if (ov03_022547D8(arg0, commClubManager)) {
        commClubManager->unkA1 = 2;
        return;
    }
    if (IsPrintFinished(sCommClubManager->printerID)) {
        ov03_02255C84(commClubManager);
        ov03_02254B4C(&ov03_022549D8);
    }
}

static void ov03_022549D8(void *arg0, CommClubManager *commClubManager) {
    if (commClubManager->unkA8 == 0) {
        if (ov03_02255CA0(commClubManager) == TRUE) {
            commClubManager->unkA8 = 1;
        } else {
            return;
        }
    }
    if (ov03_02255CD0(commClubManager)) {
        if (ov03_022547D8(arg0, commClubManager)) {
            ov03_02255CE4(commClubManager);
        }
        else if (ov01_021F6AEC(commClubManager->fieldSystem) == 6) {
            if (commClubManager->unkA4 == 0) {
                ov03_0225574C(arg0, commClubManager);
                ov03_02253E20(6, FALSE);
                ov03_02255ADC(commClubManager);
            } else if (commClubManager->unkA4 == 1) {
                ov03_02254B4C(&ov03_022546B0);
            }
        }
    }
}

static void ov03_02254A54(ListMenu *listMenu_unused, u16 arg1_unused, u8 arg2) {
    u16 spC = 0;
    if (sCommClubManager->listMenu) {
        ListMenuGetScrollAndRow(sCommClubManager->listMenu, &spC, NULL);
    }
    spC += arg2;
    if (sub_02034818(spC)) {
        BufferPlayersName(sCommClubManager->messageFormat[0], 0, sub_02034818(spC));
        ReadMsgDataIntoString(sCommClubManager->msgData, CommunicationClub_Text_00079, sCommClubManager->string[1]); // {STRVAR_1 3, 0, 0}
        StringExpandPlaceholders(sCommClubManager->messageFormat[0], sCommClubManager->string[0], sCommClubManager->string[1]);
        s32 temp_r4 = arg2 * 16;
        AddTextPrinterParameterized(&sCommClubManager->windows[0], 0, sCommClubManager->string[0], 8, temp_r4, 0, NULL);
        BufferIntegerAsString(sCommClubManager->messageFormat[0], 2, PlayerProfile_GetTrainerID_VisibleHalf(sub_02034818(spC)), 5, PRINTING_MODE_LEADING_ZEROS, TRUE);
        ReadMsgDataIntoString(sCommClubManager->msgData, CommunicationClub_Text_ID_1, sCommClubManager->string[3]); // ID{STRVAR_1 54, 2, 0}
        StringExpandPlaceholders(sCommClubManager->messageFormat[0], sCommClubManager->string[2], sCommClubManager->string[3]);
        AddTextPrinterParameterized(&sCommClubManager->windows[0], 0, sCommClubManager->string[2], 72, temp_r4, 0, NULL);
    }
}

static void ov03_02254B2C(CommClubManager *commClubManager) {
    sub_020580E4(commClubManager->fieldSystem, commClubManager->commType, ov03_02255B98());
}

static void ov03_02254B44() {
    sub_02058284();
}

static void ov03_02254B4C(void* arg0) {
    sCommClubManager->commClubTask = arg0;
}

static void ov03_02254B58(CommClubManager *commClubManager) {
    SysTask_CreateOnMainQueue(&ov03_02254D64, commClubManager, 0);
    ov03_02254BEC();
    if (WindowIsInUse(&sCommClubManager->windows[1]) == FALSE) {
        AddWindowParameterized(sCommClubManager->fieldSystem->bgConfig, &sCommClubManager->windows[1], 3, 22, 2, 9, 4, 13, 205);
    }
    DrawFrameAndWindow1(&sCommClubManager->windows[1], TRUE, 985, 11);
    FillWindowPixelBuffer(&sCommClubManager->windows[1], 15);
    CopyWindowToVram(&sCommClubManager->windows[1]);
    commClubManager->unk97 = 1;
    sub_0203476C(0);
    ov03_02254B4C(&ov03_02254D78);
}

static void ov03_02254BEC() {
    u16 sAwaitingContactText[NUM_COMM_TYPES] = {
        CommunicationClub_Text_00007_Dummy,
        CommunicationClub_Text_AwaitingContact_SingleBattle,    // Single Battle! Awaiting contact from your friend.
        CommunicationClub_Text_AwaitingContact_DoubleBattle,    // Double Battle! Awaiting contact from your friend.
        CommunicationClub_Text_AwaitingContact_MixBattle,       // Mix Battle! Awaiting contact from your friend.
        CommunicationClub_Text_AwaitingContact_MultiBattle,     // Multi Battle! Awaiting contact from your friends.
        CommunicationClub_Text_AwaitingContact_MultiBattle,     // Multi Battle! Awaiting contact from your friends.
        CommunicationClub_Text_ProceedWhenReady,                // When the group is ready: A Button: Proceed   B Button: Cancel
        CommunicationClub_Text_00016_Dummy,
        CommunicationClub_Text_ProceedWhenReady_2,              // When the group is ready: A Button: Proceed   B Button: Cancel
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        CommunicationClub_Text_AwaitingContact_BattleTower,     // Battle Tower! Awaiting contact from your friend.
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        CommunicationClub_Text_AwaitingContact_BattleFactory_Lv50,  // Battle Factory--Level 50! Awaiting contact from your friend.
        CommunicationClub_Text_AwaitingContact_BattleFactory_Open,  // Battle Factory--Open Level! Awaiting contact from your friend.
        0,
        CommunicationClub_Text_AwaitingContact_BattleHall,          // Battle Hall! Awaiting contact from your friend.
        CommunicationClub_Text_AwaitingContact_BattleCastle,        // Battle Castle! Awaiting contact from your friend.
        CommunicationClub_Text_AwaitingContact_BattleArcade,        // Battle Arcade! Awaiting contact from your friend.
        0,
        0,
        0,
        0,
        CommunicationClub_Text_AwaitingContact_FlatBattle,          // Flat Battle! Awaiting contact from your friend.
        CommunicationClub_Text_AwaitingContact_FlatBattle,          // Flat Battle! Awaiting contact from your friend.
        CommunicationClub_Text_AwaitingContact_SafariZoneLink,      // Safari Zone Link! Awaiting contact from your friend.
        0
    };

    if (sCommClubManager->commType >= NUM_COMM_TYPES) {
        GF_AssertFail();
    }

    if (sCommClubManager->commType == 8) {
        if (sub_020347A0() > 1) {
            ov03_02253E20(sCommClubManager->unk92 + 127, FALSE);
        } else {
            ov03_02253E20(sCommClubManager->unk92 + 117, FALSE);
        }
    } else if (sCommClubManager->commType == 40) {
        if (sub_020347A0() > 1) {
            ov03_02253E20(sCommClubManager->unk92 + 154, FALSE);
        } else {
            ov03_02253E20(sCommClubManager->unk92 + 142, FALSE);
        }
    } else {
        ov03_02253E20(sAwaitingContactText[sCommClubManager->commType], FALSE);
    }
}

static void ov03_02254C9C(CommClubManager *commClubManager_unused) {
    s32 num;
    s32 strno;

    if (sub_020347A0() >= ov03_02255B70()) {
        num = sub_020347A0();
        strno = CommunicationClub_Text_NumPlayers; // {STRVAR_1 50, 0, 0} Players
    } else {
        num = ov03_02255B70() - sub_020347A0();
        strno = CommunicationClub_Text_NumNeeded; // {STRVAR_1 50, 0, 0} more needed.
    }
    BufferIntegerAsString(sCommClubManager->messageFormat[1], 0, num, 2, PRINTING_MODE_5_UNUSED, TRUE);
    FillWindowPixelBuffer(&sCommClubManager->windows[1], 15);
    ReadMsgDataIntoString(sCommClubManager->msgData, strno, sCommClubManager->string[7]);
    StringExpandPlaceholders(sCommClubManager->messageFormat[1], sCommClubManager->string[6], sCommClubManager->string[7]);
    AddTextPrinterParameterized(&sCommClubManager->windows[1], 0, sCommClubManager->string[6], 2, 2, 0, NULL);
}

static void ov03_02254D24(u32 arg0, CommClubManager *commClubManager) {
    u16 sContactedText[NUM_COMM_TYPES] = {
        CommunicationClub_Text_00024_Dummy,
        CommunicationClub_Text_Contacted_SingleBattle,    // {STRVAR_1 3, 1, 0} has contacted you. Start a Single Battle?
        CommunicationClub_Text_Contacted_DoubleBattle,    // {STRVAR_1 3, 1, 0} has contacted you. Start a Double Battle?
        CommunicationClub_Text_Contacted_MixBattle,       // {STRVAR_1 3, 1, 0} has contacted you. Start a Mix Battle?
        CommunicationClub_Text_Contacted_MultiBattle,     // {STRVAR_1 3, 1, 0} has contacted you. Let {STRVAR_1 3, 1, 0} join your group?
        CommunicationClub_Text_Contacted_MultiBattle,     // {STRVAR_1 3, 1, 0} has contacted you. Let {STRVAR_1 3, 1, 0} join your group?
        CommunicationClub_Text_00037_Dummy,
        CommunicationClub_Text_Contacted_MultiBattle,     // {STRVAR_1 3, 1, 0} has contacted you. Let {STRVAR_1 3, 1, 0} join your group?
        CommunicationClub_Text_Contacted_MultiBattle,     // {STRVAR_1 3, 1, 0} has contacted you. Let {STRVAR_1 3, 1, 0} join your group?
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        CommunicationClub_Text_Contacted_BattleTower,     // {STRVAR_1 3, 1, 0} has contacted you. Take Battle Tower challenge?
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        CommunicationClub_Text_Contacted_BattleFactory,   // {STRVAR_1 3, 1, 0} has contacted you. Take Battle Factory challenge?
        CommunicationClub_Text_Contacted_BattleFactory,   // {STRVAR_1 3, 1, 0} has contacted you. Take Battle Factory challenge?
        0,
        CommunicationClub_Text_Contacted_BattleHall,      // {STRVAR_1 3, 1, 0} has contacted you. Start the Battle Hall challenge?
        CommunicationClub_Text_Contacted_BattleCastle,    // {STRVAR_1 3, 1, 0} has contacted you. Take Battle Castle challenge?
        CommunicationClub_Text_Contacted_BattleArcade,    // {STRVAR_1 3, 1, 0} has contacted you. Take Battle Arcade challenge?
        0,
        0,
        0,
        0,
        CommunicationClub_Text_Contacted_FlatBattle,      // {STRVAR_1 3, 1, 0} has contacted you. Start a Flat Battle?
        CommunicationClub_Text_Contacted_FlatBattle,      // {STRVAR_1 3, 1, 0} has contacted you. Start a Flat Battle?
        CommunicationClub_Text_Contacted_SafariZoneLink,  // {STRVAR_1 3, 1, 0} has contacted you. Start a Safari Zone Link?
        CommunicationClub_Text_Contacted_Pokeathlon       // {STRVAR_1 3, 1, 0} has contacted you. Let {STRVAR_1 3, 1, 0} join your group?
    };
    
    PlayerProfile *profile = sub_02034818(arg0);
    if (profile) {
        BufferPlayersName(commClubManager->messageFormat[2], 1, profile);
    }
    ov03_02253E20(sContactedText[commClubManager->commType], TRUE);
}

static void ov03_02254D64(SysTask *task, void *arg1) {
    if (sCommClubManager->commClubTask) {
        sCommClubManager->commClubTask(task, arg1);
    }
}

static void ov03_02254D78(s32 arg0_unused, CommClubManager *commClubManager) {
    ov03_02254C9C(commClubManager);
    if (IsPrintFinished(sCommClubManager->printerID)) {
        sCommClubManager->items = ListMenuItems_New(5, HEAP_ID_FIELD1);
        int i;
        for (i = 0; i < 5; i++) {
            ListMenuItems_AppendFromMsgData(sCommClubManager->items, sCommClubManager->msgData, 82, 0);
        }
        sCommClubManager->unk98 = 1;
        for (i = 0; i < 8; i++) {
            sCommClubManager->unk80[i] = 0;
        }

        ov03_02253ED0(ov03_02259144, 1, 2, 17, 12, 1);
        ov03_02254B4C(&ov03_02254E70);
        if (ov03_02255B84() > 2) {
            sCommClubManager->unk9C = &ov03_0225913C;
            sCommClubManager->unkA0 = 2;
        } else {
            sCommClubManager->unk9C = &ov03_02259130;
            sCommClubManager->unkA0 = 1;
        }
        sCommClubManager->unkA2 = 0xFFFF;
        sCommClubManager->unkA1 = 0;
        ov01_021F6A9C(sCommClubManager->fieldSystem, 7, &sCommClubManager->unk9C);
    }
}

static void ov03_02254E70(void *arg0, CommClubManager *commClubManager) {
    if (ov01_021F6B10(commClubManager->fieldSystem) != 1) {
        return;
    }
    
    ov03_02254C9C(commClubManager);
    
    for (int i = 0; i < 8; i++) {
        if (sub_02034714(i) && i != 0) {
            sCommClubManager->unk80[i] = 1;
            sCommClubManager->unk98 = 1;
        } else if (sub_02034818(i) && sCommClubManager->unk80[i] == 0) {
            sCommClubManager->unk80[i] = 1;
            sCommClubManager->unk98 = 1;
        } else if (sub_02034818(i) == 0 && sCommClubManager->unk80[i] != 0) {
            sCommClubManager->unk80[i] = 0;
            sCommClubManager->unk98 = 1;
        }
    };
    
    if (sCommClubManager->unk98) {
        sCommClubManager->unk98 = 0;
        RedrawListMenu(sCommClubManager->listMenu);
        for (u32 i = 0; i < ListMenuGetTemplateField(sCommClubManager->listMenu, LISTMENUATTR_MAXSHOWED); i++) {
            ov03_02254A54(sCommClubManager->listMenu, 0, i);
        };
    }
    
    s32 listState = ListMenu_ProcessInput(commClubManager->listMenu);
    if (sub_02034780() != 0xFF) {
        commClubManager->unk95 = sub_02034780();
        PlaySE(SEQ_SE_DP_PC_LOGIN);
        commClubManager->unkA1 = 1;
        ov03_02254D24(commClubManager->unk95, commClubManager);
        ov03_02254B4C(&ov03_02255714);
        return;
    }
    if (sub_02037700()) {
        ov03_02254B44();
        ov03_0225574C(arg0, commClubManager);
        sCommClubManager->retCode = 3;
        return;
    }
    
    if (listState == LIST_NOTHING_CHOSEN) {
        if (ov03_02255B84() > 2) {
            if (sCommClubManager->unkA2 == 0) {
                listState = LIST_NO_MULTIPLE_SCROLL;
            } else if (sCommClubManager->unkA2 == 1) {
                listState = LIST_CANCEL;
            }
        } else if (sCommClubManager->unkA2 == 0) {
            listState = LIST_CANCEL;
        }
    
    }
    
    switch (listState) {
    case LIST_CANCEL:
        PlaySE(SEQ_SE_DP_SELECT);
        ov03_02254B4C(&ov03_0225558C);
        break;
    default:
        if (ov03_02255B70() <= sub_020347A0()) {
            u16 sConfirmGroupText[NUM_COMM_TYPES] = {
                0,
                0,
                0,
                CommunicationClub_Text_ConfirmGroup_MultiBattle,  // Multi Battle! Is this group OK?
                CommunicationClub_Text_ConfirmGroup_MultiBattle,  // Multi Battle! Is this group OK?
                CommunicationClub_Text_ConfirmGroup_MultiBattle,  // Multi Battle! Is this group OK?
                CommunicationClub_Text_ConfirmGroup,              // Is this group OK?
                CommunicationClub_Text_00040_Dummy,
                CommunicationClub_Text_00041_Dummy,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                CommunicationClub_Text_ConfirmGroup_Pokeathlon // Pokéathlon! Is this group OK?
            };
            PlaySE(SEQ_SE_DP_SELECT);
            commClubManager->connectedCount = sub_020347A0();
            ov03_02253E20(sConfirmGroupText[commClubManager->commType], FALSE);
            ov03_02254B4C(&ov03_022553C8);
        }
        break;
    case LIST_NOTHING_CHOSEN:
        break;
    }
}

static void ov03_02255078(void *arg0, CommClubManager *commClubManager) {
    ov03_02254C9C(commClubManager);
    if (commClubManager->unkA8 == 0) {
        if (ov03_02255CA0(commClubManager) == TRUE) {
            commClubManager->unkA8 = 1;
        } else {
            return;
        }
    }
    
    if (ov03_02255CD0(commClubManager) == FALSE) {
        return;
    }
        int i;
        if (sub_020373B4(commClubManager->unk95) == FALSE) {
            ov03_02255CE4(commClubManager);
            if (commClubManager->commType == COMM_TYPE_8 || commClubManager->commType == COMM_TYPE_POKEATHLON) {
                for (i = 1; i < ov03_02255B84(); i++) {
                    if (sub_020373B4(i)) {
                        sub_020346E8(i);
                        sub_02037B8C(5, i);
                    }
                }
                ov03_02253E20(0, FALSE);
                ov03_02254B4C(&ov03_022552C8);
            } else {
                sub_020346E8(commClubManager->unk95);
                ov03_02253E20(0, FALSE);
                ov03_02254B4C(&ov03_022552C8);
            }
        } else if (sub_02037700() || ov03_02255C80()) {
            ov03_02255CE4(commClubManager);
            sub_020346E8(commClubManager->unk95);
            ov03_02253E20(0, FALSE);
            ov03_02254B4C(&ov03_022552C8);
        } else if (ov01_021F6AEC(commClubManager->fieldSystem) == 6) {
            if (commClubManager->unkA4 == 0) {
            if ((commClubManager->commType == COMM_TYPE_SINGLE_BATTLE || commClubManager->commType == COMM_TYPE_DOUBLE_BATTLE || commClubManager->commType == COMM_TYPE_FLAT_BATTLE_1 || commClubManager->commType == COMM_TYPE_FLAT_BATTLE_2) && sub_020348F0() == 0) {
                ov03_02253E20(116, FALSE);
                ov03_02254B4C(&ov03_02255280);
                sub_02037B8C(4, commClubManager->unk95);
            } else {
                sub_0203476C(commClubManager->unk95);
                sub_02037B8C(2, commClubManager->unk95);
                if (ov03_02255B84() == sub_020347A0()) {
                    commClubManager->connectedCount = sub_020347A0();
                    if (ov03_02255B84() > 2) {
                        ov03_02254B4C(&ov03_02255388);
                    } else {
                        ov03_0225574C(arg0, commClubManager);
                        ov03_022557CC(commClubManager);
                    }
                } else {
                    ov03_02254BEC();
                    ov03_02254B4C(&ov03_0225530C);
                }
            }
        } else if (commClubManager->unkA4 == 1) {
            if (commClubManager->commType == COMM_TYPE_8 || commClubManager->commType == COMM_TYPE_POKEATHLON) {
                for (i = 1; i < ov03_02255B84(); i++) {
                    if (sub_020373B4(i)) {
                        sub_020346E8(i);
                        sub_02037B8C(5, i);
                    }
                }
                ov03_02254BEC();
                ov03_02254B4C(&ov03_0225530C);
            } else {
                sub_020346E8(commClubManager->unk95);
                sub_02037B8C(3, commClubManager->unk95);
                ov03_02254BEC();
                ov03_02254B4C(&ov03_0225530C);
            }
        }
    }
}

static void ov03_02255280(void *arg0, CommClubManager *commClubManager) {
    if (IsPrintFinished(sCommClubManager->printerID) && ((PAD_BUTTON_A | PAD_BUTTON_B) & gSystem.newKeys || System_GetTouchNew() == TRUE)) {
        ov03_0225574C(arg0, commClubManager);
        ov03_02254B44();
        sCommClubManager->retCode = 4;
    }
}

static void ov03_022552C8(void *arg0, CommClubManager *commClubManager) {
    ov03_02254C9C(commClubManager);
    if (IsPrintFinished(sCommClubManager->printerID) && ((PAD_BUTTON_A | PAD_BUTTON_B) & gSystem.newKeys || System_GetTouchNew() == TRUE)) {
        ov03_02254BEC();
        ov03_02254B4C(&ov03_0225530C);
    }
}

static void ov03_0225530C(void *arg0_unused, CommClubManager *commClubManager) {
    ov03_02254C9C(commClubManager);
    if (IsPrintFinished(sCommClubManager->printerID)) {
        ov03_02254B4C(&ov03_02254E70);
        if (ov03_02255B84() > 2) {
            sCommClubManager->unk9C = &ov03_0225913C;
            sCommClubManager->unkA0 = 2;
        } else {
            sCommClubManager->unk9C = &ov03_02259130;
            sCommClubManager->unkA0 = 1;
        }
        sCommClubManager->unkA2 = 0xFFFF;
        sCommClubManager->unkA1 = 0;
        ov01_021F6A9C(sCommClubManager->fieldSystem, 7, &sCommClubManager->unk9C);
    }
}

static void ov03_02255388(void *arg0_unused, CommClubManager *commClubManager) {
    u16 sConfirmGroupText[NUM_COMM_TYPES] = {
        0,
        0,
        0,
        CommunicationClub_Text_ConfirmGroup_MultiBattle,  // Multi Battle! Is this group OK?
        CommunicationClub_Text_ConfirmGroup_MultiBattle,  // Multi Battle! Is this group OK?
        CommunicationClub_Text_ConfirmGroup_MultiBattle,  // Multi Battle! Is this group OK?
        CommunicationClub_Text_ConfirmGroup,              // Is this group OK?
        CommunicationClub_Text_00040_Dummy,
        CommunicationClub_Text_00041_Dummy,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        CommunicationClub_Text_ConfirmGroup_Pokeathlon // Pokéathlon! Is this group OK?
    };
    ov03_02254C9C(commClubManager);
    ov03_02253E20(sConfirmGroupText[commClubManager->commType], FALSE);
    ov03_02254B4C(&ov03_022553C8);
}

static void ov03_022553C8(void *arg0_unused, CommClubManager *commClubManager) {
    ov03_02254C9C(commClubManager);
    sub_02037EC0(0);
    ListMenu_ProcessInput(commClubManager->listMenu);
    if (IsPrintFinished(sCommClubManager->printerID)) {
        ov03_02255C84(commClubManager);
        ov03_02254B4C(&ov03_02255404);
    }
}

static void ov03_02255404(void *arg0, CommClubManager *commClubManager) {
    ov03_02254C9C(commClubManager);
    if (commClubManager->unkA8 == 0) {
        if (ov03_02255CA0(commClubManager) == TRUE) {
            commClubManager->unkA8 = 1;
        } else {
            return;
        }
    }
    
    if (ov03_02255CD0(commClubManager)) {
        if (sub_02037700() || commClubManager->connectedCount != sub_02037454()) {
            ov03_02255CE4(commClubManager);
            ov03_02254B4C(&ov03_022554E0);
        } else {
            if (ov01_021F6AEC(commClubManager->fieldSystem) == 6) {
                if (commClubManager->unkA4 == 0) {
                    if (commClubManager->commType == COMM_TYPE_8 || commClubManager->commType == COMM_TYPE_POKEATHLON) {
                        for (int i = 1; i < sub_02037454(); i++) {
                            if (sub_020373B4(i) == 0) {
                                ov03_02254B4C(&ov03_022554E0);
                                return;
                            }
                        }
                    }
                    sub_02037AC0(10);
                    ov03_02254B4C(&ov03_022556BC);
                } else if (commClubManager->unkA4 == 1) {
                    sub_02037EC0(1);
                    ov03_02254B44();
                    ov03_0225574C(arg0, commClubManager);
                    sCommClubManager->retCode = 1;
                }
            }
        }    
    }
}

static void ov03_022554E0(void *arg0, CommClubManager *commClubManager) {
    u16 sGroupCancelledText[NUM_COMM_TYPES] = {
        0,
        0,
        0,
        0,
        0,
        0,
        CommunicationClub_Text_GroupCancelled, // A member has dropped out. Please repeat the registration process from the beginning.
        CommunicationClub_Text_00066_Dummy,
        CommunicationClub_Text_00067_Dummy,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        CommunicationClub_Text_GroupCancelled_Pokeathlon // A Pokéathlon involving this group will be canceled.
    };

    ov03_0225574C(arg0, commClubManager);
    if (sCommClubManager->commType == COMM_TYPE_8) {
        ov03_02253E20(sCommClubManager->unk92 + 137, FALSE);
    } else {
        ov03_02253E20(sGroupCancelledText[commClubManager->commType], FALSE);
    }
    sub_02058284();
    SysTask_CreateOnMainQueue(&ov03_0225554C, commClubManager, 0);
}

static void ov03_0225554C(SysTask *task, void *commClubManager_unused) {
    if (IsPrintFinished(sCommClubManager->printerID) && ((PAD_BUTTON_A | PAD_BUTTON_B) & gSystem.newKeys || System_GetTouchNew() == TRUE)) {
        sCommClubManager->retCode = 1;
        SysTask_Destroy(task);
    }
}

static void ov03_0225558C(void *arg0, CommClubManager *commClubManager) {
    u16 sCancelGroupText[NUM_COMM_TYPES] = {
        0,
        0,
        0,
        CommunicationClub_Text_CancelGroup_MultiBattle,   // Cancel a Multi Battle involving this group?
        CommunicationClub_Text_CancelGroup_MultiBattle,   // Cancel a Multi Battle involving this group?
        CommunicationClub_Text_CancelGroup_MultiBattle,   // Cancel a Multi Battle involving this group?
        CommunicationClub_Text_00044_Dummy,
        CommunicationClub_Text_00045_Dummy,
        CommunicationClub_Text_00046_Dummy,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        CommunicationClub_Text_CancelGroup_Pokeathlon // Cancel holding a Pokéathlon with this group?
    };
    ov03_02254C9C(commClubManager);
    if (sub_020347A0() > 1) {
        ov03_02253E20(sCancelGroupText[commClubManager->commType], FALSE);
        ov03_02254B4C(&ov03_022555F4);
    } else {
        ov03_02254B44();
        ov03_0225574C(arg0, commClubManager);
        sCommClubManager->retCode = 1;
    }
}

static void ov03_022555F4(void* arg0_unused, CommClubManager* commClubManager) {
    ov03_02254C9C(commClubManager);
    ListMenu_ProcessInput(commClubManager->listMenu);
    if (IsPrintFinished(sCommClubManager->printerID)) {
        ov03_02255C84(commClubManager);
        ov03_02254B4C(&ov03_0225562C);
    }
}

static void ov03_0225562C(void *arg0, CommClubManager *commClubManager) {
    ov03_02254C9C(commClubManager);
    if (commClubManager->unkA8 == 0) {
        if (ov03_02255CA0(commClubManager) == TRUE) {
            commClubManager->unkA8 = 1;
        } else {
            return;
        }
    }
    
    if (ov03_02255CD0(commClubManager)) {
        if (sub_02037700()) {
            ov03_02255CE4(commClubManager);
            ov03_02254BEC();
            ov03_02254B4C(&ov03_0225530C);
        }
        else if (ov01_021F6AEC(commClubManager->fieldSystem) == 6) {
            if (commClubManager->unkA4 == 0) {
                ov03_02254B44();
                ov03_0225574C(arg0, commClubManager);
                sCommClubManager->retCode = 1;
            } else if (commClubManager->unkA4 == 1) {
                ov03_02254BEC();
                ov03_02254B4C(&ov03_0225530C);
            }
        }
    }
}

static void ov03_022556BC(void *arg0, CommClubManager *commClubManager) {
    if (sub_02037700() || commClubManager->connectedCount != sub_02037454()) {
        ov03_02254B4C(&ov03_022554E0);
    } else {
        ov03_02254C9C(commClubManager);
        ListMenu_ProcessInput(commClubManager->listMenu);
        if (sub_02037B38(10) && sub_02037A10()) {
            ov03_0225574C(arg0, commClubManager);
            ov03_02255B44(commClubManager);
        }
    } 
}

static void ov03_02255714(s32 arg0_unused, CommClubManager *commClubManager) {
    ov03_02254C9C(commClubManager);
    ListMenu_ProcessInput(commClubManager->listMenu);
    if (IsPrintFinished(sCommClubManager->printerID)) {
        ov03_02255C84(commClubManager);
        ov03_02254B4C(&ov03_02255078);
    }
}

static void ov03_0225574C(void *task, CommClubManager *commClubManager) {
    FillWindowPixelBuffer(&sCommClubManager->windows[2], 15);
    sub_0200E5D4(&commClubManager->windows[0], FALSE);
    ListMenuItems_Delete(commClubManager->items);
    DestroyListMenu(commClubManager->listMenu, NULL, NULL);
    commClubManager->listMenu = NULL;
    ClearWindowTilemapAndCopyToVram(&commClubManager->windows[0]);
    RemoveWindow(&commClubManager->windows[0]);
    if (commClubManager->unk97) {
        sub_0200E5D4(&sCommClubManager->windows[1], 0);
        ClearWindowTilemapAndCopyToVram(&sCommClubManager->windows[1]);
        RemoveWindow(&sCommClubManager->windows[1]);
        commClubManager->unk97 = 0;
    }
    if (task) {
        SysTask_Destroy(task);
    }
}

static void ov03_022557CC(CommClubManager *commClubManager) {
    BufferPlayersName(commClubManager->messageFormat[2], 1, sub_02034818(1));
    ov03_02253E20(69, TRUE);
    SysTask_CreateOnMainQueue(&ov03_02254D64, commClubManager, 0);
    ov03_02254B4C(&ov03_02255860);
}

static void ov03_02255804(CommClubManager *commClubManager) {
    sub_020351DC(commClubManager->connectionIndex, sCommClubManager->playerProfile[1]);
    BufferPlayersName(commClubManager->messageFormat[2], 1, sCommClubManager->playerProfile[1]);
    ov03_02253E20(4, TRUE);
    commClubManager->connectedCount = sub_02037454();
    SysTask_CreateOnMainQueue(&ov03_02254D64, commClubManager, 0);
    ov03_02254B4C(&ov03_02255860);
    sCommClubManager->messageDelay = 90;
}

static void ov03_02255860(u32 arg0_unused, CommClubManager *commClubManager) {
    if (sub_0203769C() == FALSE && commClubManager->connectedCount != sub_02037454()) {
        ov03_02254B4C(&ov03_02255A00);
    } else if (ov03_02255C80() || sub_02037700()) {
        ov03_02254B4C(&ov03_02255A00);
    } else if (IsPrintFinished(sCommClubManager->printerID)) {
        sub_02037AC0(10);
        ov03_02254B4C(&ov03_022558C4);
    }
}

static void ov03_022558C4(void *task, CommClubManager *commClubManager) {
    if (sub_0203769C() == 0 && commClubManager->connectedCount != sub_02037454()) {
        ov03_02254B4C(&ov03_02255A00);
    }
    else if (ov03_02255C80() || sub_02037700()) {
        ov03_02254B4C(&ov03_02255A00);
        return;
    }
    else if (sub_020373B4(0) == 0) {
        ov03_02254B4C(&ov03_02255A00);
        return;
    }
    else if (sub_02037BA0(0, 5) != -1) {
        ov03_02254B4C(&ov03_02255A00);
        return;
    }
    else if (sub_02037B38(10) && sub_02037A10()) {
        if (IsPrintFinished(sCommClubManager->printerID) == FALSE) {
            RemoveTextPrinter(sCommClubManager->printerID);
        }
        commClubManager->connectedCount = sub_02037454();
        ov03_02255B44(commClubManager);
        SysTask_Destroy(task);
        return;
    }
    
    if (sCommClubManager->messageDelay != 0) {
        sCommClubManager->messageDelay--;
        if (sCommClubManager->messageDelay == 0) {
            u16 sGroupWaitingText[NUM_COMM_TYPES] = {
                0,
                0,
                0,
                CommunicationClub_Text_GroupWaiting_MultiBattle,  // Multi Battle! Waiting for the rest of the group.
                CommunicationClub_Text_GroupWaiting_MultiBattle,  // Multi Battle! Waiting for the rest of the group.
                CommunicationClub_Text_GroupWaiting_MultiBattle,  // Multi Battle! Waiting for the rest of the group.
                CommunicationClub_Text_GroupWaiting,              // Waiting for the rest of the group.
                CommunicationClub_Text_00072_Dummy,
                CommunicationClub_Text_00073_Dummy,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                0,
                CommunicationClub_Text_GroupWaiting_Pokeathlon // Pokéathlon! Waiting for the rest of the group.
            };
            if (sCommClubManager->commType == COMM_TYPE_8) {
                ov03_02253E20(sCommClubManager->unk92 + 132, FALSE);
            } else if (sCommClubManager->commType == COMM_TYPE_POKEATHLON) {
                ov03_02253E20(sCommClubManager->unk92 + 160, FALSE);
            } else {
                ov03_02253E20(sGroupWaitingText[commClubManager->commType], FALSE);
            }
        }
    }
}

static void ov03_02255A00() {
    if (IsPrintFinished(sCommClubManager->printerID)) {
        ov03_02253E20(0, FALSE);
        ov03_02254B4C(&ov03_02255A2C);
    }
}

static void ov03_02255A2C(SysTask *task) {
    if (IsPrintFinished(sCommClubManager->printerID) && ((PAD_BUTTON_A | PAD_BUTTON_B) & gSystem.newKeys || System_GetTouchNew() == TRUE)) {
        SysTask_Destroy(task);
        ov03_02254B44();
        sCommClubManager->retCode = 1;
    }
}

static void ov03_02255A70(CommClubManager *commClubManager) {
    sub_020351DC(commClubManager->connectionIndex, sCommClubManager->playerProfile[1]);
    BufferPlayersName(commClubManager->messageFormat[2], 1, sCommClubManager->playerProfile[1]);
    ov03_02253E20(5, TRUE);
    sub_02058180();
    SysTask_CreateOnMainQueue(&ov03_02255AB0, commClubManager, 0);
}

static void ov03_02255AB0(SysTask *task, void *commClubManager) {
    if (IsPrintFinished(sCommClubManager->printerID)) {
        sub_02058180();
        ov03_022542C8(commClubManager);
        SysTask_Destroy(task);
    }
}

static void ov03_02255ADC(void *commClubManager) {
    sub_02058180();
    for (int i = 0; i < 8; i++) {
        sub_020346E8(i);
    }
    SysTask_CreateOnMainQueue(&ov03_02255B04, commClubManager, 0);
}

static void ov03_02255B04(SysTask *task, void *commClubManager) {
    if (IsPrintFinished(sCommClubManager->printerID) && ((PAD_BUTTON_A | PAD_BUTTON_B) & gSystem.newKeys || System_GetTouchNew() == TRUE)) {
        ov03_022542C8(commClubManager);
        SysTask_Destroy(task);
    }
}

static void ov03_02255B44(CommClubManager *commClubManager_unused) {
    sub_02037EC0(0);
    sCommClubManager->retCode = 2;
    sub_020398D4(1, 1);
    sub_02034434();
    sub_020356C0(1);
}

static int ov03_02255B70() {
    return sub_0203775C(sCommClubManager->commType);
}

static int ov03_02255B84() {
    return sub_0203774C(sCommClubManager->commType);
}

static int ov03_02255B98() {
    return sCommClubManager->unk92 + (sCommClubManager->unk93 * 16);
}

void ov03_02255BB0(FieldSystem *fieldSystem, u32 commType, u16 arg2, u16 arg3) {
    ov03_02253F74(fieldSystem);
    sCommClubManager->commType = commType;
    if (commType - 3 <= 1) {
        fieldSystem->linkBattleRuleset = NULL;
    }
    sCommClubManager->unk92 = arg2;
    sCommClubManager->unk93 = arg3;
    ov03_022540E8(sCommClubManager);
}

void ov03_02255BEC() {
    ov03_022542C8(sCommClubManager);
}

u32 ov03_02255BFC() {
    u32 retCode = sCommClubManager->retCode; // Needs to be reserved as the pointer will be null after the next line.
    if (retCode) {
        Unk03_Delete();
    }
    return retCode;
}

void ov03_02255C18(FieldSystem *fieldSystem, u32 commType, u16 arg2, u16 arg3) {
    ov03_02253F74(fieldSystem);
    sCommClubManager->commType = commType;
    if (commType - 3 <= 1) {
        fieldSystem->linkBattleRuleset = NULL;
    }
    sCommClubManager->unk92 = arg2;
    sCommClubManager->unk93 = arg3;
    ov03_02254B2C(sCommClubManager);
}

void ov03_02255C54() {
    ov03_02254B58(sCommClubManager);
}

u32 ov03_02255C64() {
    u32 retCode = sCommClubManager->retCode;
    if (retCode) {
        Unk03_Delete();
    }
    return retCode;
}

static BOOL ov03_02255C80() {
    return FALSE;
}

static void ov03_02255C84(CommClubManager *commClubManager) {
    ov01_021F6A9C(commClubManager->fieldSystem, 3, NULL);
    commClubManager->unkA8 = 0;
    commClubManager->unkA4 = 0;
}

static BOOL ov03_02255CA0(CommClubManager *commClubManager) {
    int unkInt = ov01_021F6B00(commClubManager->fieldSystem);
    BOOL unkBool = ov01_021F6B10(commClubManager->fieldSystem);
    if (unkInt == 3 && unkBool == TRUE) {
        ov01_021F6ABC(commClubManager->fieldSystem, 3, 3, &commClubManager->unkA4);
        return TRUE;
    }
    return FALSE;
}

static BOOL ov03_02255CD0(CommClubManager *commClubManager) {
    return ov01_021F6AEC(commClubManager->fieldSystem) >= 4;
}

static void ov03_02255CE4(CommClubManager *commClubManager) {
    ov01_021F6ABC(commClubManager->fieldSystem, 3, 11, &commClubManager->unkA4);
}
