#include "nitro/mi/memory.h"

#include "global.h"

#include "pokeathlon/pokeathlon.h"

#include "assert.h"
#include "heap.h"
#include "player_data.h"
#include "render_text.h"
#include "unk_02031904.h"
#include "unk_02034354.h"
#include "unk_02035900.h"

// External functions used throughout this file (in assembly for now)
extern int ov97_0221E5C0(OverlayManager *man, int *state); // Init
extern int ov97_0221E5D4(OverlayManager *man, int *state); // Main/Exec
extern int ov97_0221E69C(OverlayManager *man, int *state); // Exit
extern void sub_02037AC0(u8 param);
extern BOOL sub_02037B38(u8 param);
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
        data->participantCount = sub_02037454();
        data->maxParticipants = 4;
    } else {
        data->participantCount = 1;
        data->maxParticipants = 3;
    }

    param1 = ov96_021E8A24();
    param2 = ov96_021E8A2C();

    system = ov96_021E8770(param1, param2, data, specialMode, data->heapId);
    data->system = system;

    PokeathlonCourse_InitStateInfo(&ov96_0221A984, &data->stateData);

    data->stateData.stateIndex = 0;
    data->courseState.argsPtr = (void **)&data->stateData;
    data->courseState.exitFlag = 0;

    PokeathlonCourse_InitPlayerProfiles(data);

    system = ov96_021E92E0(HEAP_ID_92);
    data->graphicsSystem = system;

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
        if (PokeathlonCourse_RunStateFunc(data)) {
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
    ov96_021E9320(data->graphicsSystem);
    Heap_Free(data->heapAllocPtr1);
    ov96_021E8810(data->system);

    // Clean up overlay data and heap
    OverlayManager_FreeData(manager);
    Heap_Destroy(HEAP_ID_92);

    return TRUE;
}

BOOL PokeathlonCourse_RunStateFunc(PokeathlonCourseData *data) {
    void **stateDataPtr = (void **)&data->stateData.stateArgsBase;
    u8 index = data->stateData.stateIndex;
    PokeathlonStateFunc *functionTable = (PokeathlonStateFunc *)data->stateData.ptr;
    PokeathlonStateFunc func = functionTable[index];
    BOOL result = func(data, stateDataPtr);

    return result != FALSE;
}

BOOL PokeathlonCourse_RunSubStateLoop(PokeathlonCourseData *data) {
    PokeathlonStateHandlerFunc *statePtr;
    PokeathlonStateHandlerFunc func;
    BOOL result;

    do {
        statePtr = (PokeathlonStateHandlerFunc *)data->state;
        func = statePtr[0];
        result = func(data, 0);

        if (result == 1) {
            return TRUE;
        }

        if (result == 0) {
            break;
        }
    } while (data->args->mode == 0);

    return FALSE;
}

void PokeathlonCourse_InitStateInfo(const void *src, PokeathlonStateInfo *dest) {
    dest->ptr = (void *)src;
    dest->field_04 = 1;
    dest->stateArgsBase = 0;
    dest->stateIndex = 0;
    dest->field_07 = 0;
}

void PokeathlonCourse_InitPlayerProfiles(PokeathlonCourseData *data) {
    int i;

    data->heapAllocPtr1 = Heap_Alloc(data->heapId, PlayerProfile_sizeof() * 4);

    for (i = 0; i < 4; i++) {
        PlayerProfile_Init(PokeathlonCourse_GetPlayerProfile(data->heapAllocPtr1, i));
    }

    if (data->args->mode == 0) {
        PlayerProfile *dest = PokeathlonCourse_GetPlayerProfile(data->heapAllocPtr1, 0);
        PlayerProfile *src = Save_PlayerData_GetProfile(data->args->saveData);
        PlayerProfile_Copy(src, dest);
    } else {
        for (i = 0; i < data->participantCount; i++) {
            PlayerProfile *dest = PokeathlonCourse_GetPlayerProfile(data->heapAllocPtr1, i);
            PlayerProfile *src = sub_02034818(i);
            PlayerProfile_Copy(src, dest);
        }
    }
}

PlayerProfile *PokeathlonCourse_GetPlayerProfile(PlayerProfile *profiles, int index) {
    return (PlayerProfile *)((u8 *)profiles + (PlayerProfile_sizeof() * index));
}

u8 PokeathlonCourse_GetParticipantCount(PokeathlonCourseData *data) {
    return data->participantCount;
}

PokeathlonParticipantData *PokeathlonCourse_GetParticipantData1(PokeathlonCourseData *data, int index) {
    return (PokeathlonParticipantData *)((u8 *)&data->participantData1Base + (0x7C * index));
}

PokeathlonParticipantData *PokeathlonCourse_GetParticipantData2(PokeathlonCourseData *data, int index) {
    return (PokeathlonParticipantData *)&data->participantData2[0x7C * index];
}

SaveData *PokeathlonCourse_GetSaveData(PokeathlonCourseData *data) {
    return data->args->saveData;
}

PokeathlonFieldData *ov96_021E5D6C(PokeathlonCourseData *data) {
    return (PokeathlonFieldData *)data->field_72C;
}

PokeathlonFieldData *ov96_021E5D78(PokeathlonCourseData *data, int index) {
    return (PokeathlonFieldData *)&data->field_72C[0x60 * index];
}

void *ov96_021E5D88(PokeathlonCourseData *data) {
    return data->filler_BA4;
}

void *PokeathlonCourse_AllocFromHeap(PokeathlonCourseData *data, u32 size) {
    data->heapAllocPtr4 = Heap_Alloc(data->heapId, size);
    return data->heapAllocPtr4;
}

void PokeathlonCourse_FreeHeapAlloc(PokeathlonCourseData *data) {
    Heap_Free(data->heapAllocPtr4);
    data->heapAllocPtr4 = NULL;
}

void *PokeathlonCourse_GetHeapAllocPtr(PokeathlonCourseData *data) {
    return data->heapAllocPtr4;
}

enum HeapID PokeathlonCourse_GetHeapID(PokeathlonCourseData *data) {
    return data->heapId;
}

u8 ov96_021E5DD4(PokeathlonCourseData *data) {
    return data->field_1ED;
}

void ov96_021E5DE0(PokeathlonCourseData *data, int param) {
    data->field_1ED = param;
}

void ov96_021E5DEC(PokeathlonCourseData *data) {
    data->field_1ED++;
}

void ov96_021E5DFC(PokeathlonCourseData *data, int param) {
    data->field_1F4 = param;
}
