#ifndef POKEHEARTGOLD_POKEATHLON_H
#define POKEHEARTGOLD_POKEATHLON_H

#include "constants/heap.h"

#include "overlay_manager.h"
#include "player_data.h"
#include "save.h"

// Forward declaration
typedef struct PokeathlonCourseData PokeathlonCourseData;

// Function pointer types for state management
typedef BOOL (*PokeathlonStateFunc)(PokeathlonCourseData *, void **);
typedef BOOL (*PokeathlonStateHandlerFunc)(PokeathlonCourseData *, int);

// State info structure (8 bytes)
typedef struct PokeathlonStateInfo {
    void *ptr;        // 0x00 - Pointer to state function table
    u8 field_04;      // 0x04 - Field at offset 4 (initialized to 1)
    u8 stateArgsBase; // 0x05 - Base for state function args
    u8 stateIndex;    // 0x06 - State function index
    u8 field_07;      // 0x07 - Field at offset 7
} PokeathlonStateInfo;

// Participant data structure (0x7C = 124 bytes each)
typedef struct PokeathlonParticipantData {
    u8 data[0x7C]; // Opaque data for now
} PokeathlonParticipantData;

// Field data structure (0x60 = 96 bytes each)
typedef struct PokeathlonFieldData {
    u8 data[0x60]; // Opaque data for now
} PokeathlonFieldData;

// Pokeathlon course arguments structure
typedef struct PokeathlonCourseArgs {
    SaveData *saveData; // 0x000 - Save data pointer
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
struct PokeathlonCourseData {
    u8 filler_0[0x15C];                // 0x000
    u8 field_15C;                      // 0x15C
    u8 filler_15D[0x83];               // 0x15D
    u32 state;                         // 0x1E0
    void *heapAllocPtr4;               // 0x1E4 - Heap allocated pointer
    u8 filler_1E8[0x5];                // 0x1E8
    u8 field_1ED;                      // 0x1ED
    u8 participantCount;               // 0x1EE - Number of active participants (1-4)
    u8 filler_1EF[1];                  // 0x1EF
    u32 field_1F0;                     // 0x1F0
    u32 field_1F4;                     // 0x1F4
    PokeathlonCourseArgs *args;        // 0x1F8
    u8 filler_1FC[0x74];               // 0x1FC
    void *field_270;                   // 0x270
    u8 filler_274[0x8];                // 0x274
    void *field_27C;                   // 0x27C
    OverlayManager *subOverlay;        // 0x280
    enum HeapID heapId;                // 0x284
    void *system;                      // 0x288
    u8 dataCopySource[0x28];           // 0x28C - Source buffer for exit data copy
    u8 dataCopyBuffer1[0x28];          // 0x2B4 - Destination buffer 1
    u8 dataCopyBuffer2[0x28];          // 0x2DC - Destination buffer 2
    u8 filler_304[0xB0];               // 0x304
    PokeathlonCourseState courseState; // 0x3B4 - State machine structure (16 bytes: 4 fields x 4 bytes)
    PokeathlonStateInfo stateData;     // 0x3C4 - State information (8 bytes)
    u8 filler_3CC[0xC];                // 0x3CC
    u32 field_3D8[4];                  // 0x3D8 - Array of 4 u32s (16 bytes)
    void *field_3E8;                   // 0x3E8
    u32 participantData1Base;          // 0x3EC - Participant data set 1 base (accessed with 0x7C stride)
    u8 participantData2[0x1EC];        // 0x3F0 - Participant data set 2 (4 elements of 0x7C bytes each)
    void *heapAllocPtr1;               // 0x5DC - Heap allocated pointer (freed in Exit)
    u8 filler_5E0[0x34];               // 0x5E0
    void *graphicsSystem;              // 0x614 - Graphics/UI subsystem pointer
    u8 filler_618[0x112];              // 0x618
    u8 maxParticipants;                // 0x72A - Maximum participant limit (3 or 4)
    u8 filler_72B[1];                  // 0x72B
    u8 field_72C[0x478];               // 0x72C - Array accessed with 0x60 byte stride
    u8 filler_BA4[0x180];              // 0xBA4
    s32 frameCounter;                  // 0xD24 - Increments every 0x708 frames (max 0xEA5F)
    u16 frameTimer;                    // 0xD28 - Frame counter, resets at 0x708
    u16 filler_D2A;                    // 0xD2A - Alignment padding
    u32 counterEnabled;                // 0xD2C - Flag to enable frame counters
    u8 filler_D30[0x34];               // 0xD30
    void *heapAllocPtr2;               // 0xD64 - Heap allocated pointer (freed in Exit if mode == 0)
    void *heapAllocPtr3;               // 0xD68 - Heap allocated pointer (freed in Exit if mode == 0)
    u8 filler_D6C[4];                  // 0xD6C
};

// Function declarations
BOOL PokeathlonCourse_Init(OverlayManager *manager, int *state);
BOOL PokeathlonCourse_Main(OverlayManager *manager, int *state);
BOOL PokeathlonCourse_Exit(OverlayManager *manager, int *state);

BOOL PokeathlonCourse_RunStateFunc(PokeathlonCourseData *data);
BOOL PokeathlonCourse_RunSubStateLoop(PokeathlonCourseData *data);
void PokeathlonCourse_InitStateInfo(const void *src, PokeathlonStateInfo *dest);
void PokeathlonCourse_InitPlayerProfiles(PokeathlonCourseData *data);
PlayerProfile *PokeathlonCourse_GetPlayerProfile(PlayerProfile *profiles, int index);
u8 PokeathlonCourse_GetParticipantCount(PokeathlonCourseData *data);
PokeathlonParticipantData *PokeathlonCourse_GetParticipantData1(PokeathlonCourseData *data, int index);
PokeathlonParticipantData *PokeathlonCourse_GetParticipantData2(PokeathlonCourseData *data, int index);
SaveData *PokeathlonCourse_GetSaveData(PokeathlonCourseData *data);
PokeathlonFieldData *ov96_021E5D6C(PokeathlonCourseData *data);
PokeathlonFieldData *ov96_021E5D78(PokeathlonCourseData *data, int index);
void *ov96_021E5D88(PokeathlonCourseData *data);
void *PokeathlonCourse_AllocFromHeap(PokeathlonCourseData *data, u32 size);
void PokeathlonCourse_FreeHeapAlloc(PokeathlonCourseData *data);
void *PokeathlonCourse_GetHeapAllocPtr(PokeathlonCourseData *data);
enum HeapID PokeathlonCourse_GetHeapID(PokeathlonCourseData *data);
u8 ov96_021E5DD4(PokeathlonCourseData *data);
void ov96_021E5DE0(PokeathlonCourseData *data, int param);
void ov96_021E5DEC(PokeathlonCourseData *data);
void ov96_021E5DFC(PokeathlonCourseData *data, int param);

// Internal overlay 96 functions (stubs for now, in assembly)
void *ov96_021E8770(int a0, int a1, PokeathlonCourseData *data, int a3, enum HeapID heapId);
int ov96_021E8A24(void);
int ov96_021E8A2C(void);
void *ov96_021E92E0(enum HeapID heapId);

#endif // POKEHEARTGOLD_POKEATHLON_H
