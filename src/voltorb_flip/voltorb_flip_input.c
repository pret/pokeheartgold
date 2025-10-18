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

static void ov122_021E8E78(Ov122_021E8CFC *);
static void ov122_021E8F58(Ov122_021E8CFC *);
static int ov122_021E8F6C(Ov122_021E8CFC *);
static int ov122_021E9020(Ov122_021E8CFC *);
static void ov122_021E9108(Ov122_021E8CFC *, int);
static void ov122_021E9134(Ov122_021E8CFC *);
static void ov122_021E9154(Ov122_021E8CFC *, int);
static void ov122_021E91AC(Ov122_021E8CFC *a0, u32 newFocus, int oldFocus, MenuInputState inputMode);
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

const TouchscreenHitbox sMemoTouchscreenHitboxes[] = {
    { .rect = { 0x50, 0x68, 0xC8, 0xE0 } },
    { .rect = { 0x50, 0x68, 0xE0, 0xF8 } },
    { .rect = { 0x68, 0x80, 0xC8, 0xE0 } },
    { .rect = { 0x68, 0x80, 0xE0, 0xF8 } },
    { .rect = { 0x80, 0x98, 0xE0, 0xF8 } },
    { .rect = { 0x08, 0x48, 0xC0, 0x00 } },
    { .rect = { 0xA0, 0xC0, 0xC0, 0x00 } },
    { .rect = TOUCHSCREEN_RECTLIST_END },
};

const TouchscreenHitbox sTouchscreenHitboxes[] = {
    { .rect = { 0x08, 0x20, 0x08, 0x20 } },
    { .rect = { 0x08, 0x20, 0x28, 0x40 } },
    { .rect = { 0x08, 0x20, 0x48, 0x60 } },
    { .rect = { 0x08, 0x20, 0x68, 0x80 } },
    { .rect = { 0x08, 0x20, 0x88, 0xA0 } },
    { .rect = { 0x28, 0x40, 0x08, 0x20 } },
    { .rect = { 0x28, 0x40, 0x28, 0x40 } },
    { .rect = { 0x28, 0x40, 0x48, 0x60 } },
    { .rect = { 0x28, 0x40, 0x68, 0x80 } },
    { .rect = { 0x28, 0x40, 0x88, 0xA0 } },
    { .rect = { 0x48, 0x60, 0x08, 0x20 } },
    { .rect = { 0x48, 0x60, 0x28, 0x40 } },
    { .rect = { 0x48, 0x60, 0x48, 0x60 } },
    { .rect = { 0x48, 0x60, 0x68, 0x80 } },
    { .rect = { 0x48, 0x60, 0x88, 0xA0 } },
    { .rect = { 0x68, 0x80, 0x08, 0x20 } },
    { .rect = { 0x68, 0x80, 0x28, 0x40 } },
    { .rect = { 0x68, 0x80, 0x48, 0x60 } },
    { .rect = { 0x68, 0x80, 0x68, 0x80 } },
    { .rect = { 0x68, 0x80, 0x88, 0xA0 } },
    { .rect = { 0x88, 0xA0, 0x08, 0x20 } },
    { .rect = { 0x88, 0xA0, 0x28, 0x40 } },
    { .rect = { 0x88, 0xA0, 0x48, 0x60 } },
    { .rect = { 0x88, 0xA0, 0x68, 0x80 } },
    { .rect = { 0x88, 0xA0, 0x88, 0xA0 } },
    { .rect = { 0x08, 0x48, 0xC0, 0x00 } },
    { .rect = { 0xA0, 0xC0, 0xC0, 0x00 } },
    { .rect = TOUCHSCREEN_RECTLIST_END },
};

