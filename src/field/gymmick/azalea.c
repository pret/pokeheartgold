#include "field/overlay_01_02204004.h"

#include "field_system.h"
#include "overlay_01.h"
#include "overlay_01_021F3610.h"
#include "overlay_01_022053EC.h"
#include "overlay_04.h"
#include "task.h"
#include "unk_02005D10.h"

typedef struct AzaleaGymmickSpinarakRoute {
    u16 length;
    u16 destination;
    const u16 (*route)[2];
} AzaleaGymmickSpinarakRoute;

typedef struct AzaleaGymmickLocalData {
    u8 filler_00[4];
    void *unk_04[4];
    u8 unk_14;
    u8 unk_15;
    u8 unk_16;
    u8 unk_17;
    u8 unk_18;
    u8 unk_19;
    u8 unk_1A;
    u8 unk_1B;
    int unk_1C;
    int unk_20[2];
    const u16 *unk_28;
    int unk_2C;
    int unk_30;
    int unk_34;
    VecFx32 unk_38;
    u8 filler_44[0xC];
    int unk_50;
} AzaleaGymmickLocalData; // size: 0x54

typedef struct AzaleaGymmickSpinarakRideData {
    int state;
    FieldSystem *fieldSystem;
} AzaleaGymmickSpinarakRideData; // size: 0x08

BOOL ov04_0225463C(TaskManager *taskman);
void ov04_02254724(SysTask *sysTask, void *taskData);
VecFx32 ov04_02254698(const u16 *a0, const u16 *a1);
void ov04_022546C8(const VecFx32 *a0, BOOL *a1);
int ov04_022546E8(int a0, int a1, int a2, int a3);
BOOL ov04_02254CA4(TaskManager *taskman);

static const u16 ov04_02257404[][2] = {
    { 3,  31 },
    { 3,  29 },
    { 9,  29 },
    { 9,  27 },
    { 15, 28 },
    { 15, 25 },
    { 9,  25 },
    { 9,  24 },
};

static const u16 ov04_02257584[][2] = {
    { 9,  31 },
    { 9,  29 },
    { 3,  29 },
    { 3,  27 },
    { 9,  26 },
    { 9,  25 },
    { 15, 25 },
    { 15, 24 },
};

static const u16 ov04_0225737C[][2] = {
    { 15, 31 },
    { 15, 28 },
    { 9,  27 },
    { 9,  26 },
    { 3,  27 },
    { 3,  24 },
};

static const u16 ov04_02257394[][2] = {
    { 3, 16 },
    { 3, 12 },
    { 9, 13 },
    { 9, 10 },
    { 3, 10 },
    { 3, 9  },
};

static const u16 ov04_0225736C[][2] = {
    { 3, 16 },
    { 3, 12 },
    { 9, 13 },
    { 9, 9  },
};

static const u16 ov04_02257504[][2] = {
    { 9,  16 },
    { 9,  14 },
    { 15, 14 },
    { 15, 11 },
    { 9,  12 },
    { 9,  10 },
    { 3,  10 },
    { 3,  9  },
};

static const u16 ov04_0225735C[][2] = {
    { 9,  16 },
    { 9,  14 },
    { 15, 14 },
    { 15, 9  },
};

static const u16 ov04_022573AC[][2] = {
    { 9,  16 },
    { 9,  14 },
    { 15, 14 },
    { 15, 11 },
    { 9,  12 },
    { 9,  9  },
};

static const u16 ov04_022575D4[][2] = {
    { 3,  31 },
    { 9,  31 },
    { 15, 31 },
    { 3,  24 },
    { 9,  24 },
    { 15, 24 },
    { 3,  16 },
    { 9,  16 },
    { 15, 16 },
    { 3,  9  },
    { 9,  9  },
    { 15, 9  },
};

static const AzaleaGymmickSpinarakRoute ov04_02257484[] = {
    { NELEMS(ov04_02257404), 4, ov04_02257404 },
    { NELEMS(ov04_02257404), 4, ov04_02257404 },
    { NELEMS(ov04_02257404), 4, ov04_02257404 },
    { NELEMS(ov04_02257404), 4, ov04_02257404 },
};

static const AzaleaGymmickSpinarakRoute ov04_02257464[] = {
    { NELEMS(ov04_02257584), 5, ov04_02257584 },
    { NELEMS(ov04_02257584), 5, ov04_02257584 },
    { NELEMS(ov04_02257584), 5, ov04_02257584 },
    { NELEMS(ov04_02257584), 5, ov04_02257584 },
};

