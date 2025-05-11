#include "global.h"

#include "application/pokegear/phone/phone_internal.h"

#include "font.h"
#include "text.h"
#include "unk_02005D10.h"

void ov101_021F0990(PokegearPhoneAppData *phoneApp);
void ov101_021F0A94(TouchscreenListMenu *menu, u8 cursorPos, void *callbackArg, int event);
void ov101_021F0AB8(TouchscreenListMenu *menu, u8 cursorPos, void *callbackArg, int event);

void ov101_021F0880(PokegearPhoneAppData *phoneApp) {
    int i;
    int j;
    const UnkStruct_ov101_021F8404 *r5;

    for (i = 0; i < 7; ++i) {
        r5 = &ov101_021F8404[i];
        phoneApp->listMenuItems[i] = ListMenuItems_New(r5->nItems, phoneApp->heapId);
        for (j = 0; j < r5->nItems; ++j) {
            ListMenuItems_AppendFromMsgData(phoneApp->listMenuItems[i], phoneApp->unk_014, r5->baseMsg + j, j);
        }
    }
}

void ov101_021F08DC(PokegearPhoneAppData *phoneApp) {
    for (int i = 0; i < 7; ++i) {
        ListMenuItems_Delete(phoneApp->listMenuItems[i]);
        phoneApp->listMenuItems[i] = NULL;
    }
}

void ov101_021F0900(PokegearPhoneAppData *phoneApp) {
    ov101_021F0990(phoneApp);
    if (phoneApp->pokegear->cursorInAppSwitchZone == 0) {
        ov100_021E7128(phoneApp->pokegear->appSwitchCursor, 0, FALSE);
    } else {
        ov100_021E7128(phoneApp->pokegear->appSwitchCursor, 0, TRUE);
        ov100_021E72F8(phoneApp->pokegear->appSwitchCursor, 0, ov100_021E5DC8(phoneApp->pokegear));
        PhoneContactListUI_SetCursorSpritePos(&phoneApp->contactListUI, 255, 0);
    }
}

void ov101_021F0944(void *cb_arg) {
    PokegearPhoneAppData *phoneApp = cb_arg;

    PhoneContactListUI_SetCursorSpritePos(&phoneApp->contactListUI, 255, 1);
}

void ov101_021F0954(PokegearPhoneAppData *phoneApp) {
    phoneApp->pokegear->cursorInAppSwitchZone = 0;
    PhoneContactListUI_SetCursorSpritePos(&phoneApp->contactListUI, 255, 1);
    ov100_021E7128(phoneApp->pokegear->appSwitchCursor, 0, FALSE);
}

void ov101_021F0978(void *cb_arg) {
    PokegearPhoneAppData *phoneApp = cb_arg;

    ov101_021F1364(&phoneApp->contactListUI, PhoneContactListUI_GetCursorPos(&phoneApp->contactListUI), 1);
}

void ov101_021F0990(PokegearPhoneAppData *phoneApp) {
    PokegearPhone_InitContactListUI(phoneApp);
    ov101_021F11B0(phoneApp);
    PokegearPhone_SetContactListUIAndDraw(phoneApp, &phoneApp->contactListUI, 0, 0);
}

TouchscreenListMenu *PokegearPhoneApp_TouchscreenListMenu_Create(PokegearPhoneAppData *phoneApp, int a1, int menuID) {
    TouchscreenListMenuHeader header;

    phoneApp->unk_0CC = a1;
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
    header.numWindows = ov101_021F8404[menuID].nItems;
    if (menuID == 1) {
        phoneApp->touchscreenListMenu = TouchscreenListMenu_CreateWithCallback(phoneApp->unk_0C0, &header, phoneApp->pokegear->menuInputState, ov101_021F8404[menuID].x, ov101_021F8404[menuID].y, ov101_021F8404[menuID].width, 0, ov101_021F0A94, phoneApp, TRUE);
    } else {
        phoneApp->touchscreenListMenu = TouchscreenListMenu_CreateWithCallback(phoneApp->unk_0C0, &header, phoneApp->pokegear->menuInputState, ov101_021F8404[menuID].x, ov101_021F8404[menuID].y, ov101_021F8404[menuID].width, 0, ov101_021F0AB8, phoneApp, TRUE);
    }
    return phoneApp->touchscreenListMenu;
}

