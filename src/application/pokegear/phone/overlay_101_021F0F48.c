#include "global.h"

#include "application/pokegear/phone/phone_internal.h"

#include "text.h"
#include "unk_02005D10.h"

void PhoneContactListNode_Init(PhoneContactListNode *a0);
void PhoneContactListUISlotData_Init(PhoneContactListUISlotData *a0);
void PhoneContactListUI_DrawNameSlotBG(PhoneContactListUI *ui, u8 slot, BOOL colorIdx, BOOL copyNow);
void PhoneContactListUI_DrawNameSlotsBGs(PhoneContactListUI *ui);
u8 PhoneContactListUI_GetBackgroundIndex(PhoneContactListUI *ui, u8 slot);
void PhoneContactListUI_PrintNameAndClass(PhoneContactListUI *ui, u8 slot, u8 index, u8 selected, BOOL copyNow);
void PokegearContactListUI_UpdateScrollArrowSpritesVisibility(PhoneContactListUI *ui);
BOOL PokegearContactListUI_StartSingleScroll(PhoneContactListUI *ui, u8 direction);
BOOL PokegearContactListUI_ScrollStep(PhoneContactListUI *ui);
BOOL PhoneContactListUI_StartPageScroll(PhoneContactListUI *ui, u8 direction);
BOOL PhoneContactListUI_ScrollMany(PhoneContactListUI *ui);
void PhoneContactListUI_HandleScrollInProgress(PhoneContactListUI *ui);

static const TouchscreenHitbox ov101_021F8634[] = {
    { .rect = { 0x08, 0x20, 0x08, 0xE0 } },
    { .rect = { 0x20, 0x38, 0x08, 0xE0 } },
    { .rect = { 0x38, 0x50, 0x08, 0xE0 } },
    { .rect = { 0x50, 0x68, 0x08, 0xE0 } },
    { .rect = { 0x68, 0x80, 0x08, 0xE0 } },
    { .rect = { 0x80, 0x98, 0x08, 0xE0 } },
    { .rect = { 0x08, 0x50, 0xE0, 0xF8 } },
    { .rect = { 0x50, 0x98, 0xE0, 0xF8 } },
    { .rect = { TOUCHSCREEN_RECTLIST_END } },
};

static const TouchscreenHitbox ov101_021F8658[] = {
    { .rect = { 0x08, 0x18, 0x04, 0x24 } },
    { .rect = { 0x20, 0x30, 0x04, 0x24 } },
    { .rect = { 0x38, 0x48, 0x04, 0x24 } },
    { .rect = { 0x50, 0x60, 0x04, 0x24 } },
    { .rect = { 0x68, 0x78, 0x04, 0x24 } },
    { .rect = { 0x80, 0x90, 0x04, 0x24 } },
    { .rect = { 0x08, 0x50, 0xE0, 0xF8 } },
    { .rect = { 0x50, 0x98, 0xE0, 0xF8 } },
    { .rect = { TOUCHSCREEN_RECTLIST_END } },
};

