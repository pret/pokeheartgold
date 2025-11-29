#ifndef POKEHEARTGOLD_UNK_02019BA4_H
#define POKEHEARTGOLD_UNK_02019BA4_H

#include "touchscreen.h"
#include "unk_02020A0C.h"

#define GRID_MENU_NOTHING_CHOSEN -1
#define GRID_MENU_CANCEL         -2
#define GRID_MENU_CURSOR_MOVE    -3
#define GRID_MENU_BUTTON_MODE    -4

typedef void (*DpadGridCallback)(void *data, int newTarget, int prevTarget);

typedef struct GridCallbacks {
    DpadGridCallback onButton;
    DpadGridCallback onSwitchToTouchMode;
    DpadGridCallback onKeyMove;
    DpadGridCallback onTouch;
} GridCallbacks;

typedef struct GridInputHandler {
    const TouchscreenHitbox *touchscreenHitboxes; // 0x00
    const DpadMenuBox *dpadPositions;             // 0x04
    BOOL isButtons;                               // 0x08
    u8 modeSwitchLagFrame;                        // 0x0C
    u8 nextInput;                                 // 0x0D
    u8 lastInput;                                 // 0x0E
    u8 unk_0F;                                    // 0x0F
    u32 enabledFlag[2];                           // 0x10
    const GridCallbacks *callbacks;               // 0x18
    void *data;                                   // 0x1C, passed as data to unk_18
} GridInputHandler;

GridInputHandler *GridInputHandler_Create(const TouchscreenHitbox *hitBoxes, const DpadMenuBox *dpadBoxes, const GridCallbacks *callbacks, void *callbackParam, BOOL inputState, u8 initialPos, enum HeapID heapId);
void GridInputHandler_Free(GridInputHandler *inputHandler);
int GridInputHandler_HandleInput_NoHold(GridInputHandler *inputHandler);
int GridInputHandler_HandleInput_AllowHold(GridInputHandler *inputHandler);
int GridInputHandler_GetNextInput(GridInputHandler *inputHandler);
int GridInputHandler_GetUnk0F(GridInputHandler *inputHandler);
void GridInputHandler_SetNextInput(GridInputHandler *inputHandler, int nextInput);
void GridInputHandler_SetNextLastUnk0FInputs(GridInputHandler *inputHandler, int nextInput, int lastInput, int unk0F);
BOOL GridInputHandler_IsButtonInputMode(GridInputHandler *inputHandler);
void GridInputHandler_SetButtonInputMode(GridInputHandler *inputHandler, BOOL isButtons);
void GridInputHandler_SetAllEnabled(GridInputHandler *inputHandler);
void GridInputHandler_ClearEnabledFlag(GridInputHandler *inputHandler, u32 target);
void GridInputHandler_SetEnabledFlag(GridInputHandler *inputHandler, u32 target);
const DpadMenuBox *GridInputHandler_GetDpadBox(GridInputHandler *inputHandler, int target);

#endif // POKEHEARTGOLD_UNK_02019BA4_H
