#include "bag.h"
#include "global.h"
#include "party_menu_items.h"
#include "msgdata/msg/msg_0300.h"
#include "party_context_menu.h"
#include "party_menu_sprites.h"
#include "text.h"
#include "unk_02005D10.h"
#include "unk_02088288.h"
#include "use_item_on_mon.h"

typedef enum PartyMenuItemType {
    PARTY_MENU_ITEM_TYPE_BATTLE_STAT_STAGES,
    PARTY_MENU_ITEM_TYPE_REVIVE_ALL,
    PARTY_MENU_ITEM_TYPE_LEVEL_UP,
    PARTY_MENU_ITEM_TYPE_SLP_HEAL,
    PARTY_MENU_ITEM_TYPE_PSN_HEAL,
    PARTY_MENU_ITEM_TYPE_BRN_HEAL,
    PARTY_MENU_ITEM_TYPE_FRZ_HEAL,
    PARTY_MENU_ITEM_TYPE_PRZ_HEAL,
    PARTY_MENU_ITEM_TYPE_CFS_HEAL,
    PARTY_MENU_ITEM_TYPE_FULL_HEAL,
    PARTY_MENU_ITEM_TYPE_INF_HEAL,
    PARTY_MENU_ITEM_TYPE_HP_RESTORE,
    PARTY_MENU_ITEM_TYPE_HP_EV_UP,
    PARTY_MENU_ITEM_TYPE_ATK_EV_UP,
    PARTY_MENU_ITEM_TYPE_DEF_EV_UP,
    PARTY_MENU_ITEM_TYPE_SPEED_EV_UP,
    PARTY_MENU_ITEM_TYPE_SPATK_EV_UP,
    PARTY_MENU_ITEM_TYPE_SPDEF_EV_UP,
    PARTY_MENU_ITEM_TYPE_HP_EV_DOWN,
    PARTY_MENU_ITEM_TYPE_ATK_EV_DOWN,
    PARTY_MENU_ITEM_TYPE_DEF_EV_DOWN,
    PARTY_MENU_ITEM_TYPE_SPEED_EV_DOWN,
    PARTY_MENU_ITEM_TYPE_SPATK_EV_DOWN,
    PARTY_MENU_ITEM_TYPE_SPDEF_EV_DOWN,
    PARTY_MENU_ITEM_TYPE_EVOLVE,
    PARTY_MENU_ITEM_TYPE_PP_UP,
    PARTY_MENU_ITEM_TYPE_PP_MAX,
    PARTY_MENU_ITEM_TYPE_PP_RESTORE,
    PARTY_MENU_ITEM_TYPE_OTHER,
} PartyMenuItemType;

PartyMenuItemType sub_02080BB4(u16 itemId);
void sub_02080E9C(PartyMenuStruct *partyMenu, u16 itemId, int a2);
int sub_020813A4(PartyMenuStruct *partyMenu);
int sub_02081444(PartyMenuStruct *partyMenu);
int sub_020815E4(PartyMenuStruct *partyMenu);
int sub_02081720(PartyMenuStruct *partyMenu);
u8 sub_020817DC(PartyMenuStruct *partyMenu, u8 a1);
int sub_02081A74(PartyMenuStruct *partyMenu);
int sub_02081C50(PartyMenuStruct *partyMenu);
u16 sub_020828EC(PartyMenuStruct *partyMenu);

