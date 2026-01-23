#include "unk_02019BA4.h"

#include "list_menu_items.h"
#include "menu_input_state.h"
#include "system.h"

static int GridInputHandler_HandleTouch(GridInputHandler *inputHandler, u16 hitboxId);
static int GridInputHandler_HandleButton(GridInputHandler *inputHandler);
static int GridInputHandler_HandleDpad(GridInputHandler *inputHandler, u8 direction, u8 input);
static BOOL DpadBox_IsForcedInDirection(const DpadMenuBox *dpadBox, u32 direction);
static BOOL GridInputHandlerFlagArray_CheckFlag(u32 *flags, u32 bitPos);

GridInputHandler *GridInputHandler_Create(const TouchscreenHitbox *hitBoxes, const DpadMenuBox *dpadBoxes, const GridCallbacks *callbacks, void *callbackParam, BOOL inputState, u8 initialPos, enum HeapID heapId) {
    GridInputHandler *ret = Heap_Alloc(heapId, sizeof(GridInputHandler));

    ret->touchscreenHitboxes = hitBoxes;
    ret->dpadPositions = dpadBoxes;
    ret->callbacks = callbacks;
    ret->data = callbackParam;
    ret->modeSwitchLagFrame = FALSE;
    ret->isButtons = inputState;
    ret->nextInput = initialPos;
    ret->lastInput = 0xFF;
    ret->unk_0F = 0xFF;
    ret->enabledFlag[0] = -1;
    ret->enabledFlag[1] = -1;
    return ret;
}

void GridInputHandler_Free(GridInputHandler *inputHandler) {
    Heap_Free(inputHandler);
}