void ov101_021F0A94(TouchscreenListMenu *menu, u8 cursorPos, void *callbackArg, int event) {
    PokegearPhoneAppData *phoneApp = callbackArg;

    if (event != 0) {
        PlaySE(SEQ_SE_GS_GEARDECIDE);
    }
    ov101_021F0ACC(phoneApp, cursorPos + 3, TRUE);
}

void ov101_021F0AB8(TouchscreenListMenu *menu, u8 cursorPos, void *callbackArg, int event) {
    if (event != 0) {
        PlaySE(SEQ_SE_GS_GEARDECIDE);
    }
}

void ov101_021F0ACC(PokegearPhoneAppData *phoneApp, u8 a1, BOOL a2) {
    if (a2) {
        u32 xpos;
        CopyToBgTilemapRect(phoneApp->pokegear->bgConfig, GF_BG_LYR_MAIN_1, 0, 20, 32, 4, phoneApp->unk_50C->rawData, 0, 24, phoneApp->unk_50C->screenWidth / 8, phoneApp->unk_50C->screenHeight / 8);
        FillWindowPixelBuffer(&phoneApp->unk_048[3], 5);
        xpos = (256 - FontID_String_GetWidth(0, phoneApp->unk_024[a1], 0)) / 2;
        AddTextPrinterParameterizedWithColor(&phoneApp->unk_048[3], 0, phoneApp->unk_024[a1], xpos, 0, TEXT_SPEED_INSTANT, MAKE_TEXT_COLOR(3, 2, 5), NULL);
    } else {
        ClearWindowTilemapAndScheduleTransfer(&phoneApp->unk_048[3]);
        FillBgTilemapRect(phoneApp->pokegear->bgConfig, GF_BG_LYR_MAIN_1, 0, 0, 20, 32, 4, TILEMAP_FILL_OVWT_PAL);
    }
    ScheduleBgTilemapBufferTransfer(phoneApp->pokegear->bgConfig, GF_BG_LYR_MAIN_1);
}

void ov101_021F0B84(PokegearPhoneAppData *phoneApp) {
    ov101_021F1808(&phoneApp->contactListUI);
    ov101_021F1338(&phoneApp->contactListUI, TRUE);
    ov101_021F0944(phoneApp);
}

int PokegearPhone_HandleKeyInput_ContactList(PokegearPhoneAppData *phoneApp) {
    if (gSystem.newKeys & PAD_BUTTON_B) {
        if (phoneApp->menuInputStateBak == 0) {
            phoneApp->pokegear->cursorInAppSwitchZone = 1;
            PlaySE(SEQ_SE_GS_GEARCANCEL);
            ov100_021E7128(phoneApp->pokegear->appSwitchCursor, 0, TRUE);
            ov100_021E72F8(phoneApp->pokegear->appSwitchCursor, 0, ov100_021E5DC8(phoneApp->pokegear));
            PhoneContactListUI_SetCursorSpritePos(&phoneApp->contactListUI, 255, 0);
            return -1;
        }
    }

    int r0 = PhoneContactListUI_HandleKeyInput(&phoneApp->contactListUI);
    if (r0 >= 0) {
        phoneApp->callerID = phoneApp->contactListUI.slotData[r0].contactID;
        PlaySE(SEQ_SE_GS_GEARDECIDE);
        ov101_021F1338(&phoneApp->contactListUI, FALSE);
        PokegearPhoneApp_TouchscreenListMenu_Create(phoneApp, PhoneContactListUI_GetCursorPos(&phoneApp->contactListUI), 0);
        ov101_021F0ACC(phoneApp, 0, TRUE);
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
            ov101_021F1338(&phoneApp->contactListUI, FALSE);
            PokegearPhoneApp_TouchscreenListMenu_Create(phoneApp, PhoneContactListUI_GetCursorPos(&phoneApp->contactListUI), 0);
            ov101_021F0ACC(phoneApp, 0, TRUE);
            phoneApp->pokegear->menuInputState = MENU_INPUT_STATE_TOUCH;
            return 8;
        }
    }

    return -1;
}