PartyMenuItemType sub_02080BB4(u16 itemId) {
    int param;
    ItemData *itemData = LoadItemDataOrGfx(itemId, ITEMNARC_PARAM, HEAP_ID_PARTY_MENU);
    if (GetItemAttr_PreloadedItemData(itemData, ITEMATTR_PARTY_USE) != TRUE) {
        FreeToHeap(itemData);
        return PARTY_MENU_ITEM_TYPE_OTHER;
    }
    if (GetItemAttr_PreloadedItemData(itemData, ITEMATTR_ATK_STAGES) ||
        GetItemAttr_PreloadedItemData(itemData, ITEMATTR_DEF_STAGES) ||
        GetItemAttr_PreloadedItemData(itemData, ITEMATTR_SPATK_STAGES) ||
        GetItemAttr_PreloadedItemData(itemData, ITEMATTR_SPDEF_STAGES) ||
        GetItemAttr_PreloadedItemData(itemData, ITEMATTR_SPEED_STAGES) ||
        GetItemAttr_PreloadedItemData(itemData, ITEMATTR_ACCURACY_STAGES) ||
        GetItemAttr_PreloadedItemData(itemData, ITEMATTR_CRITRATE_STAGES)
    ) {
        FreeToHeap(itemData);
        return PARTY_MENU_ITEM_TYPE_BATTLE_STAT_STAGES;
    }
    if (GetItemAttr_PreloadedItemData(itemData, ITEMATTR_REVIVE_ALL)) {
        FreeToHeap(itemData);
        return PARTY_MENU_ITEM_TYPE_REVIVE_ALL;
    }
    if (GetItemAttr_PreloadedItemData(itemData, ITEMATTR_LEVEL_UP)) {
        FreeToHeap(itemData);
        return PARTY_MENU_ITEM_TYPE_LEVEL_UP;
    }

    param  = GetItemAttr_PreloadedItemData(itemData, ITEMATTR_SLP_HEAL) << 0;
    param += GetItemAttr_PreloadedItemData(itemData, ITEMATTR_PSN_HEAL) << 1;
    param += GetItemAttr_PreloadedItemData(itemData, ITEMATTR_BRN_HEAL) << 2;
    param += GetItemAttr_PreloadedItemData(itemData, ITEMATTR_FRZ_HEAL) << 3;
    param += GetItemAttr_PreloadedItemData(itemData, ITEMATTR_PRZ_HEAL) << 4;
    param += GetItemAttr_PreloadedItemData(itemData, ITEMATTR_CFS_HEAL) << 5;

    switch (param) {
    case 1:
        FreeToHeap(itemData);
        return PARTY_MENU_ITEM_TYPE_SLP_HEAL;
    case 2:
        FreeToHeap(itemData);
        return PARTY_MENU_ITEM_TYPE_PSN_HEAL;
    case 4:
        FreeToHeap(itemData);
        return PARTY_MENU_ITEM_TYPE_BRN_HEAL;
    case 8:
        FreeToHeap(itemData);
        return PARTY_MENU_ITEM_TYPE_FRZ_HEAL;
    case 16:
        FreeToHeap(itemData);
        return PARTY_MENU_ITEM_TYPE_PRZ_HEAL;
    case 32:
        FreeToHeap(itemData);
        return PARTY_MENU_ITEM_TYPE_CFS_HEAL;
    case 63:
        if (GetItemAttr_PreloadedItemData(itemData, ITEMATTR_HP_RESTORE)) {
            FreeToHeap(itemData);
            return PARTY_MENU_ITEM_TYPE_HP_RESTORE;
        } else {
            FreeToHeap(itemData);
            return PARTY_MENU_ITEM_TYPE_FULL_HEAL;
        }
    }

    if (GetItemAttr_PreloadedItemData(itemData, ITEMATTR_INF_HEAL)) {
        FreeToHeap(itemData);
        return PARTY_MENU_ITEM_TYPE_INF_HEAL;
    }
    if (GetItemAttr_PreloadedItemData(itemData, ITEMATTR_HP_RESTORE)) {
        FreeToHeap(itemData);
        return PARTY_MENU_ITEM_TYPE_HP_RESTORE;
    }

    param = GetItemAttr_PreloadedItemData(itemData, ITEMATTR_HP_EV_UP_PARAM);
    if (param > 0) {
        FreeToHeap(itemData);
        return PARTY_MENU_ITEM_TYPE_HP_EV_UP;
    } else if (param < 0) {
        FreeToHeap(itemData);
        return PARTY_MENU_ITEM_TYPE_HP_EV_DOWN;
    }

    param = GetItemAttr_PreloadedItemData(itemData, ITEMATTR_ATK_EV_UP_PARAM);
    if (param > 0) {
        FreeToHeap(itemData);
        return PARTY_MENU_ITEM_TYPE_ATK_EV_UP;
    } else if (param < 0) {
        FreeToHeap(itemData);
        return PARTY_MENU_ITEM_TYPE_ATK_EV_DOWN;
    }

    param = GetItemAttr_PreloadedItemData(itemData, ITEMATTR_DEF_EV_UP_PARAM);
    if (param > 0) {
        FreeToHeap(itemData);
        return PARTY_MENU_ITEM_TYPE_DEF_EV_UP;
    } else if (param < 0) {
        FreeToHeap(itemData);
        return PARTY_MENU_ITEM_TYPE_DEF_EV_DOWN;
    }

    param = GetItemAttr_PreloadedItemData(itemData, ITEMATTR_SPEED_EV_UP_PARAM);
    if (param > 0) {
        FreeToHeap(itemData);
        return PARTY_MENU_ITEM_TYPE_SPEED_EV_UP;
    } else if (param < 0) {
        FreeToHeap(itemData);
        return PARTY_MENU_ITEM_TYPE_SPEED_EV_DOWN;
    }

    param = GetItemAttr_PreloadedItemData(itemData, ITEMATTR_SPATK_EV_UP_PARAM);
    if (param > 0) {
        FreeToHeap(itemData);
        return PARTY_MENU_ITEM_TYPE_SPATK_EV_UP;
    } else if (param < 0) {
        FreeToHeap(itemData);
        return PARTY_MENU_ITEM_TYPE_SPATK_EV_DOWN;
    }

    param = GetItemAttr_PreloadedItemData(itemData, ITEMATTR_SPDEF_EV_UP_PARAM);
    if (param > 0) {
        FreeToHeap(itemData);
        return PARTY_MENU_ITEM_TYPE_SPDEF_EV_UP;
    } else if (param < 0) {
        FreeToHeap(itemData);
        return PARTY_MENU_ITEM_TYPE_SPDEF_EV_DOWN;
    }

    if (GetItemAttr_PreloadedItemData(itemData, ITEMATTR_EVOLVE)) {
        FreeToHeap(itemData);
        return PARTY_MENU_ITEM_TYPE_EVOLVE;
    }
    if (GetItemAttr_PreloadedItemData(itemData, ITEMATTR_PP_UP)) {
        FreeToHeap(itemData);
        return PARTY_MENU_ITEM_TYPE_PP_UP;
    }
    if (GetItemAttr_PreloadedItemData(itemData, ITEMATTR_PP_MAX)) {
        FreeToHeap(itemData);
        return PARTY_MENU_ITEM_TYPE_PP_MAX;
    }
    if (
        GetItemAttr_PreloadedItemData(itemData, ITEMATTR_PP_RESTORE) ||
        GetItemAttr_PreloadedItemData(itemData, ITEMATTR_PP_RESTORE_ALL)
    ) {
        FreeToHeap(itemData);
        return PARTY_MENU_ITEM_TYPE_PP_RESTORE;
    }
    FreeToHeap(itemData);
    return PARTY_MENU_ITEM_TYPE_OTHER;
}

