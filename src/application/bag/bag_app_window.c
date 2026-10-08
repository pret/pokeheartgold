#include "application/bag_app_internal.h"
#include "graphic/bag/bag_graphics.naix"
#include "msgdata/msg.naix"
#include "msgdata/msg/msg_0010.h"
#include "msgdata/msg/msg_0225.h"

#include "bag.h"
#include "font.h"
#include "move.h"
#include "render_text.h"
#include "render_window.h"
#include "text.h"
#include "unk_02005D10.h"
#include "unk_0200CE7C.h"

static void BagApp_AddItemNameWindows(BagAppData *appData);
static void BagApp_RemoveItemNameWindows(BagAppData *appData);
static void BagApp_RemoveContextMenuWindowsInternal(BagAppData *appData);
static void BagApp_ShowContextMenuWindows(BagAppData *appData);
static void BagApp_BufferItemName(BagAppData *appData, int itemSlot, u16 fieldno);
static void BagApp_BufferItemNamePlural(BagAppData *appData, int itemSlot, u16 fieldno);
static void BagApp_PrintItemDescriptionOnWindowMain0(BagAppData *appData, u16 itemId);
static void BagApp_PrintTMHMDetails(BagAppData *appData, u16 itemId);
static void BagApp_FormatTMQuantityString_DPPt(BagAppData *appData, u16 quantity, u16 y, u32 textColor);
static void BagApp_PrintTMorHMNumberOnWindow(BagAppData *appData, Window *window, ItemSlot *slot, u32 y);
static void *BagApp_GetHMAndRegisteredIconNCGR(BagAppData *appData, NNSG2dCharacterData **ppCharData);
static void BagApp_DrawHMIconOnWindow(BagAppData *appData, Window *window, int y);
static void BagApp_DrawRegisteredItemIconOnWindow(BagAppData *appData, Window *window, int y, int whichItem);
static int BagApp_PrintMessageCallback(TextPrinterTemplate *printer, u16 cmd);
static int BagViewPocket_GetIndexWithAtMostXNonEmptySlots(BagViewPocket *pocket, int pocketId, int limit);
static void BagApp_PrintItemNameAndMaybeQuantityOnWindow(BagAppData *appData, Window *window, String *string, BagViewPocket *pocket, int slotId);
static void PrintItemQuantityOnWindow(MessageFormat *msgFormat, MsgData *msgData, Window *window, u16 quantity);

static const u8 sPocketSizes[] = {
    NUM_BAG_ITEMS,
    NUM_BAG_MEDICINE,
    NUM_BAG_BALLS,
    NUM_BAG_TMS_HMS,
    NUM_BAG_BERRIES,
    NUM_BAG_MAIL,
    NUM_BAG_BATTLE_ITEMS,
    NUM_BAG_KEY_ITEMS,
};

void BagApp_CreateMainWindows(BagAppData *appData) {
    AddWindowParameterized(appData->bgConfig, &appData->windows_main[BAG_APP_WINDOW_MAIN_DESCRIPTION], GF_BG_LYR_MAIN_1, 0, 18, 32, 6, 4, 0x001);
    AddWindowParameterized(appData->bgConfig, &appData->windows_main[BAG_APP_WINDOW_MAIN_TMHM_DETAILS], GF_BG_LYR_MAIN_1, 0, 13, 32, 4, 4, 0x0C1);
    AddWindowParameterized(appData->bgConfig, &appData->windows_main[BAG_APP_WINDOW_MAIN_ITEM_ACTION], GF_BG_LYR_SUB_0, 2, 1, 27, 2, 11, 0x001);
    AddWindowParameterized(appData->bgConfig, &appData->windows_main[BAG_APP_WINDOW_MAIN_MESSAGE], GF_BG_LYR_SUB_0, 2, 1, 27, 4, 11, 0x053);
    AddWindowParameterized(appData->bgConfig, &appData->windows_main[BAG_APP_WINDOW_MAIN_4], GF_BG_LYR_MAIN_1, 19, 13, 12, 4, 4, 0x0DB);
    AddWindowParameterized(appData->bgConfig, &appData->windows_main[BAG_APP_WINDOW_MAIN_POFFIN_COUNT], GF_BG_LYR_MAIN_1, 1, 12, 11, 4, 4, 0x12B);
    AddWindowParameterized(appData->bgConfig, &appData->windows_main[BAG_APP_WINDOW_MAIN_PAGE_COUNTER], GF_BG_LYR_SUB_0, 10, 21, 7, 2, 11, 0x037);
    FillWindowPixelBuffer(&appData->windows_main[BAG_APP_WINDOW_MAIN_PAGE_COUNTER], 0);
    AddWindowParameterized(appData->bgConfig, &appData->windows_main[BAG_APP_WINDOW_MAIN_CANCEL_BUTTON], GF_BG_LYR_SUB_0, 24, 21, 7, 2, 11, 0x045);
    FillWindowPixelBuffer(&appData->windows_main[BAG_APP_WINDOW_MAIN_CANCEL_BUTTON], 0);
    for (int i = 0; i < 24; ++i) {
        appData->windows_sub[i].bgConfig = NULL;
    }
}

void BagApp_RemoveWindows(BagAppData *appData) {
    for (u16 i = 0; i < 8; ++i) {
        RemoveWindow(&appData->windows_main[i]);
    }
    BagApp_RemoveContextMenuWindowsInternal(appData);
    BagApp_RemoveItemNameWindows(appData);
}

static const int sItemNameWindowParam[12][3] = {
    { 4,  5,  0x0BF },
    { 20, 5,  0x0EB },
    { 4,  10, 0x117 },
    { 20, 10, 0x143 },
    { 4,  15, 0x16F },
    { 20, 15, 0x19B },
    { 4,  5,  0x1C7 },
    { 20, 5,  0x1F3 },
    { 4,  10, 0x21F },
    { 20, 10, 0x24B },
    { 4,  15, 0x277 },
    { 20, 15, 0x2A3 },
};

static void BagApp_AddItemNameWindows(BagAppData *appData) {
    if (appData->windows_sub[BAG_APP_WINDOW_SUB_ITEM_NAME_A_1].bgConfig == NULL) {
        for (int i = 0; i < 12; ++i) {
            AddWindowParameterized(appData->bgConfig, &appData->windows_sub[BAG_APP_WINDOW_SUB_ITEM_NAME_A_1 + i], GF_BG_LYR_SUB_0, sItemNameWindowParam[i][0], sItemNameWindowParam[i][1], 11, 4, 11, sItemNameWindowParam[i][2]);
        }
    }
}

