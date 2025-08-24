#include "party_menu_list_items.h"

#include "global.h"

#include "msgdata/msg/msg_0300.h"

#include "bag.h"
#include "field_move.h"
#include "mail_misc.h"
#include "overlay_94.h"
#include "party_context_menu.h"
#include "party_menu_sprites.h"
#include "text.h"
#include "unk_02005D10.h"

static void PartyMonContextMenuAction_Item(PartyMenu *partyMenu, int *pState);
static void PartyMonContextMenuAction_Give(PartyMenu *partyMenu, int *pState);
static void PartyMonContextMenuAction_Take(PartyMenu *partyMenu, int *pState);
static void PartyMonContextMenuAction_Mail(PartyMenu *partyMenu, int *pState);
static void PartyMonContextMenuAction_ReadMail(PartyMenu *partyMenu, int *pState);
static void PartyMonContextMenuAction_TakeMail(PartyMenu *partyMenu, int *pState);
static int PartyMenu_TakeMail_SendToPC(PartyMenu *partyMenu);
static int PartyMenu_TakeMail_DontSendToPC(PartyMenu *partyMenu);
static int PartyMenu_TakeMail_ReturnToBag(PartyMenu *partyMenu);
static int PartyMenu_TakeMail_DontReturnToBag(PartyMenu *partyMenu);
static void PartyMonContextMenuAction_Store(PartyMenu *partyMenu, int *pState);
static void PartyMonContextMenuAction_Switch(PartyMenu *partyMenu, int *pState);
static void PartyMenu_SwapMonsPanelsStep(PartyMenu *partyMenu, u8 slot);
static void PartyMenu_SwapMonsSpritesStep(PartyMenu *partyMenu, u8 slot, u8 direction);
static void PartyMenu_SwapMonsData(PartyMenu *partyMenu);
static void PartyMenu_RedrawMonHpBarAfterSwap(PartyMenu *partyMenu, u8 slot);
static void PartyMonContextMenuAction_Enter(PartyMenu *partyMenu, int *pState);
static void PartyMonContextMenuAction_NoEntry(PartyMenu *partyMenu, int *pState);
static void PartyMonContextMenuAction_ContestEnter(PartyMenu *partyMenu, int *pState);
static void PartyMonContextMenuAction_Confirm(PartyMenu *partyMenu, int *pState);
static void PartyMonContextMenuAction_Summary(PartyMenu *partyMenu, int *pState);
static void PartyMonContextMenuAction_Set(PartyMenu *partyMenu, int *pState);
static void PartyMenuContextMenuAction_FieldMoveCommon(PartyMenu *partyMenu, int *pState);
static void PartyMonContextMenuAction_Cut(PartyMenu *partyMenu, int *pState);
static void PartyMonContextMenuAction_RockSmash(PartyMenu *partyMenu, int *pState);
static void PartyMonContextMenuAction_Strength(PartyMenu *partyMenu, int *pState);
static void PartyMonContextMenuAction_Surf(PartyMenu *partyMenu, int *pState);
static void PartyMonContextMenuAction_RockClimb(PartyMenu *partyMenu, int *pState);
static void PartyMonContextMenuAction_Fly(PartyMenu *partyMenu, int *pState);
static void PartyMonContextMenuAction_Waterfall(PartyMenu *partyMenu, int *pState);
static void PartyMonContextMenuAction_Whirlpool(PartyMenu *partyMenu, int *pState);
static void PartyMonContextMenuAction_Flash(PartyMenu *partyMenu, int *pState);
static void PartyMonContextMenuAction_Teleport(PartyMenu *partyMenu, int *pState);
static void PartyMonContextMenuAction_Dig(PartyMenu *partyMenu, int *pState);
static void PartyMonContextMenuAction_SweetScent(PartyMenu *partyMenu, int *pState);
static void PartyMonContextMenuAction_Chatter(PartyMenu *partyMenu, int *pState);
static void PartyMonContextMenuAction_MilkDrink(PartyMenu *partyMenu, int *pState);
static void PartyMonContextMenuAction_Softboiled(PartyMenu *partyMenu, int *pState);
static void PartyMonContextMenuAction_Headbutt(PartyMenu *partyMenu, int *pState);
static int PartyMonContextMenuAction_TransferHP(PartyMenu *partyMenu);

static const u32 _02101CB8[] = {
    [PARTY_MON_CONTEXT_MENU_SWITCH] = (u32)PartyMonContextMenuAction_Switch,
    [PARTY_MON_CONTEXT_MENU_SUMMARY] = (u32)PartyMonContextMenuAction_Summary,
    [PARTY_MON_CONTEXT_MENU_ITEM] = (u32)PartyMonContextMenuAction_Item,
    [PARTY_MON_CONTEXT_MENU_GIVE] = (u32)PartyMonContextMenuAction_Give,
    [PARTY_MON_CONTEXT_MENU_TAKE] = (u32)PartyMonContextMenuAction_Take,
    [PARTY_MON_CONTEXT_MENU_MAIL] = (u32)PartyMonContextMenuAction_Mail,
    [PARTY_MON_CONTEXT_MENU_READ_MAIL] = (u32)PartyMonContextMenuAction_ReadMail,
    [PARTY_MON_CONTEXT_MENU_TAKE_MAIL] = (u32)PartyMonContextMenuAction_TakeMail,
    [PARTY_MON_CONTEXT_MENU_STORE] = (u32)PartyMonContextMenuAction_Store,
    [PARTY_MON_CONTEXT_MENU_QUIT] = LIST_CANCEL,
    [PARTY_MON_CONTEXT_MENU_UNUSED] = LIST_CANCEL,
    [PARTY_MON_CONTEXT_MENU_ENTER] = (u32)PartyMonContextMenuAction_Enter,
    [PARTY_MON_CONTEXT_MENU_NO_ENTRY] = (u32)PartyMonContextMenuAction_NoEntry,
    [PARTY_MON_CONTEXT_MENU_CONTEST_ENTER] = (u32)PartyMonContextMenuAction_ContestEnter,
    [PARTY_MON_CONTEXT_MENU_SET] = (u32)PartyMonContextMenuAction_Set,
    [PARTY_MON_CONTEXT_MENU_CONFIRM] = (u32)PartyMonContextMenuAction_Confirm,
    [PARTY_MON_CONTEXT_MENU_CUT] = (u32)PartyMonContextMenuAction_Cut,
    [PARTY_MON_CONTEXT_MENU_FLY] = (u32)PartyMonContextMenuAction_Fly,
    [PARTY_MON_CONTEXT_MENU_SURF] = (u32)PartyMonContextMenuAction_Surf,
    [PARTY_MON_CONTEXT_MENU_STRENGTH] = (u32)PartyMonContextMenuAction_Strength,
    [PARTY_MON_CONTEXT_MENU_ROCK_SMASH] = (u32)PartyMonContextMenuAction_RockSmash,
    [PARTY_MON_CONTEXT_MENU_WATERFALL] = (u32)PartyMonContextMenuAction_Waterfall,
    [PARTY_MON_CONTEXT_MENU_ROCK_CLIMB] = (u32)PartyMonContextMenuAction_RockClimb,
    [PARTY_MON_CONTEXT_MENU_WHIRLPOOL] = (u32)PartyMonContextMenuAction_Whirlpool,
    [PARTY_MON_CONTEXT_MENU_FLASH] = (u32)PartyMonContextMenuAction_Flash,
    [PARTY_MON_CONTEXT_MENU_TELEPORT] = (u32)PartyMonContextMenuAction_Teleport,
    [PARTY_MON_CONTEXT_MENU_DIG] = (u32)PartyMonContextMenuAction_Dig,
    [PARTY_MON_CONTEXT_MENU_SWEET_SCENT] = (u32)PartyMonContextMenuAction_SweetScent,
    [PARTY_MON_CONTEXT_MENU_CHATTER] = (u32)PartyMonContextMenuAction_Chatter,
    [PARTY_MON_CONTEXT_MENU_HEADBUTT] = (u32)PartyMonContextMenuAction_Headbutt,
    [PARTY_MON_CONTEXT_MENU_MILK_DRINK] = (u32)PartyMonContextMenuAction_MilkDrink,
    [PARTY_MON_CONTEXT_MENU_SOFTBOILED] = (u32)PartyMonContextMenuAction_Softboiled,
    [PARTY_MON_CONTEXT_MENU_MAX] = LIST_CANCEL,
};

