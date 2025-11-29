#ifndef POKEHEARTGOLD_POKEATHLON_H
#define POKEHEARTGOLD_POKEATHLON_H

#include "constants/heap.h"

#include "overlay_manager.h"

// Pokeathlon course arguments structure
typedef struct PokeathlonCourseArgs {
    void *saveData; // 0x000 - Save data pointer (SaveData *)
    union {
        u32 mode;        // 0x004 - Mode flag (1 = special mode) - accessed as u32
        u8 modeBytes[4]; // 0x004-0x007 - Individual byte access: [0]=0x4, [1]=0x5, [2]=0x6, [3]=0x7
    };
    u8 field_8;        // 0x008
    u8 field_9;        // 0x009
    u8 filler_A[4];    // 0x00A
    u8 shouldFreeHeap; // 0x00E - Flag: if 0, free heap allocations in Exit
    // ... more fields to be discovered
} PokeathlonCourseArgs;

// Main state machine states
typedef enum PokeathlonCourseMainState {
    POKEATHLON_STATE_IDLE = 0,         // Idle state - waiting for transitions
    POKEATHLON_STATE_START_TRANSITION, // Start transition
    POKEATHLON_STATE_WAIT_TRANSITION,  // Wait for transition to complete
    POKEATHLON_STATE_START_EXIT,       // Start exit transition (for type 0x10)
    POKEATHLON_STATE_EXIT_SEQUENCE     // Exit sequence
} PokeathlonCourseMainState;

// State machine structure (overlays stateArgsPtr at 0x3B4)
// This struct maps to a u32 array view for code generation compatibility
typedef struct PokeathlonCourseState {
    void **argsPtr;     // [0] 0x3B4 - Pointer to state data pointer
    u32 transitionType; // [1] 0x3B8 - Transition type (0x10 = exit)
    u32 mainState;      // [2] 0x3BC - Main state machine state
    u32 exitFlag;       // [3] 0x3C0 - Exit flag
} PokeathlonCourseState;

// Pokeathlon course data structure (0xD70 = 3440 bytes)
typedef struct PokeathlonCourseData {
    u8 filler_0[0x15C];                // 0x000
    u8 field_15C;                      // 0x15C
    u8 filler_15D[0x83];               // 0x15D
    u32 state;                         // 0x1E0
    u8 filler_1E4[0xA];                // 0x1E4
    u8 field_1EE;                      // 0x1EE
    u8 filler_1EF[9];                  // 0x1EF
    PokeathlonCourseArgs *args;        // 0x1F8
    u8 filler_1FC[0x84];               // 0x1FC
    OverlayManager *subOverlay;        // 0x280
    enum HeapID heapId;                // 0x284
    void *system;                      // 0x288
    u8 dataCopySource[0x28];           // 0x28C - Source buffer for exit data copy
    u8 dataCopyBuffer1[0x28];          // 0x2B4 - Destination buffer 1
    u8 dataCopyBuffer2[0x28];          // 0x2DC - Destination buffer 2
    u8 filler_304[0xB0];               // 0x304
    PokeathlonCourseState courseState; // 0x3B4 - State machine structure (16 bytes: 4 fields x 4 bytes)
    void *stateData;                   // 0x3C4 - Pointer to state data structure
    u8 filler_3C8[2];                  // 0x3C8
    u8 field_3CA;                      // 0x3CA
    u8 filler_3CB[0x211];              // 0x3CB
    void *heapAllocPtr1;               // 0x5DC - Heap allocated pointer (freed in Exit)
    u8 filler_5E0[0x34];               // 0x5E0
    void *field_614;                   // 0x614
    u8 filler_618[0x112];              // 0x618
    u8 field_72A;                      // 0x72A
    u8 filler_72B[0x5F9];              // 0x72B
    s32 frameCounter;                  // 0xD24 - Increments every 0x708 frames (max 0xEA5F)
    u16 frameTimer;                    // 0xD28 - Frame counter, resets at 0x708
    u16 filler_D2A;                    // 0xD2A - Alignment padding
    u32 counterEnabled;                // 0xD2C - Flag to enable frame counters
    u8 filler_D30[0x34];               // 0xD30
    void *heapAllocPtr2;               // 0xD64 - Heap allocated pointer (freed in Exit if mode == 0)
    void *heapAllocPtr3;               // 0xD68 - Heap allocated pointer (freed in Exit if mode == 0)
    u8 filler_D6C[4];                  // 0xD6C
} PokeathlonCourseData;

// Function declarations
BOOL PokeathlonCourse_Init(OverlayManager *manager, int *state);
BOOL PokeathlonCourse_Main(OverlayManager *manager, int *state);
BOOL PokeathlonCourse_Exit(OverlayManager *manager, int *state);

// Internal overlay 96 functions (stubs for now, in assembly)
void ov96_021E5C80(const void *src, void *dest);
void ov96_021E5C90(PokeathlonCourseData *data);
void *ov96_021E8770(int a0, int a1, PokeathlonCourseData *data, int a3, enum HeapID heapId);
int ov96_021E8A24(void);
int ov96_021E8A2C(void);
void *ov96_021E92E0(enum HeapID heapId);
void ov96_021E5DFC(PokeathlonCourseData *data, int param);
void ov96_021E5DE0(PokeathlonCourseData *data, int param);

#endif // POKEHEARTGOLD_POKEATHLON_H