static void BagApp_RemoveItemNameWindows(BagAppData *appData) {
    if (appData->windows_sub[BAG_APP_WINDOW_SUB_ITEM_NAME_A_1].bgConfig != NULL) {
        for (int i = 0; i < 12; ++i) {
            ClearWindowTilemapAndScheduleTransfer(&appData->windows_sub[BAG_APP_WINDOW_SUB_ITEM_NAME_A_1 + i]);
            RemoveWindow(&appData->windows_sub[BAG_APP_WINDOW_SUB_ITEM_NAME_A_1 + i]);
            appData->windows_sub[BAG_APP_WINDOW_SUB_ITEM_NAME_A_1 + i].bgConfig = NULL;
        }
    }
}

static const int sContextMenuOptionCoords[4][2] = {
    { 1,  17 },
    { 13, 17 },
    { 1,  21 },
    { 13, 21 },
};

static const int sSelectQuantityWindowCoords[3][2] = {
    { 16, 14 },
    { 20, 14 },
    { 24, 14 },
};

static void BagApp_ShowContextMenuWindows(BagAppData *appData) {
    if (appData->windows_sub[BAG_APP_WINDOW_SUB_CONTEXT_SELECTED_ITEM].bgConfig == NULL) {
        AddWindowParameterized(appData->bgConfig, &appData->windows_sub[BAG_APP_WINDOW_SUB_CONTEXT_SELECTED_ITEM], GF_BG_LYR_SUB_0, 12, 7, 11, 4, 11, 0x2CF);
        FillWindowPixelBuffer(&appData->windows_sub[BAG_APP_WINDOW_SUB_CONTEXT_SELECTED_ITEM], 0);
        for (int i = 0; i < 4; ++i) {
            AddWindowParameterized(appData->bgConfig, &appData->windows_sub[BAG_APP_WINDOW_SUB_CONTEXT_OPTION_1 + i], GF_BG_LYR_SUB_0, sContextMenuOptionCoords[i][0], sContextMenuOptionCoords[i][1], 10, 2, 11, 0x31B + 20 * i);
            FillWindowPixelBuffer(&appData->windows_sub[BAG_APP_WINDOW_SUB_CONTEXT_OPTION_1 + i], 0);
        }
        for (int i = 0; i < 3; ++i) {
            AddWindowParameterized(appData->bgConfig, &appData->windows_sub[BAG_APP_WINDOW_SUB_QUANTITY_DIGIT_1 + i], GF_BG_LYR_SUB_0, sSelectQuantityWindowCoords[i][0], sSelectQuantityWindowCoords[i][1], 2, 3, 11, 0x2FB + 6 * i);
            FillWindowPixelBuffer(&appData->windows_sub[BAG_APP_WINDOW_SUB_QUANTITY_DIGIT_1 + i], 0);
        }
        AddWindowParameterized(appData->bgConfig, &appData->windows_sub[BAG_APP_WINDOW_SUB_SELL_OR_TRASH_BUTTON], GF_BG_LYR_SUB_0, 14, 21, 7, 2, 11, 0x30D);
        FillWindowPixelBuffer(&appData->windows_sub[BAG_APP_WINDOW_SUB_SELL_OR_TRASH_BUTTON], 0);
        AddWindowParameterized(appData->bgConfig, &appData->windows_sub[BAG_APP_WINDOW_SUB_MESSAGE], GF_BG_LYR_SUB_0, 11, 1, 18, 4, 11, 0x31B);
        FillWindowPixelBuffer(&appData->windows_sub[BAG_APP_WINDOW_SUB_MESSAGE], 0);
        AddWindowParameterized(appData->bgConfig, &appData->windows_sub[BAG_APP_WINDOW_SUB_MONEY], GF_BG_LYR_SUB_0, 0, 0, 9, 4, 11, 0x363);
        FillWindowPixelBuffer(&appData->windows_sub[BAG_APP_WINDOW_SUB_MONEY], 0);
        AddWindowParameterized(appData->bgConfig, &appData->windows_sub[BAG_APP_WINDOW_SUB_SELL_MONEY], GF_BG_LYR_SUB_0, 24, 14, 8, 3, 11, 0x387);
        FillWindowPixelBuffer(&appData->windows_sub[BAG_APP_WINDOW_SUB_SELL_MONEY], 0);
    }
}

static void BagApp_RemoveContextMenuWindowsInternal(BagAppData *appData) {
    int i; // forward decl is required to match

    if (appData->windows_sub[BAG_APP_WINDOW_SUB_CONTEXT_SELECTED_ITEM].bgConfig != NULL) {
        for (i = 0; i < 3; ++i) {
            ClearWindowTilemapAndScheduleTransfer(&appData->windows_sub[BAG_APP_WINDOW_SUB_QUANTITY_DIGIT_1 + i]);
            RemoveWindow(&appData->windows_sub[BAG_APP_WINDOW_SUB_QUANTITY_DIGIT_1 + i]);
            appData->windows_sub[BAG_APP_WINDOW_SUB_QUANTITY_DIGIT_1 + i].bgConfig = NULL;
        }
        ClearWindowTilemapAndScheduleTransfer(&appData->windows_sub[BAG_APP_WINDOW_SUB_SELL_MONEY]);
        RemoveWindow(&appData->windows_sub[BAG_APP_WINDOW_SUB_SELL_MONEY]);
        appData->windows_sub[BAG_APP_WINDOW_SUB_SELL_MONEY].bgConfig = NULL;

        RemoveWindow(&appData->windows_sub[BAG_APP_WINDOW_SUB_MONEY]);
        appData->windows_sub[BAG_APP_WINDOW_SUB_MONEY].bgConfig = NULL;

        RemoveWindow(&appData->windows_sub[BAG_APP_WINDOW_SUB_MESSAGE]);
        appData->windows_sub[BAG_APP_WINDOW_SUB_MESSAGE].bgConfig = NULL;

        ClearWindowTilemapAndScheduleTransfer(&appData->windows_sub[BAG_APP_WINDOW_SUB_SELL_OR_TRASH_BUTTON]);
        RemoveWindow(&appData->windows_sub[BAG_APP_WINDOW_SUB_SELL_OR_TRASH_BUTTON]);
        appData->windows_sub[BAG_APP_WINDOW_SUB_SELL_OR_TRASH_BUTTON].bgConfig = NULL;

        for (i = 0; i < 4; ++i) {
            ClearWindowTilemapAndScheduleTransfer(&appData->windows_sub[BAG_APP_WINDOW_SUB_CONTEXT_OPTION_1 + i]);
            RemoveWindow(&appData->windows_sub[BAG_APP_WINDOW_SUB_CONTEXT_OPTION_1 + i]);
            appData->windows_sub[BAG_APP_WINDOW_SUB_CONTEXT_OPTION_1 + i].bgConfig = NULL;
        }
        ClearWindowTilemapAndScheduleTransfer(&appData->windows_sub[BAG_APP_WINDOW_SUB_CONTEXT_SELECTED_ITEM]);
        RemoveWindow(&appData->windows_sub[BAG_APP_WINDOW_SUB_CONTEXT_SELECTED_ITEM]);
        appData->windows_sub[BAG_APP_WINDOW_SUB_CONTEXT_SELECTED_ITEM].bgConfig = NULL;
    }
}

