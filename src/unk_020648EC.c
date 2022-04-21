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
    [GYMMICK_CIANWOOD]   = InitCianwoodPuzzleGimmick,
    [GYMMICK_VERMILION]  = InitVermilionPuzzleGimmick,
    [GYMMICK_VIOLET]     = InitVioletGymElevatorGimmick,
    [GYMMICK_AZALEA]     = InitAzaleaGymPuzzleGimmick,
    [GYMMICK_BLACKTHORN] = InitBlackthornGymPuzzleGimmick,
    [GYMMICK_FUCHSIA]    = InitFuchsiaGymPuzzleGimmick,
    [GYMMICK_VIRIDIAN]   = InitViridianGymPuzzleGimmick,
    [GYMMICK_SINJOH]     = InitSinjohPuzzleGimmick,
};

static const FieldSystemFunc1 sDestructors[] = {
    [GYMMICK_NONE]       = NULL,
    [GYMMICK_ECRUTEAK]   = DeleteEcruteakGymPuzzleGimmick,
    [GYMMICK_CIANWOOD]   = DeleteCianwoodPuzzleGimmick,
    [GYMMICK_VERMILION]  = DeleteVermilionPuzzleGimmick,
    [GYMMICK_VIOLET]     = NULL,
    [GYMMICK_AZALEA]     = DeleteAzaleaGymPuzzleGimmick,
    [GYMMICK_BLACKTHORN] = DeleteBlackthornPuzzleGimmick,
    [GYMMICK_FUCHSIA]    = DeleteFuchsiaPuzzleGimmick,
    [GYMMICK_VIRIDIAN]   = DeleteViridianPuzzleGimmick,
    [GYMMICK_SINJOH]     = DeleteSinjohPuzzleGimmick,
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
