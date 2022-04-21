#include "gymmick_overlay.h"
#include "unk_0203DE74.h"
#include "overlay_01.h"

struct BlackthornGymPlatform {
    u8 filler_000[0x7];
    u8 modelId;
    u8 filler_008[0x268];
}; // size=0x270

struct BlackthornGymWork {
    FieldSystem *fsys;
    struct BlackthornGymPlatform platforms[3];
}; // size=0x754

void ov04_02255140(u8 idx, u8 rot, u16 x, u16 z, struct BlackthornGymPlatform *platform);

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
