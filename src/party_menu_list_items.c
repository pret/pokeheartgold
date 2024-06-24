#include "bag.h"
#include "global.h"
#include "party_menu_list_items.h"
#include "mail_misc.h"
#include "msgdata/msg/msg_0300.h"
#include "overlay_94.h"
#include "party_context_menu.h"
#include "party_menu_sprites.h"
#include "text.h"

void PartyMonContextMenuAction_Item(PartyMenuStruct *partyMenu, int *pState);
void PartyMonContextMenuAction_Give(PartyMenuStruct *partyMenu, int *pState);
void PartyMonContextMenuAction_Take(PartyMenuStruct *partyMenu, int *pState);
void PartyMonContextMenuAction_Mail(PartyMenuStruct *partyMenu, int *pState);
void PartyMonContextMenuAction_ReadMail(PartyMenuStruct *partyMenu, int *pState);
void PartyMonContextMenuAction_TakeMail(PartyMenuStruct *partyMenu, int *pState);
int PartyMenu_TakeMail_SendToPC(PartyMenuStruct *partyMenu);
int PartyMenu_TakeMail_DontSendToPC(PartyMenuStruct *partyMenu);
int PartyMenu_TakeMail_ReturnToBag(PartyMenuStruct *partyMenu);
int PartyMenu_TakeMail_DontReturnToBag(PartyMenuStruct *partyMenu);
void PartyMonContextMenuAction_Store(PartyMenuStruct *partyMenu, int *pState);
void PartyMonContextMenuAction_Switch(PartyMenuStruct *partyMenu, int *pState);
void PartyMonContextMenuAction_Enter(PartyMenuStruct *partyMenu, int *pState);
void PartyMonContextMenuAction_NoEntry(PartyMenuStruct *partyMenu, int *pState);
void PartyMonContextMenuAction_ContestEnter(PartyMenuStruct *partyMenu, int *pState);
void PartyMonContextMenuAction_Confirm(PartyMenuStruct *partyMenu, int *pState);
void PartyMonContextMenuAction_Summary(PartyMenuStruct *partyMenu, int *pState);
void PartyMonContextMenuAction_Set(PartyMenuStruct *partyMenu, int *pState);
void PartyMonContextMenuAction_Cut(PartyMenuStruct *partyMenu, int *pState);
void PartyMonContextMenuAction_RockSmash(PartyMenuStruct *partyMenu, int *pState);
void PartyMonContextMenuAction_Strength(PartyMenuStruct *partyMenu, int *pState);
void PartyMonContextMenuAction_Surf(PartyMenuStruct *partyMenu, int *pState);
void PartyMonContextMenuAction_RockClimb(PartyMenuStruct *partyMenu, int *pState);
void PartyMonContextMenuAction_Fly(PartyMenuStruct *partyMenu, int *pState);
void PartyMonContextMenuAction_Waterfall(PartyMenuStruct *partyMenu, int *pState);
void PartyMonContextMenuAction_Whirlpool(PartyMenuStruct *partyMenu, int *pState);
void PartyMonContextMenuAction_Flash(PartyMenuStruct *partyMenu, int *pState);
void PartyMonContextMenuAction_Teleport(PartyMenuStruct *partyMenu, int *pState);
void PartyMonContextMenuAction_Dig(PartyMenuStruct *partyMenu, int *pState);
void PartyMonContextMenuAction_SweetScent(PartyMenuStruct *partyMenu, int *pState);
void PartyMonContextMenuAction_Chatter(PartyMenuStruct *partyMenu, int *pState);
void PartyMonContextMenuAction_MilkDrink(PartyMenuStruct *partyMenu, int *pState);
void PartyMonContextMenuAction_Softboiled(PartyMenuStruct *partyMenu, int *pState);
void PartyMonContextMenuAction_Headbutt(PartyMenuStruct *partyMenu, int *pState);

