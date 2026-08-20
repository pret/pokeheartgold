#include "field/overlay_01_021FB878.h"

#include "field_system.h"
#include "overlay_04.h"

typedef struct SinjohGymmickLocalData_Sub014 {
    Field3dModel unk_00;
    Field3DModelAnimation unk_10[2];
    Field3dObject unk_38;
    BOOL unk_B0;
} SinjohGymmickLocalData_Sub014;

typedef struct SinjohGymmickLocalData {
    FieldSystem *unk_000;
    NNSFndAllocator unk_004;
    SinjohGymmickLocalData_Sub014 unk_014[3];
    int unk_230;
    SysTask *unk_234;
} SinjohGymmickLocalData; // size: 0x238

void ov04_02256F50(SinjohGymmickLocalData *localData);
void ov04_022570EC(SinjohGymmickLocalData *localData);
void ov04_02257148(SysTask *sysTask, void *taskData);
BOOL ov04_02257240(SinjohGymmickLocalData_Sub014 *a0, const u8 a1, const u8 a2);
void ov04_022572E0(Field3DModelAnimation *a0, const u8 a1, const fx32 a2);
BOOL ov04_02257308(TaskManager *taskman);

void GymmickInit_Sinjoh(FieldSystem *fieldSystem) {
    GymmickUnion *gymmickUnion = Save_Gymmick_AssertMagic_GetData(Save_GetGymmickPtr(FieldSystem_GetSaveData(fieldSystem)), GYMMICK_SINJOH);
    fieldSystem->unk4->unk24 = Heap_Alloc(HEAP_ID_FIELD1, sizeof(SinjohGymmickLocalData));
    MI_CpuClear8(fieldSystem->unk4->unk24, sizeof(SinjohGymmickLocalData));
    SinjohGymmickLocalData *localData = fieldSystem->unk4->unk24;
    localData->unk_000 = fieldSystem;
    ov04_02256F50(localData);
    localData->unk_234 = SysTask_CreateOnMainQueue(ov04_02257148, localData, 1);
}

void GymmickFree_Sinjoh(FieldSystem *fieldSystem) {
    SinjohGymmickLocalData *localData = fieldSystem->unk4->unk24;
    SysTask_Destroy(localData->unk_234);
    ov04_022570EC(localData);
    Heap_Free(localData);
    fieldSystem->unk4->unk24 = NULL;
}

void ov04_02256ED8(FieldSystem *fieldSystem) {
    SinjohGymmickLocalData *localData = fieldSystem->unk4->unk24;
    for (u8 i = 0; i < 3; ++i) {
        Field3dObject_SetActiveFlag(&localData->unk_014[i].unk_38, FALSE);
    }
}

void ov04_02256F00(FieldSystem *fieldSystem, u8 a1) {
    SinjohGymmickLocalData *localData = fieldSystem->unk4->unk24;
    if (a1 > 3) {
        GF_ASSERT(FALSE);
        return;
    }
    GF_ASSERT(Field3dObject_GetActiveFlag(&localData->unk_014[0].unk_38));
    GymmickUnion *gymmickUnion = Save_Gymmick_AssertMagic_GetData(Save_GetGymmickPtr(FieldSystem_GetSaveData(fieldSystem)), GYMMICK_SINJOH);
    gymmickUnion->sinjoh.choice = a1;
    localData->unk_230 = 1;
    TaskManager_Call(fieldSystem->taskman, ov04_02257308, localData);
}

void ov04_02256F50(SinjohGymmickLocalData *localData) {
    u8 i;
    u8 j;
    enum HeapID heapID = HEAP_ID_FIELD1;

    const int ov04_02257B28[3][2] = {
        { 102, 103 },
        { 105, 106 },
        { 108, 109 },
    };
    const int ov04_02257B1C[3] = {
        101,
        104,
        107,
    };

    HeapExp_FndInitAllocator(&localData->unk_004, heapID, 0x20);

    for (i = 0; i < 3; ++i) {
        Field3dModel_LoadFromFilesystem(&localData->unk_014[i].unk_00, NARC_demo_legend, ov04_02257B1C[i], heapID);
    }

    for (j = 0; j < 3; ++j) {
        for (i = 0; i < 2; ++i) {
            Field3dModelAnimation_LoadFromFilesystem(&localData->unk_014[j].unk_10[i], &localData->unk_014[j].unk_00, NARC_demo_legend, ov04_02257B28[j][i], heapID, &localData->unk_004);
        }
    }

    for (i = 0; i < 3; ++i) {
        Field3dObject_InitFromModel(&localData->unk_014[i].unk_38, &localData->unk_014[i].unk_00);
    }

    for (j = 0; j < 3; ++j) {
        for (i = 0; i < 2; ++i) {
            Field3dObject_AddAnimation(&localData->unk_014[j].unk_38, &localData->unk_014[j].unk_10[i]);
        }
    }

    for (i = 0; i < 3; ++i) {
        Field3dObject_SetActiveFlag(&localData->unk_014[i].unk_38, TRUE);
        ov04_022572E0(localData->unk_014[i].unk_10, 2, 0);
    }

    const VecFx32 ov04_02257B40[3] = {
        { FX32_CONST(200), FX32_CONST(16), FX32_CONST(248) },
        { FX32_CONST(328), FX32_CONST(16), FX32_CONST(248) },
        { FX32_CONST(264), FX32_CONST(16), FX32_CONST(136) },
    };

    for (i = 0; i < 3; ++i) {
        Field3dObject_SetPosEx(&localData->unk_014[i].unk_38, ov04_02257B40[i].x, ov04_02257B40[i].y, ov04_02257B40[i].z);
    }
}

