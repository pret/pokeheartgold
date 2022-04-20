#include "overlay_01.h"
#include "unk_0203DE74.h"
#include "unk_02005D10.h"
#include "task.h"
#include "constants/sndseq.h"

struct AzaleaGymWork {
    u8 filler_00[4];
    int modelIds[4];
    u8 unk_14;
    u8 unk_15;
    u8 unk_16;
    u8 unk_17;
    u8 spinarakNo;
    int unk1C;
    u8 filler_20[0x10];
    int unk_30;
    u8 filler_34[0x20];
};

struct SpinarakRideWork {
    int state;
    FieldSystem *fsys;
};

BOOL ov04_02254CA4(TaskManager *taskManager);

extern const u16 ov04_022575D4[][2];

static inline u8 getSwitchState(union GymmickUnion *gymmickUnion, int color) {
    return (gymmickUnion->azalea.switches >> color) & 1;
}

void ov04_02254190(FieldSystem *fsys) {
    struct AzaleaGymWork *work;
    union GymmickUnion *gymmickUnion = SavGymmick_AssertMagic_GetData(Sav2_GetGymmickPtr(Fsys_GetSaveDataPtr(fsys)), GYMMICK_AZALEA);
    int i;

    fsys->unk4->unk_24 = AllocFromHeap(4, sizeof(struct AzaleaGymWork));
    MI_CpuClear8(fsys->unk4->unk_24, sizeof(struct AzaleaGymWork));
    work = fsys->unk4->unk_24;
    for (i = 0; i < 4; i++) {
        VecFx32 sp4 = {0, 0, 0};
        u16 x = ov04_022575D4[gymmickUnion->azalea.spiders[i]][0];
        u16 z = ov04_022575D4[gymmickUnion->azalea.spiders[i]][1];

        sp4.x = x * 16 * FX32_ONE;
        sp4.x += 8 * FX32_ONE;
        sp4.z = z * 16 * FX32_ONE;
        work->modelIds[i] = AddBgModelFromTemplate(fsys->bgModels, 118, &sp4, NULL, fsys->_3dAnimationMgr);
    }
    switch (gymmickUnion->azalea.switches) {
    case 0:
        ov01_021E8970(
            115,
            0,
            TRUE,
            ov01_022040D0(
                fsys->unkC0,
                115
            ),
            fsys->_3dAnimationMgr
        );
        ov01_021E8970(
            116,
            0,
            TRUE,
            ov01_022040D0(
                fsys->unkC0,
                116
            ),
            fsys->_3dAnimationMgr
        );
        ov01_021E8970(
            122,
            0,
            TRUE,
            ov01_022040D0(
                fsys->unkC0,
                122
            ),
            fsys->_3dAnimationMgr
        );
        ov01_021E8970(
            117,
            0,
            TRUE,
            ov01_022040D0(
                fsys->unkC0,
                117
            ),
            fsys->_3dAnimationMgr
        );
        break;
    case 1:
        ov01_021E8970(
            115,
            0,
            TRUE,
            ov01_022040D0(
                fsys->unkC0,
                115
            ),
            fsys->_3dAnimationMgr
        );
        ov01_021E8970(
            116,
            1,
            TRUE,
            ov01_022040D0(
                fsys->unkC0,
                116
            ),
            fsys->_3dAnimationMgr
        );
        ov01_021E8970(
            122,
            0,
            TRUE,
            ov01_022040D0(
                fsys->unkC0,
                122
            ),
            fsys->_3dAnimationMgr
        );
        ov01_021E8970(
            117,
            1,
            TRUE,
            ov01_022040D0(
                fsys->unkC0,
                117
            ),
            fsys->_3dAnimationMgr
        );
        break;
    case 2:
        ov01_021E8970(
            115,
            1,
            TRUE,
            ov01_022040D0(
                fsys->unkC0,
                115
            ),
            fsys->_3dAnimationMgr
        );
        ov01_021E8970(
            116,
            0,
            TRUE,
            ov01_022040D0(
                fsys->unkC0,
                116
            ),
            fsys->_3dAnimationMgr
        );
        ov01_021E8970(
            122,
            1,
            TRUE,
            ov01_022040D0(
                fsys->unkC0,
                122
            ),
            fsys->_3dAnimationMgr
        );
        ov01_021E8970(
            117,
            0,
            TRUE,
            ov01_022040D0(
                fsys->unkC0,
                117
            ),
            fsys->_3dAnimationMgr
        );
        break;
    case 3:
        ov01_021E8970(
            115,
            1,
            TRUE,
            ov01_022040D0(
                fsys->unkC0,
                115
            ),
            fsys->_3dAnimationMgr
        );
        ov01_021E8970(
            116,
            1,
            TRUE,
            ov01_022040D0(
                fsys->unkC0,
                116
            ),
            fsys->_3dAnimationMgr
        );
        ov01_021E8970(
            122,
            1,
            TRUE,
            ov01_022040D0(
                fsys->unkC0,
                122
            ),
            fsys->_3dAnimationMgr
        );
        ov01_021E8970(
            117,
            1,
            TRUE,
            ov01_022040D0(
                fsys->unkC0,
                117
            ),
            fsys->_3dAnimationMgr
        );
        break;
    default:
        GF_ASSERT(0);
        break;
    }
}