static const u32 _02101CB8[] = {
    [PARTY_MON_CONTEXT_MENU_SWITCH]        = (u32)PartyMonContextMenuAction_Switch,
    [PARTY_MON_CONTEXT_MENU_SUMMARY]       = (u32)PartyMonContextMenuAction_Summary,
    [PARTY_MON_CONTEXT_MENU_ITEM]          = (u32)PartyMonContextMenuAction_Item,
    [PARTY_MON_CONTEXT_MENU_GIVE]          = (u32)PartyMonContextMenuAction_Give,
    [PARTY_MON_CONTEXT_MENU_TAKE]          = (u32)PartyMonContextMenuAction_Take,
    [PARTY_MON_CONTEXT_MENU_MAIL]          = (u32)PartyMonContextMenuAction_Mail,
    [PARTY_MON_CONTEXT_MENU_READ_MAIL]     = (u32)PartyMonContextMenuAction_ReadMail,
    [PARTY_MON_CONTEXT_MENU_TAKE_MAIL]     = (u32)PartyMonContextMenuAction_TakeMail,
    [PARTY_MON_CONTEXT_MENU_STORE]         = (u32)PartyMonContextMenuAction_Store,
    [PARTY_MON_CONTEXT_MENU_QUIT]          = LIST_CANCEL,
    [PARTY_MON_CONTEXT_MENU_UNUSED]        = LIST_CANCEL,
    [PARTY_MON_CONTEXT_MENU_ENTER]         = (u32)PartyMonContextMenuAction_Enter,
    [PARTY_MON_CONTEXT_MENU_NO_ENTRY]      = (u32)PartyMonContextMenuAction_NoEntry,
    [PARTY_MON_CONTEXT_MENU_CONTEST_ENTER] = (u32)PartyMonContextMenuAction_ContestEnter,
    [PARTY_MON_CONTEXT_MENU_SET]           = (u32)PartyMonContextMenuAction_Set,
    [PARTY_MON_CONTEXT_MENU_CONFIRM]       = (u32)PartyMonContextMenuAction_Confirm,
    [PARTY_MON_CONTEXT_MENU_CUT]           = (u32)PartyMonContextMenuAction_Cut,
    [PARTY_MON_CONTEXT_MENU_FLY]           = (u32)PartyMonContextMenuAction_Fly,
    [PARTY_MON_CONTEXT_MENU_SURF]          = (u32)PartyMonContextMenuAction_Surf,
    [PARTY_MON_CONTEXT_MENU_STRENGTH]      = (u32)PartyMonContextMenuAction_Strength,
    [PARTY_MON_CONTEXT_MENU_ROCK_SMASH]    = (u32)PartyMonContextMenuAction_RockSmash,
    [PARTY_MON_CONTEXT_MENU_WATERFALL]     = (u32)PartyMonContextMenuAction_Waterfall,
    [PARTY_MON_CONTEXT_MENU_ROCK_CLIMB]    = (u32)PartyMonContextMenuAction_RockClimb,
    [PARTY_MON_CONTEXT_MENU_WHIRLPOOL]     = (u32)PartyMonContextMenuAction_Whirlpool,
    [PARTY_MON_CONTEXT_MENU_FLASH]         = (u32)PartyMonContextMenuAction_Flash,
    [PARTY_MON_CONTEXT_MENU_TELEPORT]      = (u32)PartyMonContextMenuAction_Teleport,
    [PARTY_MON_CONTEXT_MENU_DIG]           = (u32)PartyMonContextMenuAction_Dig,
    [PARTY_MON_CONTEXT_MENU_SWEET_SCENT]   = (u32)PartyMonContextMenuAction_SweetScent,
    [PARTY_MON_CONTEXT_MENU_CHATTER]       = (u32)PartyMonContextMenuAction_Chatter,
    [PARTY_MON_CONTEXT_MENU_HEADBUTT]      = (u32)PartyMonContextMenuAction_Headbutt,
    [PARTY_MON_CONTEXT_MENU_MILK_DRINK]    = (u32)PartyMonContextMenuAction_MilkDrink,
    [PARTY_MON_CONTEXT_MENU_SOFTBOILED]    = (u32)PartyMonContextMenuAction_Softboiled,
    [PARTY_MON_CONTEXT_MENU_MAX]           = LIST_CANCEL,
};

u32 sub_0207F42C(int index) {
    return _02101CB8[index];
}

