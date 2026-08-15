#include "field_system.h"
#include "metatile_behavior.h"
#include "overlay_04.h"
#include "unk_02054648.h"

typedef struct BlackthornGymXZPoint {
    int x;
    int z;
} BlackthornGymXZPoint;

typedef struct BlackthornGymmickPlatformData {
    int unk_000;
    u8 unk_004;
    u8 unk_005;
    u8 unk_006;
    u8 unk_007;
    BlackthornGymXZPoint unk_008;
    BlackthornGymXZPoint unk_010;
    BlackthornGymXZPoint unk_018;
    BlackthornGymXZPoint unk_020;
    BlackthornGymXZPoint unk_028[8];
    BlackthornGymXZPoint unk_068[8];
    BlackthornGymXZPoint unk_0A8[5];
    BlackthornGymXZPoint unk_0D0[5];
    BlackthornGymXZPoint unk_0F8[24];
    BlackthornGymXZPoint unk_1B8[5];
    BlackthornGymXZPoint unk_1E0[18];
} BlackthornGymmickPlatformData; // size: 0x270

typedef struct BlackthornGymmickLocalData {
    FieldSystem *fieldSystem;
    BlackthornGymmickPlatformData platforms[3];
} BlackthornGymmickLocalData; // size: 0x754

void ov04_02255140(u8 i, u8 rot, u16 x, u16 z, BlackthornGymmickPlatformData *platform);
void ov04_02255480(const u8 rot, const u16 x, const u16 z, const BlackthornGymXZPoint *pointIn, BlackthornGymXZPoint *pointOut);
void ov04_022554C4(int dx, u8 height, BlackthornGymXZPoint *column);
void ov04_022554E0(int dz, u8 width, BlackthornGymXZPoint *row);
void ov04_022554FC(const u8 rot, const u16 x, const u16 z, BlackthornGymmickPlatformData *platform);
BOOL ov04_02255708(BlackthornGymmickLocalData *localData, u16 x, u16 z);

void GymmickInit_Blackthorn(FieldSystem *fieldSystem) {
    extern const int ov04_0225762C[3];
    int sp38[3];
    ARRAY_ASSIGN(sp38, ov04_0225762C);

    GymmickUnion *gymmickUnion = Save_Gymmick_AssertMagic_GetData(Save_GetGymmickPtr(FieldSystem_GetSaveData(fieldSystem)), GYMMICK_BLACKTHORN);
    fieldSystem->unk4->unk24 = Heap_Alloc(HEAP_ID_FIELD1, sizeof(BlackthornGymmickLocalData));
    MI_CpuClear8(fieldSystem->unk4->unk24, sizeof(BlackthornGymmickLocalData));
    BlackthornGymmickLocalData *localData = fieldSystem->unk4->unk24;
    localData->fieldSystem = fieldSystem;
    for (int i = 0; i < 3; ++i) {
        extern const VecFx32 ov04_02257620;
        VecFx32 sp2C = ov04_02257620;
        VecFx32 sp20 = { 0, 0, 0 };
        sp20.y = -4 * FX32_ONE * gymmickUnion->blackthorn.rot[i];
        sp2C.x = 16 * FX32_ONE * gymmickUnion->blackthorn.x[i] + 8 * FX32_ONE;
        sp2C.z = 16 * FX32_ONE * gymmickUnion->blackthorn.z[i] + 8 * FX32_ONE;
        localData->platforms[i].unk_007 = MapPropManager_LoadOne(fieldSystem->mapPropManager, sp38[i], &sp2C, &sp20, fieldSystem->mapPropAnimationManager);
        ov04_02255140(i, gymmickUnion->blackthorn.rot[i], gymmickUnion->blackthorn.x[i], gymmickUnion->blackthorn.z[i], &localData->platforms[i]);
    }
}

void GymmickFree_Blackthorn(FieldSystem *fieldSystem) {
    Heap_Free(fieldSystem->unk4->unk24);
    fieldSystem->unk4->unk24 = NULL;
}

BOOL ov04_02255090(FieldSystem *fieldSystem) {
    if (Save_Gymmick_GetType(Save_GetGymmickPtr(FieldSystem_GetSaveData(fieldSystem))) != GYMMICK_BLACKTHORN) {
        return FALSE;
    }
    BlackthornGymmickLocalData *localData = fieldSystem->unk4->unk24;
    if (localData == NULL) {
        return FALSE;
    }
    return ov04_02255708(localData, PlayerAvatar_GetXCoord(fieldSystem->playerAvatar), PlayerAvatar_GetZCoord(fieldSystem->playerAvatar));
}