void sub_02080E9C(PartyMenuStruct *partyMenu, u16 itemId, int a2) {
    String *string;

    BufferBoxMonNickname(partyMenu->msgFormat, 0, Mon_GetBoxMon(Party_GetMonByIndex(partyMenu->args->party, partyMenu->partyMonIndex)));
    switch (sub_02080BB4(itemId)) {
    case PARTY_MENU_ITEM_TYPE_PSN_HEAL:
        string = NewString_ReadMsgData(partyMenu->msgData, msg_0300_00066);
        StringExpandPlaceholders(partyMenu->msgFormat, partyMenu->formattedStrBuf, string);
        String_Delete(string);
        break;
    case PARTY_MENU_ITEM_TYPE_SLP_HEAL:
        string = NewString_ReadMsgData(partyMenu->msgData, msg_0300_00092);
        StringExpandPlaceholders(partyMenu->msgFormat, partyMenu->formattedStrBuf, string);
        String_Delete(string);
        break;
    case PARTY_MENU_ITEM_TYPE_BRN_HEAL:
        string = NewString_ReadMsgData(partyMenu->msgData, msg_0300_00068);
        StringExpandPlaceholders(partyMenu->msgFormat, partyMenu->formattedStrBuf, string);
        String_Delete(string);
        break;
    case PARTY_MENU_ITEM_TYPE_FRZ_HEAL:
        string = NewString_ReadMsgData(partyMenu->msgData, msg_0300_00069);
        StringExpandPlaceholders(partyMenu->msgFormat, partyMenu->formattedStrBuf, string);
        String_Delete(string);
        break;
    case PARTY_MENU_ITEM_TYPE_PRZ_HEAL:
        string = NewString_ReadMsgData(partyMenu->msgData, msg_0300_00067);
        StringExpandPlaceholders(partyMenu->msgFormat, partyMenu->formattedStrBuf, string);
        String_Delete(string);
        break;
    case PARTY_MENU_ITEM_TYPE_CFS_HEAL:
        string = NewString_ReadMsgData(partyMenu->msgData, msg_0300_00074);
        StringExpandPlaceholders(partyMenu->msgFormat, partyMenu->formattedStrBuf, string);
        String_Delete(string);
        break;
    case PARTY_MENU_ITEM_TYPE_INF_HEAL:
        string = NewString_ReadMsgData(partyMenu->msgData, msg_0300_00075);
        StringExpandPlaceholders(partyMenu->msgFormat, partyMenu->formattedStrBuf, string);
        String_Delete(string);
        break;
    case PARTY_MENU_ITEM_TYPE_FULL_HEAL:
        string = NewString_ReadMsgData(partyMenu->msgData, msg_0300_00072);
        StringExpandPlaceholders(partyMenu->msgFormat, partyMenu->formattedStrBuf, string);
        String_Delete(string);
        break;
    case PARTY_MENU_ITEM_TYPE_HP_EV_UP:
        string = NewString_ReadMsgData(partyMenu->msgData, msg_0300_00076);
        BufferStatName(partyMenu->msgFormat, 1, STAT_HP);
        StringExpandPlaceholders(partyMenu->msgFormat, partyMenu->formattedStrBuf, string);
        String_Delete(string);
        break;
    case PARTY_MENU_ITEM_TYPE_ATK_EV_UP:
        string = NewString_ReadMsgData(partyMenu->msgData, msg_0300_00076);
        BufferStatName(partyMenu->msgFormat, 1, STAT_ATK);
        StringExpandPlaceholders(partyMenu->msgFormat, partyMenu->formattedStrBuf, string);
        String_Delete(string);
        break;
    case PARTY_MENU_ITEM_TYPE_DEF_EV_UP:
        string = NewString_ReadMsgData(partyMenu->msgData, msg_0300_00076);
        BufferStatName(partyMenu->msgFormat, 1, STAT_DEF);
        StringExpandPlaceholders(partyMenu->msgFormat, partyMenu->formattedStrBuf, string);
        String_Delete(string);
        break;
    case PARTY_MENU_ITEM_TYPE_SPEED_EV_UP:
        string = NewString_ReadMsgData(partyMenu->msgData, msg_0300_00076);
        BufferStatName(partyMenu->msgFormat, 1, STAT_SPEED);
        StringExpandPlaceholders(partyMenu->msgFormat, partyMenu->formattedStrBuf, string);
        String_Delete(string);
        break;
    case PARTY_MENU_ITEM_TYPE_SPATK_EV_UP:
        string = NewString_ReadMsgData(partyMenu->msgData, msg_0300_00076);
        BufferStatName(partyMenu->msgFormat, 1, STAT_SPATK);
        StringExpandPlaceholders(partyMenu->msgFormat, partyMenu->formattedStrBuf, string);
        String_Delete(string);
        break;
    case PARTY_MENU_ITEM_TYPE_SPDEF_EV_UP:
        string = NewString_ReadMsgData(partyMenu->msgData, msg_0300_00076);
        BufferStatName(partyMenu->msgFormat, 1, STAT_SPDEF);
        StringExpandPlaceholders(partyMenu->msgFormat, partyMenu->formattedStrBuf, string);
        String_Delete(string);
        break;
    case PARTY_MENU_ITEM_TYPE_HP_EV_DOWN:
        string = NewString_ReadMsgData(partyMenu->msgData, a2 + msg_0300_00104);
        BufferStatName(partyMenu->msgFormat, 1, STAT_HP);
        StringExpandPlaceholders(partyMenu->msgFormat, partyMenu->formattedStrBuf, string);
        String_Delete(string);
        break;
    case PARTY_MENU_ITEM_TYPE_ATK_EV_DOWN:
        string = NewString_ReadMsgData(partyMenu->msgData, a2 + msg_0300_00104);
        BufferStatName(partyMenu->msgFormat, 1, STAT_ATK);
        StringExpandPlaceholders(partyMenu->msgFormat, partyMenu->formattedStrBuf, string);
        String_Delete(string);
        break;
    case PARTY_MENU_ITEM_TYPE_DEF_EV_DOWN:
        string = NewString_ReadMsgData(partyMenu->msgData, a2 + msg_0300_00104);
        BufferStatName(partyMenu->msgFormat, 1, STAT_DEF);
        StringExpandPlaceholders(partyMenu->msgFormat, partyMenu->formattedStrBuf, string);
        String_Delete(string);
        break;
    case PARTY_MENU_ITEM_TYPE_SPEED_EV_DOWN:
        string = NewString_ReadMsgData(partyMenu->msgData, a2 + msg_0300_00104);
        BufferStatName(partyMenu->msgFormat, 1, STAT_SPEED);
        StringExpandPlaceholders(partyMenu->msgFormat, partyMenu->formattedStrBuf, string);
        String_Delete(string);
        break;
    case PARTY_MENU_ITEM_TYPE_SPATK_EV_DOWN:
        string = NewString_ReadMsgData(partyMenu->msgData, a2 + msg_0300_00104);
        BufferStatName(partyMenu->msgFormat, 1, STAT_SPATK);
        StringExpandPlaceholders(partyMenu->msgFormat, partyMenu->formattedStrBuf, string);
        String_Delete(string);
        break;
    case PARTY_MENU_ITEM_TYPE_SPDEF_EV_DOWN:
        string = NewString_ReadMsgData(partyMenu->msgData, a2 + msg_0300_00104);
        BufferStatName(partyMenu->msgFormat, 1, STAT_SPDEF);
        StringExpandPlaceholders(partyMenu->msgFormat, partyMenu->formattedStrBuf, string);
        String_Delete(string);
        break;
    case PARTY_MENU_ITEM_TYPE_PP_UP:
    case PARTY_MENU_ITEM_TYPE_PP_MAX:
        string = NewString_ReadMsgData(partyMenu->msgData, msg_0300_00073);
        BufferMoveName(partyMenu->msgFormat, 0, a2);
        StringExpandPlaceholders(partyMenu->msgFormat, partyMenu->formattedStrBuf, string);
        String_Delete(string);
        break;
    case PARTY_MENU_ITEM_TYPE_PP_RESTORE:
        ReadMsgDataIntoString(partyMenu->msgData, msg_0300_00070, partyMenu->formattedStrBuf);
        break;
    default:
        ReadMsgDataIntoString(partyMenu->msgData, msg_0300_00102, partyMenu->formattedStrBuf);
        break;
    }
}