u32 GetPartyMenuContextMenuActionFunc(int index) {
    return _02101CB8[index];
}

static void PartyMonContextMenuAction_Item(PartyMenu *partyMenu, int *pState) {
    PartyMenu_DeleteContextMenuAndList(partyMenu);
    PartyMenu_PrintMessageOnWindow33(partyMenu, msg_0300_00039, FALSE);
    partyMenu->listMenuItems = ListMenuItems_New(3, HEAP_ID_PARTY_MENU);
    ListMenuItems_AddItem(partyMenu->listMenuItems, partyMenu->contextMenuStrings[PARTY_MON_CONTEXT_MENU_GIVE], GetPartyMenuContextMenuActionFunc(PARTY_MON_CONTEXT_MENU_GIVE));
    ListMenuItems_AddItem(partyMenu->listMenuItems, partyMenu->contextMenuStrings[PARTY_MON_CONTEXT_MENU_TAKE], GetPartyMenuContextMenuActionFunc(PARTY_MON_CONTEXT_MENU_TAKE));
    ListMenuItems_AddItem(partyMenu->listMenuItems, partyMenu->contextMenuStrings[PARTY_MON_CONTEXT_MENU_QUIT], GetPartyMenuContextMenuActionFunc(PARTY_MON_CONTEXT_MENU_QUIT));

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
    *pState = PARTY_MENU_STATE_HANDLE_SUBCONTEXT_MENU_INPUT;
}

static void PartyMonContextMenuAction_Give(PartyMenu *partyMenu, int *pState) {
    PartyMenu_DeleteContextMenuAndList(partyMenu);
    PartyMenu_DisableMainScreenBlend_AfterYesNo();
    partyMenu->args->selectedAction = PARTY_MENU_ACTION_RETURN_GIVE_ITEM;
    *pState = PARTY_MENU_STATE_BEGIN_EXIT;
}

static void PartyMonContextMenuAction_Take(PartyMenu *partyMenu, int *pState) {
    int newState = PARTY_MENU_STATE_PRINT_TAKE_ITEM_MESSAGE;
    Pokemon *mon;
    BOOL griseousOrbResult;

    sub_0200E5D4(&partyMenu->windows[PARTY_MENU_WINDOW_ID_35], TRUE);
    PartyMenu_DeleteContextMenuAndList(partyMenu);
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
                newState = PARTY_MENU_STATE_PRINT_TAKE_GRISEOUS_ORB_MESSAGE;
            }
            ReadMsgDataIntoString(partyMenu->msgData, msg_0300_00083, partyMenu->unformattedStrBuf);
            BufferBoxMonNickname(partyMenu->msgFormat, 0, Mon_GetBoxMon(mon));
            BufferItemName(partyMenu->msgFormat, 1, partyMenu->monsDrawState[partyMenu->partyMonIndex].heldItem);
            StringExpandPlaceholders(partyMenu->msgFormat, partyMenu->formattedStrBuf, partyMenu->unformattedStrBuf);
            partyMenu->monsDrawState[partyMenu->partyMonIndex].heldItem = ITEM_NONE;
            PartyMenu_DrawMonHeldItemIcon(partyMenu, partyMenu->partyMonIndex, partyMenu->monsDrawState[partyMenu->partyMonIndex].heldItem);
        } else {
            ReadMsgDataIntoString(partyMenu->msgData, msg_0300_00084, partyMenu->formattedStrBuf);
        }
    }
    DrawFrameAndWindow2(&partyMenu->windows[PARTY_MENU_WINDOW_ID_34], TRUE, 0x02A, 15);
    FillWindowPixelBuffer(&partyMenu->windows[PARTY_MENU_WINDOW_ID_34], 15);
    PartyMenu_PrintBufferedMessageOnWindow34(partyMenu);
    *pState = newState;
}

int PartyMenu_Subtask_PrintTakeItemMessage(PartyMenu *partyMenu) {
    if (!TextPrinterCheckActive(partyMenu->textPrinterId)) {
        ClearFrameAndWindow2(&partyMenu->windows[PARTY_MENU_WINDOW_ID_34], TRUE);
        PartyMenu_PrintMessageOnWindow32(partyMenu, msg_0300_00029, TRUE);
        thunk_Sprite_SetPaletteOverride(partyMenu->sprites[PARTY_MENU_SPRITE_ID_CURSOR], 0);
        PartyMenu_SetTopScreenSelectionPanelVisibility(partyMenu, FALSE);
        G2_BlendNone();
        return PARTY_MENU_STATE_1;
    } else {
        return PARTY_MENU_STATE_PRINT_TAKE_ITEM_MESSAGE;
    }
}

int PartyMenu_Subtask_PrintTakeGriseousOrbMessage(PartyMenu *partyMenu) {
    if (!TextPrinterCheckActive(partyMenu->textPrinterId)) {
        ClearFrameAndWindow2(&partyMenu->windows[PARTY_MENU_WINDOW_ID_34], TRUE);
        PartyMenu_FormChangeScene_Begin(partyMenu);
        PartyMenu_SetTopScreenSelectionPanelVisibility(partyMenu, FALSE);
        return PARTY_MENU_STATE_WAIT_TAKE_GRISEOUS_ORB_ANIM;
    } else {
        return PARTY_MENU_STATE_PRINT_TAKE_GRISEOUS_ORB_MESSAGE;
    }
}

int PartyMenu_Subtask_WaitTakeGriseousOrbAnim(PartyMenu *partyMenu) {
    if (PartyMenu_AnimateIconFormChange(partyMenu) == TRUE) {
        PartyMenu_FormChangeScene_End(partyMenu);
        return PARTY_MENU_STATE_PRINT_TAKE_ITEM_MESSAGE;
    } else {
        return PARTY_MENU_STATE_WAIT_TAKE_GRISEOUS_ORB_ANIM;
    }
}