BOOL GymmickCheckCollision_Blackthorn(FieldSystem *fieldSystem, u32 tileX, u32 tileZ, u32 height, BOOL *isColliding) {
    BlackthornGymmickLocalData *localData = fieldSystem->unk4->unk24;
    for (int i = 0; i < 3; ++i) {
        BlackthornGymmickPlatformData *platform = &localData->platforms[i];
        for (int j = 0; j < 18; ++j) {
            if (tileX == platform->unk_1E0[j].x && tileZ == platform->unk_1E0[j].z) {
                *isColliding = FALSE;
                return TRUE;
            }
        }
    }
    if (MetatileBehavior_IsMagma(GetMetatileBehavior(fieldSystem, tileX, tileZ))) {
        *isColliding = TRUE;
        return TRUE;
    }
    return FALSE;
}

// This function is weird. I promise, every oddity is required to match.
// Scratch: https://decomp.me/scratch/6ql5q
void ov04_02255140(u8 index, u8 rot, u16 x, u16 z, BlackthornGymmickPlatformData *platform) {
    BlackthornGymXZPoint sp1C;

    platform->unk_008.x = x;
    platform->unk_008.z = z;
    platform->unk_010.x = x + 1;
    platform->unk_010.z = z;
    platform->unk_018.x = x - 1;
    platform->unk_018.z = z;
    platform->unk_020.x = x;
    platform->unk_020.z = z;

    if (index != 1) {
        // Declaration here is required to match
        int i, j;
        platform->unk_000 = 0;
        platform->unk_004 = 5;
        platform->unk_005 = 7;
        sp1C.x = x;
        sp1C.z = z;
        sp1C.x += 3;
        sp1C.z -= 2;
        for (i = 0; i < 7; ++i) {
            platform->unk_028[i] = sp1C;
            platform->unk_028[i].z += i;
        }
        sp1C.x = x;
        sp1C.z = z;
        sp1C.x -= 3;
        sp1C.z -= 2;
        for (i = 0; i < 7; ++i) {
            platform->unk_068[i] = sp1C;
            platform->unk_068[i].z += i;
        }
        sp1C.x = x;
        sp1C.z = z;
        sp1C.x -= 2;
        sp1C.z += 5;
        for (i = 0; i < 5; ++i) {
            platform->unk_0A8[i] = sp1C;
            platform->unk_0A8[i].x += i;
        }
        sp1C.x = x;
        sp1C.z = z;
        sp1C.x -= 2;
        sp1C.z -= 3;
        for (i = 0; i < 5; ++i) {
            platform->unk_0D0[i] = sp1C;
            platform->unk_0D0[i].x += i;
        }
        for (i = 0; i < 2; ++i) {
            sp1C.x = x - 4;
            sp1C.z = z + 4;
            sp1C.x -= i;
            for (j = 0; j < 7; ++j) {
                platform->unk_0F8[i * 7 + j] = sp1C;
                platform->unk_0F8[i * 7 + j].z -= j;
            }
        }
        for (i = 0; i < platform->unk_004; ++i) {
            sp1C.x = x + 3;
            sp1C.z = z - 2;
            platform->unk_1B8[i] = sp1C;
            platform->unk_1B8[i].z += i;
        }
    } else {
        // Declaration here is required to match
        int i, j;
        platform->unk_000 = 1;
        platform->unk_004 = 4;
        platform->unk_005 = 8;
        sp1C.x = x;
        sp1C.z = z;
        sp1C.x += 2;
        sp1C.z -= 2;
        for (i = 0; i < 8; ++i) {
            platform->unk_028[i] = sp1C;
            platform->unk_028[i].z += i;
        }
        sp1C.x = x;
        sp1C.z = z;
        sp1C.x -= 3;
        sp1C.z -= 2;
        for (i = 0; i < 8; ++i) {
            platform->unk_068[i] = sp1C;
            platform->unk_068[i].z += i;
        }
        sp1C.x = x;
        sp1C.z = z;
        sp1C.x -= 2;
        sp1C.z += 6;
        for (i = 0; i < 4; ++i) {
            platform->unk_0A8[i] = sp1C;
            platform->unk_0A8[i].x += i;
        }
        sp1C.x = x;
        sp1C.z = z;
        sp1C.x -= 2;
        sp1C.z -= 3;
        for (i = 0; i < 4; ++i) {
            platform->unk_0D0[i] = sp1C;
            platform->unk_0D0[i].x += i;
        }
        for (i = 0; i < 3; ++i) {
            sp1C.x = x - 4;
            sp1C.z = z + 5;
            sp1C.x -= i;
            for (j = 0; j < 8; ++j) {
                platform->unk_0F8[i * 8 + j] = sp1C;
                platform->unk_0F8[i * 8 + j].z -= j;
            }
        }
        for (i = 0; i < platform->unk_004; ++i) {
            sp1C.x = x + 3;
            sp1C.z = z - 2;
            platform->unk_1B8[i] = sp1C;
            platform->unk_1B8[i].z += i;
        }
    }
    {
        // Declaration here is required to match
        int i, j;
        sp1C.x = x - 1;
        sp1C.z = z - 1;
        for (i = 0; i < 6; ++i) {
            for (j = 0; j < 3; ++j) {
                platform->unk_1E0[i * 3 + j].x = sp1C.x + j;
                platform->unk_1E0[i * 3 + j].z = sp1C.z + i;
            }
        }
    }
    platform->unk_006 = rot;
    ov04_022554FC(rot, x, z, platform);
}

