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

// External functions used by Main (in assembly for now)
extern void sub_02037AC0(u8 param);
extern BOOL sub_02037B38(u8 param);
extern void GF_AssertFail(void);
extern BOOL ov96_021E5C2C(PokeathlonCourseData *data);
extern BOOL ov96_021E5F24(PokeathlonCourseData *data);
extern void *ov96_021E9A14(void);
extern void ov96_021E87B4(int a0, void *a1, void *a2, int a3);
extern u8 *ov96_021E8A20(void *ptr);
extern void ov96_021E67AC(PokeathlonCourseData *data);

BOOL PokeathlonCourse_Main(OverlayManager *manager, int *state) {
    PokeathlonCourseData *data;
    u32 *statePtr;

    data = OverlayManager_GetData(manager);
    statePtr = (u32 *)&data->field_3B4;

    if (*(u32 *)((u8 *)data + 0xD2C) != 0) {
        (*(u16 *)((u8 *)data + 0xD28))++;
        if (*(u16 *)((u8 *)data + 0xD28) >= 0x708) {
            if (*(s32 *)((u8 *)data + 0xD24) < 0xEA5F) {
                (*(s32 *)((u8 *)data + 0xD24))++;
            }
            *(u16 *)((u8 *)data + 0xD28) = 0;
        }
    }

    switch (statePtr[2]) {
    case 0:
        if (ov96_021E5C2C(data)) {
            return TRUE;
        }

        if (statePtr[3] != 0) {
            PokeathlonCourseArgs *args;
            args = (PokeathlonCourseArgs *)statePtr[0];
            args->filler_0[6] = args->filler_0[7];
            args->filler_0[5] = 0;
            statePtr[3] = 0;
        }

        if (statePtr[1] != 0) {
            if (statePtr[1] == 0x10) {
                statePtr[2] = 3;
            } else {
                statePtr[2] = 1;
            }
        }
        break;

    case 1:
        sub_02037AC0((u8)statePtr[1]);
        statePtr[2] = 2;

    case 2:
        if (sub_02037B38((u8)statePtr[1])) {
            statePtr[2] = 0;
            statePtr[1] = 0;
        }
        break;

    case 3:
        if (statePtr[1] != 0x10) {
            GF_AssertFail();
        }
        sub_02037AC0((u8)statePtr[1]);
        statePtr[2] = 4;

    case 4:
        if (!sub_02037B38((u8)statePtr[1])) {
            if (ov96_021E5F24(data)) {
                break;
            }

            {
                void *src;
                u8 *dest1;
                u8 *dest2;
                u32 copyCount;

                src = ov96_021E9A14();
                dest1 = (u8 *)data + 0x2B4;
                ov96_021E87B4(0x1B, dest1, src, (int)data->system);

                dest1 = ov96_021E8A20((u8 *)data + 0x2DC);
                dest2 = ov96_021E8A20((u8 *)data + 0x28C);

                for (copyCount = 0x28; copyCount != 0; copyCount--) {
                    u8 byte;
                    byte = dest2[0];
                    dest2++;
                    dest1[0] = byte;
                    dest1++;
                }
            }
        } else {
            statePtr[2] = 0;
            statePtr[1] = 0;
        }
        break;
    }

    ov96_021E67AC(data);
    return FALSE;
}
