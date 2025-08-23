#include "global.h"

#include "application/pokegear/phone/phone_internal.h"

#include "font.h"
#include "text.h"
#include "unk_02005D10.h"

void ov101_021F0990(PokegearPhoneAppData *phoneApp);
void PokegearPhone_ContextMenu_OnCursorMove_DynamicTooltip(TouchscreenListMenu *menu, u8 cursorPos, void *callbackArg, int event);
void PokegearPhone_ContextMenu_OnCursorMove_StaticTooltip(TouchscreenListMenu *menu, u8 cursorPos, void *callbackArg, int event);

void PokegearPhone_InitContextMenus(PokegearPhoneAppData *phoneApp) {
    int i;
    int j;
    const PokegearPhoneContextMenuParam *param;

    for (i = 0; i < PHONE_CONTEXT_MENU_MAX; ++i) {
        param = &sContextMenuParam[i];
        phoneApp->listMenuItems[i] = ListMenuItems_New(param->nItems, phoneApp->heapID);
        for (j = 0; j < param->nItems; ++j) {
            ListMenuItems_AppendFromMsgData(phoneApp->listMenuItems[i], phoneApp->msgData, param->baseMsg + j, j);
        }
    }
}

void PokegearPhone_DeleteContextMenus(PokegearPhoneAppData *phoneApp) {
    for (int i = 0; i < PHONE_CONTEXT_MENU_MAX; ++i) {
        ListMenuItems_Delete(phoneApp->listMenuItems[i]);
        phoneApp->listMenuItems[i] = NULL;
    }
}

void ov101_021F0900(PokegearPhoneAppData *phoneApp) {
    ov101_021F0990(phoneApp);
    if (phoneApp->pokegear->cursorInAppSwitchZone == 0) {
        PokegearCursorManager_SetCursorSpritesDrawState(phoneApp->pokegear->cursorManager, 0, FALSE);
    } else {
        PokegearCursorManager_SetCursorSpritesDrawState(phoneApp->pokegear->cursorManager, 0, TRUE);
        PokegearCursorManager_SetSpecIndexAndCursorPos(phoneApp->pokegear->cursorManager, 0, PokegearApp_AppIdToButtonIndex(phoneApp->pokegear));
        PhoneContactListUI_SetCursorSpritePos(&phoneApp->contactListUI, 255, 0);
    }
}

void PokegearPhone_OnReselectApp(void *cb_arg) {
    PokegearPhoneAppData *phoneApp = cb_arg;

    PhoneContactListUI_SetCursorSpritePos(&phoneApp->contactListUI, 255, TRUE);
}

void ov101_021F0954(PokegearPhoneAppData *phoneApp) {
    phoneApp->pokegear->cursorInAppSwitchZone = 0;
    PhoneContactListUI_SetCursorSpritePos(&phoneApp->contactListUI, 255, TRUE);
    PokegearCursorManager_SetCursorSpritesDrawState(phoneApp->pokegear->cursorManager, 0, FALSE);
}

void ov101_021F0978(void *cb_arg) {
    PokegearPhoneAppData *phoneApp = cb_arg;

    PhoneContactListUI_UpdateMoveContactArrowSprites(&phoneApp->contactListUI, PhoneContactListUI_GetCursorPos(&phoneApp->contactListUI), TRUE);
}

void ov101_021F0990(PokegearPhoneAppData *phoneApp) {
    PokegearPhone_InitContactListUI(phoneApp);
    PokegearPhone_ContactLinkedListToSlotsArray(phoneApp);
    PokegearPhone_SetContactListUIAndDraw(phoneApp, &phoneApp->contactListUI, 0, 0);
}

