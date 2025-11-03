#include "unk_02019BA4.h"

#include "list_menu_items.h"
#include "menu_input_state.h"
#include "system.h"

int sub_02019E4C(UnkStruct_02019BA4 *a0, u16 a1);
int sub_02019E98(UnkStruct_02019BA4 *a0);
int sub_02019EB8(UnkStruct_02019BA4 *a0, int direction, u8 input);
BOOL sub_0201A020(const UnkStruct_02020A0C *a0, u32 a1);
BOOL sub_0201A06C(int *a0, u32 a1);

UnkStruct_02019BA4 *sub_02019BA4(const TouchscreenHitbox *hitBoxes, const UnkStruct_02020A0C *dpadBoxes, const UnkStruct_02019BA4_callbacks *callbacks, void *callbackParam, BOOL a4, u8 initialPos, enum HeapID heapId) {
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
    ret->enabledFlag[0] = -1;
    ret->enabledFlag[1] = -1;
    return ret;
}

void sub_02019BDC(UnkStruct_02019BA4 *a0) {
    Heap_Free(a0);
}

int sub_02019BE4(UnkStruct_02019BA4 *a0) {
    u16 i = 0;
    BOOL r6 = FALSE;
    int r0;
    u8 input;
    u8 direction;

    // Handle touch input
    while (TRUE) {
        if (a0->touchscreenHitboxes[i].rect.top == TOUCHSCREEN_RECTLIST_END) {
            break;
        }
        if (TouchscreenHitbox_TouchNewIsIn(&a0->touchscreenHitboxes[i]) == TRUE) {
            r0 = sub_02019E4C(a0, i);
            if (r0 != GRID_MENU_NOTHING_CHOSEN) {
                return r0;
            }
            r6 = TRUE;
        }
        ++i;
    }
    if (r6) {
        return GRID_MENU_NOTHING_CHOSEN;
    }

    // Switch to button input mode
    if (!a0->unk_08 && a0->inputState == MENU_INPUT_STATE_TOUCH) {
        if (gSystem.newKeys & (PAD_BUTTON_A | PAD_BUTTON_B | PAD_KEY_UP | PAD_KEY_DOWN | PAD_KEY_LEFT | PAD_KEY_RIGHT)) {
            return sub_02019E98(a0);
        } else {
            return GRID_MENU_NOTHING_CHOSEN;
        }
    }

    // Handle cursor move
    if (gSystem.newKeys & PAD_KEY_UP) {
        input = sub_02020A24(a0->dpadPositions, NULL, NULL, 0, 0, a0->nextInput, 0);
        direction = 0;
    } else if (gSystem.newKeys & PAD_KEY_DOWN) {
        input = sub_02020A24(a0->dpadPositions, NULL, NULL, 0, 0, a0->nextInput, 1);
        direction = 1;
    } else if (gSystem.newKeys & PAD_KEY_LEFT) {
        input = sub_02020A24(a0->dpadPositions, NULL, NULL, 0, 0, a0->nextInput, 2);
        direction = 2;
    } else if (gSystem.newKeys & PAD_KEY_RIGHT) {
        input = sub_02020A24(a0->dpadPositions, NULL, NULL, 0, 0, a0->nextInput, 3);
        direction = 3;
    } else {
        input = 0xFF;
    }
    if (input != 0xFF) {
        return sub_02019EB8(a0, direction, input);
    }

    // Handle select or cancel
    if (gSystem.newKeys & PAD_BUTTON_A) {
        return a0->nextInput;
    } else if (gSystem.newKeys & PAD_BUTTON_B) {
        return GRID_MENU_CANCEL;
    }

    return GRID_MENU_NOTHING_CHOSEN;
}

int sub_02019D18(UnkStruct_02019BA4 *a0) {
    u16 i = 0;
    BOOL r6 = FALSE;
    int r0;
    u8 input;
    u8 direction;

    // Handle touch input
    while (TRUE) {
        if (a0->touchscreenHitboxes[i].rect.top == TOUCHSCREEN_RECTLIST_END) {
            break;
        }
        if (TouchscreenHitbox_TouchNewIsIn(&a0->touchscreenHitboxes[i]) == TRUE) {
            r0 = sub_02019E4C(a0, i);
            if (r0 != GRID_MENU_NOTHING_CHOSEN) {
                return r0;
            }
            r6 = TRUE;
        }
        ++i;
    }
    if (r6) {
        return GRID_MENU_NOTHING_CHOSEN;
    }

    // Switch to button input mode
    if (!a0->unk_08 && a0->inputState == MENU_INPUT_STATE_TOUCH) {
        if (gSystem.newKeys & (PAD_BUTTON_A | PAD_BUTTON_B | PAD_KEY_UP | PAD_KEY_DOWN | PAD_KEY_LEFT | PAD_KEY_RIGHT)) {
            return sub_02019E98(a0);
        } else {
            return GRID_MENU_NOTHING_CHOSEN;
        }
    }

    // Handle cursor move
    if (gSystem.newAndRepeatedKeys & PAD_KEY_UP) {
        input = sub_02020A24(a0->dpadPositions, NULL, NULL, 0, 0, a0->nextInput, 0);
        direction = 0;
    } else if (gSystem.newAndRepeatedKeys & PAD_KEY_DOWN) {
        input = sub_02020A24(a0->dpadPositions, NULL, NULL, 0, 0, a0->nextInput, 1);
        direction = 1;
    } else if (gSystem.newAndRepeatedKeys & PAD_KEY_LEFT) {
        input = sub_02020A24(a0->dpadPositions, NULL, NULL, 0, 0, a0->nextInput, 2);
        direction = 2;
    } else if (gSystem.newAndRepeatedKeys & PAD_KEY_RIGHT) {
        input = sub_02020A24(a0->dpadPositions, NULL, NULL, 0, 0, a0->nextInput, 3);
        direction = 3;
    } else {
        input = 0xFF;
    }
    if (input != 0xFF) {
        return sub_02019EB8(a0, direction, input);
    }

    // Handle select or cancel
    if (gSystem.newKeys & PAD_BUTTON_A) {
        return a0->nextInput;
    } else if (gSystem.newKeys & PAD_BUTTON_B) {
        return GRID_MENU_CANCEL;
    }

    return GRID_MENU_NOTHING_CHOSEN;
}