void PokegearPhone_InitContactListUI(PokegearPhoneAppData *phoneApp) {
    int i;
    PhoneContactListUI *ui = &phoneApp->contactListUI;

    MI_CpuClear8(ui, sizeof(PhoneContactListUI));
    for (i = 0; i < NUM_PHONE_CONTACTS; ++i) {
        PhoneContactListUISlotData_Init(&ui->slotData[i]);
    }
    ui->numContacts = phoneApp->numContacts;
    ui->window = &phoneApp->unk_048[2];
    ui->callContext = phoneApp->callContext;
    ui->firstBgColor = 0;
    ui->menuInputStatePtr = &phoneApp->pokegear->menuInputState;
    ui->menuInputStateBakPtr = &phoneApp->menuInputStateBak;

    for (i = 0; i < 2; ++i) {
        ui->unk_3CC[i] = phoneApp->unk_088[4 + i];
    }
    for (i = 0; i < 6; ++i) {
        ui->unk_3D4[i] = phoneApp->unk_088[6 + i];
    }
    for (i = 0; i < 4; ++i) {
        ui->unk_3EC[i] = phoneApp->unk_088[i];
    }

    ui->textColors[0].fg1 = 1;
    ui->textColors[0].bg1 = 9;
    ui->textColors[0].sh1 = 2;
    ui->textColors[0].fg3 = 3;
    ui->textColors[0].sh3 = 4;
    ui->textColors[0].fill1 = 11;
    ui->textColors[0].fg2 = 5;
    ui->textColors[0].bg2 = 10;
    ui->textColors[0].sh2 = 6;
    ui->textColors[0].fg4 = 7;
    ui->textColors[0].sh4 = 8;
    ui->textColors[0].fill2 = 10;
    ui->textColors[0].nameColor_Deselected = MAKE_TEXT_COLOR(ui->textColors[0].fg1, ui->textColors[0].sh1, ui->textColors[0].bg1);
    ui->textColors[0].classColor_Deselected = MAKE_TEXT_COLOR(ui->textColors[0].fg2, ui->textColors[0].sh2, ui->textColors[0].bg2);
    ui->textColors[0].nameColor_Selected = MAKE_TEXT_COLOR(ui->textColors[0].fg3, ui->textColors[0].sh3, ui->textColors[0].bg1);
    ui->textColors[0].classColor_Selected = MAKE_TEXT_COLOR(ui->textColors[0].fg4, ui->textColors[0].sh4, ui->textColors[0].bg2);
    ui->textColors[1].fg1 = 1;
    ui->textColors[1].bg1 = 12;
    ui->textColors[1].sh1 = 2;
    ui->textColors[1].fg3 = 3;
    ui->textColors[1].sh3 = 4;
    ui->textColors[1].fill1 = 14;
    ui->textColors[1].fg2 = 5;
    ui->textColors[1].bg2 = 13;
    ui->textColors[1].sh2 = 6;
    ui->textColors[1].fg4 = 7;
    ui->textColors[1].sh4 = 8;
    ui->textColors[1].fill2 = 13;
    ui->textColors[1].nameColor_Deselected = MAKE_TEXT_COLOR(ui->textColors[1].fg1, ui->textColors[1].sh1, ui->textColors[1].bg1);
    ui->textColors[1].classColor_Deselected = MAKE_TEXT_COLOR(ui->textColors[1].fg2, ui->textColors[1].sh2, ui->textColors[1].bg2);
    ui->textColors[1].nameColor_Selected = MAKE_TEXT_COLOR(ui->textColors[1].fg3, ui->textColors[1].sh3, ui->textColors[1].bg1);
    ui->textColors[1].classColor_Selected = MAKE_TEXT_COLOR(ui->textColors[1].fg4, ui->textColors[1].sh4, ui->textColors[1].bg2);
}

void PokegearPhone_ContactLinkedListToSlotsArray(PokegearPhoneAppData *phoneApp) {
    int i;
    PhoneContactListNode *node;
    PhoneContactListUI *ui;

    ui = &phoneApp->contactListUI;
    node = phoneApp->contactListHead;
    for (i = 0; i < ui->numContacts; ++i) {
        ui->slotData[i].index = i;
        ui->slotData[i].contactID = node->contact.id;
        ui->slotData[i].node = node;
        node = node->next;
    }
}

