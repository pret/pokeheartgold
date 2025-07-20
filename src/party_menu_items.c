#include "party_menu_items.h"

#include "global.h"

#include "constants/moves.h"

#include "msgdata/msg/msg_0300.h"

#include "bag.h"
#include "field_system.h"
#include "map_header.h"
#include "move.h"
#include "party_context_menu.h"
#include "party_menu_list_items.h"
#include "party_menu_sprites.h"
#include "pokemon_mood.h"
#include "system.h"
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

static PartyMenuItemType ItemId_GetPartyUseType(u16 itemId);
static void PartyMenu_GetItemUseMessage(PartyMenu *partyMenu, u16 itemId, int param);
static int PartyMenu_ItemUseFunc_StatusHealEtc(PartyMenu *partyMenu);
static int PartyMenu_ItemUseFunc_EVDown(PartyMenu *partyMenu);
static int PartyMenu_ItemUseFunc_HPRestore(PartyMenu *partyMenu);
static int PartyMenu_ItemUseFunc_HPRestoreAnimLoop(PartyMenu *partyMenu);
static u8 PartyMenu_SacredAshGetNextMonId(PartyMenu *partyMenu, u8 partySlot);
static int PartyMenu_ItemUseFunc_LevelUp(PartyMenu *partyMenu);
static int PartyMenu_ItemUseFunc_LevelUpLearnMovesLoop(PartyMenu *partyMenu);
static int PartyMenu_ItemUseFunc_LevelUpPromptForgetMove(PartyMenu *partyMenu);
static int PartyMenu_ItemUseFunc_LevelUpAskStopTryingToLearn(PartyMenu *partyMenu);
static int PartyMenu_ItemUseFunc_LevelUpDidNotLearnMove(PartyMenu *partyMenu);
static int PartyMenu_ItemUseFunc_LevelUpAskAgainToForget(PartyMenu *partyMenu);
static int PartyMenu_ItemUseFunc_TMHMPromptForgetMove(PartyMenu *partyMenu);
static int PartyMenu_ItemUseFunc_TMHMAskStopTryingToLearn(PartyMenu *partyMenu);
static int PartyMenu_ItemUseFunc_TMHMDidNotLearnMove(PartyMenu *partyMenu);
static int PartyMenu_ItemUseFunc_TMHMAskAgainToForget(PartyMenu *partyMenu);
static void PartyMenu_LearnMoveToSlot(PartyMenu *partyMenu, Pokemon *mon, int moveIdx);
static u8 PartyMenu_AddMoveNameToList(PartyMenu *partyMenu, int moveIdx);
static u16 PartyMenu_GetCurrentMapSec(PartyMenu *partyMenu);

static PartyMenuItemType ItemId_GetPartyUseType(u16 itemId) {
    int param;
    ItemData *itemData = LoadItemDataOrGfx(itemId, ITEMNARC_PARAM, HEAP_ID_PARTY_MENU);
    if (GetItemAttr_PreloadedItemData(itemData, ITEMATTR_PARTY_USE) != TRUE) {
        Heap_Free(itemData);
        return PARTY_MENU_ITEM_TYPE_OTHER;
    }
    if (GetItemAttr_PreloadedItemData(itemData, ITEMATTR_ATK_STAGES) || GetItemAttr_PreloadedItemData(itemData, ITEMATTR_DEF_STAGES) || GetItemAttr_PreloadedItemData(itemData, ITEMATTR_SPATK_STAGES) || GetItemAttr_PreloadedItemData(itemData, ITEMATTR_SPDEF_STAGES) || GetItemAttr_PreloadedItemData(itemData, ITEMATTR_SPEED_STAGES) || GetItemAttr_PreloadedItemData(itemData, ITEMATTR_ACCURACY_STAGES) || GetItemAttr_PreloadedItemData(itemData, ITEMATTR_CRITRATE_STAGES)) {
        Heap_Free(itemData);
        return PARTY_MENU_ITEM_TYPE_BATTLE_STAT_STAGES;
    }
    if (GetItemAttr_PreloadedItemData(itemData, ITEMATTR_REVIVE_ALL)) {
        Heap_Free(itemData);
        return PARTY_MENU_ITEM_TYPE_REVIVE_ALL;
    }
    if (GetItemAttr_PreloadedItemData(itemData, ITEMATTR_LEVEL_UP)) {
        Heap_Free(itemData);
        return PARTY_MENU_ITEM_TYPE_LEVEL_UP;
    }

    param = GetItemAttr_PreloadedItemData(itemData, ITEMATTR_SLP_HEAL) << 0;
    param += GetItemAttr_PreloadedItemData(itemData, ITEMATTR_PSN_HEAL) << 1;
    param += GetItemAttr_PreloadedItemData(itemData, ITEMATTR_BRN_HEAL) << 2;
    param += GetItemAttr_PreloadedItemData(itemData, ITEMATTR_FRZ_HEAL) << 3;
    param += GetItemAttr_PreloadedItemData(itemData, ITEMATTR_PRZ_HEAL) << 4;
    param += GetItemAttr_PreloadedItemData(itemData, ITEMATTR_CFS_HEAL) << 5;

    switch (param) {
    case 1:
        Heap_Free(itemData);
        return PARTY_MENU_ITEM_TYPE_SLP_HEAL;
    case 2:
        Heap_Free(itemData);
        return PARTY_MENU_ITEM_TYPE_PSN_HEAL;
    case 4:
        Heap_Free(itemData);
        return PARTY_MENU_ITEM_TYPE_BRN_HEAL;
    case 8:
        Heap_Free(itemData);
        return PARTY_MENU_ITEM_TYPE_FRZ_HEAL;
    case 16:
        Heap_Free(itemData);
        return PARTY_MENU_ITEM_TYPE_PRZ_HEAL;
    case 32:
        Heap_Free(itemData);
        return PARTY_MENU_ITEM_TYPE_CFS_HEAL;
    case 63:
        if (GetItemAttr_PreloadedItemData(itemData, ITEMATTR_HP_RESTORE)) {
            Heap_Free(itemData);
            return PARTY_MENU_ITEM_TYPE_HP_RESTORE;
        } else {
            Heap_Free(itemData);
            return PARTY_MENU_ITEM_TYPE_FULL_HEAL;
        }
    }

    if (GetItemAttr_PreloadedItemData(itemData, ITEMATTR_INF_HEAL)) {
        Heap_Free(itemData);
        return PARTY_MENU_ITEM_TYPE_INF_HEAL;
    }
    if (GetItemAttr_PreloadedItemData(itemData, ITEMATTR_HP_RESTORE)) {
        Heap_Free(itemData);
        return PARTY_MENU_ITEM_TYPE_HP_RESTORE;
    }

    param = GetItemAttr_PreloadedItemData(itemData, ITEMATTR_HP_EV_UP_PARAM);
    if (param > 0) {
        Heap_Free(itemData);
        return PARTY_MENU_ITEM_TYPE_HP_EV_UP;
    } else if (param < 0) {
        Heap_Free(itemData);
        return PARTY_MENU_ITEM_TYPE_HP_EV_DOWN;
    }

    param = GetItemAttr_PreloadedItemData(itemData, ITEMATTR_ATK_EV_UP_PARAM);
    if (param > 0) {
        Heap_Free(itemData);
        return PARTY_MENU_ITEM_TYPE_ATK_EV_UP;
    } else if (param < 0) {
        Heap_Free(itemData);
        return PARTY_MENU_ITEM_TYPE_ATK_EV_DOWN;
    }

    param = GetItemAttr_PreloadedItemData(itemData, ITEMATTR_DEF_EV_UP_PARAM);
    if (param > 0) {
        Heap_Free(itemData);
        return PARTY_MENU_ITEM_TYPE_DEF_EV_UP;
    } else if (param < 0) {
        Heap_Free(itemData);
        return PARTY_MENU_ITEM_TYPE_DEF_EV_DOWN;
    }

    param = GetItemAttr_PreloadedItemData(itemData, ITEMATTR_SPEED_EV_UP_PARAM);
    if (param > 0) {
        Heap_Free(itemData);
        return PARTY_MENU_ITEM_TYPE_SPEED_EV_UP;
    } else if (param < 0) {
        Heap_Free(itemData);
        return PARTY_MENU_ITEM_TYPE_SPEED_EV_DOWN;
    }

    param = GetItemAttr_PreloadedItemData(itemData, ITEMATTR_SPATK_EV_UP_PARAM);
    if (param > 0) {
        Heap_Free(itemData);
        return PARTY_MENU_ITEM_TYPE_SPATK_EV_UP;
    } else if (param < 0) {
        Heap_Free(itemData);
        return PARTY_MENU_ITEM_TYPE_SPATK_EV_DOWN;
    }

    param = GetItemAttr_PreloadedItemData(itemData, ITEMATTR_SPDEF_EV_UP_PARAM);
    if (param > 0) {
        Heap_Free(itemData);
        return PARTY_MENU_ITEM_TYPE_SPDEF_EV_UP;
    } else if (param < 0) {
        Heap_Free(itemData);
        return PARTY_MENU_ITEM_TYPE_SPDEF_EV_DOWN;
    }

    if (GetItemAttr_PreloadedItemData(itemData, ITEMATTR_EVOLVE)) {
        Heap_Free(itemData);
        return PARTY_MENU_ITEM_TYPE_EVOLVE;
    }
    if (GetItemAttr_PreloadedItemData(itemData, ITEMATTR_PP_UP)) {
        Heap_Free(itemData);
        return PARTY_MENU_ITEM_TYPE_PP_UP;
    }
    if (GetItemAttr_PreloadedItemData(itemData, ITEMATTR_PP_MAX)) {
        Heap_Free(itemData);
        return PARTY_MENU_ITEM_TYPE_PP_MAX;
    }
    if (
        GetItemAttr_PreloadedItemData(itemData, ITEMATTR_PP_RESTORE) || GetItemAttr_PreloadedItemData(itemData, ITEMATTR_PP_RESTORE_ALL)) {
        Heap_Free(itemData);
        return PARTY_MENU_ITEM_TYPE_PP_RESTORE;
    }
    Heap_Free(itemData);
    return PARTY_MENU_ITEM_TYPE_OTHER;
}

