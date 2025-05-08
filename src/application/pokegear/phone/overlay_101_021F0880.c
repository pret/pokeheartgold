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
        phoneApp->unk_4E8[i] = ListMenuItems_New(r5->nItems, phoneApp->heapId);
        for (j = 0; j < r5->nItems; ++j) {
            ListMenuItems_AppendFromMsgData(phoneApp->unk_4E8[i], phoneApp->unk_014, r5->baseMsg + j, j);
        }
    }
}

void ov101_021F08DC(PokegearPhoneAppData *phoneApp) {
    for (int i = 0; i < 7; ++i) {
        ListMenuItems_Delete(phoneApp->unk_4E8[i]);
        phoneApp->unk_4E8[i] = NULL;
    }
}

void ov101_021F0900(PokegearPhoneAppData *phoneApp) {
    ov101_021F0990(phoneApp);
    if (phoneApp->pokegear->unk_006 == 0) {
        ov100_021E7128(phoneApp->pokegear->appSwitchCursor, 0, FALSE);
    } else {
        ov100_021E7128(phoneApp->pokegear->appSwitchCursor, 0, TRUE);
        ov100_021E72F8(phoneApp->pokegear->appSwitchCursor, 0, ov100_021E5DC8(phoneApp->pokegear));
        ov101_021F1290(&phoneApp->unk_0E0, 255, 0);
    }
}

void ov101_021F0944(void *cb_arg) {
    PokegearPhoneAppData *phoneApp = cb_arg;

    ov101_021F1290(&phoneApp->unk_0E0, 255, 1);
}

void ov101_021F0954(PokegearPhoneAppData *phoneApp) {
    phoneApp->pokegear->unk_006 = 0;
    ov101_021F1290(&phoneApp->unk_0E0, 255, 1);
    ov100_021E7128(phoneApp->pokegear->appSwitchCursor, 0, FALSE);
}

void ov101_021F0978(void *cb_arg) {
    PokegearPhoneAppData *phoneApp = cb_arg;

    ov101_021F1364(&phoneApp->unk_0E0, ov101_021F1804(&phoneApp->unk_0E0), 1);
}

