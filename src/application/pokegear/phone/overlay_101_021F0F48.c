#include "global.h"

#include "application/pokegear/phone/phone_internal.h"

#include "text.h"
#include "unk_02005D10.h"

void ov101_021F1830(PhoneContactListNode *a0);
void ov101_021F18E0(PokegearPhoneApp_Sub0E0_Sub00C *a0);
void ov101_021F18E8(PokegearPhoneApp_Sub0E0 *a0, u8 a1, BOOL a2, BOOL a3);
void ov101_021F19E4(PokegearPhoneApp_Sub0E0 *a0);
u8 ov101_021F1A10(PokegearPhoneApp_Sub0E0 *a0, u8 a1);
void ov101_021F1A40(PokegearPhoneApp_Sub0E0 *a0, u8 a1, u8 a2, u8 a3, BOOL a4);
void ov101_021F1B48(PokegearPhoneApp_Sub0E0 *a0);
BOOL ov101_021F1B94(PokegearPhoneApp_Sub0E0 *a0, u8 a1);
BOOL ov101_021F1C34(PokegearPhoneApp_Sub0E0 *a0);
BOOL ov101_021F1C98(PokegearPhoneApp_Sub0E0 *a0, u8 a1);
BOOL ov101_021F1CE8(PokegearPhoneApp_Sub0E0 *a0);
void ov101_021F1D44(PokegearPhoneApp_Sub0E0 *a0);

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

void ov101_021F0F48(PokegearPhoneAppData *phoneApp) {
    int i;
    PokegearPhoneApp_Sub0E0 *r4 = &phoneApp->unk_0E0;

    MI_CpuClear8(r4, sizeof(PokegearPhoneApp_Sub0E0));
    for (i = 0; i < NUM_PHONE_CONTACTS; ++i) {
        ov101_021F18E0(&r4->unk_00C[i]);
    }
    r4->unk_000 = phoneApp->numContacts;
    r4->unk_390 = &phoneApp->unk_048[2];
    r4->callContext = phoneApp->callContext;
    r4->unk_006_0 = 0;
    r4->unk_400 = &phoneApp->pokegear->unk_00C;
    r4->unk_404 = &phoneApp->unk_010;

    for (i = 0; i < 2; ++i) {
        r4->unk_3CC[i] = phoneApp->unk_088[4 + i];
    }
    for (i = 0; i < 6; ++i) {
        r4->unk_3D4[i] = phoneApp->unk_088[6 + i];
    }
    for (i = 0; i < 4; ++i) {
        r4->unk_3EC[i] = phoneApp->unk_088[i];
    }

    r4->unk_394[0].unk_00 = 1;
    r4->unk_394[0].unk_01 = 9;
    r4->unk_394[0].unk_02 = 2;
    r4->unk_394[0].unk_03 = 3;
    r4->unk_394[0].unk_04 = 4;
    r4->unk_394[0].unk_0A = 11;
    r4->unk_394[0].unk_05 = 5;
    r4->unk_394[0].unk_06 = 10;
    r4->unk_394[0].unk_07 = 6;
    r4->unk_394[0].unk_08 = 7;
    r4->unk_394[0].unk_09 = 8;
    r4->unk_394[0].unk_0B = 10;
    r4->unk_394[0].unk_0C = MAKE_TEXT_COLOR(r4->unk_394[0].unk_00, r4->unk_394[0].unk_02, r4->unk_394[0].unk_01);
    r4->unk_394[0].unk_10 = MAKE_TEXT_COLOR(r4->unk_394[0].unk_05, r4->unk_394[0].unk_07, r4->unk_394[0].unk_06);
    r4->unk_394[0].unk_14 = MAKE_TEXT_COLOR(r4->unk_394[0].unk_03, r4->unk_394[0].unk_04, r4->unk_394[0].unk_01);
    r4->unk_394[0].unk_18 = MAKE_TEXT_COLOR(r4->unk_394[0].unk_08, r4->unk_394[0].unk_09, r4->unk_394[0].unk_06);
    r4->unk_394[1].unk_00 = 1;
    r4->unk_394[1].unk_01 = 12;
    r4->unk_394[1].unk_02 = 2;
    r4->unk_394[1].unk_03 = 3;
    r4->unk_394[1].unk_04 = 4;
    r4->unk_394[1].unk_0A = 14;
    r4->unk_394[1].unk_05 = 5;
    r4->unk_394[1].unk_06 = 13;
    r4->unk_394[1].unk_07 = 6;
    r4->unk_394[1].unk_08 = 7;
    r4->unk_394[1].unk_09 = 8;
    r4->unk_394[1].unk_0B = 13;
    r4->unk_394[1].unk_0C = MAKE_TEXT_COLOR(r4->unk_394[1].unk_00, r4->unk_394[1].unk_02, r4->unk_394[1].unk_01);
    r4->unk_394[1].unk_10 = MAKE_TEXT_COLOR(r4->unk_394[1].unk_05, r4->unk_394[1].unk_07, r4->unk_394[1].unk_06);
    r4->unk_394[1].unk_14 = MAKE_TEXT_COLOR(r4->unk_394[1].unk_03, r4->unk_394[1].unk_04, r4->unk_394[1].unk_01);
    r4->unk_394[1].unk_18 = MAKE_TEXT_COLOR(r4->unk_394[1].unk_08, r4->unk_394[1].unk_09, r4->unk_394[1].unk_06);
}