void PokegearPhone_SetContactListUIAndDraw(PokegearPhoneAppData *phoneApp, PhoneContactListUI *ui, u8 firstContactOnPage, u8 cursorPos) {
    int i;
    int r4;

    if (firstContactOnPage >= ui->numContacts) {
        firstContactOnPage = 0;
    }
    PhoneContactListUI_DrawNameSlotsBGs(ui);
    ui->listBottomIndex = 0;
    ui->firstContactOnPage = firstContactOnPage;
    ui->selectedIndex = 0xFF;
    // Check if we are drawing fewer than 6 contacts
    for (i = 0, r4 = firstContactOnPage; i < 6; ++r4, ++i) {
        if (r4 >= ui->numContacts) {
            ui->lastContactIndex = r4 - 1;
            ui->listBottomIndex = i;
            break;
        }
        PhoneContactListUI_PrintNameAndClass(ui, i + 1, r4, 0, FALSE);
    }
    if (ui->listBottomIndex == 0) {
        ui->listBottomIndex = i;
        ui->lastContactIndex = i - 1 + firstContactOnPage;
    }
    if (cursorPos >= ui->listBottomIndex) {
        cursorPos = 0;
    }
    ui->cursorPos = cursorPos;
    CopyWindowToVram(ui->window);
    PokegearContactListUI_UpdateScrollArrowSpritesVisibility(ui);
    if (phoneApp->isIncomingCall != 0) {
        PhoneContactListUI_SetCursorSpritePos(ui, cursorPos, FALSE);
    } else {
        PhoneContactListUI_SetCursorSpritePos(ui, cursorPos, TRUE);
    }
}

void PhoneContactListUI_SetCursorSpritePos(PhoneContactListUI *ui, u8 position, u8 visible) {
    int i;

    if (visible != 0) {
        for (i = 0; i < 4; ++i) {
            Sprite_SetVisibleFlag(ui->unk_3EC[i], TRUE);
        }
    } else {
        for (i = 0; i < 4; ++i) {
            Sprite_SetVisibleFlag(ui->unk_3EC[i], FALSE);
        }
    }
    if (position >= 6) {
        position = ui->cursorPos;
    }
    if (ui->cursorPos >= ui->listBottomIndex) {
        ui->cursorPos = ui->listBottomIndex - 1;
        position = ui->cursorPos;
    }
    Sprite_SetPositionXY(ui->unk_3EC[0], 16, position * 24 + 8);
    Sprite_SetPositionXY(ui->unk_3EC[1], 16, position * 24 + 30);
    Sprite_SetPositionXY(ui->unk_3EC[2], 224, position * 24 + 8);
    Sprite_SetPositionXY(ui->unk_3EC[3], 224, position * 24 + 30);
}

void ov101_021F1338(PhoneContactListUI *a0, BOOL a1) {
    int i;

    for (i = 0; i < 4; ++i) {
        Sprite_SetAnimActiveFlag(a0->unk_3EC[i], a1);
        Sprite_SetVisibleFlag(a0->unk_3EC[i], TRUE);
    }
}

void ov101_021F1364(PhoneContactListUI *ui, int cursorPos, int a2) {
    int i;
    if (a2 != 0) {
        for (i = 0; i < ui->listBottomIndex; ++i) {
            Sprite_SetVisibleFlag(ui->unk_3D4[i], TRUE);
            if (cursorPos == i) {
                Sprite_SetAnimCtrlSeq(ui->unk_3D4[i], 7);
            } else {
                Sprite_SetAnimCtrlSeq(ui->unk_3D4[i], 6);
            }
        }
    } else {
        for (i = 0; i < 6; ++i) {
            Sprite_SetVisibleFlag(ui->unk_3D4[i], FALSE);
        }
    }
}

void ov101_021F13C8(PhoneContactListUI *ui, int a1) {
    if (a1 == 0) {
        ui->unk_006_1 = 0;
        ov101_021F1364(ui, 255, 0);
        ov101_021F1808(ui);
        PhoneContactListUI_SetCursorSpritePos(ui, ui->cursorPos, 1);
    } else {
        ui->unk_006_1 = 1;
        ov101_021F1364(ui, ui->cursorPos, 1);
    }
}