static void PartyMonContextMenuAction_Mail(PartyMenu *partyMenu, int *pState) {
    PartyMenu_DeleteContextMenuAndList(partyMenu);
    PartyMenu_PrintMessageOnWindow33(partyMenu, msg_0300_00040, FALSE);
    partyMenu->listMenuItems = ListMenuItems_New(3, HEAP_ID_PARTY_MENU);
    ListMenuItems_AddItem(partyMenu->listMenuItems, partyMenu->contextMenuStrings[PARTY_MON_CONTEXT_MENU_READ_MAIL], GetPartyMenuContextMenuActionFunc(PARTY_MON_CONTEXT_MENU_READ_MAIL));
    ListMenuItems_AddItem(partyMenu->listMenuItems, partyMenu->contextMenuStrings[PARTY_MON_CONTEXT_MENU_TAKE_MAIL], GetPartyMenuContextMenuActionFunc(PARTY_MON_CONTEXT_MENU_TAKE_MAIL));
    ListMenuItems_AddItem(partyMenu->listMenuItems, partyMenu->contextMenuStrings[PARTY_MON_CONTEXT_MENU_QUIT], GetPartyMenuContextMenuActionFunc(PARTY_MON_CONTEXT_MENU_QUIT));

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
    *pState = PARTY_MENU_STATE_HANDLE_SUBCONTEXT_MENU_INPUT;
}

static void PartyMonContextMenuAction_ReadMail(PartyMenu *partyMenu, int *pState) {
    PartyMenu_DeleteContextMenuAndList(partyMenu);
    PartyMenu_DisableMainScreenBlend_AfterYesNo();
    partyMenu->args->selectedAction = PARTY_MENU_ACTION_RETURN_READ_MAIL;
    *pState = PARTY_MENU_STATE_BEGIN_EXIT;
}

static void PartyMonContextMenuAction_TakeMail(PartyMenu *partyMenu, int *pState) {
    sub_0200E5D4(&partyMenu->windows[PARTY_MENU_WINDOW_ID_35], TRUE);
    PartyMenu_DeleteContextMenuAndList(partyMenu);
    PartyMenu_DisableMainScreenBlend_AfterYesNo();
    PartyMenu_PrintMessageOnWindow34(partyMenu, msg_0300_00044, TRUE);
    partyMenu->yesCallback = PartyMenu_TakeMail_SendToPC;
    partyMenu->noCallback = PartyMenu_TakeMail_DontSendToPC;
    partyMenu->afterTextPrinterState = PARTY_MENU_STATE_YES_NO_INIT;
    *pState = PARTY_MENU_STATE_WAIT_TEXT_PRINTER;
}

static int PartyMenu_TakeMail_SendToPC(PartyMenu *partyMenu) {
    G2_BlendNone();
    if (Mailbox_MoveMessageFromMon(partyMenu->args->mailbox, Party_GetMonByIndex(partyMenu->args->party, partyMenu->partyMonIndex), HEAP_ID_PARTY_MENU) != -1) {
        partyMenu->monsDrawState[partyMenu->partyMonIndex].heldItem = ITEM_NONE;
        PartyMenu_DrawMonHeldItemIcon(partyMenu, partyMenu->partyMonIndex, partyMenu->monsDrawState[partyMenu->partyMonIndex].heldItem);
        PartyMenu_PrintMessageOnWindow34(partyMenu, msg_0300_00047, FALSE);
    } else {
        PartyMenu_PrintMessageOnWindow34(partyMenu, msg_0300_00051, FALSE);
    }
    partyMenu->afterTextPrinterState = PARTY_MENU_STATE_AFTER_TAKE_MAIL;
    return PARTY_MENU_STATE_WAIT_TEXT_PRINTER;
}

static int PartyMenu_TakeMail_DontSendToPC(PartyMenu *partyMenu) {
    PartyMenu_PrintMessageOnWindow34(partyMenu, msg_0300_00048, FALSE);
    partyMenu->yesCallback = PartyMenu_TakeMail_ReturnToBag;
    partyMenu->noCallback = PartyMenu_TakeMail_DontReturnToBag;
    partyMenu->afterTextPrinterState = PARTY_MENU_STATE_YES_NO_INIT;
    return PARTY_MENU_STATE_WAIT_TEXT_PRINTER;
}

static int PartyMenu_TakeMail_ReturnToBag(PartyMenu *partyMenu) {
    Pokemon *mon;

    G2_BlendNone();
    if (Bag_AddItem(partyMenu->args->bag, partyMenu->monsDrawState[partyMenu->partyMonIndex].heldItem, 1, HEAP_ID_PARTY_MENU) == TRUE) {
        mon = Party_GetMonByIndex(partyMenu->args->party, partyMenu->partyMonIndex);
        u32 itemId = ITEM_NONE;
        SetMonData(mon, MON_DATA_HELD_ITEM, &itemId);
        Pokemon_UpdateArceusForm(mon);
        Mon_UpdateGiratinaForm(mon);
        partyMenu->monsDrawState[partyMenu->partyMonIndex].heldItem = ITEM_NONE;
        PartyMenu_DrawMonHeldItemIcon(partyMenu, partyMenu->partyMonIndex, partyMenu->monsDrawState[partyMenu->partyMonIndex].heldItem);
        PartyMenu_PrintMessageOnWindow34(partyMenu, msg_0300_00052, FALSE);
    } else {
        PartyMenu_PrintMessageOnWindow34(partyMenu, msg_0300_00084, FALSE);
    }
    partyMenu->afterTextPrinterState = PARTY_MENU_STATE_AFTER_TAKE_MAIL;
    return PARTY_MENU_STATE_WAIT_TEXT_PRINTER;
}

static int PartyMenu_TakeMail_DontReturnToBag(PartyMenu *partyMenu) {
    G2_BlendNone();
    PartyMenu_SetTopScreenSelectionPanelVisibility(partyMenu, FALSE);
    ClearFrameAndWindow2(&partyMenu->windows[PARTY_MENU_WINDOW_ID_34], TRUE);
    PartyMenu_PrintMessageOnWindow32(partyMenu, msg_0300_00029, TRUE);
    thunk_Sprite_SetPaletteOverride(partyMenu->sprites[PARTY_MENU_SPRITE_ID_CURSOR], 0);
    return PARTY_MENU_STATE_1;
}

int PartyMenu_Subtask_AfterTakeMail(PartyMenu *partyMenu) {
    ClearFrameAndWindow2(&partyMenu->windows[PARTY_MENU_WINDOW_ID_34], TRUE);
    PartyMenu_PrintMessageOnWindow32(partyMenu, msg_0300_00029, TRUE);
    thunk_Sprite_SetPaletteOverride(partyMenu->sprites[PARTY_MENU_SPRITE_ID_CURSOR], 0);
    PartyMenu_SetTopScreenSelectionPanelVisibility(partyMenu, FALSE);
    return PARTY_MENU_STATE_1;
}

static void PartyMonContextMenuAction_Store(PartyMenu *partyMenu, int *pState) {
    PartyMenu_DeleteContextMenuAndList(partyMenu);
    PartyMenu_DisableMainScreenBlend_AfterYesNo();
    if (partyMenu->monsDrawState[partyMenu->partyMonIndex].capsule == 0) {
        partyMenu->args->selectedAction = PARTY_MENU_ACTION_RETURN_0;
        *pState = PARTY_MENU_STATE_BEGIN_EXIT;
    } else {
        PartyMenu_PrintMessageOnWindow34(partyMenu, msg_0300_00179, TRUE);
        partyMenu->yesCallback = PartyMenu_ConfirmRemoveCapsuleYes;
        partyMenu->noCallback = PartyMenu_ConfirmRemoveCapsuleNo;
        partyMenu->afterTextPrinterState = PARTY_MENU_STATE_YES_NO_INIT;
        *pState = PARTY_MENU_STATE_WAIT_TEXT_PRINTER;
    }
}

