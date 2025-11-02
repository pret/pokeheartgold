#ifndef POKEHEARTGOLD_UNK_02019BA4_H
#define POKEHEARTGOLD_UNK_02019BA4_H

#include "touchscreen.h"
#include "unk_02020654.h"

typedef void (*UnkStruct_02019BA4_unk18_func)(void *data, int newTarget, int prevTarget);

typedef struct UnkStruct_02019BA4_callbacks {
    UnkStruct_02019BA4_unk18_func onButton;
    UnkStruct_02019BA4_unk18_func onSwitchToTouchMode;
    UnkStruct_02019BA4_unk18_func onKeyMove;
    UnkStruct_02019BA4_unk18_func onTouch;
} UnkStruct_02019BA4_callbacks;

typedef struct UnkStruct_02019BA4 {
    const TouchscreenHitbox *touchscreenHitboxes;  // 0x00
    const UnkStruct_02020654 *dpadPositions;       // 0x04
    int unk_08;                                    // 0x08
    u8 inputState;                                 // 0x0C
    u8 nextInput;                                  // 0x0D
    u8 lastInput;                                  // 0x0E
    u8 unk_0F;                                     // 0x0F
    int unk_10;                                    // 0x10
    int unk_14;                                    // 0x14
    const UnkStruct_02019BA4_callbacks *callbacks; // 0x18
    void *data;                                    // 0x1C, passed as data to unk_18
} UnkStruct_02019BA4;

UnkStruct_02019BA4 *sub_02019BA4(const TouchscreenHitbox *hitBoxes, const UnkStruct_02020654 *dpadBoxes, const UnkStruct_02019BA4_callbacks *callbacks, void *callbackParam, int a4, u8 initialPos, enum HeapID heapId);
void sub_02019BDC(UnkStruct_02019BA4 *a0);
int sub_02019BE4(UnkStruct_02019BA4 *a0);
int sub_02019D18(UnkStruct_02019BA4 *a0);
int sub_02019F74(UnkStruct_02019BA4 *a0);
void sub_02019F7C(UnkStruct_02019BA4 *a0, int a1);
const UnkStruct_02020654 *sub_0201A018(UnkStruct_02019BA4 *a0, int a1);

#endif // POKEHEARTGOLD_UNK_02019BA4_H