void BagApp_LoadPocketNames(BagAppData *appData) {
    MsgData *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, msg_0225, HEAP_ID_BAG);
    for (u16 i = 0; i < 8; ++i) {
        appData->pocketNameStrings[i] = NewString_ReadMsgData(msgData, msg_0225_00000 + i);
    }
    DestroyMsgData(msgData);
}

void BagApp_DeletePocketNames(BagAppData *appData) {
    for (u16 i = 0; i < 8; ++i) {
        String_Delete(appData->pocketNameStrings[i]);
    }
}

void BagApp_ClearPocketNameBox(BagAppData *appData) {
    for (u16 i = 0; i < 12; ++i) {
        FillBgTilemapRect(appData->bgConfig, GF_BG_LYR_MAIN_3, 0x0CD + i, i, 13, 1, 1, 4);
        FillBgTilemapRect(appData->bgConfig, GF_BG_LYR_MAIN_3, 0x0F1 + i, i, 14, 1, 1, 4);
    }
}

static void BagApp_BufferItemName(BagAppData *appData, int itemSlot, u16 fieldno) {
    BufferItemName(appData->msgFormat, fieldno, BagApp_FetchItemIdOrQuantity(appData, itemSlot, FALSE));
}

static void BagApp_BufferItemNamePlural(BagAppData *appData, int itemSlot, u16 fieldno) {
    BufferItemNamePlural(appData->msgFormat, fieldno, BagApp_FetchItemIdOrQuantity(appData, itemSlot, FALSE));
}

static void BagApp_PrintItemDescriptionOnWindowMain0(BagAppData *appData, u16 itemId) {
    String *string;
    if (itemId != 0xFFFF) {
        string = String_New(130, HEAP_ID_BAG);
        GetItemDescIntoString(string, itemId, HEAP_ID_BAG);
    } else {
        string = NewString_ReadMsgData(appData->msgData, msg_0010_00097);
    }
    AddTextPrinterParameterizedWithColor(&appData->windows_main[BAG_APP_WINDOW_MAIN_DESCRIPTION], 0, string, 20, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(15, 14, 0), NULL);
    String_Delete(string);
}

static void BagApp_PrintTMHMDetails(BagAppData *appData, u16 itemId) {
    Window *window = &appData->windows_main[BAG_APP_WINDOW_MAIN_TMHM_DETAILS];
    u16 moveId = TMHMGetMove(itemId);
    String *string;
    u16 attr;

    // TYPE
    string = NewString_ReadMsgData(appData->msgData, msg_0010_00101);
    AddTextPrinterParameterizedWithColor(window, 0, string, 0, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(15, 14, 0), NULL);
    String_Delete(string);

    // PP
    string = NewString_ReadMsgData(appData->msgData, msg_0010_00089);
    AddTextPrinterParameterizedWithColor(window, 0, string, 0, 16, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(15, 14, 0), NULL);
    String_Delete(string);

    // CATEGORY
    string = NewString_ReadMsgData(appData->msgData, msg_0010_00092);
    AddTextPrinterParameterizedWithColor(window, 0, string, 72, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(15, 14, 0), NULL);
    String_Delete(string);

    // POWER
    string = NewString_ReadMsgData(appData->msgData, msg_0010_00090);
    AddTextPrinterParameterizedWithColor(window, 0, string, 168, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(15, 14, 0), NULL);
    String_Delete(string);

    // ACCURACY
    string = NewString_ReadMsgData(appData->msgData, msg_0010_00091);
    AddTextPrinterParameterizedWithColor(window, 0, string, 168, 16, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(15, 14, 0), NULL);
    String_Delete(string);

    attr = GetMoveMaxPP(moveId, 0);
    string = NewString_ReadMsgData(appData->msgData, msg_0010_00093);
    BufferIntegerAsString(appData->msgFormat, 0, attr, 2, PRINTING_MODE_RIGHT_ALIGN, TRUE);
    StringExpandPlaceholders(appData->msgFormat, appData->formattedStrbuf, string);
    String_Delete(string);
    AddTextPrinterParameterizedWithColor(window, 0, appData->formattedStrbuf, 48, 16, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(15, 14, 0), NULL);

    attr = GetMoveAttr(moveId, MOVEATTR_POWER);
    if (attr <= 1) {
        string = NewString_ReadMsgData(appData->msgData, msg_0010_00025);
    } else {
        string = NewString_ReadMsgData(appData->msgData, msg_0010_00094);
    }
    BufferIntegerAsString(appData->msgFormat, 0, attr, 3, PRINTING_MODE_LEFT_ALIGN, TRUE);
    StringExpandPlaceholders(appData->msgFormat, appData->formattedStrbuf, string);
    String_Delete(string);
    AddTextPrinterParameterizedWithColor(window, 0, appData->formattedStrbuf, 232, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(15, 14, 0), NULL);

    attr = GetMoveAttr(moveId, MOVEATTR_ACCURACY);
    if (attr == 0) {
        string = NewString_ReadMsgData(appData->msgData, msg_0010_00025);
    } else {
        string = NewString_ReadMsgData(appData->msgData, msg_0010_00094);
    }
    BufferIntegerAsString(appData->msgFormat, 0, attr, 3, PRINTING_MODE_LEFT_ALIGN, TRUE);
    StringExpandPlaceholders(appData->msgFormat, appData->formattedStrbuf, string);
    String_Delete(string);
    AddTextPrinterParameterizedWithColor(window, 0, appData->formattedStrbuf, 232, 16, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(15, 14, 0), NULL);

    ScheduleWindowCopyToVram(window);
}