int PhoneContactListUI_HandleKeyInput(PhoneContactListUI *ui) {
    u8 selectedIndex;

    if (ui->isScrolling) {
        PhoneContactListUI_HandleScrollInProgress(ui);
        return -1;
    }
    if (ui->scrollTimer != 0) {
        --ui->scrollTimer;
        return -1;
    }
    selectedIndex = ui->firstContactOnPage + ui->cursorPos;
    if (gSystem.newKeys & PAD_BUTTON_A) {
        ui->selectedIndex = selectedIndex;
        PhoneContactListUI_PrintNameAndClass(ui, ui->cursorPos + 1, ui->selectedIndex, 1, TRUE);
        PlaySE(SEQ_SE_GS_GEARDECIDE);
        return ui->selectedIndex;
    }
    if (gSystem.newKeys & PAD_BUTTON_B) {}
    if (gSystem.newAndRepeatedKeys & PAD_KEY_UP) {
        if (selectedIndex == 0) { // no wraparound
            return -1;
        }
        PlaySE(SEQ_SE_GS_GEARCURSOR);
        if (ui->cursorPos == 0) {
            if (selectedIndex != 0) {
                PokegearContactListUI_StartSingleScroll(ui, 1);
            }
            return -1;
        } else {
            --ui->cursorPos;
            PhoneContactListUI_SetCursorSpritePos(ui, ui->cursorPos, 1);
            ui->scrollTimer = 2;
            return -1;
        }
    }
    if (gSystem.newAndRepeatedKeys & PAD_KEY_DOWN) {
        if (selectedIndex >= ui->numContacts - 1) { // no wraparound
            return -1;
        }
        PlaySE(SEQ_SE_GS_GEARCURSOR);
        if (ui->cursorPos == 5) {
            if (selectedIndex < ui->numContacts - 1) {
                PokegearContactListUI_StartSingleScroll(ui, 0);
            }
            return -1;
        } else {
            ++ui->cursorPos;
            PhoneContactListUI_SetCursorSpritePos(ui, ui->cursorPos, 1);
            ui->scrollTimer = 2;
            return -1;
        }
    }
    if (gSystem.newKeys & PAD_KEY_LEFT) {
        if (ui->firstContactOnPage != 0) {
            PlaySE(SEQ_SE_GS_GEARCURSOR);
            PhoneContactListUI_StartPageScroll(ui, 1);
        }
        return -1;
    }
    if (gSystem.newKeys & PAD_KEY_RIGHT) {
        if (ui->firstContactOnPage + 6 < ui->numContacts) {
            PlaySE(SEQ_SE_GS_GEARCURSOR);
            PhoneContactListUI_StartPageScroll(ui, 0);
        }
        return -1;
    }
    return -1;
}

int PhoneContactListUI_HandleKeyInput2(PhoneContactListUI *a0) {
    u8 contactIndex;

    if (a0->isScrolling) {
        PhoneContactListUI_HandleScrollInProgress(a0);
        return -1;
    }
    if (a0->scrollTimer != 0) {
        --a0->scrollTimer;
        return -1;
    }
    contactIndex = a0->firstContactOnPage + a0->cursorPos;
    if (gSystem.newKeys & PAD_BUTTON_A) {
        return contactIndex;
        ;
    }
    if (gSystem.newKeys & PAD_BUTTON_B) {
        return a0->selectedIndex;
    }
    if (gSystem.newAndRepeatedKeys & PAD_KEY_UP) {
        if (contactIndex == 0) { // no wraparound
            return -1;
        }
        PlaySE(SEQ_SE_GS_GEARCURSOR);
        if (a0->cursorPos == 0) {
            if (contactIndex != 0) {
                PokegearContactListUI_StartSingleScroll(a0, 1);
            }
            return -1;
        } else {
            --a0->cursorPos;
            ov101_021F1364(a0, a0->cursorPos, TRUE);
            a0->scrollTimer = 2;
            return -1;
        }
    }
    if (gSystem.newAndRepeatedKeys & PAD_KEY_DOWN) {
        if (contactIndex >= a0->numContacts - 1) { // no wraparound
            return -1;
        }
        PlaySE(SEQ_SE_GS_GEARCURSOR);
        if (a0->cursorPos == 5) {
            if (contactIndex < a0->numContacts - 1) {
                PokegearContactListUI_StartSingleScroll(a0, 0);
            }
            return -1;
        } else {
            ++a0->cursorPos;
            ov101_021F1364(a0, a0->cursorPos, TRUE);
            a0->scrollTimer = 2;
            return -1;
        }
    }
    if (gSystem.newKeys & PAD_KEY_LEFT) {
        if (a0->firstContactOnPage != 0) {
            PlaySE(SEQ_SE_GS_GEARCURSOR);
            PhoneContactListUI_StartPageScroll(a0, 1);
        }
        return -1;
    }
    if (gSystem.newKeys & PAD_KEY_RIGHT) {
        if (a0->firstContactOnPage + 6 < a0->numContacts) {
            PlaySE(SEQ_SE_GS_GEARCURSOR);
            PhoneContactListUI_StartPageScroll(a0, 0);
        }
        return -1;
    }
    return -1;
}

