#include "unk_020648EC.h"

#include "global.h"

#include "gymmick.h"
#include "overlay_04.h"
#include "save_misc_data.h"
#include "scrcmd.h"
#include "script.h"

typedef void (*FieldSystemFunc1)(FieldSystem *);
typedef BOOL (*FieldSystemFunc2)(FieldSystem *, u32, u32, u32, u32);

static const FieldSystemFunc1 _020FE214[];
static const FieldSystemFunc1 _020FE1EC[];
static const FieldSystemFunc2 _020FE23C[];

void sub_020648EC(FieldSystem *fieldSystem) {
    GymmickType type = Save_Gymmick_GetType(Save_GetGymmickPtr(FieldSystem_GetSaveData(fieldSystem)));
    if (type != GYMMICK_NONE) {
        _020FE214[type](fieldSystem);
    }
}

void sub_02064910(FieldSystem *fieldSystem) {
    GymmickType type = Save_Gymmick_GetType(Save_GetGymmickPtr(FieldSystem_GetSaveData(fieldSystem)));
    if (type != GYMMICK_NONE) {
        FieldSystemFunc1 func = _020FE1EC[type];
        if (func != NULL) {
            func(fieldSystem);
        }
    }
}

BOOL sub_02064938(FieldSystem *fieldSystem, u32 a1, u32 a2, u32 a3, u32 a4) {
    GymmickType type = Save_Gymmick_GetType(Save_GetGymmickPtr(FieldSystem_GetSaveData(fieldSystem)));
    if (type == GYMMICK_NONE) {
        return FALSE;
    }

    FieldSystemFunc2 func = _020FE23C[type];
    if (func != NULL) {
        return func(fieldSystem, a1, a2, a3, a4);
    }
    return FALSE;
}

static const FieldSystemFunc1 _020FE214[] = {
    [GYMMICK_NONE] = NULL,
    [GYMMICK_ECRUTEAK] = GymmickInit_Ecruteak,
    [GYMMICK_CIANWOOD] = GymmickInit_Cianwood,
    [GYMMICK_VERMILION] = GymmickInit_Vermilion,
    [GYMMICK_VIOLET] = GymmickInit_Violet,
    [GYMMICK_AZALEA] = GymmickInit_Azalea,
    [GYMMICK_BLACKTHORN] = GymmickInit_Blackthorn,
    [GYMMICK_FUCHSIA] = GymmickInit_Fuchsia,
    [GYMMICK_VIRIDIAN] = GymmickInit_Viridian,
    [GYMMICK_SINJOH] = GymmickInit_Sinjoh,
};

static const FieldSystemFunc1 _020FE1EC[] = {
    [GYMMICK_NONE] = NULL,
    [GYMMICK_ECRUTEAK] = GymmickFree_Ecruteak,
    [GYMMICK_CIANWOOD] = GymmickFree_Cianwood,
    [GYMMICK_VERMILION] = GymmickFree_Vermilion,
    [GYMMICK_VIOLET] = NULL,
    [GYMMICK_AZALEA] = GymmickFree_Azalea,
    [GYMMICK_BLACKTHORN] = GymmickFree_Blackthorn,
    [GYMMICK_FUCHSIA] = GymmickFree_Fuchsia,
    [GYMMICK_VIRIDIAN] = GymmickFree_Viridian,
    [GYMMICK_SINJOH] = GymmickFree_Sinjoh,
};

static const FieldSystemFunc2 _020FE23C[] = {
    [GYMMICK_NONE] = NULL,
    [GYMMICK_ECRUTEAK] = NULL,
    [GYMMICK_CIANWOOD] = NULL,
    [GYMMICK_VERMILION] = NULL,
    [GYMMICK_VIOLET] = NULL,
    [GYMMICK_AZALEA] = NULL,
    [GYMMICK_BLACKTHORN] = GymmickCheckCollision_Blackthorn,
    [GYMMICK_FUCHSIA] = NULL,
    [GYMMICK_VIRIDIAN] = NULL,
    [GYMMICK_SINJOH] = NULL,
};