void BagApp_ClearTMHMDetailsWindow(BagAppData *appData) {
    ClearWindowTilemapAndScheduleTransfer(&appData->windows_main[BAG_APP_WINDOW_MAIN_TMHM_DETAILS]);
}

void BagApp_LoadItemCountStrings_DPPt(BagAppData *appData) {
    appData->unk_5E8 = NewString_ReadMsgData(appData->msgData, msg_0010_00039);
    appData->tmCountString_DPPt = NewString_ReadMsgData(appData->msgData, msg_0010_00038);
}

void BagApp_DeleteItemCountStrings_DPPt(BagAppData *appData) {
    String_Delete(appData->unk_5E8);
    String_Delete(appData->tmCountString_DPPt);
}

static void BagApp_FormatTMQuantityString_DPPt(BagAppData *appData, u16 quantity, u16 y, u32 textColor) {
    String *string = String_New(10, HEAP_ID_BAG);
    BufferIntegerAsString(appData->msgFormat, 0, quantity, 3, PRINTING_MODE_LEFT_ALIGN, TRUE);
    StringExpandPlaceholders(appData->msgFormat, string, appData->tmCountString_DPPt);
    u32 result = FontID_String_GetWidth(0, string, 0);
    String_Delete(string);
}

static void BagApp_PrintTMorHMNumberOnWindow(BagAppData *appData, Window *window, ItemSlot *slot, u32 y) {
    u16 itemId = slot->id;
    if (itemId < ITEM_HM01) {
        itemId = itemId - ITEM_TM01 + 1;
        FontSpecialChars_DrawPartyScreenText(appData->msgPrinter, 2, itemId, 2, PRINTING_MODE_LEADING_ZEROS, window, 0, y + 5);
        BagApp_FormatTMQuantityString_DPPt(appData, slot->quantity, y, MAKE_TEXT_COLOR(1, 2, 0));
    } else {
        itemId = itemId - ITEM_HM01 + 1;
        PrintUIntOnWindow(appData->msgPrinter, itemId, 2, PRINTING_MODE_RIGHT_ALIGN, window, 16, y + 5);
        BagApp_DrawHMIconOnWindow(appData, window, 16);
    }
}

static void *BagApp_GetHMAndRegisteredIconNCGR(BagAppData *appData, NNSG2dCharacterData **ppCharData) {
    void *pNcgrFile = NARC_AllocAndReadWholeMember(appData->graphicsNarc, bag_graphics_00037_NCGR, HEAP_ID_BAG);
    NNS_G2dGetUnpackedBGCharacterData(pNcgrFile, ppCharData);
    return pNcgrFile;
}

static void BagApp_DrawHMIconOnWindow(BagAppData *appData, Window *window, int y) {
    NNSG2dCharacterData *pCharData;
    void *pNcgrFile = BagApp_GetHMAndRegisteredIconNCGR(appData, &pCharData);
    BlitBitmapRectToWindow(window, pCharData->pRawData, 0, 0, 104, 16, 0, y, 24, 16);
    Heap_FreeExplicit(HEAP_ID_BAG, pNcgrFile);
}

static void BagApp_DrawRegisteredItemIconOnWindow(BagAppData *appData, Window *window, int y, int whichItem) {
    NNSG2dCharacterData *pCharData;
    void *pNcgrFile = BagApp_GetHMAndRegisteredIconNCGR(appData, &pCharData);
    if (whichItem == 0) {
        BlitBitmapRectToWindow(window, pCharData->pRawData, 24, 0, 104, 16, 0, y, 40, 16);
    } else {
        BlitBitmapRectToWindow(window, pCharData->pRawData, 64, 0, 104, 16, 0, y, 40, 16);
    }
    Heap_FreeExplicit(HEAP_ID_BAG, pNcgrFile);
}

void BagApp_LoadContextMenuStrings(BagAppData *appData) {
    // USE
    appData->contextMenuStrings[BAG_ITEM_CONTEXT_MENU_ACTION_USE] = NewString_ReadMsgData(appData->msgData, msg_0010_00000);
    // WALK
    appData->contextMenuStrings[BAG_ITEM_CONTEXT_MENU_ACTION_WALK] = NewString_ReadMsgData(appData->msgData, msg_0010_00006);
    // CHECK
    appData->contextMenuStrings[BAG_ITEM_CONTEXT_MENU_ACTION_CHECK] = NewString_ReadMsgData(appData->msgData, msg_0010_00016);
    // (japan only)
    appData->contextMenuStrings[BAG_ITEM_CONTEXT_MENU_ACTION_PLANT] = NewString_ReadMsgData(appData->msgData, msg_0010_00098);
    // (japan only)
    appData->contextMenuStrings[BAG_ITEM_CONTEXT_MENU_ACTION_POFFIN_CASE_OPEN] = NewString_ReadMsgData(appData->msgData, msg_0010_00099);
    // TRASH
    appData->contextMenuStrings[BAG_ITEM_CONTEXT_MENU_ACTION_TRASH] = NewString_ReadMsgData(appData->msgData, msg_0010_00001);
    // REGISTER
    appData->contextMenuStrings[BAG_ITEM_CONTEXT_MENU_ACTION_REGISTER] = NewString_ReadMsgData(appData->msgData, msg_0010_00002);
    // DESELECT
    appData->contextMenuStrings[BAG_ITEM_CONTEXT_MENU_ACTION_DESELECT] = NewString_ReadMsgData(appData->msgData, msg_0010_00018);
    // GIVE
    appData->contextMenuStrings[BAG_ITEM_CONTEXT_MENU_ACTION_GIVE] = NewString_ReadMsgData(appData->msgData, msg_0010_00003);
    // (japan only)
    appData->contextMenuStrings[BAG_ITEM_CONTEXT_MENU_ACTION_9] = NewString_ReadMsgData(appData->msgData, msg_0010_00004);
    // CONFIRM
    appData->contextMenuStrings[BAG_ITEM_CONTEXT_MENU_ACTION_CONFIRM] = NewString_ReadMsgData(appData->msgData, msg_0010_00005);
    // CANCEL
    appData->contextMenuStrings[BAG_ITEM_CONTEXT_MENU_ACTION_CANCEL] = NewString_ReadMsgData(appData->msgData, msg_0010_00008);
    // MOVE
    appData->contextMenuStrings[BAG_ITEM_CONTEXT_MENU_ACTION_MOVE] = NewString_ReadMsgData(appData->msgData, msg_0010_00075);
    // SELL
    appData->contextMenuStrings[BAG_ITEM_CONTEXT_MENU_ACTION_SELL] = NewString_ReadMsgData(appData->msgData, msg_0010_00086);
    // USE
    appData->contextMenuStrings[BAG_ITEM_CONTEXT_MENU_ACTION_USE_IN_BERRY_POTS] = NewString_ReadMsgData(appData->msgData, msg_0010_00000);
    // STOP
    appData->contextMenuStrings[BAG_ITEM_CONTEXT_MENU_ACTION_STOP_GBSOUNDS] = NewString_ReadMsgData(appData->msgData, msg_0010_00128);
}

