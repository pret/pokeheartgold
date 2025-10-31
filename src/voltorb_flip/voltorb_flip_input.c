#include "voltorb_flip/voltorb_flip_input.h"

#include "global.h"

#include "constants/sndseq.h"

#include "heap.h"
#include "sprite_system.h"
#include "system.h"
#include "touchscreen.h"
#include "unk_02005D10.h"
#include "unk_020192D0.h"
#include "unk_02020654.h"

static void ov122_021E8E78(VoltorbFlipInputHandler *);
static void ov122_021E8F58(VoltorbFlipInputHandler *);
static int VoltorbFlipInputHandler_HandleInput_Memo(VoltorbFlipInputHandler *);
static int VoltorbFlipInputHandler_HandleInput_NoMemo(VoltorbFlipInputHandler *);
static void ov122_021E9108(VoltorbFlipInputHandler *, int);
static void ov122_021E9134(VoltorbFlipInputHandler *);
static void ov122_021E9154(VoltorbFlipInputHandler *, int);
static void ov122_021E91AC(VoltorbFlipInputHandler *inputHandler, int newFocus, int oldFocus, MenuInputState inputMode);
static void VoltorbFlipInputCB_OnButtonPress(void *data, int new, int prev);
static void VoltorbFlipInputCB_OnTouchSwitch(void *data, int new, int prev);
static void VoltorbFlipInputCB_OnKeyMove(void *data, int new, int prev);
static void VoltorbFlipInputCB_OnTouch(void *data, int new, int prev);

const UnkStruct_02019BA4_callbacks sInputCallbacks = {
    VoltorbFlipInputCB_OnButtonPress,
    VoltorbFlipInputCB_OnTouchSwitch,
    VoltorbFlipInputCB_OnKeyMove,
    VoltorbFlipInputCB_OnTouch,
};

// clang-format off
const TouchscreenHitbox sMemoTouchscreenHitboxes[] = {
    { .rect = {  80, 104, 200, 224 } },
    { .rect = {  80, 104, 224, 248 } },
    { .rect = { 104, 128, 200, 224 } },
    { .rect = { 104, 128, 224, 248 } },
    { .rect = { 128, 152, 224, 248 } },
    { .rect = {   8,  72, 192, 256 } },
    { .rect = { 160, 192, 192, 256 } },
    { .rect = TOUCHSCREEN_RECTLIST_END },
};

const TouchscreenHitbox sTouchscreenHitboxes[] = {
    { .rect = {   8,  32,   8,  32 } },
    { .rect = {   8,  32,  40,  64 } },
    { .rect = {   8,  32,  72,  96 } },
    { .rect = {   8,  32, 104, 128 } },
    { .rect = {   8,  32, 136, 160 } },
    { .rect = {  40,  64,   8,  32 } },
    { .rect = {  40,  64,  40,  64 } },
    { .rect = {  40,  64,  72,  96 } },
    { .rect = {  40,  64, 104, 128 } },
    { .rect = {  40,  64, 136, 160 } },
    { .rect = {  72,  96,   8,  32 } },
    { .rect = {  72,  96,  40,  64 } },
    { .rect = {  72,  96,  72,  96 } },
    { .rect = {  72,  96, 104, 128 } },
    { .rect = {  72,  96, 136, 160 } },
    { .rect = { 104, 128,   8,  32 } },
    { .rect = { 104, 128,  40,  64 } },
    { .rect = { 104, 128,  72,  96 } },
    { .rect = { 104, 128, 104, 128 } },
    { .rect = { 104, 128, 136, 160 } },
    { .rect = { 136, 160,   8,  32 } },
    { .rect = { 136, 160,  40,  64 } },
    { .rect = { 136, 160,  72,  96 } },
    { .rect = { 136, 160, 104, 128 } },
    { .rect = { 136, 160, 136, 160 } },
    { .rect = {   8,  72, 192,   0 } },
    { .rect = { 160, 192, 192,   0 } },
    { .rect = TOUCHSCREEN_RECTLIST_END },
};

