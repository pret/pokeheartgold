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
extern BOOL GF_heap_c_dummy_return_true(enum HeapID heapId);

// Data tables in assembly
extern const OverlayManagerTemplate subOverlayTemplate;
extern const u8 ov96_0221A934[40];
extern const void *sPokeathlonStateInfoFuncTable;

BOOL PokeathlonCourse_Init(OverlayManager *manager, int *state) {
    PokeathlonCourseData *data;
    PokeathlonCourseArgs *args;
    OverlayManager *subOverlay;
    BOOL specialMode;
    OverlayManagerTemplate subTemplate;
    void *system;

    Heap_Create(HEAP_ID_3, HEAP_ID_POKEATHLON, 0x72000);

    data = OverlayManager_CreateAndGetData(manager, sizeof(PokeathlonCourseData), HEAP_ID_POKEATHLON);
    MI_CpuFill8(data, 0, sizeof(PokeathlonCourseData));

    data->heapId = HEAP_ID_POKEATHLON;

    args = OverlayManager_GetArgs(manager);
    data->args = args;

    subTemplate = subOverlayTemplate;

    subOverlay = OverlayManager_New(&subTemplate, &data->args, HEAP_ID_POKEATHLON);
    data->subOverlay = subOverlay;

    specialMode = FALSE;
    data->state = specialMode;
    args = data->args;

    if (args->mode == 1) {
        specialMode = TRUE;
        data->participantCount = sub_02037454();
        data->maxParticipants = 4;
    } else {
        data->participantCount = 1;
        data->maxParticipants = 3;
    }

    system = ov96_021E8770(ov96_021E8A24(), ov96_021E8A2C(), data, specialMode, data->heapId);
    data->system = system;

    PokeathlonCourse_InitStateInfo(&sPokeathlonStateInfoFuncTable, &data->stateInfo);

    data->stateInfo.stateIndex = 0;
    data->courseState.argsPtr = &data->stateInfo;
    data->courseState.exitFlag = 0;

    PokeathlonCourse_InitPlayerProfiles(data);

    system = ov96_021E92E0(HEAP_ID_POKEATHLON);
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

    PokeathlonCourse_SetField1F4(data, 0);
    PokeathlonCourse_SetField1ED(data, 0);

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
    GF_ASSERT(GF_heap_c_dummy_return_true(HEAP_ID_POKEATHLON));

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
    Heap_Free(data->playerProfiles);
    ov96_021E8810(data->system);

    // Clean up overlay data and heap
    OverlayManager_FreeData(manager);
    Heap_Destroy(HEAP_ID_POKEATHLON);

    return TRUE;
}