void BagApp_UnloadContextMenuStrings(BagAppData *appData) {
    for (u16 i = 0; i < 16; ++i) {
        String_Delete(appData->contextMenuStrings[i]);
    }
}

void BagApp_DrawContextMenuTopScreen(BagAppData *appData, u8 *stringIndices, int numStrings) {
    if (appData->bagView->pockets[appData->bagView->curPocket].pocketId == POCKET_TMHMS) {
        FillWindowPixelBuffer(&appData->windows_main[BAG_APP_WINDOW_MAIN_TMHM_DETAILS], 0);
        BagApp_PrintTMHMDetails(appData, appData->bagView->itemId);
        ScheduleWindowCopyToVram(&appData->windows_main[BAG_APP_WINDOW_MAIN_DESCRIPTION]);
        BagApp_DrawTMHMMoveDetails(appData, appData->bagView->itemId, TRUE);
        BagApp_DrawTopScreenUI(appData, FALSE);
    }
    DrawFrameAndWindow2(&appData->windows_main[BAG_APP_WINDOW_MAIN_ITEM_ACTION], TRUE, 0x3E2, 12);
    FillWindowPixelBuffer(&appData->windows_main[BAG_APP_WINDOW_MAIN_ITEM_ACTION], 15);
    BagViewPocket *pocket = &appData->bagView->pockets[appData->bagView->curPocket];
    String *itemIsSelectedMsg;
    if (appData->bagView->context == BAG_VIEW_CONTEXT_BERRY_POTS && !IsBerryOrMulch(pocket->pocketId, appData->bagView->itemId)) {
        // Can't use the {item}.
        itemIsSelectedMsg = NewString_ReadMsgData(appData->msgData, msg_0010_00106);
    } else {
        // The {item} item is selected.
        itemIsSelectedMsg = NewString_ReadMsgData(appData->msgData, msg_0010_00043);
    }
    String *formattedStrbuf = String_New(108, HEAP_ID_BAG);
    BagApp_BufferItemName(appData, pocket->scroll + appData->cursorPos - 8, 0);
    StringExpandPlaceholders(appData->msgFormat, formattedStrbuf, itemIsSelectedMsg);
    AddTextPrinterParameterized(&appData->windows_main[BAG_APP_WINDOW_MAIN_ITEM_ACTION], 1, formattedStrbuf, 0, 0, TEXT_SPEED_NOTRANSFER, NULL);
    String_Delete(formattedStrbuf);
    String_Delete(itemIsSelectedMsg);
    ScheduleWindowCopyToVram(&appData->windows_main[BAG_APP_WINDOW_MAIN_ITEM_ACTION]);
}

void BagApp_PrintItemDescriptionOnWindow(BagAppData *appData, Window *window, int itemId) {
    FillWindowPixelBuffer(window, 0);
    BagApp_PrintItemDescriptionOnWindowMain0(appData, itemId);
    ScheduleWindowCopyToVram(window);
}

void BagApp_ClearItemDescriptionWindow(BagAppData *appData, Window *window) {
    FillWindowPixelBuffer(window, 0);
    ScheduleWindowCopyToVram(window);
}

void BagApp_PrintPocketDescriptionOnWindow(BagAppData *appData, Window *window, int pocket) {
    String *string = NewString_ReadMsgData(appData->msgData, msg_0010_00120 + pocket);
    FillWindowPixelBuffer(window, 0);
    AddTextPrinterParameterizedWithColor(window, 0, string, 20, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(15, 14, 0), NULL);
    String_Delete(string);
    ScheduleWindowCopyToVram(window);
}

void BagApp_ClearItemActionMessageWindow(BagAppData *appData) {
    ClearFrameAndWindow2(&appData->windows_main[BAG_APP_WINDOW_MAIN_ITEM_ACTION], TRUE);
    ClearWindowTilemapAndScheduleTransfer(&appData->windows_main[BAG_APP_WINDOW_MAIN_ITEM_ACTION]);
}

void BagApp_RemoveContextMenuWindowsAndRedrawTopScreenUI(BagAppData *appData) {
    BagApp_ClearItemActionMessageWindow(appData);
    BagApp_RemoveContextMenuWindowsInternal(appData);
    BagApp_DrawTMHMMoveDetails(appData, ITEM_NONE, FALSE);
}

void BagApp_RemoveContextMenuWindows(BagAppData *appData) {
    BagApp_RemoveContextMenuWindowsInternal(appData);
}

void BagApp_PrintMoveTheItemMessage(BagAppData *appData) {
    FillWindowPixelBuffer(&appData->windows_main[BAG_APP_WINDOW_MAIN_ITEM_ACTION], 0xFF);
    String *string = NewString_ReadMsgData(appData->msgData, msg_0010_00046);
    String *formattedString = String_New(130, HEAP_ID_BAG);
    BagApp_BufferItemName(appData, appData->moveItemOriginalSlot, 0);
    StringExpandPlaceholders(appData->msgFormat, formattedString, string);
    DrawFrameAndWindow2(&appData->windows_main[BAG_APP_WINDOW_MAIN_ITEM_ACTION], TRUE, 0x3E2, 12);
    AddTextPrinterParameterizedWithColor(&appData->windows_main[BAG_APP_WINDOW_MAIN_ITEM_ACTION], 1, formattedString, 0, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(1, 2, 0), NULL);
    ScheduleWindowCopyToVram(&appData->windows_main[BAG_APP_WINDOW_MAIN_ITEM_ACTION]);
    String_Delete(formattedString);
    String_Delete(string);
}

