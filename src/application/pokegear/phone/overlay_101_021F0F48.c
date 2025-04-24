#include "global.h"

#include "application/pokegear/phone/phone_internal.h"

#include "text.h"

void ov101_021F18E0(PokegearPhoneApp_Sub0E0_Sub00C *a0);

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
