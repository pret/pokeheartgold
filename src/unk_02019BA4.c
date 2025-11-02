#include "unk_02019BA4.h"

#include "list_menu_items.h"
#include "menu_input_state.h"
#include "system.h"

int sub_02019E4C(UnkStruct_02019BA4 *a0, u16 a1);
int sub_02019E98(UnkStruct_02019BA4 *a0);
int sub_02019EB8(UnkStruct_02019BA4 *a0, int a1, u8 a2);
BOOL sub_0201A06C(int *a0, u16 a1);
BOOL sub_0201A020(const UnkStruct_02020654 *a0, int a1);

UnkStruct_02019BA4 *sub_02019BA4(const TouchscreenHitbox *hitBoxes, const UnkStruct_02020654 *dpadBoxes, const UnkStruct_02019BA4_callbacks *callbacks, void *callbackParam, int a4, u8 initialPos, enum HeapID heapId) {
    UnkStruct_02019BA4 *ret = Heap_Alloc(heapId, sizeof(UnkStruct_02019BA4));

    ret->touchscreenHitboxes = hitBoxes;
    ret->dpadPositions = dpadBoxes;
    ret->callbacks = callbacks;
    ret->data = callbackParam;
    ret->inputState = MENU_INPUT_STATE_BUTTONS;
    ret->unk_08 = a4;
    ret->nextInput = initialPos;
    ret->lastInput = 0xFF;
    ret->unk_0F = 0xFF;
    ret->unk_10[0] = -1;
    ret->unk_10[1] = -1;
    return ret;
}

void sub_02019BDC(UnkStruct_02019BA4 *a0) {
    Heap_Free(a0);
}

int sub_02019BE4(UnkStruct_02019BA4 *a0) {
    u16 i = 0;
    BOOL r6 = FALSE;
    int r0;
    u8 r2;
    u8 spC;

    // Handle touch input
    while (TRUE) {
        if (a0->touchscreenHitboxes[i].rect.top == TOUCHSCREEN_RECTLIST_END) {
            break;
        }
        if (TouchscreenHitbox_TouchNewIsIn(&a0->touchscreenHitboxes[i]) == TRUE) {
            r0 = sub_02019E4C(a0, i);
            if (r0 != LIST_NOTHING_CHOSEN) {
                return r0;
            }
            r6 = TRUE;
        }
        ++i;
    }
    if (r6) {
        return LIST_NOTHING_CHOSEN;
    }

    // Switch to button input mode
    if (a0->unk_08 == 0 && a0->inputState == MENU_INPUT_STATE_TOUCH) {
        if (gSystem.newKeys & (PAD_BUTTON_A | PAD_BUTTON_B | PAD_KEY_UP | PAD_KEY_DOWN | PAD_KEY_LEFT | PAD_KEY_RIGHT)) {
            return sub_02019E98(a0);
        } else {
            return LIST_NOTHING_CHOSEN;
        }
    }

    // Handle cursor move
    if (gSystem.newKeys & PAD_KEY_UP) {
        r2 = sub_02020A24(a0->dpadPositions, NULL, NULL, 0, 0, a0->nextInput, 0);
        spC = 0;
    } else if (gSystem.newKeys & PAD_KEY_DOWN) {
        r2 = sub_02020A24(a0->dpadPositions, NULL, NULL, 0, 0, a0->nextInput, 1);
        spC = 1;
    } else if (gSystem.newKeys & PAD_KEY_LEFT) {
        r2 = sub_02020A24(a0->dpadPositions, NULL, NULL, 0, 0, a0->nextInput, 2);
        spC = 2;
    } else if (gSystem.newKeys & PAD_KEY_RIGHT) {
        r2 = sub_02020A24(a0->dpadPositions, NULL, NULL, 0, 0, a0->nextInput, 3);
        spC = 3;
    } else {
        r2 = 0xFF;
    }
    if (r2 != 0xFF) {
        return sub_02019EB8(a0, spC, r2);
    }

    // Handle select or cancel
    if (gSystem.newKeys & PAD_BUTTON_A) {
        return a0->nextInput;
    } else if (gSystem.newKeys & PAD_BUTTON_B) {
        return LIST_CANCEL;
    }

    return LIST_NOTHING_CHOSEN;
}