void ov101_021F11B0(PokegearPhoneAppData *phoneApp) {
    int i;
    PhoneContactListNode *node;
    PokegearPhoneApp_Sub0E0 *r3;

    r3 = &phoneApp->unk_0E0;
    node = phoneApp->contactListHead;
    for (i = 0; i < r3->unk_000; ++i) {
        r3->unk_00C[i].unk_0 = i;
        r3->unk_00C[i].unk_8 = node->contact.id;
        r3->unk_00C[i].unk_4 = node;
        node = node->next;
    }
}

void ov101_021F11E0(PokegearPhoneAppData *phoneApp, PokegearPhoneApp_Sub0E0 *a1, u8 a2, u8 a3) {
    int i;
    int r4;

    if (a2 >= a1->unk_000) {
        a2 = 0;
    }
    ov101_021F19E4(a1);
    a1->unk_005 = 0;
    a1->unk_003 = a2;
    a1->unk_002 = 0xFF;
    for (i = 0, r4 = a2; i < 6; ++r4, ++i) {
        if (r4 >= a1->unk_000) {
            a1->unk_004 = r4 - 1;
            a1->unk_005 = i;
            break;
        }
        ov101_021F1A40(a1, i + 1, r4, 0, 0);
    }
    if (a1->unk_005 == 0) {
        a1->unk_005 = i;
        a1->unk_004 = i - 1 + a2;
    }
    if (a3 >= a1->unk_005) {
        a3 = 0;
    }
    a1->unk_001 = a3;
    CopyWindowToVram(a1->unk_390);
    ov101_021F1B48(a1);
    if (phoneApp->isIncomingCall != 0) {
        ov101_021F1290(a1, a3, 0);
    } else {
        ov101_021F1290(a1, a3, 1);
    }
}

void ov101_021F1290(PokegearPhoneApp_Sub0E0 *a0, u8 a1, u8 a2) {
    int i;

    if (a2 != 0) {
        for (i = 0; i < 4; ++i) {
            Sprite_SetVisibleFlag(a0->unk_3EC[i], TRUE);
        }
    } else {
        for (i = 0; i < 4; ++i) {
            Sprite_SetVisibleFlag(a0->unk_3EC[i], FALSE);
        }
    }
    if (a1 >= 6) {
        a1 = a0->unk_001;
    }
    if (a0->unk_001 >= a0->unk_005) {
        a0->unk_001 = a0->unk_005 - 1;
        a1 = a0->unk_001;
    }
    Sprite_SetPositionXY(a0->unk_3EC[0], 16, a1 * 24 + 8);
    Sprite_SetPositionXY(a0->unk_3EC[1], 16, a1 * 24 + 30);
    Sprite_SetPositionXY(a0->unk_3EC[2], 224, a1 * 24 + 8);
    Sprite_SetPositionXY(a0->unk_3EC[3], 224, a1 * 24 + 30);
}