void sub_020812E8(PartyMenuStruct *partyMenu) {
    switch (sub_02080BB4(partyMenu->args->itemId)) {
    case PARTY_MENU_ITEM_TYPE_BATTLE_STAT_STAGES:
    case PARTY_MENU_ITEM_TYPE_OTHER:
        break;
    case PARTY_MENU_ITEM_TYPE_REVIVE_ALL:
        break;
    case PARTY_MENU_ITEM_TYPE_LEVEL_UP:
        partyMenu->unk_C54 = sub_02081A74;
        break;
    case PARTY_MENU_ITEM_TYPE_SLP_HEAL:
    case PARTY_MENU_ITEM_TYPE_PSN_HEAL:
    case PARTY_MENU_ITEM_TYPE_BRN_HEAL:
    case PARTY_MENU_ITEM_TYPE_FRZ_HEAL:
    case PARTY_MENU_ITEM_TYPE_PRZ_HEAL:
    case PARTY_MENU_ITEM_TYPE_CFS_HEAL:
    case PARTY_MENU_ITEM_TYPE_FULL_HEAL:
    case PARTY_MENU_ITEM_TYPE_INF_HEAL:
    case PARTY_MENU_ITEM_TYPE_HP_EV_UP:
    case PARTY_MENU_ITEM_TYPE_ATK_EV_UP:
    case PARTY_MENU_ITEM_TYPE_DEF_EV_UP:
    case PARTY_MENU_ITEM_TYPE_SPEED_EV_UP:
    case PARTY_MENU_ITEM_TYPE_SPATK_EV_UP:
    case PARTY_MENU_ITEM_TYPE_SPDEF_EV_UP:
    case PARTY_MENU_ITEM_TYPE_PP_UP:
    case PARTY_MENU_ITEM_TYPE_PP_MAX:
    case PARTY_MENU_ITEM_TYPE_PP_RESTORE:
        partyMenu->unk_C54 = sub_020813A4;
        break;
    case PARTY_MENU_ITEM_TYPE_HP_EV_DOWN:
    case PARTY_MENU_ITEM_TYPE_ATK_EV_DOWN:
    case PARTY_MENU_ITEM_TYPE_DEF_EV_DOWN:
    case PARTY_MENU_ITEM_TYPE_SPEED_EV_DOWN:
    case PARTY_MENU_ITEM_TYPE_SPATK_EV_DOWN:
    case PARTY_MENU_ITEM_TYPE_SPDEF_EV_DOWN:
        partyMenu->unk_C54 = sub_02081444;
        break;
    case PARTY_MENU_ITEM_TYPE_HP_RESTORE:
        partyMenu->unk_C54 = sub_020815E4;
        break;
    }
}