int PhoneContactListUI_HandleTouchInput(PhoneContactListUI *ui) {
    int result;
    if (ui->isScrolling) {
        PhoneContactListUI_HandleScrollInProgress(ui);
        return -1;
    }
    result = TouchscreenHitbox_FindRectAtTouchNew(ov101_021F8634);
    if (result == -1) {
        return -1;
    }

    if (result < 6 && result < ui->listBottomIndex) {
        ui->cursorPos = result;
        ui->selectedIndex = ui->firstContactOnPage + result;
        PhoneContactListUI_PrintNameAndClass(ui, ui->cursorPos + 1, ui->selectedIndex, 1, TRUE);
        PhoneContactListUI_SetCursorSpritePos(ui, ui->cursorPos, 1);
        PlaySE(SEQ_SE_GS_GEARDECIDE);
        return ui->selectedIndex + 1;
    }
    if (result == 6 && ui->firstContactOnPage != 0) {
        PhoneContactListUI_StartPageScroll(ui, 1);
        PlaySE(SEQ_SE_GS_GEARCURSOR);
        return 0;
    }
    if (result == 7 && ui->firstContactOnPage + 6 < ui->numContacts) {
        PhoneContactListUI_StartPageScroll(ui, 0);
        PlaySE(SEQ_SE_GS_GEARCURSOR);
        return 0;
    }
    return -1;
}

int PhoneContactListUI_HandleTouchInput2(PhoneContactListUI *ui, int *gotTouch) {
    int result;
    if (ui->isScrolling) {
        PhoneContactListUI_HandleScrollInProgress(ui);
        return -1;
    }
    result = TouchscreenHitbox_FindRectAtTouchNew(ov101_021F8658);
    if (result == -1) {
        return -1;
    }

    if (result < 6 && result < ui->listBottomIndex) {
        ui->cursorPos = result;
        PlaySE(SEQ_SE_GS_GEARDECIDE);
        *gotTouch = 1;
        return ui->firstContactOnPage + result;
    }
    if (result == 6 && ui->firstContactOnPage != 0) {
        PhoneContactListUI_StartPageScroll(ui, 1);
        PlaySE(SEQ_SE_GS_GEARCURSOR);
        *gotTouch = 1;
        return -1;
    }
    if (result == 7 && ui->firstContactOnPage + 6 < ui->numContacts) {
        PhoneContactListUI_StartPageScroll(ui, 0);
        PlaySE(SEQ_SE_GS_GEARCURSOR);
        *gotTouch = 1;
        return -1;
    }
    return -1;
}

int PhoneContactListUI_GetCursorPos(PhoneContactListUI *ui) {
    return ui->cursorPos;
}

void ov101_021F1808(PhoneContactListUI *ui) {
    u8 index = ui->selectedIndex;
    ui->selectedIndex = 255;
    if (index >= ui->firstContactOnPage && ui->lastContactIndex >= index) {
        PhoneContactListUI_PrintNameAndClass(ui, index - ui->firstContactOnPage + 1, index, FALSE, TRUE);
    }
}

void PhoneContactListNode_Init(PhoneContactListNode *a0) {
    a0->index = 0;
    a0->contact.id = 255;
    a0->next = NULL;
    a0->prev = NULL;
}