const UnkStruct_02020654 sDpadButtonSpecs[] = {
    {   8,   8, 24, 24, 20,  5, 25, 1  },
    {  40,   8, 24, 24, 21,  6,  0, 2  },
    {  72,   8, 24, 24, 22,  7,  1, 3  },
    { 104,   8, 24, 24, 23,  8,  2, 4  },
    { 136,   8, 24, 24, 24,  9,  3, 25 },
    {   8,  40, 24, 24,  0, 10, 25, 6  },
    {  40,  40, 24, 24,  1, 11,  5, 7  },
    {  72,  40, 24, 24,  2, 12,  6, 8  },
    { 104,  40, 24, 24,  3, 13,  7, 9  },
    { 136,  40, 24, 24,  4, 14,  8, 25 },
    {   8,  72, 24, 24,  5, 15, 25, 11 },
    {  40,  72, 24, 24,  6, 16, 10, 12 },
    {  72,  72, 24, 24,  7, 17, 11, 13 },
    { 104,  72, 24, 24,  8, 18, 12, 14 },
    { 136,  72, 24, 24,  9, 19, 13, 25 },
    {   8, 104, 24, 24, 10, 20, 26, 16 },
    {  40, 104, 24, 24, 11, 21, 15, 17 },
    {  72, 104, 24, 24, 12, 22, 16, 18 },
    { 104, 104, 24, 24, 13, 23, 17, 19 },
    { 136, 104, 24, 24, 14, 24, 18, 26 },
    {   8, 136, 24, 24, 15,  0, 26, 21 },
    {  40, 136, 24, 24, 16,  1, 20, 22 },
    {  72, 136, 24, 24, 17,  2, 21, 23 },
    { 104, 136, 24, 24, 18,  3, 22, 24 },
    { 136, 136, 24, 24, 19,  4, 23, 26 },
    { 224,  40,  0,  0, 25, 26, 27, 28 },
    { 224, 176,  0,  0, 25, 26, 27, 28 },
};

u8 ov122_021E9BA0[5][2] = {
    { 200,  80 },
    { 224,  80 },
    { 200, 104 },
    { 224, 104 },
    { 224, 128 },
};
// clang-format on

VoltorbFlipInputHandler *VoltorbFlipInputHandler_Create(enum HeapID heapID, struct ManagedSprite *a1, struct ManagedSprite *a2) {
    GF_ASSERT(a1 != NULL);

    VoltorbFlipInputHandler *ptr = Heap_Alloc(heapID, sizeof(VoltorbFlipInputHandler));
    MI_CpuFill8(ptr, 0, sizeof(VoltorbFlipInputHandler));

    ptr->unk0 = a1;
    ptr->unk4 = a2;
    ptr->unk8 = sub_02019BA4(sTouchscreenHitboxes, sDpadButtonSpecs, &sInputCallbacks, ptr, 1, ptr->focus, heapID);

    ov122_021E9108(ptr, 0);
    return ptr;
}

void VoltorbFlipInputHandler_Free(VoltorbFlipInputHandler *inputHandler) {
    GF_ASSERT(inputHandler->unk8 != 0);
    sub_02019BDC(inputHandler->unk8);
    Heap_Free(inputHandler);
}

int VoltorbFlipInputHandler_HandleInput(VoltorbFlipInputHandler *inputHandler) {
    if (inputHandler->memoFocused) {
        return VoltorbFlipInputHandler_HandleInput_Memo(inputHandler);
    } else {
        return VoltorbFlipInputHandler_HandleInput_NoMemo(inputHandler);
    }
}

void ov122_021E8D8C(VoltorbFlipInputHandler *inputHandler, BOOL draw) {
    if (draw) {
        ManagedSprite_SetDrawFlag(inputHandler->unk0, TRUE);
    } else {
        ManagedSprite_SetDrawFlag(inputHandler->unk0, FALSE);
        inputHandler->focus = 0;
    }
}