void BagApp_PrintQuantityDigitWindows(BagAppData *appData, u32 numDigits) {
    GF_ASSERT(appData->quantity < 1000);
    String *digitStrBuf = String_New(2, HEAP_ID_BAG);
    u32 denom;
    if (numDigits == 2) {
        denom = 10;
    } else {
        denom = 100;
    }
    u32 quantity = appData->quantity;
    for (int i = 0; i < numDigits; ++i) {
        u32 digit = quantity / denom;
        String16_FormatInteger(digitStrBuf, digit, 1, PRINTING_MODE_LEFT_ALIGN, TRUE);
        quantity -= digit * denom;
        denom /= 10;
        FillWindowPixelBuffer(&appData->windows_sub[BAG_APP_WINDOW_SUB_QUANTITY_DIGIT_1 + i], 0);
        AddTextPrinterParameterizedWithColor(&appData->windows_sub[BAG_APP_WINDOW_SUB_QUANTITY_DIGIT_1 + i], 0, digitStrBuf, 0, 4, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(1, 2, 0), NULL);
        ScheduleWindowCopyToVram(&appData->windows_sub[BAG_APP_WINDOW_SUB_QUANTITY_DIGIT_1 + i]);
    }
    String_Delete(digitStrBuf);
}

void BagApp_PrintOkToTrashItemsMessage(BagAppData *appData) {
    String *okToThrowAwayString = NewString_ReadMsgData(appData->msgData, msg_0010_00055);
    BagViewPocket *pocket = &appData->bagView->pockets[appData->bagView->curPocket];
    if (appData->quantity > 1) {
        BagApp_BufferItemNamePlural(appData, pocket->scroll + appData->cursorPos - 8, 0);
    } else {
        BagApp_BufferItemName(appData, pocket->scroll + appData->cursorPos - 8, 0);
    }
    BufferIntegerAsString(appData->msgFormat, 1, appData->quantity, 3, PRINTING_MODE_LEFT_ALIGN, TRUE);
    StringExpandPlaceholders(appData->msgFormat, appData->formattedStrbuf, okToThrowAwayString);
    String_Delete(okToThrowAwayString);
    appData->textPrinterId = BagApp_PrintMessage(appData, 0);
}

u8 BagApp_PrintMessage(BagAppData *appData, int whichWindow) {
    Window *window;
    if (whichWindow == 0) {
        window = &appData->windows_main[BAG_APP_WINDOW_MAIN_MESSAGE];
    } else {
        GF_ASSERT(appData->windows_sub[BAG_APP_WINDOW_SUB_MESSAGE].bgConfig != NULL);
        window = &appData->windows_sub[BAG_APP_WINDOW_SUB_MESSAGE];
    }
    FillWindowPixelBuffer(window, 15);
    DrawFrameAndWindow2(window, TRUE, 0x3E2, 12);
    ScheduleWindowCopyToVram(window);
    TextFlags_SetCanABSpeedUpPrint(TRUE);
    TextFlags_SetAutoScrollParam(0);
    return AddTextPrinterParameterized(window, 1, appData->formattedStrbuf, 0, 0, Options_GetTextFrameDelay(appData->options), BagApp_PrintMessageCallback);
}

static int BagApp_PrintMessageCallback(TextPrinterTemplate *printer, u16 cmd) {
    switch (cmd) {
    case 0:
        break;
    case 1:
        return GF_IsAnySEPlaying();
    case 2:
        return IsFanfarePlaying();
    case 3:
        PlaySE(SEQ_SE_DP_PC_LOGIN);
        break;
    case 4:
        return IsSEPlaying(SEQ_SE_DP_PC_LOGIN);
    }

    return FALSE;
}

void BagApp_CreateYesNoPrompt(BagAppData *appData) {
    YesNoPromptTemplate yesnoTemplate;

    yesnoTemplate.bgConfig = appData->bgConfig;
    yesnoTemplate.bgId = GF_BG_LYR_SUB_1;
    yesnoTemplate.tileStart = 0x081;
    yesnoTemplate.plttSlot = 9;
    yesnoTemplate.x = 25;
    yesnoTemplate.y = 6;
    yesnoTemplate.ignoreTouchFlag = FALSE;
    yesnoTemplate.initialCursorPos = 0;
    yesnoTemplate.initialCursorPos = 0;
    yesnoTemplate.shapeParam = 0;
    appData->yesNoPrompt = YesNoPrompt_Create(HEAP_ID_BAG);
    YesNoPrompt_InitFromTemplate(appData->yesNoPrompt, &yesnoTemplate);
}

void BagApp_DestroyYesNoPrompt(BagAppData *appData) {
    YesNoPrompt_Destroy(appData->yesNoPrompt);
}

void BagApp_PrintSaleTotalInWindow(BagAppData *appData) {
    Window *window = &appData->windows_sub[BAG_APP_WINDOW_SUB_SELL_MONEY];
    FillWindowPixelBuffer(window, 0);
    String *string = NewString_ReadMsgData(appData->msgData, msg_0010_00083);
    BufferIntegerAsString(appData->msgFormat, 0, appData->unitSellPrice * appData->quantity, 6, PRINTING_MODE_RIGHT_ALIGN, TRUE);
    StringExpandPlaceholders(appData->msgFormat, appData->formattedStrbuf, string);
    u32 width = FontID_String_GetWidth(0, appData->formattedStrbuf, 0);
    AddTextPrinterParameterizedWithColor(window, 0, appData->formattedStrbuf, 0, 4, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(1, 2, 0), NULL);
    ScheduleWindowCopyToVram(window);
    String_Delete(string);
}

void BagApp_PrintMoneyOnWindow(BagAppData *appData, int isNotMoney) {
    String *strbuf = String_New(256, HEAP_ID_BAG);
    Window *window = &appData->windows_sub[BAG_APP_WINDOW_SUB_MONEY];
    if (isNotMoney == 0) {
        FillWindowPixelBuffer(window, 0);
        String *moneyString = NewString_ReadMsgData(appData->msgData, msg_0010_00080);
        AddTextPrinterParameterizedWithColor(window, 0, moneyString, 4, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(1, 2, 0), NULL);
        String_Delete(moneyString);
    } else {
        FillWindowPixelRect(window, 0, 0, 16, 72, 16);
    }
    String *moneyAmountString = NewString_ReadMsgData(appData->msgData, msg_0010_00081);
    BufferIntegerAsString(appData->msgFormat, 0, PlayerProfile_GetMoney(appData->playerProfile), 6, PRINTING_MODE_RIGHT_ALIGN, TRUE);
    StringExpandPlaceholders(appData->msgFormat, strbuf, moneyAmountString);
    u32 width = FontID_String_GetWidth(0, strbuf, 0);
    AddTextPrinterParameterizedWithColor(window, 0, strbuf, 68 - (width + 8), 16, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(1, 2, 0), NULL);
    ScheduleWindowCopyToVram(window);
    String_Delete(moneyAmountString);
    String_Delete(strbuf);
}

