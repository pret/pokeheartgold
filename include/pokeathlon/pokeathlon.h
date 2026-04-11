#ifndef POKEHEARTGOLD_POKEATHLON_H
#define POKEHEARTGOLD_POKEATHLON_H

#include "constants/heap.h"

#include "overlay_manager.h"
#include "player_data.h"
#include "save.h"
#include "save_pokeathlon.h"

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
    u8 field_00[0x04];
    u8 field_04;
    u8 field_05[0x77];
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
    PokeathlonStateInfo *argsPtr;     // [0] 0x3B4 - Pointer to state data pointer
    u32 transitionType; // [1] 0x3B8 - Transition type (0x10 = exit)
    u32 mainState;      // [2] 0x3BC - Main state machine state
    u32 exitFlag;       // [3] 0x3C0 - Exit flag
} PokeathlonCourseState;

// Unknown sub-structure at offset 0x974 (0x74 bytes)
typedef struct PokeathlonUnkSubStruct_974 {
    u8 data[0x74]; // Opaque data for now
} PokeathlonUnkSubStruct_974;

// Pokeathlon course data structure (0xD70 = 3440 bytes)
struct PokeathlonCourseData {
    u32 field_0[4];                            // 0x000
    u8 filler_10[0x14C];                       // 0x010
    u8 field_15C;                              // 0x15C
    u8 filler_15D[0x83];                       // 0x15D
    u32 state;                                 // 0x1E0
    void *heapAllocPtr4;                       // 0x1E4 - Heap allocated pointer
    u8 filler_1E8[0x5];                        // 0x1E8
    u8 field_1ED;                              // 0x1ED
    u8 participantCount;                       // 0x1EE - Number of active participants (1-4)
    u8 field_1EF;                              // 0x1EF
    u32 currentParticipantIndex;               // 0x1F0
    u32 field_1F4;                             // 0x1F4
    PokeathlonCourseArgs *args;                // 0x1F8
    u8 filler_1FC[0x74];                       // 0x1FC
    void *field_270;                           // 0x270
    u8 filler_274[0x8];                        // 0x274
    u32 field_27C;                             // 0x27C
    OverlayManager *subOverlay;                // 0x280
    enum HeapID heapId;                        // 0x284
    void *system;                              // 0x288
    u8 dataCopySource[0x28];                   // 0x28C - Source buffer for exit data copy
    u8 dataCopyBuffer1[0x28];                  // 0x2B4 - Destination buffer 1
    u8 dataCopyBuffer2[0x28];                  // 0x2DC - Destination buffer 2
    u8 filler_304[0xA0];                       // 0x304
    u32 field_3A4[4];                          // 0x3A4
    PokeathlonCourseState courseState;         // 0x3B4 - State machine structure (16 bytes: 4 fields x 4 bytes)
    PokeathlonStateInfo stateInfo;             // 0x3C4 - State information (8 bytes)
    u8 filler_3CC[0xC];                        // 0x3CC
    u32 field_3D8[4];                          // 0x3D8 - Array of 4 u32s (16 bytes)
    u32 field_3E8;                             // 0x3E8
    PokeathlonParticipantData participants[4]; // 0x3EC - 4 participant data elements (0x7C each = 0x1F0 bytes)
    PlayerProfile* playerProfiles;             // 0x5DC - Player profiles pointer (heap allocated, 4 profiles)
    u16 field_5E0[4][2];                       // 0x5E0
    u16 field_5F0[4][2];                       // 0x5F0
    u8 filler_600[0x14];                       // 0x600
    void *graphicsSystem;                      // 0x614 - Graphics/UI subsystem pointer
    u8 filler_618[0x112];                      // 0x618
    u8 maxParticipants;                        // 0x72A - Maximum participant limit (3 or 4)
    u8 filler_72B[1];                          // 0x72B
    PokeathlonFieldData fieldData[6];          // 0x72C - Array of PokeathlonFieldData (6 * 0x60 = 0x1E0 bytes)
    u8 filler_96C[8];                          // 0x96C
    PokeathlonUnkSubStruct_974 field_974[4];   // 0x974 - Array of 4 unknown sub-structures (0x74 bytes each = 0x1D0 bytes)
    u8 filler_B44[0x60];                       // 0xB44
    u8 field_BA4[0x180];                       // 0xBA4
    s32 frameCounter;                          // 0xD24 - Increments every 0x708 frames (max 0xEA5F)
    u16 frameTimer;                            // 0xD28 - Frame counter, resets at 0x708
    u16 filler_D2A;                            // 0xD2A - Alignment padding
    u32 counterEnabled;                        // 0xD2C - Flag to enable frame counters
    u8 filler_D30[0x34];                       // 0xD30
    void *heapAllocPtr2;                       // 0xD64 - Heap allocated pointer (freed in Exit if mode == 0)
    void *heapAllocPtr3;                       // 0xD68 - Heap allocated pointer (freed in Exit if mode == 0)
    u8 filler_D6C[4];                          // 0xD6C
};

BOOL PokeathlonCourse_Init(OverlayManager *manager, int *state);
BOOL PokeathlonCourse_Main(OverlayManager *manager, int *state);
BOOL PokeathlonCourse_Exit(OverlayManager *manager, int *state);