int sub_02081378(PartyMenuStruct *partyMenu) {
    if (TextPrinterCheckActive(partyMenu->textPrinterId)) {
        return PARTY_MENU_STATE_5;
    } else {
        partyMenu->args->selectedAction = PARTY_MENU_ACTION_RETURN_0;
        return PARTY_MENU_STATE_BEGIN_EXIT;
    }
}

int sub_020813A4(PartyMenuStruct *partyMenu) {
    UseItemOnMonInParty(partyMenu->args->party, partyMenu->args->itemId, partyMenu->partyMonIndex, 0, sub_020828EC(partyMenu), HEAP_ID_PARTY_MENU);
    sub_02079E38(partyMenu, partyMenu->partyMonIndex);
    sub_0207D5DC(partyMenu, partyMenu->partyMonIndex);
    PartyMenu_CommitPartyMonPanelWindowsToVram_InVBlank(partyMenu, partyMenu->partyMonIndex);
    PartyMenu_DrawMonStatusIcon(partyMenu, partyMenu->partyMonIndex, partyMenu->monsDrawState[partyMenu->partyMonIndex].status);
    sub_02080E9C(partyMenu, partyMenu->args->itemId, 0);
    PartyMenu_PrintMessageOnWindow34(partyMenu, -1, TRUE);
    PlaySE(SEQ_SE_DP_KAIFUKU);
    partyMenu->unk_C54 = sub_02081378;
    return PARTY_MENU_STATE_5;
}