void Fsys_FlipAzaleaGymSwitch(FieldSystem *fsys, u8 switchNo) {
    union GymmickUnion *gymmickUnion = SavGymmick_AssertMagic_GetData(Sav2_GetGymmickPtr(Fsys_GetSaveDataPtr(fsys)), GYMMICK_AZALEA);
    u8 switchState;
    struct UnkStruct_ov01_02004004_sub *obj1, *obj2;

    PlaySE(SEQ_SE_DP_KI_GASYAN);

    if (switchNo == 0) {
        switchState = getSwitchState(gymmickUnion, 0);
        gymmickUnion->azalea.switches ^= 1;
        obj1 = ov01_022040D0(fsys->unkC0, 116);
        obj2 = ov01_022040D0(fsys->unkC0, 117);
        ov01_021E8A8C(fsys->_3dAnimationMgr, obj1, 116, switchState);
        ov01_021E8A8C(fsys->_3dAnimationMgr, obj2, 117, switchState);
        if (getSwitchState(gymmickUnion, 0)) {
            ov01_021E8970(116, 1, TRUE, obj1, fsys->_3dAnimationMgr);
            ov01_021E8970(117, 1, TRUE, obj2, fsys->_3dAnimationMgr);
        } else {
            ov01_021E8970(116, 0, TRUE, obj1, fsys->_3dAnimationMgr);
            ov01_021E8970(117, 0, TRUE, obj2, fsys->_3dAnimationMgr);
        }
    } else if (switchNo == 1) {
        switchState = getSwitchState(gymmickUnion, 1);
        gymmickUnion->azalea.switches ^= 2;
        obj1 = ov01_022040D0(fsys->unkC0, 115);
        obj2 = ov01_022040D0(fsys->unkC0, 122);
        ov01_021E8A8C(fsys->_3dAnimationMgr, obj1, 115, switchState);
        ov01_021E8A8C(fsys->_3dAnimationMgr, obj2, 122, switchState);
        if (getSwitchState(gymmickUnion, 1)) {
            ov01_021E8970(115, 1, TRUE, obj1, fsys->_3dAnimationMgr);
            ov01_021E8970(122, 1, TRUE, obj2, fsys->_3dAnimationMgr);
        } else {
            ov01_021E8970(115, 0, TRUE, obj1, fsys->_3dAnimationMgr);
            ov01_021E8970(122, 0, TRUE, obj2, fsys->_3dAnimationMgr);
        }
    } else {
        GF_ASSERT(0);
    }
    TaskManager_Call(fsys->taskman, ov04_02254CA4, NULL);
}