void BagApp_DrawPoffinCountMsgBox_DPPt(BagAppData *appData) {
    Window *window = &appData->windows_main[BAG_APP_WINDOW_MAIN_POFFIN_COUNT];
    String *msg;

    FillWindowPixelBuffer(window, 15);
    DrawFrameAndWindow1(window, TRUE, 0x3F7, 14);

    msg = NewString_ReadMsgData(appData->msgData, msg_0010_00115);
    AddTextPrinterParameterized(window, 0, msg, 0, 0, TEXT_SPEED_NOTRANSFER, NULL);
    String_Delete(msg);

    msg = NewString_ReadMsgData(appData->msgData, msg_0010_00116);
    BufferIntegerAsString(appData->msgFormat, 0, 0, 3, PRINTING_MODE_RIGHT_ALIGN, TRUE);
    StringExpandPlaceholders(appData->msgFormat, appData->formattedStrbuf, msg);
    String_Delete(msg);
    u32 width = FontID_String_GetWidth(0, appData->formattedStrbuf, 0);
    AddTextPrinterParameterized(window, 0, appData->formattedStrbuf, 88 - width, 16, TEXT_SPEED_NOTRANSFER, NULL);

    ScheduleWindowCopyToVram(window);
}

void BagApp_PrintCancel(BagAppData *appData, int centered) {
    String *cancel = NewString_ReadMsgData(appData->msgData, msg_0010_00008);
    FillWindowPixelBuffer(&appData->windows_main[BAG_APP_WINDOW_MAIN_CANCEL_BUTTON], 0);
    if (centered == 0) {
        u32 width = FontID_String_GetWidth(0, cancel, 0);
        AddTextPrinterParameterizedWithColor(&appData->windows_main[BAG_APP_WINDOW_MAIN_CANCEL_BUTTON], 0, cancel, (48 - width) / 2 + 8, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(15, 14, 0), NULL);
    } else {
        AddTextPrinterParameterizedWithColor(&appData->windows_main[BAG_APP_WINDOW_MAIN_CANCEL_BUTTON], 0, cancel, 5, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(15, 14, 0), NULL);
    }
    ScheduleWindowCopyToVram(&appData->windows_main[BAG_APP_WINDOW_MAIN_CANCEL_BUTTON]);
    String_Delete(cancel);
}

static int BagViewPocket_GetIndexWithAtMostXNonEmptySlots(BagViewPocket *pocket, int pocketId, int limit) {
    int i;
    int count = 0;
    for (i = 0; i < sPocketSizes[pocketId]; ++i) {
        if (pocket->slots[i].id != ITEM_NONE && pocket->slots[i].quantity != 0) {
            ++count;
            if (count == limit + 1) {
                break;
            }
        }
    }
    return i;
}

void BagApp_RedrawItemNameWindows(BagAppData *appData, int scroll, int itemSlot, BOOL isMoveMode) {
    int i;
    // this variable exists for some reason
    // apparently the dev anticipated a case
    // where the slots array is not packed,
    // but this is never the case at runtime
    int count;
    BagViewPocket *pocket = &appData->bagView->pockets[appData->bagView->curPocket];
    int numItemsOnPage = pocket->count - pocket->scroll;
    u16 targetWindowBase;
    u16 offTargetWindowBase;
    if (numItemsOnPage > 6) {
        numItemsOnPage = 6;
    }
    if (appData->itemNamesWindowSet == 0) {
        targetWindowBase = BAG_APP_WINDOW_SUB_ITEM_NAME_A_1;
        offTargetWindowBase = BAG_APP_WINDOW_SUB_ITEM_NAME_B_1;
    } else {
        targetWindowBase = BAG_APP_WINDOW_SUB_ITEM_NAME_B_1;
        offTargetWindowBase = BAG_APP_WINDOW_SUB_ITEM_NAME_A_1;
    }
    appData->itemNamesWindowSet ^= 1;
    BagApp_AddItemNameWindows(appData);
    for (i = 0; i < 6; ++i) {
        FillWindowPixelBuffer(&appData->windows_sub[targetWindowBase + i], 0);
        ClearWindowTilemapAndScheduleTransfer(&appData->windows_sub[offTargetWindowBase + i]);
    }
    count = 0;
    for (i = BagViewPocket_GetIndexWithAtMostXNonEmptySlots(pocket, appData->bagView->curPocket, scroll); i < sPocketSizes[appData->bagView->curPocket]; ++i) {
        if (pocket->slots[i].id != ITEM_NONE && pocket->slots[i].quantity != 0) {
            if (isMoveMode == 0) {
                BagApp_PrintItemNameAndMaybeQuantityOnWindow(appData, &appData->windows_sub[targetWindowBase + count], appData->itemNameStrings[i], pocket, i);
            } else if (i == appData->moveItemOriginalSlot) {
                BagApp_PrintItemNameAndMaybeQuantityOnWindow(appData, &appData->windows_sub[targetWindowBase + count], appData->itemNameStrings[i], pocket, i);
            } else {
                AddTextPrinterParameterizedWithColor(&appData->windows_sub[targetWindowBase + count], 0, appData->itemNameStrings[i], 0, 16, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(1, 2, 0), NULL);
            }
            if (++count >= numItemsOnPage) {
                break;
            }
        }
    }
    for (i = 0; i < 6; ++i) {
        ScheduleWindowCopyToVram(&appData->windows_sub[targetWindowBase + i]);
    }
}

void BagApp_SwitchItemButtonWindowsToContextMenuMode(BagAppData *appData, int scroll, int offset) {
    BagViewPocket *pocket = &appData->bagView->pockets[appData->bagView->curPocket];
    offset = scroll + offset;
    for (int i = 0; i < 6; ++i) {
        ClearWindowTilemapAndScheduleTransfer(&appData->windows_sub[BAG_APP_WINDOW_SUB_ITEM_NAME_A_1 + i]);
    }
    BagApp_RemoveItemNameWindows(appData);
    ClearWindowTilemapAndScheduleTransfer(&appData->windows_main[BAG_APP_WINDOW_MAIN_PAGE_COUNTER]);
    BagApp_ShowContextMenuWindows(appData);
    BagApp_PrintItemNameAndMaybeQuantityOnWindow(appData, &appData->windows_sub[BAG_APP_WINDOW_SUB_CONTEXT_SELECTED_ITEM], appData->itemNameStrings[offset], pocket, offset);
    ScheduleWindowCopyToVram(&appData->windows_sub[BAG_APP_WINDOW_SUB_CONTEXT_SELECTED_ITEM]);
}