int sub_02081444(PartyMenuStruct *partyMenu) {
    Pokemon *mon = Party_GetMonByIndex(partyMenu->args->party, partyMenu->partyMonIndex);
    u8 hpEv = GetMonData(mon, MON_DATA_HP_EV, NULL);
    u8 atkEv = GetMonData(mon, MON_DATA_ATK_EV, NULL);
    u8 defEv = GetMonData(mon, MON_DATA_DEF_EV, NULL);
    u8 speedEv = GetMonData(mon, MON_DATA_SPEED_EV, NULL);
    u8 spAtkEv = GetMonData(mon, MON_DATA_SPATK_EV, NULL);
    u8 spDefEv = GetMonData(mon, MON_DATA_SPDEF_EV, NULL);
    u8 friendship = GetMonData(mon, MON_DATA_FRIENDSHIP, NULL);
    UseItemOnMonInParty(partyMenu->args->party, partyMenu->args->itemId, partyMenu->partyMonIndex, 0, sub_020828EC(partyMenu), HEAP_ID_PARTY_MENU);
    sub_02079E38(partyMenu, partyMenu->partyMonIndex);
    sub_0207D5DC(partyMenu, partyMenu->partyMonIndex);
    PartyMenu_CommitPartyMonPanelWindowsToVram_InVBlank(partyMenu, partyMenu->partyMonIndex);
    PartyMenu_DrawMonStatusIcon(partyMenu, partyMenu->partyMonIndex, partyMenu->monsDrawState[partyMenu->partyMonIndex].status);
    if (
        hpEv != GetMonData(mon, MON_DATA_HP_EV, NULL) ||
        atkEv != GetMonData(mon, MON_DATA_ATK_EV, NULL) ||
        defEv != GetMonData(mon, MON_DATA_DEF_EV, NULL) ||
        speedEv != GetMonData(mon, MON_DATA_SPEED_EV, NULL) ||
        spAtkEv != GetMonData(mon, MON_DATA_SPATK_EV, NULL) ||
        spDefEv != GetMonData(mon, MON_DATA_SPDEF_EV, NULL)
    ) {
        if (friendship != GetMonData(mon, MON_DATA_FRIENDSHIP, NULL)) {
            sub_02080E9C(partyMenu, partyMenu->args->itemId, 0);
        } else {
            sub_02080E9C(partyMenu, partyMenu->args->itemId, 1);
        }
    } else {
        sub_02080E9C(partyMenu, partyMenu->args->itemId, 2);
    }
    PartyMenu_PrintMessageOnWindow34(partyMenu, -1, TRUE);
    partyMenu->unk_C54 = sub_02081378;
    return PARTY_MENU_STATE_5;
}

int sub_020815E4(PartyMenuStruct *partyMenu) {
    UseItemOnMonInParty(partyMenu->args->party, partyMenu->args->itemId, partyMenu->partyMonIndex, 0, sub_020828EC(partyMenu), HEAP_ID_PARTY_MENU);
    Pokemon *mon = Party_GetMonByIndex(partyMenu->args->party, partyMenu->partyMonIndex);
    int hp = GetMonData(mon, MON_DATA_HP, NULL);
    String *string;
    if (partyMenu->monsDrawState[partyMenu->partyMonIndex].hp == 0) {
        string = NewString_ReadMsgData(partyMenu->msgData, msg_0300_00071);
    } else if (partyMenu->monsDrawState[partyMenu->partyMonIndex].hp == hp) {
        string = NewString_ReadMsgData(partyMenu->msgData, msg_0300_00072);
    } else {
        string = NewString_ReadMsgData(partyMenu->msgData, msg_0300_00065);
    }
    BufferBoxMonNickname(partyMenu->msgFormat, 0, Mon_GetBoxMon(mon));BufferIntegerAsString(partyMenu->msgFormat, 1, hp - partyMenu->monsDrawState[partyMenu->partyMonIndex].hp, 3, PRINTING_MODE_LEFT_ALIGN, TRUE);
    StringExpandPlaceholders(partyMenu->msgFormat, partyMenu->formattedStrBuf, string);
    String_Delete(string);
    int statusIcon = Pokemon_GetStatusIconId(mon);
    PartyMenu_DrawMonStatusIcon(partyMenu, partyMenu->partyMonIndex, statusIcon);
    if (statusIcon == PARTY_MON_STATUS_ICON_OK) {
        partyMenu->monsDrawState[partyMenu->partyMonIndex].status = PARTY_MON_STATUS_ICON_OK;
        PartyMenu_PrintMonLevelOnWindow(partyMenu, partyMenu->partyMonIndex);
    }
    sub_0207A7F4(partyMenu, partyMenu->partyMonIndex);
    partyMenu->unk_C54 = sub_02081720;
    PlaySE(SEQ_SE_DP_KAIFUKU);
    return PARTY_MENU_STATE_5;
}