int PartyMenu_ConfirmRemoveCapsuleYes(PartyMenu *partyMenu) {
    Pokemon_RemoveCapsule(Party_GetMonByIndex(partyMenu->args->party, partyMenu->partyMonIndex));
    partyMenu->args->selectedAction = PARTY_MENU_ACTION_RETURN_0;
    return PARTY_MENU_STATE_BEGIN_EXIT;
}

int PartyMenu_ConfirmRemoveCapsuleNo(PartyMenu *partyMenu) {
    G2_BlendNone();
    ClearFrameAndWindow2(&partyMenu->windows[PARTY_MENU_WINDOW_ID_34], TRUE);
    PartyMenu_PrintMessageOnWindow32(partyMenu, msg_0300_00029, TRUE);
    thunk_Sprite_SetPaletteOverride(partyMenu->sprites[PARTY_MENU_SPRITE_ID_CURSOR], 0);
    return PARTY_MENU_STATE_1;
}

static void PartyMonContextMenuAction_Switch(PartyMenu *partyMenu, int *pState) {
    partyMenu->secondCursorActive = 1;
    partyMenu->softboiledDonorSlot = partyMenu->partyMonIndex;
    thunk_Sprite_SetPaletteOverride(partyMenu->sprites[PARTY_MENU_SPRITE_ID_CURSOR], 0);

    s16 x, y;
    Sprite_GetPositionXY(partyMenu->sprites[PARTY_MENU_SPRITE_ID_CURSOR], &x, &y);
    Sprite_SetPositionXY(partyMenu->sprites[PARTY_MENU_SPRITE_ID_SWITCH_MON_CURSOR], x, y);
    Sprite_SetAnimCtrlSeq(partyMenu->sprites[PARTY_MENU_SPRITE_ID_SWITCH_MON_CURSOR], sub_0207B5EC(partyMenu->args->unk_25, partyMenu->softboiledDonorSlot) + 2);
    Sprite_SetDrawFlag(partyMenu->sprites[PARTY_MENU_SPRITE_ID_SWITCH_MON_CURSOR], TRUE);
    sub_0207A7F4(partyMenu, partyMenu->softboiledDonorSlot);
    ClearFrameAndWindow2(&partyMenu->windows[PARTY_MENU_WINDOW_ID_33], TRUE);
    PartyMenu_DeleteContextMenuAndList(partyMenu);
    PartyMenu_DisableMainScreenBlend_AfterYesNo();
    PartyMenu_PrintMessageOnWindow32(partyMenu, msg_0300_00031, TRUE);
    *pState = PARTY_MENU_STATE_SELECT_SWITCH_MON;
}

void sub_0207FBC8(PartyMenu *partyMenu) {
    partyMenu->secondCursorActive = 0;
    Sprite_SetDrawFlag(partyMenu->sprites[PARTY_MENU_SPRITE_ID_SWITCH_MON_CURSOR], FALSE);
    if (partyMenu->partyMonIndex < PARTY_SIZE) {
        sub_0207A7F4(partyMenu, partyMenu->partyMonIndex);
    }
    PartyMenu_SetTopScreenSelectionPanelVisibility(partyMenu, FALSE);
    sub_0207A7F4(partyMenu, partyMenu->softboiledDonorSlot);
    PartyMenu_PrintMessageOnWindow32(partyMenu, msg_0300_00029, TRUE);
}

void sub_0207FC1C(PartyMenu *partyMenu) {
    u16 *bg2Tilemap;
    u16 *bg1Tilemap;
    s8 spC;
    s8 sp8;
    s8 sp4;
    s8 sp0;
    u16 i;
    partyMenu->swapMonsData.slots[0] = partyMenu->partyMonIndex;
    partyMenu->swapMonsData.slots[1] = partyMenu->softboiledDonorSlot;
    partyMenu->swapMonsData.active = 1;
    partyMenu->swapMonsData.xOffset = 0;
    partyMenu->swapMonsData.state = 0;
    if (partyMenu->swapMonsData.slots[0] & 1) {
        partyMenu->swapMonsData.directions[0] = 1;
    } else {
        partyMenu->swapMonsData.directions[0] = 0;
    }
    if (partyMenu->swapMonsData.slots[1] & 1) {
        partyMenu->swapMonsData.directions[1] = 1;
    } else {
        partyMenu->swapMonsData.directions[1] = 0;
    }

    bg2Tilemap = GetBgTilemapBuffer(partyMenu->bgConfig, GF_BG_LYR_MAIN_2);
    bg1Tilemap = GetBgTilemapBuffer(partyMenu->bgConfig, GF_BG_LYR_MAIN_1);

    spC = partyMenu->monsDrawState[partyMenu->swapMonsData.slots[0]].unk_15;
    sp8 = partyMenu->monsDrawState[partyMenu->swapMonsData.slots[0]].unk_14;
    sp4 = partyMenu->monsDrawState[partyMenu->swapMonsData.slots[1]].unk_15;
    sp0 = partyMenu->monsDrawState[partyMenu->swapMonsData.slots[1]].unk_14;

    for (i = 0; i < PARTY_SIZE; ++i) {
        memcpy(&partyMenu->swapMonsData.bg2Tilemaps[0][i * 16], &bg2Tilemap[sp8 + (spC + i) * 32], 0x20);
        memcpy(&partyMenu->swapMonsData.bg1Tilemaps[0][i * 16], &bg1Tilemap[sp8 + (spC + i) * 32], 0x20);
        memcpy(&partyMenu->swapMonsData.bg2Tilemaps[1][i * 16], &bg2Tilemap[sp0 + (sp4 + i) * 32], 0x20);
        memcpy(&partyMenu->swapMonsData.bg1Tilemaps[1][i * 16], &bg1Tilemap[sp0 + (sp4 + i) * 32], 0x20);
    }
    Sprite_SetDrawFlag(partyMenu->sprites[PARTY_MENU_SPRITE_ID_CURSOR], FALSE);
    Sprite_SetDrawFlag(partyMenu->sprites[PARTY_MENU_SPRITE_ID_SWITCH_MON_CURSOR], FALSE);
}

