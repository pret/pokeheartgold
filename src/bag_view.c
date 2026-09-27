#include "bag_view.h"

#include "global.h"

#include "constants/items.h"

#include "msgdata/msg.naix"
#include "msgdata/msg/msg_0010.h"
#include "msgdata/msg/msg_0040.h"

#include "coins.h"
#include "fashion_case.h"
#include "frontier_data.h"
#include "heap.h"
#include "menu_input_state.h"
#include "message_format.h"
#include "msgdata.h"
#include "player_data.h"
#include "save.h"
#include "seal_case.h"

static u16 GetCoinCount(SaveData *saveData);
static u32 GetSealCount(SaveData *saveData);
static u32 GetNumFashionAccessories(SaveData *saveData);
static u32 GetNumFashionBackgrounds(SaveData *saveData);
static u32 GetNumBattlePoints(SaveData *saveData);

BagView *BagView_New(u8 heapID) {
    BagView *ret = Heap_Alloc((enum HeapID)heapID, sizeof(BagView));
    memset(ret, 0, sizeof(BagView));
    return ret;
}

u32 BagView_sizeof(void) {
    return sizeof(BagView);
}

void BagView_SetContext(BagView *bagView, u8 context) {
    bagView->context = context;
}

void BagView_Init(BagView *bagView, SaveData *save, u8 context, BagCursor *cursor, MenuInputStateMgr *menuInputStateMgr) {
    BagView_SetContext(bagView, context);
    bagView->saveData = save;
    bagView->menuInputStateMgr = menuInputStateMgr;
    bagView->cursor = cursor;
    bagView->itemId = ITEM_NONE;
}

void BagView_SetItem(BagView *bagView, ItemSlot *slots, u8 pocketId, u8 position) {
    // Bug: position was likely intended to force a particular display order.
    // Likely intended as an index to bagView->pockets.
    // However, this variable is unused.
    // This bug was introduced in HGSS.
#pragma unused(position)
    bagView->pockets[pocketId].slots = slots;
    bagView->pockets[pocketId].pocketId = pocketId;
}

void BagView_SetOnBike(BagView *bagView) {
    bagView->onBike = TRUE;
}

void BagView_SetCheckUseData(BagView *bagView, ItemCheckUseData *checkUseData) {
    bagView->checkUseData = checkUseData;
}

void BagView_SetPartySlot(BagView *bagView, u8 partySlot) {
    bagView->partySlot = partySlot;
}

void BagView_SetMapLoadType(BagView *bagView, u16 mapLoadType) {
    bagView->mapLoadType = mapLoadType;
}

u16 BagView_GetItemId(BagView *bagView) {
    return bagView->itemId;
}

u16 BagView_GetReturnCode(BagView *bagView) {
    return bagView->returnCode;
}

u8 BagView_GetPartySlot(BagView *bagView) {
    return bagView->partySlot;
}

u8 sub_0207791C(BagView *bagView) {
    return bagView->soldAmount;
}

static u16 GetCoinCount(SaveData *saveData) {
    return Coins_GetValue(Save_PlayerData_GetCoinsAddr(saveData));
}

static u32 GetSealCount(SaveData *saveData) {
    SealCase *sealCase = Save_SealCase_Get(saveData);
    u32 i;
    u32 count = 0;

    for (i = SEAL_MIN; i <= SEAL_MAX; i++) {
        count += SealCase_CountSealOccurrenceAnywhere(sealCase, i);
    }

    return count;
}

static u32 GetNumFashionAccessories(SaveData *saveData) {
    return FashionCase_CountAccessories(Save_FashionData_GetFashionCase(Save_FashionData_Get(saveData)));
}

static u32 GetNumFashionBackgrounds(SaveData *saveData) {
    return FashionCase_CountWallpapers(Save_FashionData_GetFashionCase(Save_FashionData_Get(saveData)));
}

static u32 GetNumBattlePoints(SaveData *saveData) {
    return FrontierData_BattlePointAction(Save_FrontierData_Get(saveData), 0, 0); // todo: DATA_GET
}

