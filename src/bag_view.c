#include "bag_view.h"
#include "heap.h"
#include "save.h"
#include "coins.h"
#include "player_data.h"
#include "seal_case.h"
#include "fashion_case.h"
#include "frontier_data.h"
#include "msgdata.h"
#include "msgfmt.h"
#include "constants/items.h"

BAG_VIEW *BagView_New(u8 heap_id) {
    BAG_VIEW *ret = AllocFromHeap(heap_id, sizeof(BAG_VIEW));
    memset(ret, 0, sizeof(BAG_VIEW));
    return ret;
}

u32 BagView_sizeof(void) {
    return sizeof(BAG_VIEW);
}

void sub_02077894(BAG_VIEW *a0, u8 a1) {
    a0->unk_65 = a1;
}

void sub_0207789C(BAG_VIEW *a0, SAVEDATA *a1, u8 a2, BAG_CURSOR *a3, u32 a4) {
    sub_02077894(a0, a2);
    a0->saveData = a1;
    a0->unk_78 = a4;
    a0->cursor = a3;
    a0->unk_66 = 0;
}

void BagView_SetItem(BAG_VIEW *bagView, ITEM_SLOT *slots, u8 pocketId, u8 position) {
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

static u16 get_num_coins(SAVEDATA *saveData) {
    return CheckCoins(Sav2_PlayerData_GetCoinsAddr(saveData));
}

static u32 get_num_seals(SAVEDATA *saveData) {
    u32 i, total;
    SEALCASE *sealCase = Sav2_SealCase_get(saveData);
    total = 0;
    for (i = SEAL_MIN; i <= SEAL_MAX; i++) {
        total += SealCase_CountSealOccurrenceAnywhere(sealCase, i);
    }
    return total;
}

static u32 get_num_fashion_accessories(SAVEDATA *saveData) {
    return FashionCase_CountAccessories(SaveDressupData_GetFashionCase(Save_DressupData_get(saveData)));
}

static u32 get_num_fashion_backgrounds(SAVEDATA *saveData) {
    return FashionCase_CountWallpapers(SaveDressupData_GetFashionCase(Save_DressupData_get(saveData)));
}

static u32 get_num_battle_points(SAVEDATA *saveData) {
    return FrontierData_BattlePointAction(Save_FrontierData_get(saveData), 0, 0);
}

BOOL TryFormatRegisteredKeyItemUseMessage(SAVEDATA *saveData, STRING *dest, u16 itemId, u32 heap_id) {
    MSGDATA *msgData;
    STRING *fmtStr;
    MSGFMT *msgFmt;

    msgData = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, NARC_msg_msg_00000010_bin, heap_id);
    msgFmt = ScrStrBufs_new(heap_id);

    if (itemId == ITEM_NONE) {
        fmtStr = NewString_ReadMsgData(msgData, 102);
    } else if (itemId == ITEM_POINT_CARD) {
        fmtStr = NewString_ReadMsgData(msgData, 100);
        BufferIntegerAsString(msgFmt, 0, get_num_battle_points(saveData), 4, STRCONVMODE_LEFT_ALIGN, TRUE);
    } else if (itemId == ITEM_SEAL_CASE) {
        fmtStr = NewString_ReadMsgData(msgData, 95);
        BufferIntegerAsString(msgFmt, 0, get_num_seals(saveData), 4, STRCONVMODE_LEFT_ALIGN, TRUE);
    } else if (itemId == ITEM_FASHION_CASE) {
        fmtStr = NewString_ReadMsgData(msgData, 96);
        BufferIntegerAsString(msgFmt, 0, get_num_fashion_accessories(saveData), 3, STRCONVMODE_LEFT_ALIGN, TRUE);
        BufferIntegerAsString(msgFmt, 1, get_num_fashion_backgrounds(saveData), 2, STRCONVMODE_LEFT_ALIGN, TRUE);
    } else if (itemId == ITEM_COIN_CASE) {
        fmtStr = NewString_ReadMsgData(msgData, 58);
        BufferIntegerAsString(msgFmt, 0, get_num_coins(saveData), 5, STRCONVMODE_LEFT_ALIGN, TRUE);
    } else {
        ScrStrBufs_delete(msgFmt);
        DestroyMsgData(msgData);
        return FALSE;
    }
    StringExpandPlaceholders(msgFmt, dest, fmtStr);
    String_dtor(fmtStr);
    ScrStrBufs_delete(msgFmt);
    DestroyMsgData(msgData);
    return TRUE;
}

void GetItemUseErrorMessage(PLAYERDATA *playerData, STRING *dest, u16 itemId, enum ItemUseError code, u32 heap_id) {
#pragma unused(itemId)
    MSGDATA *msgData;
    switch (code) {
    case ITEMUSEERROR_NODISMOUNT:
        // You can't dismount your Bike here.
        msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_00000010_bin, heap_id);
        ReadMsgDataIntoString(msgData, 57, dest);
        DestroyMsgData(msgData);
        break;
    case ITEMUSEERROR_NOFOLLOWER:
        // Can't be used when you have someone with you!
        msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_00000010_bin, heap_id);
        ReadMsgDataIntoString(msgData, 118, dest);
        DestroyMsgData(msgData);
        break;
    case ITEMUSEERROR_NOTNOW:
        // You can't be doing that now!
        msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_00000010_bin, heap_id);
        ReadMsgDataIntoString(msgData, 119, dest);
        DestroyMsgData(msgData);
        break;
    default:
    {
        // {PLAYER}! This isn't the time to use that!
        MSGFMT *msgFmt;
        STRING *string;

        msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_00000040_bin, heap_id);
        msgFmt = ScrStrBufs_new(heap_id);
        string = NewString_ReadMsgData(msgData, 37);
        BufferPlayersName(msgFmt, 0, playerData);
        StringExpandPlaceholders(msgFmt, dest, string);
        String_dtor(string);
        ScrStrBufs_delete(msgFmt);
        DestroyMsgData(msgData);
    }
        break;
    }
}