static const AzaleaGymmickSpinarakRoute ov04_02257444[] = {
    { NELEMS(ov04_0225737C), 3, ov04_0225737C },
    { NELEMS(ov04_0225737C), 3, ov04_0225737C },
    { NELEMS(ov04_0225737C), 3, ov04_0225737C },
    { NELEMS(ov04_0225737C), 3, ov04_0225737C },
};

static const AzaleaGymmickSpinarakRoute ov04_02257424[] = {
    { NELEMS(ov04_0225737C), 2, ov04_0225737C },
    { NELEMS(ov04_0225737C), 2, ov04_0225737C },
    { NELEMS(ov04_0225737C), 2, ov04_0225737C },
    { NELEMS(ov04_0225737C), 2, ov04_0225737C },
};

static const AzaleaGymmickSpinarakRoute ov04_022574A4[] = {
    { NELEMS(ov04_02257404), 0, ov04_02257404 },
    { NELEMS(ov04_02257404), 0, ov04_02257404 },
    { NELEMS(ov04_02257404), 0, ov04_02257404 },
    { NELEMS(ov04_02257404), 0, ov04_02257404 },
};

static const AzaleaGymmickSpinarakRoute ov04_022574C4[] = {
    { NELEMS(ov04_02257584), 1, ov04_02257584 },
    { NELEMS(ov04_02257584), 1, ov04_02257584 },
    { NELEMS(ov04_02257584), 1, ov04_02257584 },
    { NELEMS(ov04_02257584), 1, ov04_02257584 },
};

static const AzaleaGymmickSpinarakRoute ov04_02257524[] = {
    { },
    { NELEMS(ov04_02257394), 9, ov04_02257394 },
    { },
    { NELEMS(ov04_0225736C), 10, ov04_0225736C },
};

static const AzaleaGymmickSpinarakRoute ov04_02257544[] = {
    { NELEMS(ov04_02257504), 9,  ov04_02257504 },
    { NELEMS(ov04_0225735C), 11, ov04_0225735C },
    { NELEMS(ov04_022573AC), 10, ov04_022573AC },
    { NELEMS(ov04_0225735C), 11, ov04_0225735C },
};

static const AzaleaGymmickSpinarakRoute ov04_022573C4[] = {
    { },
    { },
    { },
    { },
};

static const AzaleaGymmickSpinarakRoute ov04_022573E4[] = {
    { NELEMS(ov04_02257504), 7, ov04_02257504 },
    { NELEMS(ov04_02257394), 6, ov04_02257394 },
    { },
    { },
};

static const AzaleaGymmickSpinarakRoute ov04_022574E4[] = {
    { },
    { },
    { NELEMS(ov04_022573AC), 7, ov04_022573AC },
    { NELEMS(ov04_0225736C), 6, ov04_0225736C },
};

static const AzaleaGymmickSpinarakRoute ov04_02257564[] = {
    { },
    { NELEMS(ov04_0225735C), 7, ov04_0225735C },
    { },
    { NELEMS(ov04_0225735C), 7, ov04_0225735C },
};

const AzaleaGymmickSpinarakRoute *const ov04_022575A4[] = {
    ov04_02257484,
    ov04_02257464,
    ov04_02257444,
    ov04_02257424,
    ov04_022574A4,
    ov04_022574C4,
    ov04_02257524,
    ov04_02257544,
    ov04_022573C4,
    ov04_022573E4,
    ov04_022574E4,
    ov04_02257564,
};

const VecFx32 ov04_02257350 = {
    FX32_ONE, 0, 0
};

const VecFx32 ov04_02257344 = {
    8 * FX32_ONE, 0, 8 * FX32_ONE
};

