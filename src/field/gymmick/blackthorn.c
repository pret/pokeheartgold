#include "field_system.h"
#include "metatile_behavior.h"
#include "overlay_04.h"
#include "unk_02054648.h"

typedef struct BlackthornGymmickPlatformData {
    u8 filler_000[0x7];
    u8 unk_007;
    u8 filler_008[0x1D8];
    u32 unk_1E0[18][2];
} BlackthornGymmickPlatformData; // size: 0x270

typedef struct BlackthornGymmickLocalData {
    FieldSystem *fieldSystem;
    BlackthornGymmickPlatformData platforms[3];
} BlackthornGymmickLocalData; // size: 0x754

void ov04_02255140(u8 i, u8 rot, u16 x, u16 z, BlackthornGymmickPlatformData *platform);
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
            if (tileX == platform->unk_1E0[j][0] && tileZ == platform->unk_1E0[j][1]) {
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