void BagApp_ClearSelectedItemWindow(BagAppData *appData) {
    ClearWindowTilemapAndScheduleTransfer(&appData->windows_sub[BAG_APP_WINDOW_SUB_CONTEXT_SELECTED_ITEM]);
}

static void BagApp_PrintItemNameAndMaybeQuantityOnWindow(BagAppData *appData, Window *window, String *string, BagViewPocket *pocket, int slotId) {
    switch (pocket->pocketId) {
    case POCKET_TMHMS:
        AddTextPrinterParameterizedWithColor(window, 0, string, 0, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(1, 2, 0), NULL);
        BagApp_PrintTMorHMNumberOnWindow(appData, window, &pocket->slots[slotId], 16);
        if (pocket->slots[slotId].id >= ITEM_TM01 && pocket->slots[slotId].id <= ITEM_TM92) {
            PrintItemQuantityOnWindow(appData->msgFormat, appData->msgData, window, pocket->slots[slotId].quantity);
        }
        break;
    case POCKET_KEY_ITEMS:
        AddTextPrinterParameterizedWithColor(window, 0, string, 0, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(1, 2, 0), NULL);
        if (Bag_GetRegisteredItem1(appData->bag) == pocket->slots[slotId].id) {
            BagApp_DrawRegisteredItemIconOnWindow(appData, window, 16, 0);
        }
        if (Bag_GetRegisteredItem2(appData->bag) == pocket->slots[slotId].id) {
            BagApp_DrawRegisteredItemIconOnWindow(appData, window, 16, 1);
        }
        break;
    default:
        AddTextPrinterParameterizedWithColor(window, 0, string, 0, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(1, 2, 0), NULL);
        PrintItemQuantityOnWindow(appData->msgFormat, appData->msgData, window, pocket->slots[slotId].quantity);
    }
}

static void PrintItemQuantityOnWindow(MessageFormat *msgFormat, MsgData *msgData, Window *window, u16 quantity) {
    BufferIntegerAsString(msgFormat, 0, quantity, 3, PRINTING_MODE_LEFT_ALIGN, TRUE);
    String *string = ReadMsgData_ExpandPlaceholders(msgFormat, msgData, msg_0010_00087, HEAP_ID_BAG);
    AddTextPrinterParameterizedWithColor(window, 0, string, 48, 16, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(1, 2, 0), NULL);
    String_Delete(string);
}

void BagApp_PrintPageCounter(BagAppData *appData, int pocketCount, int pocketScroll, int offset) {
    int page = (pocketScroll + offset) / 6;
    if (pocketCount == 0) {
        pocketCount = 1;
    } else {
        pocketCount = (pocketCount + 5) / 6;
    }
    FillWindowPixelBuffer(&appData->windows_main[BAG_APP_WINDOW_MAIN_PAGE_COUNTER], 0);
    BufferIntegerAsString(appData->msgFormat, 0, page + 1, 3, PRINTING_MODE_RIGHT_ALIGN, TRUE);
    BufferIntegerAsString(appData->msgFormat, 1, pocketCount, 3, PRINTING_MODE_RIGHT_ALIGN, TRUE);
    String *string = ReadMsgData_ExpandPlaceholders(appData->msgFormat, appData->msgData, msg_0010_00022, HEAP_ID_BAG);
    AddTextPrinterParameterizedWithColor(&appData->windows_main[BAG_APP_WINDOW_MAIN_PAGE_COUNTER], 0, string, 0, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(15, 1, 0), NULL);
    ScheduleWindowCopyToVram(&appData->windows_main[BAG_APP_WINDOW_MAIN_PAGE_COUNTER]);
    String_Delete(string);
}

void BagApp_PrintContextMenuStringOnWindowCentered(Window *window, String **strings, int index) {
    FillWindowPixelBuffer(window, 0);
    if (index != 0xFF) {
        AddTextPrinterParameterizedWithColor(window, 0, strings[index], (8 * GetWindowWidth(window) - FontID_String_GetWidth(0, strings[index], 0)) / 2, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(15, 14, 0), NULL);
    }
    ScheduleWindowCopyToVram(window);
}

void BagApp_ClearFourWindowsAt(Window *window) {
    for (int i = 0; i < 4; ++i) {
        ClearWindowTilemapAndScheduleTransfer(&window[i]);
    }
}

void BagApp_PrintTrashContextOptionOnWindow(BagAppData *appData) {
    AddTextPrinterParameterizedWithColor(&appData->windows_sub[BAG_APP_WINDOW_SUB_SELL_OR_TRASH_BUTTON], 0, appData->contextMenuStrings[BAG_ITEM_CONTEXT_MENU_ACTION_TRASH], 5, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(15, 14, 0), NULL);
    ScheduleWindowCopyToVram(&appData->windows_sub[BAG_APP_WINDOW_SUB_SELL_OR_TRASH_BUTTON]);
}

void BagApp_PrintSellContextOptionOnWindow(BagAppData *appData) {
    AddTextPrinterParameterizedWithColor(&appData->windows_sub[BAG_APP_WINDOW_SUB_SELL_OR_TRASH_BUTTON], 0, appData->contextMenuStrings[BAG_ITEM_CONTEXT_MENU_ACTION_SELL], 5, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(15, 14, 0), NULL);
    ScheduleWindowCopyToVram(&appData->windows_sub[BAG_APP_WINDOW_SUB_SELL_OR_TRASH_BUTTON]);
}

void BagApp_ClearTextOnSellOrTrashButton(BagAppData *appData) {
    ClearWindowTilemapAndScheduleTransfer(&appData->windows_sub[BAG_APP_WINDOW_SUB_SELL_OR_TRASH_BUTTON]);
}

void BagApp_ClearTextOnCancelButton(BagAppData *appData) {
    ClearWindowTilemapAndScheduleTransfer(&appData->windows_main[BAG_APP_WINDOW_MAIN_CANCEL_BUTTON]);
}