void GymmickInit_Azalea(FieldSystem *fieldSystem) {
    GymmickUnion *gymmickUnion = Save_Gymmick_AssertMagic_GetData(Save_GetGymmickPtr(FieldSystem_GetSaveData(fieldSystem)), GYMMICK_AZALEA);
    fieldSystem->unk4->unk24 = Heap_Alloc(HEAP_ID_FIELD1, sizeof(AzaleaGymmickLocalData));
    MI_CpuFill8(fieldSystem->unk4->unk24, 0, sizeof(AzaleaGymmickLocalData));
    AzaleaGymmickLocalData *localData = fieldSystem->unk4->unk24;
    for (int i = 0; i < 4; ++i) {
        VecFx32 sp4 = { 0, 0, 0 };
        u8 spider = gymmickUnion->azalea.spiders[i];
        sp4.x = ov04_022575D4[spider][0] * 16 * FX32_ONE;
        sp4.x += FX32_CONST(8);
        sp4.z = ov04_022575D4[spider][1] * 16 * FX32_ONE;
        localData->unk_04[i] = ov01_021F3C0C(fieldSystem->unk9C, 118, &sp4, 0, fieldSystem->unk54);
    }
    switch (gymmickUnion->azalea.switches) {
    case 0:
        ov01_021E8970(115, 0, 1, Field3dObjectList_GetRenderObjectByID(fieldSystem->unkC0, 115), fieldSystem->unk54);
        ov01_021E8970(116, 0, 1, Field3dObjectList_GetRenderObjectByID(fieldSystem->unkC0, 116), fieldSystem->unk54);
        ov01_021E8970(122, 0, 1, Field3dObjectList_GetRenderObjectByID(fieldSystem->unkC0, 122), fieldSystem->unk54);
        ov01_021E8970(117, 0, 1, Field3dObjectList_GetRenderObjectByID(fieldSystem->unkC0, 117), fieldSystem->unk54);
        break;
    case 1:
        ov01_021E8970(115, 0, 1, Field3dObjectList_GetRenderObjectByID(fieldSystem->unkC0, 115), fieldSystem->unk54);
        ov01_021E8970(116, 1, 1, Field3dObjectList_GetRenderObjectByID(fieldSystem->unkC0, 116), fieldSystem->unk54);
        ov01_021E8970(122, 0, 1, Field3dObjectList_GetRenderObjectByID(fieldSystem->unkC0, 122), fieldSystem->unk54);
        ov01_021E8970(117, 1, 1, Field3dObjectList_GetRenderObjectByID(fieldSystem->unkC0, 117), fieldSystem->unk54);
        break;
    case 2:
        ov01_021E8970(115, 1, 1, Field3dObjectList_GetRenderObjectByID(fieldSystem->unkC0, 115), fieldSystem->unk54);
        ov01_021E8970(116, 0, 1, Field3dObjectList_GetRenderObjectByID(fieldSystem->unkC0, 116), fieldSystem->unk54);
        ov01_021E8970(122, 1, 1, Field3dObjectList_GetRenderObjectByID(fieldSystem->unkC0, 122), fieldSystem->unk54);
        ov01_021E8970(117, 0, 1, Field3dObjectList_GetRenderObjectByID(fieldSystem->unkC0, 117), fieldSystem->unk54);
        break;
    case 3:
        ov01_021E8970(115, 1, 1, Field3dObjectList_GetRenderObjectByID(fieldSystem->unkC0, 115), fieldSystem->unk54);
        ov01_021E8970(116, 1, 1, Field3dObjectList_GetRenderObjectByID(fieldSystem->unkC0, 116), fieldSystem->unk54);
        ov01_021E8970(122, 1, 1, Field3dObjectList_GetRenderObjectByID(fieldSystem->unkC0, 122), fieldSystem->unk54);
        ov01_021E8970(117, 1, 1, Field3dObjectList_GetRenderObjectByID(fieldSystem->unkC0, 117), fieldSystem->unk54);
        break;
    default:
        GF_ASSERT(FALSE);
    }
}

void FlipAzaleaGymSwitch(FieldSystem *fieldSystem, u8 switchNo) {
    GymmickUnion *gymmickUnion = Save_Gymmick_AssertMagic_GetData(Save_GetGymmickPtr(FieldSystem_GetSaveData(fieldSystem)), GYMMICK_AZALEA);
    UnkStruct_FieldSysC0_SubC *r7;
    UnkStruct_FieldSysC0_SubC *sp4;
    u8 r6;

    PlaySE(SEQ_SE_DP_KI_GASYAN);
    if (switchNo == 0) {
        r6 = (gymmickUnion->azalea.switches >> 0) & 1;
        gymmickUnion->azalea.switches ^= (1 << 0);
        r7 = Field3dObjectList_GetRenderObjectByID(fieldSystem->unkC0, 116);
        sp4 = Field3dObjectList_GetRenderObjectByID(fieldSystem->unkC0, 117);
        ov01_021E8A8C(fieldSystem->unk54, r7, 116, r6);
        ov01_021E8A8C(fieldSystem->unk54, sp4, 117, r6);
        u8 r0 = (gymmickUnion->azalea.switches >> 0) & 1;
        if (r0) {
            ov01_021E8970(116, 1, 1, r7, fieldSystem->unk54);
            ov01_021E8970(117, 1, 1, sp4, fieldSystem->unk54);
        } else {
            ov01_021E8970(116, 0, 1, r7, fieldSystem->unk54);
            ov01_021E8970(117, 0, 1, sp4, fieldSystem->unk54);
        }
    } else if (switchNo == 1) {
        r6 = (gymmickUnion->azalea.switches >> 1) & 1;
        gymmickUnion->azalea.switches ^= (1 << 1);
        r7 = Field3dObjectList_GetRenderObjectByID(fieldSystem->unkC0, 115);
        sp4 = Field3dObjectList_GetRenderObjectByID(fieldSystem->unkC0, 122);
        ov01_021E8A8C(fieldSystem->unk54, r7, 115, r6);
        ov01_021E8A8C(fieldSystem->unk54, sp4, 122, r6);
        u8 r0 = (gymmickUnion->azalea.switches >> 1) & 1;
        if (r0) {
            ov01_021E8970(115, 1, 1, r7, fieldSystem->unk54);
            ov01_021E8970(122, 1, 1, sp4, fieldSystem->unk54);
        } else {
            ov01_021E8970(115, 0, 1, r7, fieldSystem->unk54);
            ov01_021E8970(122, 0, 1, sp4, fieldSystem->unk54);
        }
    } else {
        GF_ASSERT(FALSE);
    }
    TaskManager_Call(fieldSystem->taskman, ov04_02254CA4, NULL);
}