void PokegearPhone_InitContactsLinkedList(PokegearPhoneAppData *phoneApp) {
    int i;
    PhoneContactListNode *listNode;

    phoneApp->contactListTail = NULL;
    phoneApp->contactListHead = phoneApp->contactListTail;

    for (i = 0; i < phoneApp->numContacts; ++i) {
        listNode = &phoneApp->phoneContactListNodes[i];
        PhoneContactListNode_Init(listNode);
        listNode->index = i;
        listNode->contact = phoneApp->saveContacts[i];
        if (phoneApp->contactListHead == NULL) {
            phoneApp->contactListHead = listNode;
        }
        if (phoneApp->contactListTail == NULL) {
            phoneApp->contactListTail = listNode;
        }
        listNode->prev = phoneApp->contactListTail;
        phoneApp->contactListTail->next = listNode;
        phoneApp->contactListTail = listNode;
    }
    phoneApp->contactListTail->next = phoneApp->contactListHead;
    phoneApp->contactListHead->prev = phoneApp->contactListTail;
}

void PhoneContactListUISlotData_Init(PhoneContactListUISlotData *slot) {
    slot->index = 0;
    slot->node = NULL;
}

void PhoneContactListUI_DrawNameSlotBG(PhoneContactListUI *ui, u8 slot, BOOL colorIdx, BOOL copyNow) {
    u8 y;
    PhoneContactListUIColors *r4;

    r4 = &ui->textColors[colorIdx];
    y = 24 * slot;
    FillWindowPixelRect(ui->window, r4->fill1, 0, y, 216, 24);
    FillWindowPixelRect(ui->window, r4->bg1, 8, y, 82, 20);
    FillWindowPixelRect(ui->window, r4->bg2, 90, y, 126, 20);
    FillWindowPixelRect(ui->window, r4->fill2, 1, y + 1, 2, 2);
    FillWindowPixelRect(ui->window, r4->fill1, 8, y, 2, 7);
    FillWindowPixelRect(ui->window, r4->fill1, 9, y + 9, 2, 2);
    FillWindowPixelRect(ui->window, r4->fill1, 9, y + 13, 2, 2);
    FillWindowPixelRect(ui->window, r4->fill1, 9, y + 17, 2, 2);
    if (copyNow) {
        CopyWindowToVram(ui->window);
    }
}

void PhoneContactListUI_DrawNameSlotsBGs(PhoneContactListUI *ui) {
    int i;

    u8 bgColor = ui->firstBgColor;
    for (i = 0; i < 8; ++i) {
        PhoneContactListUI_DrawNameSlotBG(ui, i, bgColor, FALSE);
        bgColor ^= 1;
    }
}

u8 PhoneContactListUI_GetBackgroundIndex(PhoneContactListUI *ui, u8 slot) {
    if (ui->firstBgColor) {
        return 1 - (slot % 2);
    } else {
        return slot % 2;
    }
}

void PhoneContactListUI_PrintNameAndClass(PhoneContactListUI *ui, u8 slot, u8 index, u8 selected, BOOL copyNow) {
    u8 colorIdx;
    u8 y;
    PhoneContactListUIColors *colorSpec;
    PhoneContactListUISlotData *r4;

    r4 = &ui->slotData[index];
    colorIdx = PhoneContactListUI_GetBackgroundIndex(ui, slot);
    colorSpec = &ui->textColors[colorIdx];
    PhoneContactListUI_DrawNameSlotBG(ui, slot, colorIdx, FALSE);
    y = slot * 24;
    if (selected != 0 || index == ui->selectedIndex) {
        AddTextPrinterParameterizedWithColor(ui->window, 4, PhoneContact_GetName(ui->callContext, r4->contactID), 16, y + 2, TEXT_SPEED_NOTRANSFER, colorSpec->nameColor_Selected, NULL);
        AddTextPrinterParameterizedWithColor(ui->window, 0, PhoneContact_GetClass(ui->callContext, r4->contactID), 94, y + 2, TEXT_SPEED_NOTRANSFER, colorSpec->classColor_Selected, NULL);
    } else {
        AddTextPrinterParameterizedWithColor(ui->window, 4, PhoneContact_GetName(ui->callContext, r4->contactID), 16, y + 2, TEXT_SPEED_NOTRANSFER, colorSpec->nameColor_Deselected, NULL);
        AddTextPrinterParameterizedWithColor(ui->window, 0, PhoneContact_GetClass(ui->callContext, r4->contactID), 94, y + 2, TEXT_SPEED_NOTRANSFER, colorSpec->classColor_Deselected, NULL);
    }
    if (copyNow) {
        CopyWindowToVram(ui->window);
    }
}