void PartyMonContextMenuAction_Item(PartyMenuStruct *partyMenu, int *pState) {
    sub_0207CB20(partyMenu);
    sub_0207DAD8(partyMenu, msg_0300_00039, FALSE);
    partyMenu->listMenuItems = ListMenuItems_New(3, HEAP_ID_PARTY_MENU);
    ListMenuItems_AddItem(partyMenu->listMenuItems, partyMenu->contextMenuStrings[PARTY_MON_CONTEXT_MENU_GIVE], sub_0207F42C(PARTY_MON_CONTEXT_MENU_GIVE));
    ListMenuItems_AddItem(partyMenu->listMenuItems, partyMenu->contextMenuStrings[PARTY_MON_CONTEXT_MENU_TAKE], sub_0207F42C(PARTY_MON_CONTEXT_MENU_TAKE));
    ListMenuItems_AddItem(partyMenu->listMenuItems, partyMenu->contextMenuStrings[PARTY_MON_CONTEXT_MENU_QUIT], sub_0207F42C(PARTY_MON_CONTEXT_MENU_QUIT));

    PartyMenuContextMenu template;

    template.items = partyMenu->listMenuItems;
    template.window = &partyMenu->windows[PARTY_MENU_WINDOW_ID_35];
    template.unk_08 = 0;
    template.unk_09 = 1;
    template.numItems = 3;
    template.unk_0B_0 = 0;
    template.unk_0B_4 = 0;
    template.scrollEnabled = FALSE;
    sub_0207E54C(partyMenu, template.numItems, 0, 1);
    partyMenu->contextMenuCursor = PartyMenu_CreateContextMenuCursor(partyMenu, &template, 0, HEAP_ID_PARTY_MENU, 1);
    *pState = PARTY_MENU_STATE_HANDLE_INPUT;
}

void PartyMonContextMenuAction_Give(PartyMenuStruct *partyMenu, int *pState) {
    sub_0207CB20(partyMenu);
    PartyMenu_DisableMainScreenBlend_AfterYesNo();
    partyMenu->args->selectedAction = PARTY_MENU_ACTION_RETURN_GIVE_ITEM;
    *pState = PARTY_MENU_STATE_BEGIN_EXIT;
}

void PartyMonContextMenuAction_Take(PartyMenuStruct *partyMenu, int *pState) {
    int newState = PARTY_MENU_STATE_17;
    Pokemon *mon;
    BOOL griseousOrbResult;

    sub_0200E5D4(&partyMenu->windows[PARTY_MENU_WINDOW_ID_35], TRUE);
    sub_0207CB20(partyMenu);
    PartyMenu_DisableMainScreenBlend_AfterYesNo();
    if (partyMenu->monsDrawState[partyMenu->partyMonIndex].heldItem == ITEM_NONE) {
        mon = Party_GetMonByIndex(partyMenu->args->party, partyMenu->partyMonIndex);
        ReadMsgDataIntoString(partyMenu->msgData, msg_0300_00082, partyMenu->unformattedStrBuf);
        BufferBoxMonNickname(partyMenu->msgFormat, 0, Mon_GetBoxMon(mon));
        StringExpandPlaceholders(partyMenu->msgFormat, partyMenu->formattedStrBuf, partyMenu->unformattedStrBuf);
    } else {
        if (Bag_AddItem(partyMenu->args->bag, partyMenu->monsDrawState[partyMenu->partyMonIndex].heldItem, 1, HEAP_ID_PARTY_MENU) == TRUE) {
            mon = Party_GetMonByIndex(partyMenu->args->party, partyMenu->partyMonIndex);
            u32 itemId = ITEM_NONE;
            SetMonData(mon, MON_DATA_HELD_ITEM, &itemId);
            Pokemon_UpdateArceusForm(mon);
            griseousOrbResult = Mon_UpdateGiratinaForm(mon);
            if (partyMenu->monsDrawState[partyMenu->partyMonIndex].heldItem == ITEM_GRISEOUS_ORB && griseousOrbResult == FALSE) {
                newState = PARTY_MENU_STATE_18;
            }
            ReadMsgDataIntoString(partyMenu->msgData, msg_0300_00083, partyMenu->unformattedStrBuf);
            BufferBoxMonNickname(partyMenu->msgFormat, 0, Mon_GetBoxMon(mon));
            BufferItemName(partyMenu->msgFormat, 1, partyMenu->monsDrawState[partyMenu->partyMonIndex].heldItem);
            StringExpandPlaceholders(partyMenu->msgFormat, partyMenu->formattedStrBuf, partyMenu->unformattedStrBuf);
            partyMenu->monsDrawState[partyMenu->partyMonIndex].heldItem = ITEM_NONE;
            sub_0207F004(partyMenu, partyMenu->partyMonIndex, partyMenu->monsDrawState[partyMenu->partyMonIndex].heldItem);
        } else {
            ReadMsgDataIntoString(partyMenu->msgData, msg_0300_00084, partyMenu->formattedStrBuf);
        }
    }
    DrawFrameAndWindow2(&partyMenu->windows[PARTY_MENU_WINDOW_ID_34], TRUE, 0x02A, 15);
    FillWindowPixelBuffer(&partyMenu->windows[PARTY_MENU_WINDOW_ID_34], 15);
    sub_0207DB30(partyMenu);
    *pState = newState;
}

