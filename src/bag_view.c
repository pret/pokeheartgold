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

#include "msgdata/msg/msg_0010.h"
#include "msgdata/msg/msg_0040.h"

BAG_VIEW *BagView_New(u8 heap_id) {
    BAG_VIEW *ret = AllocFromHeap((HeapID)heap_id, sizeof(BAG_VIEW));
    memset(ret, 0, sizeof(BAG_VIEW));
    return ret;
}

u32 BagView_sizeof(void) {
    return sizeof(BAG_VIEW);
}

void sub_02077894(BAG_VIEW *a0, u8 a1) {
    a0->unk_65 = a1;
}

void sub_0207789C(BAG_VIEW *a0, SaveData *a1, u8 a2, BAG_CURSOR *a3, u32 a4) {
    sub_02077894(a0, a2);
    a0->saveData = a1;
    a0->unk_78 = a4;
    a0->cursor = a3;
    a0->unk_66 = 0;
}

void BagView_SetItem(BAG_VIEW *bagView, ItemSlot *slots, u8 pocketId, u8 position) {
    // Bug: position was likely intended to force a particular display order.
    // Likely intended as an index to bagView->pockets.
    // However, this variable is unused.
    // This bug was introduced in HGSS.
#pragma unused(position)
    bagView->pockets[pocketId].slots = slots;
    bagView->pockets[pocketId].pocketId = pocketId;
}

void sub_020778C8(BAG_VIEW *bagView) {
    bagView->unk_76_0 = TRUE;
}

void sub_020778DC(BAG_VIEW *bagView, void *a1) {
    bagView->unk_70 = a1;
}

void sub_020778E0(BAG_VIEW *bagView, u8 a1) {
    bagView->unk_74 = a1;
}

void sub_020778E8(BAG_VIEW *bagView, u16 a1) {
    bagView->unk_76_1 = a1;
}

u16 sub_02077904(BAG_VIEW *bagView) {
    return bagView->unk_66;
}

u16 sub_0207790C(BAG_VIEW *bagView) {
    return bagView->unk_68;
}

u8 sub_02077914(BAG_VIEW *bagView) {
    return bagView->unk_74;
}

u8 sub_0207791C(BAG_VIEW *bagView) {
    return bagView->unk_75;
}

static u16 GetNumCoins(SaveData *saveData) {
    return CheckCoins(Save_PlayerData_GetCoinsAddr(saveData));
}

static u32 GetNumSeals(SaveData *saveData) {
    u32 i, total;
    SEALCASE *sealCase = Save_SealCase_Get(saveData);
    total = 0;
    for (i = SEAL_MIN; i <= SEAL_MAX; i++) {
        total += SealCase_CountSealOccurrenceAnywhere(sealCase, i);
    }
    return total;
}

static u32 GetNumFashionAccessories(SaveData *saveData) {
    return FashionCase_CountAccessories(SaveDressupData_GetFashionCase(Save_DressupData_Get(saveData)));
}

static u32 GetNumFashionBackgrounds(SaveData *saveData) {
    return FashionCase_CountWallpapers(SaveDressupData_GetFashionCase(Save_DressupData_Get(saveData)));
}

static u32 GetNumBattlePoints(SaveData *saveData) {
    return FrontierData_BattlePointAction(Save_FrontierData_Get(saveData), 0, 0);
}

BOOL TryFormatRegisteredKeyItemUseMessage(SaveData *saveData, STRING *dest, u16 itemId, HeapID heap_id) {
    MSGDATA *msgData;
    STRING *fmtStr;
    MessageFormat *msgFmt;

    msgData = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, NARC_msg_msg_0010_bin, heap_id);
    msgFmt = MessageFormat_New(heap_id);

    if (itemId == ITEM_NONE) {
        fmtStr = NewString_ReadMsgData(msgData, msg_0010_00102);
    } else if (itemId == ITEM_POINT_CARD) {
        fmtStr = NewString_ReadMsgData(msgData, msg_0010_00100);
        BufferIntegerAsString(msgFmt, 0, GetNumBattlePoints(saveData), 4, STRCONVMODE_LEFT_ALIGN, TRUE);
    } else if (itemId == ITEM_SEAL_CASE) {
        fmtStr = NewString_ReadMsgData(msgData, msg_0010_00095);
        BufferIntegerAsString(msgFmt, 0, GetNumSeals(saveData), 4, STRCONVMODE_LEFT_ALIGN, TRUE);
    } else if (itemId == ITEM_FASHION_CASE) {
        fmtStr = NewString_ReadMsgData(msgData, msg_0010_00096);
        BufferIntegerAsString(msgFmt, 0, GetNumFashionAccessories(saveData), 3, STRCONVMODE_LEFT_ALIGN, TRUE);
        BufferIntegerAsString(msgFmt, 1, GetNumFashionBackgrounds(saveData), 2, STRCONVMODE_LEFT_ALIGN, TRUE);
    } else if (itemId == ITEM_COIN_CASE) {
        fmtStr = NewString_ReadMsgData(msgData, msg_0010_00058);
        BufferIntegerAsString(msgFmt, 0, GetNumCoins(saveData), 5, STRCONVMODE_LEFT_ALIGN, TRUE);
    } else {
        MessageFormat_Delete(msgFmt);
        DestroyMsgData(msgData);
        return FALSE;
    }
    StringExpandPlaceholders(msgFmt, dest, fmtStr);
    String_Delete(fmtStr);
    MessageFormat_Delete(msgFmt);
    DestroyMsgData(msgData);
    return TRUE;
}

void GetItemUseErrorMessage(PlayerProfile *playerProfile, STRING *dest, u16 itemId, enum ItemUseError code, HeapID heap_id) {
#pragma unused(itemId)
    MSGDATA *msgData;
    switch (code) {
    case ITEMUSEERROR_NODISMOUNT:
        // You can't dismount your Bike here.
        msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0010_bin, heap_id);
        ReadMsgDataIntoString(msgData, msg_0010_00057, dest);
        DestroyMsgData(msgData);
        break;
    case ITEMUSEERROR_NOFOLLOWER:
        // Can't be used when you have someone with you!
        msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0010_bin, heap_id);
        ReadMsgDataIntoString(msgData, msg_0010_00118, dest);
        DestroyMsgData(msgData);
        break;
    case ITEMUSEERROR_NOTNOW:
        // You can't be doing that now!
        msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0010_bin, heap_id);
        ReadMsgDataIntoString(msgData, msg_0010_00119, dest);
        DestroyMsgData(msgData);
        break;
    default:
    {
        // {PLAYER}! This isn't the time to use that!
        MessageFormat *msgFmt;
        STRING *string;

        msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0040_bin, heap_id);
        msgFmt = MessageFormat_New(heap_id);
        string = NewString_ReadMsgData(msgData, msg_0040_00037);
        BufferPlayersName(msgFmt, 0, playerProfile);
        StringExpandPlaceholders(msgFmt, dest, string);
        String_Delete(string);
        MessageFormat_Delete(msgFmt);
        DestroyMsgData(msgData);
    }
        break;
    }
}