void ov04_022570EC(SinjohGymmickLocalData *localData) {
    u8 i;
    u8 j;

    for (j = 0; j < 3; ++j) {
        for (i = 0; i < 2; ++i) {
            Field3dModelAnimation_Unload(&localData->unk_014[j].unk_10[i], &localData->unk_004);
        }
        Field3dModel_Unload(&localData->unk_014[j].unk_00);
    }
}

void ov04_02257148(SysTask *sysTask, void *taskData) {
    u8 i;
    SinjohGymmickLocalData *localData = taskData;
    int sp8[3];
    u8 sp4[3] = { 0, 0, 0 };
    BOOL sp0;
    FieldSystem *fieldSystem = localData->unk_000;
    GymmickUnion *gymmickUnion = Save_Gymmick_AssertMagic_GetData(Save_GetGymmickPtr(FieldSystem_GetSaveData(fieldSystem)), GYMMICK_SINJOH);

    switch (gymmickUnion->sinjoh.choice) {
    case 0:
        break;
    case 1:
        sp4[0] = 1;
        break;
    case 2:
        sp4[1] = 1;
        break;
    case 3:
        sp4[2] = 1;
        break;
    default:
        GF_ASSERT(FALSE);
    }
    for (i = 0; i < 3; ++i) {
        sp0 = ov04_02257240(&localData->unk_014[i], 2, sp4[i]); // bug: only the result of the last call matters
    }
    for (i = 0; i < 3; ++i) {
        Field3dObject_Draw(&localData->unk_014[i].unk_38);
    }

    if (sp0) {
        localData->unk_230 = 0;
    }

    for (i = 0; i < 3; ++i) {
        SinjohGymmickLocalData_Sub014 *r0 = &localData->unk_014[i];
        sp8[i] = ov01_021FBF28(&r0->unk_10[0]) / FX32_ONE;
        sp8[i] %= 30;
    }
    GF_ASSERT(sp8[0] == sp8[1]);
    GF_ASSERT(sp8[1] == sp8[2]);
    GF_ASSERT(sp8[2] == sp8[0]);
}

BOOL ov04_02257240(SinjohGymmickLocalData_Sub014 *a0, const u8 a1, const u8 a2) {
    u8 i;
    fx32 r0;
    fx32 spC;
    fx32 r1;
    u8 r6 = FALSE;
    if (a0->unk_B0) {
        spC = FX32_CONST(60);
    } else {
        spC = FX32_CONST(30);
    }
    for (i = 0; i < a1; ++i) {
        r0 = ov01_021FBF28(&a0->unk_10[i]);
        if (r0 + FX32_ONE >= spC) {
            if (i != 0) {
                GF_ASSERT(r6);
            }
            r6 = TRUE;
        }
        Field3dModelAnimation_FrameAdvanceAndLoop(&a0->unk_10[i], FX32_ONE);
        if (r6) {
            a0->unk_B0 = a2;
            if (a0->unk_B0) {
                r1 = FX32_CONST(30);
            } else {
                r1 = 0;
            }
            Field3dModelAnimation_FrameSet(&a0->unk_10[i], r1);
        }
    }
    if (r6) {
        return TRUE;
    } else {
        return FALSE;
    }
}

void ov04_022572E0(Field3DModelAnimation *a0, const u8 a1, const fx32 a2) {
    u8 i;

    for (i = 0; i < a1; ++i) {
        Field3dModelAnimation_FrameSet(&a0[i], a2);
    }
}

BOOL ov04_02257308(TaskManager *taskman) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskman);
    SinjohGymmickLocalData *localData = TaskManager_GetEnvironment(taskman);

    return !localData->unk_230;
}