void VoltorbFlipInputHandler_SetMemoOpen(VoltorbFlipInputHandler *inputHandler, BOOL val) {
    inputHandler->memoOpen = val;
    ov122_021E9154(inputHandler, inputHandler->focus);
}

void VoltorbFlipInputHandler_SetMemoFocused(VoltorbFlipInputHandler *inputHandler, BOOL val) {
    inputHandler->memoFocused = val;
    ov122_021E9154(inputHandler, inputHandler->focus);
    ManagedSprite_SetDrawFlag(inputHandler->unk4, val);
}

int VoltorbFlipInputHandler_GetCursorPos(VoltorbFlipInputHandler *inputHandler) {
    GF_ASSERT(inputHandler != 0);
    GF_ASSERT(inputHandler->unk8 != 0);
    // This seems to return which touch screen hitbox was pressed/clicked
    return sub_02019F74(inputHandler->unk8);
}

int VoltorbFlipInputHandler_GetMemoButtonID(VoltorbFlipInputHandler *inputHandler) {
    GF_ASSERT(inputHandler != 0);
    GF_ASSERT(inputHandler->unk8 != 0);
    return inputHandler->memoButtonID;
}

BOOL VoltorbFlipInputHandler_IsCursorInGridRange(VoltorbFlipInputHandler *inputHandler) {
    int input = sub_02019F74(inputHandler->unk8);
    return input != VOLTORB_FLIP_INPUT_MEMO && input != VOLTORB_FLIP_INPUT_QUIT;
}

void ov122_021E8E40(VoltorbFlipInputHandler *inputHandler) {
    sub_02019F7C(inputHandler->unk8, 0);
    ov122_021E9108(inputHandler, 0);
}

void ov122_021E8E58(VoltorbFlipInputHandler *inputHandler) {
    inputHandler->memoButtonID = 0;
    inputHandler->lastMemoButtonID = 0;
    ov122_021E9134(inputHandler);
}

BOOL ov122_021E8E70(VoltorbFlipInputHandler *inputHandler) {
    return inputHandler->touchNew;
}

// Probably for handling focus movement
static void ov122_021E8E78(VoltorbFlipInputHandler *inputHandler) {
    int newMemoButtonID;
    u8 lastMemoButtonID = inputHandler->memoButtonID;

    if (gSystem.newAndRepeatedKeys & PAD_KEY_DOWN) {
        newMemoButtonID = lastMemoButtonID + 2;
        if (newMemoButtonID > 4) {
            newMemoButtonID = 4;
        }
        inputHandler->memoButtonID = newMemoButtonID;
    } else if (gSystem.newAndRepeatedKeys & PAD_KEY_LEFT) {
        newMemoButtonID = lastMemoButtonID - 1;
        if (newMemoButtonID < 0) {
            newMemoButtonID = 0;
        }
        inputHandler->memoButtonID = newMemoButtonID;
    } else if (gSystem.newAndRepeatedKeys & PAD_KEY_UP) {
        if (lastMemoButtonID == 4 && (inputHandler->lastMemoButtonID == 2 || inputHandler->lastMemoButtonID == 3)) {
            inputHandler->memoButtonID = inputHandler->lastMemoButtonID;
        } else {
            newMemoButtonID = lastMemoButtonID - 2;
            if (newMemoButtonID < 0) {
                newMemoButtonID = 0;
            }
            inputHandler->memoButtonID = newMemoButtonID;
        }
    } else if (gSystem.newAndRepeatedKeys & PAD_KEY_RIGHT) {
        newMemoButtonID = lastMemoButtonID + 1;
        if (newMemoButtonID > 4) {
            newMemoButtonID = 4;
        }
        inputHandler->memoButtonID = newMemoButtonID;
    }

    if (lastMemoButtonID != inputHandler->memoButtonID) {
        inputHandler->lastMemoButtonID = lastMemoButtonID;
        ov122_021E9134(inputHandler);
        PlaySE(SEQ_SE_DP_SELECT);
    }
}

