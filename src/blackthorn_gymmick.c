#include "gymmick_overlay.h"
#include "unk_0203DE74.h"
#include "unk_02054648.h"
#include "unk_0205B6E8.h"
#include "overlay_01.h"

struct Vec2Fx32 {
    fx32 x;
    fx32 z;
};

struct BlackthornGymPlatform {
    u8 filler_000[0x7];
    u8 modelId;
    u8 filler_008[0x1D8];
    struct Vec2Fx32 unk_1E0[18];
}; // size=0x270

struct BlackthornGymWork {
    FieldSystem *fsys;
    struct BlackthornGymPlatform platforms[3];
}; // size=0x754

void ov04_02255140(u8 idx, u8 rot, u16 x, u16 z, struct BlackthornGymPlatform *platform);
BOOL ov04_02255708(struct BlackthornGymWork *gymWork, u16 x, u16 z);

/*
const VecFx32 ov04_02257620 = {
    0, 48 * FX32_ONE, 0,
};

const int ov04_0225762C[] = {
    120,
    121,
    120,
};
*/

const u8 ov04_02257614[] = {
    0x40, 0x14, 0x1E, 0x2E,
};

const u8 ov04_02257618[] = {
    0x40, 0x40, 0x40, 0x40, 0x2A,
};

const u8 ov04_02257638[] = {
    0x0A, 0x0A, 0x0D, 0x12, 0x19, 0x26, 0x33, 0x40,
    0x40, 0x17, 0x1C, 0x23, 0x2D, 0x37
};

const u8 ov04_02257648[] = {
    0x08, 0x09, 0x0A, 0x0E, 0x13, 0x1A, 0x25, 0x33,
    0x40, 0x11, 0x13, 0x17, 0x1C, 0x23, 0x2E, 0x37, 0x40, 0x40, 0x40, 0x1E, 0x23, 0x29, 0x31, 0x39
};

void InitBlackthornGymPuzzleGimmick(FieldSystem *fsys) {
    const int sp38[] = {120, 121, 120};
    union GymmickUnion *gymmickUnion = SavGymmick_AssertMagic_GetData(Sav2_GetGymmickPtr(Fsys_GetSaveDataPtr(fsys)), GYMMICK_BLACKTHORN);
    struct BlackthornGymWork *gymWork = OverlayGymmick_AllocWork(fsys, sizeof(struct BlackthornGymWork));
    int i;

    gymWork->fsys = fsys;
    for (i = 0; i < 3; i++) {
        VecFx32 sp2C = {0, 48 * FX32_ONE, 0};
        VecFx32 sp20 = {0, -(gymmickUnion->blackthorn.rot[i] * 4 * FX32_ONE), 0};
        sp2C.x = gymmickUnion->blackthorn.x[i] * 16 * FX32_ONE + 8 * FX32_ONE;
        sp2C.z = gymmickUnion->blackthorn.z[i] * 16 * FX32_ONE + 8 * FX32_ONE;
        gymWork->platforms[i].modelId = AddBgModelFromTemplate(fsys->bgModels, sp38[i], &sp2C, &sp20, fsys->_3dAnimationMgr);
        ov04_02255140(i, gymmickUnion->blackthorn.rot[i], gymmickUnion->blackthorn.x[i], gymmickUnion->blackthorn.z[i], &gymWork->platforms[i]);
    }
}

void DeleteBlackthornPuzzleGimmick(FieldSystem *fsys) {
    FreeToHeap(fsys->unk4->unk_24);
    fsys->unk4->unk_24 = NULL;
}

BOOL ov04_02255090(FieldSystem *fsys) {
    struct BlackthornGymWork *gymWork;
    if (SavGymmick_GetType(Sav2_GetGymmickPtr(Fsys_GetSaveDataPtr(fsys))) != GYMMICK_BLACKTHORN) {
        return FALSE;
    }
    gymWork = fsys->unk4->unk_24;
    if (gymWork == NULL) {
        return FALSE;
    }
    return ov04_02255708(gymWork, GetPlayerXCoord(fsys->playerAvatar), GetPlayerYCoord(fsys->playerAvatar));
}

BOOL ov04_022550D4(FieldSystem* fsys, fx32 x, fx32 z, u32 a3, BOOL *p_ret) {
    struct BlackthornGymWork *gymWork = fsys->unk4->unk_24;
    int i, j;

    for (i = 0; i < 3; i++) {
        struct BlackthornGymPlatform *platform = &gymWork->platforms[i];
        for (j = 0; j < 18; j++) {
            if (x == platform->unk_1E0[j].x && z == platform->unk_1E0[j].z) {
                *p_ret = FALSE;
                return TRUE;
            }
        }
    }
    if (sub_0205BAC4(GetMetatileBehaviorAt(fsys, x, z))) {
        *p_ret = TRUE;
        return TRUE;
    }
    return FALSE;
}