void ov101_021F0990(PokegearPhoneAppData *phoneApp) {
    ov101_021F0F48(phoneApp);
    ov101_021F11B0(phoneApp);
    ov101_021F11E0(phoneApp, &phoneApp->unk_0E0, 0, 0);
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
    header.listMenuItems = phoneApp->unk_4E8[menuID];
    header.bgConfig = phoneApp->pokegear->bgConfig;
    header.numWindows = ov101_021F8404[menuID].nItems;
    if (menuID == 1) {
        phoneApp->touchscreenListMenu = TouchscreenListMenu_CreateWithCallback(phoneApp->unk_0C0, &header, phoneApp->pokegear->unk_00C, ov101_021F8404[menuID].x, ov101_021F8404[menuID].y, ov101_021F8404[menuID].width, 0, ov101_021F0A94, phoneApp, TRUE);
    } else {
        phoneApp->touchscreenListMenu = TouchscreenListMenu_CreateWithCallback(phoneApp->unk_0C0, &header, phoneApp->pokegear->unk_00C, ov101_021F8404[menuID].x, ov101_021F8404[menuID].y, ov101_021F8404[menuID].width, 0, ov101_021F0AB8, phoneApp, TRUE);
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
    ov101_021F1808(&phoneApp->unk_0E0);
    ov101_021F1338(&phoneApp->unk_0E0, 1);
    ov101_021F0944(phoneApp);
}

int ov101_021F0BA0(PokegearPhoneAppData *phoneApp) {
    if (gSystem.newKeys & PAD_BUTTON_B) {
        if (phoneApp->unk_010 == 0) {
            phoneApp->pokegear->unk_006 = 1;
            PlaySE(SEQ_SE_GS_GEARCANCEL);
            ov100_021E7128(phoneApp->pokegear->appSwitchCursor, 0, TRUE);
            ov100_021E72F8(phoneApp->pokegear->appSwitchCursor, 0, ov100_021E5DC8(phoneApp->pokegear));
            ov101_021F1290(&phoneApp->unk_0E0, 255, 0);
            return -1;
        }
    }

    int r0 = ov101_021F1408(&phoneApp->unk_0E0);
    if (r0 >= 0) {
        phoneApp->callerID = phoneApp->unk_0E0.unk_00C[r0].unk_8;
        PlaySE(SEQ_SE_GS_GEARDECIDE);
        ov101_021F1338(&phoneApp->unk_0E0, 0);
        PokegearPhoneApp_TouchscreenListMenu_Create(phoneApp, ov101_021F1804(&phoneApp->unk_0E0), 0);
        ov101_021F0ACC(phoneApp, 0, TRUE);
        return 8;
    }

    return -1;
}

int ov101_021F0C4C(PokegearPhoneAppData *phoneApp) {
    int result;
    if (phoneApp->unk_010 == 0) {
        result = PokegearApp_HandleTouchInput_SwitchApps(phoneApp->pokegear);
        if (result != -1) {
            phoneApp->pokegear->unk_00C = MENU_INPUT_STATE_TOUCH;
            return result;
        }
    }

    result = ov101_021F16A8(&phoneApp->unk_0E0);
    if (result >= 0) {
        if (phoneApp->pokegear->unk_006 == 1) {
            ov101_021F0954(phoneApp);
        }
        if (result == 0) {
            return -1;
        } else {
            phoneApp->callerID = phoneApp->unk_0E0.unk_00C[result - 1].unk_8;
            PlaySE(SEQ_SE_GS_GEARDECIDE);
            ov101_021F1338(&phoneApp->unk_0E0, 0);
            PokegearPhoneApp_TouchscreenListMenu_Create(phoneApp, ov101_021F1804(&phoneApp->unk_0E0), 0);
            ov101_021F0ACC(phoneApp, 0, TRUE);
            phoneApp->pokegear->unk_00C = MENU_INPUT_STATE_TOUCH;
            return 8;
        }
    }

    return -1;
}

BOOL ov101_021F0CE4(PokegearPhoneAppData *phoneApp) {
    int sp0;
    int r4;

    sp0 = 0;
    r4 = ov101_021F1768(&phoneApp->unk_0E0, &sp0);
    if (sp0 == 0) {
        if (phoneApp->unk_010 == 0) {
            ov100_021E5900(phoneApp->pokegear);
        }
        r4 = ov101_021F1564(&phoneApp->unk_0E0);
    } else {
        phoneApp->pokegear->unk_00C = MENU_INPUT_STATE_TOUCH;
    }
    if (r4 < 0) {
        return FALSE;
    }
    if (r4 == phoneApp->unk_0E0.unk_002) {
        return TRUE;
    }
    ov101_021F0E0C(phoneApp, phoneApp->unk_0E0.unk_00C[phoneApp->unk_0E0.unk_002].unk_4, r4);
    phoneApp->unk_0E0.unk_002 = r4;
    ov101_021F11B0(phoneApp);
    ov101_021F11E0(phoneApp, &phoneApp->unk_0E0, phoneApp->unk_0E0.unk_003, phoneApp->unk_0E0.unk_001);
    return TRUE;
}

void ov101_021F0D6C(PokegearPhoneAppData *phoneApp) {
    phoneApp->unk_0D4 = AllocFromHeap(phoneApp->heapId, phoneApp->numContacts * sizeof(PhoneContactListNode));
    ov101_021F1840(phoneApp);
}

void ov101_021F0D90(PokegearPhoneAppData *phoneApp) {
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

void ov101_021F0E0C(PokegearPhoneAppData *phoneApp, PhoneContactListNode *a1, u8 a2) {
    int i = 0;
    PhoneContactListNode *r4;

    a1->prev->next = a1->next;
    a1->next->prev = a1->prev;
    if (a1 == phoneApp->contactListHead) {
        phoneApp->contactListHead = a1->next;
    }
    if (a1 == phoneApp->contactListTail) {
        phoneApp->contactListTail = a1->prev;
    }
    if (a2 == phoneApp->numContacts - 1) {
        a1->prev = phoneApp->contactListTail;
        a1->next = phoneApp->contactListTail->next;
        phoneApp->contactListTail->next = a1;
        phoneApp->contactListHead->prev = a1;
        phoneApp->contactListTail = a1;
    } else {
        r4 = phoneApp->contactListHead;
        do {
            if (i++ != a2) {
                r4 = r4->next;
            } else {
                a1->next = r4;
                a1->prev = r4->prev;
                a1->prev->next = a1;
                r4->prev = a1;
                if (r4 == phoneApp->contactListHead) {
                    phoneApp->contactListHead = a1;
                }
                return;
            }
        } while (r4 != phoneApp->contactListHead);
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
    ov101_021F1840(phoneApp);
    ov101_021F11B0(phoneApp);
    phoneApp->unk_0E0.unk_001 = 0;
    phoneApp->unk_0E0.unk_003 = phoneApp->unk_0E0.unk_001;
    ov101_021F11E0(phoneApp, &phoneApp->unk_0E0, phoneApp->unk_0E0.unk_003, phoneApp->unk_0E0.unk_001);
}