const UnkStruct_02020654 sDpadButtonSpecs[] = {
    { 8,   8,   24, 24, 20, 5,  25, 1  },
    { 40,  8,   24, 24, 21, 6,  0,  2  },
    { 72,  8,   24, 24, 22, 7,  1,  3  },
    { 104, 8,   24, 24, 23, 8,  2,  4  },
    { 136, 8,   24, 24, 24, 9,  3,  25 },
    { 8,   40,  24, 24, 0,  10, 25, 6  },
    { 40,  40,  24, 24, 1,  11, 5,  7  },
    { 72,  40,  24, 24, 2,  12, 6,  8  },
    { 104, 40,  24, 24, 3,  13, 7,  9  },
    { 136, 40,  24, 24, 4,  14, 8,  25 },
    { 8,   72,  24, 24, 5,  15, 25, 11 },
    { 40,  72,  24, 24, 6,  16, 10, 12 },
    { 72,  72,  24, 24, 7,  17, 11, 13 },
    { 104, 72,  24, 24, 8,  18, 12, 14 },
    { 136, 72,  24, 24, 9,  19, 13, 25 },
    { 8,   104, 24, 24, 10, 20, 26, 16 },
    { 40,  104, 24, 24, 11, 21, 15, 17 },
    { 72,  104, 24, 24, 12, 22, 16, 18 },
    { 104, 104, 24, 24, 13, 23, 17, 19 },
    { 136, 104, 24, 24, 14, 24, 18, 26 },
    { 8,   136, 24, 24, 15, 0,  26, 21 },
    { 40,  136, 24, 24, 16, 1,  20, 22 },
    { 72,  136, 24, 24, 17, 2,  21, 23 },
    { 104, 136, 24, 24, 18, 3,  22, 24 },
    { 136, 136, 24, 24, 19, 4,  23, 26 },
    { 224, 40,  0,  0,  25, 26, 27, 28 },
    { 224, 176, 0,  0,  25, 26, 27, 28 },
};

u8 ov122_021E9BA0[5][2] = {
    { 0xC8, 0x50 },
    { 0xE0, 0x50 },
    { 0xC8, 0x68 },
    { 0xE0, 0x68 },
    { 0xE0, 0x80 },
};

Ov122_021E8CFC *ov122_021E8CFC(enum HeapID heapID, struct ManagedSprite *a1, struct ManagedSprite *a2) {
    GF_ASSERT(a1 != NULL);

    Ov122_021E8CFC *ptr = Heap_Alloc(heapID, sizeof(Ov122_021E8CFC));
    MI_CpuFill8(ptr, 0, sizeof(Ov122_021E8CFC));

    ptr->unk0 = a1;
    ptr->unk4 = a2;
    ptr->unk8 = sub_02019BA4(sTouchscreenHitboxes, sDpadButtonSpecs, &sInputCallbacks, ptr, 1, ptr->focus, heapID);

    ov122_021E9108(ptr, 0);
    return ptr;
}

void ov122_021E8D58(Ov122_021E8CFC *a0) {
    GF_ASSERT(a0->unk8 != 0);
    sub_02019BDC(a0->unk8);
    Heap_Free(a0);
}

int ov122_021E8D74(Ov122_021E8CFC *a0) {
    if (a0->memoFocused) {
        return ov122_021E8F6C(a0);
    }
    return ov122_021E9020(a0);
}

void ov122_021E8D8C(Ov122_021E8CFC *a0, int a1) {
    if (a1 != 0) {
        ManagedSprite_SetDrawFlag(a0->unk0, 1);
        return;
    }
    ManagedSprite_SetDrawFlag(a0->unk0, 0);
    a0->focus = 0;
}

void SetMemoOpen(Ov122_021E8CFC *a0, BOOL val) {
    a0->memoOpen = val;
    ov122_021E9154(a0, a0->focus);
}

void SetMemoFocused(Ov122_021E8CFC *a0, BOOL val) {
    a0->memoFocused = val;
    ov122_021E9154(a0, a0->focus);
    ManagedSprite_SetDrawFlag(a0->unk4, val);
}

int ov122_021E8DF0(Ov122_021E8CFC *a0) {
    GF_ASSERT(a0 != 0);
    GF_ASSERT(a0->unk8 != 0);
    // This seems to return which touch screen hitbox was pressed/clicked
    return sub_02019F74(a0->unk8);
}