void BeginAzaleaGymSpinarakRide(FieldSystem *fieldSystem, u8 spinarakNo) {
    AzaleaGymmickLocalData *localData = fieldSystem->unk4->unk24;
    AzaleaGymmickSpinarakRideData *rideData = Heap_AllocAtEnd(HEAP_ID_FIELD2, sizeof(AzaleaGymmickSpinarakRideData));
    rideData->state = 0;
    rideData->fieldSystem = fieldSystem;
    localData->unk_18 = spinarakNo;
    localData->unk_30 = 0;
    localData->unk_14 = 0;
    localData->unk_16 = 1;
    localData->unk_1C = 0;

    int spiderIdx;
    GymmickUnion *gymmickUnion = Save_Gymmick_AssertMagic_GetData(Save_GetGymmickPtr(FieldSystem_GetSaveData(fieldSystem)), GYMMICK_AZALEA);
    localData->unk_15 = gymmickUnion->azalea.switches;
    for (spiderIdx = 0; spiderIdx < 4; ++spiderIdx) {
        if (spinarakNo == gymmickUnion->azalea.spiders[spiderIdx]) {
            localData->unk_17 = spiderIdx;
            break;
        }
    }
    if (spiderIdx == 4) {
        GF_ASSERT(FALSE);
        return;
    }
    switch (spinarakNo) {
    case 3:
    case 4:
    case 5:
    case 9:
    case 10:
    case 11:
        localData->unk_19 = 1;
        localData->unk_1A = ov04_022575A4[spinarakNo][localData->unk_15].length - 1;
        localData->unk_1B = 1;
        break;
    default:
        localData->unk_19 = 0;
        localData->unk_1A = 0;
        localData->unk_1B = 0;
        break;
    }
    const u16 *ptr = ov04_022575A4[spinarakNo][localData->unk_15].route[localData->unk_1A];
    localData->unk_2C = ptr[0] * FX32_ONE * 16;
    localData->unk_34 = ptr[1] * FX32_ONE * 16;
    TaskManager_Call(fieldSystem->taskman, ov04_0225463C, rideData);
}

BOOL ov04_0225463C(TaskManager *taskman) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskman);
    AzaleaGymmickSpinarakRideData *rideData = TaskManager_GetEnvironment(taskman);

    switch (rideData->state) {
    case 0:
        TaskManager_Call(fieldSystem->taskman, ov01_02205A60, NULL);
        ++rideData->state;
        break;
    case 1:
        SysTask_CreateOnMainQueue(ov04_02254724, rideData, 0);
        ++rideData->state;
        break;
    case 10:
        Heap_Free(rideData);
        return TRUE;
    }

    return FALSE;
}

VecFx32 ov04_02254698(const u16 *a0, const u16 *a1) {
    VecFx32 ret;

    ret.x = (a1[0] - a0[0]) * FX32_ONE;
    ret.z = (a1[1] - a0[1]) * FX32_ONE;
    ret.y = 0;
    return ret;
}

void ov04_022546C8(const VecFx32 *a0, BOOL *a1) {
    if (a0->x >= 0) {
        a1[0] = TRUE;
    } else {
        a1[0] = FALSE;
    }
    if (a0->z >= 0) {
        a1[1] = TRUE;
    } else {
        a1[1] = FALSE;
    }
}

int ov04_022546E8(int a0, int a1, int a2, int a3) {
    int ret = 0;
    a3 <<= 16;
    a1 += a2;
    if (a3 == a1) {
        ret = 1;
    } else if (a0) {
        if (a1 > a3) {
            ret = 2;
        }
    } else {
        if (a1 < a3) {
            ret = 2;
        }
    }
    return ret;
}