void ov101_021F1338(PokegearPhoneApp_Sub0E0 *a0, int a1) {
    int i;

    for (i = 0; i < 4; ++i) {
        Sprite_SetAnimActiveFlag(a0->unk_3EC[i], a1);
        Sprite_SetVisibleFlag(a0->unk_3EC[i], TRUE);
    }
}

void ov101_021F1364(PokegearPhoneApp_Sub0E0 *a0, int a1, int a2) {
    int i;
    if (a2 != 0) {
        for (i = 0; i < a0->unk_005; ++i) {
            Sprite_SetVisibleFlag(a0->unk_3D4[i], TRUE);
            if (a1 == i) {
                Sprite_SetAnimCtrlSeq(a0->unk_3D4[i], 7);
            } else {
                Sprite_SetAnimCtrlSeq(a0->unk_3D4[i], 6);
            }
        }
    } else {
        for (i = 0; i < 6; ++i) {
            Sprite_SetVisibleFlag(a0->unk_3D4[i], FALSE);
        }
    }
}

void ov101_021F13C8(PokegearPhoneApp_Sub0E0 *a0, int a1) {
    if (a1 == 0) {
        a0->unk_006_1 = 0;
        ov101_021F1364(a0, 255, 0);
        ov101_021F1808(a0);
        ov101_021F1290(a0, a0->unk_001, 1);
    } else {
        a0->unk_006_1 = 1;
        ov101_021F1364(a0, a0->unk_001, 1);
    }
}

int ov101_021F1408(PokegearPhoneApp_Sub0E0 *a0) {
    u8 r4;

    if (a0->unk_007_0) {
        ov101_021F1D44(a0);
        return -1;
    }
    if (a0->unk_007_3 != 0) {
        --a0->unk_007_3;
        return -1;
    }
    r4 = a0->unk_003 + a0->unk_001;
    if (gSystem.newKeys & PAD_BUTTON_A) {
        a0->unk_002 = r4;
        ov101_021F1A40(a0, a0->unk_001 + 1, a0->unk_002, 1, 1);
        PlaySE(SEQ_SE_GS_GEARDECIDE);
        return a0->unk_002;
    }
    if (gSystem.newKeys & PAD_BUTTON_B) {}
    if (gSystem.newAndRepeatedKeys & PAD_KEY_UP) {
        if (r4 == 0) { // no wraparound
            return -1;
        }
        PlaySE(SEQ_SE_GS_GEARCURSOR);
        if (a0->unk_001 == 0) {
            if (r4 != 0) {
                ov101_021F1B94(a0, 1);
            }
            return -1;
        } else {
            --a0->unk_001;
            ov101_021F1290(a0, a0->unk_001, 1);
            a0->unk_007_3 = 2;
            return -1;
        }
    }
    if (gSystem.newAndRepeatedKeys & PAD_KEY_DOWN) {
        if (r4 >= a0->unk_000 - 1) { // no wraparound
            return -1;
        }
        PlaySE(SEQ_SE_GS_GEARCURSOR);
        if (a0->unk_001 == 5) {
            if (r4 < a0->unk_000 - 1) {
                ov101_021F1B94(a0, 0);
            }
            return -1;
        } else {
            ++a0->unk_001;
            ov101_021F1290(a0, a0->unk_001, 1);
            a0->unk_007_3 = 2;
            return -1;
        }
    }
    if (gSystem.newKeys & PAD_KEY_LEFT) {
        if (a0->unk_003 != 0) {
            PlaySE(SEQ_SE_GS_GEARCURSOR);
            ov101_021F1C98(a0, 1);
        }
        return -1;
    }
    if (gSystem.newKeys & PAD_KEY_RIGHT) {
        if (a0->unk_003 + 6 < a0->unk_000) {
            PlaySE(SEQ_SE_GS_GEARCURSOR);
            ov101_021F1C98(a0, 0);
        }
        return -1;
    }
    return -1;
}