BOOL PokeathlonCourse_RunStateFunc(PokeathlonCourseData *data) {
    void **stateDataPtr = (void **)&data->stateInfo.stateArgsBase;
    u8 index = data->stateInfo.stateIndex;
    PokeathlonStateFunc *functionTable = (PokeathlonStateFunc *)data->stateInfo.ptr;
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

void PokeathlonCourse_InitStateInfo(const void *funcTable, PokeathlonStateInfo *stateInfo) {
    stateInfo->ptr = (void *)funcTable;
    stateInfo->field_04 = 1;
    stateInfo->stateArgsBase = 0;
    stateInfo->stateIndex = 0;
    stateInfo->field_07 = 0;
}

void PokeathlonCourse_InitPlayerProfiles(PokeathlonCourseData *data) {
    int i;

    data->playerProfiles = Heap_Alloc(data->heapId, PlayerProfile_sizeof() * 4);

    for (i = 0; i < 4; i++) {
        PlayerProfile_Init(PokeathlonCourse_GetPlayerProfile(data->playerProfiles, i));
    }

    if (data->args->mode == 0) {
        PlayerProfile *dest = PokeathlonCourse_GetPlayerProfile(data->playerProfiles, 0);
        PlayerProfile *src = Save_PlayerData_GetProfile(data->args->saveData);
        PlayerProfile_Copy(src, dest);
    } else {
        for (i = 0; i < data->participantCount; i++) {
            PlayerProfile *dest = PokeathlonCourse_GetPlayerProfile(data->playerProfiles, i);
            PlayerProfile *src = sub_02034818(i);
            PlayerProfile_Copy(src, dest);
        }
    }
}

PlayerProfile *PokeathlonCourse_GetPlayerProfile(PlayerProfile *profiles, int index) {
    return (PlayerProfile *)&((u8 *)profiles)[PlayerProfile_sizeof() * index];
}

u8 PokeathlonCourse_GetParticipantCount(PokeathlonCourseData *data) {
    return data->participantCount;
}

PokeathlonParticipantData *PokeathlonCourse_GetParticipantData(PokeathlonCourseData *data, int index) {
    return &data->participants[index];
}

u8 *PokeathlonCourse_GetParticipantUnk04(PokeathlonCourseData *data, int index) {
    return &data->participants[index].field_04;
}

SaveData *PokeathlonCourse_GetSaveData(PokeathlonCourseData *data) {
    return data->args->saveData;
}

PokeathlonFieldData *PokeathlonCourse_GetFieldData(PokeathlonCourseData *data) {
    return data->fieldData;
}

PokeathlonFieldData *PokeathlonCourse_GetFieldData_AtIndex(PokeathlonCourseData *data, int index) {
    return &data->fieldData[index];
}

void *PokeathlonCourse_GetFieldBA4(PokeathlonCourseData *data) {
    return data->field_BA4;
}

void *PokeathlonCourse_AllocPtr4FromHeap(PokeathlonCourseData *data, u32 size) {
    data->heapAllocPtr4 = Heap_Alloc(data->heapId, size);
    return data->heapAllocPtr4;
}

void PokeathlonCourse_FreePtr4HeapAlloc(PokeathlonCourseData *data) {
    Heap_Free(data->heapAllocPtr4);
    data->heapAllocPtr4 = NULL;
}

void *PokeathlonCourse_GetHeapAllocPtr4(PokeathlonCourseData *data) {
    return data->heapAllocPtr4;
}

enum HeapID PokeathlonCourse_GetHeapID(PokeathlonCourseData *data) {
    return data->heapId;
}

u8 PokeathlonCourse_GetField1ED(PokeathlonCourseData *data) {
    return data->field_1ED;
}

void PokeathlonCourse_SetField1ED(PokeathlonCourseData *data, int param) {
    data->field_1ED = param;
}

void PokeathlonCourse_IncrementField1ED(PokeathlonCourseData *data) {
    data->field_1ED++;
}

void PokeathlonCourse_SetField1F4(PokeathlonCourseData *data, int param) {
    data->field_1F4 = param;
}

void ov96_021E5E04(PokeathlonCourseData *data, u8 *param) {
    for (int i = 0; i < data->maxParticipants; i++) {
        data->field_3D8[i] = param[i];
    }

    data->field_3E8 = ov96_021E5E7C(data);
    data->field_27C = data->field_3E8;
}

u32 PokeathlonCourse_GetField3D8_ForCurrentParticipant(PokeathlonCourseData *data) {
    return data->field_3D8[data->currentParticipantIndex];
}

u32 PokeathlonCourse_GetField3D8_AtIndex(PokeathlonCourseData *data, u8 index) {
    if (index >= data->maxParticipants) {
        GF_ASSERT(FALSE);
        return 0;
    }
    return data->field_3D8[index];
}

u32 ov96_021E5E7C(PokeathlonCourseData *data) {
    u8 i, j, numParticipants;
    BOOL flag = (PokeathlonCourse_GetMode(data) == 1);
    u32* fieldPtr = data->field_3D8;
    numParticipants = flag ? 4 : 3;

    for (i = 0; i < 10; i++) {
        BOOL match = TRUE;
        for (j = 0; j < numParticipants; j++) {
            if (fieldPtr[j] != ov96_0221A934[i*4+j]) {
                match = FALSE;
                break;
            }
        }
        if (match) {
            return i;
        }
    }
    return 10;
}

u32 PokeathlonCourse_GetCurrentParticipantIndex(PokeathlonCourseData *data) {
    return data->currentParticipantIndex;
}

u32 PokeathlonCourse_GetMode(PokeathlonCourseData *data) {
    return data->args->mode;
}

u8 PokeathlonCourse_GetField1EF(PokeathlonCourseData *data) {
    return data->field_1EF;
}

void PokeathlonCourse_IncrementField1EF(PokeathlonCourseData *data) {
    data->field_1EF++;
}

void PokeathlonCourse_ResetField1EF(PokeathlonCourseData *data) {
    data->field_1EF = 0;
}

void *PokeathlonCourse_GetSystem(PokeathlonCourseData *data) {
    return data->system;
}

BOOL ov96_021E5F24(PokeathlonCourseData *data) {
    return ov96_021E8828(data->system);
}

PlayerProfile *PokeathlonCourse_GetPlayerProfileFromData(PokeathlonCourseData *data, int index) {
    return PokeathlonCourse_GetPlayerProfile(data->playerProfiles, index);
}

PokeathlonUnkSubStruct_974 *PokeathlonCourse_GetField974_AtIndex(PokeathlonCourseData *data, int index) {
    return &data->field_974[index];
}

u8 *PokeathlonCourse_GetDataCopyArea(PokeathlonCourseData *data) {
    return data->dataCopySource;
}

void PokeathlonCourse_ResetDataCopyArea(PokeathlonCourseData *data) {
    // Look like it's filling dataCopySource + dataCopyBuffer1 + dataCopyBuffer2 + filler_304 + field_3A4
    MI_CpuFill8(data->dataCopySource, 0, 296);
}

void PokeathlonCourse_SetField3A4(PokeathlonCourseData *data, u32 a0, u32 a1, u32 a2) {
    data->field_3A4[0] = a0;
    data->field_3A4[1] = a1;
    data->field_3A4[2] = a2;
    data->field_3A4[3] = 1;
}

void PokeathlonCourse_ResetField3A4(PokeathlonCourseData *data) {
    data->field_3A4[0] = 0;
    data->field_3A4[1] = 0;
    data->field_3A4[2] = 0;
    data->field_3A4[3] = 0;
}

u32 PokeathlonCourse_GetField3A4(PokeathlonCourseData *data) {
    return data->field_3A4[1];
}

u32 PokeathlonCourse_GetUnkConstant4() {
    return 4; // might be max participants or something; needs to see where it's called
}

void PokeathlonCourse_SetField5E0_AtIndex(PokeathlonCourseData *data, int index, u16 value) {
    data->field_5E0[index][0] = value;
}

u16 PokeathlonCourse_GetField5F0_AtIndex(PokeathlonCourseData *data, int index) {
    return data->field_5F0[index][0];
}

void PokeathlonCourse_SetStateField07(PokeathlonCourseData *data, u8 value) {
    GF_ASSERT(data->courseState.exitFlag != 1);
    data->courseState.exitFlag = 1;
    data->courseState.argsPtr->field_07 = value;
}

void PokeathlonCourse_SetStateField07_IfDifferent(PokeathlonCourseData *data, u8 value, u8 value2) {
    if (data->courseState.argsPtr->field_07 != value2) {
        GF_ASSERT(data->courseState.exitFlag != 1);
        data->courseState.exitFlag = 1;
        data->courseState.argsPtr->field_07 = value;
    }
}

void PokeathlonCourse_SetStateTransitionType(PokeathlonCourseData *data, u32 transitionType) {
    if (data->args->mode == 1) {
        data->courseState.transitionType = transitionType;
    }
}

void PokeathlonCourse_SetVBlankIntrCB(PokeathlonCourseData *data) {
    Main_SetVBlankIntrCB(ov96_021E75BC, data);
}

void *PokeathlonCourse_GetGraphicsSystem(PokeathlonCourseData *data) {
    return data->graphicsSystem;
}
