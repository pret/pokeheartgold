#include "nitro/mi/memory.h"

#include "global.h"

#include "pokeathlon/pokeathlon.h"

#include "heap.h"
#include "render_text.h"
#include "unk_02035900.h"

// External overlay 97 function declarations (in assembly for now)
extern int ov97_0221E5C0(OverlayManager *man, int *state); // Init
extern int ov97_0221E5D4(OverlayManager *man, int *state); // Main/Exec
extern int ov97_0221E69C(OverlayManager *man, int *state); // Exit

// Data tables in assembly
extern const OverlayManagerTemplate ov96_0221A7E4; // Sub-overlay template
extern const void *ov96_0221A984;                  // Other data table

BOOL PokeathlonCourse_Init(OverlayManager *man, int *state) {
    PokeathlonCourseWork *work;
    PokeathlonCourseArgs *args;
    OverlayManager *subOverlay;
    int specialMode;
    OverlayManagerTemplate subTemplate;
    void *system;
    int param1, param2;

    // Create heap
    Heap_Create(HEAP_ID_3, HEAP_ID_92, 0x72000);

    // Allocate and zero work structure
    work = OverlayManager_CreateAndGetData(man, sizeof(PokeathlonCourseWork), HEAP_ID_92);
    MI_CpuFill8(work, 0, sizeof(PokeathlonCourseWork));

    // Store heap ID
    *PokeathlonWork_GetHeapIdPtr(work) = HEAP_ID_92;

    // Get arguments
    args = OverlayManager_GetArgs(man);
    *PokeathlonWork_GetArgsPtr(work) = args;

    // Copy sub-overlay template
    subTemplate = ov96_0221A7E4;

    // Create sub-overlay manager
    subOverlay = OverlayManager_New(&subTemplate, PokeathlonWork_GetArgsPtr(work), HEAP_ID_92);
    *PokeathlonWork_GetSubOverlayPtr(work) = subOverlay;

    // Initialize state
    specialMode = 0;
    *PokeathlonWork_GetField288Ptr(work) = specialMode;
    args = *PokeathlonWork_GetArgsPtr(work);
    param1 = args->field_4;

    // Check mode
    if (param1 == 1) {
        specialMode = 1;
        *PokeathlonWork_GetField1EEPtr(work) = sub_02037454();
        *PokeathlonWork_GetField72APtr(work) = 4;
    } else {
        *PokeathlonWork_GetField1EEPtr(work) = 1;
        *PokeathlonWork_GetField72APtr(work) = 3;
    }

    // Initialize subsystems
    param1 = ov96_021E8A24();
    param2 = ov96_021E8A2C();

    system = ov96_021E8770(param1, param2, work, specialMode, *PokeathlonWork_GetHeapIdPtr(work));
    *((void **)((u8 *)work + 0x288)) = system; // field_288

    // More initialization
    ov96_021E5C80(&ov96_0221A984, PokeathlonWork_GetField3C4Ptr(work));

    // Additional setup
    *PokeathlonWork_GetField3CAPtr(work) = 0;
    *((void **)((u8 *)work + 0x3B4)) = PokeathlonWork_GetField3C4Ptr(work);
    *((u32 *)((u8 *)work + 0x3C0)) = 0;

    ov96_021E5C90(work);

    system = ov96_021E92E0(HEAP_ID_92);
    *PokeathlonWork_GetField614Ptr(work) = (u32)system;

    // Text flags setup based on mode
    if ((*PokeathlonWork_GetArgsPtr(work))->field_4 != 1) {
        TextFlags_SetCanABSpeedUpPrint(TRUE);
        TextFlags_SetAutoScrollParam(0);
        TextFlags_SetCanTouchSpeedUpPrint(TRUE);
    } else {
        TextFlags_SetCanABSpeedUpPrint(FALSE);
        TextFlags_SetAutoScrollParam(1);
        TextFlags_SetCanTouchSpeedUpPrint(FALSE);
    }

    // Final initialization
    ov96_021E5DFC(work, 0);
    ov96_021E5DE0(work, 0);

    return TRUE;
}
