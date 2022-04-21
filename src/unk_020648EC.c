#include "gymmick.h"
#include "gymmick_overlay.h"
#include "save_misc_data.h"
#include "unk_0203DE74.h"
#include "script.h"

typedef void (*FieldSystemFunc1)(FieldSystem*);
typedef BOOL (*FieldSystemFunc2)(FieldSystem*, u32, u32, u32, u32);

static const FieldSystemFunc1 sConstructors[];
static const FieldSystemFunc1 sDestructors[];
static const FieldSystemFunc2 _020FE23C[];

void InitGymmickFieldResources(FieldSystem* fsys) {
    int gymmickType = SavGymmick_GetType(Sav2_GetGymmickPtr(Fsys_GetSaveDataPtr(fsys)));
    if (gymmickType != GYMMICK_NONE) {
        sConstructors[gymmickType](fsys);
    }
}

void DeleteGymmickFieldResources(FieldSystem* fsys) {
    int gymmickType = SavGymmick_GetType(Sav2_GetGymmickPtr(Fsys_GetSaveDataPtr(fsys)));
    if (gymmickType != GYMMICK_NONE) {
        FieldSystemFunc1 func = sDestructors[gymmickType];
        if (func != NULL) {
            func(fsys);
        }
    }
}

BOOL sub_02064938(FieldSystem *fsys, u32 a1, u32 a2, u32 a3, u32 a4) {
    int gymmickType = SavGymmick_GetType(Sav2_GetGymmickPtr(Fsys_GetSaveDataPtr(fsys)));
    if (gymmickType == GYMMICK_NONE) return FALSE;

    FieldSystemFunc2 func = _020FE23C[gymmickType];
    if (func != NULL) {
        return func(fsys, a1, a2, a3, a4);
    }
    return FALSE;
}

static const FieldSystemFunc1 sConstructors[] = {
    [GYMMICK_NONE]       = NULL,
    [GYMMICK_ECRUTEAK]   = InitEcruteakGymPuzzleGimmick,
    [GYMMICK_CIANWOOD]   = ov04_02255FC0,
    [GYMMICK_VERMILION]  = ov04_02256304,
    [GYMMICK_VIOLET]     = InitVioletGymElevatorGimmick,
    [GYMMICK_AZALEA]     = InitAzaleaGymPuzzleGimmick,
    [GYMMICK_BLACKTHORN] = ov04_02254F8C,
    [GYMMICK_FUCHSIA]    = ov04_02256650,
    [GYMMICK_VIRIDIAN]   = ov04_02256B64,
    [GYMMICK_SINJOH]     = ov04_02256E60,
};

static const FieldSystemFunc1 sDestructors[] = {
    [GYMMICK_NONE]       = NULL,
    [GYMMICK_ECRUTEAK]   = DeleteEcruteakGymPuzzleGimmick,
    [GYMMICK_CIANWOOD]   = ov04_02256044,
    [GYMMICK_VERMILION]  = ov04_022563B0,
    [GYMMICK_VIOLET]     = NULL,
    [GYMMICK_AZALEA]     = DeleteAzaleaGymPuzzleGimmick,
    [GYMMICK_BLACKTHORN] = ov04_0225507C,
    [GYMMICK_FUCHSIA]    = ov04_022566A0,
    [GYMMICK_VIRIDIAN]   = ov04_02256BA0,
    [GYMMICK_SINJOH]     = ov04_02256EB0,
};

static const FieldSystemFunc2 _020FE23C[] = {
    [GYMMICK_NONE]       = NULL,
    [GYMMICK_ECRUTEAK]   = NULL,
    [GYMMICK_CIANWOOD]   = NULL,
    [GYMMICK_VERMILION]  = NULL,
    [GYMMICK_VIOLET]     = NULL,
    [GYMMICK_AZALEA]     = NULL,
    [GYMMICK_BLACKTHORN] = ov04_022550D4,
    [GYMMICK_FUCHSIA]    = NULL,
    [GYMMICK_VIRIDIAN]   = NULL,
    [GYMMICK_SINJOH]     = NULL,
};