void PokegearContactListUI_UpdateScrollArrowSpritesVisibility(PhoneContactListUI *ui) {
    if (ui->firstContactOnPage != 0) {
        Sprite_SetVisibleFlag(ui->unk_3CC[0], TRUE);
    } else {
        Sprite_SetVisibleFlag(ui->unk_3CC[0], FALSE);
    }
    if (ui->firstContactOnPage + 6 < ui->numContacts) {
        Sprite_SetVisibleFlag(ui->unk_3CC[1], TRUE);
    } else {
        Sprite_SetVisibleFlag(ui->unk_3CC[1], FALSE);
    }
}

BOOL PokegearContactListUI_StartSingleScroll(PhoneContactListUI *ui, u8 direction) {
    if (direction) {
        if (ui->firstContactOnPage < 1) {
            return FALSE;
        }
        --ui->firstContactOnPage;
        PhoneContactListUI_PrintNameAndClass(ui, 0, ui->firstContactOnPage, 0, TRUE);
        --ui->lastContactIndex;
    } else {
        if (ui->lastContactIndex >= ui->numContacts - 1) {
            return FALSE;
        }
        ++ui->lastContactIndex;
        PhoneContactListUI_PrintNameAndClass(ui, 7, ui->lastContactIndex, 0, TRUE);
        ++ui->firstContactOnPage;
    }
    ui->scrollTimer = 0;
    ui->scrollDirection = direction;
    ui->isScrolling = TRUE;
    *ui->menuInputStateBakPtr = 1;
    ui->firstBgColor ^= 1;
    PokegearContactListUI_UpdateScrollArrowSpritesVisibility(ui);
    return TRUE;
}

BOOL PokegearContactListUI_ScrollStep(PhoneContactListUI *ui) {
    if (ui->scrollDirection) {
        ScrollWindow(ui->window, 1, 8, 0);
    } else {
        ScrollWindow(ui->window, 0, 8, 0);
    }
    CopyWindowToVram(ui->window);
    if (ui->scrollTimer++ >= 2) {
        ui->scrollTimer = 0;
        return TRUE;
    }
    return FALSE;
}

BOOL PhoneContactListUI_StartPageScroll(PhoneContactListUI *ui, u8 direction) {
    ui->pageScrollStep = 0;
    ui->isPageScroll = 1;
    ui->scrollDirection = direction;
    ui->isScrolling = 1;
    *ui->menuInputStateBakPtr = 1;
    if (!PokegearContactListUI_StartSingleScroll(ui, direction)) {
        ui->pageScrollFailed = 1;
    }
    return FALSE;
}

BOOL PhoneContactListUI_ScrollMany(PhoneContactListUI *ui) {
    if (!PokegearContactListUI_ScrollStep(ui)) {
        return FALSE;
    }
    if (ui->pageScrollFailed || ui->pageScrollStep++ >= 5 || !PokegearContactListUI_StartSingleScroll(ui, ui->scrollDirection)) {
        ui->pageScrollStep = 0;
        ui->isPageScroll = 0;
        return TRUE;
    }
    return FALSE;
}

void PhoneContactListUI_HandleScrollInProgress(PhoneContactListUI *ui) {
    BOOL result;
    if (ui->isPageScroll) {
        result = PhoneContactListUI_ScrollMany(ui);
    } else {
        result = PokegearContactListUI_ScrollStep(ui);
    }
    if (result) {
        *ui->menuInputStateBakPtr = 0;
        ui->isScrolling = 0;
    }
}
