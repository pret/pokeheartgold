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

    data->heapId = HEAP_ID_92;

    args = OverlayManager_GetArgs(manager);
    data->args = args;

    subTemplate = ov96_0221A7E4;

    subOverlay = OverlayManager_New(&subTemplate, &data->args, HEAP_ID_92);
    data->subOverlay = subOverlay;

    specialMode = FALSE;
    data->state = specialMode;
    args = data->args;
    param1 = args->mode;

    if (param1 == 1) {
        specialMode = TRUE;
        data->field_1EE = sub_02037454();
        data->field_72A = 4;
    } else {
        data->field_1EE = 1;
        data->field_72A = 3;
    }

    param1 = ov96_021E8A24();
    param2 = ov96_021E8A2C();

    system = ov96_021E8770(param1, param2, data, specialMode, data->heapId);
    data->system = system;

    ov96_021E5C80(&ov96_0221A984, &data->field_3C4);

    data->field_3CA = 0;
    data->field_3B4 = &data->field_3C4;
    data->field_3C0 = 0;

    ov96_021E5C90(data);

    system = ov96_021E92E0(HEAP_ID_92);
    data->field_614 = system;

    if (data->args->mode != 1) {
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