void ov04_02255480(const u8 rot, const u16 x, const u16 z, const BlackthornGymXZPoint *pointIn, BlackthornGymXZPoint *pointOut) {
    int dx = pointIn->x - x;
    int dz = pointIn->z - z;

    switch (rot) {
    case 1:
        pointOut->x = -dz;
        pointOut->z = dx;
        break;
    case 2:
        pointOut->x = -dx;
        pointOut->z = -dz;
        break;
    case 3:
        pointOut->x = dz;
        pointOut->z = -dx;
        break;
    default:
        return;
    }
    pointOut->x += x;
    pointOut->z += z;
}

void ov04_022554C4(int dx, u8 height, BlackthornGymXZPoint *column) {
    for (int i = 0; i < height; ++i) {
        column[i].x += dx;
    }
}

void ov04_022554E0(int dz, u8 width, BlackthornGymXZPoint *row) {
    for (int i = 0; i < width; ++i) {
        row[i].z += dz;
    }
}

// the const is required to match
// i don't make the rules
void ov04_022554FC(const u8 rot, const u16 x, const u16 z, BlackthornGymmickPlatformData *platform) {
    int i;
    int sp44;
    u8 sp20;
    u8 sp24;

    if (platform->unk_000 == 0) {
        sp44 = 14;
        sp20 = 5;
        sp24 = 7;
    } else {
        sp44 = 24;
        sp20 = 4;
        sp24 = 8;
    }
    ov04_02255480(rot, x, z, &platform->unk_010, &platform->unk_010);
    ov04_02255480(rot, x, z, &platform->unk_018, &platform->unk_018);
    for (i = 0; i < sp24; ++i) {
        ov04_02255480(rot, x, z, &platform->unk_028[i], &platform->unk_028[i]);
    }
    for (i = 0; i < sp24; ++i) {
        ov04_02255480(rot, x, z, &platform->unk_068[i], &platform->unk_068[i]);
    }
    for (i = 0; i < sp20; ++i) {
        ov04_02255480(rot, x, z, &platform->unk_0A8[i], &platform->unk_0A8[i]);
    }
    for (i = 0; i < sp20; ++i) {
        ov04_02255480(rot, x, z, &platform->unk_0D0[i], &platform->unk_0D0[i]);
    }
    for (i = 0; i < sp44; ++i) {
        ov04_02255480(rot, x, z, &platform->unk_0F8[i], &platform->unk_0F8[i]);
    }
    for (i = 0; i < sp20; ++i) {
        ov04_02255480(rot, x, z, &platform->unk_1B8[i], &platform->unk_1B8[i]);
    }
    for (i = 0; i < 18; ++i) {
        ov04_02255480(rot, x, z, &platform->unk_1E0[i], &platform->unk_1E0[i]);
    }
}
