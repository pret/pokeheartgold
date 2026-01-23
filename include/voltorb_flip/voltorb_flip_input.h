#ifndef POKEHEARTGOLD_VOLTORB_FLIP_INPUT_H
#define POKEHEARTGOLD_VOLTORB_FLIP_INPUT_H

#include "unk_02019BA4.h"

typedef enum VoltorbFlipInput {
    VOLTORB_FLIP_INPUT_GRID_BEGIN = 0,
    VOLTORB_FLIP_INPUT_GRID_END = 24,
    VOLTORB_FLIP_INPUT_MEMO,
    VOLTORB_FLIP_INPUT_QUIT,
    // Pseudo-input codes for wrapping around horizontally.
    // These put the cursor in the last-observed row on either
    // the first or last column.
    VOLTORB_FLIP_COL4_ROWLAST,
    VOLTORB_FLIP_COL0_ROWLAST,

    // relative consts
    VOLTORB_FLIP_INPUT_GRID_NUM = VOLTORB_FLIP_INPUT_GRID_END + 1,
} VoltorbFlipInput;

typedef struct VoltorbFlipInputHandler {
    struct ManagedSprite *boardCursorSprite; // 0x0
    struct ManagedSprite *memoCursorSprite;  // 0x4
    GridInputHandler *gridInputHandler;      // 0x8
    u8 selectedRow;                          // 0xC
    u8 focus;                                // 0xD
    u8 memoButtonID : 4;                     // 0xE:0
    u8 lastMemoButtonID : 4;                 // 0xE:4
    u8 memoOpen : 1;                         // 0xF:0
    u8 memoFocused : 1;                      // 0xF:1
    u8 touchNew : 1;                         // 0xF:2
} VoltorbFlipInputHandler;

VoltorbFlipInputHandler *VoltorbFlipInputHandler_Create(enum HeapID heapID, struct ManagedSprite *boardCursorSprite, struct ManagedSprite *memoCursorSprite);
void VoltorbFlipInputHandler_Free(VoltorbFlipInputHandler *inputHandler);
int VoltorbFlipInputHandler_HandleInput(VoltorbFlipInputHandler *inputHandler);
void VoltorbFlipInputHandler_SetBoardFocused(VoltorbFlipInputHandler *inputHandler, BOOL draw);
void VoltorbFlipInputHandler_SetMemoOpen(VoltorbFlipInputHandler *inputHandler, BOOL open);
void VoltorbFlipInputHandler_SetMemoFocused(VoltorbFlipInputHandler *inputHandler, BOOL focused);
int VoltorbFlipInputHandler_GetCursorPos(VoltorbFlipInputHandler *inputHandler);
int VoltorbFlipInputHandler_GetMemoButtonID(VoltorbFlipInputHandler *inputHandler);
BOOL VoltorbFlipInputHandler_IsCursorInGridRange(VoltorbFlipInputHandler *inputHandler);
void VoltorbFlipInputHandler_SetGridCursor0(VoltorbFlipInputHandler *inputHandler);
void VoltorbFlipInputHandler_SetMemoCursor0(VoltorbFlipInputHandler *inputHandler);
int VoltorbFlipInputHandler_GetTouchNew(VoltorbFlipInputHandler *inputHandler);

#endif // POKEHEARTGOLD_VOLTORB_FLIP_INPUT_H