BOOL sub_0207FD6C(PartyMenu *partyMenu) {
    PartyMenuSwapMonsData *swapMonsData = &partyMenu->swapMonsData;

    switch (swapMonsData->state) {
    case 0:
        PlaySE(SEQ_SE_DP_POKELIST_001);
        PartyMenu_SetTopScreenSelectionPanelVisibility(partyMenu, FALSE);
        swapMonsData->state = 1;
        break;
    case 1:
        ++swapMonsData->xOffset;
        PartyMenu_SwapMonsPanelsStep(partyMenu, 0);
        PartyMenu_SwapMonsPanelsStep(partyMenu, 1);
        PartyMenu_SwapMonsSpritesStep(partyMenu, 0, swapMonsData->directions[0]);
        PartyMenu_SwapMonsSpritesStep(partyMenu, 1, swapMonsData->directions[1]);
        ScheduleBgTilemapBufferTransfer(partyMenu->bgConfig, GF_BG_LYR_MAIN_2);
        ScheduleBgTilemapBufferTransfer(partyMenu->bgConfig, GF_BG_LYR_MAIN_1);
        if (swapMonsData->xOffset == 16) {
            swapMonsData->state = 2;
        }
        break;
    case 2:
        PartyMenu_SwapMonsData(partyMenu);
        PlaySE(SEQ_SE_DP_POKELIST_001);
        swapMonsData->state = 3;
        break;
    case 3:
        --swapMonsData->xOffset;
        PartyMenu_SwapMonsPanelsStep(partyMenu, 0);
        PartyMenu_SwapMonsPanelsStep(partyMenu, 1);
        PartyMenu_SwapMonsSpritesStep(partyMenu, 0, swapMonsData->directions[0] ^ 1);
        PartyMenu_SwapMonsSpritesStep(partyMenu, 1, swapMonsData->directions[1] ^ 1);
        ScheduleBgTilemapBufferTransfer(partyMenu->bgConfig, GF_BG_LYR_MAIN_2);
        ScheduleBgTilemapBufferTransfer(partyMenu->bgConfig, GF_BG_LYR_MAIN_1);
        if (swapMonsData->xOffset == 0) {
            swapMonsData->state = 4;
        }
        break;
    case 4:
        Party_SwapSlots(partyMenu->args->party, swapMonsData->slots[0], swapMonsData->slots[1]);
        Sprite_SetDrawFlag(partyMenu->sprites[PARTY_MENU_SPRITE_ID_CURSOR], TRUE);
        swapMonsData->active = 0;
        partyMenu->secondCursorActive = 0;
        sub_0207A7F4(partyMenu, partyMenu->partyMonIndex);
        sub_0207A7F4(partyMenu, partyMenu->softboiledDonorSlot);
        PartyMenu_PrintMessageOnWindow32(partyMenu, msg_0300_00029, FALSE);
        return TRUE;
    }

    return FALSE;
}

static void PartyMenu_SwapMonsPanelsStep(PartyMenu *partyMenu, u8 slot) {
    PartyMenuSwapMonsData *swapMonsData = &partyMenu->swapMonsData;
    s8 x = partyMenu->monsDrawState[swapMonsData->slots[slot]].unk_14;
    s8 y = partyMenu->monsDrawState[swapMonsData->slots[slot]].unk_15;

    FillBgTilemapRect(partyMenu->bgConfig, GF_BG_LYR_MAIN_2, 0, x, y, 16, 6, TILEMAP_FILL_KEEP_PAL);
    FillBgTilemapRect(partyMenu->bgConfig, GF_BG_LYR_MAIN_1, 0, x, y, 16, 6, TILEMAP_FILL_KEEP_PAL);
    if (swapMonsData->directions[slot] == 0) {
        CopyToBgTilemapRect(partyMenu->bgConfig, GF_BG_LYR_MAIN_2, x, y, 16 - swapMonsData->xOffset, 6, swapMonsData->bg2Tilemaps[slot], swapMonsData->xOffset, 0, 16, 6);
        CopyToBgTilemapRect(partyMenu->bgConfig, GF_BG_LYR_MAIN_1, x, y, 16 - swapMonsData->xOffset, 6, swapMonsData->bg1Tilemaps[slot], swapMonsData->xOffset, 0, 16, 6);
    } else {
        CopyToBgTilemapRect(partyMenu->bgConfig, GF_BG_LYR_MAIN_2, x + swapMonsData->xOffset, y, 16 - swapMonsData->xOffset, 6, swapMonsData->bg2Tilemaps[slot], 0, 0, 16, 6);
        CopyToBgTilemapRect(partyMenu->bgConfig, GF_BG_LYR_MAIN_1, x + swapMonsData->xOffset, y, 16 - swapMonsData->xOffset, 6, swapMonsData->bg1Tilemaps[slot], 0, 0, 16, 6);
    }
}

static void PartyMenu_SwapMonsSpritesStep(PartyMenu *partyMenu, u8 slot, u8 direction) {
    PartyMenuSwapMonsData *swapMonsData = &partyMenu->swapMonsData;
    s16 x, y;

    Sprite_GetPositionXY(partyMenu->sprites[PARTY_MENU_SPRITE_ID_BALL + swapMonsData->slots[slot]], &x, &y);
    if (direction == 0) {
        partyMenu->monsDrawState[swapMonsData->slots[slot]].iconX -= 8;
        partyMenu->monsDrawState[swapMonsData->slots[slot]].statusIconX -= 8;
        partyMenu->monsDrawState[swapMonsData->slots[slot]].heldItemX -= 8;
        x -= 8;
    } else {
        partyMenu->monsDrawState[swapMonsData->slots[slot]].iconX += 8;
        partyMenu->monsDrawState[swapMonsData->slots[slot]].statusIconX += 8;
        partyMenu->monsDrawState[swapMonsData->slots[slot]].heldItemX += 8;
        x += 8;
    }
    Sprite_SetPositionXY(partyMenu->monsDrawState[swapMonsData->slots[slot]].iconSprite, partyMenu->monsDrawState[swapMonsData->slots[slot]].iconX, partyMenu->monsDrawState[swapMonsData->slots[slot]].iconY);
    Sprite_SetPositionXY(partyMenu->sprites[PARTY_MENU_SPRITE_ID_MON1_STATUS + swapMonsData->slots[slot]], partyMenu->monsDrawState[swapMonsData->slots[slot]].statusIconX, partyMenu->monsDrawState[swapMonsData->slots[slot]].statusIconY);
    Sprite_SetPositionXY(partyMenu->sprites[PARTY_MENU_SPRITE_ID_MON1_HELD_ITEM + swapMonsData->slots[slot]], partyMenu->monsDrawState[swapMonsData->slots[slot]].heldItemX, partyMenu->monsDrawState[swapMonsData->slots[slot]].heldItemY);
    Sprite_SetPositionXY(partyMenu->sprites[PARTY_MENU_SPRITE_ID_MON1_CAPSULE + swapMonsData->slots[slot]], partyMenu->monsDrawState[swapMonsData->slots[slot]].heldItemX + 8, partyMenu->monsDrawState[swapMonsData->slots[slot]].heldItemY);
    Sprite_SetPositionXY(partyMenu->sprites[PARTY_MENU_SPRITE_ID_BALL + swapMonsData->slots[slot]], x, y);
}