int GridInputHandler_HandleInput_NoHold(GridInputHandler *inputHandler) {
    u16 i = 0;
    BOOL r6 = FALSE;
    int r0;
    u8 input;
    u8 direction;

    // Handle touch input
    while (TRUE) {
        if (inputHandler->touchscreenHitboxes[i].rect.top == TOUCHSCREEN_RECTLIST_END) {
            break;
        }
        if (TouchscreenHitbox_TouchNewIsIn(&inputHandler->touchscreenHitboxes[i]) == TRUE) {
            r0 = GridInputHandler_HandleTouch(inputHandler, i);
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
    if (inputHandler->isButtons == FALSE && inputHandler->modeSwitchLagFrame == TRUE) {
        if (gSystem.newKeys & (PAD_BUTTON_A | PAD_BUTTON_B | PAD_KEY_UP | PAD_KEY_DOWN | PAD_KEY_LEFT | PAD_KEY_RIGHT)) {
            return GridInputHandler_HandleButton(inputHandler);
        } else {
            return GRID_MENU_NOTHING_CHOSEN;
        }
    }

    // Handle cursor move
    if (gSystem.newKeys & PAD_KEY_UP) {
        input = DpadMenuBox_GetNeighborInDirection(inputHandler->dpadPositions, NULL, NULL, NULL, NULL, inputHandler->nextInput, 0);
        direction = 0;
    } else if (gSystem.newKeys & PAD_KEY_DOWN) {
        input = DpadMenuBox_GetNeighborInDirection(inputHandler->dpadPositions, NULL, NULL, NULL, NULL, inputHandler->nextInput, 1);
        direction = 1;
    } else if (gSystem.newKeys & PAD_KEY_LEFT) {
        input = DpadMenuBox_GetNeighborInDirection(inputHandler->dpadPositions, NULL, NULL, NULL, NULL, inputHandler->nextInput, 2);
        direction = 2;
    } else if (gSystem.newKeys & PAD_KEY_RIGHT) {
        input = DpadMenuBox_GetNeighborInDirection(inputHandler->dpadPositions, NULL, NULL, NULL, NULL, inputHandler->nextInput, 3);
        direction = 3;
    } else {
        input = 0xFF;
    }
    if (input != 0xFF) {
        return GridInputHandler_HandleDpad(inputHandler, direction, input);
    }

    // Handle select or cancel
    if (gSystem.newKeys & PAD_BUTTON_A) {
        return inputHandler->nextInput;
    } else if (gSystem.newKeys & PAD_BUTTON_B) {
        return GRID_MENU_CANCEL;
    }

    return GRID_MENU_NOTHING_CHOSEN;
}

int GridInputHandler_HandleInput_AllowHold(GridInputHandler *inputHandler) {
    u16 i = 0;
    BOOL r6 = FALSE;
    int r0;
    u8 input;
    u8 direction;

    // Handle touch input
    while (TRUE) {
        if (inputHandler->touchscreenHitboxes[i].rect.top == TOUCHSCREEN_RECTLIST_END) {
            break;
        }
        if (TouchscreenHitbox_TouchNewIsIn(&inputHandler->touchscreenHitboxes[i]) == TRUE) {
            r0 = GridInputHandler_HandleTouch(inputHandler, i);
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
    if (inputHandler->isButtons == FALSE && inputHandler->modeSwitchLagFrame == TRUE) {
        if (gSystem.newKeys & (PAD_BUTTON_A | PAD_BUTTON_B | PAD_KEY_UP | PAD_KEY_DOWN | PAD_KEY_LEFT | PAD_KEY_RIGHT)) {
            return GridInputHandler_HandleButton(inputHandler);
        } else {
            return GRID_MENU_NOTHING_CHOSEN;
        }
    }

    // Handle cursor move
    if (gSystem.newAndRepeatedKeys & PAD_KEY_UP) {
        input = DpadMenuBox_GetNeighborInDirection(inputHandler->dpadPositions, NULL, NULL, NULL, NULL, inputHandler->nextInput, 0);
        direction = 0;
    } else if (gSystem.newAndRepeatedKeys & PAD_KEY_DOWN) {
        input = DpadMenuBox_GetNeighborInDirection(inputHandler->dpadPositions, NULL, NULL, NULL, NULL, inputHandler->nextInput, 1);
        direction = 1;
    } else if (gSystem.newAndRepeatedKeys & PAD_KEY_LEFT) {
        input = DpadMenuBox_GetNeighborInDirection(inputHandler->dpadPositions, NULL, NULL, NULL, NULL, inputHandler->nextInput, 2);
        direction = 2;
    } else if (gSystem.newAndRepeatedKeys & PAD_KEY_RIGHT) {
        input = DpadMenuBox_GetNeighborInDirection(inputHandler->dpadPositions, NULL, NULL, NULL, NULL, inputHandler->nextInput, 3);
        direction = 3;
    } else {
        input = 0xFF;
    }
    if (input != 0xFF) {
        return GridInputHandler_HandleDpad(inputHandler, direction, input);
    }

    // Handle select or cancel
    if (gSystem.newKeys & PAD_BUTTON_A) {
        return inputHandler->nextInput;
    } else if (gSystem.newKeys & PAD_BUTTON_B) {
        return GRID_MENU_CANCEL;
    }

    return GRID_MENU_NOTHING_CHOSEN;
}

static int GridInputHandler_HandleTouch(GridInputHandler *inputHandler, u16 hitboxId) {
    if (GridInputHandlerFlagArray_CheckFlag(inputHandler->enabledFlag, hitboxId) == TRUE) {
        inputHandler->nextInput = hitboxId;
        inputHandler->lastInput = 0xFF;
        inputHandler->unk_0F = 0xFF;
        if (inputHandler->isButtons == TRUE && inputHandler->modeSwitchLagFrame == TRUE) {
            inputHandler->isButtons = FALSE;
            inputHandler->callbacks->onSwitchToTouchMode(inputHandler->data, inputHandler->nextInput, inputHandler->lastInput);
        }
        inputHandler->callbacks->onTouch(inputHandler->data, inputHandler->nextInput, inputHandler->lastInput);
        return hitboxId;
    }
    return GRID_MENU_NOTHING_CHOSEN;
}

static int GridInputHandler_HandleButton(GridInputHandler *inputHandler) {
    inputHandler->isButtons = TRUE;
    inputHandler->lastInput = 0xFF;
    inputHandler->unk_0F = 0xFF;
    inputHandler->callbacks->onButton(inputHandler->data, inputHandler->nextInput, inputHandler->lastInput);
    return GRID_MENU_BUTTON_MODE;
}

static int GridInputHandler_HandleDpad(GridInputHandler *inputHandler, u8 direction, u8 input) {
    u8 neighborIsEnabled;
    u32 mask;
    u8 r1;

    if (input & 0x80) {
        if (inputHandler->unk_0F != 0xFF) {
            input = inputHandler->unk_0F;
        } else {
            input ^= 0x80;
        }
    }
    neighborIsEnabled = TRUE;
    while (TRUE) {
        mask = 1 << (input % 32);
        if (inputHandler->enabledFlag[input / 32] & mask) {
            break;
        }
        neighborIsEnabled = FALSE;
        r1 = DpadMenuBox_GetNeighborInDirection(inputHandler->dpadPositions, NULL, NULL, NULL, NULL, input, direction) & 0x7F;
        if (r1 == input || r1 == inputHandler->nextInput) {
            input = inputHandler->nextInput;
            break;
        }
        input = r1;
    }
    if (inputHandler->nextInput != input) {
        if (DpadBox_IsForcedInDirection(&inputHandler->dpadPositions[input], direction) == TRUE && neighborIsEnabled) {
            inputHandler->unk_0F = inputHandler->nextInput;
        } else {
            inputHandler->unk_0F = 0xFF;
        }
        inputHandler->lastInput = inputHandler->nextInput;
        inputHandler->nextInput = input;
        inputHandler->callbacks->onKeyMove(inputHandler->data, inputHandler->nextInput, inputHandler->lastInput);
        return GRID_MENU_CURSOR_MOVE;
    }

    return GRID_MENU_NOTHING_CHOSEN;
}

int GridInputHandler_GetNextInput(GridInputHandler *inputHandler) {
    return inputHandler->nextInput;
}

int GridInputHandler_GetUnk0F(GridInputHandler *inputHandler) {
    return inputHandler->unk_0F;
}

void GridInputHandler_SetNextInput(GridInputHandler *inputHandler, int nextInput) {
    inputHandler->nextInput = nextInput;
    inputHandler->lastInput = 0xFF;
    inputHandler->unk_0F = 0xFF;
}

void GridInputHandler_SetNextLastUnk0FInputs(GridInputHandler *inputHandler, int nextInput, int lastInput, int unk0F) {
    inputHandler->nextInput = nextInput;
    inputHandler->lastInput = lastInput;
    inputHandler->unk_0F = unk0F;
}

BOOL GridInputHandler_IsButtonInputMode(GridInputHandler *inputHandler) {
    return inputHandler->isButtons;
}

void GridInputHandler_SetButtonInputMode(GridInputHandler *inputHandler, BOOL isButtons) {
    inputHandler->isButtons = isButtons;
    if (isButtons == TRUE) {
        inputHandler->lastInput = 0xFF;
        inputHandler->unk_0F = 0xFF;
        inputHandler->callbacks->onButton(inputHandler->data, inputHandler->nextInput, -1);
    } else {
        inputHandler->callbacks->onSwitchToTouchMode(inputHandler->data, inputHandler->nextInput, -1);
    }
}

void GridInputHandler_SetAllEnabled(GridInputHandler *inputHandler) {
    inputHandler->enabledFlag[0] = -1u;
    inputHandler->enabledFlag[1] = -1u;
}

void GridInputHandler_ClearEnabledFlag(GridInputHandler *inputHandler, u32 target) {
    if (inputHandler->enabledFlag[target / 32] & (1 << (target % 32))) {
        inputHandler->enabledFlag[target / 32] &= ((1 << (target % 32)) ^ -1);
    }
}

void GridInputHandler_SetEnabledFlag(GridInputHandler *inputHandler, u32 target) {
    if (!(inputHandler->enabledFlag[target / 32] & (1 << (target % 32)))) {
        inputHandler->enabledFlag[target / 32] ^= (1 << (target % 32));
    }
}

const DpadMenuBox *GridInputHandler_GetDpadBox(GridInputHandler *inputHandler, int target) {
    return &inputHandler->dpadPositions[target];
}

static BOOL DpadBox_IsForcedInDirection(const DpadMenuBox *dpadBox, u32 direction) {
    switch (direction) {
    case 0:
        if (dpadBox->buttonDown & 0x80) {
            return TRUE;
        }
        break;
    case 1:
        if (dpadBox->buttonUp & 0x80) {
            return TRUE;
        }
        break;
    case 2:
        if (dpadBox->buttonRight & 0x80) {
            return TRUE;
        }
        break;
    case 3:
        if (dpadBox->buttonLeft & 0x80) {
            return TRUE;
        }
        break;
    }

    return FALSE;
}

static BOOL GridInputHandlerFlagArray_CheckFlag(u32 *flags, u32 bitPos) {
    return (flags[bitPos / 32] & (1 << (bitPos % 32))) != 0;
}