int sub_02081720(PartyMenuStruct *partyMenu) {
    int hp = GetMonData(Party_GetMonByIndex(partyMenu->args->party, partyMenu->partyMonIndex), MON_DATA_HP, NULL);
    // Hook: Speed up HP restore here
    // This currently animates 1 HP per frame
    if (hp != partyMenu->monsDrawState[partyMenu->partyMonIndex].hp) {
        ++partyMenu->monsDrawState[partyMenu->partyMonIndex].hp;
    }
    PartyMenu_ClearMonHpTextWindow(partyMenu, partyMenu->partyMonIndex);
    FillWindowPixelBuffer(&partyMenu->windows[PARTY_MENU_WINDOW_ID_MON1_HPBAR + partyMenu->partyMonIndex * 5], 0);
    PartyMenu_PrintMonCurHpOnWindow(partyMenu, partyMenu->partyMonIndex);
    PartyMenu_DrawMonHpBarOnWindow(partyMenu, partyMenu->partyMonIndex);
    if (hp == partyMenu->monsDrawState[partyMenu->partyMonIndex].hp) {
        PartyMenu_PrintMessageOnWindow34(partyMenu, -1, TRUE);
        partyMenu->unk_C54 = sub_02081378;
    }
    return PARTY_MENU_STATE_5;
}

BOOL sub_020817C4(u16 itemId) {
    return !!GetItemAttr(itemId, ITEMATTR_REVIVE_ALL, HEAP_ID_PARTY_MENU);
}

u8 sub_020817DC(PartyMenuStruct *partyMenu, u8 a1) {
    if (a1 >= 6) {
        return 0xFF;
    }
    for (; a1 < 6; ++a1) {
        if (partyMenu->monsDrawState[a1].active && partyMenu->monsDrawState[a1].hp == 0) {
            return a1;
        }
    }

    return 0xFF;
}

int PartyMenu_Subtask_SacredAsh(PartyMenuStruct *partyMenu) {
    Pokemon *mon;
    String *string;
    int hp;

    switch (partyMenu->afterTextPrinterState) {
    case 0:
        partyMenu->partyMonIndex = sub_020817DC(partyMenu, 0);
        if (partyMenu->partyMonIndex == 0xFF) {
            ReadMsgDataIntoString(partyMenu->msgData, msg_0300_00102, partyMenu->formattedStrBuf);
            PartyMenu_PrintMessageOnWindow34(partyMenu, -1, TRUE);
            partyMenu->unk_C54 = sub_02081378;
            sub_0207F240(partyMenu, 0, 1);
            partyMenu->partyMonIndex = 7;
            return PARTY_MENU_STATE_5;
        } else if (partyMenu->partyMonIndex != 0) {
            sub_0207A7F4(partyMenu, 0);
        }
        // fallthrough
    case 1:
        mon = Party_GetMonByIndex(partyMenu->args->party, partyMenu->partyMonIndex);
        UseItemOnPokemon(mon, partyMenu->args->itemId, 0, sub_020828EC(partyMenu), HEAP_ID_PARTY_MENU);
        hp = GetMonData(mon, MON_DATA_HP, NULL);
        string = NewString_ReadMsgData(partyMenu->msgData, msg_0300_00071);
        BufferBoxMonNickname(partyMenu->msgFormat, 0, Mon_GetBoxMon(mon));
        StringExpandPlaceholders(partyMenu->msgFormat, partyMenu->formattedStrBuf, string);
        String_Delete(string);
        partyMenu->monsDrawState[partyMenu->partyMonIndex].status = PARTY_MON_STATUS_ICON_OK;
        PartyMenu_DrawMonStatusIcon(partyMenu, partyMenu->partyMonIndex, partyMenu->monsDrawState[partyMenu->partyMonIndex].status);
        PartyMenu_PrintMonLevelOnWindow(partyMenu, partyMenu->partyMonIndex);
        sub_0207A7F4(partyMenu, partyMenu->partyMonIndex);
        sub_0207F240(partyMenu, partyMenu->partyMonIndex, 1);
        PlaySE(SEQ_SE_DP_KAIFUKU);
        ++partyMenu->afterTextPrinterState;
        break;
    case 2:
        mon = Party_GetMonByIndex(partyMenu->args->party, partyMenu->partyMonIndex);
        hp = GetMonData(mon, MON_DATA_HP, NULL);
        ++partyMenu->monsDrawState[partyMenu->partyMonIndex].hp;
        PartyMenu_ClearMonHpTextWindow(partyMenu, partyMenu->partyMonIndex);
        FillWindowPixelBuffer(&partyMenu->windows[PARTY_MENU_WINDOW_ID_MON1_HPBAR + 5 * partyMenu->partyMonIndex], 0);PartyMenu_PrintMonCurHpOnWindow(partyMenu, partyMenu->partyMonIndex);
        PartyMenu_DrawMonHpBarOnWindow(partyMenu, partyMenu->partyMonIndex);
        if (hp == partyMenu->monsDrawState[partyMenu->partyMonIndex].hp) {
            PartyMenu_PrintMessageOnWindow34(partyMenu, -1, TRUE);
            ++partyMenu->afterTextPrinterState;
        }
        break;
    case 3:
        if (!TextPrinterCheckActive(partyMenu->textPrinterId)) {
            u8 last = partyMenu->partyMonIndex;
            partyMenu->partyMonIndex = sub_020817DC(partyMenu, last + 1);
            if (partyMenu->partyMonIndex != 0xFF) {
                ClearFrameAndWindow2(&partyMenu->windows[PARTY_MENU_WINDOW_ID_34], FALSE);
                sub_0207A7F4(partyMenu, last);
                partyMenu->afterTextPrinterState = 1;
            } else {
                Bag_TakeItem(partyMenu->args->bag, partyMenu->args->itemId, 1, HEAP_ID_PARTY_MENU);
                partyMenu->args->selectedAction = PARTY_MENU_ACTION_RETURN_0;
                partyMenu->partyMonIndex = 7;
                return PARTY_MENU_STATE_BEGIN_EXIT;
            }
        }
    }

    return PARTY_MENU_STATE_SACRED_ASH;
}

