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

BOOL PokeathlonCourse_Init(OverlayManager *manager, int *state) {
    PokeathlonCourseData *data;
    PokeathlonCourseArgs *args;
    OverlayManager *subOverlay;
    BOOL specialMode;
    OverlayManagerTemplate subTemplate;
    void *system;
    int param1, param2;

    Heap_Create(HEAP_ID_3, HEAP_ID_92, 0x72000);

    data = OverlayManager_CreateAndGetData(manager, sizeof(PokeathlonCourseData), HEAP_ID_92);
    MI_CpuFill8(data, 0, sizeof(PokeathlonCourseData));

    *PokeathlonWork_GetHeapIdPtr(data) = HEAP_ID_92;

    args = OverlayManager_GetArgs(manager);
    *PokeathlonWork_GetArgsPtr(data) = args;

    subTemplate = ov96_0221A7E4;

    subOverlay = OverlayManager_New(&subTemplate, PokeathlonWork_GetArgsPtr(data), HEAP_ID_92);
    *PokeathlonWork_GetSubOverlayPtr(data) = subOverlay;

    specialMode = FALSE;
    *PokeathlonWork_GetField288Ptr(data) = specialMode;
    args = *PokeathlonWork_GetArgsPtr(data);
    param1 = args->field_4;

    if (param1 == 1) {
        specialMode = TRUE;
        *PokeathlonWork_GetField1EEPtr(data) = sub_02037454();
        *PokeathlonWork_GetField72APtr(data) = 4;
    } else {
        *PokeathlonWork_GetField1EEPtr(data) = 1;
        *PokeathlonWork_GetField72APtr(data) = 3;
    }

    param1 = ov96_021E8A24();
    param2 = ov96_021E8A2C();

    system = ov96_021E8770(param1, param2, data, specialMode, *PokeathlonWork_GetHeapIdPtr(data));
    *(void **)((u8 *)data + 0x288) = system;

    ov96_021E5C80(&ov96_0221A984, PokeathlonWork_GetField3C4Ptr(data));

    *PokeathlonWork_GetField3CAPtr(data) = 0;
    *(void **)((u8 *)data + 0x3B4) = PokeathlonWork_GetField3C4Ptr(data);
    *(u32 *)((u8 *)data + 0x3C0) = 0;

    ov96_021E5C90(data);

    system = ov96_021E92E0(HEAP_ID_92);
    *PokeathlonWork_GetField614Ptr(data) = (u32)system;

    if ((*PokeathlonWork_GetArgsPtr(data))->field_4 != 1) {
        TextFlags_SetCanABSpeedUpPrint(TRUE);
        TextFlags_SetAutoScrollParam(0);
        TextFlags_SetCanTouchSpeedUpPrint(TRUE);
    } else {
        TextFlags_SetCanABSpeedUpPrint(FALSE);
        TextFlags_SetAutoScrollParam(1);
        TextFlags_SetCanTouchSpeedUpPrint(FALSE);
    }

    ov96_021E5DFC(data, 0);
    ov96_021E5DE0(data, 0);

    return TRUE;
}