static void PartyMenu_SwapMonsData(PartyMenu *partyMenu) {
    PartyMenuSwapMonsData *swapMonsData = &partyMenu->swapMonsData;
    PartyMenuMonsDrawState *monBuf;
    s16 pos;

    monBuf = Heap_Alloc(HEAP_ID_PARTY_MENU, sizeof(PartyMenuMonsDrawState));
    *monBuf = partyMenu->monsDrawState[swapMonsData->slots[0]];
    partyMenu->monsDrawState[swapMonsData->slots[0]] = partyMenu->monsDrawState[swapMonsData->slots[1]];
    partyMenu->monsDrawState[swapMonsData->slots[1]] = *monBuf;
    Heap_FreeExplicit(HEAP_ID_PARTY_MENU, monBuf);

    pos = partyMenu->monsDrawState[swapMonsData->slots[0]].iconX;
    partyMenu->monsDrawState[swapMonsData->slots[0]].iconX = partyMenu->monsDrawState[swapMonsData->slots[1]].iconX;
    partyMenu->monsDrawState[swapMonsData->slots[1]].iconX = pos;
    pos = partyMenu->monsDrawState[swapMonsData->slots[0]].iconY;
    partyMenu->monsDrawState[swapMonsData->slots[0]].iconY = partyMenu->monsDrawState[swapMonsData->slots[1]].iconY;
    partyMenu->monsDrawState[swapMonsData->slots[1]].iconY = pos;

    pos = partyMenu->monsDrawState[swapMonsData->slots[0]].statusIconX;
    partyMenu->monsDrawState[swapMonsData->slots[0]].statusIconX = partyMenu->monsDrawState[swapMonsData->slots[1]].statusIconX;
    partyMenu->monsDrawState[swapMonsData->slots[1]].statusIconX = pos;
    pos = partyMenu->monsDrawState[swapMonsData->slots[0]].statusIconY;
    partyMenu->monsDrawState[swapMonsData->slots[0]].statusIconY = partyMenu->monsDrawState[swapMonsData->slots[1]].statusIconY;
    partyMenu->monsDrawState[swapMonsData->slots[1]].statusIconY = pos;

    pos = partyMenu->monsDrawState[swapMonsData->slots[0]].heldItemX;
    partyMenu->monsDrawState[swapMonsData->slots[0]].heldItemX = partyMenu->monsDrawState[swapMonsData->slots[1]].heldItemX;
    partyMenu->monsDrawState[swapMonsData->slots[1]].heldItemX = pos;
    pos = partyMenu->monsDrawState[swapMonsData->slots[0]].heldItemY;
    partyMenu->monsDrawState[swapMonsData->slots[0]].heldItemY = partyMenu->monsDrawState[swapMonsData->slots[1]].heldItemY;
    partyMenu->monsDrawState[swapMonsData->slots[1]].heldItemY = pos;

    pos = partyMenu->monsDrawState[swapMonsData->slots[0]].unk_14;
    partyMenu->monsDrawState[swapMonsData->slots[0]].unk_14 = partyMenu->monsDrawState[swapMonsData->slots[1]].unk_14;
    partyMenu->monsDrawState[swapMonsData->slots[1]].unk_14 = pos;
    pos = partyMenu->monsDrawState[swapMonsData->slots[0]].unk_15;
    partyMenu->monsDrawState[swapMonsData->slots[0]].unk_15 = partyMenu->monsDrawState[swapMonsData->slots[1]].unk_15;
    partyMenu->monsDrawState[swapMonsData->slots[1]].unk_15 = pos;

    sub_0207D5DC(partyMenu, swapMonsData->slots[0]);
    sub_0207D5DC(partyMenu, swapMonsData->slots[1]);
    PartyMenu_CommitPartyMonPanelWindowsToVram_NotInVBlank(partyMenu, swapMonsData->slots[0]);
    PartyMenu_CommitPartyMonPanelWindowsToVram_NotInVBlank(partyMenu, swapMonsData->slots[1]);
    PartyMenu_RedrawMonHpBarAfterSwap(partyMenu, 0);
    PartyMenu_RedrawMonHpBarAfterSwap(partyMenu, 1);
    PartyMenu_DrawMonStatusIcon(partyMenu, swapMonsData->slots[0], partyMenu->monsDrawState[swapMonsData->slots[0]].status);
    PartyMenu_DrawMonStatusIcon(partyMenu, swapMonsData->slots[1], partyMenu->monsDrawState[swapMonsData->slots[1]].status);
    PartyMenu_DrawMonHeldItemIcon(partyMenu, swapMonsData->slots[0], partyMenu->monsDrawState[swapMonsData->slots[0]].heldItem);
    PartyMenu_DrawMonHeldItemIcon(partyMenu, swapMonsData->slots[1], partyMenu->monsDrawState[swapMonsData->slots[1]].heldItem);
    PartyMenu_DrawMonCapsuleIcon(partyMenu, swapMonsData->slots[0]);
    PartyMenu_DrawMonCapsuleIcon(partyMenu, swapMonsData->slots[1]);
}

static void PartyMenu_RedrawMonHpBarAfterSwap(PartyMenu *partyMenu, u8 slot) {
    PartyMenuSwapMonsData *swapMonsData = &partyMenu->swapMonsData;
    u16 *bg2Tilemap = swapMonsData->bg2Tilemaps[slot];
    const u16 *src = sub_0207A16C(partyMenu);
    u16 color;
    u16 i;

    if (partyMenu->monsDrawState[swapMonsData->slots[slot]].isEgg == TRUE) {
        for (i = 0; i < 9; ++i) {
            color = bg2Tilemap[0x36 + i] & 0xF000;
            bg2Tilemap[0x36 + i] = color | 0x04B;
        }
    } else {
        for (i = 0; i < 9; ++i) {
            color = bg2Tilemap[0x36 + i] & 0xF000;
            bg2Tilemap[0x36 + i] = color | (src[i] & 0xFFF);
        }
    }
}

static void PartyMonContextMenuAction_Enter(PartyMenu *partyMenu, int *pState) {
    ClearFrameAndWindow2(&partyMenu->windows[PARTY_MENU_WINDOW_ID_33], TRUE);
    PartyMenu_DeleteContextMenuAndList(partyMenu);
    PartyMenu_DisableMainScreenBlend_AfterYesNo();
    PartyMenu_SetTopScreenSelectionPanelVisibility(partyMenu, FALSE);
    for (u8 i = 0; i < partyMenu->args->maxMonsToSelect; ++i) {
        if (partyMenu->args->selectedOrder[i] == 0) {
            partyMenu->args->selectedOrder[i] = partyMenu->partyMonIndex + 1;
            sub_0207D8EC(partyMenu, partyMenu->partyMonIndex);
            PartyMenu_PrintMessageOnWindow32(partyMenu, msg_0300_00035, TRUE);
            thunk_Sprite_SetPaletteOverride(partyMenu->sprites[PARTY_MENU_SPRITE_ID_CURSOR], 0);
            if (i == partyMenu->args->maxMonsToSelect - 1) {
                sub_0207AB84(partyMenu, 6);
            }
            *pState = PARTY_MENU_STATE_1;
            return;
        }
    }
    switch (partyMenu->args->maxMonsToSelect) {
    case 0:
        break;
    case 1:
        PartyMenu_PrintMessageOnWindow34(partyMenu, msg_0300_00112, TRUE);
        break;
    case 2:
        PartyMenu_PrintMessageOnWindow34(partyMenu, msg_0300_00099, TRUE);
        break;
    case 3:
        PartyMenu_PrintMessageOnWindow34(partyMenu, msg_0300_00113, TRUE);
        break;
    case 4:
        PartyMenu_PrintMessageOnWindow34(partyMenu, msg_0300_00114, TRUE);
        break;
    case 5:
        PartyMenu_PrintMessageOnWindow34(partyMenu, msg_0300_00115, TRUE);
        break;
    }
    partyMenu->afterTextPrinterState = PARTY_MENU_STATE_SELECT_MONS_ERROR_MSG_CLOSE;
    *pState = PARTY_MENU_STATE_WAIT_TEXT_PRINTER;
}

