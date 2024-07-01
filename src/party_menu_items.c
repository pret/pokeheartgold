#include "global.h"
#include "party_menu_items.h"
#include "msgdata/msg/msg_0300.h"
#include "party_context_menu.h"
#include "party_menu_sprites.h"
#include "text.h"
#include "unk_02005D10.h"
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
int sub_02081A74(PartyMenuStruct *partyMenu);
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
