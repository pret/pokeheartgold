#include "field_system.h"
#include "heap.h"
#include "launch_application.h"
#include "task.h"
#include "unk_0200FA24.h"
#include "unk_02097D3C.h"

static BOOL sub_02097D80(TaskManager *taskManager);

void sub_02097D3C(FieldSystem *fieldSystem, u8 a1, u8 a2) {
    UnkStruct_02097D48 *unk0 = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(UnkStruct_02097D48));
    unk0->unk00 = 0;
    unk0->unk04 = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(UnkStruct_02097D56));
    unk0->unk04->saveData = FieldSystem_GetSaveData(fieldSystem);
    unk0->unk04->unk00 = a1;
    unk0->unk04->unk02 = a2;
    TaskManager_Call(fieldSystem->taskman, sub_02097D80, unk0);
}

static BOOL sub_02097D80(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    UnkStruct_02097D8E *unk1 = TaskManager_GetEnvironment(taskManager);
    
    switch (unk1->state) {
        case 0:
            BeginNormalPaletteFade(0, 0, 0, RGB_BLACK, 6, 1, HEAP_ID_4);
            unk1->state++;

            break;
        case 1:
            if (!IsPaletteFadeFinished()) {
                break;
            }

            sub_0203FD08(fieldSystem, unk1->unk04);
            sub_0203E30C();
            unk1->state++;
            break;
        case 2:
            if (FieldSystem_ApplicationIsRunning(fieldSystem)) {
                break;
            }

            unk1->state++;
            sub_020505C0(fieldSystem);
            break;
        case 3:
            if (sub_020505C8(fieldSystem)) {
                BeginNormalPaletteFade(0, 1, 1, RGB_BLACK, 6, 1, HEAP_ID_4);
                unk1->state++;
            }

            break;
        case 4:
            if (!IsPaletteFadeFinished()) {
                break;
            }

            FreeToHeap(unk1->unk04);
            FreeToHeap(unk1);
            return TRUE;
    }

    return FALSE;
}
