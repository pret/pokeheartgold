#include "field/overlay_01_02204004.h"

#include "field_system.h"
#include "overlay_01.h"
#include "overlay_01_021F3610.h"
#include "overlay_01_022053EC.h"
#include "overlay_04.h"
#include "task.h"
#include "unk_02005D10.h"

typedef struct AzaleaGymmickLocalData {
    u8 filler_00[4];
    void *unk_04[4];
    u8 filler_14[0x40];
} AzaleaGymmickLocalData; // size: 0x54

int ov04_02254CA4(TaskManager *taskman);

// static const u16 ov04_022575D4[][2] = {
//     { 3,  31 },
//     { 9,  31 },
//     { 15, 31 },
//     { 3,  24 },
//     { 9,  24 },
//     { 15, 24 },
//     { 3,  16 },
//     { 9,  16 },
//     { 15, 16 },
//     { 3,  9  },
//     { 9,  9  },
//     { 15, 9  },
// };
extern const u16 ov04_022575D4[][2];

void GymmickInit_Azalea(FieldSystem *fieldSystem) {
    GymmickUnion *gymmickUnion = Save_Gymmick_AssertMagic_GetData(Save_GetGymmickPtr(FieldSystem_GetSaveData(fieldSystem)), GYMMICK_AZALEA);
    fieldSystem->unk4->legendCutsceneCamera = Heap_Alloc(HEAP_ID_FIELD1, sizeof(AzaleaGymmickLocalData));
    MI_CpuFill8(fieldSystem->unk4->legendCutsceneCamera, 0, sizeof(AzaleaGymmickLocalData));
    AzaleaGymmickLocalData *localData = fieldSystem->unk4->legendCutsceneCamera;
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
