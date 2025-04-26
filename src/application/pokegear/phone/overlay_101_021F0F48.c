#include "global.h"

#include "application/pokegear/phone/phone_internal.h"

#include "text.h"
#include "unk_02005D10.h"

void ov101_021F18E0(PokegearPhoneApp_Sub0E0_Sub00C *a0);
void ov101_021F19E4(PokegearPhoneApp_Sub0E0 *a0);
void ov101_021F1A40(PokegearPhoneApp_Sub0E0 *a0, u8 a1, u8 a2, u8 a3, u8 a4);
void ov101_021F1B48(PokegearPhoneApp_Sub0E0 *a0);
void ov101_021F1B94(PokegearPhoneApp_Sub0E0 *a0, int a1);
void ov101_021F1C98(PokegearPhoneApp_Sub0E0 *a0, int a1);
void ov101_021F1D44(PokegearPhoneApp_Sub0E0 *a0);

void ov101_021F0F48(PokegearPhoneAppData *phoneApp) {
    int i;
    PokegearPhoneApp_Sub0E0 *r4 = &phoneApp->unk_0E0;

    MI_CpuClear8(r4, sizeof(PokegearPhoneApp_Sub0E0));
    for (i = 0; i < NUM_PHONE_CONTACTS; ++i) {
        ov101_021F18E0(&r4->unk_00C[i]);
    }
    r4->unk_000 = phoneApp->numContacts;
    r4->unk_390 = &phoneApp->unk_048[2];
    r4->unk_3FC = phoneApp->unk_0C4;
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

    r4->unk_394 = 1;
    r4->unk_395 = 9;
    r4->unk_396 = 2;
    r4->unk_397 = 3;
    r4->unk_398 = 4;
    r4->unk_39E = 11;
    r4->unk_399 = 5;
    r4->unk_39A = 10;
    r4->unk_39B = 6;
    r4->unk_39C = 7;
    r4->unk_39D = 8;
    r4->unk_39F = 10;
    r4->unk_3A0 = MAKE_TEXT_COLOR(r4->unk_394, r4->unk_396, r4->unk_395);
    r4->unk_3A4 = MAKE_TEXT_COLOR(r4->unk_399, r4->unk_39B, r4->unk_39A);
    r4->unk_3A8 = MAKE_TEXT_COLOR(r4->unk_397, r4->unk_398, r4->unk_395);
    r4->unk_3AC = MAKE_TEXT_COLOR(r4->unk_39C, r4->unk_39D, r4->unk_39A);
    r4->unk_3B0 = 1;
    r4->unk_3B1 = 12;
    r4->unk_3B2 = 2;
    r4->unk_3B3 = 3;
    r4->unk_3B4 = 4;
    r4->unk_3BA = 14;
    r4->unk_3B5 = 5;
    r4->unk_3B6 = 13;
    r4->unk_3B7 = 6;
    r4->unk_3B8 = 7;
    r4->unk_3B9 = 8;
    r4->unk_3BB = 13;
    r4->unk_3BC = MAKE_TEXT_COLOR(r4->unk_3B0, r4->unk_3B2, r4->unk_3B1);
    r4->unk_3C0 = MAKE_TEXT_COLOR(r4->unk_3B5, r4->unk_3B7, r4->unk_3B6);
    r4->unk_3C4 = MAKE_TEXT_COLOR(r4->unk_3B3, r4->unk_3B4, r4->unk_3B1);
    r4->unk_3C8 = MAKE_TEXT_COLOR(r4->unk_3B8, r4->unk_3B9, r4->unk_3B6);
}

void ov101_021F11B0(PokegearPhoneAppData *phoneApp) {
    int i;
    PokegearPhoneApp_Sub0D8 *node;
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
    if (phoneApp->unk_0CB != 0) {
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
    // u8 r6;
    u8 r4;

    if (a0->unk_007_0) {
        ov101_021F1D44(a0);
        return -1;
    }
    if (a0->unk_007_3 != 0) {
        --a0->unk_007_3;
        return -1;
    }
    // r6 = a0->unk_003;
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