int sub_02019E4C(UnkStruct_02019BA4 *a0, u16 a1) {
    if (sub_0201A06C(a0->enabledFlag, a1) == TRUE) {
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
    return GRID_MENU_NOTHING_CHOSEN;
}

int sub_02019E98(UnkStruct_02019BA4 *a0) {
    a0->unk_08 = TRUE;
    a0->lastInput = 0xFF;
    a0->unk_0F = 0xFF;
    a0->callbacks->onButton(a0->data, a0->nextInput, a0->lastInput);
    return GRID_MENU_BUTTON_MODE;
}

int sub_02019EB8(UnkStruct_02019BA4 *a0, int direction, u8 input) {
    u8 spC;
    u32 mask;
    u8 r1;

    if (input & 0x80) {
        if (a0->unk_0F != 0xFF) {
            input = a0->unk_0F;
        } else {
            input ^= 0x80;
        }
    }
    spC = TRUE;
    while (TRUE) {
        mask = 1 << (input % 32);
        if (a0->enabledFlag[input / 32] & mask) {
            break;
        }
        spC = FALSE;
        r1 = sub_02020A24(a0->dpadPositions, NULL, NULL, 0, 0, input, direction) & 0x7F;
        if (r1 == input || r1 == a0->nextInput) {
            input = a0->nextInput;
            break;
        }
        input = r1;
    }
    if (a0->nextInput != input) {
        if (sub_0201A020(&a0->dpadPositions[input], direction) == TRUE && spC) {
            a0->unk_0F = a0->nextInput;
        } else {
            a0->unk_0F = 0xFF;
        }
        a0->lastInput = a0->nextInput;
        a0->nextInput = input;
        a0->callbacks->onKeyMove(a0->data, a0->nextInput, a0->lastInput);
        return GRID_MENU_CURSOR_MOVE;
    }

    return GRID_MENU_NOTHING_CHOSEN;
}

int sub_02019F74(UnkStruct_02019BA4 *a0) {
    return a0->nextInput;
}

int sub_02019F78(UnkStruct_02019BA4 *a0) {
    return a0->unk_0F;
}

void sub_02019F7C(UnkStruct_02019BA4 *a0, int a1) {
    a0->nextInput = a1;
    a0->lastInput = 0xFF;
    a0->unk_0F = 0xFF;
}

void sub_02019F88(UnkStruct_02019BA4 *a0, int a1, int a2, int a3) {
    a0->nextInput = a1;
    a0->lastInput = a2;
    a0->unk_0F = a3;
}

BOOL sub_02019F90(UnkStruct_02019BA4 *a0) {
    return a0->unk_08;
}

void sub_02019F94(UnkStruct_02019BA4 *a0, BOOL a1) {
    a0->unk_08 = a1;
    if (a1 == TRUE) {
        a0->lastInput = 0xFF;
        a0->unk_0F = 0xFF;
        a0->callbacks->onButton(a0->data, a0->nextInput, -1);
    } else {
        a0->callbacks->onSwitchToTouchMode(a0->data, a0->nextInput, -1);
    }
}

void sub_02019FC4(UnkStruct_02019BA4 *a0) {
    a0->enabledFlag[0] = -1u;
    a0->enabledFlag[1] = -1u;
}

void sub_02019FD0(UnkStruct_02019BA4 *a0, u32 a1) {
    if (a0->enabledFlag[a1 / 32] & (1 << (a1 % 32))) {
        a0->enabledFlag[a1 / 32] &= ((1 << (a1 % 32)) ^ -1);
    }
}

void sub_02019FF8(UnkStruct_02019BA4 *a0, u32 a1) {
    if (!(a0->enabledFlag[a1 / 32] & (1 << (a1 % 32)))) {
        a0->enabledFlag[a1 / 32] ^= (1 << (a1 % 32));
    }
}

const UnkStruct_02020A0C *sub_0201A018(UnkStruct_02019BA4 *a0, int a1) {
    return &a0->dpadPositions[a1];
}

BOOL sub_0201A020(const UnkStruct_02020A0C *a0, u32 a1) {
    switch (a1) {
    case 0:
        if (a0->buttonDown & 0x80) {
            return TRUE;
        }
        break;
    case 1:
        if (a0->buttonUp & 0x80) {
            return TRUE;
        }
        break;
    case 2:
        if (a0->buttonRight & 0x80) {
            return TRUE;
        }
        break;
    case 3:
        if (a0->buttonLeft & 0x80) {
            return TRUE;
        }
        break;
    }

    return FALSE;
}

BOOL sub_0201A06C(int *a0, u32 a1) {
    return (a0[a1 / 32] & (1 << (a1 % 32))) != 0;
}