int ov122_021E8E0C(Ov122_021E8CFC *a0) {
    GF_ASSERT(a0 != 0);
    GF_ASSERT(a0->unk8 != 0);
    return a0->unkEx;
}

BOOL ov122_021E8E28(Ov122_021E8CFC *a0) {
    int var1 = sub_02019F74(a0->unk8);
    return var1 != 25 && var1 != 26;
}

void ov122_021E8E40(Ov122_021E8CFC *a0) {
    sub_02019F7C(a0->unk8, 0);
    ov122_021E9108(a0, 0);
}

void ov122_021E8E58(Ov122_021E8CFC *a0) {
    a0->unkEx = 0;
    a0->unkEy = 0;
    ov122_021E9134(a0);
}

BOOL ov122_021E8E70(Ov122_021E8CFC *a0) {
    return a0->unkFz;
}

// Probably for handling focus movement
static void ov122_021E8E78(Ov122_021E8CFC *a0) {
    int var2;
    u8 var1 = a0->unkEx;

    if (gSystem.newAndRepeatedKeys & PAD_KEY_DOWN) {
        var2 = var1 + 2;
        if (var2 > 4) {
            var2 = 4;
        }
        a0->unkEx = var2;
    } else if (gSystem.newAndRepeatedKeys & PAD_KEY_LEFT) {
        var2 = var1 - 1;
        if (var2 < 0) {
            var2 = 0;
        }
        a0->unkEx = var2;
    } else if (gSystem.newAndRepeatedKeys & PAD_KEY_UP) {
        if (var1 == 4 && (a0->unkEy == 2 || a0->unkEy == 3)) {
            a0->unkEx = (a0->unkEy);
        } else {
            var2 = var1 - 2;
            if (var2 < 0) {
                var2 = 0;
            }
            a0->unkEx = var2;
        }
    } else if (gSystem.newAndRepeatedKeys & PAD_KEY_RIGHT) {
        var2 = var1 + 1;
        if (var2 > 4) {
            var2 = 4;
        }
        a0->unkEx = var2;
    }

    if (var1 != a0->unkEx) {
        a0->unkEy = var1;
        ov122_021E9134(a0);
        PlaySE(SEQ_SE_DP_SELECT);
    }
}

static void ov122_021E8F58(Ov122_021E8CFC *a0) {
    a0->unkEx = 4;
    ov122_021E9134(a0);
}

static int ov122_021E8F6C(Ov122_021E8CFC *a0) {
    a0->unkFz = FALSE;

    if (gSystem.newKeys & PAD_BUTTON_X) {
        return 4;
    }
    if (gSystem.newKeys & PAD_BUTTON_B) {
        ov122_021E8F58(a0);
        return 3;
    }
    if (gSystem.newKeys & PAD_BUTTON_A) {
        if (a0->unkEx == 4) {
            ov122_021E8F58(a0);
            return 3;
        }
        return 1;
    }

    ov122_021E8E78(a0);
    a0->unkFz = TRUE;

    u8 var1 = TouchscreenHitbox_FindRectAtTouchNew(sMemoTouchscreenHitboxes);
    if (var1 < 8) {
        switch (var1) {
        case 4:
            a0->unkEx = var1;
            ov122_021E9134(a0);
            return 3;
        case 5:
            return 4;
        case 6:
            return 2;
        default:
            a0->unkEx = var1;
            ov122_021E9134(a0);
            return 1;
        }
    }
    return 0;
}