static void ov122_021E8F58(VoltorbFlipInputHandler *inputHandler) {
    inputHandler->memoButtonID = 4;
    ov122_021E9134(inputHandler);
}

static int VoltorbFlipInputHandler_HandleInput_Memo(VoltorbFlipInputHandler *inputHandler) {
    inputHandler->touchNew = FALSE;

    if (gSystem.newKeys & PAD_BUTTON_X) {
        return 4;
    }
    if (gSystem.newKeys & PAD_BUTTON_B) {
        ov122_021E8F58(inputHandler);
        return 3;
    }
    if (gSystem.newKeys & PAD_BUTTON_A) {
        if (inputHandler->memoButtonID == 4) {
            ov122_021E8F58(inputHandler);
            return 3;
        }
        return 1;
    }

    ov122_021E8E78(inputHandler);
    inputHandler->touchNew = TRUE;

    u8 var1 = TouchscreenHitbox_FindRectAtTouchNew(sMemoTouchscreenHitboxes);
    if (var1 < NELEMS(sMemoTouchscreenHitboxes)) { // bug: limit should be 1 fewer
        switch (var1) {
        case 4:
            inputHandler->memoButtonID = var1;
            ov122_021E9134(inputHandler);
            return 3;
        case 5:
            return 4;
        case 6:
            return 2;
        default: // 0-3
            inputHandler->memoButtonID = var1;
            ov122_021E9134(inputHandler);
            return 1;
        }
    }
    return 0;
}

static int VoltorbFlipInputHandler_HandleInput_NoMemo(VoltorbFlipInputHandler *inputHandler) {
    int newFocus = sub_02019F74(inputHandler->unk8);
    int elementId = sub_02019D18(inputHandler->unk8);
    sub_02019F74(inputHandler->unk8);

    if (elementId < NELEMS(sTouchscreenHitboxes)) { // bug: limit should be 1 lower
        inputHandler->touchNew = System_GetTouchNew();
        // Open/close Memo button
        if (elementId == VOLTORB_FLIP_INPUT_MEMO) {
            if (inputHandler->touchNew) {
                inputHandler->focus = newFocus;
                sub_02019F7C(inputHandler->unk8, inputHandler->focus);
            } else {
                ov122_021E8E40(inputHandler);
            }
            return 4;
        }
        // Quit button
        if (elementId == VOLTORB_FLIP_INPUT_QUIT) {
            return 2;
        }
        return 1;
    }

    inputHandler->touchNew = FALSE;
    if (gSystem.newKeys & PAD_BUTTON_X) {
        if (inputHandler->focus == VOLTORB_FLIP_INPUT_MEMO || inputHandler->focus == VOLTORB_FLIP_INPUT_QUIT) {
            ov122_021E8E40(inputHandler);
        }
        return 4;
    }
    if (gSystem.newKeys & PAD_BUTTON_B) {
        return 3;
    }

    if (inputHandler->memoOpen && inputHandler->focus != VOLTORB_FLIP_INPUT_MEMO && inputHandler->focus != VOLTORB_FLIP_INPUT_QUIT) {
        u32 whichButton = TouchscreenHitbox_FindRectAtTouchNew(sMemoTouchscreenHitboxes);
        if (whichButton < 8) {
            switch (whichButton) {
            case 0:
                return 5;
            case 1:
                return 6;
            case 2:
                return 7;
            case 3:
                return 8;
            }
        }
    }
    return 0;
}

static void ov122_021E9108(VoltorbFlipInputHandler *inputHandler, int newFocus) {
    u8 x;
    u8 y;

    ov122_021E9154(inputHandler, newFocus);
    sub_02020A0C(sub_0201A018(inputHandler->unk8, newFocus), &x, &y);
    ManagedSprite_SetPositionXY(inputHandler->unk0, x, y);
    inputHandler->focus = newFocus;
}