int PartyMenu_Subtask_SelectMonsErrorMsgClose(PartyMenu *partyMenu) {
    ClearFrameAndWindow2(&partyMenu->windows[PARTY_MENU_WINDOW_ID_34], TRUE);
    PartyMenu_PrintMessageOnWindow32(partyMenu, msg_0300_00035, TRUE);
    thunk_Sprite_SetPaletteOverride(partyMenu->sprites[PARTY_MENU_SPRITE_ID_CURSOR], 0);
    return PARTY_MENU_STATE_1;
}

static void PartyMonContextMenuAction_NoEntry(PartyMenu *partyMenu, int *pState) {
    PartyMenu_SetTopScreenSelectionPanelVisibility(partyMenu, FALSE);
    for (u8 i = 0; i < partyMenu->args->maxMonsToSelect; ++i) {
        if (partyMenu->partyMonIndex + 1 == partyMenu->args->selectedOrder[i]) {
            partyMenu->args->selectedOrder[i] = 0;
            for (; i < partyMenu->args->maxMonsToSelect - 1; ++i) {
                partyMenu->args->selectedOrder[i] = partyMenu->args->selectedOrder[i + 1];
                partyMenu->args->selectedOrder[i + 1] = 0;
            }
            break;
        }
    }
    for (u8 i = 0; i < PARTY_SIZE; ++i) {
        if (partyMenu->monsDrawState[i].active) {
            sub_0207D8EC(partyMenu, i);
        }
    }
    ClearFrameAndWindow2(&partyMenu->windows[PARTY_MENU_WINDOW_ID_33], TRUE);
    PartyMenu_DeleteContextMenuAndList(partyMenu);
    PartyMenu_DisableMainScreenBlend_AfterYesNo();
    PartyMenu_PrintMessageOnWindow32(partyMenu, msg_0300_00035, TRUE);
    thunk_Sprite_SetPaletteOverride(partyMenu->sprites[PARTY_MENU_SPRITE_ID_CURSOR], 0);
    *pState = PARTY_MENU_STATE_1;
}

static void PartyMonContextMenuAction_ContestEnter(PartyMenu *partyMenu, int *pState) {
    partyMenu->args->selectedAction = PARTY_MENU_ACTION_RETURN_0;
    PartyMenu_DeleteContextMenuAndList(partyMenu);
    PartyMenu_DisableMainScreenBlend_AfterYesNo();
    *pState = PARTY_MENU_STATE_BEGIN_EXIT;
}

static void PartyMonContextMenuAction_Confirm(PartyMenu *partyMenu, int *pState) {
    partyMenu->args->selectedAction = PARTY_MENU_ACTION_RETURN_0;
    PartyMenu_DeleteContextMenuAndList(partyMenu);
    PartyMenu_DisableMainScreenBlend_AfterYesNo();
    *pState = PARTY_MENU_STATE_BEGIN_EXIT;
}

static void PartyMonContextMenuAction_Summary(PartyMenu *partyMenu, int *pState) {
    partyMenu->args->selectedAction = PARTY_MENU_ACTION_RETURN_1;
    PartyMenu_DeleteContextMenuAndList(partyMenu);
    PartyMenu_DisableMainScreenBlend_AfterYesNo();
    *pState = PARTY_MENU_STATE_BEGIN_EXIT;
}

static void PartyMonContextMenuAction_Set(PartyMenu *partyMenu, int *pState) {
    PartyMenu_DeleteContextMenuAndList(partyMenu);
    PartyMenu_DisableMainScreenBlend_AfterYesNo();
    ClearFrameAndWindow2(&partyMenu->windows[PARTY_MENU_WINDOW_ID_33], TRUE);
    *pState = PartyMenu_HandleSetMonCapsule(partyMenu);
}

int PartyMenu_HandleSetMonCapsule(PartyMenu *partyMenu) {
    Pokemon *mon = Party_GetMonByIndex(partyMenu->args->party, partyMenu->partyMonIndex);
    if (GetMonData(mon, MON_DATA_CAPSULE, NULL) == 0) {
        ReadMsgDataIntoString(partyMenu->msgData, msg_0300_00118, partyMenu->formattedStrBuf);
        Sprite_SetDrawFlag(partyMenu->sprites[PARTY_MENU_SPRITE_ID_MON1_CAPSULE + partyMenu->partyMonIndex], TRUE);
    } else {
        ReadMsgDataIntoString(partyMenu->msgData, msg_0300_00119, partyMenu->formattedStrBuf);
        partyMenu->partyMonIndex = 7;
    }
    PartyMenu_PrintMessageOnWindow34(partyMenu, -1, TRUE);
    partyMenu->args->selectedAction = PARTY_MENU_ACTION_RETURN_0;
    partyMenu->afterTextPrinterState = PARTY_MENU_STATE_AFTER_MESSAGE_BEGIN_EXIT;
    return PARTY_MENU_STATE_WAIT_TEXT_PRINTER;
}

static void PartyMenuContextMenuAction_FieldMoveCommon(PartyMenu *partyMenu, int *pState) {
    FieldMoveCheckFunc func;
    int response;
    int msgId;

    func = FieldMove_GetMoveFunc(FIELD_MOVE_FUNC_CHECK, partyMenu->args->selectedAction - PARTY_MENU_ACTION_RETURN_FIELD_MOVE_BEGIN);
    if (func != NULL) {
        response = func(partyMenu->args->fieldMoveCheckData);
    } else {
        response = FIELD_MOVE_RESPONSE_NOT_HERE;
    }
    switch (response) {
    case FIELD_MOVE_RESPONSE_OK:
        PartyMenu_DeleteContextMenuAndList(partyMenu);
        PartyMenu_DisableMainScreenBlend_AfterYesNo();
        *pState = PARTY_MENU_STATE_BEGIN_EXIT;
        return;
    case FIELD_MOVE_RESPONSE_NOT_HERE:
        msgId = msg_0300_00101;
        break;
    case FIELD_MOVE_RESPONSE_NEED_BADGE:
        msgId = msg_0300_00077;
        break;
    case FIELD_MOVE_RESPONSE_HAVE_FOLLOWER:
        msgId = msg_0300_00180;
        break;
    case FIELD_MOVE_RESPONSE_ALREADY_SURFING:
        msgId = msg_0300_00100;
        break;
    case FIELD_MOVE_RESPONSE_NOT_NOW:
        msgId = msg_0300_00181;
        break;
    }
    ClearFrameAndWindow2(&partyMenu->windows[PARTY_MENU_WINDOW_ID_33], TRUE);
    PartyMenu_DeleteContextMenuAndList(partyMenu);
    PartyMenu_DisableMainScreenBlend_AfterYesNo();
    PartyMenu_PrintMessageOnWindow34(partyMenu, msgId, TRUE);
    partyMenu->afterTextPrinterState = PARTY_MENU_STATE_3;
    *pState = PARTY_MENU_STATE_WAIT_TEXT_PRINTER;
}

static void PartyMonContextMenuAction_Cut(PartyMenu *partyMenu, int *pState) {
    partyMenu->args->selectedAction = PARTY_MENU_ACTION_RETURN_CUT;
    PartyMenuContextMenuAction_FieldMoveCommon(partyMenu, pState);
}

static void PartyMonContextMenuAction_RockSmash(PartyMenu *partyMenu, int *pState) {
    partyMenu->args->selectedAction = PARTY_MENU_ACTION_RETURN_ROCK_SMASH;
    PartyMenuContextMenuAction_FieldMoveCommon(partyMenu, pState);
}