int sub_02081A74(PartyMenuStruct *partyMenu) {
    Pokemon *mon = Party_GetMonByIndex(partyMenu->args->party, partyMenu->partyMonIndex);
    partyMenu->unk_C68[0] = GetMonData(mon, MON_DATA_MAXHP, NULL);
    partyMenu->unk_C68[1] = GetMonData(mon, MON_DATA_ATK, NULL);
    partyMenu->unk_C68[2] = GetMonData(mon, MON_DATA_DEF, NULL);
    partyMenu->unk_C68[3] = GetMonData(mon, MON_DATA_SPATK, NULL);
    partyMenu->unk_C68[4] = GetMonData(mon, MON_DATA_SPDEF, NULL);
    partyMenu->unk_C68[5] = GetMonData(mon, MON_DATA_SPEED, NULL);
    UseItemOnMonInParty(partyMenu->args->party, partyMenu->args->itemId, partyMenu->partyMonIndex, 0, sub_020828EC(partyMenu), HEAP_ID_PARTY_MENU);
    partyMenu->monsDrawState[partyMenu->partyMonIndex].level = GetMonData(mon, MON_DATA_LEVEL, NULL);
    partyMenu->monsDrawState[partyMenu->partyMonIndex].hp = GetMonData(mon, MON_DATA_HP, NULL);
    partyMenu->monsDrawState[partyMenu->partyMonIndex].maxHp = GetMonData(mon, MON_DATA_MAXHP, NULL);
    String *string = NewString_ReadMsgData(partyMenu->msgData, msg_0300_00177);
    BufferBoxMonNickname(partyMenu->msgFormat, 0, Mon_GetBoxMon(mon));
    BufferIntegerAsString(partyMenu->msgFormat, 1, partyMenu->monsDrawState[partyMenu->partyMonIndex].level, 3, PRINTING_MODE_LEFT_ALIGN, TRUE);
    StringExpandPlaceholders(partyMenu->msgFormat, partyMenu->formattedStrBuf, string);
    String_Delete(string);
    int statusIcon = Pokemon_GetStatusIconId(mon);
    PartyMenu_DrawMonStatusIcon(partyMenu, partyMenu->partyMonIndex, statusIcon);
    if (statusIcon == PARTY_MON_STATUS_ICON_OK) {
        partyMenu->monsDrawState[partyMenu->partyMonIndex].status = PARTY_MON_STATUS_ICON_OK;
        PartyMenu_PrintMonLevelOnWindow(partyMenu, partyMenu->partyMonIndex);
    }
    sub_0207A7F4(partyMenu, partyMenu->partyMonIndex);
    partyMenu->unk_C54 = sub_02081720;
    sub_0207D5DC(partyMenu, partyMenu->partyMonIndex);
    PartyMenu_CommitPartyMonPanelWindowsToVram_InVBlank(partyMenu, partyMenu->partyMonIndex);
    PartyMenu_PrintMessageOnWindow34(partyMenu, -1, TRUE);
    partyMenu->unk_C54 = sub_02081C50;
    partyMenu->unk_C67 = 0;
    return PARTY_MENU_STATE_5;
}