int sub_0207F694(PartyMenuStruct *partyMenu) {
    if (!TextPrinterCheckActive(partyMenu->textPrinterId)) {
        ClearFrameAndWindow2(&partyMenu->windows[PARTY_MENU_WINDOW_ID_34], TRUE);
        sub_0207DAC4(partyMenu, msg_0300_00029, TRUE);
        thunk_Sprite_SetPalIndex(partyMenu->sprites[PARTY_MENU_SPRITE_ID_CURSOR], 0);
        sub_02079224(partyMenu, FALSE);
        G2_BlendNone();
        return PARTY_MENU_STATE_1;
    } else {
        return PARTY_MENU_STATE_17;
    }
}

int sub_0207F6E8(PartyMenuStruct *partyMenu) {
    if (!TextPrinterCheckActive(partyMenu->textPrinterId)) {
        ClearFrameAndWindow2(&partyMenu->windows[PARTY_MENU_WINDOW_ID_34], TRUE);
        PartyMenu_FormChangeScene_Begin(partyMenu);
        sub_02079224(partyMenu, FALSE);
        return PARTY_MENU_STATE_19;
    } else {
        return PARTY_MENU_STATE_18;
    }
}

int sub_0207F720(PartyMenuStruct *partyMenu) {
    if (PartyMenu_AnimateIconFormChange(partyMenu) == TRUE) {
        PartyMenu_FormChangeScene_End(partyMenu);
        return PARTY_MENU_STATE_17;
    } else {
        return PARTY_MENU_STATE_19;
    }
}

void PartyMonContextMenuAction_Mail(PartyMenuStruct *partyMenu, int *pState) {
    sub_0207CB20(partyMenu);
    sub_0207DAD8(partyMenu, msg_0300_00040, FALSE);
    partyMenu->listMenuItems = ListMenuItems_New(3, HEAP_ID_PARTY_MENU);
    ListMenuItems_AddItem(partyMenu->listMenuItems, partyMenu->contextMenuStrings[PARTY_MON_CONTEXT_MENU_READ_MAIL], sub_0207F42C(PARTY_MON_CONTEXT_MENU_READ_MAIL));
    ListMenuItems_AddItem(partyMenu->listMenuItems, partyMenu->contextMenuStrings[PARTY_MON_CONTEXT_MENU_TAKE_MAIL], sub_0207F42C(PARTY_MON_CONTEXT_MENU_TAKE_MAIL));
    ListMenuItems_AddItem(partyMenu->listMenuItems, partyMenu->contextMenuStrings[PARTY_MON_CONTEXT_MENU_QUIT], sub_0207F42C(PARTY_MON_CONTEXT_MENU_QUIT));

    PartyMenuContextMenu template;

    template.items = partyMenu->listMenuItems;
    template.window = &partyMenu->windows[PARTY_MENU_WINDOW_ID_35];
    template.unk_08 = 0;
    template.unk_09 = 1;
    template.numItems = 3;
    template.unk_0B_0 = 0;
    template.unk_0B_4 = 0;
    template.scrollEnabled = FALSE;
    sub_0207E54C(partyMenu, template.numItems, 0, 1);
    partyMenu->contextMenuCursor = PartyMenu_CreateContextMenuCursor(partyMenu, &template, 0, HEAP_ID_PARTY_MENU, 1);
    *pState = PARTY_MENU_STATE_HANDLE_INPUT;
}

void PartyMonContextMenuAction_ReadMail(PartyMenuStruct *partyMenu, int *pState) {
    sub_0207CB20(partyMenu);
    PartyMenu_DisableMainScreenBlend_AfterYesNo();
    partyMenu->args->selectedAction = PARTY_MENU_ACTION_RETURN_READ_MAIL;
    *pState = PARTY_MENU_STATE_BEGIN_EXIT;
}