TouchscreenListMenu *PokegearPhoneApp_TouchscreenListMenu_Create(PokegearPhoneAppData *phoneApp, int prevMenuCursorPos, int menuID) {
    TouchscreenListMenuHeader header;

    phoneApp->prevMenuCursorPos = prevMenuCursorPos; // this is never used
    MI_CpuClear8(&header, sizeof(TouchscreenListMenuHeader));
    header.template = (TouchscreenListMenuTemplate) {
        .wrapAround = TRUE,
        .centered = TRUE,
        .xOffset = 0,
        .bgId = 1,
        .plttOffset = 13,
        .unk4 = 0,
        .unk5 = 0,
        .baseTile = 0x304,
        .charOffset = 0x3A4,
        .unkA = 0x00A0,
    };
    header.listMenuItems = phoneApp->listMenuItems[menuID];
    header.bgConfig = phoneApp->pokegear->bgConfig;
    header.numWindows = sContextMenuParam[menuID].nItems;
    if (menuID == 1) {
        phoneApp->touchscreenListMenu = TouchscreenListMenu_CreateWithCallback(phoneApp->contextMenuSpawner, &header, phoneApp->pokegear->menuInputState, sContextMenuParam[menuID].x, sContextMenuParam[menuID].y, sContextMenuParam[menuID].width, 0, PokegearPhone_ContextMenu_OnCursorMove_DynamicTooltip, phoneApp, TRUE);
    } else {
        phoneApp->touchscreenListMenu = TouchscreenListMenu_CreateWithCallback(phoneApp->contextMenuSpawner, &header, phoneApp->pokegear->menuInputState, sContextMenuParam[menuID].x, sContextMenuParam[menuID].y, sContextMenuParam[menuID].width, 0, PokegearPhone_ContextMenu_OnCursorMove_StaticTooltip, phoneApp, TRUE);
    }
    return phoneApp->touchscreenListMenu;
}

void PokegearPhone_ContextMenu_OnCursorMove_DynamicTooltip(TouchscreenListMenu *menu, u8 cursorPos, void *callbackArg, int event) {
    PokegearPhoneAppData *phoneApp = callbackArg;

    if (event != 0) {
        PlaySE(SEQ_SE_GS_GEARDECIDE);
    }
    PokegearPhone_PrintContextMenuTooltip(phoneApp, cursorPos + PHONE_TOOLTIP_SORT_TRAINER_TYPE, TRUE);
}

void PokegearPhone_ContextMenu_OnCursorMove_StaticTooltip(TouchscreenListMenu *menu, u8 cursorPos, void *callbackArg, int event) {
    if (event != 0) {
        PlaySE(SEQ_SE_GS_GEARDECIDE);
    }
}

void PokegearPhone_PrintContextMenuTooltip(PokegearPhoneAppData *phoneApp, u8 tooltipId, BOOL draw) {
    if (draw) {
        u32 xpos;
        CopyToBgTilemapRect(phoneApp->pokegear->bgConfig, GF_BG_LYR_MAIN_1, 0, 20, 32, 4, phoneApp->screenData->rawData, 0, 24, phoneApp->screenData->screenWidth / 8, phoneApp->screenData->screenHeight / 8);
        FillWindowPixelBuffer(&phoneApp->windows[3], 5);
        xpos = (256 - FontID_String_GetWidth(0, phoneApp->tooltipStrings[tooltipId], 0)) / 2;
        AddTextPrinterParameterizedWithColor(&phoneApp->windows[3], 0, phoneApp->tooltipStrings[tooltipId], xpos, 0, TEXT_SPEED_INSTANT, MAKE_TEXT_COLOR(3, 2, 5), NULL);
    } else {
        ClearWindowTilemapAndScheduleTransfer(&phoneApp->windows[3]);
        FillBgTilemapRect(phoneApp->pokegear->bgConfig, GF_BG_LYR_MAIN_1, 0, 0, 20, 32, 4, TILEMAP_FILL_OVWT_PAL);
    }
    ScheduleBgTilemapBufferTransfer(phoneApp->pokegear->bgConfig, GF_BG_LYR_MAIN_1);
}

void PokegearPhone_ReturnToContactList(PokegearPhoneAppData *phoneApp) {
    PhoneContactListUI_DeselectContact(&phoneApp->contactListUI);
    PhoneContactListUI_ShowMainListCursorSprites(&phoneApp->contactListUI, TRUE);
    PokegearPhone_OnReselectApp(phoneApp);
}