int sub_02019D18(UnkStruct_02019BA4 *a0) {
    u16 i = 0;
    BOOL r6 = FALSE;
    int r0;
    u8 r2;
    u8 spC;

    // Handle touch input
    while (TRUE) {
        if (a0->touchscreenHitboxes[i].rect.top == TOUCHSCREEN_RECTLIST_END) {
            break;
        }
        if (TouchscreenHitbox_TouchNewIsIn(&a0->touchscreenHitboxes[i]) == TRUE) {
            r0 = sub_02019E4C(a0, i);
            if (r0 != LIST_NOTHING_CHOSEN) {
                return r0;
            }
            r6 = TRUE;
        }
        ++i;
    }
    if (r6) {
        return LIST_NOTHING_CHOSEN;
    }

    // Switch to button input mode
    if (a0->unk_08 == 0 && a0->inputState == MENU_INPUT_STATE_TOUCH) {
        if (gSystem.newKeys & (PAD_BUTTON_A | PAD_BUTTON_B | PAD_KEY_UP | PAD_KEY_DOWN | PAD_KEY_LEFT | PAD_KEY_RIGHT)) {
            return sub_02019E98(a0);
        } else {
            return LIST_NOTHING_CHOSEN;
        }
    }

    // Handle cursor move
    if (gSystem.newAndRepeatedKeys & PAD_KEY_UP) {
        r2 = sub_02020A24(a0->dpadPositions, NULL, NULL, 0, 0, a0->nextInput, 0);
        spC = 0;
    } else if (gSystem.newAndRepeatedKeys & PAD_KEY_DOWN) {
        r2 = sub_02020A24(a0->dpadPositions, NULL, NULL, 0, 0, a0->nextInput, 1);
        spC = 1;
    } else if (gSystem.newAndRepeatedKeys & PAD_KEY_LEFT) {
        r2 = sub_02020A24(a0->dpadPositions, NULL, NULL, 0, 0, a0->nextInput, 2);
        spC = 2;
    } else if (gSystem.newAndRepeatedKeys & PAD_KEY_RIGHT) {
        r2 = sub_02020A24(a0->dpadPositions, NULL, NULL, 0, 0, a0->nextInput, 3);
        spC = 3;
    } else {
        r2 = 0xFF;
    }
    if (r2 != 0xFF) {
        return sub_02019EB8(a0, spC, r2);
    }

    // Handle select or cancel
    if (gSystem.newKeys & PAD_BUTTON_A) {
        return a0->nextInput;
    } else if (gSystem.newKeys & PAD_BUTTON_B) {
        return LIST_CANCEL;
    }

    return LIST_NOTHING_CHOSEN;
}

int sub_02019E4C(UnkStruct_02019BA4 *a0, u16 a1) {
    if (sub_0201A06C(a0->unk_10, a1) == TRUE) {
        a0->nextInput = a1;
        a0->lastInput = 0xFF;
        a0->unk_0F = 0xFF;
        if (a0->unk_08 == TRUE && a0->inputState == MENU_INPUT_STATE_TOUCH) {
            a0->unk_08 = FALSE;
            a0->callbacks->onSwitchToTouchMode(a0->data, a0->nextInput, a0->lastInput);
        }
        a0->callbacks->onTouch(a0->data, a0->nextInput, a0->lastInput);
        return a1;
    }
    return -1;
}

int sub_02019E98(UnkStruct_02019BA4 *a0) {
    a0->unk_08 = TRUE;
    a0->lastInput = 0xFF;
    a0->unk_0F = 0xFF;
    a0->callbacks->onButton(a0->data, a0->nextInput, a0->lastInput);
    return -4;
}

int sub_02019EB8(UnkStruct_02019BA4 *a0, int a1, u8 a2) {
    u8 spC;
    u32 mask;
    u8 r1;

    if (a2 & 0x80) {
        if (a0->unk_0F != 0xFF) {
            a2 = a0->unk_0F;
        } else {
            a2 ^= 0x80;
        }
    }
    spC = TRUE;
    while (TRUE) {
        mask = 1 << (a2 % 32);
        if (a0->unk_10[a2 / 32] & mask) {
            break;
        }
        spC = FALSE;
        r1 = sub_02020A24(a0->dpadPositions, NULL, NULL, 0, 0, a2, a1) & 0x7F;
        if (r1 == a2 || r1 == a0->nextInput) {
            a2 = a0->nextInput;
            break;
        }
        a2 = r1;
    }
    if (a0->nextInput != a2) {
        if (sub_0201A020(&a0->dpadPositions[a2], a1) == TRUE && spC) {
            a0->unk_0F = a0->nextInput;
        } else {
            a0->unk_0F = 0xFF;
        }
        a0->lastInput = a0->nextInput;
        a0->nextInput = a2;
        a0->callbacks->onKeyMove(a0->data, a0->nextInput, a0->lastInput);
        return -3;
    }

    return LIST_NOTHING_CHOSEN;
}
