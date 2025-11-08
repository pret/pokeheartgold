#include "nitro/mi/memory.h"

#include "global.h"

#include "pokeathlon/pokeathlon.h"

#include "assert.h"
#include "heap.h"
#include "render_text.h"
#include "unk_02031904.h"
#include "unk_02035900.h"

// External functions used throughout this file (in assembly for now)
extern int ov97_0221E5C0(OverlayManager *man, int *state); // Init
extern int ov97_0221E5D4(OverlayManager *man, int *state); // Main/Exec
extern int ov97_0221E69C(OverlayManager *man, int *state); // Exit
extern void sub_02037AC0(u8 param);
extern BOOL sub_02037B38(u8 param);
extern BOOL ov96_021E5C2C(PokeathlonCourseData *data);
extern BOOL ov96_021E5F24(PokeathlonCourseData *data);
extern void *ov96_021E9A14(void);
extern void ov96_021E87B4(int a0, void *a1, void *a2, int a3);
extern u8 *ov96_021E8A20(void *ptr);
extern void ov96_021E67AC(PokeathlonCourseData *data);
extern BOOL GF_heap_c_dummy_return_true(enum HeapID heapId);
extern void ov96_021E7F98(s32 frameCount, u32 maxValue, Pokeathlon_UnkSubStruct_B00 *result);
extern void ov96_021E9320(void *ptr);
extern void ov96_021E8810(void *ptr);

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

    ov96_021E5C80(&ov96_0221A984, &data->stateData);

    data->field_3CA = 0;
    data->courseState.argsPtr = &data->stateData;
    data->courseState.exitFlag = 0;

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

BOOL PokeathlonCourse_Main(OverlayManager *manager, int *state) {
    PokeathlonCourseData *data = OverlayManager_GetData(manager);
    PokeathlonCourseState *courseState = &data->courseState;

    // Frame counter system: increments frameTimer each frame, and frameCounter every 1800 frames (up to max 59999)
    if (data->counterEnabled != FALSE) {
        data->frameTimer++;
        if (data->frameTimer >= 1800) {
            if (data->frameCounter < 59999) {
                data->frameCounter++;
            }
            data->frameTimer = 0;
        }
    }

    // Main state machine
    switch (courseState->mainState) {
    case POKEATHLON_STATE_IDLE:
        if (ov96_021E5C2C(data)) {
            return TRUE;
        }

        // Handle exit flag
        if (courseState->exitFlag != 0) {
            PokeathlonCourseArgs *args = (PokeathlonCourseArgs *)courseState->argsPtr;
            args->modeBytes[2] = args->modeBytes[3];
            args->modeBytes[1] = 0;
            courseState->exitFlag = 0;
        }

        // Check for state transitions
        if (courseState->transitionType != 0) {
            if (courseState->transitionType == 0x10) { // Special exit transition
                courseState->mainState = POKEATHLON_STATE_START_EXIT;
            } else {
                courseState->mainState = POKEATHLON_STATE_START_TRANSITION;
            }
        }
        break;

    case POKEATHLON_STATE_START_TRANSITION:
        sub_02037AC0(courseState->transitionType);
        courseState->mainState = POKEATHLON_STATE_WAIT_TRANSITION;
        // Fallthrough to case POKEATHLON_STATE_WAIT_TRANSITION

    case POKEATHLON_STATE_WAIT_TRANSITION:
        if (sub_02037B38(courseState->transitionType)) {
            courseState->mainState = POKEATHLON_STATE_IDLE;
            courseState->transitionType = 0; // Clear transition type
        }
        break;

    case POKEATHLON_STATE_START_EXIT:
        GF_ASSERT(courseState->transitionType == 0x10);
        sub_02037AC0(courseState->transitionType);
        courseState->mainState = POKEATHLON_STATE_EXIT_SEQUENCE;
        // Fallthrough to case POKEATHLON_STATE_EXIT_SEQUENCE

    case POKEATHLON_STATE_EXIT_SEQUENCE:
        if (!sub_02037B38(courseState->transitionType)) {
            if (ov96_021E5F24(data)) {
                break;
            }

            // Copy data between buffers
            {
                void *src;
                u8 *dest1;
                u8 *dest2;
                u32 copyCount;

                src = ov96_021E9A14();
                dest1 = data->dataCopyBuffer1; // Destination buffer 1
                ov96_021E87B4(0x1B, dest1, src, (int)data->system);

                dest1 = ov96_021E8A20(data->dataCopyBuffer2); // Destination buffer 2
                dest2 = ov96_021E8A20(data->dataCopySource);  // Source buffer

                // Copy 0x28 bytes from source to dest
                for (copyCount = 0x28; copyCount != 0; copyCount--) {
                    u8 byte;
                    byte = dest2[0];
                    dest2++;
                    dest1[0] = byte;
                    dest1++;
                }
            }
        } else {
            courseState->mainState = POKEATHLON_STATE_IDLE;
            courseState->transitionType = 0; // Clear transition type
        }
        break;
    }

    ov96_021E67AC(data);
    return FALSE;
}

BOOL PokeathlonCourse_Exit(OverlayManager *manager, int *state) {
    PokeathlonCourseData *data;
    PokeathlonCourseArgs *args;
    POKEATHLON_SAV *pokeathlonSave;
    Pokeathlon_UnkSubStruct_B00 *result;
    SaveData *saveData;

    data = OverlayManager_GetData(manager);

    // Verify heap is valid
    GF_ASSERT(GF_heap_c_dummy_return_true(HEAP_ID_92));

    // Check if we need to free certain allocations
    args = data->args;
    if (args->shouldFreeHeap == FALSE) {
        // Free two heap allocations
        Heap_Free(data->heapAllocPtr2);
        Heap_Free(data->heapAllocPtr3);
    }

    // Get Pokeathlon save data and process result
    saveData = *(SaveData **)data->args;
    pokeathlonSave = Save_Pokeathlon_Get(saveData);
    result = sub_020319F0(pokeathlonSave);
    ov96_021E7F98(data->frameCounter, 59999, result);

    // Reset text flags
    TextFlags_SetCanABSpeedUpPrint(FALSE);
    TextFlags_SetAutoScrollParam(0);
    TextFlags_SetCanTouchSpeedUpPrint(FALSE);

    // Free system objects
    ov96_021E9320(data->field_614);
    Heap_Free(data->heapAllocPtr1);
    ov96_021E8810(data->system);

    // Clean up overlay data and heap
    OverlayManager_FreeData(manager);
    Heap_Destroy(HEAP_ID_92);

    return TRUE;
}
