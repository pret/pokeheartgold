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
    int unk_000;
    u8 unk_004;
    u8 unk_005;
    u8 unk_006;
    u8 modelId;
    struct Vec2Fx32 unk_008[77];
}; // size=0x270

struct BlackthornGymWork {
    FieldSystem *fsys;
    struct BlackthornGymPlatform platforms[3];
}; // size=0x754

void ov04_02255140(u8 idx, u8 rot, u16 x, u16 z, struct BlackthornGymPlatform *platform);
void ov04_022554FC(u8 rot, u16 x, u16 z, struct BlackthornGymPlatform *platform);
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
            if (x == platform->unk_008[j + 59].x && z == platform->unk_008[j + 59].z) {
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

asm // Someone please tell me what the h*ck is going on here
void ov04_02255140(u8 idx, u8 rot, u16 x, u16 z, struct BlackthornGymPlatform *platform) {
 /*   int i, j;
    // sp0 = rot
    // sp4 = x
    // sp8 = z
    // sp38 = platform

    platform->unk_008[0].x = x;
    platform->unk_008[0].z = z;
    platform->unk_008[1].x = x + 1;
    platform->unk_008[1].z = z;
    platform->unk_008[2].x = x - 1;
    platform->unk_008[2].z = z;
    platform->unk_008[3].x = x;
    platform->unk_008[3].z = z;

    if (idx != 1) {
        platform->unk_000 = 0;
        platform->unk_004 = 5;
        platform->unk_005 = 7;
        for (i = 0; i < 7; i++) {
            platform->unk_008[4 + i].x = x + 3;
            platform->unk_008[4 + i].z = (z - 2) + i;
        }
        for (i = 0; i < 7; i++) {
            platform->unk_008[12 + i].x = x - 3;
            platform->unk_008[12 + i].z = (z - 2) + i;
        }
        for (i = 0; i < 5; i++) {
            platform->unk_008[20 + i].x = x - 2;
            platform->unk_008[20 + i].z = (z + 5) + i;
        }
        for (i = 0; i < 5; i++) {
            platform->unk_008[25 + i].x = x - 2;
            platform->unk_008[25 + i].z = (z - 3) + i;
        }
        for (i = 0; i < 3; i++) {
            for (j = 0; j < 7; j++) {
                platform->unk_008[30 + i * 7 + j].x = (x - 4 - i);
                platform->unk_008[30 + i * 7 + j].z = (z + 4) - j;
            }
        }
    }*/

    push {r4, r5, r6, r7, lr}
    sub sp, #0x24
    str r1, [sp]
    str r2, [sp, #4]
    str r3, [sp, #8]
    ldr r1, [sp, #0x38]
    ldr r2, [sp, #4]
    str r1, [sp, #0x38]
    str r2, [r1, #8]
    ldr r2, [sp, #8]
    str r2, [r1, #0xc]
    ldr r1, [sp, #4]
    add r2, r1, #1
    ldr r1, [sp, #0x38]
    str r2, [r1, #0x10]
    ldr r2, [sp, #8]
    str r2, [r1, #0x14]
    ldr r1, [sp, #4]
    sub r7, r1, #1
    ldr r1, [sp, #0x38]
    cmp r0, #1
    str r7, [r1, #0x18]
    ldr r2, [sp, #8]
    str r2, [r1, #0x1c]
    ldr r2, [sp, #4]
    str r2, [r1, #0x20]
    ldr r2, [sp, #8]
    str r2, [r1, #0x24]
    bne @_0225517C
    b @_022552D6
@_0225517C:
    mov r0, #0
    str r0, [r1]
    mov r2, #5
    strb r2, [r1, #4]
    mov r2, #7
    strb r2, [r1, #5]
    ldr r1, [sp, #4]
    ldr r4, [sp, #0x38]
    str r1, [sp, #0x1c]
    ldr r1, [sp, #8]
    str r1, [sp, #0x20]
    ldr r1, [sp, #4]
    add r3, r1, #3
    ldr r1, [sp, #8]
    str r3, [sp, #0x1c]
    sub r2, r1, #2
    str r2, [sp, #0x20]
@_0225519E:
    add r1, r2, r0
    str r3, [r4, #0x28]
    str r1, [r4, #0x2c]
    add r0, r0, #1
    add r4, #8
    cmp r0, #7
    blt @_0225519E
    ldr r0, [sp, #4]
    ldr r3, [sp, #0x38]
    str r0, [sp, #0x1c]
    ldr r0, [sp, #8]
    mov r4, #0
    str r0, [sp, #0x20]
    ldr r0, [sp, #4]
    sub r2, r0, #3
    ldr r0, [sp, #8]
    str r2, [sp, #0x1c]
    sub r1, r0, #2
    str r1, [sp, #0x20]
@_022551C4:
    add r0, r1, r4
    str r2, [r3, #0x68]
    str r0, [r3, #0x6c]
    add r4, r4, #1
    add r3, #8
    cmp r4, #7
    blt @_022551C4
    ldr r0, [sp, #4]
    ldr r2, [sp, #0x38]
    str r0, [sp, #0x1c]
    ldr r0, [sp, #8]
    mov r3, #0
    str r0, [sp, #0x20]
    ldr r0, [sp, #4]
    sub r1, r0, #2
    ldr r0, [sp, #8]
    str r1, [sp, #0x1c]
    add r0, r0, #5
    str r0, [sp, #0x20]
@_022551EA:
    add r4, r2, #0
    add r4, #0xa8
    str r1, [r4]
    add r4, r2, #0
    add r4, #0xac
    str r0, [r4]
    add r4, r2, #0
    add r4, #0xa8
    ldr r4, [r4, #0]
    add r5, r4, r3
    add r4, r2, #0
    add r4, #0xa8
    add r3, r3, #1
    add r2, #8
    str r5, [r4]
    cmp r3, #5
    blt @_022551EA
    ldr r0, [sp, #4]
    ldr r2, [sp, #0x38]
    str r0, [sp, #0x1c]
    ldr r0, [sp, #8]
    mov r3, #0
    str r0, [sp, #0x20]
    ldr r0, [sp, #4]
    sub r1, r0, #2
    ldr r0, [sp, #8]
    str r1, [sp, #0x1c]
    sub r0, r0, #3
    str r0, [sp, #0x20]
@_02255224:
    add r4, r2, #0
    add r4, #0xd0
    str r1, [r4]
    add r4, r2, #0
    add r4, #0xd4
    str r0, [r4]
    add r4, r2, #0
    add r4, #0xd0
    ldr r4, [r4, #0]
    add r5, r4, r3
    add r4, r2, #0
    add r4, #0xd0
    add r3, r3, #1
    add r2, #8
    str r5, [r4]
    cmp r3, #5
    blt @_02255224
    ldr r0, [sp, #4]
    mov r6, #0
    sub r0, r0, #4
    str r0, [sp, #0xc]
    ldr r0, [sp, #8]
    str r6, [sp, #0x10]
    add r4, r0, #4
@_02255254:
    ldr r0, [sp, #0xc]
    str r4, [sp, #0x20]
    str r0, [sp, #0x1c]
    sub r2, r0, r6
    ldr r0, [sp, #0x10]
    str r2, [sp, #0x1c]
    lsl r1, r0, #3
    ldr r0, [sp, #0x38]
    mov r3, #0
    add r5, r0, r1
@_02255268:
    add r0, r5, #0
    add r0, #0xf8
    str r2, [r0]
    add r0, r5, #0
    add r0, #0xfc
    str r4, [r0]
    add r0, r5, #0
    add r0, #0xfc
    ldr r0, [r0, #0]
    sub r1, r0, r3
    add r0, r5, #0
    add r0, #0xfc
    add r3, r3, #1
    add r5, #8
    str r1, [r0]
    cmp r3, #7
    blt @_02255268
    ldr r0, [sp, #0x10]
    add r6, r6, #1
    add r0, r0, #7
    str r0, [sp, #0x10]
    cmp r6, #2
    blt @_02255254
    ldr r0, [sp, #0x38]
    mov r4, #0
    ldrb r3, [r0, #4]
    cmp r3, #0
    ble @_022552D4
    ldr r0, [sp, #4]
    add r2, r0, #3
    ldr r0, [sp, #8]
    str r2, [sp, #0x1c]
    sub r1, r0, #2
    str r1, [sp, #0x20]
    cmp r3, #0
    ble @_022552D4
    mov r6, #0x6f
    lsl r6, r6, #2
    ldr r3, [sp, #0x38]
    add r0, r6, #0
@_022552B8:
    mov r5, #0x6e
    lsl r5, r5, #2
    str r2, [r3, r5]
    add r5, r5, #4
    str r1, [r3, r5]
    ldr r5, [r3, r6]
    add r5, r5, r4
    str r5, [r3, r0]
    ldr r5, [sp, #0x38]
    add r4, r4, #1
    ldrb r5, [r5, #4]
    add r3, #8
    cmp r4, r5
    blt @_022552B8
@_022552D4:
    b @_02255432
@_022552D6:
    ldr r0, [sp, #0x38]
    mov r1, #1
    str r1, [r0]
    mov r1, #4
    strb r1, [r0, #4]
    mov r1, #8
    strb r1, [r0, #5]
    ldr r0, [sp, #4]
    ldr r4, [sp, #0x38]
    str r0, [sp, #0x1c]
    ldr r0, [sp, #8]
    mov r3, #0
    str r0, [sp, #0x20]
    ldr r0, [sp, #4]
    add r2, r0, #2
    ldr r0, [sp, #8]
    str r2, [sp, #0x1c]
    sub r1, r0, #2
    str r1, [sp, #0x20]
@_022552FC:
    add r0, r1, r3
    str r2, [r4, #0x28]
    str r0, [r4, #0x2c]
    add r3, r3, #1
    add r4, #8
    cmp r3, #8
    blt @_022552FC
    ldr r0, [sp, #4]
    ldr r3, [sp, #0x38]
    str r0, [sp, #0x1c]
    ldr r0, [sp, #8]
    mov r4, #0
    str r0, [sp, #0x20]
    ldr r0, [sp, #4]
    sub r2, r0, #3
    ldr r0, [sp, #8]
    str r2, [sp, #0x1c]
    sub r1, r0, #2
    str r1, [sp, #0x20]
@_02255322:
    add r0, r1, r4
    str r2, [r3, #0x68]
    str r0, [r3, #0x6c]
    add r4, r4, #1
    add r3, #8
    cmp r4, #8
    blt @_02255322
    ldr r0, [sp, #4]
    ldr r2, [sp, #0x38]
    str r0, [sp, #0x1c]
    ldr r0, [sp, #8]
    mov r3, #0
    str r0, [sp, #0x20]
    ldr r0, [sp, #4]
    sub r1, r0, #2
    ldr r0, [sp, #8]
    str r1, [sp, #0x1c]
    add r0, r0, #6
    str r0, [sp, #0x20]
@_02255348:
    add r4, r2, #0
    add r4, #0xa8
    str r1, [r4]
    add r4, r2, #0
    add r4, #0xac
    str r0, [r4]
    add r4, r2, #0
    add r4, #0xa8
    ldr r4, [r4, #0]
    add r5, r4, r3
    add r4, r2, #0
    add r4, #0xa8
    add r3, r3, #1
    add r2, #8
    str r5, [r4]
    cmp r3, #4
    blt @_02255348
    ldr r0, [sp, #4]
    ldr r2, [sp, #0x38]
    str r0, [sp, #0x1c]
    ldr r0, [sp, #8]
    mov r3, #0
    str r0, [sp, #0x20]
    ldr r0, [sp, #4]
    sub r1, r0, #2
    ldr r0, [sp, #8]
    str r1, [sp, #0x1c]
    sub r0, r0, #3
    str r0, [sp, #0x20]
@_02255382:
    add r4, r2, #0
    add r4, #0xd0
    str r1, [r4]
    add r4, r2, #0
    add r4, #0xd4
    str r0, [r4]
    add r4, r2, #0
    add r4, #0xd0
    ldr r4, [r4, #0]
    add r5, r4, r3
    add r4, r2, #0
    add r4, #0xd0
    add r3, r3, #1
    add r2, #8
    str r5, [r4]
    cmp r3, #4
    blt @_02255382
    ldr r0, [sp, #4]
    mov r6, #0
    sub r0, r0, #4
    str r0, [sp, #0x14]
    ldr r0, [sp, #8]
    str r6, [sp, #0x18]
    add r4, r0, #5
@_022553B2:
    ldr r0, [sp, #0x14]
    str r4, [sp, #0x20]
    str r0, [sp, #0x1c]
    sub r2, r0, r6
    ldr r0, [sp, #0x18]
    str r2, [sp, #0x1c]
    lsl r1, r0, #3
    ldr r0, [sp, #0x38]
    mov r3, #0
    add r5, r0, r1
@_022553C6:
    add r0, r5, #0
    add r0, #0xf8
    str r2, [r0]
    add r0, r5, #0
    add r0, #0xfc
    str r4, [r0]
    add r0, r5, #0
    add r0, #0xfc
    ldr r0, [r0, #0]
    sub r1, r0, r3
    add r0, r5, #0
    add r0, #0xfc
    add r3, r3, #1
    add r5, #8
    str r1, [r0]
    cmp r3, #8
    blt @_022553C6
    ldr r0, [sp, #0x18]
    add r6, r6, #1
    add r0, #8
    str r0, [sp, #0x18]
    cmp r6, #3
    blt @_022553B2
    ldr r0, [sp, #0x38]
    mov r4, #0
    ldrb r3, [r0, #4]
    cmp r3, #0
    ble @_02255432
    ldr r0, [sp, #4]
    add r2, r0, #3
    ldr r0, [sp, #8]
    str r2, [sp, #0x1c]
    sub r1, r0, #2
    str r1, [sp, #0x20]
    cmp r3, #0
    ble @_02255432
    mov r6, #0x6f
    lsl r6, r6, #2
    ldr r3, [sp, #0x38]
    add r0, r6, #0
@_02255416:
    mov r5, #0x6e
    lsl r5, r5, #2
    str r2, [r3, r5]
    add r5, r5, #4
    str r1, [r3, r5]
    ldr r5, [r3, r6]
    add r5, r5, r4
    str r5, [r3, r0]
    ldr r5, [sp, #0x38]
    add r4, r4, #1
    ldrb r5, [r5, #4]
    add r3, #8
    cmp r4, r5
    blt @_02255416
@_02255432:
    ldr r0, [sp, #8]
    mov r6, #0x1e
    sub r2, r0, #1
    mov r1, #0
    lsl r6, r6, #4
    str r7, [sp, #0x1c]
    str r2, [sp, #0x20]
    mov ip, r1
    add r4, r6, #4
@_02255444:
    ldr r3, [sp, #0x38]
    lsl r5, r1, #3
    mov r0, #0
    add r5, r3, r5
@_0225544C:
    add r3, r7, r0
    str r3, [r5, r6]
    str r2, [r5, r4]
    add r0, r0, #1
    add r5, #8
    cmp r0, #3
    blt @_0225544C
    mov r0, ip
    add r0, r0, #1
    add r1, r1, #3
    add r2, r2, #1
    mov ip, r0
    cmp r0, #6
    blt @_02255444
    ldr r1, [sp, #0]
    ldr r0, [sp, #0x38]
    ldr r3, [sp, #0x38]
    strb r1, [r0, #6]
    ldr r0, [sp, #0]
    ldr r1, [sp, #4]
    ldr r2, [sp, #8]
    bl ov04_022554FC
    add sp, #0x24
    pop {r4, r5, r6, r7, pc}
}

void ov04_02255480(u8 rot, u16 x, u16 z, struct Vec2Fx32 *src, struct Vec2Fx32 *dest) {
    int xx = src->x - x;
    int zz = src->z - z;
    switch (rot) {
    default:
        return;
    case 1:
        dest->x = -zz;
        dest->z = xx;
        break;
    case 2:
        dest->x = -xx;
        dest->z = -zz;
        break;
    case 3:
        dest->x = zz;
        dest->z = -xx;
        break;
    }
    dest->x += x;
    dest->z += z;
}

void ov04_022554C4(int dx, int n, struct Vec2Fx32 *vec) {
    int i;
    for (i = 0; i < n; i++) {
        vec[i].x += dx;
    }
}

void ov04_022554E0(int dz, int n, struct Vec2Fx32 *vec) {
    int i;
    for (i = 0; i < n; i++) {
        vec[i].z += dz;
    }
}