int ov101_021F1564(PokegearPhoneApp_Sub0E0 *a0) {
    u8 r4;

    if (a0->unk_007_0) {
        ov101_021F1D44(a0);
        return -1;
    }
    if (a0->unk_007_3 != 0) {
        --a0->unk_007_3;
        return -1;
    }
    r4 = a0->unk_003 + a0->unk_001;
    if (gSystem.newKeys & PAD_BUTTON_A) {
        return r4;
        ;
    }
    if (gSystem.newKeys & PAD_BUTTON_B) {
        return a0->unk_002;
    }
    if (gSystem.newAndRepeatedKeys & PAD_KEY_UP) {
        if (r4 == 0) { // no wraparound
            return -1;
        }
        PlaySE(SEQ_SE_GS_GEARCURSOR);
        if (a0->unk_001 == 0) {
            if (r4 != 0) {
                ov101_021F1B94(a0, 1);
            }
            return -1;
        } else {
            --a0->unk_001;
            ov101_021F1364(a0, a0->unk_001, 1);
            a0->unk_007_3 = 2;
            return -1;
        }
    }
    if (gSystem.newAndRepeatedKeys & PAD_KEY_DOWN) {
        if (r4 >= a0->unk_000 - 1) { // no wraparound
            return -1;
        }
        PlaySE(SEQ_SE_GS_GEARCURSOR);
        if (a0->unk_001 == 5) {
            if (r4 < a0->unk_000 - 1) {
                ov101_021F1B94(a0, 0);
            }
            return -1;
        } else {
            ++a0->unk_001;
            ov101_021F1364(a0, a0->unk_001, 1);
            a0->unk_007_3 = 2;
            return -1;
        }
    }
    if (gSystem.newKeys & PAD_KEY_LEFT) {
        if (a0->unk_003 != 0) {
            PlaySE(SEQ_SE_GS_GEARCURSOR);
            ov101_021F1C98(a0, 1);
        }
        return -1;
    }
    if (gSystem.newKeys & PAD_KEY_RIGHT) {
        if (a0->unk_003 + 6 < a0->unk_000) {
            PlaySE(SEQ_SE_GS_GEARCURSOR);
            ov101_021F1C98(a0, 0);
        }
        return -1;
    }
    return -1;
}

int ov101_021F16A8(PokegearPhoneApp_Sub0E0 *a0) {
    int result;
    if (a0->unk_007_0) {
        ov101_021F1D44(a0);
        return -1;
    }
    result = TouchscreenHitbox_FindRectAtTouchNew(ov101_021F8634);
    if (result == -1) {
        return -1;
    }

    if (result < 6 && result < a0->unk_005) {
        a0->unk_001 = result;
        a0->unk_002 = a0->unk_003 + result;
        ov101_021F1A40(a0, a0->unk_001 + 1, a0->unk_002, 1, 1);
        ov101_021F1290(a0, a0->unk_001, 1);
        PlaySE(SEQ_SE_GS_GEARDECIDE);
        return a0->unk_002 + 1;
    }
    if (result == 6 && a0->unk_003 != 0) {
        ov101_021F1C98(a0, 1);
        PlaySE(SEQ_SE_GS_GEARCURSOR);
        return 0;
    }
    if (result == 7 && a0->unk_003 + 6 < a0->unk_000) {
        ov101_021F1C98(a0, 0);
        PlaySE(SEQ_SE_GS_GEARCURSOR);
        return 0;
    }
    return -1;
}

int ov101_021F1768(PokegearPhoneApp_Sub0E0 *a0, int *a1) {
    int result;
    if (a0->unk_007_0) {
        ov101_021F1D44(a0);
        return -1;
    }
    result = TouchscreenHitbox_FindRectAtTouchNew(ov101_021F8658);
    if (result == -1) {
        return -1;
    }

    if (result < 6 && result < a0->unk_005) {
        a0->unk_001 = result;
        PlaySE(SEQ_SE_GS_GEARDECIDE);
        *a1 = 1;
        return a0->unk_003 + result;
    }
    if (result == 6 && a0->unk_003 != 0) {
        ov101_021F1C98(a0, 1);
        PlaySE(SEQ_SE_GS_GEARCURSOR);
        *a1 = 1;
        return -1;
    }
    if (result == 7 && a0->unk_003 + 6 < a0->unk_000) {
        ov101_021F1C98(a0, 0);
        PlaySE(SEQ_SE_GS_GEARCURSOR);
        *a1 = 1;
        return -1;
    }
    return -1;
}

int ov101_021F1804(PokegearPhoneApp_Sub0E0 *a0) {
    return a0->unk_001;
}