static void PartyMenu_GetItemUseMessage(PartyMenu *partyMenu, u16 itemId, int param) {
    String *string;

    BufferBoxMonNickname(partyMenu->msgFormat, 0, Mon_GetBoxMon(Party_GetMonByIndex(partyMenu->args->party, partyMenu->partyMonIndex)));
    switch (ItemId_GetPartyUseType(itemId)) {
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
        string = NewString_ReadMsgData(partyMenu->msgData, param + msg_0300_00104);
        BufferStatName(partyMenu->msgFormat, 1, STAT_HP);
        StringExpandPlaceholders(partyMenu->msgFormat, partyMenu->formattedStrBuf, string);
        String_Delete(string);
        break;
    case PARTY_MENU_ITEM_TYPE_ATK_EV_DOWN:
        string = NewString_ReadMsgData(partyMenu->msgData, param + msg_0300_00104);
        BufferStatName(partyMenu->msgFormat, 1, STAT_ATK);
        StringExpandPlaceholders(partyMenu->msgFormat, partyMenu->formattedStrBuf, string);
        String_Delete(string);
        break;
    case PARTY_MENU_ITEM_TYPE_DEF_EV_DOWN:
        string = NewString_ReadMsgData(partyMenu->msgData, param + msg_0300_00104);
        BufferStatName(partyMenu->msgFormat, 1, STAT_DEF);
        StringExpandPlaceholders(partyMenu->msgFormat, partyMenu->formattedStrBuf, string);
        String_Delete(string);
        break;
    case PARTY_MENU_ITEM_TYPE_SPEED_EV_DOWN:
        string = NewString_ReadMsgData(partyMenu->msgData, param + msg_0300_00104);
        BufferStatName(partyMenu->msgFormat, 1, STAT_SPEED);
        StringExpandPlaceholders(partyMenu->msgFormat, partyMenu->formattedStrBuf, string);
        String_Delete(string);
        break;
    case PARTY_MENU_ITEM_TYPE_SPATK_EV_DOWN:
        string = NewString_ReadMsgData(partyMenu->msgData, param + msg_0300_00104);
        BufferStatName(partyMenu->msgFormat, 1, STAT_SPATK);
        StringExpandPlaceholders(partyMenu->msgFormat, partyMenu->formattedStrBuf, string);
        String_Delete(string);
        break;
    case PARTY_MENU_ITEM_TYPE_SPDEF_EV_DOWN:
        string = NewString_ReadMsgData(partyMenu->msgData, param + msg_0300_00104);
        BufferStatName(partyMenu->msgFormat, 1, STAT_SPDEF);
        StringExpandPlaceholders(partyMenu->msgFormat, partyMenu->formattedStrBuf, string);
        String_Delete(string);
        break;
    case PARTY_MENU_ITEM_TYPE_PP_UP:
    case PARTY_MENU_ITEM_TYPE_PP_MAX:
        string = NewString_ReadMsgData(partyMenu->msgData, msg_0300_00073);
        BufferMoveName(partyMenu->msgFormat, 0, param);
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

void PartyMenu_SetItemUseFuncFromBagSelection(PartyMenu *partyMenu) {
    switch (ItemId_GetPartyUseType(partyMenu->args->itemId)) {
    case PARTY_MENU_ITEM_TYPE_BATTLE_STAT_STAGES:
    case PARTY_MENU_ITEM_TYPE_OTHER:
        break;
    case PARTY_MENU_ITEM_TYPE_REVIVE_ALL:
        break;
    case PARTY_MENU_ITEM_TYPE_LEVEL_UP:
        partyMenu->itemUseCallback = PartyMenu_ItemUseFunc_LevelUp;
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
        partyMenu->itemUseCallback = PartyMenu_ItemUseFunc_StatusHealEtc;
        break;
    case PARTY_MENU_ITEM_TYPE_HP_EV_DOWN:
    case PARTY_MENU_ITEM_TYPE_ATK_EV_DOWN:
    case PARTY_MENU_ITEM_TYPE_DEF_EV_DOWN:
    case PARTY_MENU_ITEM_TYPE_SPEED_EV_DOWN:
    case PARTY_MENU_ITEM_TYPE_SPATK_EV_DOWN:
    case PARTY_MENU_ITEM_TYPE_SPDEF_EV_DOWN:
        partyMenu->itemUseCallback = PartyMenu_ItemUseFunc_EVDown;
        break;
    case PARTY_MENU_ITEM_TYPE_HP_RESTORE:
        partyMenu->itemUseCallback = PartyMenu_ItemUseFunc_HPRestore;
        break;
    }
}

int PartyMenu_ItemUseFunc_WaitTextPrinterThenExit(PartyMenu *partyMenu) {
    if (TextPrinterCheckActive(partyMenu->textPrinterId)) {
        return PARTY_MENU_STATE_ITEM_USE_CB;
    } else {
        partyMenu->args->selectedAction = PARTY_MENU_ACTION_RETURN_0;
        return PARTY_MENU_STATE_BEGIN_EXIT;
    }
}

static int PartyMenu_ItemUseFunc_StatusHealEtc(PartyMenu *partyMenu) {
    UseItemOnMonInParty(partyMenu->args->party, partyMenu->args->itemId, partyMenu->partyMonIndex, 0, PartyMenu_GetCurrentMapSec(partyMenu), HEAP_ID_PARTY_MENU);
    sub_02079E38(partyMenu, partyMenu->partyMonIndex);
    sub_0207D5DC(partyMenu, partyMenu->partyMonIndex);
    PartyMenu_CommitPartyMonPanelWindowsToVram_InVBlank(partyMenu, partyMenu->partyMonIndex);
    PartyMenu_DrawMonStatusIcon(partyMenu, partyMenu->partyMonIndex, partyMenu->monsDrawState[partyMenu->partyMonIndex].status);
    PartyMenu_GetItemUseMessage(partyMenu, partyMenu->args->itemId, 0);
    PartyMenu_PrintMessageOnWindow34(partyMenu, -1, TRUE);
    PlaySE(SEQ_SE_DP_KAIFUKU);
    partyMenu->itemUseCallback = PartyMenu_ItemUseFunc_WaitTextPrinterThenExit;
    return PARTY_MENU_STATE_ITEM_USE_CB;
}

static int PartyMenu_ItemUseFunc_EVDown(PartyMenu *partyMenu) {
    Pokemon *mon = Party_GetMonByIndex(partyMenu->args->party, partyMenu->partyMonIndex);
    u8 hpEv = GetMonData(mon, MON_DATA_HP_EV, NULL);
    u8 atkEv = GetMonData(mon, MON_DATA_ATK_EV, NULL);
    u8 defEv = GetMonData(mon, MON_DATA_DEF_EV, NULL);
    u8 speedEv = GetMonData(mon, MON_DATA_SPEED_EV, NULL);
    u8 spAtkEv = GetMonData(mon, MON_DATA_SPATK_EV, NULL);
    u8 spDefEv = GetMonData(mon, MON_DATA_SPDEF_EV, NULL);
    u8 friendship = GetMonData(mon, MON_DATA_FRIENDSHIP, NULL);
    UseItemOnMonInParty(partyMenu->args->party, partyMenu->args->itemId, partyMenu->partyMonIndex, 0, PartyMenu_GetCurrentMapSec(partyMenu), HEAP_ID_PARTY_MENU);
    sub_02079E38(partyMenu, partyMenu->partyMonIndex);
    sub_0207D5DC(partyMenu, partyMenu->partyMonIndex);
    PartyMenu_CommitPartyMonPanelWindowsToVram_InVBlank(partyMenu, partyMenu->partyMonIndex);
    PartyMenu_DrawMonStatusIcon(partyMenu, partyMenu->partyMonIndex, partyMenu->monsDrawState[partyMenu->partyMonIndex].status);
    if (
        hpEv != GetMonData(mon, MON_DATA_HP_EV, NULL) || atkEv != GetMonData(mon, MON_DATA_ATK_EV, NULL) || defEv != GetMonData(mon, MON_DATA_DEF_EV, NULL) || speedEv != GetMonData(mon, MON_DATA_SPEED_EV, NULL) || spAtkEv != GetMonData(mon, MON_DATA_SPATK_EV, NULL) || spDefEv != GetMonData(mon, MON_DATA_SPDEF_EV, NULL)) {
        if (friendship != GetMonData(mon, MON_DATA_FRIENDSHIP, NULL)) {
            PartyMenu_GetItemUseMessage(partyMenu, partyMenu->args->itemId, 0);
        } else {
            PartyMenu_GetItemUseMessage(partyMenu, partyMenu->args->itemId, 1);
        }
    } else {
        PartyMenu_GetItemUseMessage(partyMenu, partyMenu->args->itemId, 2);
    }
    PartyMenu_PrintMessageOnWindow34(partyMenu, -1, TRUE);
    partyMenu->itemUseCallback = PartyMenu_ItemUseFunc_WaitTextPrinterThenExit;
    return PARTY_MENU_STATE_ITEM_USE_CB;
}

static int PartyMenu_ItemUseFunc_HPRestore(PartyMenu *partyMenu) {
    UseItemOnMonInParty(partyMenu->args->party, partyMenu->args->itemId, partyMenu->partyMonIndex, 0, PartyMenu_GetCurrentMapSec(partyMenu), HEAP_ID_PARTY_MENU);
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
    BufferBoxMonNickname(partyMenu->msgFormat, 0, Mon_GetBoxMon(mon));
    BufferIntegerAsString(partyMenu->msgFormat, 1, hp - partyMenu->monsDrawState[partyMenu->partyMonIndex].hp, 3, PRINTING_MODE_LEFT_ALIGN, TRUE);
    StringExpandPlaceholders(partyMenu->msgFormat, partyMenu->formattedStrBuf, string);
    String_Delete(string);
    int statusIcon = Pokemon_GetStatusIconId(mon);
    PartyMenu_DrawMonStatusIcon(partyMenu, partyMenu->partyMonIndex, statusIcon);
    if (statusIcon == PARTY_MON_STATUS_ICON_OK) {
        partyMenu->monsDrawState[partyMenu->partyMonIndex].status = PARTY_MON_STATUS_ICON_OK;
        PartyMenu_PrintMonLevelOnWindow(partyMenu, partyMenu->partyMonIndex);
    }
    sub_0207A7F4(partyMenu, partyMenu->partyMonIndex);
    partyMenu->itemUseCallback = PartyMenu_ItemUseFunc_HPRestoreAnimLoop;
    PlaySE(SEQ_SE_DP_KAIFUKU);
    return PARTY_MENU_STATE_ITEM_USE_CB;
}

static int PartyMenu_ItemUseFunc_HPRestoreAnimLoop(PartyMenu *partyMenu) {
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
        partyMenu->itemUseCallback = PartyMenu_ItemUseFunc_WaitTextPrinterThenExit;
    }
    return PARTY_MENU_STATE_ITEM_USE_CB;
}

BOOL ItemId_IsReviveAll(u16 itemId) {
    return !!GetItemAttr(itemId, ITEMATTR_REVIVE_ALL, HEAP_ID_PARTY_MENU);
}

static u8 PartyMenu_SacredAshGetNextMonId(PartyMenu *partyMenu, u8 partySlot) {
    if (partySlot >= PARTY_SIZE) {
        return 0xFF;
    }
    for (; partySlot < 6; ++partySlot) {
        if (partyMenu->monsDrawState[partySlot].active && partyMenu->monsDrawState[partySlot].hp == 0) {
            return partySlot;
        }
    }

    return 0xFF;
}

int PartyMenu_Subtask_SacredAsh(PartyMenu *partyMenu) {
    Pokemon *mon;
    String *string;
    int hp;

    switch (partyMenu->afterTextPrinterState) {
    case 0:
        partyMenu->partyMonIndex = PartyMenu_SacredAshGetNextMonId(partyMenu, 0);
        if (partyMenu->partyMonIndex == 0xFF) {
            ReadMsgDataIntoString(partyMenu->msgData, msg_0300_00102, partyMenu->formattedStrBuf);
            PartyMenu_PrintMessageOnWindow34(partyMenu, -1, TRUE);
            partyMenu->itemUseCallback = PartyMenu_ItemUseFunc_WaitTextPrinterThenExit;
            sub_0207F240(partyMenu, 0, 1);
            partyMenu->partyMonIndex = 7;
            return PARTY_MENU_STATE_ITEM_USE_CB;
        } else if (partyMenu->partyMonIndex != 0) {
            sub_0207A7F4(partyMenu, 0);
        }
        // fallthrough
    case 1:
        mon = Party_GetMonByIndex(partyMenu->args->party, partyMenu->partyMonIndex);
        UseItemOnPokemon(mon, partyMenu->args->itemId, 0, PartyMenu_GetCurrentMapSec(partyMenu), HEAP_ID_PARTY_MENU);
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
        FillWindowPixelBuffer(&partyMenu->windows[PARTY_MENU_WINDOW_ID_MON1_HPBAR + 5 * partyMenu->partyMonIndex], 0);
        PartyMenu_PrintMonCurHpOnWindow(partyMenu, partyMenu->partyMonIndex);
        PartyMenu_DrawMonHpBarOnWindow(partyMenu, partyMenu->partyMonIndex);
        if (hp == partyMenu->monsDrawState[partyMenu->partyMonIndex].hp) {
            PartyMenu_PrintMessageOnWindow34(partyMenu, -1, TRUE);
            ++partyMenu->afterTextPrinterState;
        }
        break;
    case 3:
        if (!TextPrinterCheckActive(partyMenu->textPrinterId)) {
            u8 last = partyMenu->partyMonIndex;
            partyMenu->partyMonIndex = PartyMenu_SacredAshGetNextMonId(partyMenu, last + 1);
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

static int PartyMenu_ItemUseFunc_LevelUp(PartyMenu *partyMenu) {
    Pokemon *mon = Party_GetMonByIndex(partyMenu->args->party, partyMenu->partyMonIndex);
    partyMenu->levelUpStatsTmp[0] = GetMonData(mon, MON_DATA_MAXHP, NULL);
    partyMenu->levelUpStatsTmp[1] = GetMonData(mon, MON_DATA_ATK, NULL);
    partyMenu->levelUpStatsTmp[2] = GetMonData(mon, MON_DATA_DEF, NULL);
    partyMenu->levelUpStatsTmp[3] = GetMonData(mon, MON_DATA_SPATK, NULL);
    partyMenu->levelUpStatsTmp[4] = GetMonData(mon, MON_DATA_SPDEF, NULL);
    partyMenu->levelUpStatsTmp[5] = GetMonData(mon, MON_DATA_SPEED, NULL);
    UseItemOnMonInParty(partyMenu->args->party, partyMenu->args->itemId, partyMenu->partyMonIndex, 0, PartyMenu_GetCurrentMapSec(partyMenu), HEAP_ID_PARTY_MENU);
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
    partyMenu->itemUseCallback = PartyMenu_ItemUseFunc_HPRestoreAnimLoop;
    sub_0207D5DC(partyMenu, partyMenu->partyMonIndex);
    PartyMenu_CommitPartyMonPanelWindowsToVram_InVBlank(partyMenu, partyMenu->partyMonIndex);
    PartyMenu_PrintMessageOnWindow34(partyMenu, -1, TRUE);
    partyMenu->itemUseCallback = PartyMenu_ItemUseFunc_LevelUpLearnMovesLoop;
    partyMenu->levelUpLearnMovesLoopState = 0;
    return PARTY_MENU_STATE_ITEM_USE_CB;
}

static int PartyMenu_ItemUseFunc_LevelUpLearnMovesLoop(PartyMenu *partyMenu) {
    Pokemon *mon;
    String *string;
    int mapEvoMethod;

    switch (partyMenu->levelUpLearnMovesLoopState) {
    case 0:
        if (!TextPrinterCheckActive(partyMenu->textPrinterId)) {
            PartyMenu_LevelUpPrintStatsChange(partyMenu);
            partyMenu->levelUpLearnMovesLoopState = 1;
        }
        break;
    case 1:
        if ((gSystem.newKeys & (PAD_BUTTON_A | PAD_BUTTON_B)) || System_GetTouchNew() == TRUE) {
            PlaySE(SEQ_SE_DP_SELECT);
            sub_0207DF98(partyMenu);
            partyMenu->levelUpLearnMovesLoopState = 2;
        }
        break;
    case 2:
        if ((gSystem.newKeys & (PAD_BUTTON_A | PAD_BUTTON_B)) || System_GetTouchNew() == TRUE) {
            PlaySE(SEQ_SE_DP_SELECT);
            sub_0207E04C(partyMenu);
            partyMenu->levelUpLearnMovesLoopState = 3;
            partyMenu->args->levelUpMoveSearchState = 0;
        }
        break;
    case 3:
        mon = Party_GetMonByIndex(partyMenu->args->party, partyMenu->partyMonIndex);
        switch (MonTryLearnMoveOnLevelUp(mon, &partyMenu->args->levelUpMoveSearchState, &partyMenu->args->moveId)) {
        case MOVE_NONE:
            partyMenu->levelUpLearnMovesLoopState = 6;
            break;
        case MOVE_APPEND_KNOWN:
            break;
        case MOVE_APPEND_FULL:
            BufferBoxMonNickname(partyMenu->msgFormat, 0, Mon_GetBoxMon(mon));
            BufferMoveName(partyMenu->msgFormat, 1, partyMenu->args->moveId);
            string = NewString_ReadMsgData(partyMenu->msgData, msg_0300_00053);
            StringExpandPlaceholders(partyMenu->msgFormat, partyMenu->formattedStrBuf, string);
            String_Delete(string);
            PartyMenu_PrintMessageOnWindow34(partyMenu, -1, FALSE);
            partyMenu->yesCallback = PartyMenu_ItemUseFunc_LevelUpPromptForgetMove;
            partyMenu->noCallback = PartyMenu_ItemUseFunc_LevelUpAskStopTryingToLearn;
            partyMenu->afterTextPrinterState = PARTY_MENU_STATE_YES_NO_INIT;
            return PARTY_MENU_STATE_WAIT_TEXT_PRINTER;
        default:
            BufferBoxMonNickname(partyMenu->msgFormat, 0, Mon_GetBoxMon(mon));
            BufferMoveName(partyMenu->msgFormat, 1, partyMenu->args->moveId);
            string = NewString_ReadMsgData(partyMenu->msgData, msg_0300_00178);
            StringExpandPlaceholders(partyMenu->msgFormat, partyMenu->formattedStrBuf, string);
            String_Delete(string);
            PartyMenu_PrintMessageOnWindow34(partyMenu, -1, FALSE);
            partyMenu->levelUpLearnMovesLoopState = 4;
            break;
        }
        break;
    case 4:
        if (!TextPrinterCheckActive(partyMenu->textPrinterId)) {
            partyMenu->levelUpLearnMovesLoopState = 3;
        }
        break;
    case 5:
        mon = Party_GetMonByIndex(partyMenu->args->party, partyMenu->partyMonIndex);
        PartyMenu_LearnMoveToSlot(partyMenu, mon, partyMenu->args->selectedMoveIdx);
        string = NewString_ReadMsgData(partyMenu->msgData, msg_0300_00062);
        BufferMoveName(partyMenu->msgFormat, 1, partyMenu->args->moveId);
        StringExpandPlaceholders(partyMenu->msgFormat, partyMenu->formattedStrBuf, string);
        String_Delete(string);
        PartyMenu_PrintMessageOnWindow34(partyMenu, -1, FALSE);
        partyMenu->levelUpLearnMovesLoopState = 4;
        break;
    case 6:
        mon = Party_GetMonByIndex(partyMenu->args->party, partyMenu->partyMonIndex);
        mapEvoMethod = MapHeader_GetMapEvolutionMethod(partyMenu->args->fieldSystem->location->mapId);
        partyMenu->args->species = GetMonEvolution(partyMenu->args->party, mon, EVOCTX_LEVELUP, mapEvoMethod, &partyMenu->args->evoMethod);
        partyMenu->args->selectedAction = partyMenu->args->species != SPECIES_NONE ? PARTY_MENU_ACTION_RETURN_EVO_RARE_CANDY : PARTY_MENU_ACTION_RETURN_0;
        return PARTY_MENU_STATE_BEGIN_EXIT;
    }

    return PARTY_MENU_STATE_ITEM_USE_CB;
}

int PartyMenu_ItemUseFunc_LevelUpDoLearnMove(PartyMenu *partyMenu) {
    partyMenu->itemUseCallback = PartyMenu_ItemUseFunc_LevelUpLearnMovesLoop;
    partyMenu->levelUpLearnMovesLoopState = 3;
    Pokemon *mon = Party_GetMonByIndex(partyMenu->args->party, partyMenu->partyMonIndex);
    BufferBoxMonNickname(partyMenu->msgFormat, 0, Mon_GetBoxMon(mon));
    if (partyMenu->args->selectedMoveIdx == 4) {
        BufferMoveName(partyMenu->msgFormat, 1, partyMenu->args->moveId);
        return PartyMenu_ItemUseFunc_LevelUpAskStopTryingToLearn(partyMenu);
    } else {
        BufferMoveName(partyMenu->msgFormat, 1, GetMonData(mon, MON_DATA_MOVE1 + partyMenu->args->selectedMoveIdx, NULL));
        String *string = NewString_ReadMsgData(partyMenu->msgData, msg_0300_00061);
        StringExpandPlaceholders(partyMenu->msgFormat, partyMenu->formattedStrBuf, string);
        String_Delete(string);
        PartyMenu_PrintMessageOnWindow34(partyMenu, -1, TRUE);
        partyMenu->afterTextPrinterState = PARTY_MENU_STATE_ITEM_USE_CB;
        partyMenu->levelUpLearnMovesLoopState = 5;
        return PARTY_MENU_STATE_WAIT_TEXT_PRINTER;
    }
}

static int PartyMenu_ItemUseFunc_LevelUpPromptForgetMove(PartyMenu *partyMenu) {
    String *string = NewString_ReadMsgData(partyMenu->msgData, msg_0300_00060);
    StringExpandPlaceholders(partyMenu->msgFormat, partyMenu->formattedStrBuf, string);
    String_Delete(string);
    PartyMenu_PrintMessageOnWindow34(partyMenu, -1, FALSE);
    partyMenu->args->selectedAction = PARTY_MENU_ACTION_RETURN_5;
    partyMenu->afterTextPrinterState = PARTY_MENU_STATE_AFTER_MESSAGE_BEGIN_EXIT;
    return PARTY_MENU_STATE_WAIT_TEXT_PRINTER;
}

static int PartyMenu_ItemUseFunc_LevelUpAskStopTryingToLearn(PartyMenu *partyMenu) {
    String *string = NewString_ReadMsgData(partyMenu->msgData, msg_0300_00056);
    StringExpandPlaceholders(partyMenu->msgFormat, partyMenu->formattedStrBuf, string);
    String_Delete(string);
    PartyMenu_PrintMessageOnWindow34(partyMenu, -1, TRUE);
    partyMenu->yesCallback = PartyMenu_ItemUseFunc_LevelUpDidNotLearnMove;
    partyMenu->noCallback = PartyMenu_ItemUseFunc_LevelUpAskAgainToForget;
    partyMenu->afterTextPrinterState = PARTY_MENU_STATE_YES_NO_INIT;
    return PARTY_MENU_STATE_WAIT_TEXT_PRINTER;
}

static int PartyMenu_ItemUseFunc_LevelUpDidNotLearnMove(PartyMenu *partyMenu) {
    String *string = NewString_ReadMsgData(partyMenu->msgData, msg_0300_00059);
    StringExpandPlaceholders(partyMenu->msgFormat, partyMenu->formattedStrBuf, string);
    String_Delete(string);
    PartyMenu_PrintMessageOnWindow34(partyMenu, -1, FALSE);
    partyMenu->afterTextPrinterState = PARTY_MENU_STATE_ITEM_USE_CB;
    partyMenu->levelUpLearnMovesLoopState = 4;
    return PARTY_MENU_STATE_WAIT_TEXT_PRINTER;
}

static int PartyMenu_ItemUseFunc_LevelUpAskAgainToForget(PartyMenu *partyMenu) {
    String *string = NewString_ReadMsgData(partyMenu->msgData, msg_0300_00053);
    StringExpandPlaceholders(partyMenu->msgFormat, partyMenu->formattedStrBuf, string);
    String_Delete(string);
    PartyMenu_PrintMessageOnWindow34(partyMenu, -1, FALSE);
    partyMenu->yesCallback = PartyMenu_ItemUseFunc_LevelUpPromptForgetMove;
    partyMenu->noCallback = PartyMenu_ItemUseFunc_LevelUpAskStopTryingToLearn;
    partyMenu->afterTextPrinterState = PARTY_MENU_STATE_YES_NO_INIT;
    return PARTY_MENU_STATE_WAIT_TEXT_PRINTER;
}

u8 PartyMenu_CheckCanLearnTMHMMove(PartyMenu *partyMenu, Pokemon *mon) {
    u8 i;
    for (i = 0; i < MAX_MON_MOVES; ++i) {
        u16 move = GetMonData(mon, MON_DATA_MOVE1 + i, NULL);
        if (move == partyMenu->args->moveId) {
            return LEARN_MOVE_CHECK_KNOWN;
        }
        if (move == MOVE_NONE) {
            break;
        }
    }

    if (!GetMonTMHMCompat(mon, ItemToTMHMId(partyMenu->args->itemId))) {
        return LEARN_MOVE_CHECK_INCOMPAT;
    }

    if (i == MAX_MON_MOVES) {
        i = LEARN_MOVE_CHECK_FULL;
    }

    return i;
}

int PartyMenu_HandleUseTMHMonMon(PartyMenu *partyMenu) {
    Pokemon *mon = Party_GetMonByIndex(partyMenu->args->party, partyMenu->partyMonIndex);
    u32 response = PartyMenu_CheckCanLearnTMHMMove(partyMenu, mon);
    String *string;

    BufferBoxMonNickname(partyMenu->msgFormat, 0, Mon_GetBoxMon(mon));
    BufferMoveName(partyMenu->msgFormat, 1, partyMenu->args->moveId);
    switch (response) {
    case 0:
    case 1:
    case 2:
    case 3:
        PartyMenu_LearnMoveToSlot(partyMenu, mon, response);
        string = NewString_ReadMsgData(partyMenu->msgData, msg_0300_00062);
        StringExpandPlaceholders(partyMenu->msgFormat, partyMenu->formattedStrBuf, string);
        String_Delete(string);
        PartyMenu_PrintMessageOnWindow34(partyMenu, -1, TRUE);
        partyMenu->args->selectedAction = PARTY_MENU_ACTION_RETURN_0;
        partyMenu->afterTextPrinterState = PARTY_MENU_STATE_AFTER_MESSAGE_BEGIN_EXIT;
        break;
    case LEARN_MOVE_CHECK_KNOWN:
        string = NewString_ReadMsgData(partyMenu->msgData, msg_0300_00064);
        StringExpandPlaceholders(partyMenu->msgFormat, partyMenu->formattedStrBuf, string);
        String_Delete(string);
        PartyMenu_PrintMessageOnWindow34(partyMenu, -1, TRUE);
        partyMenu->args->selectedAction = PARTY_MENU_ACTION_RETURN_0;
        partyMenu->afterTextPrinterState = PARTY_MENU_STATE_AFTER_MESSAGE_BEGIN_EXIT;
        break;
    case LEARN_MOVE_CHECK_FULL:
        string = NewString_ReadMsgData(partyMenu->msgData, msg_0300_00053);
        StringExpandPlaceholders(partyMenu->msgFormat, partyMenu->formattedStrBuf, string);
        String_Delete(string);
        PartyMenu_PrintMessageOnWindow34(partyMenu, -1, TRUE);
        partyMenu->yesCallback = PartyMenu_ItemUseFunc_TMHMPromptForgetMove;
        partyMenu->noCallback = PartyMenu_ItemUseFunc_TMHMAskStopTryingToLearn;
        partyMenu->afterTextPrinterState = PARTY_MENU_STATE_YES_NO_INIT;
        break;
    case LEARN_MOVE_CHECK_INCOMPAT:
        string = NewString_ReadMsgData(partyMenu->msgData, msg_0300_00063);
        StringExpandPlaceholders(partyMenu->msgFormat, partyMenu->formattedStrBuf, string);
        String_Delete(string);
        PartyMenu_PrintMessageOnWindow34(partyMenu, -1, TRUE);
        partyMenu->args->selectedAction = PARTY_MENU_ACTION_RETURN_0;
        partyMenu->afterTextPrinterState = PARTY_MENU_STATE_AFTER_MESSAGE_BEGIN_EXIT;
        break;
    }
    return PARTY_MENU_STATE_WAIT_TEXT_PRINTER;
}

int PartyMenu_ItemUseFunc_TMHMDoLearnMove(PartyMenu *partyMenu) {
    Pokemon *mon = Party_GetMonByIndex(partyMenu->args->party, partyMenu->partyMonIndex);
    BufferBoxMonNickname(partyMenu->msgFormat, 0, Mon_GetBoxMon(mon));
    if (partyMenu->args->selectedMoveIdx == 4) {
        BufferMoveName(partyMenu->msgFormat, 1, partyMenu->args->moveId);
        return PartyMenu_ItemUseFunc_TMHMAskStopTryingToLearn(partyMenu);
    } else {
        BufferMoveName(partyMenu->msgFormat, 1, GetMonData(mon, MON_DATA_MOVE1 + partyMenu->args->selectedMoveIdx, NULL));
        String *string = NewString_ReadMsgData(partyMenu->msgData, msg_0300_00061);
        StringExpandPlaceholders(partyMenu->msgFormat, partyMenu->formattedStrBuf, string);
        String_Delete(string);
        PartyMenu_PrintMessageOnWindow34(partyMenu, -1, TRUE);
        partyMenu->afterTextPrinterState = PARTY_MENU_STATE_TMHM_LEARN_MOVE;
        return PARTY_MENU_STATE_WAIT_TEXT_PRINTER;
    }
}

int PartyMenu_Subtask_TMHMLearnMove(PartyMenu *partyMenu) {
    Pokemon *mon = Party_GetMonByIndex(partyMenu->args->party, partyMenu->partyMonIndex);
    PartyMenu_LearnMoveToSlot(partyMenu, mon, partyMenu->args->selectedMoveIdx);
    String *string = NewString_ReadMsgData(partyMenu->msgData, msg_0300_00062);
    BufferMoveName(partyMenu->msgFormat, 1, partyMenu->args->moveId);
    StringExpandPlaceholders(partyMenu->msgFormat, partyMenu->formattedStrBuf, string);
    String_Delete(string);
    PartyMenu_PrintMessageOnWindow34(partyMenu, -1, FALSE);
    partyMenu->args->selectedAction = PARTY_MENU_ACTION_RETURN_0;
    partyMenu->afterTextPrinterState = PARTY_MENU_STATE_AFTER_MESSAGE_BEGIN_EXIT;
    return PARTY_MENU_STATE_WAIT_TEXT_PRINTER;
}

static int PartyMenu_ItemUseFunc_TMHMPromptForgetMove(PartyMenu *partyMenu) {
    String *string = NewString_ReadMsgData(partyMenu->msgData, msg_0300_00060);
    StringExpandPlaceholders(partyMenu->msgFormat, partyMenu->formattedStrBuf, string);
    String_Delete(string);
    PartyMenu_PrintMessageOnWindow34(partyMenu, -1, FALSE);
    partyMenu->args->selectedAction = PARTY_MENU_ACTION_RETURN_4;
    partyMenu->afterTextPrinterState = PARTY_MENU_STATE_AFTER_MESSAGE_BEGIN_EXIT;
    return PARTY_MENU_STATE_WAIT_TEXT_PRINTER;
}

static int PartyMenu_ItemUseFunc_TMHMAskStopTryingToLearn(PartyMenu *partyMenu) {
    String *string = NewString_ReadMsgData(partyMenu->msgData, msg_0300_00056);
    StringExpandPlaceholders(partyMenu->msgFormat, partyMenu->formattedStrBuf, string);
    String_Delete(string);
    PartyMenu_PrintMessageOnWindow34(partyMenu, -1, TRUE);
    partyMenu->yesCallback = PartyMenu_ItemUseFunc_TMHMDidNotLearnMove;
    partyMenu->noCallback = PartyMenu_ItemUseFunc_TMHMAskAgainToForget;
    partyMenu->afterTextPrinterState = PARTY_MENU_STATE_YES_NO_INIT;
    return PARTY_MENU_STATE_WAIT_TEXT_PRINTER;
}

static int PartyMenu_ItemUseFunc_TMHMDidNotLearnMove(PartyMenu *partyMenu) {
    String *string = NewString_ReadMsgData(partyMenu->msgData, msg_0300_00059);
    StringExpandPlaceholders(partyMenu->msgFormat, partyMenu->formattedStrBuf, string);
    String_Delete(string);
    PartyMenu_PrintMessageOnWindow34(partyMenu, -1, FALSE);
    partyMenu->args->selectedAction = PARTY_MENU_ACTION_RETURN_0;
    partyMenu->afterTextPrinterState = PARTY_MENU_STATE_AFTER_MESSAGE_BEGIN_EXIT;
    return PARTY_MENU_STATE_WAIT_TEXT_PRINTER;
}

static int PartyMenu_ItemUseFunc_TMHMAskAgainToForget(PartyMenu *partyMenu) {
    String *string = NewString_ReadMsgData(partyMenu->msgData, msg_0300_00053);
    StringExpandPlaceholders(partyMenu->msgFormat, partyMenu->formattedStrBuf, string);
    String_Delete(string);
    PartyMenu_PrintMessageOnWindow34(partyMenu, -1, FALSE);
    partyMenu->yesCallback = PartyMenu_ItemUseFunc_TMHMPromptForgetMove;
    partyMenu->noCallback = PartyMenu_ItemUseFunc_TMHMAskStopTryingToLearn;
    partyMenu->afterTextPrinterState = PARTY_MENU_STATE_YES_NO_INIT;
    return PARTY_MENU_STATE_WAIT_TEXT_PRINTER;
}

void PartyMenu_LearnMoveToSlot(PartyMenu *partyMenu, Pokemon *mon, int moveIdx) {
    int data = partyMenu->args->moveId;
    SetMonData(mon, MON_DATA_MOVE1 + moveIdx, &data);
    data = 0;
    SetMonData(mon, MON_DATA_MOVE1PPUP + moveIdx, &data);
    data = GetMoveMaxPP(partyMenu->args->moveId, 0);
    SetMonData(mon, MON_DATA_MOVE1PP + moveIdx, &data);
    if (partyMenu->args->itemId != ITEM_NONE) {
        if (!MoveIsHM(partyMenu->args->moveId)) {
            Bag_TakeItem(partyMenu->args->bag, partyMenu->args->itemId, 1, HEAP_ID_PARTY_MENU);
        }
        MonApplyFriendshipMod(mon, FRIENDSHIP_EVENT_LEARN_TMHM, PartyMenu_GetCurrentMapSec(partyMenu));
        ApplyMonMoodModifier(mon, MON_MOOD_MODIFIER_LEARN_TMHM);
    }
}

u8 PartyMenu_AddMoveNameToList(PartyMenu *partyMenu, int moveIdx) {
    Pokemon *mon = Party_GetMonByIndex(partyMenu->args->party, partyMenu->partyMonIndex);
    u16 moveId = GetMonData(mon, MON_DATA_MOVE1 + moveIdx, NULL);
    String *string = NewString_ReadMsgData(partyMenu->msgData, msg_0300_00145 + moveIdx);
    BufferMoveName(partyMenu->msgFormat, 0, moveId);
    StringExpandPlaceholders(partyMenu->msgFormat, partyMenu->unformattedStrBuf, string);
    String_Delete(string);
    if (moveId == MOVE_NONE) {
        return FALSE;
    } else {
        ListMenuItems_AddItem(partyMenu->listMenuItems, partyMenu->unformattedStrBuf, moveIdx);
        return TRUE;
    }
}

void PartyMenu_SelectMoveForPpRestoreOrPpUp(PartyMenu *partyMenu, BOOL isPpRestore) {
    ClearFrameAndWindow2(&partyMenu->windows[PARTY_MENU_WINDOW_ID_32], TRUE);
    if (!isPpRestore) {
        PartyMenu_PrintMessageOnWindow33(partyMenu, msg_0300_00042, TRUE);
    } else {
        PartyMenu_PrintMessageOnWindow33(partyMenu, msg_0300_00041, TRUE);
    }
    partyMenu->listMenuItems = ListMenuItems_New(5, HEAP_ID_PARTY_MENU);
    u8 numItems = PartyMenu_AddMoveNameToList(partyMenu, 0);
    numItems += PartyMenu_AddMoveNameToList(partyMenu, 1);
    numItems += PartyMenu_AddMoveNameToList(partyMenu, 2);
    numItems += PartyMenu_AddMoveNameToList(partyMenu, 3);
    ListMenuItems_AddItem(partyMenu->listMenuItems, partyMenu->contextMenuStrings[PARTY_MON_CONTEXT_MENU_QUIT], GetPartyMenuContextMenuActionFunc(PARTY_MON_CONTEXT_MENU_QUIT));

    PartyMenuContextMenu contextMenu;
    contextMenu.items = partyMenu->listMenuItems;
    contextMenu.window = &partyMenu->windows[PARTY_MENU_WINDOW_ID_36];
    contextMenu.unk_08 = 0;
    contextMenu.unk_09 = 1;
    contextMenu.numItems = numItems + 1;
    contextMenu.unk_0B_0 = 0;
    contextMenu.unk_0B_4 = 0;
    contextMenu.scrollEnabled = 1;
    sub_0207E54C(partyMenu, contextMenu.numItems, 0, 1);
    partyMenu->contextMenuCursor = PartyMenu_CreateContextMenuCursor(partyMenu, &contextMenu, 0, HEAP_ID_PARTY_MENU, 1);
}

int PartyMenu_Subtask_SelectMove(PartyMenu *partyMenu) {
    u32 input = PartyMenu_HandleSubcontextMenuInput_TopLevel(partyMenu, partyMenu->contextMenuCursor);
    switch (input) {
    case LIST_CANCEL:
        ClearFrameAndWindow2(&partyMenu->windows[PARTY_MENU_WINDOW_ID_33], TRUE);
        sub_0200E5D4(&partyMenu->windows[PARTY_MENU_WINDOW_ID_36], TRUE);
        PartyMenu_DeleteContextMenuAndList(partyMenu);
        PartyMenu_DisableMainScreenBlend_AfterYesNo();
        PartyMenu_PrintMessageOnWindow32(partyMenu, msg_0300_00033, TRUE);
        thunk_Sprite_SetPaletteOverride(partyMenu->sprites[PARTY_MENU_SPRITE_ID_CURSOR], 0);
        return PARTY_MENU_STATE_USE_ITEM_SELECT_MON;
    default:
        ClearFrameAndWindow2(&partyMenu->windows[PARTY_MENU_WINDOW_ID_33], TRUE);
        sub_0200E5D4(&partyMenu->windows[PARTY_MENU_WINDOW_ID_36], TRUE);
        PartyMenu_DeleteContextMenuAndList(partyMenu);
        PartyMenu_DisableMainScreenBlend_AfterYesNo();
        if (UseItemOnMonInParty(partyMenu->args->party, partyMenu->args->itemId, partyMenu->partyMonIndex, input, PartyMenu_GetCurrentMapSec(partyMenu), HEAP_ID_PARTY_MENU) == TRUE) {
            Pokemon *mon = Party_GetMonByIndex(partyMenu->args->party, partyMenu->partyMonIndex);
            int moveId = GetMonData(mon, MON_DATA_MOVE1 + input, NULL);
            PartyMenu_GetItemUseMessage(partyMenu, partyMenu->args->itemId, moveId);
            Bag_TakeItem(partyMenu->args->bag, partyMenu->args->itemId, 1, HEAP_ID_PARTY_MENU);
            PlaySE(SEQ_SE_DP_KAIFUKU);
        } else {
            ReadMsgDataIntoString(partyMenu->msgData, msg_0300_00102, partyMenu->formattedStrBuf);
        }
        PartyMenu_PrintMessageOnWindow34(partyMenu, -1, TRUE);
        partyMenu->args->selectedAction = PARTY_MENU_ACTION_RETURN_0;
        partyMenu->afterTextPrinterState = PARTY_MENU_STATE_AFTER_MESSAGE_BEGIN_EXIT;
        return PARTY_MENU_STATE_WAIT_TEXT_PRINTER;
    case LIST_NOTHING_CHOSEN:
        return PARTY_MENU_STATE_SELECT_MOVE;
    }
}

void PartyMenu_HandleAttachMailFromMailbox(PartyMenu *partyMenu) {
    ClearFrameAndWindow2(&partyMenu->windows[PARTY_MENU_WINDOW_ID_32], TRUE);
    if (partyMenu->monsDrawState[partyMenu->partyMonIndex].heldItem == ITEM_NONE) {
        ReadMsgDataIntoString(partyMenu->msgData, msg_0300_00116, partyMenu->formattedStrBuf);
        PartyMenu_SetMonHeldMailIcon(partyMenu, partyMenu->partyMonIndex);
    } else {
        ReadMsgDataIntoString(partyMenu->msgData,
            msg_0300_00117,
            partyMenu->formattedStrBuf);
        partyMenu->partyMonIndex = 7;
    }
    PartyMenu_PrintMessageOnWindow34(partyMenu, -1, TRUE);
    partyMenu->args->selectedAction = PARTY_MENU_ACTION_RETURN_0;
    partyMenu->afterTextPrinterState = PARTY_MENU_STATE_AFTER_MESSAGE_BEGIN_EXIT;
}

static u16 PartyMenu_GetCurrentMapSec(PartyMenu *partyMenu) {
    int ret = MapHeader_GetMapSec(partyMenu->args->fieldSystem->location->mapId);
    return ret;
}