static void PartyMonContextMenuAction_Strength(PartyMenu *partyMenu, int *pState) {
    partyMenu->args->selectedAction = PARTY_MENU_ACTION_RETURN_STRENGTH;
    PartyMenuContextMenuAction_FieldMoveCommon(partyMenu, pState);
}

static void PartyMonContextMenuAction_Surf(PartyMenu *partyMenu, int *pState) {
    partyMenu->args->selectedAction = PARTY_MENU_ACTION_RETURN_SURF;
    PartyMenuContextMenuAction_FieldMoveCommon(partyMenu, pState);
}

static void PartyMonContextMenuAction_RockClimb(PartyMenu *partyMenu, int *pState) {
    partyMenu->args->selectedAction = PARTY_MENU_ACTION_RETURN_ROCK_CLIMB;
    PartyMenuContextMenuAction_FieldMoveCommon(partyMenu, pState);
}

static void PartyMonContextMenuAction_Fly(PartyMenu *partyMenu, int *pState) {
    partyMenu->args->selectedAction = PARTY_MENU_ACTION_RETURN_FLY;
    PartyMenuContextMenuAction_FieldMoveCommon(partyMenu, pState);
}

static void PartyMonContextMenuAction_Waterfall(PartyMenu *partyMenu, int *pState) {
    partyMenu->args->selectedAction = PARTY_MENU_ACTION_RETURN_WATERFALL;
    PartyMenuContextMenuAction_FieldMoveCommon(partyMenu, pState);
}

static void PartyMonContextMenuAction_Whirlpool(PartyMenu *partyMenu, int *pState) {
    partyMenu->args->selectedAction = PARTY_MENU_ACTION_RETURN_WHIRLPOOL;
    PartyMenuContextMenuAction_FieldMoveCommon(partyMenu, pState);
}

static void PartyMonContextMenuAction_Flash(PartyMenu *partyMenu, int *pState) {
    partyMenu->args->selectedAction = PARTY_MENU_ACTION_RETURN_FLASH;
    PartyMenuContextMenuAction_FieldMoveCommon(partyMenu, pState);
}

static void PartyMonContextMenuAction_Teleport(PartyMenu *partyMenu, int *pState) {
    partyMenu->args->selectedAction = PARTY_MENU_ACTION_RETURN_TELEPORT;
    PartyMenuContextMenuAction_FieldMoveCommon(partyMenu, pState);
}

static void PartyMonContextMenuAction_Dig(PartyMenu *partyMenu, int *pState) {
    partyMenu->args->selectedAction = PARTY_MENU_ACTION_RETURN_DIG;
    PartyMenuContextMenuAction_FieldMoveCommon(partyMenu, pState);
}

static void PartyMonContextMenuAction_SweetScent(PartyMenu *partyMenu, int *pState) {
    partyMenu->args->selectedAction = PARTY_MENU_ACTION_RETURN_SWEET_SCENT;
    PartyMenuContextMenuAction_FieldMoveCommon(partyMenu, pState);
}

static void PartyMonContextMenuAction_Chatter(PartyMenu *partyMenu, int *pState) {
    partyMenu->args->selectedAction = PARTY_MENU_ACTION_RETURN_CHATTER;
    PartyMenuContextMenuAction_FieldMoveCommon(partyMenu, pState);
}

static void PartyMonContextMenuAction_MilkDrink(PartyMenu *partyMenu, int *pState) {
    *pState = PartyMonContextMenuAction_TransferHP(partyMenu);
    if (*pState == PARTY_MENU_STATE_SOFTBOILED) {
        partyMenu->levelUpStatsTmp[3] = PARTY_MENU_ACTION_RETURN_MILK_DRINK - PARTY_MENU_ACTION_RETURN_FIELD_MOVE_BEGIN;
    }
}

static void PartyMonContextMenuAction_Softboiled(PartyMenu *partyMenu, int *pState) {
    *pState = PartyMonContextMenuAction_TransferHP(partyMenu);
    if (*pState == PARTY_MENU_STATE_SOFTBOILED) {
        partyMenu->levelUpStatsTmp[3] = PARTY_MENU_ACTION_RETURN_SOFTBOILED - PARTY_MENU_ACTION_RETURN_FIELD_MOVE_BEGIN;
    }
}

static void PartyMonContextMenuAction_Headbutt(PartyMenu *partyMenu, int *pState) {
    partyMenu->args->selectedAction = PARTY_MENU_ACTION_RETURN_HEADBUTT;
    PartyMenuContextMenuAction_FieldMoveCommon(partyMenu, pState);
}

static int PartyMonContextMenuAction_TransferHP(PartyMenu *partyMenu) {
    ClearFrameAndWindow2(&partyMenu->windows[PARTY_MENU_WINDOW_ID_33], TRUE);
    PartyMenu_DeleteContextMenuAndList(partyMenu);
    PartyMenu_DisableMainScreenBlend_AfterYesNo();
    partyMenu->levelUpStatsTmp[0] = partyMenu->monsDrawState[partyMenu->partyMonIndex].maxHp / 5;
    if (partyMenu->monsDrawState[partyMenu->partyMonIndex].hp <= partyMenu->levelUpStatsTmp[0]) {
        PartyMenu_PrintMessageOnWindow34(partyMenu, msg_0300_00127, TRUE);
        partyMenu->afterTextPrinterState = PARTY_MENU_STATE_3;
        return PARTY_MENU_STATE_WAIT_TEXT_PRINTER;
    }
    partyMenu->secondCursorActive = 1;
    partyMenu->softboiledDonorSlot = partyMenu->partyMonIndex;
    thunk_Sprite_SetPaletteOverride(partyMenu->sprites[PARTY_MENU_SPRITE_ID_CURSOR], 0);
    s16 x, y;
    Sprite_GetPositionXY(partyMenu->sprites[PARTY_MENU_SPRITE_ID_CURSOR], &x, &y);
    Sprite_SetPositionXY(partyMenu->sprites[PARTY_MENU_SPRITE_ID_SWITCH_MON_CURSOR], x, y);
    Sprite_SetAnimCtrlSeq(partyMenu->sprites[PARTY_MENU_SPRITE_ID_SWITCH_MON_CURSOR], sub_0207B5EC(partyMenu->args->unk_25, partyMenu->softboiledDonorSlot) + 2);
    Sprite_SetDrawFlag(partyMenu->sprites[PARTY_MENU_SPRITE_ID_SWITCH_MON_CURSOR], TRUE);
    sub_0207A7F4(partyMenu, partyMenu->softboiledDonorSlot);
    PartyMenu_PrintMessageOnWindow32(partyMenu, msg_0300_00037, TRUE);
    partyMenu->levelUpStatsTmp[1] = 0;
    return PARTY_MENU_STATE_SOFTBOILED;
}

int sub_02080B74(PartyMenu *partyMenu) {
    ClearFrameAndWindow2(&partyMenu->windows[PARTY_MENU_WINDOW_ID_34], TRUE);
    PartyMenu_PrintMessageOnWindow32(partyMenu, msg_0300_00029, TRUE);
    PartyMenu_SetTopScreenSelectionPanelVisibility(partyMenu, FALSE);
    thunk_Sprite_SetPaletteOverride(partyMenu->sprites[PARTY_MENU_SPRITE_ID_CURSOR], 0);
    G2_BlendNone();
    return PARTY_MENU_STATE_1;
}
