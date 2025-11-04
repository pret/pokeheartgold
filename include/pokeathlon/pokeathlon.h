#ifndef POKEHEARTGOLD_POKEATHLON_H
#define POKEHEARTGOLD_POKEATHLON_H

#include "overlay_manager.h"
#include "constants/heap.h"

// Pokeathlon course arguments structure
typedef struct PokeathlonCourseArgs {
    u8 filler_0[4]; // 0x000
    u32 mode;       // 0x004 - Mode flag (1 = special mode)
    // ... more fields to be discovered
} PokeathlonCourseArgs;

// Pokeathlon course data structure (0xD70 = 3440 bytes)
typedef struct PokeathlonCourseData {
    u8 filler_0[0x15C];              // 0x000
    u8 field_15C;                    // 0x15C
    u8 filler_15D[0x83];             // 0x15D
    u32 state;                       // 0x1E0
    u8 filler_1E4[0xA];              // 0x1E4
    u8 field_1EE;                    // 0x1EE
    u8 filler_1EF[9];                // 0x1EF
    PokeathlonCourseArgs *args;      // 0x1F8
    u8 filler_1FC[0x84];             // 0x1FC
    OverlayManager *subOverlay;      // 0x280
    enum HeapID heapId;              // 0x284
    void *system;                    // 0x288
    u8 filler_28C[0x128];            // 0x28C
    void *field_3B4;                 // 0x3B4
    u8 filler_3B8[8];                // 0x3B8
    u32 field_3C0;                   // 0x3C0
    void *field_3C4;                 // 0x3C4
    u8 filler_3C8[2];                // 0x3C8
    u8 field_3CA;                    // 0x3CA
    u8 filler_3CB[0x249];            // 0x3CB
    void *field_614;                 // 0x614
    u8 filler_618[0x112];            // 0x618
    u8 field_72A;                    // 0x72A
    u8 filler_72B[0x645];            // 0x72B
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