static int ov122_021E9020(Ov122_021E8CFC *a0) {
    int var1 = sub_02019F74(a0->unk8);
    u32 elementId = sub_02019D18(a0->unk8);
    sub_02019F74(a0->unk8);

    if (elementId < 28) {
        a0->unkFz = System_GetTouchNew();
        // Open/close Memo button
        if (elementId == 25) {
            if (a0->unkFz) {
                a0->focus = var1;
                sub_02019F7C(a0->unk8, a0->focus);
            } else {
                ov122_021E8E40(a0);
            }
            return 4;
        }
        // Quit button
        if (elementId == 26) {
            return 2;
        }
        return 1;
    }

    a0->unkFz = 0;
    if (gSystem.newKeys & PAD_BUTTON_X) {
        if (a0->focus == 25 || a0->focus == 26) {
            ov122_021E8E40(a0);
        }
        return 4;
    }
    if (gSystem.newKeys & PAD_BUTTON_B) {
        return 3;
    }

    if (a0->memoOpen && a0->focus != 25 && a0->focus != 26) {
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

static void ov122_021E9108(Ov122_021E8CFC *a0, int newFocus) {
    u8 x;
    u8 y;

    ov122_021E9154(a0, newFocus);
    sub_02020A0C(sub_0201A018(a0->unk8, newFocus), &x, &y);
    ManagedSprite_SetPositionXY(a0->unk0, x, y);
    a0->focus = newFocus;
}

static void ov122_021E9134(Ov122_021E8CFC *a0) {
    ManagedSprite_SetPositionXY(a0->unk4, ov122_021E9BA0[a0->unkEx][0], ov122_021E9BA0[a0->unkEx][1]);
}

static void ov122_021E9154(Ov122_021E8CFC *a0, int newFocus) {
    int indicatorType;

    if (newFocus < 25) { // In grid
        if (a0->memoFocused) {
            indicatorType = 24; // Disabled pencil
        } else if (a0->memoOpen) {
            indicatorType = 23; // Pencil
        } else {
            indicatorType = 18; // Card focus
        }
    } else if (newFocus == 25) { // Memo
        indicatorType = 7;       // Open/close Memo button
    } else if (newFocus == 26) { // Quit
        indicatorType = 4;       // Quit button
    } else {
        GF_ASSERT(FALSE);
    }

    if (a0->memoOpen) {
        ManagedSprite_SetPaletteOverride(a0->unk0, 4);
    } else {
        ManagedSprite_SetPaletteOverride(a0->unk0, 2);
    }
    ManagedSprite_SetAnimNoRestart(a0->unk0, indicatorType);
}

static void ov122_021E91AC(Ov122_021E8CFC *a0, u32 newFocus, int oldFocus, MenuInputState inputMode) {
    if ((inputMode == MENU_INPUT_STATE_BUTTONS || newFocus != 25) && newFocus != oldFocus && newFocus < 28) {
        // Updates visual focus indicator
        ov122_021E9108(a0, newFocus);
        // Plays when you switch focus
        PlaySE(SEQ_SE_DP_SELECT);
    }
}

// UnkStruct_02019BA4_unk18_func callbacks

static void VoltorbFlipInputCB_OnButtonPress(void *data, int new, int prev) {
    Ov122_021E8CFC *a0 = data;

    sub_02019F7C(a0->unk8, (u8)new);
    ov122_021E9108(a0, new);
    PlaySE(SEQ_SE_DP_SELECT);
}

static void VoltorbFlipInputCB_OnTouchSwitch(void *data, int new, int prev) {
    // no-op
}

static void VoltorbFlipInputCB_OnKeyMove(void *data, int new, int prev) {
    Ov122_021E8CFC *a0 = data;

    if (new == 27) { // wrap around right
        new = a0->selectedRow * 5 + 4;
        GF_ASSERT(new < 25);
        sub_02019F7C(a0->unk8, (u8)new);
    } else if (new == 28) { // wrap around left
        new = a0->selectedRow * 5;
        GF_ASSERT(new < 25);
        sub_02019F7C(a0->unk8, (u8)new);
    }

    if (new != 25 && new != 26) {
        a0->selectedRow = new / 5;
    }
    ov122_021E91AC(a0, new, prev, MENU_INPUT_STATE_BUTTONS);
}

static void VoltorbFlipInputCB_OnTouch(void *data, int new, int prev) {
    Ov122_021E8CFC *a0 = data;

    ov122_021E91AC(a0, new, prev, MENU_INPUT_STATE_TOUCH);
}