void ov101_021F1808(PokegearPhoneApp_Sub0E0 *a0) {
    u8 r2 = a0->unk_002;
    a0->unk_002 = 255;
    if (r2 >= a0->unk_003 && a0->unk_004 >= r2) {
        ov101_021F1A40(a0, r2 - a0->unk_003 + 1, r2, 0, 1);
    }
}

void ov101_021F1830(PhoneContactListNode *a0) {
    a0->unk_00 = 0;
    a0->contact.id = 255;
    a0->next = NULL;
    a0->prev = NULL;
}

void ov101_021F1840(PokegearPhoneAppData *phoneApp) {
    int i;
    PhoneContactListNode *r4;

    phoneApp->contactListTail = NULL;
    phoneApp->contactListHead = phoneApp->contactListTail;

    for (i = 0; i < phoneApp->numContacts; ++i) {
        r4 = &phoneApp->unk_0D4[i];
        ov101_021F1830(r4);
        r4->unk_00 = i;
        r4->contact = phoneApp->saveContacts[i];
        if (phoneApp->contactListHead == NULL) {
            phoneApp->contactListHead = r4;
        }
        if (phoneApp->contactListTail == NULL) {
            phoneApp->contactListTail = r4;
        }
        r4->prev = phoneApp->contactListTail;
        phoneApp->contactListTail->next = r4;
        phoneApp->contactListTail = r4;
    }
    phoneApp->contactListTail->next = phoneApp->contactListHead;
    phoneApp->contactListHead->prev = phoneApp->contactListTail;
}

void ov101_021F18E0(PokegearPhoneApp_Sub0E0_Sub00C *a0) {
    a0->unk_0 = 0;
    a0->unk_4 = NULL;
}

void ov101_021F18E8(PokegearPhoneApp_Sub0E0 *a0, u8 a1, BOOL a2, BOOL a3) {
    u8 y;
    PokegearPhoneApp_Sub0E0_Sub394 *r4;

    r4 = &a0->unk_394[a2];
    y = 24 * a1;
    FillWindowPixelRect(a0->unk_390, r4->unk_0A, 0, y, 216, 24);
    FillWindowPixelRect(a0->unk_390, r4->unk_01, 8, y, 82, 20);
    FillWindowPixelRect(a0->unk_390, r4->unk_06, 90, y, 126, 20);
    FillWindowPixelRect(a0->unk_390, r4->unk_0B, 1, y + 1, 2, 2);
    FillWindowPixelRect(a0->unk_390, r4->unk_0A, 8, y, 2, 7);
    FillWindowPixelRect(a0->unk_390, r4->unk_0A, 9, y + 9, 2, 2);
    FillWindowPixelRect(a0->unk_390, r4->unk_0A, 9, y + 13, 2, 2);
    FillWindowPixelRect(a0->unk_390, r4->unk_0A, 9, y + 17, 2, 2);
    if (a3) {
        CopyWindowToVram(a0->unk_390);
    }
}

void ov101_021F19E4(PokegearPhoneApp_Sub0E0 *a0) {
    int i;

    u8 r5 = a0->unk_006_0;
    for (i = 0; i < 8; ++i) {
        ov101_021F18E8(a0, i, r5, FALSE);
        r5 ^= 1;
    }
}

u8 ov101_021F1A10(PokegearPhoneApp_Sub0E0 *a0, u8 a1) {
    if (a0->unk_006_0) {
        return 1 - (a1 % 2);
    } else {
        return a1 % 2;
    }
}