BOOL PokegearPhone_HandleInput2(PokegearPhoneAppData *phoneApp) {
    int sp0;
    int r4;

    sp0 = 0;
    r4 = PhoneContactListUI_HandleTouchInput2(&phoneApp->contactListUI, &sp0);
    if (sp0 == 0) {
        if (phoneApp->menuInputStateBak == 0) {
            PokegearApp_HandleInputModeChangeToButtons(phoneApp->pokegear);
        }
        r4 = PhoneContactListUI_HandleKeyInput2(&phoneApp->contactListUI);
    } else {
        phoneApp->pokegear->menuInputState = MENU_INPUT_STATE_TOUCH;
    }
    if (r4 < 0) {
        return FALSE;
    }
    if (r4 == phoneApp->contactListUI.selectedIndex) {
        return TRUE;
    }
    PokegearPhone_ContactList_InsertNode(phoneApp, phoneApp->contactListUI.slotData[phoneApp->contactListUI.selectedIndex].node, r4);
    phoneApp->contactListUI.selectedIndex = r4;
    ov101_021F11B0(phoneApp);
    PokegearPhone_SetContactListUIAndDraw(phoneApp, &phoneApp->contactListUI, phoneApp->contactListUI.firstContactOnPage, phoneApp->contactListUI.cursorPos);
    return TRUE;
}

void ov101_021F0D6C(PokegearPhoneAppData *phoneApp) {
    phoneApp->unk_0D4 = AllocFromHeap(phoneApp->heapId, phoneApp->numContacts * sizeof(PhoneContactListNode));
    PokegearPhone_InitContactsLinkedList(phoneApp);
}

void PokegearPhone_ContactList_ToSaveArray(PokegearPhoneAppData *phoneApp) {
    u8 i = 0;
    PhoneContactListNode *ptr;

    phoneApp->saveContacts[i++].id = phoneApp->contactListHead->contact.id;
    ptr = phoneApp->contactListHead->next;
    while (ptr != phoneApp->contactListHead) {
        phoneApp->saveContacts[i++].id = ptr->contact.id;
        ptr = ptr->next;
    }
    GSPlayerMisc_SetPhonebookFromBuffer(phoneApp->pokegear->savePokegear, phoneApp->saveContacts, phoneApp->numContacts);
    MI_CpuClear8(phoneApp->unk_0D4, phoneApp->numContacts * sizeof(PhoneContactListNode));
    FreeToHeap(phoneApp->unk_0D4);
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

void ov101_021F0EB0(PokegearPhoneAppData *phoneApp, u8 a1) {
    PhoneBookEntry *r2 = phoneApp->callContext->phoneEntries;
    for (int i = 0; i < phoneApp->numContacts - 1; ++i) {
        for (int j = phoneApp->numContacts - 1; j > i; --j) {
            if (r2[phoneApp->saveContacts[j].id].sortParam[a1] < r2[phoneApp->saveContacts[i].id].sortParam[a1]) {
                u8 tmp = phoneApp->saveContacts[i].id;
                phoneApp->saveContacts[i].id = phoneApp->saveContacts[j].id;
                phoneApp->saveContacts[j].id = tmp;
            }
        }
    }
    PokegearPhone_InitContactsLinkedList(phoneApp);
    ov101_021F11B0(phoneApp);
    phoneApp->contactListUI.cursorPos = 0;
    phoneApp->contactListUI.firstContactOnPage = phoneApp->contactListUI.cursorPos;
    PokegearPhone_SetContactListUIAndDraw(phoneApp, &phoneApp->contactListUI, phoneApp->contactListUI.firstContactOnPage, phoneApp->contactListUI.cursorPos);
}