BOOL PokeathlonCourse_RunStateFunc(PokeathlonCourseData *data);
BOOL PokeathlonCourse_RunSubStateLoop(PokeathlonCourseData *data);
void PokeathlonCourse_InitStateInfo(const void *funcTable, PokeathlonStateInfo *stateInfo);
void PokeathlonCourse_InitPlayerProfiles(PokeathlonCourseData *data);
PlayerProfile *PokeathlonCourse_GetPlayerProfile(PlayerProfile *profiles, int index);
u8 PokeathlonCourse_GetParticipantCount(PokeathlonCourseData *data);
PokeathlonParticipantData *PokeathlonCourse_GetParticipantData(PokeathlonCourseData *data, int index);
u8 *PokeathlonCourse_GetParticipantUnk04(PokeathlonCourseData *data, int index);
SaveData *PokeathlonCourse_GetSaveData(PokeathlonCourseData *data);
PokeathlonFieldData *PokeathlonCourse_GetFieldData(PokeathlonCourseData *data);
PokeathlonFieldData *PokeathlonCourse_GetFieldData_AtIndex(PokeathlonCourseData *data, int index);
void *PokeathlonCourse_GetFieldBA4(PokeathlonCourseData *data);
void *PokeathlonCourse_AllocPtr4FromHeap(PokeathlonCourseData *data, u32 size);
void PokeathlonCourse_FreePtr4HeapAlloc(PokeathlonCourseData *data);
void *PokeathlonCourse_GetHeapAllocPtr4(PokeathlonCourseData *data);
enum HeapID PokeathlonCourse_GetHeapID(PokeathlonCourseData *data);
u8 PokeathlonCourse_GetField1ED(PokeathlonCourseData *data);
void PokeathlonCourse_SetField1ED(PokeathlonCourseData *data, int param);
void PokeathlonCourse_IncrementField1ED(PokeathlonCourseData *data);
void PokeathlonCourse_SetField1F4(PokeathlonCourseData *data, int param);
void ov96_021E5E04(PokeathlonCourseData *data, u8 *param);
u32 PokeathlonCourse_GetField3D8_ForCurrentParticipant(PokeathlonCourseData *data);
u32 PokeathlonCourse_GetField3D8_AtIndex(PokeathlonCourseData *data, u8 index);
u32 ov96_021E5E7C(PokeathlonCourseData *data);
u32 PokeathlonCourse_GetCurrentParticipantIndex(PokeathlonCourseData *data);
u32 PokeathlonCourse_GetMode(PokeathlonCourseData *data);
u8 PokeathlonCourse_GetField1EF(PokeathlonCourseData *data);
void PokeathlonCourse_IncrementField1EF(PokeathlonCourseData *data);
void PokeathlonCourse_ResetField1EF(PokeathlonCourseData *data);
void *PokeathlonCourse_GetSystem(PokeathlonCourseData *data);
BOOL ov96_021E5F24(PokeathlonCourseData *data);
PlayerProfile *PokeathlonCourse_GetPlayerProfileFromData(PokeathlonCourseData *data, int index);
PokeathlonUnkSubStruct_974 *PokeathlonCourse_GetField974_AtIndex(PokeathlonCourseData *data, int index);
u8 *PokeathlonCourse_GetDataCopyArea(PokeathlonCourseData *data);
void PokeathlonCourse_ResetDataCopyArea(PokeathlonCourseData *data);
void PokeathlonCourse_SetField3A4(PokeathlonCourseData *data, u32 a0, u32 a1, u32 a2);
void PokeathlonCourse_ResetField3A4(PokeathlonCourseData *data);
u32 PokeathlonCourse_GetField3A4(PokeathlonCourseData *data);
u32 PokeathlonCourse_GetUnkConstant4();
void PokeathlonCourse_SetField5E0_AtIndex(PokeathlonCourseData *data, int index, u16 value);
u16 PokeathlonCourse_GetField5F0_AtIndex(PokeathlonCourseData *data, int index);
void PokeathlonCourse_SetStateField07(PokeathlonCourseData *data, u8 value);
void PokeathlonCourse_SetStateField07_IfDifferent(PokeathlonCourseData *data, u8 value, u8 value2);
void PokeathlonCourse_SetStateTransitionType(PokeathlonCourseData *data, u32 transitionType);
void PokeathlonCourse_SetVBlankIntrCB(PokeathlonCourseData *data);
void *PokeathlonCourse_GetGraphicsSystem(PokeathlonCourseData *data);

// Internal overlay 96 functions (stubs for now, in assembly)
void ov96_021E67AC(PokeathlonCourseData *data);
void ov96_021E75BC(void*);
void ov96_021E7F98(s32 frameCount, u32 maxValue, Pokeathlon_UnkSubStruct_B00 *result);
void *ov96_021E8770(int a0, int a1, PokeathlonCourseData *data, int a3, enum HeapID heapId);
void ov96_021E87B4(int a0, void *a1, void *a2, int a3);
void ov96_021E8810(void *ptr);
BOOL ov96_021E8828(void*);
u8 *ov96_021E8A20(void *ptr);
int ov96_021E8A24(void);
int ov96_021E8A2C(void);
void *ov96_021E92E0(enum HeapID heapId);
void ov96_021E9320(void *ptr);
void *ov96_021E9A14(void);

#endif // POKEHEARTGOLD_POKEATHLON_H