void ov101_021F1A40(PokegearPhoneApp_Sub0E0 *a0, u8 a1, u8 a2, u8 a3, BOOL a4) {
    u8 r2;
    u8 y;
    PokegearPhoneApp_Sub0E0_Sub394 *r6;
    PokegearPhoneApp_Sub0E0_Sub00C *r4;

    r4 = &a0->unk_00C[a2];
    r2 = ov101_021F1A10(a0, a1);
    r6 = &a0->unk_394[r2];
    ov101_021F18E8(a0, a1, r2, FALSE);
    y = a1 * 24;
    if (a3 != 0 || a2 == a0->unk_002) {
        AddTextPrinterParameterizedWithColor(a0->unk_390, 4, PhoneContact_GetName(a0->callContext, r4->unk_8), 16, y + 2, TEXT_SPEED_NOTRANSFER, r6->unk_14, NULL);
        AddTextPrinterParameterizedWithColor(a0->unk_390, 0, PhoneContact_GetClass(a0->callContext, r4->unk_8), 94, y + 2, TEXT_SPEED_NOTRANSFER, r6->unk_18, NULL);
    } else {
        AddTextPrinterParameterizedWithColor(a0->unk_390, 4, PhoneContact_GetName(a0->callContext, r4->unk_8), 16, y + 2, TEXT_SPEED_NOTRANSFER, r6->unk_0C, NULL);
        AddTextPrinterParameterizedWithColor(a0->unk_390, 0, PhoneContact_GetClass(a0->callContext, r4->unk_8), 94, y + 2, TEXT_SPEED_NOTRANSFER, r6->unk_10, NULL);
    }
    if (a4) {
        CopyWindowToVram(a0->unk_390);
    }
}

void ov101_021F1B48(PokegearPhoneApp_Sub0E0 *a0) {
    if (a0->unk_003 != 0) {
        Sprite_SetVisibleFlag(a0->unk_3CC[0], TRUE);
    } else {
        Sprite_SetVisibleFlag(a0->unk_3CC[0], FALSE);
    }
    if (a0->unk_003 + 6 < a0->unk_000) {
        Sprite_SetVisibleFlag(a0->unk_3CC[1], TRUE);
    } else {
        Sprite_SetVisibleFlag(a0->unk_3CC[1], FALSE);
    }
}

BOOL ov101_021F1B94(PokegearPhoneApp_Sub0E0 *a0, u8 a1) {
    if (a1) {
        if (a0->unk_003 < 1) {
            return FALSE;
        }
        --a0->unk_003;
        ov101_021F1A40(a0, 0, a0->unk_003, 0, TRUE);
        --a0->unk_004;
    } else {
        if (a0->unk_004 >= a0->unk_000 - 1) {
            return FALSE;
        }
        ++a0->unk_004;
        ov101_021F1A40(a0, 7, a0->unk_004, 0, TRUE);
        ++a0->unk_003;
    }
    a0->unk_007_3 = 0;
    a0->unk_007_1 = a1;
    a0->unk_007_0 = TRUE;
    *a0->unk_404 = 1;
    a0->unk_006_0 ^= 1;
    ov101_021F1B48(a0);
    return TRUE;
}

BOOL ov101_021F1C34(PokegearPhoneApp_Sub0E0 *a0) {
    if (a0->unk_007_1) {
        ScrollWindow(a0->unk_390, 1, 8, 0);
    } else {
        ScrollWindow(a0->unk_390, 0, 8, 0);
    }
    CopyWindowToVram(a0->unk_390);
    if (a0->unk_007_3++ >= 2) {
        a0->unk_007_3 = 0;
        return TRUE;
    }
    return FALSE;
}

BOOL ov101_021F1C98(PokegearPhoneApp_Sub0E0 *a0, u8 a1) {
    a0->unk_008_4 = 0;
    a0->unk_007_2 = 1;
    a0->unk_007_1 = a1;
    a0->unk_007_0 = 1;
    *a0->unk_404 = 1;
    if (!ov101_021F1B94(a0, a1)) {
        a0->unk_008_7 = 1;
    }
    return FALSE;
}

BOOL ov101_021F1CE8(PokegearPhoneApp_Sub0E0 *a0) {
    if (!ov101_021F1C34(a0)) {
        return FALSE;
    }
    if (a0->unk_008_7 || a0->unk_008_4++ >= 5 || !ov101_021F1B94(a0, a0->unk_007_1)) {
        a0->unk_008_4 = 0;
        a0->unk_007_2 = 0;
        return TRUE;
    }
    return FALSE;
}

void ov101_021F1D44(PokegearPhoneApp_Sub0E0 *a0) {
    BOOL r0;
    if (a0->unk_007_2) {
        r0 = ov101_021F1CE8(a0);
    } else {
        r0 = ov101_021F1C34(a0);
    }
    if (r0) {
        *a0->unk_404 = 0;
        a0->unk_007_0 = 0;
    }
}
