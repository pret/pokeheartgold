#include "global.h"
#include "bag_view.h"
#include "heap.h"
#include "save.h"
#include "coins.h"
#include "player_data.h"
#include "seal_case.h"
#include "fashion_case.h"
#include "frontier_data.h"
#include "msgdata.h"
#include "message_format.h"
#include "constants/items.h"

#include "msgdata/msg.naix"
#include "msgdata/msg/msg_0010.h"
#include "msgdata/msg/msg_0040.h"

static u16 GetCoinCount(SaveData *saveData);
static u32 GetSealCount(SaveData *saveData);
static u32 GetNumFashionAccessories(SaveData *saveData);
static u32 GetNumFashionBackgrounds(SaveData *saveData);
static u32 GetNumBattlePoints(SaveData *saveData);

BagView *BagView_New(u8 heapId) {
    BagView *ret = AllocFromHeap((HeapID)heapId, sizeof(BagView));
    memset(ret, 0, sizeof(BagView));
    return ret;
}

u32 BagView_sizeof(void) {
    return sizeof(BagView);
}

void sub_02077894(BagView *bagView, u8 a1) {
    bagView->unk65 = a1;
}

void sub_0207789C(BagView *bagView, SaveData *save, u8 a2, BagCursor *cursor, u32 a4) {
    sub_02077894(bagView, a2);
    bagView->saveData = save;
    bagView->unk78 = a4;
    bagView->cursor = cursor;
    bagView->unk66 = 0;
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

void sub_020778C8(BagView *bagView) {
    bagView->unk76_0 = TRUE;
}

void sub_020778DC(BagView *bagView, void *a1) {
    bagView->unk70 = a1;
}

void sub_020778E0(BagView *bagView, u8 a1) {
    bagView->unk74 = a1;
}

void sub_020778E8(BagView *bagView, u16 a1) {
    bagView->unk76_1 = a1;
}

u16 sub_02077904(BagView *bagView) {
    return bagView->unk66;
}

u16 sub_0207790C(BagView *bagView) {
    return bagView->unk68;
}

u8 sub_02077914(BagView *bagView) {
    return bagView->unk74;
}

u8 sub_0207791C(BagView *bagView) {
    return bagView->unk75;
}

static u16 GetCoinCount(SaveData *saveData) {
    return CheckCoins(Save_PlayerData_GetCoinsAddr(saveData));
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
    return FrontierData_BattlePointAction(Save_FrontierData_Get(saveData), 0, 0); //todo: DATA_GET
}

BOOL TryFormatRegisteredKeyItemUseMessage(SaveData *saveData, String *dest, u16 itemId, HeapID heapId) {
    MsgData *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, NARC_msg_msg_0010_bin, heapId);
    MessageFormat *messageFormat = MessageFormat_New(heapId);
    String *string;

    if (itemId == ITEM_NONE) {
        string = NewString_ReadMsgData(msgData, msg_0010_00102); // A Key Item in the Bag can be assigned to this button for instant use.
    } else if (itemId == ITEM_POINT_CARD) {
        string = NewString_ReadMsgData(msgData, msg_0010_00100); // Saved Battle Points: {STRVAR_1 53, 0, 0}BP
        BufferIntegerAsString(messageFormat, 0, GetNumBattlePoints(saveData), 4, PRINTING_MODE_LEFT_ALIGN, TRUE);
    } else if (itemId == ITEM_SEAL_CASE) {
        string = NewString_ReadMsgData(msgData, msg_0010_00095);  // Seals: {STRVAR_1 53, 0, 0}
        BufferIntegerAsString(messageFormat, 0, GetSealCount(saveData), 4, PRINTING_MODE_LEFT_ALIGN, TRUE);
    } else if (itemId == ITEM_FASHION_CASE) {
        string = NewString_ReadMsgData(msgData, msg_0010_00096);  // Accessories: {STRVAR_1 52, 0, 0} Backdrops: {STRVAR_1 51, 1, 0}
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

void GetItemUseErrorMessage(PlayerProfile *playerProfile, String *dest, u16 itemId, enum ItemUseError code, HeapID heapId) {
#pragma unused(itemId)
    MsgData *msgData;
    switch (code) {
        case ITEMUSEERROR_NODISMOUNT:
            // You can't dismount your Bike here.
            msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0010_bin, heapId);
            ReadMsgDataIntoString(msgData, msg_0010_00057, dest);
            DestroyMsgData(msgData);
            break;
        case ITEMUSEERROR_NOFOLLOWER:
            // Can't be used when you have someone with you!
            msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0010_bin, heapId);
            ReadMsgDataIntoString(msgData, msg_0010_00118, dest);
            DestroyMsgData(msgData);
            break;
        case ITEMUSEERROR_NOTNOW:
            // You can't be doing that now!
            msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0010_bin, heapId);
            ReadMsgDataIntoString(msgData, msg_0010_00119, dest);
            DestroyMsgData(msgData);
            break;
        default:
            // {PLAYER}! This isn't the time to use that!
            msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0040_bin, heapId);
            MessageFormat *messageFormat = MessageFormat_New(heapId);
            String *src = NewString_ReadMsgData(msgData, msg_0040_00037);
            BufferPlayersName(messageFormat, 0, playerProfile);
            StringExpandPlaceholders(messageFormat, dest, src);
            String_Delete(src);
            MessageFormat_Delete(messageFormat);
            DestroyMsgData(msgData);
            break;
    }
}
