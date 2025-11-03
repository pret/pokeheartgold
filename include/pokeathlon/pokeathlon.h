#ifndef POKEHEARTGOLD_POKEATHLON_H
#define POKEHEARTGOLD_POKEATHLON_H

#include "overlay_manager.h"

// Forward declarations
typedef struct PokeathlonCourseWork PokeathlonCourseWork;
typedef struct PokeathlonCourseArgs PokeathlonCourseArgs;

// Pokeathlon course arguments structure
struct PokeathlonCourseArgs {
    u8 filler_0[4]; // 0x000
    u32 field_4;    // 0x004 - Mode flag (1 = special mode)
    // ... more fields to be discovered
};

// Pokeathlon course work structure (0xD70 = 3440 bytes)
struct PokeathlonCourseWork {
    u8 data[0xD70]; // Complete work structure (will be refined during decompilation)
};

// Helper inline functions to access work structure fields
// These will be replaced with proper struct members as we discover the layout
static inline u32 *PokeathlonWork_GetHeapIdPtr(PokeathlonCourseWork *work) {
    return (u32 *)((u8 *)work + 0x284); // 0xa1 << 2
}

static inline PokeathlonCourseArgs **PokeathlonWork_GetArgsPtr(PokeathlonCourseWork *work) {
    return (PokeathlonCourseArgs **)((u8 *)work + 0x1F8); // 0x7e << 2
}

static inline OverlayManager **PokeathlonWork_GetSubOverlayPtr(PokeathlonCourseWork *work) {
    return (OverlayManager **)((u8 *)work + 0x280); // 0xa << 6
}

static inline u8 *PokeathlonWork_GetField15CPtr(PokeathlonCourseWork *work) {
    return (u8 *)work + 0x15C;
}

static inline u8 *PokeathlonWork_GetField1EEPtr(PokeathlonCourseWork *work) {
    return (u8 *)work + 0x1EE;
}

static inline u8 *PokeathlonWork_GetField72APtr(PokeathlonCourseWork *work) {
    return (u8 *)work + 0x72A;
}

static inline u32 *PokeathlonWork_GetField3C0Ptr(PokeathlonCourseWork *work) {
    return (u32 *)((u8 *)work + 0x3C0);
}

static inline u32 *PokeathlonWork_GetField614Ptr(PokeathlonCourseWork *work) {
    return (u32 *)((u8 *)work + 0x614);
}

static inline u32 *PokeathlonWork_GetField288Ptr(PokeathlonCourseWork *work) {
    return (u32 *)((u8 *)work + 0x1E0); // 0xa << 6 - 0xa0 for state field
}

static inline u32 *PokeathlonWork_GetField3B4Ptr(PokeathlonCourseWork *work) {
    return (u32 *)((u8 *)work + 0x3B4); // 0xa << 6 - 0x88
}

static inline void **PokeathlonWork_GetField3C4Ptr(PokeathlonCourseWork *work) {
    return (void **)((u8 *)work + 0x3C4); // 0xf1 << 2 + 0x3c
}

static inline u32 *PokeathlonWork_GetField3C0Ptr2(PokeathlonCourseWork *work) {
    return (u32 *)((u8 *)work + 0x3C0); // 0xf1 << 2 + 0x38 - 0xa
}

static inline u8 *PokeathlonWork_GetField3CAPtr(PokeathlonCourseWork *work) {
    return (u8 *)work + 0x3CA;
}

// Function declarations
BOOL PokeathlonCourse_Init(OverlayManager *man, int *state);
BOOL PokeathlonCourse_Main(OverlayManager *man, int *state);
BOOL PokeathlonCourse_Exit(OverlayManager *man, int *state);

// Internal overlay 96 functions (stubs for now, in assembly)
void ov96_021E5C80(const void *src, void *dest);
void ov96_021E5C90(PokeathlonCourseWork *work);
void *ov96_021E8770(int a0, int a1, PokeathlonCourseWork *work, int a3, int heapId);
int ov96_021E8A24(void);
int ov96_021E8A2C(void);
void *ov96_021E92E0(u8 heapId);
void ov96_021E5DFC(PokeathlonCourseWork *work, int param);
void ov96_021E5DE0(PokeathlonCourseWork *work, int param);

#endif // POKEHEARTGOLD_POKEATHLON_H
