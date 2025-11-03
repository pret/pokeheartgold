#include "unk_02020A0C.h"

void sub_02020A0C(const UnkStruct_02020A0C *a0, u8 *px, u8 *py) {
    *px = a0->left;
    *py = a0->top;
}

void sub_02020A18(const UnkStruct_02020A0C *a0, u8 *pw, u8 *ph) {
    *pw = a0->width;
    *ph = a0->height;
}

u8 sub_02020A24(const UnkStruct_02020A0C *a0, u8 *px, u8 *py, u8 *pw, u8 *ph, u8 partyMonIndex, u8 direction) {
    u8 r4 = partyMonIndex;
    switch (direction) {
    case 0:
        r4 = a0[r4].buttonUp;
        break;
    case 1:
        r4 = a0[r4].buttonDown;
        break;
    case 2:
        r4 = a0[r4].buttonLeft;
        break;
    case 3:
        r4 = a0[r4].buttonRight;
        break;
    }
    if (px != NULL) {
        *px = a0[r4].left;
    }
    if (py != NULL) {
        *py = a0[r4].top;
    }
    if (pw != NULL) {
        *pw = a0[r4].width;
    }
    if (ph != NULL) {
        *ph = a0[r4].height;
    }
    return r4;
}