int PokegearPhone_HandleKeyInput_ContactList(PokegearPhoneAppData *phoneApp) {
    int result;

    if (gSystem.newKeys & PAD_BUTTON_B) {
        if (phoneApp->menuInputStateBak == 0) {
            phoneApp->pokegear->cursorInAppSwitchZone = 1;
            PlaySE(SEQ_SE_GS_GEARCANCEL);
            PokegearCursorManager_SetCursorSpritesDrawState(phoneApp->pokegear->cursorManager, 0, TRUE);
            PokegearCursorManager_SetSpecIndexAndCursorPos(phoneApp->pokegear->cursorManager, 0, PokegearApp_AppIdToButtonIndex(phoneApp->pokegear));
            PhoneContactListUI_SetCursorSpritePos(&phoneApp->contactListUI, 255, 0);
            return -1;
        }
    }

    result = PhoneContactListUI_HandleKeyInput(&phoneApp->contactListUI);
    if (result >= 0) {
        phoneApp->callerID = phoneApp->contactListUI.slotData[result].contactID;
        PlaySE(SEQ_SE_GS_GEARDECIDE);
        PhoneContactListUI_ShowMainListCursorSprites(&phoneApp->contactListUI, FALSE);
        PokegearPhoneApp_TouchscreenListMenu_Create(phoneApp, PhoneContactListUI_GetCursorPos(&phoneApp->contactListUI), 0);
        PokegearPhone_PrintContextMenuTooltip(phoneApp, 0, TRUE);
        return 8;
    }

    return -1;
}

int PokegearPhone_HandleTouchInput(PokegearPhoneAppData *phoneApp) {
    int result;
    if (phoneApp->menuInputStateBak == 0) {
        result = PokegearApp_HandleTouchInput_SwitchApps(phoneApp->pokegear);
        if (result != -1) {
            phoneApp->pokegear->menuInputState = MENU_INPUT_STATE_TOUCH;
            return result;
        }
    }

    result = PhoneContactListUI_HandleTouchInput(&phoneApp->contactListUI);
    if (result >= 0) {
        if (phoneApp->pokegear->cursorInAppSwitchZone == 1) {
            ov101_021F0954(phoneApp);
        }
        if (result == 0) {
            return -1;
        } else {
            phoneApp->callerID = phoneApp->contactListUI.slotData[result - 1].contactID;
            PlaySE(SEQ_SE_GS_GEARDECIDE);
            PhoneContactListUI_ShowMainListCursorSprites(&phoneApp->contactListUI, FALSE);
            PokegearPhoneApp_TouchscreenListMenu_Create(phoneApp, PhoneContactListUI_GetCursorPos(&phoneApp->contactListUI), 0);
            PokegearPhone_PrintContextMenuTooltip(phoneApp, 0, TRUE);
            phoneApp->pokegear->menuInputState = MENU_INPUT_STATE_TOUCH;
            return 8;
        }
    }

    return -1;
}

// return value is a state for PokegearPhone_HandleMoveContactsInput
int PokegearPhone_HandleInput_MovingContacts(PokegearPhoneAppData *phoneApp) {
    int isTouch;
    int result;

    isTouch = 0;
    result = PhoneContactListUI_HandleTouchInput2(&phoneApp->contactListUI, &isTouch);
    if (isTouch == 0) {
        if (phoneApp->menuInputStateBak == 0) {
            PokegearApp_HandleInputModeChangeToButtons(phoneApp->pokegear);
        }
        result = PhoneContactListUI_HandleKeyInput2(&phoneApp->contactListUI);
    } else {
        phoneApp->pokegear->menuInputState = MENU_INPUT_STATE_TOUCH;
    }
    if (result < 0) {
        return 0;
    }
    if (result == phoneApp->contactListUI.selectedIndex) {
        return 1;
    }
    PokegearPhone_ContactList_InsertNode(phoneApp, phoneApp->contactListUI.slotData[phoneApp->contactListUI.selectedIndex].node, result);
    phoneApp->contactListUI.selectedIndex = result;
    PokegearPhone_ContactLinkedListToSlotsArray(phoneApp);
    PokegearPhone_SetContactListUIAndDraw(phoneApp, &phoneApp->contactListUI, phoneApp->contactListUI.firstContactOnPage, phoneApp->contactListUI.cursorPos);
    return 1;
}