BOOL TryFormatRegisteredKeyItemUseMessage(SaveData *saveData, String *dest, u16 itemId, enum HeapID heapID) {
    MsgData *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, msg_0010, heapID);
    MessageFormat *messageFormat = MessageFormat_New(heapID);
    String *string;

    if (itemId == ITEM_NONE) {
        string = NewString_ReadMsgData(msgData, msg_0010_00102); // A Key Item in the Bag can be assigned to this button for instant use.
    } else if (itemId == ITEM_POINT_CARD) {
        string = NewString_ReadMsgData(msgData, msg_0010_00100); // Saved Battle Points: {STRVAR_1 53, 0, 0}BP
        BufferIntegerAsString(messageFormat, 0, GetNumBattlePoints(saveData), 4, PRINTING_MODE_LEFT_ALIGN, TRUE);
    } else if (itemId == ITEM_SEAL_CASE) {
        string = NewString_ReadMsgData(msgData, msg_0010_00095); // Seals: {STRVAR_1 53, 0, 0}
        BufferIntegerAsString(messageFormat, 0, GetSealCount(saveData), 4, PRINTING_MODE_LEFT_ALIGN, TRUE);
    } else if (itemId == ITEM_FASHION_CASE) {
        string = NewString_ReadMsgData(msgData, msg_0010_00096); // Accessories: {STRVAR_1 52, 0, 0} Backdrops: {STRVAR_1 51, 1, 0}
        BufferIntegerAsString(messageFormat, 0, GetNumFashionAccessories(saveData), 3, PRINTING_MODE_LEFT_ALIGN, TRUE);
        BufferIntegerAsString(messageFormat, 1, GetNumFashionBackgrounds(saveData), 2, PRINTING_MODE_LEFT_ALIGN, TRUE);
    } else if (itemId == ITEM_COIN_CASE) {
        string = NewString_ReadMsgData(msgData, msg_0010_00058); // Your Coins: {STRVAR_1 54, 0, 0}
        BufferIntegerAsString(messageFormat, 0, GetCoinCount(saveData), 5, PRINTING_MODE_LEFT_ALIGN, TRUE);
    } else {
        MessageFormat_Delete(messageFormat);
        DestroyMsgData(msgData);
        return FALSE;
    }

    StringExpandPlaceholders(messageFormat, dest, string);
    String_Delete(string);
    MessageFormat_Delete(messageFormat);
    DestroyMsgData(msgData);
    return TRUE;
}

void GetItemUseErrorMessage(PlayerProfile *playerProfile, String *dest, u16 itemId, enum ItemUseError code, enum HeapID heapID) {
#pragma unused(itemId)
    MsgData *msgData;
    switch (code) {
    case ITEMUSEERROR_NODISMOUNT:
        // You can't dismount your Bike here.
        msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, msg_0010, heapID);
        ReadMsgDataIntoString(msgData, msg_0010_00057, dest);
        DestroyMsgData(msgData);
        break;
    case ITEMUSEERROR_NOFOLLOWER:
        // Can't be used when you have someone with you!
        msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, msg_0010, heapID);
        ReadMsgDataIntoString(msgData, msg_0010_00118, dest);
        DestroyMsgData(msgData);
        break;
    case ITEMUSEERROR_NOTNOW:
        // You can't be doing that now!
        msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, msg_0010, heapID);
        ReadMsgDataIntoString(msgData, msg_0010_00119, dest);
        DestroyMsgData(msgData);
        break;
    default:
        // {PLAYER}! This isn't the time to use that!
        msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, msg_0040, heapID);
        MessageFormat *messageFormat = MessageFormat_New(heapID);
        String *src = NewString_ReadMsgData(msgData, msg_0040_00037);
        BufferPlayersName(messageFormat, 0, playerProfile);
        StringExpandPlaceholders(messageFormat, dest, src);
        String_Delete(src);
        MessageFormat_Delete(messageFormat);
        DestroyMsgData(msgData);
        break;
    }
}