void PartyMonContextMenuAction_TakeMail(PartyMenuStruct *partyMenu, int *pState) {
    sub_0200E5D4(&partyMenu->windows[PARTY_MENU_WINDOW_ID_35], TRUE);
    sub_0207CB20(partyMenu);
    PartyMenu_DisableMainScreenBlend_AfterYesNo();
    sub_0207DAEC(partyMenu, msg_0300_00044, TRUE);
    partyMenu->yesCallback = PartyMenu_TakeMail_SendToPC;
    partyMenu->noCallback = PartyMenu_TakeMail_DontSendToPC;
    partyMenu->afterTextPrinterState = PARTY_MENU_STATE_YES_NO_INIT;
    *pState = PARTY_MENU_STATE_WAIT_TEXT_PRINTER;
}

int PartyMenu_TakeMail_SendToPC(PartyMenuStruct *partyMenu) {
    G2_BlendNone();
    if (sub_02090FA8(partyMenu->args->mailbox, Party_GetMonByIndex(partyMenu->args->party, partyMenu->partyMonIndex), HEAP_ID_PARTY_MENU) != -1) {
        partyMenu->monsDrawState[partyMenu->partyMonIndex].heldItem = ITEM_NONE;
        sub_0207F004(partyMenu, partyMenu->partyMonIndex, partyMenu->monsDrawState[partyMenu->partyMonIndex].heldItem);
        sub_0207DAEC(partyMenu, msg_0300_00047, FALSE);
    } else {
        sub_0207DAEC(partyMenu, msg_0300_00051, FALSE);
    }
    partyMenu->afterTextPrinterState = PARTY_MENU_STATE_20;
    return PARTY_MENU_STATE_WAIT_TEXT_PRINTER;
}

int PartyMenu_TakeMail_DontSendToPC(PartyMenuStruct *partyMenu) {
    sub_0207DAEC(partyMenu, msg_0300_00048, FALSE);
    partyMenu->yesCallback = PartyMenu_TakeMail_ReturnToBag;
    partyMenu->noCallback = PartyMenu_TakeMail_DontReturnToBag;
    partyMenu->afterTextPrinterState = PARTY_MENU_STATE_YES_NO_INIT;
    return PARTY_MENU_STATE_WAIT_TEXT_PRINTER;
}

int PartyMenu_TakeMail_ReturnToBag(PartyMenuStruct *partyMenu) {
    Pokemon *mon;

    G2_BlendNone();
    if (Bag_AddItem(partyMenu->args->bag, partyMenu->monsDrawState[partyMenu->partyMonIndex].heldItem, 1, HEAP_ID_PARTY_MENU) == TRUE) {
        mon = Party_GetMonByIndex(partyMenu->args->party, partyMenu->partyMonIndex);
        u32 itemId = ITEM_NONE;
        SetMonData(mon, MON_DATA_HELD_ITEM, &itemId);
        Pokemon_UpdateArceusForm(mon);
        Mon_UpdateGiratinaForm(mon);
        partyMenu->monsDrawState[partyMenu->partyMonIndex].heldItem = ITEM_NONE;
        sub_0207F004(partyMenu, partyMenu->partyMonIndex, partyMenu->monsDrawState[partyMenu->partyMonIndex].heldItem);
        sub_0207DAEC(partyMenu, msg_0300_00052, FALSE);
    } else {
        sub_0207DAEC(partyMenu, msg_0300_00084, FALSE);
    }
    partyMenu->afterTextPrinterState = PARTY_MENU_STATE_20;
    return PARTY_MENU_STATE_WAIT_TEXT_PRINTER;
}

int PartyMenu_TakeMail_DontReturnToBag(PartyMenuStruct *partyMenu) {
    G2_BlendNone();
    sub_02079224(partyMenu, FALSE);
    ClearFrameAndWindow2(&partyMenu->windows[PARTY_MENU_WINDOW_ID_34], TRUE);
    sub_0207DAC4(partyMenu, msg_0300_00029, TRUE);
    thunk_Sprite_SetPalIndex(partyMenu->sprites[PARTY_MENU_SPRITE_ID_CURSOR], 0);
    return PARTY_MENU_STATE_1;
}

int sub_0207FA08(PartyMenuStruct *partyMenu) {
    ClearFrameAndWindow2(&partyMenu->windows[PARTY_MENU_WINDOW_ID_34], TRUE);
    sub_0207DAC4(partyMenu, msg_0300_00029, TRUE);
    thunk_Sprite_SetPalIndex(partyMenu->sprites[PARTY_MENU_SPRITE_ID_CURSOR], 0);
    sub_02079224(partyMenu, FALSE);
    return PARTY_MENU_STATE_1;
}