void PokegearPhone_ContactList_CreateLinkedList(PokegearPhoneAppData *phoneApp) {
    phoneApp->phoneContactListNodes = Heap_Alloc(phoneApp->heapID, phoneApp->numContacts * sizeof(PhoneContactListNode));
    PokegearPhone_InitContactsLinkedList(phoneApp);
}

void PokegearPhone_ContactList_FlushAndDestroyLinkedList(PokegearPhoneAppData *phoneApp) {
    u8 i = 0;
    PhoneContactListNode *ptr;

    phoneApp->saveContacts[i++].id = phoneApp->contactListHead->contact.id;
    ptr = phoneApp->contactListHead->next;
    while (ptr != phoneApp->contactListHead) {
        phoneApp->saveContacts[i++].id = ptr->contact.id;
        ptr = ptr->next;
    }
    SavePokegear_SetPhonebookFromBuffer(phoneApp->pokegear->savePokegear, phoneApp->saveContacts, phoneApp->numContacts);
    MI_CpuClear8(phoneApp->phoneContactListNodes, phoneApp->numContacts * sizeof(PhoneContactListNode));
    Heap_Free(phoneApp->phoneContactListNodes);
}

void PokegearPhone_ContactList_InsertNode(PokegearPhoneAppData *phoneApp, PhoneContactListNode *newNode, u8 index) {
    int i = 0;
    PhoneContactListNode *curNode;

    newNode->prev->next = newNode->next;
    newNode->next->prev = newNode->prev;
    if (newNode == phoneApp->contactListHead) {
        phoneApp->contactListHead = newNode->next;
    }
    if (newNode == phoneApp->contactListTail) {
        phoneApp->contactListTail = newNode->prev;
    }
    if (index == phoneApp->numContacts - 1) {
        newNode->prev = phoneApp->contactListTail;
        newNode->next = phoneApp->contactListTail->next;
        phoneApp->contactListTail->next = newNode;
        phoneApp->contactListHead->prev = newNode;
        phoneApp->contactListTail = newNode;
    } else {
        curNode = phoneApp->contactListHead;
        do {
            if (i++ != index) {
                curNode = curNode->next;
            } else {
                newNode->next = curNode;
                newNode->prev = curNode->prev;
                newNode->prev->next = newNode;
                curNode->prev = newNode;
                if (curNode == phoneApp->contactListHead) {
                    phoneApp->contactListHead = newNode;
                }
                return;
            }
        } while (curNode != phoneApp->contactListHead);
    }
}

void PokegearPhone_SortList(PokegearPhoneAppData *phoneApp, u8 sortParam) {
    PhoneBookEntry *phoneBook = phoneApp->callContext->phoneEntries;
    for (int i = 0; i < phoneApp->numContacts - 1; ++i) {
        for (int j = phoneApp->numContacts - 1; j > i; --j) {
            if (phoneBook[phoneApp->saveContacts[j].id].sortParam[sortParam] < phoneBook[phoneApp->saveContacts[i].id].sortParam[sortParam]) {
                u8 tmp = phoneApp->saveContacts[i].id;
                phoneApp->saveContacts[i].id = phoneApp->saveContacts[j].id;
                phoneApp->saveContacts[j].id = tmp;
            }
        }
    }
    PokegearPhone_InitContactsLinkedList(phoneApp);
    PokegearPhone_ContactLinkedListToSlotsArray(phoneApp);
    phoneApp->contactListUI.cursorPos = 0;
    phoneApp->contactListUI.firstContactOnPage = phoneApp->contactListUI.cursorPos;
    PokegearPhone_SetContactListUIAndDraw(phoneApp, &phoneApp->contactListUI, phoneApp->contactListUI.firstContactOnPage, phoneApp->contactListUI.cursorPos);
}