static void ov122_021E9134(VoltorbFlipInputHandler *inputHandler) {
    ManagedSprite_SetPositionXY(inputHandler->unk4, ov122_021E9BA0[inputHandler->memoButtonID][0], ov122_021E9BA0[inputHandler->memoButtonID][1]);
}

static void ov122_021E9154(VoltorbFlipInputHandler *inputHandler, int newFocus) {
    int indicatorType;

    if (newFocus < VOLTORB_FLIP_INPUT_GRID_NUM) { // In grid
        if (inputHandler->memoFocused) {
            indicatorType = 24; // Disabled pencil
        } else if (inputHandler->memoOpen) {
            indicatorType = 23; // Pencil
        } else {
            indicatorType = 18; // Card focus
        }
    } else if (newFocus == VOLTORB_FLIP_INPUT_MEMO) { // Memo
        indicatorType = 7;                            // Open/close Memo button
    } else if (newFocus == VOLTORB_FLIP_INPUT_QUIT) { // Quit
        indicatorType = 4;                            // Quit button
    } else {
        GF_ASSERT(FALSE);
    }

    if (inputHandler->memoOpen) {
        ManagedSprite_SetPaletteOverride(inputHandler->unk0, 4);
    } else {
        ManagedSprite_SetPaletteOverride(inputHandler->unk0, 2);
    }
    ManagedSprite_SetAnimNoRestart(inputHandler->unk0, indicatorType);
}

static void ov122_021E91AC(VoltorbFlipInputHandler *inputHandler, int newFocus, int oldFocus, MenuInputState inputMode) {
    if ((inputMode == MENU_INPUT_STATE_BUTTONS || newFocus != VOLTORB_FLIP_INPUT_MEMO) && newFocus != oldFocus && newFocus < NELEMS(sTouchscreenHitboxes)) {
        // Updates visual focus indicator
        ov122_021E9108(inputHandler, newFocus);
        // Plays when you switch focus
        PlaySE(SEQ_SE_DP_SELECT);
    }
}

// UnkStruct_02019BA4_unk18_func callbacks

static void VoltorbFlipInputCB_OnButtonPress(void *data, int new, int prev) {
    VoltorbFlipInputHandler *inputHandler = data;

    sub_02019F7C(inputHandler->unk8, (u8)new);
    ov122_021E9108(inputHandler, new);
    PlaySE(SEQ_SE_DP_SELECT);
}

static void VoltorbFlipInputCB_OnTouchSwitch(void *data, int new, int prev) {
    // no-op
}

static void VoltorbFlipInputCB_OnKeyMove(void *data, int new, int prev) {
    VoltorbFlipInputHandler *inputHandler = data;

    if (new == VOLTORB_FLIP_COL4_ROWLAST) { // wrap around left
        new = inputHandler->selectedRow * 5 + 4;
        GF_ASSERT(new < VOLTORB_FLIP_INPUT_GRID_NUM);
        sub_02019F7C(inputHandler->unk8, (u8)new);
    } else if (new == VOLTORB_FLIP_COL0_ROWLAST) { // wrap around right
        new = inputHandler->selectedRow * 5;
        GF_ASSERT(new < VOLTORB_FLIP_INPUT_GRID_NUM);
        sub_02019F7C(inputHandler->unk8, (u8)new);
    }

    if (new != VOLTORB_FLIP_INPUT_MEMO && new != VOLTORB_FLIP_INPUT_QUIT) {
        inputHandler->selectedRow = new / 5;
    }
    ov122_021E91AC(inputHandler, new, prev, MENU_INPUT_STATE_BUTTONS);
}

static void VoltorbFlipInputCB_OnTouch(void *data, int new, int prev) {
    VoltorbFlipInputHandler *inputHandler = data;

    ov122_021E91AC(inputHandler, new, prev, MENU_INPUT_STATE_TOUCH);
}
